Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795604915;
	b=MVd4c84xP5E7XO8LgBKxLoOxrFyPXDFSapsaZz93uBELxeLfOGhL0g+gOIHB6t4MzhLY
	 HeIjqf6vn374kAHitCYEG9pVz3TA2ZXGyFjXLFMQQrh9O9eCAF3hBI1HvpQuqyFtbwH5N
	 YN7T174lA2GNq/Xue7KJ5Erttm1kBDntVsRjVdSXC+0LX8qIbjej5thCNljrtpIcmGNWO
	 x94eoJ7tWBrlcqjA/aGEMLPJyE3uzSIKr8xkJcNuZ2fr/gGvJTD5o95fJV3EnuSASuai1
	 q49x3ZCkvJlZRF52+BuwCBpp1bv/AX8gXbP2T2sVEZehN81f4XAFzoxCuH2PFVXO6Dg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795604915;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ttE+DnIFRwVAU5oqEO22iJJyxTTgqP9uAtkgNos0KTU=;
	b=QBottnKkkJiyvrJqtW1Wi/zuX5qXZAhxw+3N23sPsw6qLLWtR9vSn3kmqHRUHFTOQ9Ne
	 XAN4vOGT9042gbW2D7IqP6JOELBS4Rqmfg6ksnqvc70mEB5ik8H+nmXv2sJR04SnJjd0m
	 aQ9piCPVMYIdOqOvCSdT3L3rEauUBwhLuqEpEjZ+J8KN6q2kbak+brt/ZkNRLWGvxPJUy
	 a+lZ9zG5kOo08NXWtkvR6iX9MrRWSfxlrhF1BcmgB6Z4BN9k9PQzLo/ZhGWd/f8KgiXCU
	 T5mkiEVGdDWaORdJeOZ30e2ZEUNuudSoYxm1ZaaSDgD4+BNQDDFeC6O1FduPFI6kRMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wWQRqMFA;
	arc=none smtp.remote-ip=209.85.208.52
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB70560A2623
	for <linux-staging@lists.linux.dev>; Wed, 25 Nov 2026 11:08:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AB70560A2623
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wWQRqMFA
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6b88d143160so6920323a12.1
        for <linux-staging@lists.linux.dev>; Wed, 25 Nov 2026 03:08:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795604913; x=1796209713; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ttE+DnIFRwVAU5oqEO22iJJyxTTgqP9uAtkgNos0KTU=;
        b=wWQRqMFAPVbojHZI3EaskZYm3omeT9+Iu7qky9qZmdv8orcGDYmpCHOK9TAxpAWa4x
         Jngdk+1kE+gp73fw+NrlpPJXbXNJO+BiHehpcAdNuLm0sce78k/eHw9zH06r/hPap6o9
         rlyV3nhUSSuUp7wtZIzccWQIUJ82DQvXbEutZhsTdIHSinAqt9bTjrMouiwywIZY9qqa
         6dGHi7tLKnbzlJMQwyAwqlNJAZDGYzLGejMRDxFVbNwP+6BXxMoA2eiart+0fDpm+Oxt
         8WCVhISFx3fERK5RAbuUr52bAh7dNTDs8Y20cKttk5btgF9ImVRrAhYst4kNeFi90E66
         5Rgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795604913; x=1796209713;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ttE+DnIFRwVAU5oqEO22iJJyxTTgqP9uAtkgNos0KTU=;
        b=UopVUFoERhsV5vtASqH+ItqEINUum4vuci2ZiqiNlT4/vWljJWzEpJZswZDtkDaR2N
         yAwAVgHtUpUWLwwA7W7gZwirMwUa8eMh26BCKCvVh2uC0TD0DYcZ4z2v3K1CPYbNKb++
         zBzkRm75e7QzL4G/eAA6TKTcxCKlaA2/5XC/DawPEqKPFRHcpwtndHjEjBR7XCzIsPJ4
         zfDAEzpdJTpwQx00oyOhdHdbwhkLebJZtnCO4zsfM88veALFD/4fjFdy43iLgyjLAXKi
         3G7LGhRfO/7DFh8cL0CXGWXzFpGpChE/t6VkoBBv98xknR7llEfozE/ufdF73e/zGk48
         bM8Q==
X-Forwarded-Encrypted: i=1; AL+hErEMnRBb/XrB1klD0CPbJKS/ZEUyQL3qTAsCZfEA3kBeYK+QyopcqttYbhq2vJQdyGphDg7z26ujL0WtmZb1@lists.linux.dev
X-Gm-Message-State: APuU4Z95CL/UCnO5Hl/vHA3VydB4axf/jnR2KbZcegZXh0BuOTgKxj5b
	VZSbXHAi5fj+JRiRSbwxOzPqqDkpa6KoxLemhaSAGfWafOSvUVa7TQ/0
X-Gm-Gg: AZFdTZcoczUZBxSzAp6MeL4ztOjBjqD+JD7ToS1V/93+B5P74pXUetkq8QvPsFo+k72
	f5gCOuDqEGJofNAQNCHc6wMi0EUSUgEMr8KP3yal9mCIUyfyDgCIpfzKAS+qY7JIyG3oYW6Eg7J
	r49rtYrnPt7zGZc9mKp8bBSqMlRIZ+x3pDaqTiy2qqMJdZPyKigxVnQ+3i+dofBLwULA0tYxGCz
	QY4g8ik4x2dvVp+midUOJVZ4rbSkYlobi6hfHadYcTpq1nzCnOaZuj/QXAPzJ4HTVm815275z/F
	9WRpNLiXF1CLmVLiWuaY4ygphYjxZgoe6/95tYhVin6kZQji7Nb0w+d7UUJx73PCPWhtTCbQqO+
	88F1lG8Q2hyCkHUABWpIixmrePArHCZXagqeI/eGjJxlXqLXuEqGxRm3u9sZcheu1eoHTR7xGIf
	QX4KD1zARdMWPaG0ZnyfJqXEhpVQ1XhHrpundkSWHetfLmvgYKGIDhTpChhcl39gKW9b9C16zZZ
	LVvt5Z1Hgzf9fgxs32uyajDNt1Tss6W8WMPyvDzpBm2tlH5xa/WigjZU6cGtYdbehg4QHrHJRFV
	Riztvj3CwbS4mjbx54i8wlPS0jOOu/TKg3xc0Q8JZqIeJAxZGbbT4itvmJGJd8bQIN7AZprMFaN
	n44dVvcHzlg==
X-Received: by 2002:a17:907:c641:10b0:c42:e6c8:e494 with SMTP id a640c23a62f3a-c513ab47855mr991039366b.37.1795604913063;
        Wed, 25 Nov 2026 03:08:33 -0800 (PST)
Received: from xeon ([188.163.112.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513acfeda1sm654562066b.6.2026.11.25.03.08.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 03:08:32 -0800 (PST)
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
Subject: [PATCH v1 09/13] media: tegra-video: vi: Configure capture format locally without subdev calls
Date: Wed, 25 Nov 2026 13:07:46 +0200
Message-ID: <20261125110750.223628-10-clamor95@gmail.com>
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

Simplify __tegra_channel_try_format() and tegra_channel_set_format() to
validate, align, and store the capture pixel format locally on the video
channel instead of querying or setting formats on the remote subdevice
and allocating temporary subdev state.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../media/platform/nvidia/tegra-video/vi.c    | 81 +------------------
 1 file changed, 4 insertions(+), 77 deletions(-)

diff --git a/drivers/media/platform/nvidia/tegra-video/vi.c b/drivers/media/platform/nvidia/tegra-video/vi.c
index 4a0742b514a2b..f2de3aeb05bbc 100644
--- a/drivers/media/platform/nvidia/tegra-video/vi.c
+++ b/drivers/media/platform/nvidia/tegra-video/vi.c
@@ -340,82 +340,23 @@ static int __tegra_channel_try_format(struct tegra_vi_channel *chan,
 				      struct v4l2_pix_format *pix)
 {
 	const struct tegra_video_format *fmtinfo;
-	static struct lock_class_key key;
-	struct v4l2_subdev *subdev;
-	struct v4l2_subdev_format fmt = {
-		.which = V4L2_SUBDEV_FORMAT_TRY,
-	};
-	struct v4l2_subdev_state *sd_state;
-	struct v4l2_subdev_frame_size_enum fse = {
-		.which = V4L2_SUBDEV_FORMAT_TRY,
-	};
-	struct v4l2_subdev_selection sdsel = {
-		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
-		.target = V4L2_SEL_TGT_CROP_BOUNDS,
-	};
-	struct v4l2_rect *try_crop;
-	int ret = 0;
-
-	subdev = tegra_channel_get_remote_source_subdev(chan);
-	if (!subdev)
-		return -ENODEV;
+	struct tegra_vi *vi = chan->vi;
 
-	/*
-	 * FIXME: Drop this call, drivers are not supposed to use
-	 * __v4l2_subdev_state_alloc().
-	 */
-	sd_state = __v4l2_subdev_state_alloc(subdev, "tegra:state->lock",
-					     &key);
-	if (IS_ERR(sd_state))
-		return PTR_ERR(sd_state);
 	/*
 	 * Retrieve the format information and if requested format isn't
 	 * supported, keep the current format.
 	 */
-	fmtinfo = tegra_get_format_by_fourcc(chan->vi, pix->pixelformat);
+	fmtinfo = tegra_get_format_by_fourcc(vi, pix->pixelformat);
 	if (!fmtinfo) {
 		pix->pixelformat = chan->format.pixelformat;
 		pix->colorspace = chan->format.colorspace;
-		fmtinfo = tegra_get_format_by_fourcc(chan->vi,
-						     pix->pixelformat);
+		fmtinfo = tegra_get_format_by_fourcc(vi, pix->pixelformat);
 	}
 
 	pix->field = V4L2_FIELD_NONE;
-	fmt.pad = 0;
-	v4l2_fill_mbus_format(&fmt.format, pix, fmtinfo->code);
-
-	/*
-	 * Attempt to obtain the format size from subdev.
-	 * If not available, try to get crop boundary from subdev.
-	 */
-	try_crop = v4l2_subdev_state_get_crop(sd_state, 0);
-	fse.code = fmtinfo->code;
-	ret = v4l2_subdev_call(subdev, pad, enum_frame_size, sd_state, &fse);
-	if (ret) {
-		if (!v4l2_subdev_has_op(subdev, pad, get_selection) ||
-		    v4l2_subdev_call(subdev, pad, get_selection, NULL, NULL, &sdsel)) {
-			try_crop->width = 0;
-			try_crop->height = 0;
-		} else {
-			try_crop->width = sdsel.r.width;
-			try_crop->height = sdsel.r.height;
-		}
-	} else {
-		try_crop->width = fse.max_width;
-		try_crop->height = fse.max_height;
-	}
-
-	ret = v4l2_subdev_call(subdev, pad, set_fmt, NULL, sd_state, &fmt);
-	if (ret < 0)
-		goto out_free;
-
-	v4l2_fill_pix_format(pix, &fmt.format);
 	chan->vi->ops->vi_fmt_align(pix, NULL, fmtinfo->bpp);
 
-out_free:
-	__v4l2_subdev_state_free(sd_state);
-
-	return ret;
+	return 0;
 }
 
 static int tegra_channel_try_format(struct file *file, void *fh,
@@ -439,10 +380,6 @@ static int tegra_channel_set_format(struct file *file, void *fh,
 {
 	struct tegra_vi_channel *chan = video_drvdata(file);
 	const struct tegra_video_format *fmtinfo;
-	struct v4l2_subdev_format fmt = {
-		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
-	};
-	struct v4l2_subdev *subdev;
 	struct v4l2_pix_format *pix = &format->fmt.pix;
 	int ret;
 
@@ -456,16 +393,6 @@ static int tegra_channel_set_format(struct file *file, void *fh,
 
 	fmtinfo = tegra_get_format_by_fourcc(chan->vi, pix->pixelformat);
 
-	fmt.pad = 0;
-	v4l2_fill_mbus_format(&fmt.format, pix, fmtinfo->code);
-	subdev = tegra_channel_get_remote_source_subdev(chan);
-	ret = v4l2_subdev_call(subdev, pad, set_fmt, NULL, NULL, &fmt);
-	if (ret < 0)
-		return ret;
-
-	v4l2_fill_pix_format(pix, &fmt.format);
-	chan->vi->ops->vi_fmt_align(pix, NULL, fmtinfo->bpp);
-
 	chan->format = *pix;
 	chan->fmtinfo = fmtinfo;
 	tegra_channel_update_gangports(chan);
-- 
2.53.0

