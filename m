Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D05F6089F
	for <linux-staging@lists.linux.dev>; Fri, 26 Jan 2024 23:16:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706310979; cv=none; b=NQKc9KjExMWlHBUybC9brqAYKyiYDmgRZL7BOmoT+2iYY4DZWncTO2aF00wpwe//vw0PinpxhNzsVmmv6DVdODGW4pi+3OtG4Y4qiMK3/7PgwdsRxgYKagyQXT6FtEoiUNe0TMTDyx+MZ5VQ/DDT8Lok3+JWcHwe3lT0sHuSTWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706310979; c=relaxed/simple;
	bh=D9jb+fZPg4cu81svPtGcxnqe5Dh39wQmeEcuV3Gqubk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=J750ySZZRxOtltLrhwY9Gov2UMeokgKsUDBMTFw3Jg8BQRw1AfY9ZsZTkYW9i7EDAMw6Auh3WuhMgxed6gJgWMpaNd9MDAPKANxQdDffTsOzYNGNJrEIcONYiHOfYaTC//UPbGojDJfCokP/SiQ/ABt+sRQISF98NGyvXZVzMlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=A1w4ENuR; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="A1w4ENuR"
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-783bc26b24aso66155585a.0
        for <linux-staging@lists.linux.dev>; Fri, 26 Jan 2024 15:16:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1706310976; x=1706915776; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ppFxbOlS/v6G/Iyc2Jdz2aiKlAo+YrKUjtIhEQOSvas=;
        b=A1w4ENuRsY7zVfG7xhw3W4/vxOs6o3ImTZcg7YIkUv2vBhx6PHxkXgMEtmHhdvTKRm
         7o2N/VCW0WyWhdXYuFfMeS4k13AgeCeugagQoB6jJ6BQxA7r4CQwGStmWvjPSplInpkg
         ugRaIzIC2JmZSkJ10CCHB6HQ5S6fvsw+qpBmg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706310976; x=1706915776;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ppFxbOlS/v6G/Iyc2Jdz2aiKlAo+YrKUjtIhEQOSvas=;
        b=BZSYEPQl2TN2kg6Y+OAJ2XdBAh6V9l4D5rSJOZfiZSNFkvBxeXaL7W4DEL21fnreKD
         oystMcHBcXjgXs8W4ygLXT5NV9gICPkAMIvt30j6l1R54DQ52zcC+M1+LSp+zgMB7jLv
         mjFNTgJu3EDIPTuJ0ASDGTnSdWcg/Yokdx6L2/fBfUOGy2WF59HKi6o3i4Q/h9Vxinj7
         wkmg0u/F4mdIIfOnokAkfU3OMJAc88YQDUpy4CrA1KMBnE1Y9+SyJJXIRxhBuHTyOkXi
         FJofMdMo9MXmfjH05/pBgC8vFDMU/cwuWIJrQ7ZhcQhyST9QRSfD9h/GPObr3VkjpaD7
         /qCQ==
X-Gm-Message-State: AOJu0YwKa5gRxTCZJ/ODPhG01wU51XqvdXmhYO9pVQPij6P//h7jwyVI
	H4KVcrefMPMWnWGm7Ovkg6yOOHKnTJdntVJQ7dQozus6wRZF5UHKP/yiFXY+Pw==
X-Google-Smtp-Source: AGHT+IGIpAsQSjaDQPGQ6LECGQr9cN1m4828+DZymi0+3bzM+4XluVJo4MprbQD7HbxK6yJ3CFbmNg==
X-Received: by 2002:a05:620a:2182:b0:783:e064:aa09 with SMTP id g2-20020a05620a218200b00783e064aa09mr622459qka.115.1706310976118;
        Fri, 26 Jan 2024 15:16:16 -0800 (PST)
Received: from denia.c.googlers.com (240.157.150.34.bc.googleusercontent.com. [34.150.157.240])
        by smtp.gmail.com with ESMTPSA id m4-20020a05620a290400b00783de3ddf5esm507358qkp.70.2024.01.26.15.16.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jan 2024 15:16:15 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 26 Jan 2024 23:16:09 +0000
Subject: [PATCH 10/17] media: verisilicon: Fix kerneldoc
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240126-gix-mtk-warnings-v1-10-eed7865fce18@chromium.org>
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

The field is not part of the structure. Remove the doc.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/platform/verisilicon/hantro.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/platform/verisilicon/hantro.h b/drivers/media/platform/verisilicon/hantro.h
index 6f5eb975d0e3..811260dc3c77 100644
--- a/drivers/media/platform/verisilicon/hantro.h
+++ b/drivers/media/platform/verisilicon/hantro.h
@@ -237,7 +237,6 @@ struct hantro_dev {
  * @codec_ops:		Set of operations related to codec mode.
  * @postproc:		Post-processing context.
  * @h264_dec:		H.264-decoding context.
- * @jpeg_enc:		JPEG-encoding context.
  * @mpeg2_dec:		MPEG-2-decoding context.
  * @vp8_dec:		VP8-decoding context.
  * @hevc_dec:		HEVC-decoding context.

-- 
2.43.0.429.g432eaa2c6b-goog

