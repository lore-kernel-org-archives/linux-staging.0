Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795604916;
	b=v3FKc+XBleASpW1t81lnttsDDLUs4ql+I2EBP3ee4MsUct6yYJa6TNXFBl5SkfYEB4xd
	 oh2jTNkLNLIehxOxNU1yANYvfxrHuTmjC5lcSa6qp283NfgiFyZDdLS8MYGlAUUerQ1Ho
	 Oal+leCtymXVL74MdVPUOx22Zh89v0OZjlYuTTwVRPrQH9rgis9bfmbxxyK0n9nB4w8gX
	 ZLb+Wmjv3FzLZb4bSeHbke4vxit/gr9UKMj/ZoHx3YqABR0K28Jc9VkRXuDdPN9Hn2Bal
	 KLttsLjf5xWu0t1U58fpU4AY5Et8SOEQmzz07cWNAJpNy14vFSj+yU5FIaNJ7o356eg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795604916;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=EYa64r4v9WS67AE28HTR6GMnmq7I9DrwDxtBYjX90f0=;
	b=gRmrVyBvQudB9iO/aJxodOklf+TcKGnc261Cqb+WML4grkO06CjJkz7rCAd97XAiTD+5
	 SBYUw4cmQfhyWm0TYaPz5+0ox2StguOrDoOuW5vSFqLL1c4FSYe2xfNLZGpGz5UgjbkK2
	 NXYl34Yesl3UAYcjls7l98HtNjf3eRCuW/avBfPzopKssxCfZRPIvhsUP4pFfSzqVqVaW
	 lOgE4Eohz1dtaXvo5FhQ/yEvqHL7FsvM4V7aRH+++TZRyvNOMyJgru2fRcB81Pjm+4OIn
	 6QPGBymuQGpBWjiGs5/D7bxrqIp4egvq6QU0hrdEfjHvZdIc7z8lpZEauhPAu4mFGiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DpZWSV+w;
	arc=none smtp.remote-ip=209.85.218.43
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 424FA60A2623
	for <linux-staging@lists.linux.dev>; Wed, 25 Nov 2026 11:08:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 424FA60A2623
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DpZWSV+w
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c4d2b741ed9so913874366b.2
        for <linux-staging@lists.linux.dev>; Wed, 25 Nov 2026 03:08:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795604914; x=1796209714; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EYa64r4v9WS67AE28HTR6GMnmq7I9DrwDxtBYjX90f0=;
        b=DpZWSV+wTlLxJ1gK9RzO8in4DVIHHY6fX4boZVFtk77yQEKzCZorqD7Jvg/pdUAi+N
         whqC8ie8Ac4Y0urGFIHehW7kF8eXeU4u4le1mn2PJmMT+ZvzzEfDJ6b7zyq2afg4qciq
         1V6WjU47LamUaUmuQ067oqKlgEHnhacbr4+mKgU5YAKe3gDcM+yV0pdamzbs4dqo3KFj
         dXyyBWG6oasQ/Us/9xH42Z6ZN7osI3cRzpj6owl8HinhpiHC7WNo6Lr/SIkT9RDoXR0A
         OiJombrAfWQH8fQrqb21vt33WXDf66+8U8mZPHPT4TAeZzmF2p8MV3FEoq9Po5Dh6sPB
         5baA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795604914; x=1796209714;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EYa64r4v9WS67AE28HTR6GMnmq7I9DrwDxtBYjX90f0=;
        b=cGq9m1QtNjzzUs+B8c1rFhwpht3DfJ9y/W1ghU3fM57qxeuiS7hgmPoXAdkLefa3/h
         B6GXvCZfkLCMeCEx9Pe9I4XIVrAWCcLn83T5nEbyaOKotWbi9akP8dR75hGMk5gVSAwe
         ndFFH2oDiKN3+FuCQoBw9hmzZfu2qb2sCOADXzC734CvHUo33iL7PTUOGHou8bo74NC9
         I/hBwtXuwYmmVzUvEVYXcYLj8vlH3KPfTYDHrDMBlbk3etQXXhgzPfOsttzqehY1Jda5
         5Vy/ErwBJdn+yXsrOtA5CnoYiWXRV8lTU508lxOTwUNwyWHHYZFLoeegT14G9ZvNw5dI
         jCjQ==
X-Forwarded-Encrypted: i=1; AL+hErF0ajNFUUNJ9f2TiOeQL1l/eCSr1bDqn597vp9oGNV3jTUfXJD8N1USS0E0iQ4JgekLj6ElfH2Us3XYSc4x@lists.linux.dev
X-Gm-Message-State: APuU4Z/v7yixMYxD5SNL0WkdkAqCDJMw/axdE357plGIwETUmT4viWPA
	fhku2J+PRGIrops71QWZkshOp5XKIq9bpF0L5VHf5CAe77ASaqIfSQSDMIMlQA==
X-Gm-Gg: AZFdTZfz06d6zfmzGnkTTOz6M0qwunk/f5ZWtJKF4Gn4dAwfJmSbHxh6XMpS89cB0WL
	jvb1sN1/DiUgp1FGOSpA1dEUVvApNzFMxLTWmq9jVdBCGkLXEfHhguQ9aU8e0TPkIgarLm2Wv5p
	7F+bA/q8Fgit71aLa/qzxF6WWdjc3+tFppSOeDi5TpU6UjeW1OeD05a3hKvkHO+NmsctcOpBGW8
	VMK8g2JiZyrzh+eP+34srgFu5Qf3Hx3ZubikZfL3/g0nIRk5f5qD0SKpuuuf3zyWFAS6bjjufBM
	g+phtBneok88q3b3JHlXiRN7n7ewKMUkHmoDKYHblkAX3ceO1olsQTyl0B6rWQoNIN8UOFIFPgh
	96IBtm39QS78Ffndr/lx1HW7N4UrCGNPWGHmDQ8elYJG6luF7El6pvNRdLzowHu3dibL9/0kz/J
	IMc1DTtn+ES8q4S/hEeYj9GXPLqqXYnaNUDTg58AxxBiwNpmJpoaOIVFsdhld/XgSV1d6Bg2Iq4
	QaavH5cX29l5gIO5ZJGnj0rv/Y3jBIrHW/I9RD7LxNViDmN7OjF0zOZDYHZ0Nyf49d9vALIjmQQ
	FFfi88Tq+eNGwj68LGUpFsyDEdSWPIKS69IFLnQbLvbjtDTm23eIqFiASSPPs+UkoqiqBHtgOEE
	IDtXDD7vMsrzKOBW4jRaqyWHBudbWvkVO
X-Received: by 2002:a17:907:9111:b0:c4d:31c5:cda with SMTP id a640c23a62f3a-c513a8140bdmr1037767666b.21.1795604914542;
        Wed, 25 Nov 2026 03:08:34 -0800 (PST)
Received: from xeon ([188.163.112.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513acfeda1sm654562066b.6.2026.11.25.03.08.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 03:08:33 -0800 (PST)
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
Subject: [PATCH v1 10/13] media: tegra-video: Remove remote source subdev helper
Date: Wed, 25 Nov 2026 13:07:47 +0200
Message-ID: <20261125110750.223628-11-clamor95@gmail.com>
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

Look up the remote source subdevice directly via
media_entity_remote_source_pad_unique() in csi_get_pixel_rate(),
tegra_csi_enable_stream(), and tegra_csi_disable_stream(), allowing
tegra_channel_get_remote_source_subdev() and its subdev hostdata setup in
VI to be removed.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../media/platform/nvidia/tegra-video/csi.c   | 28 ++++++++++++-----
 .../media/platform/nvidia/tegra-video/vi.c    | 30 -------------------
 .../media/platform/nvidia/tegra-video/vi.h    |  2 --
 3 files changed, 21 insertions(+), 39 deletions(-)

diff --git a/drivers/media/platform/nvidia/tegra-video/csi.c b/drivers/media/platform/nvidia/tegra-video/csi.c
index add526de536f9..ab6162720ab78 100644
--- a/drivers/media/platform/nvidia/tegra-video/csi.c
+++ b/drivers/media/platform/nvidia/tegra-video/csi.c
@@ -282,12 +282,17 @@ static int csi_init_state(struct v4l2_subdev *sd,
 
 static unsigned int csi_get_pixel_rate(struct tegra_csi_channel *csi_chan)
 {
-	struct tegra_vi_channel *chan;
+	struct v4l2_subdev *subdev = &csi_chan->subdev;
 	struct v4l2_subdev *src_subdev;
 	struct v4l2_ctrl *ctrl;
+	struct media_pad *pad;
+
+	pad = media_entity_remote_source_pad_unique(&subdev->entity);
+	if (!pad || !is_media_entity_v4l2_subdev(pad->entity))
+		dev_err_probe(csi_chan->csi->dev, -ENODEV,
+			      "failed to get source entity\n");
 
-	chan = v4l2_get_subdev_hostdata(&csi_chan->subdev);
-	src_subdev = tegra_channel_get_remote_source_subdev(chan);
+	src_subdev = media_entity_to_v4l2_subdev(pad->entity);
 	ctrl = v4l2_ctrl_find(src_subdev->ctrl_handler, V4L2_CID_PIXEL_RATE);
 	if (ctrl)
 		return v4l2_ctrl_g_ctrl_int64(ctrl);
@@ -383,6 +388,8 @@ static int tegra_csi_enable_stream(struct v4l2_subdev *subdev)
 
 	if (csi_chan->mipi) {
 		struct v4l2_subdev *src_subdev;
+		struct media_pad *pad;
+
 		/*
 		 * TRM has incorrectly documented to wait for done status from
 		 * calibration logic after CSI interface power on.
@@ -392,9 +399,12 @@ static int tegra_csi_enable_stream(struct v4l2_subdev *subdev)
 		 * CSI subdev stream-on triggers start of MIPI pads calibration.
 		 * Wait for calibration to finish here after sensor subdev stream-on.
 		 */
-		src_subdev = tegra_channel_get_remote_source_subdev(chan);
-		ret = v4l2_subdev_call(src_subdev, video, s_stream, true);
+		pad = media_entity_remote_source_pad_unique(&subdev->entity);
+		if (!pad || !is_media_entity_v4l2_subdev(pad->entity))
+			goto disable_csi_stream;
 
+		src_subdev = media_entity_to_v4l2_subdev(pad->entity);
+		ret = v4l2_subdev_call(src_subdev, video, s_stream, true);
 		if (ret < 0 && ret != -ENOIOCTLCMD)
 			goto disable_csi_stream;
 
@@ -425,7 +435,6 @@ static int tegra_csi_enable_stream(struct v4l2_subdev *subdev)
 
 static int tegra_csi_disable_stream(struct v4l2_subdev *subdev)
 {
-	struct tegra_vi_channel *chan = v4l2_get_subdev_hostdata(subdev);
 	struct tegra_csi_channel *csi_chan = to_csi_chan(subdev);
 	struct tegra_csi *csi = csi_chan->csi;
 	int err;
@@ -436,8 +445,13 @@ static int tegra_csi_disable_stream(struct v4l2_subdev *subdev)
 	 */
 	if (csi_chan->mipi) {
 		struct v4l2_subdev *src_subdev;
+		struct media_pad *pad;
+
+		pad = media_entity_remote_source_pad_unique(&subdev->entity);
+		if (!pad || !is_media_entity_v4l2_subdev(pad->entity))
+			dev_err_probe(csi->dev, err, "failed to get source entity\n");
 
-		src_subdev = tegra_channel_get_remote_source_subdev(chan);
+		src_subdev = media_entity_to_v4l2_subdev(pad->entity);
 		err = v4l2_subdev_call(src_subdev, video, s_stream, false);
 		if (err < 0 && err != -ENOIOCTLCMD)
 			dev_err_probe(csi->dev, err, "source subdev stream off failed\n");
diff --git a/drivers/media/platform/nvidia/tegra-video/vi.c b/drivers/media/platform/nvidia/tegra-video/vi.c
index f2de3aeb05bbc..98411c3f4a037 100644
--- a/drivers/media/platform/nvidia/tegra-video/vi.c
+++ b/drivers/media/platform/nvidia/tegra-video/vi.c
@@ -150,33 +150,6 @@ tegra_channel_get_remote_bridge_subdev(struct tegra_vi_channel *chan)
 	return media_entity_to_v4l2_subdev(pad->entity);
 }
 
-/*
- * Walk up the chain until the initial source (e.g. image sensor)
- */
-struct v4l2_subdev *
-tegra_channel_get_remote_source_subdev(struct tegra_vi_channel *chan)
-{
-	struct media_pad *pad;
-	struct v4l2_subdev *subdev;
-	struct media_entity *entity;
-
-	subdev = tegra_channel_get_remote_bridge_subdev(chan);
-	if (!subdev)
-		return NULL;
-
-	pad = &subdev->entity.pads[0];
-	while (!(pad->flags & MEDIA_PAD_FL_SOURCE)) {
-		pad = media_pad_remote_pad_first(pad);
-		if (!pad || !is_media_entity_v4l2_subdev(pad->entity))
-			break;
-		entity = pad->entity;
-		pad = &entity->pads[0];
-		subdev = media_entity_to_v4l2_subdev(entity);
-	}
-
-	return subdev;
-}
-
 static int tegra_channel_enable_stream(struct tegra_vi_channel *chan)
 {
 	struct v4l2_subdev *subdev;
@@ -1134,9 +1107,6 @@ static int tegra_vi_graph_notify_complete(struct v4l2_async_notifier *notifier)
 
 	v4l2_set_subdev_hostdata(subdev, chan);
 
-	subdev = tegra_channel_get_remote_source_subdev(chan);
-	v4l2_set_subdev_hostdata(subdev, chan);
-
 	return v4l2_device_register_subdev_nodes(&vid->v4l2_dev);
 
 unregister_video:
diff --git a/drivers/media/platform/nvidia/tegra-video/vi.h b/drivers/media/platform/nvidia/tegra-video/vi.h
index fb377d428d510..44893c5c6e651 100644
--- a/drivers/media/platform/nvidia/tegra-video/vi.h
+++ b/drivers/media/platform/nvidia/tegra-video/vi.h
@@ -300,8 +300,6 @@ extern const struct tegra_vi_soc tegra210_vi_soc;
 
 struct v4l2_subdev *
 tegra_channel_get_remote_csi_subdev(struct tegra_vi_channel *chan);
-struct v4l2_subdev *
-tegra_channel_get_remote_source_subdev(struct tegra_vi_channel *chan);
 int tegra_channel_set_stream(struct tegra_vi_channel *chan, bool on);
 void tegra_channel_release_buffers(struct tegra_vi_channel *chan,
 				   enum vb2_buffer_state state);
-- 
2.53.0

