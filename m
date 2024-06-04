Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAE0713F449
	for <linux-staging@lists.linux.dev>; Tue,  4 Jun 2024 05:15:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717478145; cv=none; b=YvhUrM24d1tcZhUeU7/NttUlhal83L5m7mgXwcLpd3jgNsuzdmtihEV5Zb6IKns7wnQ0sNJPf2KN3XSu/xPO/0xVIpbQd1KpsoaWyS+FllYRuSecAoYEujy54kTrKtmqh25ny3rv/+sBpJumdCIQBMilk8naj2YFqVGqWkfU+ws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717478145; c=relaxed/simple;
	bh=DEfGGNbbf6mS0MilM1GKmovkDe2QE6KoBd+BZ/dvfkE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=FEbhgx5QoDxUDgTbPF7+A93zBWFk1WULGvH1QnwkDZyLfJN8pkLa38sx62R7oZ4/D3vEvJeL8goqvEED7XEH7jNITgWSahjU+TpmQta5eyYtjw/DrKmONxXo6XHIpuW/w8ZvfPfcuqerkj7HSteWvRQCQHNmHLhsUawGnvfxMOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=glWjvFt2; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="glWjvFt2"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-57a32b0211aso558558a12.2
        for <linux-staging@lists.linux.dev>; Mon, 03 Jun 2024 22:15:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717478141; x=1718082941; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8SJccidjsLYGh4yEPOhnunVr6ljOJkGUx3ObCldCrBM=;
        b=glWjvFt2KQtj18SZSdC9zpXuz9V0sr1oAfJDV4hVj7s5HLDOo8xlZYt1Wu2pq9qLfc
         w2BrpF23j+jg1Z83xFV0Y5a3zZBMHMHKbPHc/PgDeQ7yWd2IEnF9KFcbB+ahbIf7F4/T
         RpY2gYsj+b83p8GC5dxutC6qD4afeKiZL0exQoKBwZoUTeVrOlRg9kXOGDsNRtBA+EDJ
         sO8JYVQ3NuEqthH//fdOOFeN7c+Hkb4ep2ISam6o093/1Acq5+zWlv8or7iOpBVYMe4G
         RaOIumPtcm+lHqext5v+8tD47KMXeoDFf2kXuCGxzX9LFU3vLXZ26J4ATkxb/iPFPGdF
         iNNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717478141; x=1718082941;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8SJccidjsLYGh4yEPOhnunVr6ljOJkGUx3ObCldCrBM=;
        b=jajd8o3HS5XdS7Bhik06MN+GCDHqii9Anqm3hqhQ/P/LuxLWJzVmKYOn5a+qVBZgVn
         gmqVSZEfHJ71nJJW2Dx+6/OMEHDtfcSLLtQiHnHd9gjyCVCtNQuJEjvfa/MxHYPrqhsv
         AgNYZD/238QAemZ3sNfcJwmEi6If04n9Aaw3ESOoxiAa93FyoOWBVoFaCEz8UT+yVBg7
         n3jT4whx59m4aj6IlPWrfH/yEHurxZ1dpw3LRjwYedi8mNKLwmVr6bnMrnSveYwHZETv
         YK9rwxUS/XCw2me0VsPX9q0vFS/4PEXnMnlnw+DMucO3amZ7/MNXTj7oUYfLL6fc7W79
         3NGg==
X-Forwarded-Encrypted: i=1; AJvYcCXttCZFv8jsDtCEHp9y2zh6qBZy+3M+6/+ciheAsfzOW2z/fcwnqjM2K7R+swb/SflX/+HmXePUb3VRvgKCfTojSsSGwOJ02iaMSpuKMA==
X-Gm-Message-State: AOJu0Yxr8jsSSlo7bV1c/RllaUt79XK57M00OfIAHxYA5m7FLoLSoCUR
	wH4E11Ahw/XfUab5MTPeJ4E22N8TUyq3U0NsEq7kXjNZNaXtzg7d
X-Google-Smtp-Source: AGHT+IGZ8TPHTibom2cLxGJgP0J5h41ltwlDrg51oTsOx+WeTH4ROT9lb8ZKceTCPjvT/pMzBjeQoQ==
X-Received: by 2002:a17:906:3718:b0:a68:cf22:ebdb with SMTP id a640c23a62f3a-a68cf22ee12mr383305766b.43.1717478140978;
        Mon, 03 Jun 2024 22:15:40 -0700 (PDT)
Received: from toolbox.. ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a68afbaac03sm451896566b.149.2024.06.03.22.15.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jun 2024 22:15:40 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-media@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Christian Hewitt <christianshewitt@gmail.com>
Subject: [PATCH 2/2] media: meson: vdec: add GXLX SoC platform
Date: Tue,  4 Jun 2024 05:15:33 +0000
Message-Id: <20240604051533.3312944-2-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240604051533.3312944-1-christianshewitt@gmail.com>
References: <20240604051533.3312944-1-christianshewitt@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the GXLX SoC platform which is based on GXL but omits the VP9 codec.

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 drivers/staging/media/meson/vdec/vdec.c       |  2 +
 .../staging/media/meson/vdec/vdec_platform.c  | 44 +++++++++++++++++++
 .../staging/media/meson/vdec/vdec_platform.h  |  2 +
 3 files changed, 48 insertions(+)

diff --git a/drivers/staging/media/meson/vdec/vdec.c b/drivers/staging/media/meson/vdec/vdec.c
index de3e0345ab7c..5e5b296f93ba 100644
--- a/drivers/staging/media/meson/vdec/vdec.c
+++ b/drivers/staging/media/meson/vdec/vdec.c
@@ -982,6 +982,8 @@ static const struct of_device_id vdec_dt_match[] = {
 	  .data = &vdec_platform_gxm },
 	{ .compatible = "amlogic,gxl-vdec",
 	  .data = &vdec_platform_gxl },
+	{ .compatible = "amlogic,gxlx-vdec",
+	  .data = &vdec_platform_gxlx },
 	{ .compatible = "amlogic,g12a-vdec",
 	  .data = &vdec_platform_g12a },
 	{ .compatible = "amlogic,sm1-vdec",
diff --git a/drivers/staging/media/meson/vdec/vdec_platform.c b/drivers/staging/media/meson/vdec/vdec_platform.c
index 70c9fd7c8bc5..66bb307db85a 100644
--- a/drivers/staging/media/meson/vdec/vdec_platform.c
+++ b/drivers/staging/media/meson/vdec/vdec_platform.c
@@ -101,6 +101,44 @@ static const struct amvdec_format vdec_formats_gxl[] = {
 	},
 };
 
+static const struct amvdec_format vdec_formats_gxlx[] = {
+	{
+		.pixfmt = V4L2_PIX_FMT_H264,
+		.min_buffers = 2,
+		.max_buffers = 24,
+		.max_width = 3840,
+		.max_height = 2160,
+		.vdec_ops = &vdec_1_ops,
+		.codec_ops = &codec_h264_ops,
+		.firmware_path = "meson/vdec/gxl_h264.bin",
+		.pixfmts_cap = { V4L2_PIX_FMT_NV12M, 0 },
+		.flags = V4L2_FMT_FLAG_COMPRESSED |
+			 V4L2_FMT_FLAG_DYN_RESOLUTION,
+	}, {
+		.pixfmt = V4L2_PIX_FMT_MPEG1,
+		.min_buffers = 8,
+		.max_buffers = 8,
+		.max_width = 1920,
+		.max_height = 1080,
+		.vdec_ops = &vdec_1_ops,
+		.codec_ops = &codec_mpeg12_ops,
+		.firmware_path = "meson/vdec/gxl_mpeg12.bin",
+		.pixfmts_cap = { V4L2_PIX_FMT_NV12M, V4L2_PIX_FMT_YUV420M, 0 },
+		.flags = V4L2_FMT_FLAG_COMPRESSED,
+	}, {
+		.pixfmt = V4L2_PIX_FMT_MPEG2,
+		.min_buffers = 8,
+		.max_buffers = 8,
+		.max_width = 1920,
+		.max_height = 1080,
+		.vdec_ops = &vdec_1_ops,
+		.codec_ops = &codec_mpeg12_ops,
+		.firmware_path = "meson/vdec/gxl_mpeg12.bin",
+		.pixfmts_cap = { V4L2_PIX_FMT_NV12M, V4L2_PIX_FMT_YUV420M, 0 },
+		.flags = V4L2_FMT_FLAG_COMPRESSED,
+	},
+};
+
 static const struct amvdec_format vdec_formats_gxm[] = {
 	{
 		.pixfmt = V4L2_PIX_FMT_VP9,
@@ -263,6 +301,12 @@ const struct vdec_platform vdec_platform_gxl = {
 	.revision = VDEC_REVISION_GXL,
 };
 
+const struct vdec_platform vdec_platform_gxlx = {
+	.formats = vdec_formats_gxlx,
+	.num_formats = ARRAY_SIZE(vdec_formats_gxlx),
+	.revision = VDEC_REVISION_GXLX,
+};
+
 const struct vdec_platform vdec_platform_gxm = {
 	.formats = vdec_formats_gxm,
 	.num_formats = ARRAY_SIZE(vdec_formats_gxm),
diff --git a/drivers/staging/media/meson/vdec/vdec_platform.h b/drivers/staging/media/meson/vdec/vdec_platform.h
index 731877a771f4..88ca4a9db8a8 100644
--- a/drivers/staging/media/meson/vdec/vdec_platform.h
+++ b/drivers/staging/media/meson/vdec/vdec_platform.h
@@ -14,6 +14,7 @@ struct amvdec_format;
 enum vdec_revision {
 	VDEC_REVISION_GXBB,
 	VDEC_REVISION_GXL,
+	VDEC_REVISION_GXLX,
 	VDEC_REVISION_GXM,
 	VDEC_REVISION_G12A,
 	VDEC_REVISION_SM1,
@@ -28,6 +29,7 @@ struct vdec_platform {
 extern const struct vdec_platform vdec_platform_gxbb;
 extern const struct vdec_platform vdec_platform_gxm;
 extern const struct vdec_platform vdec_platform_gxl;
+extern const struct vdec_platform vdec_platform_gxlx;
 extern const struct vdec_platform vdec_platform_g12a;
 extern const struct vdec_platform vdec_platform_sm1;
 
-- 
2.34.1

