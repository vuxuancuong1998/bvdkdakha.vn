/* Run with Node.js and sharp installed (or NODE_PATH pointing to bundled modules).
 * Originals are read-only. Content hashes make generated WebP URLs cache-safe.
 */
const fs = require('node:fs');
const path = require('node:path');
const crypto = require('node:crypto');
const sharp = require('sharp');
const root = path.resolve(__dirname, '..');
const output = 'template/frontend/assets/images/optimized';
const manifest = {};
const report = [];
const dirs = ['uploads/slider', 'uploads/doctors', 'uploads/news', 'uploads/events', 'uploads/images', 'uploads/services', 'uploads/activities', 'uploads/medical-campaigns', 'template/frontend/assets/images'];
function scan(dir) {
  return fs.readdirSync(path.join(root, dir), { withFileTypes: true }).flatMap(entry => {
    const relative = dir + '/' + entry.name;
    if (relative === output) return [];
    return entry.isDirectory() ? scan(relative) : /\.(png|jpe?g|webp)$/i.test(entry.name) ? [relative] : [];
  });
}
(async () => {
  fs.mkdirSync(path.join(root, output), { recursive: true });
  const files = dirs.filter(dir => fs.existsSync(path.join(root, dir))).flatMap(scan).sort();
  for (const file of files) {
    try {
      const input = path.join(root, file);
      const source = fs.readFileSync(input);
      const stat = fs.statSync(input);
      const metadata = await sharp(source).metadata();
      if (!metadata.width || !metadata.height || metadata.pages > 1) continue;
      const swap = metadata.orientation >= 5;
      const width = swap ? metadata.height : metadata.width;
      const height = swap ? metadata.width : metadata.height;
      const hash = crypto.createHash('sha256').update(source).digest('hex').slice(0, 16);
      const widths = [...new Set([...(file.endsWith('/logo.png') ? [96, 192] : []), 400, 800, 1200, ...(file.includes('/slider/') ? [1920] : []), Math.min(width, file.includes('/slider/') ? 1920 : 1200)])].filter(w => w <= width).sort((a, b) => a - b);
      const variants = [];
      if (source.length >= 24000) for (const size of widths) {
        const target = `${output}/${hash}-${size}.webp`;
        if (!fs.existsSync(path.join(root, target))) await sharp(source).rotate().resize({ width: size, withoutEnlargement: true }).webp({ quality: 82, effort: 4 }).toFile(path.join(root, target));
        const bytes = fs.statSync(path.join(root, target)).size;
        if (bytes < source.length) variants.push({ width: size, path: target, bytes });
      }
      manifest[file] = { width, height, bytes: source.length, mtime: Math.floor(stat.mtimeMs / 1000), variants };
      if (variants.length) report.push({ source: file, originalBytes: source.length, variants });
    } catch (error) { console.warn(file, error.message); }
  }
  fs.writeFileSync(path.join(root, output, 'manifest.json'), JSON.stringify(manifest, null, 2));
  fs.writeFileSync(path.join(root, 'tools/ui-image-report.json'), JSON.stringify(report, null, 2));
  console.log(JSON.stringify({ inspected: files.length, optimized: report.length, originalsBytes: report.reduce((s,r)=>s+r.originalBytes,0), largestVariantsBytes: report.reduce((s,r)=>s+r.variants.at(-1).bytes,0), banners: report.filter(r=>r.source.startsWith('uploads/slider/')) }, null, 2));
})();
