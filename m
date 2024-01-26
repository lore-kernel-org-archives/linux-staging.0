Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B74E96167C
	for <linux-staging@lists.linux.dev>; Fri, 26 Jan 2024 23:16:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706310983; cv=none; b=e1ViR8zkc5izdQ0M7waS82TLZXgcSluEM3Oi1cspnJBPY8obzmjiVgEAGtPAgn6vI7BmntLsMKUGS7vgP7t+701bpTdQnU5rGkSIiuIyWo/As7W+MqVhG43c6PR35ug+W9VwU3fVz/yuVoC2qkpju5yk4cUqSiI+NGulGUsm1qU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706310983; c=relaxed/simple;
	bh=s7ygjNtkxqQxfIpVyrNczCyGDbA4gmJZOw/Jn1FAax0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rux1pIA0RVAURsbsvTYFjtO2pfrzoyHT1v2hCu6cyU/lbADJDi3m3FECexntWKxahAzVs+odtpsMMGvHxDCWgTaP7e17AoBAoLxxGio2s4gkKgQESdc4rFN5YjLvV23Q+pSjs5osVmiKe1ROjGQFRZsJ4Hmd8GnkqcbRILBoSy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=NM2A+XA9; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="NM2A+XA9"
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-783dc658b59so61106885a.2
        for <linux-staging@lists.linux.dev>; Fri, 26 Jan 2024 15:16:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1706310980; x=1706915780; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z/RRjO2OK0qr00/hywXC/yqqnZfLNxXiiMwDlCkck/8=;
        b=NM2A+XA9fvz6MjBgnZ5Gl5H1AyXLkza3465f5tx6TN9gkzjpwnp6BbIe/DZBUA3PgT
         /CCECWCn0dqhsOQlFa3s6Bv96GkuKfpdsLWFSsWcfeQgiHwswECXplAF65tN391zSk0Y
         BHAWReKN8Trn08oSiCUZi9lVGuIWvzCq/ZUvs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706310980; x=1706915780;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z/RRjO2OK0qr00/hywXC/yqqnZfLNxXiiMwDlCkck/8=;
        b=fw28nkQhKwG0K2O2oRcsWkqWG5GANMmE/1fHCV4iQFF2jQK7BrL+rwqghB9ncimNiN
         q5OrHcqWLER1O2GjQ9GcxP5Z3YaLF1IMLVXMC8TxiLXnqyktIbqatkFxuWrCdX4B7i9P
         HBi0KGkxSK1xM9/X1wKQmCJ/X/WSsA4SaOCCkEZsN2k7v+DpP9T5KrGW5nJXvsJok/mJ
         QhAUiy6im/pP66BbiSBTnfUBiWbBU4C8/yiK3OOtbku4oQ6hyNSMAMzo0NbkeqFi7Q+x
         ieODwk1FMWtIiOTh2IeiqxlbenMtiRDLtCM1fytLklfacX5oQpLpyhWX4F5H2w0qbNkb
         YsWQ==
X-Gm-Message-State: AOJu0YzqisneO9Dkq7q5JZj2RsgUfyFdHyHU3/DwV7+67DmidJyCRZCY
	ypy4dfVteLx+e9//qho4m+vyGxkLPrumRooztNl5BnCKrFKfvA1I0ND2+Vaywg==
X-Google-Smtp-Source: AGHT+IHKRlOu9LCpALD6RY5rOpayWfV+md9Ii2K85hj6JHlytziq3n5aAFRxrPIkRTY/lkweMMhnsA==
X-Received: by 2002:ae9:e716:0:b0:783:4e2:de7f with SMTP id m22-20020ae9e716000000b0078304e2de7fmr555937qka.113.1706310980532;
        Fri, 26 Jan 2024 15:16:20 -0800 (PST)
Received: from denia.c.googlers.com (240.157.150.34.bc.googleusercontent.com. [34.150.157.240])
        by smtp.gmail.com with ESMTPSA id m4-20020a05620a290400b00783de3ddf5esm507358qkp.70.2024.01.26.15.16.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jan 2024 15:16:20 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 26 Jan 2024 23:16:13 +0000
Subject: [PATCH 14/17] media: dvb-usb: Fix kerneldoc
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240126-gix-mtk-warnings-v1-14-eed7865fce18@chromium.org>
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

Remove kerneldoc from missing fields.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/dvb-usb/dvb-usb.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/media/usb/dvb-usb/dvb-usb.h b/drivers/media/usb/dvb-usb/dvb-usb.h
index 0990aa4a17bb..cbb0541d4dc1 100644
--- a/drivers/media/usb/dvb-usb/dvb-usb.h
+++ b/drivers/media/usb/dvb-usb/dvb-usb.h
@@ -126,8 +126,6 @@ struct usb_data_stream_properties {
  * @caps: capabilities of the DVB USB device.
  * @pid_filter_count: number of PID filter position in the optional hardware
  *  PID-filter.
- * @num_frontends: number of frontends of the DVB USB adapter.
- * @frontend_ctrl: called to power on/off active frontend.
  * @streaming_ctrl: called to start and stop the MPEG2-TS streaming of the
  *  device (not URB submitting/killing).
  *  This callback will be called without data URBs being active - data URBs

-- 
2.43.0.429.g432eaa2c6b-goog

