Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A10A05789D
	for <linux-staging@lists.linux.dev>; Mon,  2 Dec 2024 15:47:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733154449; cv=none; b=Mnt7Anz8gfkQTrfIE1n23inarWnanzxm7ASOjxQfALqpeQPqOVtglo23BAxi2MTqCdGQADKJvu2PntPYQzrs0LzklcTTSxl1bODfj2oavuivGJ93c56a/8aXSmV00bZXPLDP90ewRa9DsteN/WLw0v7ZcNFdRtffdSZDqqe68uc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733154449; c=relaxed/simple;
	bh=NQt98Z0M5QNA/TsO8gh1YDS9GMK76KynhZ9aabRaUlg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=E9NJHh2KZIEPjMhvYz/nfRScaeWL1O2eNl+ulQcBtuUttNzWJD/zsbPdmpSVmmpjERQDUUB5tjZnYSunBWNgsBcRibT9gfj+iikx7Y1Fc8cwax4Q/449xqr9o2kGy/btLYFlCFhl+VLKu3dW9CyYDO69LbLDc//qCo5Rt+GEDGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=IFJZIJkc; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="IFJZIJkc"
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-6d88d3d1eb6so23649916d6.0
        for <linux-staging@lists.linux.dev>; Mon, 02 Dec 2024 07:47:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733154445; x=1733759245; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l2F2lVT/48t59mZz2zC2oH5sxyMbSECeGcR5hkq1C/k=;
        b=IFJZIJkcdUunOJgW66LMoNGUsppja64dND/BXG+90D6AHPpXiSYOlELx/AUo5gtjFx
         rzIcCPe+p1IlndxFiPkMcvdBOsr77XlN1ZVMTMNpvHzROdvCOdpZWCrOlvX2ZvDqTB5e
         /DwjqYXOWKUY6kNsj5Orp6uhBOVJ5f+9TNYK8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733154445; x=1733759245;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l2F2lVT/48t59mZz2zC2oH5sxyMbSECeGcR5hkq1C/k=;
        b=lO5LOXAp3uRYRsyec/1ATX9kI94hYHa/UBgedhqNUO2W4Tc/2q+t0zejMs8RcEgFtR
         szD38wILovewGkKbzqpz/nVuOM7EVPJpMjZNa2JG+FGe0Wod18D7Krd5k6AH1+xRwCS1
         cSJVAnjVX69D7QGq4P+uRlLW81Y7gL3mrgwowlA8j0OPHegu9xBbFEOxdaF4s44N+Gj9
         i+MjhxWV7hxMBozljWPH4kmJ3U7fp2PEPlL36VgXbzeXnmbFBmY8K816AaGohjr7j1jq
         flM57B6Pqw3BMM1EmR+r0NJTNKHdOtVBNwqLv/qoYbWx6Xm0/+qNS3tfDHoehw6K2oe0
         nrRg==
X-Forwarded-Encrypted: i=1; AJvYcCUcRqMrmxTrgJQRm3YG9y9v6tU0Fqq/jYHC/oFBOktQ4q4PAcyn+o3Emw/Lm3ll9bK0YZwjftt5WwLq7lf0@lists.linux.dev
X-Gm-Message-State: AOJu0YxjI19xbYbGdhWqQIr68ihcKByKkzTmLRuGdcfQwLKnP5XrP1lB
	nhmE1REky4Ry5L5cm/Vr4nYaBjqJxcj6q0vj0bYiIe0BLHaKTM/lKYE0VtO1gA==
X-Gm-Gg: ASbGnct0jsw0nbVb0cmBUJuZMlEd4W9bc2QexPUZ3dEKlzxvJiFGP3bA8FujkWOX9ET
	W00ku9LRu1i1loGzpo/MJfugvqKP2YSIgts1Nn/QIPHNSTR1pTap591uYr0rKRvSqDnL6b8uFQI
	HP7Mb/23rZ3uGMiOp3SnPFQYvtmL+NfSczbR26THwiiWZ4SbkG8vx3/XjcAa+bTq2/KmboklfWz
	hN5uhqURhFU0lUlVo6zZFf4Kvm/tD9vTUnn/QavXbX/Id8SMHUhlYZbGMMgaTVV7RC2hBBnw0oh
	R+25cv/vhiQkefOu6AMnbmfE
X-Google-Smtp-Source: AGHT+IGi/PMi7HKxN0drYRNoeMrQehkEDZgCgHDgtdOzyjj8HEWJDMxx4Dj3/iwSYHFuTdJy9nQktg==
X-Received: by 2002:a05:6214:626:b0:6d8:a1b4:b58f with SMTP id 6a1803df08f44-6d8a1b4bb2amr99633466d6.11.1733154445272;
        Mon, 02 Dec 2024 07:47:25 -0800 (PST)
Received: from denia.c.googlers.com (5.236.236.35.bc.googleusercontent.com. [35.236.236.5])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5156d0f8ad6sm1159729e0c.49.2024.12.02.07.47.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 07:47:24 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 02 Dec 2024 15:47:17 +0000
Subject: [PATCH 3/3] media: mediatek: vcodec: Workaround a compiler warning
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241202-fix-llvm9-v1-3-2a50f5acfd0b@chromium.org>
References: <20241202-fix-llvm9-v1-0-2a50f5acfd0b@chromium.org>
In-Reply-To: <20241202-fix-llvm9-v1-0-2a50f5acfd0b@chromium.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Andy Shevchenko <andy@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Tiffany Lin <tiffany.lin@mediatek.com>, 
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
 Yunfei Dong <yunfei.dong@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, linux-staging@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.13.0

llvm identifies that the SCP_IPI_VENC_H264 and IPI_VENC_H264 are from
the same enum type, but their are part of the same ternary operator.

vpu_inst.id is of type int, so we can just rewrite a bit the code and
avoid the following llvm9 warning:
drivers/media/platform/mediatek/vcodec/encoder/venc/venc_h264_if.c:597:29: warning: conditional expression between different enumeration types ('enum scp_ipi_id' and 'enum ipi_id') [-Wenum-compare-conditional]

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/platform/mediatek/vcodec/encoder/venc/venc_h264_if.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/encoder/venc/venc_h264_if.c b/drivers/media/platform/mediatek/vcodec/encoder/venc/venc_h264_if.c
index f8145998fcaf..4786062e879a 100644
--- a/drivers/media/platform/mediatek/vcodec/encoder/venc/venc_h264_if.c
+++ b/drivers/media/platform/mediatek/vcodec/encoder/venc/venc_h264_if.c
@@ -584,7 +584,6 @@ static void h264_encode_filler(struct venc_h264_inst *inst, void *buf,
 
 static int h264_enc_init(struct mtk_vcodec_enc_ctx *ctx)
 {
-	const bool is_ext = MTK_ENC_CTX_IS_EXT(ctx);
 	int ret = 0;
 	struct venc_h264_inst *inst;
 
@@ -594,7 +593,10 @@ static int h264_enc_init(struct mtk_vcodec_enc_ctx *ctx)
 
 	inst->ctx = ctx;
 	inst->vpu_inst.ctx = ctx;
-	inst->vpu_inst.id = is_ext ? SCP_IPI_VENC_H264 : IPI_VENC_H264;
+	if (MTK_ENC_CTX_IS_EXT(ctx))
+		inst->vpu_inst.id = SCP_IPI_VENC_H264;
+	else
+		inst->vpu_inst.id = IPI_VENC_H264;
 	inst->hw_base = mtk_vcodec_get_reg_addr(inst->ctx->dev->reg_base, VENC_SYS);
 
 	ret = vpu_enc_init(&inst->vpu_inst);

-- 
2.47.0.338.g60cca15819-goog

