Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAEA2605B2
	for <linux-staging@lists.linux.dev>; Fri, 26 Jan 2024 23:16:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706310977; cv=none; b=URLHC5opTaTb4KMMsViADNmjsiqmobkTLCPuP36fxXHW082ep4mh51yqoQcwQLgHwbCYOXtOgrSVIeSKmUNdPOM/gt3PwiznP6Pw/ua7CgVybXhTe1LS6xjmz5XGyskCHs2vOguV/Fz04wV+xzwEii4dHAyjgdzKjZfD/bEB4B0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706310977; c=relaxed/simple;
	bh=sr2bUuT131x6iX4en7xRFHk6n+uer4hx2b4W4hDRpZs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=d7uNQBHJ8N6XBzlrj8wW62pi9dhv4ng6YFbfISEgwdTKyW2vk5o652etbSxuxIYXssTHQU+d+IjtWkT3MCll9FRyUJaoOIcZOQLDx2vnV3S2PBJrme1nqLWIo8GqbC9Z/SHXeJ5UKVmGCG2rmCuIAdiZpDGBI/lqtr6ap/HeXig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=LWMhg0xL; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="LWMhg0xL"
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-783d8dff637so59422685a.3
        for <linux-staging@lists.linux.dev>; Fri, 26 Jan 2024 15:16:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1706310974; x=1706915774; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qSXVbFoG/exQx3PnGpEWpQQ1t1d8y4UCiwgXQ1/JoHo=;
        b=LWMhg0xLCCclSjoprgQhBkkt1Oe5SMiOGCdt+wfn96JyiJvtxrmXZPPM5T64hDGETn
         8vhCPU3VTVLQZ8LJtO5/ThiNGaQlLnPNNorY7c+nRUHmc670HCNGzOtj6prJK4Ou3ja2
         mEm8Z79uBiSTS01ksSkm2/HVFrhED2WGS0tkk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706310974; x=1706915774;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qSXVbFoG/exQx3PnGpEWpQQ1t1d8y4UCiwgXQ1/JoHo=;
        b=utOBg69MvsajYMdgghUfo4vmhI7ljGbRVdqNbtH2+6Iyggq1Ve5FqX4t0SP8X7gbTC
         6XLUw0p9TZKDWIQALO802Xqv1gpNx6ceIuCqmNYmVRZbtb591tPNtz9dHx6pR43091r1
         Bsi+747PXACyAYvHtD1TcW66VcJiGVjvVdIP5hqXE+G+LUkXZb/AuJo3n8GDVugDVyha
         NgLkAfNlxb8B8DkO+l4B7axdtdiHwdiNzL/Mm/9WWR5xHOwpqQ1vBu8LWvmkGitUj29M
         Rmq2kYrOnlGms7bPl258xxYZ8m8lbqpnQ/18HFCuJUoD3t26ktsTsd5ibKcQPCZrPion
         XWiA==
X-Gm-Message-State: AOJu0YwDL0m6XOTRjckeaXrGtu5306tz6j1hw8q01rdpvIicwHEmAEJq
	lLUWQUEEt1D//GfAzA4ohpQ3ndJpQnyd6P7kAd8WfHIiOBUh1eoNNNsPs0qLvA==
X-Google-Smtp-Source: AGHT+IHvS/HbW0NAYrQIsdlvGBtX2lor9Od+LhJ3Cj/UhY6yAa3AiOtgFTNXNbwuU2inqgPn30b9WA==
X-Received: by 2002:a05:620a:12e6:b0:783:89f4:a1a with SMTP id f6-20020a05620a12e600b0078389f40a1amr527242qkl.104.1706310973985;
        Fri, 26 Jan 2024 15:16:13 -0800 (PST)
Received: from denia.c.googlers.com (240.157.150.34.bc.googleusercontent.com. [34.150.157.240])
        by smtp.gmail.com with ESMTPSA id m4-20020a05620a290400b00783de3ddf5esm507358qkp.70.2024.01.26.15.16.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jan 2024 15:16:13 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 26 Jan 2024 23:16:07 +0000
Subject: [PATCH 08/17] media: mediatek: jpeg: Fix kerneldoc
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240126-gix-mtk-warnings-v1-8-eed7865fce18@chromium.org>
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

The field is gone, remove the documentation for it.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h
index 8ba6e757e11a..8877eb39e807 100644
--- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h
+++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h
@@ -144,7 +144,6 @@ struct mtk_jpegdec_clk {
  * @jpegenc_irq:	jpeg encode irq num
  * @job_timeout_work:	encode timeout workqueue
  * @hw_param:		jpeg encode hw parameters
- * @hw_rdy:		record hw ready
  * @hw_state:		record hw state
  * @hw_lock:		spinlock protecting the hw device resource
  */

-- 
2.43.0.429.g432eaa2c6b-goog

