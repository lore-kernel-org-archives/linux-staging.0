Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795604920;
	b=uSk5ZZJ1JFI1RuNFsj0SFPlZ+8yLrRlJ6ncDOqnAZ1yG6IKrZBlt5tRcWivSDVyxI+bf
	 W0FaiQH1+SlfFFE2ZgIDVW9hIvPX6OG/tSQZzP8zT955XBV171Koi/69fa/7XjKNvYh12
	 Sgic+QQZBNyrw+vMtbd+LmO0OpPmWXVDyN+b5hB0H7jVdvHiic2B8qFnxQ0Xt4fI2jfVv
	 g8ls/Boi71fjsxq3Himcd6gk4EjlBgmZZLsep+OE/+Utu9wL6Nv9063QlcY1RZhzdJr8Z
	 kaT4xWYt+Fo89fSInEQawL3tERk1jyHqOJJ19pDw9PQw13RCayF459qwl20vvu/kt2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795604920;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=NM1ahoT0Xghla9vcxTFJwnAsEHzEgH5Nw3CBVxZQulg=;
	b=QN70RUlLNtx/pcwiVu4bf5M8zdcIehLVTb4hoo/ZM2pVRJzoJoeJdLsQhcqdDbZrjeju
	 d64JkmbUZCDHIQYRU0sJhYc9aCBvIu52uwS3EvmTHODCwd5e0eMWubm/cqANbnLgEN8aa
	 oTu0D2qBs7MT7RC1+AvpnZU0cRc5ifPEI7mBpBKc8IXJWrqSMmTQuD6bBhS+2QSJdmxZ6
	 ScU0QtbUTRnCdkG86iXBwGid+eCcziqL289Nkj/0M81gYMJR2GOXQ59bveaNwG4JnpRcz
	 MbJpFTNYK5Vt87mRMWeOAoSa8g1TObOMlYPq/FFjvimaxQU7owJuQX+NPXEzPUuq3eQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iA9FiFbr;
	arc=none smtp.remote-ip=209.85.218.52
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89C7D60A263F
	for <linux-staging@lists.linux.dev>; Wed, 25 Nov 2026 11:08:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 89C7D60A263F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iA9FiFbr
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c4d427836e9so763919066b.1
        for <linux-staging@lists.linux.dev>; Wed, 25 Nov 2026 03:08:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795604919; x=1796209719; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NM1ahoT0Xghla9vcxTFJwnAsEHzEgH5Nw3CBVxZQulg=;
        b=iA9FiFbrypXu5OxTHvn/de8l+z+P2Qi4YEKUeqoWojea6RTj62L2wXiMJnrfhUuVaW
         iLP5322KO3xmZWzPovShvEI6W+ycgRSsEiVQ7+Nql/YSkrrIFOxh6W4KSXHLO2Zk//L6
         6WpN26aR24ibVjZQWdUx8DCwMCeo8qEzPtbn7d3SOAarpwscwD+piAiqGRxAKWsLjSmp
         ZCkVw9w6GNZon7Uvhc0fwxuIDtJawJZorONJG2E5p+jqMvZYkrDceeZ2kwWqwBiGCCEx
         HQt2y3jhiFpNiGQ1Pnk8Lo/1MFESDsrJHF2uH2YkBt88eqWlydnPD4T3WC8Old1uLLwl
         HEPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795604919; x=1796209719;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NM1ahoT0Xghla9vcxTFJwnAsEHzEgH5Nw3CBVxZQulg=;
        b=rfZLLoG7CW6ReWGNXt+gh6FzVvVUy0ij1r6FyFO1fD5GOOxO70YJWx3JOhdkU86sRE
         I0XGuSf3xi83HDWJbjnNDy33ZzzmBxjv12qeW5OVQPzj2TGaq7BuuOD7chS3s+sdX9kh
         9XlS5xboMS3tx/olRsmShPAsYmf+jVigPa58hVNcyPIC3VAF+hUfrsY13a37Hlf+2gbe
         ACT0ezVHVnKjgeNZ3tQEroQiBOIyJp4X4l5WpbN3dYg2XyVvRaA33sW7JYX47Fw+GK0F
         twnqGMJhhgVDHURqDGJiWUgmsEgT852Gnud3pae12bBZqmtphLrSPzPL7Jm9W9DiitaK
         fGsA==
X-Forwarded-Encrypted: i=1; AL+hErHaBPUlBH54TLDs8ImeICBuLEhAoF/hSk6IPH5xIAntX7BvQeLfUo9XPXqGijEjrK2u59b26FmMMXvmTCFp@lists.linux.dev
X-Gm-Message-State: APuU4Z+DLbcVppE5/vCO4DpOj3Xz88SjpLskHmw+9tTieCe4kUht9ikv
	bOBIWGoumIxBArkR0Bcq1kzOG7ql6tB7g9KgnqGl3mE9CZlXUBeWQJjJ
X-Gm-Gg: AZFdTZcdAaVmR/zna/dJ8uD8/o8Fs3QlQtNhIHYBubmokqUjWzmzc0ngQ1QurFNfdeR
	FEV93E1YTa3a0cj3euxrJBbaMiRzpEnVJkeUZ0yngVpt0HleW56unoy1wDt4HmVkdd80euaQSlX
	J1zy7QI9GsbYsjVZ4WDEe47rY93Z10fDFh9Snp4mvrmHVrS6WSrR2m7L0DcC/fvR6TIJ+6HeWza
	Y7GTSLGwpb1inHgE+z6eT4hVAYIhlXhuV2qvpEEKu7KWA+NWngDA1vTPSuM3W0xeEC+c9fF8aHu
	G0ticha8vzmFCPiy/S7ovUsDx+U9PVzH5D1tCX6lyOxWXXp/tk0sIDrde/MjckTxJjw0/pSUpyb
	XECOC+TPl4vyDJ+DRNC9TE86HZQvt1MORenUF0NklOuKNMqlTHiNO61N8lB8/BYk9b1VtIsBQJC
	mrn9Xu6kDBcxzdTCDde3pHIX60CG/luhhbGmXgFOWPGtldpO2h4Rc92/lAEnHMbJJVu5FVNHDTs
	UF3xlaIL6G06LFTs65i6SudPfTPVYpN/v4SVheaOOm4yO1Otn/P0dR7YUMUOPzGjeimuL4LhKMO
	gYkjRm787/GsfjloOpSqN1sJP+dimfHAelWs5xa1fbx4MV+pfMGeZ9Z93tFU8h7yOk4QWv+iOwp
	rdVV8h5Pnuw==
X-Received: by 2002:a17:907:3dab:b0:c4d:212a:192a with SMTP id a640c23a62f3a-c51a2a75817mr234496566b.48.1795604918938;
        Wed, 25 Nov 2026 03:08:38 -0800 (PST)
Received: from xeon ([188.163.112.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513acfeda1sm654562066b.6.2026.11.25.03.08.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 03:08:38 -0800 (PST)
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
Subject: [PATCH v1 13/13] media: tegra-video: vip: Add pad and media operations for VIP subdev
Date: Wed, 25 Nov 2026 13:07:50 +0200
Message-ID: <20261125110750.223628-14-clamor95@gmail.com>
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

Implement pad media bus format enumeration and format setting clamped to
SoC limits via vi_fmt_align(), and attach v4l2_subdev_link_validate()
to the VIP subdevice entity operations.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../media/platform/nvidia/tegra-video/vip.c   | 101 +++++++++++++++++-
 1 file changed, 100 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/nvidia/tegra-video/vip.c b/drivers/media/platform/nvidia/tegra-video/vip.c
index 040776775aacc..969966f3227f2 100644
--- a/drivers/media/platform/nvidia/tegra-video/vip.c
+++ b/drivers/media/platform/nvidia/tegra-video/vip.c
@@ -21,6 +21,14 @@
 #include "vip.h"
 #include "video.h"
 
+static const u32 tegra_vip_mbus_formats[] = {
+	/* YUV422 */
+	MEDIA_BUS_FMT_UYVY8_2X8,
+	MEDIA_BUS_FMT_VYUY8_2X8,
+	MEDIA_BUS_FMT_YUYV8_2X8,
+	MEDIA_BUS_FMT_YVYU8_2X8,
+};
+
 static inline struct tegra_vip *host1x_client_to_vip(struct host1x_client *client)
 {
 	return container_of(client, struct tegra_vip, client);
@@ -48,6 +56,85 @@ static struct v4l2_subdev *tegra_vip_channel_get_prev_subdev(struct tegra_vip_ch
 	return media_entity_to_v4l2_subdev(remote_pad->entity);
 }
 
+static u32 tegra_vip_get_format_code(u32 code)
+{
+	u32 i;
+
+	for (i = 0; i < ARRAY_SIZE(tegra_vip_mbus_formats); i++)
+		if (tegra_vip_mbus_formats[i] == code)
+			break;
+
+	if (i >= ARRAY_SIZE(tegra_vip_mbus_formats))
+		i = 0;
+
+	return tegra_vip_mbus_formats[i];
+}
+
+/*
+ * V4L2 Subdevice Operations
+ */
+static int tegra_vip_enum_bus_code(struct v4l2_subdev *subdev,
+				   struct v4l2_subdev_state *state,
+				   struct v4l2_subdev_mbus_code_enum *code)
+{
+	if (code->pad == TEGRA_VIP_PAD_SOURCE) {
+		const struct v4l2_mbus_framefmt *sink_fmt;
+
+		if (code->index)
+			return -EINVAL;
+
+		sink_fmt = v4l2_subdev_state_get_format(state,
+							TEGRA_VIP_PAD_SINK);
+		code->code = sink_fmt->code;
+
+		return 0;
+	}
+
+	code->code = tegra_vip_get_format_code(code->index);
+
+	return 0;
+}
+
+static int tegra_vip_set_format(struct v4l2_subdev *subdev,
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
+	if (format->pad == TEGRA_VIP_PAD_SOURCE)
+		return v4l2_subdev_get_fmt(subdev, state, format);
+
+	sink_fmt = v4l2_subdev_state_get_format(state, TEGRA_VIP_PAD_SINK);
+	src_fmt = v4l2_subdev_state_get_format(state, TEGRA_VIP_PAD_SOURCE);
+	if (!sink_fmt || !src_fmt)
+		return -EINVAL;
+
+	mbus_fmt->code = tegra_vip_get_format_code(mbus_fmt->code);
+	mbus_fmt->field = V4L2_FIELD_NONE;
+
+	/*
+	 * VIP and VI have same size restrictions but they are SoC specific.
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
 static int tegra_vip_enable_stream(struct v4l2_subdev *subdev)
 {
 	struct tegra_vip_channel *vip_chan = subdev_to_vip_channel(subdev);
@@ -104,8 +191,19 @@ static const struct v4l2_subdev_video_ops tegra_vip_video_ops = {
 	.s_stream = tegra_vip_s_stream,
 };
 
+static const struct v4l2_subdev_pad_ops tegra_vip_pad_ops = {
+	.enum_mbus_code = tegra_vip_enum_bus_code,
+	.get_fmt = v4l2_subdev_get_fmt,
+	.set_fmt = tegra_vip_set_format,
+};
+
 static const struct v4l2_subdev_ops tegra_vip_ops = {
-	.video  = &tegra_vip_video_ops,
+	.video = &tegra_vip_video_ops,
+	.pad = &tegra_vip_pad_ops,
+};
+
+static const struct media_entity_operations tegra_vip_media_ops = {
+	.link_validate = v4l2_subdev_link_validate,
 };
 
 static int tegra_vip_channel_of_parse(struct tegra_vip *vip)
@@ -165,6 +263,7 @@ static int tegra_vip_channel_init(struct tegra_vip *vip)
 	v4l2_set_subdevdata(subdev, &vip->chan);
 	subdev->fwnode = of_fwnode_handle(vip->chan.of_node);
 	subdev->entity.function = MEDIA_ENT_F_VID_IF_BRIDGE;
+	subdev->entity.ops = &tegra_vip_media_ops;
 	subdev->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
 
 	err = media_entity_pads_init(&subdev->entity, TEGRA_VIP_PADS_NUM, vip->chan.pads);
-- 
2.53.0

