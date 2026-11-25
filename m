Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795604908;
	b=lfG/co6WDHK59YsAu8LN2dtYyGv53Bz+MywBTIQe+tUhRnIFAJBNz2gkvEWm9Y3/iYqq
	 W/fWnZ1WCZfhlaj7scRaDINmHsA6FvYpyayWAn+hxUlQB+CHreIHJMNUKnCPguo5fOYQh
	 QQGyshfFWpCzA1bPIB1wSdyGV2MpJlABZfDjnm/1KhLi++xFosnuS1hbHNYnLdJqCE454
	 95hCBt/u4FmjPXR8fIbtEO2p8ewSXSQdHw4a8t+v7cBpSAVIgdlk8H2OKnd04HFThgZYi
	 Gk2rYubj/9Ej0rut4GYYkiuwF70wOi4dYNkDIokFsFOeHdo0Eo7Fww6MZ+pLyYY+StQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795604908;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=haW7qmNelcE/ou/Uj8IWT9VFF3pqmX9E8iBlrPLkLL8=;
	b=tcRuNS6RpEpyNqecm8xq4hmlS6zuOq6wh23UaF6fBThlU4GcjtUSJ9kjyPyoYzFwTKu5
	 UquOcJK5kkzDA+7VCZid0y9lvy/KrqQClT3TG5cNnzbbHN94HJpfZCGAE5PADCVGDzFan
	 Sxb0jv4rNjAJrSaMIFGhky3923Cc38n5wTqlLVsfyn2R7Jr2Mk7XEYp1Y5oVJV5fRFF6H
	 MuxtF5kszf04QxvUpbC0bI3iITbDwkQzSqGJDgxM1tIrsZ41Gy2JxTN88j8m/c2LBBdfT
	 wVA9vfauoPo5FHkErULgbiXiY58gfJ4e84sYFmPtpSki3+ncGkqINtvazIXOGQYWjzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=w8J2Dq0A;
	arc=none smtp.remote-ip=209.85.218.41
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59AB6606A33E
	for <linux-staging@lists.linux.dev>; Wed, 25 Nov 2026 11:08:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 59AB6606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=w8J2Dq0A
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c4cb6834eaaso57694066b.2
        for <linux-staging@lists.linux.dev>; Wed, 25 Nov 2026 03:08:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795604906; x=1796209706; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=haW7qmNelcE/ou/Uj8IWT9VFF3pqmX9E8iBlrPLkLL8=;
        b=w8J2Dq0AdAh+Ym1tWELk2wcPqBTjPMP40LsLMpoNVs/YtKN1UqReAALaZX8ivklgF7
         OacSJdhWuN6fUHzTPHhMV1+W5AlyKPtgQ58MRdfpanRdRbR3uWqczqi8COirOnU27V3B
         3G0mJyEuogXtiz7mb9pJO9EKqdfLB3HRUrecXL5Zmh3eaSj80RR83eCyGD582ZtUiQ3P
         QYH49/w8KVBFyuh8KhbB2vaoDJ3U0kSFnUAo7GoIq0uvyTkG0hZAvwuydk8gg5XBp6sW
         ZeEbSjUDaFA3LbGUbwREoOlbslDx5xJI1REJalNAMcSasF2CSH/I887Ka3sK7kO2zSF0
         +8Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795604906; x=1796209706;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=haW7qmNelcE/ou/Uj8IWT9VFF3pqmX9E8iBlrPLkLL8=;
        b=RegCWhJOQaZ5xoCjZJSUXuDF+3/jc1V0FH0j2snGURKFNXCHwvVK+PjxLnYBA1G4mQ
         rKL4HVQeSfMS8l2Uq6gW4FSziRV2QnrJtSdmnR5ABWF/14tSdIFMLKCQkujT7HuTTtdY
         4sAfoKfODkZ/nFIFUcH77XEso3xNHhPyMdTUdaXC8tgSDH0Hgpz/AoH8i0b46nseNd5H
         83FtjKSFHXb9vwsrdfMsvHz7prNkbUAJlZboZ4LmWF5qzVOvoTiYyqfcxizAVe50A0YH
         AU/Uie9L0dmKBFlTk1P/8jBnnhIaB4ZAF8dtBAEHvcTjr3d/f5HWPPs6o7ZPBtM/GUsj
         8F3A==
X-Forwarded-Encrypted: i=1; AL+hErFNP90Co3HZzapdFTSpFz9LRUyvvHnhFbPjQ5YeUm/7tO98AgPNmD7tgh5Y6QhyQHMU3Jd1h99nswd41tNY@lists.linux.dev
X-Gm-Message-State: APuU4Z9YApNbCiCHZHflH2thkrjhvnetus9HralyAem4aMMIG7SOlRCU
	t6MY+Fv7l8at4EnyXXFMsBfTyRMPw8TKT3+2y6OUzzDk1I7a7Ddg2JQZ
X-Gm-Gg: AZFdTZczySFeezvDXV3UDV27jq9bbnRRjg2Mk+MGdYC4rKVdE04zUQIIHJT1TdSKvhJ
	c8HSUDTbaocFyUwiJ549orwrXG27zGvniOTJHLVL0VFEjM2CRtef9YbZGAIgF7AAd0UDkHoDsgH
	REq2pM+8CN3JYegCs5ny4Knk7rLJX1pxhhWFTlgbpUyMlfoBX0GKHkoZvcLhlNX3ibVqeyq4mdo
	cSj/24fLr4Q3I8PvAckla4P3K/+C6AJyqtHIvg34sBFx3N6orf545H6XupLrNCPPV/tgxeRDYcz
	icq/Z/qBSLDCenmopIXIJs0iizjp3zfY5gNhkJCj4HY8+wKnyxEceUqS1giXjD7TGi8WiG3dMyQ
	eoZepvyx2FNL5ml1Y5dvpx40a/UcpWKaKNwnL0dfVE1P5w2nJ1qsItWHuAeqEl3pS3XUaRIwSpV
	Dnzf4xKtCCDewxu1b0JXmW71Ly9kB4F/pE4BGkRt+qUyvAxMqrmHCXmLsoXiwcMnNkeXcWdGDsF
	kDOodgH0RHBb2u7xjNpCRNE2WvG/faM+oSL1DmAiRN+RWcTRP7sYWfoeqaLkr+3HUuPPhfFsK28
	ybFVpFC91lulxlzc+AgnJM2YNl1+bselVSsyCyA7i/x6roKmrbYQth4NviIaluXYyG0MJ4NA0f2
	l6pXP9Bzjug==
X-Received: by 2002:a17:906:99d4:b0:c46:ca2b:84bd with SMTP id a640c23a62f3a-c513a8929c4mr1454092366b.30.1795604905625;
        Wed, 25 Nov 2026 03:08:25 -0800 (PST)
Received: from xeon ([188.163.112.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513acfeda1sm654562066b.6.2026.11.25.03.08.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 03:08:24 -0800 (PST)
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
Subject: [PATCH v1 04/13] media: tegra-video: vi: Drop subdevice passthrough and input ioctls
Date: Wed, 25 Nov 2026 13:07:41 +0200
Message-ID: <20261125110750.223628-5-clamor95@gmail.com>
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

Drop V4L2 video device ioctl callbacks in tegra_channel_ioctl_ops that
simply proxy stream parameters, frame intervals, selection, EDID, or DV
timings to the remote source subdevice, along with the single-input
enumeration and selection stubs, as part of moving the driver to a
media-controller pipeline model.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../media/platform/nvidia/tegra-video/vi.c    | 299 ------------------
 1 file changed, 299 deletions(-)

diff --git a/drivers/media/platform/nvidia/tegra-video/vi.c b/drivers/media/platform/nvidia/tegra-video/vi.c
index 4753ca89666ae..376f53f44b90d 100644
--- a/drivers/media/platform/nvidia/tegra-video/vi.c
+++ b/drivers/media/platform/nvidia/tegra-video/vi.c
@@ -308,26 +308,6 @@ static int tegra_channel_querycap(struct file *file, void *fh,
 	return 0;
 }
 
-static int tegra_channel_g_parm(struct file *file, void *fh,
-				struct v4l2_streamparm *a)
-{
-	struct tegra_vi_channel *chan = video_drvdata(file);
-	struct v4l2_subdev *subdev;
-
-	subdev = tegra_channel_get_remote_source_subdev(chan);
-	return v4l2_g_parm_cap(&chan->video, subdev, a);
-}
-
-static int tegra_channel_s_parm(struct file *file, void *fh,
-				struct v4l2_streamparm *a)
-{
-	struct tegra_vi_channel *chan = video_drvdata(file);
-	struct v4l2_subdev *subdev;
-
-	subdev = tegra_channel_get_remote_source_subdev(chan);
-	return v4l2_s_parm_cap(&chan->video, subdev, a);
-}
-
 static int tegra_channel_enum_framesizes(struct file *file, void *fh,
 					 struct v4l2_frmsizeenum *sizes)
 {
@@ -358,38 +338,6 @@ static int tegra_channel_enum_framesizes(struct file *file, void *fh,
 	return 0;
 }
 
-static int tegra_channel_enum_frameintervals(struct file *file, void *fh,
-					     struct v4l2_frmivalenum *ivals)
-{
-	int ret;
-	struct tegra_vi_channel *chan = video_drvdata(file);
-	struct v4l2_subdev *subdev;
-	const struct tegra_video_format *fmtinfo;
-	struct v4l2_subdev_frame_interval_enum fie = {
-		.index = ivals->index,
-		.width = ivals->width,
-		.height = ivals->height,
-		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
-	};
-
-	fmtinfo = tegra_get_format_by_fourcc(chan->vi, ivals->pixel_format);
-	if (!fmtinfo)
-		return -EINVAL;
-
-	fie.code = fmtinfo->code;
-
-	subdev = tegra_channel_get_remote_source_subdev(chan);
-	ret = v4l2_subdev_call(subdev, pad, enum_frame_interval, NULL, &fie);
-	if (ret)
-		return ret;
-
-	ivals->type = V4L2_FRMIVAL_TYPE_DISCRETE;
-	ivals->discrete.numerator = fie.interval.numerator;
-	ivals->discrete.denominator = fie.interval.denominator;
-
-	return 0;
-}
-
 static int tegra_channel_enum_format(struct file *file, void *fh,
 				     struct v4l2_fmtdesc *f)
 {
@@ -601,203 +549,6 @@ tegra_channel_subscribe_event(struct v4l2_fh *fh,
 	return v4l2_ctrl_subscribe_event(fh, sub);
 }
 
-static int tegra_channel_g_selection(struct file *file, void *priv,
-				     struct v4l2_selection *sel)
-{
-	struct tegra_vi_channel *chan = video_drvdata(file);
-	struct v4l2_subdev *subdev;
-	struct v4l2_subdev_format fmt = {
-		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
-	};
-	struct v4l2_subdev_selection sdsel = {
-		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
-		.target = sel->target,
-	};
-	int ret;
-
-	subdev = tegra_channel_get_remote_source_subdev(chan);
-	if (!v4l2_subdev_has_op(subdev, pad, get_selection))
-		return -ENOTTY;
-
-	if (sel->type != V4L2_BUF_TYPE_VIDEO_CAPTURE)
-		return -EINVAL;
-	/*
-	 * Try the get selection operation and fallback to get format if not
-	 * implemented.
-	 */
-	ret = v4l2_subdev_call(subdev, pad, get_selection, NULL, NULL, &sdsel);
-	if (!ret)
-		sel->r = sdsel.r;
-	if (ret != -ENOIOCTLCMD)
-		return ret;
-
-	ret = v4l2_subdev_call(subdev, pad, get_fmt, NULL, &fmt);
-	if (ret < 0)
-		return ret;
-
-	sel->r.left = 0;
-	sel->r.top = 0;
-	sel->r.width = fmt.format.width;
-	sel->r.height = fmt.format.height;
-
-	return 0;
-}
-
-static int tegra_channel_s_selection(struct file *file, void *fh,
-				     struct v4l2_selection *sel)
-{
-	struct tegra_vi_channel *chan = video_drvdata(file);
-	struct v4l2_subdev *subdev;
-	int ret;
-	struct v4l2_subdev_selection sdsel = {
-		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
-		.target = sel->target,
-		.flags = sel->flags,
-		.r = sel->r,
-	};
-
-	subdev = tegra_channel_get_remote_source_subdev(chan);
-	if (!v4l2_subdev_has_op(subdev, pad, set_selection))
-		return -ENOTTY;
-
-	if (sel->type != V4L2_BUF_TYPE_VIDEO_CAPTURE)
-		return -EINVAL;
-
-	if (vb2_is_busy(&chan->queue))
-		return -EBUSY;
-
-	ret = v4l2_subdev_call(subdev, pad, set_selection, NULL, NULL, &sdsel);
-	if (!ret) {
-		sel->r = sdsel.r;
-		/*
-		 * Subdev active format resolution may have changed during
-		 * set selection operation. So, update channel format to
-		 * the sub-device active format.
-		 */
-		return tegra_channel_set_subdev_active_fmt(chan);
-	}
-
-	return ret;
-}
-
-static int tegra_channel_g_edid(struct file *file, void *fh,
-				struct v4l2_edid *edid)
-{
-	struct tegra_vi_channel *chan = video_drvdata(file);
-	struct v4l2_subdev *subdev;
-
-	subdev = tegra_channel_get_remote_source_subdev(chan);
-	if (!v4l2_subdev_has_op(subdev, pad, get_edid))
-		return -ENOTTY;
-
-	return v4l2_subdev_call(subdev, pad, get_edid, edid);
-}
-
-static int tegra_channel_s_edid(struct file *file, void *fh,
-				struct v4l2_edid *edid)
-{
-	struct tegra_vi_channel *chan = video_drvdata(file);
-	struct v4l2_subdev *subdev;
-
-	subdev = tegra_channel_get_remote_source_subdev(chan);
-	if (!v4l2_subdev_has_op(subdev, pad, set_edid))
-		return -ENOTTY;
-
-	return v4l2_subdev_call(subdev, pad, set_edid, edid);
-}
-
-static int tegra_channel_g_dv_timings(struct file *file, void *fh,
-				      struct v4l2_dv_timings *timings)
-{
-	struct tegra_vi_channel *chan = video_drvdata(file);
-	struct v4l2_subdev *subdev;
-
-	subdev = tegra_channel_get_remote_source_subdev(chan);
-	if (!v4l2_subdev_has_op(subdev, pad, g_dv_timings))
-		return -ENOTTY;
-
-	return v4l2_device_call_until_err(chan->video.v4l2_dev, 0,
-					  pad, g_dv_timings, 0, timings);
-}
-
-static int tegra_channel_s_dv_timings(struct file *file, void *fh,
-				      struct v4l2_dv_timings *timings)
-{
-	struct tegra_vi_channel *chan = video_drvdata(file);
-	struct v4l2_subdev *subdev;
-	struct v4l2_bt_timings *bt = &timings->bt;
-	struct v4l2_dv_timings curr_timings;
-	int ret;
-
-	subdev = tegra_channel_get_remote_source_subdev(chan);
-	if (!v4l2_subdev_has_op(subdev, pad, s_dv_timings))
-		return -ENOTTY;
-
-	ret = tegra_channel_g_dv_timings(file, fh, &curr_timings);
-	if (ret)
-		return ret;
-
-	if (v4l2_match_dv_timings(timings, &curr_timings, 0, false))
-		return 0;
-
-	if (vb2_is_busy(&chan->queue))
-		return -EBUSY;
-
-	ret = v4l2_device_call_until_err(chan->video.v4l2_dev, 0,
-					 pad, s_dv_timings, 0, timings);
-	if (ret)
-		return ret;
-
-	chan->format.width = bt->width;
-	chan->format.height = bt->height;
-	chan->format.bytesperline = bt->width * chan->fmtinfo->bpp;
-	chan->format.sizeimage = chan->format.bytesperline * bt->height;
-	chan->vi->ops->vi_fmt_align(&chan->format, chan->fmtinfo->bpp);
-	tegra_channel_update_gangports(chan);
-
-	return 0;
-}
-
-static int tegra_channel_query_dv_timings(struct file *file, void *fh,
-					  struct v4l2_dv_timings *timings)
-{
-	struct tegra_vi_channel *chan = video_drvdata(file);
-	struct v4l2_subdev *subdev;
-
-	subdev = tegra_channel_get_remote_source_subdev(chan);
-	if (!v4l2_subdev_has_op(subdev, pad, query_dv_timings))
-		return -ENOTTY;
-
-	return v4l2_device_call_until_err(chan->video.v4l2_dev, 0,
-					  pad, query_dv_timings, 0, timings);
-}
-
-static int tegra_channel_enum_dv_timings(struct file *file, void *fh,
-					 struct v4l2_enum_dv_timings *timings)
-{
-	struct tegra_vi_channel *chan = video_drvdata(file);
-	struct v4l2_subdev *subdev;
-
-	subdev = tegra_channel_get_remote_source_subdev(chan);
-	if (!v4l2_subdev_has_op(subdev, pad, enum_dv_timings))
-		return -ENOTTY;
-
-	return v4l2_subdev_call(subdev, pad, enum_dv_timings, timings);
-}
-
-static int tegra_channel_dv_timings_cap(struct file *file, void *fh,
-					struct v4l2_dv_timings_cap *cap)
-{
-	struct tegra_vi_channel *chan = video_drvdata(file);
-	struct v4l2_subdev *subdev;
-
-	subdev = tegra_channel_get_remote_source_subdev(chan);
-	if (!v4l2_subdev_has_op(subdev, pad, dv_timings_cap))
-		return -ENOTTY;
-
-	return v4l2_subdev_call(subdev, pad, dv_timings_cap, cap);
-}
-
 static int tegra_channel_log_status(struct file *file, void *fh)
 {
 	struct tegra_vi_channel *chan = video_drvdata(file);
@@ -807,54 +558,13 @@ static int tegra_channel_log_status(struct file *file, void *fh)
 	return 0;
 }
 
-static int tegra_channel_enum_input(struct file *file, void *fh,
-				    struct v4l2_input *inp)
-{
-	struct tegra_vi_channel *chan = video_drvdata(file);
-	struct v4l2_subdev *subdev;
-
-	if (inp->index)
-		return -EINVAL;
-
-	inp->type = V4L2_INPUT_TYPE_CAMERA;
-	subdev = tegra_channel_get_remote_source_subdev(chan);
-	strscpy(inp->name, subdev->name, sizeof(inp->name));
-	if (v4l2_subdev_has_op(subdev, pad, dv_timings_cap))
-		inp->capabilities = V4L2_IN_CAP_DV_TIMINGS;
-
-	return 0;
-}
-
-static int tegra_channel_g_input(struct file *file, void *priv,
-				 unsigned int *i)
-{
-	*i = 0;
-
-	return 0;
-}
-
-static int tegra_channel_s_input(struct file *file, void *priv,
-				 unsigned int input)
-{
-	if (input > 0)
-		return -EINVAL;
-
-	return 0;
-}
-
 static const struct v4l2_ioctl_ops tegra_channel_ioctl_ops = {
 	.vidioc_querycap		= tegra_channel_querycap,
-	.vidioc_g_parm			= tegra_channel_g_parm,
-	.vidioc_s_parm			= tegra_channel_s_parm,
 	.vidioc_enum_framesizes		= tegra_channel_enum_framesizes,
-	.vidioc_enum_frameintervals	= tegra_channel_enum_frameintervals,
 	.vidioc_enum_fmt_vid_cap	= tegra_channel_enum_format,
 	.vidioc_g_fmt_vid_cap		= tegra_channel_get_format,
 	.vidioc_s_fmt_vid_cap		= tegra_channel_set_format,
 	.vidioc_try_fmt_vid_cap		= tegra_channel_try_format,
-	.vidioc_enum_input		= tegra_channel_enum_input,
-	.vidioc_g_input			= tegra_channel_g_input,
-	.vidioc_s_input			= tegra_channel_s_input,
 	.vidioc_reqbufs			= vb2_ioctl_reqbufs,
 	.vidioc_prepare_buf		= vb2_ioctl_prepare_buf,
 	.vidioc_querybuf		= vb2_ioctl_querybuf,
@@ -866,15 +576,6 @@ static const struct v4l2_ioctl_ops tegra_channel_ioctl_ops = {
 	.vidioc_streamoff		= vb2_ioctl_streamoff,
 	.vidioc_subscribe_event		= tegra_channel_subscribe_event,
 	.vidioc_unsubscribe_event	= v4l2_event_unsubscribe,
-	.vidioc_g_selection		= tegra_channel_g_selection,
-	.vidioc_s_selection		= tegra_channel_s_selection,
-	.vidioc_g_edid			= tegra_channel_g_edid,
-	.vidioc_s_edid			= tegra_channel_s_edid,
-	.vidioc_g_dv_timings		= tegra_channel_g_dv_timings,
-	.vidioc_s_dv_timings		= tegra_channel_s_dv_timings,
-	.vidioc_query_dv_timings	= tegra_channel_query_dv_timings,
-	.vidioc_enum_dv_timings		= tegra_channel_enum_dv_timings,
-	.vidioc_dv_timings_cap		= tegra_channel_dv_timings_cap,
 	.vidioc_log_status		= tegra_channel_log_status,
 };
 
-- 
2.53.0

