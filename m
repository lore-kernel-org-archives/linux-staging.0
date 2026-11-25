Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795604913;
	b=sf29gmkc/CJdSsUmK1mnYn/oWMOQNR8iW5ZOBvtE/TPBBGkzO4reGfifDK+QNV80b5YV
	 hm4SeLnEZEhKhNQZbtZC55SWvseF5BB1kCxIX0mMFYLXwgpdJjIVgQagQtOerUm1X4Wuf
	 Fl80r8ytFz7SMHHFJuDfn/MUPlXNO63lxyw0PrsXpVe6gOSxQubpvP435XnFq4jiT54Re
	 XuhlcizPV4M8be9g8Zb4lEO8qfEaS4iJjshiN1np/pBsz52vYiMD8CljSJVgNlLoawRsY
	 EX431JcivveRhJSL/xCXsIOEWDfK5n47giNr681TonEcqJtsP2Z5m0klqRDvm16+T8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795604913;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=CFqYsntHtwylKvZtbDDfdQXJFQjCt/BFqkQvtplVZsU=;
	b=W/irMbNG5pJbyrMMTpZu5aXkkf2Hse30aozQe0/s6TFyZLs7GQm/fgg0eHGlufKT2qbM
	 y+fUN4EmbGjj32BRjHkzeWZ4/nYTlJqUv599WK1V6FmH36pZ8LO/wcOJPg0C2kbqv4IxX
	 4PI2a/2QSc9VzXCPD3fabkKKjYJHR6aUAaeJPTx/gLexsQtaoPkGbzQQvMrUh+iFqimPF
	 Jty3PB2YVr1aUwLGHZTCgJrLhPLqAtwPt6DhqthBql9TMMonCPYLD3AwQeW3WKNJvc1Zw
	 JZwZuBIf6qOip612Zrci/6m8HX70ltgUzn7rAyY/L1pV8yaIuGs4DtnBgqnZG16m6yQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PUEmI35w;
	arc=none smtp.remote-ip=209.85.218.52
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E0BA60A2617
	for <linux-staging@lists.linux.dev>; Wed, 25 Nov 2026 11:08:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5E0BA60A2617
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PUEmI35w
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c511c0e2826so643083466b.0
        for <linux-staging@lists.linux.dev>; Wed, 25 Nov 2026 03:08:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795604912; x=1796209712; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CFqYsntHtwylKvZtbDDfdQXJFQjCt/BFqkQvtplVZsU=;
        b=PUEmI35wBGRDzevFrtnrUxbt6sH5fcWED0lcEoUP4/3eDaEG5qiE92r9x2y2Q4kvCl
         43kL1HjP4nrenf5BBduzX5nLhIijKqdLghzlAVmJgOQx690GeLk+Ha0ye3gyIe2TvxZX
         XGKOyCmkWCrawvVD/PqvEYkB4hAEQZGQgabSauSvFrXlpMo/uW4edTtRM9cIDyw/sx5n
         cLwhHVsoVBmTMstcX0qvVde7ZCCoedfYd3TZS7+SVOCZ4Ka3uj6m6WmtSkMC2HAiwSmR
         /idrDYcFXHmT4LQI8R7rpvW6l1S0VeE4jvzvPYIR4wX+g2HF9Gc3w/+3xtL/Ajva1qYA
         EQYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795604912; x=1796209712;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CFqYsntHtwylKvZtbDDfdQXJFQjCt/BFqkQvtplVZsU=;
        b=oCudWXrcRTbNctkTFRCb0W+eHWK01gAwfPEAtNJn5gphMJaRhDP4Q73chOB+W5UgAn
         4tz39eHL81z6QM9ylpXaUo9huhq1jB8srIJ+D25qSLbU3VFbZaM775UUUk0rf7JygiuF
         yJZlbvEL2Z30ivpwzNrfi1sqOlttRe5gTDYI5nb3fPcZrGDvRSzWcvnm/mFkxHsTj3Mw
         VxKtmuCzfMx9UaHRN0IrrUBrsfVVNVgaeoyVMHHwoQSdyyVS5P+EER2mYuIG8DS5S9nE
         1Rhu30flRwbhzbCt3QDMl7VGVQWShKmcLLGnuISmC4GovMo9LkKeyINv3eOg9JfUrg8H
         Y3MA==
X-Forwarded-Encrypted: i=1; AL+hErHZrakE1r0CkMr7y/TgaSrG9fq59C6t2H23uvVZ9vKKge17XcWzf+PIs0AOGtRaEffJ9qaRujmEsHdghC5F@lists.linux.dev
X-Gm-Message-State: APuU4Z9DOIUXdY9q5MgKG09DQgb14xc9A2XfgxxLOMQiVCjuRfSOKIkN
	dYYMjJF5erUYHq6L2l13d/EJ/QD8TscAr9kFIuQMsBzDEY5ePlTqS6Px
X-Gm-Gg: AZFdTZfHuvDlxvYZ+6ZQu0htmyCniEKaX7cHY2H155R5TOWXxJ6cpWVPefDw1aD4CVr
	shRE7/uL8ZDPZjtGu9UfF7yd1gVVXU3Ys/083T1NgE2o/6LGYKwwd67FyRTLoGrp1vxPepKIZIz
	kjqj5hRGMishHVMX10SynlQ5lvyEWNJnVB9ZxN0+s9FHPGTir7k1PTmOTUIViX2QPd+AKRINtPF
	u2ndkQXv4JuvOlp+Lfld8etbQconV880pd6ouUN4woy2B3liMwVnv0ueCsoF1iUd86IuYnd2uRX
	Y0ZY2ZnM/LyiiU+x9HB5ZVyYxXqdAXKTnMAlziVMbi/DoIOdLge2xjguS9kCjJmWmJI4X6hREYt
	iEmzti00HgqTd7eXbFBZTBJqgQqtCeEgXkaN5ieIN1QH6/lD0bm+z8mZWhrkBfQJ4bhAhWQkLPb
	ntJnOXmNzTew6/at2hOb9hQLiFi0nlfsM9zfYadcH0sVm9n2JtL/4QR6m6sytwr61jAOmJcUcVs
	LOfWUmhFq/0/L0HWVjNcWXGTlMPxs9xKFJyci7PhT3q3NY4ErynYbEtGWhhMD27JDvkndHhMaDn
	eu7rXgYkhK7l6r2j91U4m5aUgG/09egy3pU0YIrSNAY3mq8gZSb+nvFvNQcv0+keS58XslLwP3B
	fxgzLsgqdjV3n0vLf2Ai+Er33IeClT5gd
X-Received: by 2002:a17:907:a712:b0:c4d:a05:a2e4 with SMTP id a640c23a62f3a-c513a9ae26fmr1334376466b.20.1795604911581;
        Wed, 25 Nov 2026 03:08:31 -0800 (PST)
Received: from xeon ([188.163.112.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513acfeda1sm654562066b.6.2026.11.25.03.08.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 03:08:30 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Mikko Perttunen <mperttunen@nvidia.com>
Cc: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v1 08/13] media: tegra-video: vi: Enumerate supported formats instead of building bitmap of compatible formats
Date: Wed, 25 Nov 2026 13:07:45 +0200
Message-ID: <20261125110750.223628-9-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261125110750.223628-1-clamor95@gmail.com>
References: <20261125110750.223628-1-clamor95@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enumerate pixel formats directly from SoC video formats (filtering by
f->mbus_code when provided) in tegra_channel_enum_format(), and remove the
subdevice/TPG format bitmaps, MAX_FORMAT_NUM, and
tegra_channel_set_subdev_active_fmt() so channel format enumeration no
longer depends on subdevice media bus enumeration during graph completion.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../media/platform/nvidia/tegra-video/vi.c    | 161 ++----------------
 .../media/platform/nvidia/tegra-video/vi.h    |   6 -
 2 files changed, 16 insertions(+), 151 deletions(-)

diff --git a/drivers/media/platform/nvidia/tegra-video/vi.c b/drivers/media/platform/nvidia/tegra-video/vi.c
index ed3e1e91baf12..4a0742b514a2b 100644
--- a/drivers/media/platform/nvidia/tegra-video/vi.c
+++ b/drivers/media/platform/nvidia/tegra-video/vi.c
@@ -64,29 +64,6 @@ to_tegra_vi_graph_entity(struct v4l2_async_connection *asd)
 	return container_of(asd, struct tegra_vi_graph_entity, asd);
 }
 
-static int tegra_get_format_idx_by_code(struct tegra_vi *vi,
-					unsigned int code,
-					unsigned int offset)
-{
-	unsigned int i;
-
-	for (i = offset; i < vi->soc->nformats; ++i) {
-		if (vi->soc->video_formats[i].code == code)
-			return i;
-	}
-
-	return -1;
-}
-
-static u32 tegra_get_format_fourcc_by_idx(struct tegra_vi *vi,
-					  unsigned int index)
-{
-	if (WARN_ON_ONCE(index >= vi->soc->nformats))
-		return vi->soc->video_formats[0].fourcc;
-
-	return vi->soc->video_formats[index].fourcc;
-}
-
 static const struct tegra_video_format *
 tegra_get_format_by_fourcc(struct tegra_vi *vi, u32 fourcc)
 {
@@ -327,19 +304,26 @@ static int tegra_channel_enum_format(struct file *file, void *fh,
 				     struct v4l2_fmtdesc *f)
 {
 	struct tegra_vi_channel *chan = video_drvdata(file);
-	unsigned int index;
-	unsigned long *fmts_bitmap = chan->tpg_fmts_bitmap;
-
-	if (!IS_ENABLED(CONFIG_VIDEO_TEGRA_TPG))
-		fmts_bitmap = chan->fmts_bitmap;
+	const struct tegra_video_format *vfmt = NULL;
+	struct tegra_vi *vi = chan->vi;
+	unsigned int index = 0;
 
-	index = find_nth_bit(fmts_bitmap, MAX_FORMAT_NUM, f->index);
-	if (index >= MAX_FORMAT_NUM)
+	if (f->index >= vi->soc->nformats)
 		return -EINVAL;
 
-	f->pixelformat = tegra_get_format_fourcc_by_idx(chan->vi, index);
+	for (unsigned int i = 0; i < vi->soc->nformats; i++) {
+		vfmt = &vi->soc->video_formats[i];
 
-	return 0;
+		if (f->mbus_code && vfmt->code != f->mbus_code)
+			continue;
+
+		if (index++ == f->index) {
+			f->pixelformat = vfmt->fourcc;
+			return 0;
+		}
+	}
+
+	return -EINVAL;
 }
 
 static int tegra_channel_get_format(struct file *file, void *fh,
@@ -489,39 +473,6 @@ static int tegra_channel_set_format(struct file *file, void *fh,
 	return 0;
 }
 
-static int tegra_channel_set_subdev_active_fmt(struct tegra_vi_channel *chan)
-{
-	int ret, index;
-	struct v4l2_subdev *subdev;
-	struct v4l2_subdev_format fmt = {
-		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
-	};
-
-	/*
-	 * Initialize channel format to the sub-device active format if there
-	 * is corresponding match in the Tegra supported video formats.
-	 */
-	subdev = tegra_channel_get_remote_source_subdev(chan);
-	ret = v4l2_subdev_call(subdev, pad, get_fmt, NULL, &fmt);
-	if (ret)
-		return ret;
-
-	index = tegra_get_format_idx_by_code(chan->vi, fmt.format.code, 0);
-	if (index < 0)
-		return -EINVAL;
-
-	chan->fmtinfo = &chan->vi->soc->video_formats[index];
-	v4l2_fill_pix_format(&chan->format, &fmt.format);
-	chan->format.pixelformat = chan->fmtinfo->fourcc;
-	chan->format.bytesperline = chan->format.width * chan->fmtinfo->bpp;
-	chan->format.sizeimage = chan->format.bytesperline *
-				 chan->format.height;
-	chan->vi->ops->vi_fmt_align(&chan->format, NULL, chan->fmtinfo->bpp);
-	tegra_channel_update_gangports(chan);
-
-	return 0;
-}
-
 static int
 tegra_channel_subscribe_event(struct v4l2_fh *fh,
 			      const struct v4l2_event_subscription *sub)
@@ -713,78 +664,6 @@ static int tegra_channel_setup_ctrl_handler(struct tegra_vi_channel *chan)
 	return 0;
 }
 
-/* VI only support 2 formats in TPG mode */
-static void vi_tpg_fmts_bitmap_init(struct tegra_vi_channel *chan)
-{
-	int index;
-
-	bitmap_zero(chan->tpg_fmts_bitmap, MAX_FORMAT_NUM);
-
-	index = tegra_get_format_idx_by_code(chan->vi,
-					     MEDIA_BUS_FMT_SRGGB10_1X10, 0);
-	bitmap_set(chan->tpg_fmts_bitmap, index, 1);
-
-	index = tegra_get_format_idx_by_code(chan->vi,
-					     MEDIA_BUS_FMT_RGB888_1X32_PADHI,
-					     0);
-	bitmap_set(chan->tpg_fmts_bitmap, index, 1);
-}
-
-static int vi_fmts_bitmap_init(struct tegra_vi_channel *chan)
-{
-	int index, ret, match_code = 0;
-	struct v4l2_subdev *subdev;
-	struct v4l2_subdev_mbus_code_enum code = {
-		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
-	};
-
-	bitmap_zero(chan->fmts_bitmap, MAX_FORMAT_NUM);
-
-	/*
-	 * Set the bitmap bits based on all the matched formats between the
-	 * available media bus formats of sub-device and the pre-defined Tegra
-	 * supported video formats.
-	 */
-	subdev = tegra_channel_get_remote_source_subdev(chan);
-	while (1) {
-		ret = v4l2_subdev_call(subdev, pad, enum_mbus_code,
-				       NULL, &code);
-		if (ret < 0)
-			break;
-
-		index = tegra_get_format_idx_by_code(chan->vi, code.code, 0);
-		while (index >= 0) {
-			bitmap_set(chan->fmts_bitmap, index, 1);
-			if (!match_code)
-				match_code = code.code;
-			/* look for other formats with same mbus code */
-			index = tegra_get_format_idx_by_code(chan->vi,
-							     code.code,
-							     index + 1);
-		}
-
-		code.index++;
-	}
-
-	/*
-	 * Set the bitmap bit corresponding to default tegra video format if
-	 * there are no matched formats.
-	 */
-	if (!match_code) {
-		match_code = chan->vi->soc->default_video_format->code;
-		index = tegra_get_format_idx_by_code(chan->vi, match_code, 0);
-		if (WARN_ON(index < 0))
-			return -EINVAL;
-
-		bitmap_set(chan->fmts_bitmap, index, 1);
-	}
-
-	/* initialize channel format to the sub-device active format */
-	tegra_channel_set_subdev_active_fmt(chan);
-
-	return 0;
-}
-
 static void tegra_channel_cleanup(struct tegra_vi_channel *chan)
 {
 	v4l2_ctrl_handler_free(&chan->ctrl_handler);
@@ -1115,7 +994,6 @@ int tegra_v4l2_nodes_setup_tpg(struct tegra_video_device *vid)
 			goto cleanup;
 
 		v4l2_set_subdev_hostdata(&csi_chan->subdev, vi_chan);
-		vi_tpg_fmts_bitmap_init(vi_chan);
 		csi_chan = list_next_entry(csi_chan, list);
 	}
 
@@ -1319,13 +1197,6 @@ static int tegra_vi_graph_notify_complete(struct v4l2_async_notifier *notifier)
 		goto unregister_video;
 	}
 
-	ret = vi_fmts_bitmap_init(chan);
-	if (ret < 0) {
-		dev_err(vi->dev,
-			"failed to initialize formats bitmap: %d\n", ret);
-		goto unregister_video;
-	}
-
 	subdev = tegra_channel_get_remote_bridge_subdev(chan);
 	if (!subdev) {
 		ret = -ENODEV;
diff --git a/drivers/media/platform/nvidia/tegra-video/vi.h b/drivers/media/platform/nvidia/tegra-video/vi.h
index ac86f11588f95..fb377d428d510 100644
--- a/drivers/media/platform/nvidia/tegra-video/vi.h
+++ b/drivers/media/platform/nvidia/tegra-video/vi.h
@@ -29,8 +29,6 @@
 #define TEGRA_DEF_HEIGHT	1080
 #define TEGRA_IMAGE_FORMAT_DEF	32
 
-#define MAX_FORMAT_NUM		64
-
 enum tegra_vi_pg_mode {
 	TEGRA_VI_PG_DISABLED = 0,
 	TEGRA_VI_PG_DIRECT,
@@ -172,8 +170,6 @@ struct tegra_vi {
  *
  * @ctrl_handler: V4L2 control handler of this video channel
  * @syncpt_timeout_retry: syncpt timeout retry count for the capture
- * @fmts_bitmap: a bitmap for supported formats matching v4l2 subdev formats
- * @tpg_fmts_bitmap: a bitmap for supported TPG formats
  * @pg_mode: test pattern generator mode (disabled/direct/patch)
  * @notifier: V4L2 asynchronous subdevs notifier
  *
@@ -223,8 +219,6 @@ struct tegra_vi_channel {
 
 	struct v4l2_ctrl_handler ctrl_handler;
 	unsigned int syncpt_timeout_retry;
-	DECLARE_BITMAP(fmts_bitmap, MAX_FORMAT_NUM);
-	DECLARE_BITMAP(tpg_fmts_bitmap, MAX_FORMAT_NUM);
 	enum tegra_vi_pg_mode pg_mode;
 
 	struct v4l2_async_notifier notifier;
-- 
2.53.0

