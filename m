Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37A4160876
	for <linux-staging@lists.linux.dev>; Fri, 26 Jan 2024 23:16:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706310978; cv=none; b=sh//GbrEEhpOx0MUQQ+4GiHj0P98Jc00J3DlXY7x9/DoppNOlKTPno4bUdpph3Qa6QS9c3oYy3drjVZT1AQ8QvoQNrYMon+wwLBPChXKCtEzoJaeM7Ki+TLBrH3w/ToAU2r3zt+ak0vkfqS2MyYXpRDRUNtVwNSM0A4E8UqcwQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706310978; c=relaxed/simple;
	bh=B6zEqxG5rqQR51zJ3+OSzp49ESM0jCrcuqW7/EIH/N8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VYHHnRhca46BWuHXkw5MS3D8YP8uLVmZFgHkcskh7uwl7k9cL1Dl0bNbMrtslv0WUvALPGxriGuwUZ73lWlqml8lktorS+Kc1i5QXG5YlRFtwCX35X/xGtpT5PmqHcUhOuRFblcK/ZPyuS7uDdgxi14Qljg670E7/JRFgGuMk/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=EQFb2AMi; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="EQFb2AMi"
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-7835aea8012so87058985a.0
        for <linux-staging@lists.linux.dev>; Fri, 26 Jan 2024 15:16:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1706310975; x=1706915775; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2rgIqJyES8gEo830PNonJo5H+atO47Cm+Ctp+2scN+Q=;
        b=EQFb2AMiDs/42Rg8XgHXwfJJkd8yffQZ2pjWCDfu/OWY4rVkStUuovV5KtG0KpppEU
         mVsLjXuJvlkBj8+maG1/n/x89VWYI2bCMTKuBhzEcxblQsEEY4D2yEcWKQ8sgi1ZkUc5
         sQi9vVQE0zJTI3hrAwoDBrY4BqYn3VC0wWv6s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706310975; x=1706915775;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2rgIqJyES8gEo830PNonJo5H+atO47Cm+Ctp+2scN+Q=;
        b=MEnCvtPJ4w/Kor0D4zmUsMwABHljXN3zU3Ezp3qOmPgofVCnAkeu3ZVIxIPI5A5Y+h
         JjHGJcXxMESvKF/8kxXlSvVmnngjbiAoMl73RY6nIzqtHUYuw93VrwdXdJ6dqT0Mq6zq
         LVJzg+CEiIjJK4swExKwVlIV47fF0MIXjtXlCfs+/6LuIwwnj64eEz4gLRdt/pvpk/vK
         m7CYrv+grrmukDOQoCEr4GP0L972nicw3Dug8PvrRDpHdzOZkxYCFJn9yIWdq/2wzYLn
         K4+ajSqMBviuzTLpR/iQOuFgeUjQVMXbWzUYH51Hvx1EKKlwG7NulsRn17QLZcnXWnfs
         bGww==
X-Gm-Message-State: AOJu0Yy4HYmOShKieuJTPe00rq6drFoH2zboBUBvGVgyyvNd2fzsNuvi
	6r+Oi1SXs7oSD5V0QvdR8FkD6ghotu5NQiIsFKEWK88ndPugnPqo28eF4XwNDQ==
X-Google-Smtp-Source: AGHT+IFd4epluudoTRMCuHg+DI2SZnbO+Lp5toeNsVP6WGNIo3gmA/FS5q4GFf/JRmu/UhK6CO/sRA==
X-Received: by 2002:a05:620a:137c:b0:783:9ab7:374 with SMTP id d28-20020a05620a137c00b007839ab70374mr557152qkl.8.1706310975053;
        Fri, 26 Jan 2024 15:16:15 -0800 (PST)
Received: from denia.c.googlers.com (240.157.150.34.bc.googleusercontent.com. [34.150.157.240])
        by smtp.gmail.com with ESMTPSA id m4-20020a05620a290400b00783de3ddf5esm507358qkp.70.2024.01.26.15.16.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jan 2024 15:16:14 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 26 Jan 2024 23:16:08 +0000
Subject: [PATCH 09/17] media: mediatek: vcodec: Fix kerneldoc
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240126-gix-mtk-warnings-v1-9-eed7865fce18@chromium.org>
References: <20240126-gix-mtk-warnings-v1-0-eed7865fce18@chromium.org>
In-Reply-To: <20240126-gix-mtk-warnings-v1-0-eed7865fce18@chromium.org>
To: Tiffany Lin <tiffany.lin@mediatek.com>, 
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
 Yunfei Dong <yunfei.dong@mediatek.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, Hans Verkuil <hverkuil@xs4all.nl>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Bin Liu <bin.liu@mediatek.com>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, 
 Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, Bingbu Cao <bingbu.cao@intel.com>, 
 Tianshu Qiu <tian.shu.qiu@intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, linux-staging@lists.linux.dev, 
 linux-amlogic@lists.infradead.org, Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.12.3

Those fields have been removed. They do not need to be documented.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.h | 1 -
 drivers/media/platform/mediatek/vcodec/decoder/vdec_vpu_if.h    | 1 -
 drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc.h | 1 -
 3 files changed, 3 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.h b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.h
index ece27c880e50..1af075fc0194 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.h
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.h
@@ -39,7 +39,6 @@ struct vdec_fb {
 /**
  * struct mtk_video_dec_buf - Private data related to each VB2 buffer.
  * @m2m_buf:	M2M buffer
- * @list:	link list
  * @used:	Capture buffer contain decoded frame data and keep in
  *			codec data structure
  * @queued_in_vb2:	Capture buffer is queue in vb2
diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec_vpu_if.h b/drivers/media/platform/mediatek/vcodec/decoder/vdec_vpu_if.h
index fbb3f34a73f0..aa7d08afc2f4 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/vdec_vpu_if.h
+++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec_vpu_if.h
@@ -22,7 +22,6 @@ struct mtk_vcodec_dec_ctx;
  *                in place of inst_addr in messages.
  * @signaled    : 1 - Host has received ack message from VPU, 0 - not received
  * @ctx         : context for v4l2 layer integration
- * @dev		: platform device of VPU
  * @wq          : wait queue to wait VPU message ack
  * @handler     : ipi handler for each decoder
  * @codec_type     : use codec type to separate different codecs
diff --git a/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc.h b/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc.h
index 82246401ed4a..908d8179b2d2 100644
--- a/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc.h
+++ b/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc.h
@@ -26,7 +26,6 @@
 /**
  * struct mtk_video_enc_buf - Private data related to each VB2 buffer.
  * @m2m_buf:	M2M buffer
- * @list:	list that buffer link to
  * @param_change: Types of encode parameter change before encoding this
  *				buffer
  * @enc_params: Encode parameters changed before encode this buffer

-- 
2.43.0.429.g432eaa2c6b-goog

