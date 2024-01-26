Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC0FE5BAC5
	for <linux-staging@lists.linux.dev>; Fri, 26 Jan 2024 23:16:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706310973; cv=none; b=BCjDHcfhouvHJEohxfCRYXFT49b1zMbJH2zGv45lGNhHsVlbCM2d+mqV8nuAKrQv0UHA9AVXTcrkPdiC5c+WOOnCSjFoP3fLrN1EoO+3F+dxo9/Q4UmEOda8Yrave5HVUD/K02jH2YzIe5/51Z8ZqKtB5+ZhEdJsCx17lVLFYck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706310973; c=relaxed/simple;
	bh=hr4nOBWgTYWfAz3nDinorGAmbEpHqgT37FFxq902g4c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UNeGJCHHk7gambuVPLId0ZtADUlkIAi8YWwVjkD7I5trslJgQd+oXsIbKtagDjBrMtYzX848+VhDI+k/hkczNAanmQObp1TyyeKLCpH6RM3Mtna9+JVZNeraoPD+EC3bvlBpe+huhpm05Gkmw23tRAlR4uPq8AAS+1/g/vUamkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=BWIIbqfo; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="BWIIbqfo"
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-783ced0216aso46176285a.1
        for <linux-staging@lists.linux.dev>; Fri, 26 Jan 2024 15:16:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1706310970; x=1706915770; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wJ0m3P4movTLz/Nvfo+j871i2YxzmvzYNu3X7u/7SQ8=;
        b=BWIIbqfoSBEd7/1TI4cnset3bdwspW/Z3EHqatiMmmnRHK9uKRPfGkUKP7OtIv9iVg
         FY/svHfm8jrMHOHVCTLI5e0TV0XOhzQRArbhWbtS8mVzIDgMAoM1Y6C/oGdal6nxb7HA
         vtzs122GdHoR5sMc/ks0vbxVtIDCqr60KWgac=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706310970; x=1706915770;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wJ0m3P4movTLz/Nvfo+j871i2YxzmvzYNu3X7u/7SQ8=;
        b=LCLKp5xcrV32zL/FVBLMZ48IXa0xSQlsW1E9Ga4fk+b0ndxKmmE/Vp/KvlotaWxcZ0
         9xKc3ikp2kNmAkfxTRcJh1MhJU4a6jP96hPJe/EmDKLcAdsm6sCvCgn2SkPwTnSFzOKt
         W0LPnmo73nD3gKi27/TGamZATRzUoHLA+eAeoX4yGmdOHGiipDnB9L4pcMV8mfsSSzwk
         dtnRyHAwE090Ae9R4O0R8Yye1PIxKyawi7mQ+WTjolbGLvgMytPWT7IbAGX8OsqTJNr3
         QYEhCmA7rlK/pDv2Eswa3TmK+boiOPt5ciDAd0z+4v3NN9hQ3M5hHPI7zQU+YQVAnaLt
         GZFA==
X-Gm-Message-State: AOJu0YziUEYWqox9/EgABOZNmLA+E7hCEuKFiwZAfqUS/Sjucs85j931
	/YagHA/2OYP0yIIEr572W9ZARqSQs9pzyhFiUauf7oHpN4VwsZMpPZiEbMBWHw==
X-Google-Smtp-Source: AGHT+IHAmNfItdlyJWsZ1GtS50XKPZcd4sgiZnzEdRhsQ66Nd+BshXmAy/d7aAGqJVN+Us+VU1C3UA==
X-Received: by 2002:a05:620a:148c:b0:783:89f2:d9f5 with SMTP id w12-20020a05620a148c00b0078389f2d9f5mr495965qkj.104.1706310970554;
        Fri, 26 Jan 2024 15:16:10 -0800 (PST)
Received: from denia.c.googlers.com (240.157.150.34.bc.googleusercontent.com. [34.150.157.240])
        by smtp.gmail.com with ESMTPSA id m4-20020a05620a290400b00783de3ddf5esm507358qkp.70.2024.01.26.15.16.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jan 2024 15:16:09 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 26 Jan 2024 23:16:04 +0000
Subject: [PATCH 05/17] media: pci: dt315.h: Fix kerneldoc
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240126-gix-mtk-warnings-v1-5-eed7865fce18@chromium.org>
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

The field is gone, remove it.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/pci/dt3155/dt3155.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/pci/dt3155/dt3155.h b/drivers/media/pci/dt3155/dt3155.h
index c9ce79cb5566..ce1835d9691e 100644
--- a/drivers/media/pci/dt3155/dt3155.h
+++ b/drivers/media/pci/dt3155/dt3155.h
@@ -162,7 +162,6 @@
  * @height:		frame height
  * @input:		current input
  * @sequence:		frame counter
- * @stats:		statistics structure
  * @regs:		local copy of mmio base register
  * @csr2:		local copy of csr2 register
  * @config:		local copy of config register

-- 
2.43.0.429.g432eaa2c6b-goog

