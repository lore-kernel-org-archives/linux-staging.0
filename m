Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795604919;
	b=rRCRYiq0O0zmQtA+LYVDXoVNONMgwggVB2tWF1r8UsIZq6QV2kPjd7kIyVUgBRZnuf3p
	 sJSBz1OIrBz79Bl7LhvRz2vu9W1ZoARksdvnce8I9GEey4TAepRFKQLRHTF+VsuAsD0Kc
	 fmv5edCkJNx6tJgr7uB1eLUC+0Rnok71cpwLOlVo2QnIrimKcg6Z259EcTc48ikfFdmh4
	 6mix2T7attBiJqAexCfnGJ5Yxwzbf8b0ABILt6BtMvXMim589VtPTz8ehOOeop/2vQJRi
	 txgYHd3hZWO7zD6g6ys1LZFIVMxZgY+55thNVaBLErW4Qgqo1JwbUxrX7lTy3rxLUGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795604919;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=5DO0x7sKjKjbUoxBHjrsjRS6Z9YOvewyvxNNPFbGyv0=;
	b=x54LsGhr9VZfjCbhVqsU1OCisiNkYa3RauC18570nh5KBHp4CE6OX1F2NTdUMdqQ29Qf
	 CONgCj0iHUFjQb/5e2Y0VibSl7ZZW/7+UvdDP1eqWqxDa5qd22zUjbReKAWgSmz6Uw9ip
	 pDxPM6xfnKF6LJ1DgAsc14Dlw+ipF+Y3mnIlobVls7TzRL3Ty2W4lfkxq9r8B5/jtIFO1
	 cdP3ak/QlXCLMca/r2oMmFv0M9mU0gCCPe37b4EAEqYasp0gRyy3OKj3wV2Sms2fuG+Yj
	 S+WaJ64PfptS90zuqOOeTqSByaVKiLtdtGOqtlIjkENJNjJsuRzojbKmbPJey+m3tKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=D+1GtVuH;
	arc=none smtp.remote-ip=209.85.218.53
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BF0860A262A
	for <linux-staging@lists.linux.dev>; Wed, 25 Nov 2026 11:08:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2BF0860A262A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=D+1GtVuH
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c516a1623d0so548366766b.2
        for <linux-staging@lists.linux.dev>; Wed, 25 Nov 2026 03:08:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795604917; x=1796209717; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5DO0x7sKjKjbUoxBHjrsjRS6Z9YOvewyvxNNPFbGyv0=;
        b=D+1GtVuHOrJoZcvJLARczNkc+6+St9+NBb8sqWpGHwGyQ40yYDB2ns4ZBC0vqv9/bv
         Lhfw2y+0N5gM4Xp86t00pn5LZHsbgRthGKiP0k3vPlJZLNqN2FgmUDj009RLGXEm/R/r
         ql9A7rdZeM6Aq9AP/sNlawf6uqk48QZXlExUx62nmFs24j5YqWONLWHIZrCei56hoiQV
         TgblHcayTnq0cgMCwFGYzml798aDj7JTNscQ0sYgTRBQO8NqQquIkodktHZ2Zy41tMxs
         qrCJkT2iBesuU3vwkv6sFqnU8uvaOJ0m1xwCFmf3Mf2Ve62DYMHR6nC+wIKo3X9Dz9Tc
         kDcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795604917; x=1796209717;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5DO0x7sKjKjbUoxBHjrsjRS6Z9YOvewyvxNNPFbGyv0=;
        b=drUS6UqvkPiqp+bMBTBc88T/apl8p8Yj4i1qc/t7eFao0N8BgizpgO2SVjoRNn75ip
         fnsS4utaneEGPj6vkVacv+DqFv+zD/YWU/lDBiZpDL46u6iRPdWVcvuLWithL6b+tDuU
         LdPh4uARaTtuhjz0+mVGY/qFJS6bmDx9/ZW6zlYEOJ0OWGTnZsibJZzS4VvvIw6kPshZ
         mohpcaIx4bSu6JrJ/V+7KCVjDKFGnmc6EDbNTe9q0Vd3V1nAsyy3oVD1I749hOBfm/sh
         dAGGgLPOD/La6Uo4+iphDhqpIqTi347Mhl+Hk1BWZ1nOkklHVPYXRilkGNCIhApvAWlE
         uKrg==
X-Forwarded-Encrypted: i=1; AL+hErF2tHcMQxCh/3JaP8RMbWEzCGqxginkvDnwl43Whlnvs4e1/3Wmohlk0PGTm3jsGWdLm6biugZ+JeX7K9dv@lists.linux.dev
X-Gm-Message-State: APuU4Z+D/IDgwaNAG8eRO8flNIZGgHn1Mb1+9Bfg33MkZKQPJR1bY+Oh
	nlKiF+8ZD85NFiGm/+JfesUYlzQGMPXud5HS/EdYqz/MJ5VON8LhzqDt
X-Gm-Gg: AZFdTZdherh5fimWjUI4blTxZc0oAh06OYQhKw0YU5fkMmEurLONVHfjtZYVHDe8+4I
	yG68lADqz2IU4H3gZVwdYQtdAj5TJ4dTcgKFTD5mNdong29Fsa0m32wnnfb4zyq3nCQ68OxFhbi
	Cz/FYYWZFh9ooUbYmYrJU06/yfluaS+GvMYX0azoMMJLcoQBRP90TqNWChdgPsB6I8JtVSTC7fZ
	4HJE+rhnfXGcqQrMbnyAJ35x0BHtios8geX8xHCVzLN9BinCfkC+gB7VLs86qPUTYLTgR/p2sOl
	CbrwDQJCKlJVJEUhlM+zRd3dFWV8zCnZcGD++nUxl3TFd4tvLsq2N66L7YKDI9AlyLt2D5UHhky
	ldjQrtrvOuR/mn3IWta9OAii7cYnZ+kLbDuzkDXnYEUZ68EltnER9WYD4eVlQUh8hxtm/4kXPs7
	O861ccnrmiYS3xunxQf9l7wF9GGbOqWweY2pd4fvY6AmKF33oovB9jhe7OJDHgwdnI+9CEisavE
	zg0UgyHacGsw6pmC8X0vVy4oK05V7cHc1c40ZTI/fWn76X9uvj88cHNrQCCbWST6vv5vlWNVyLZ
	fV7WL8UbDgnImXoyNpJvVXIF/JJfyzLjYo39XVnvzybn2/v5lfdK2ic05K2u+EWiecgVPnhRTIq
	03jO63Xjm/w==
X-Received: by 2002:a17:907:940a:b0:c33:dbe8:291c with SMTP id a640c23a62f3a-c513a807be9mr1670811966b.20.1795604917491;
        Wed, 25 Nov 2026 03:08:37 -0800 (PST)
Received: from xeon ([188.163.112.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513acfeda1sm654562066b.6.2026.11.25.03.08.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 03:08:36 -0800 (PST)
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
Subject: [PATCH v1 12/13] media: tegra-video: csi: Add pad and media operations for own CSI channels
Date: Wed, 25 Nov 2026 13:07:49 +0200
Message-ID: <20261125110750.223628-13-clamor95@gmail.com>
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

Implement pad format enumeration, format negotiation clamped to SoC
limits via vi_fmt_align(), subdevice state initialization across sink and
source pads, and v4l2_subdev_link_validate() for CSI bridge channels
when TPG mode is disabled.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../media/platform/nvidia/tegra-video/csi.c   | 154 +++++++++++++++++-
 1 file changed, 152 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/nvidia/tegra-video/csi.c b/drivers/media/platform/nvidia/tegra-video/csi.c
index fb6608e0f632d..aaab884d99f54 100644
--- a/drivers/media/platform/nvidia/tegra-video/csi.c
+++ b/drivers/media/platform/nvidia/tegra-video/csi.c
@@ -322,6 +322,138 @@ void tegra_csi_calc_settle_time(struct tegra_csi_channel *csi_chan,
 				   / (2 * pix_clk_mhz) - 5000) / 1000;
 }
 
+/*
+ * Proper CSI configuration
+ */
+
+enum tegra_csi_bridge_pad {
+	TEGRA_CSI_PAD_SINK = 0,
+	TEGRA_CSI_PAD_SOURCE = 1,
+	TEGRA_CSI_NUM_PADS,
+};
+
+static const u32 tegra_csi_mbus_formats[] = {
+	/* RAW 8 */
+	MEDIA_BUS_FMT_SGBRG8_1X8,
+	MEDIA_BUS_FMT_SBGGR8_1X8,
+	MEDIA_BUS_FMT_SRGGB8_1X8,
+	MEDIA_BUS_FMT_SGRBG8_1X8,
+	/* RAW 10 */
+	MEDIA_BUS_FMT_SGBRG10_1X10,
+	MEDIA_BUS_FMT_SBGGR10_1X10,
+	MEDIA_BUS_FMT_SRGGB10_1X10,
+	MEDIA_BUS_FMT_SGRBG10_1X10,
+	/* RAW 12 */
+	MEDIA_BUS_FMT_SGBRG12_1X12,
+	MEDIA_BUS_FMT_SBGGR12_1X12,
+	MEDIA_BUS_FMT_SRGGB12_1X12,
+	MEDIA_BUS_FMT_SGRBG12_1X12,
+	/* RGB888 */
+	MEDIA_BUS_FMT_RGB888_1X24,
+	MEDIA_BUS_FMT_RGB888_1X32_PADHI,
+	/* YUV422 */
+	MEDIA_BUS_FMT_UYVY8_1X16,
+	MEDIA_BUS_FMT_VYUY8_1X16,
+	MEDIA_BUS_FMT_YUYV8_1X16,
+	MEDIA_BUS_FMT_YVYU8_1X16,
+};
+
+static u32 tegra_csi_get_format_code(u32 code)
+{
+	u32 i;
+
+	for (i = 0; i < ARRAY_SIZE(tegra_csi_mbus_formats); i++)
+		if (tegra_csi_mbus_formats[i] == code)
+			break;
+
+	if (i >= ARRAY_SIZE(tegra_csi_mbus_formats))
+		return MEDIA_BUS_FMT_SRGGB10_1X10;
+
+	return tegra_csi_mbus_formats[i];
+}
+
+/*
+ * V4L2 Subdevice Operations
+ */
+static int tegra_csi_enum_bus_code(struct v4l2_subdev *subdev,
+				   struct v4l2_subdev_state *state,
+				   struct v4l2_subdev_mbus_code_enum *code)
+{
+	if (code->pad == TEGRA_CSI_PAD_SOURCE) {
+		const struct v4l2_mbus_framefmt *sink_fmt;
+
+		if (code->index)
+			return -EINVAL;
+
+		sink_fmt = v4l2_subdev_state_get_format(state,
+							TEGRA_CSI_PAD_SINK);
+		code->code = sink_fmt->code;
+
+		return 0;
+	}
+
+	code->code = tegra_csi_get_format_code(code->index);
+
+	return 0;
+}
+
+static int tegra_csi_set_format(struct v4l2_subdev *subdev,
+				const struct v4l2_subdev_client_info *ci,
+				struct v4l2_subdev_state *state,
+				struct v4l2_subdev_format *format)
+{
+	struct tegra_vi_channel *chan = v4l2_get_subdev_hostdata(subdev);
+	struct v4l2_mbus_framefmt *mbus_fmt = &format->format;
+	struct v4l2_mbus_framefmt *sink_fmt, *src_fmt;
+	struct v4l2_frmsize_stepwise stepwise = { };
+	struct tegra_vi *vi = chan->vi;
+
+	/* The format on the source pad always matches the sink pad. */
+	if (format->pad == TEGRA_CSI_PAD_SOURCE)
+		return v4l2_subdev_get_fmt(subdev, state, format);
+
+	sink_fmt = v4l2_subdev_state_get_format(state, TEGRA_CSI_PAD_SINK);
+	src_fmt = v4l2_subdev_state_get_format(state, TEGRA_CSI_PAD_SOURCE);
+	if (!sink_fmt || !src_fmt)
+		return -EINVAL;
+
+	mbus_fmt->code = tegra_csi_get_format_code(mbus_fmt->code);
+	mbus_fmt->field = V4L2_FIELD_NONE;
+
+	/*
+	 * CSI and VI have same size restrictions but they are SoC specific.
+	 * Use VI operation to get them.
+	 */
+	vi->ops->vi_fmt_align(NULL, &stepwise, 0);
+
+	mbus_fmt->width = clamp_t(u32, mbus_fmt->width, stepwise.min_width,
+				  stepwise.max_width);
+	mbus_fmt->height = clamp_t(u32, mbus_fmt->height, stepwise.min_height,
+				   stepwise.max_height);
+
+	*sink_fmt = *mbus_fmt;
+	*src_fmt = *mbus_fmt;
+
+	return 0;
+}
+
+static int tegra_csi_init_state(struct v4l2_subdev *subdev,
+				struct v4l2_subdev_state *state)
+{
+	struct tegra_csi_channel *chan = to_csi_chan(subdev);
+	struct v4l2_mbus_framefmt *fmt[TEGRA_CSI_NUM_PADS];
+
+	for (int i = 0; i < chan->numpads; i++) {
+		fmt[i] = v4l2_subdev_state_get_format(state, i);
+		if (!fmt[i])
+			continue;
+
+		*fmt[i] = chan->format;
+	}
+
+	return 0;
+}
+
 static int tegra_csi_enable_stream(struct v4l2_subdev *subdev)
 {
 	struct tegra_vi_channel *chan = v4l2_get_subdev_hostdata(subdev);
@@ -483,6 +615,12 @@ static const struct v4l2_subdev_pad_ops tegra_csi_tpg_pad_ops = {
 	.set_frame_interval = tegra_csi_tpg_set_frame_interval,
 };
 
+static const struct v4l2_subdev_pad_ops tegra_csi_pad_ops = {
+	.enum_mbus_code = tegra_csi_enum_bus_code,
+	.get_fmt = v4l2_subdev_get_fmt,
+	.set_fmt = tegra_csi_set_format,
+};
+
 static const struct v4l2_subdev_ops tegra_csi_tpg_ops = {
 	.video = &tegra_csi_video_ops,
 	.pad = &tegra_csi_tpg_pad_ops,
@@ -490,12 +628,21 @@ static const struct v4l2_subdev_ops tegra_csi_tpg_ops = {
 
 static const struct v4l2_subdev_ops tegra_csi_ops = {
 	.video = &tegra_csi_video_ops,
+	.pad = &tegra_csi_pad_ops,
 };
 
 static const struct v4l2_subdev_internal_ops tegra_csi_tpg_internal_ops = {
 	.init_state = tegra_csi_tpg_init_state,
 };
 
+static const struct v4l2_subdev_internal_ops tegra_csi_internal_ops = {
+	.init_state = tegra_csi_init_state,
+};
+
+static const struct media_entity_operations tegra_csi_media_ops = {
+	.link_validate = v4l2_subdev_link_validate,
+};
+
 struct v4l2_subdev *tegra_channel_get_remote_csi_subdev(struct tegra_vi_channel *chan)
 {
 	struct media_pad *pad;
@@ -544,8 +691,8 @@ static int tegra_csi_channel_alloc(struct tegra_csi *csi,
 	chan->of_node = of_node_get(node);
 	chan->numpads = num_pads;
 	if (num_pads & 0x2) {
-		chan->pads[0].flags = MEDIA_PAD_FL_SINK;
-		chan->pads[1].flags = MEDIA_PAD_FL_SOURCE;
+		chan->pads[TEGRA_CSI_PAD_SINK].flags = MEDIA_PAD_FL_SINK;
+		chan->pads[TEGRA_CSI_PAD_SOURCE].flags = MEDIA_PAD_FL_SOURCE;
 	} else {
 		chan->pads[0].flags = MEDIA_PAD_FL_SOURCE;
 	}
@@ -676,6 +823,8 @@ static int tegra_csi_channel_init(struct tegra_csi_channel *chan)
 		snprintf(subdev->name, sizeof(subdev->name), "%s-%d", "tpg",
 			 chan->csi_port_nums[0]);
 	} else {
+		v4l2_subdev_init(subdev, &tegra_csi_ops);
+		subdev->internal_ops = &tegra_csi_internal_ops;
 		snprintf(subdev->name, sizeof(subdev->name), "%s",
 			 kbasename(chan->of_node->full_name));
 	}
@@ -684,6 +833,7 @@ static int tegra_csi_channel_init(struct tegra_csi_channel *chan)
 	v4l2_set_subdevdata(subdev, chan);
 	subdev->fwnode = of_fwnode_handle(chan->of_node);
 	subdev->entity.function = MEDIA_ENT_F_VID_IF_BRIDGE;
+	subdev->entity.ops = &tegra_csi_media_ops;
 	subdev->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
 
 	/* initialize media entity pads */
-- 
2.53.0

