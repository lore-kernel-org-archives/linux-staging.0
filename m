Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10FA01991C2
	for <linux-staging@lists.linux.dev>; Tue, 13 Aug 2024 12:13:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723551232; cv=none; b=IHPUt/JqY2EvOhWRRNeSjDKyTcJMPazkW6FF092H0JjC1jAmMfxbrRsQIhqaIEKpkor7aQNmnMixuxs0JvRUPnJdFdTcx5t+tlktnx1ag0+UWj15tZ3gMEzBDBkfeUbTGLvXCm3zRlLEtPcK3jzMcVZH8IqzkSAPAyL9mqfxbUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723551232; c=relaxed/simple;
	bh=AhtVc0eRB313SzivG95eO+fvDnddIaj+hD0gJVu5zyc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Mrnr9k7XAkTxnEpuG1AATwj8aAD33/V0YzKQd+eCXBZXFA9fmt3TjaqyO0UFj0xopeUD5bAeqx4fcupm+MZJ8oAtpc5o8PkJjm9t/UEBjqO94spY8OXLQxgmeCkazI9fYn7dqiS9sTga5nB0mVberVu36HUnKZoxhv0pSaKjs9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=XUFUzqWF; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="XUFUzqWF"
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-7a1d7bc07b7so360410385a.0
        for <linux-staging@lists.linux.dev>; Tue, 13 Aug 2024 05:13:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1723551230; x=1724156030; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=exEVIAJZd/rYdUXslfft3lBWpWIRwR1McJc3b9INl9w=;
        b=XUFUzqWF8dP3peQsnOpsxVnSvuP4ssbTOC3jeoH2MKhgEMLUHgLD2iGZZyOTnEukDD
         eZG+eDp6UNGYqjuub7pQapwl8hB6M6bgBVg/hRi0SO+XbpqhK4dh0fMxbhiyFFd8fmH8
         Vx+ZxeCexN35rezqr4J2cZFFCyM0SCRK+SYCE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723551230; x=1724156030;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=exEVIAJZd/rYdUXslfft3lBWpWIRwR1McJc3b9INl9w=;
        b=cgnBUUe5WxZOji+EM5kfiwERGPwCAd3gejGQgHNSMmB01tmUIBUvWSKDGaL6yaKdOu
         70wiAR+93zjT/8IOxOdRqIPPVZaPPxBhRCZYVqBPUDdVbUoJkQcJrz4aCtshyUgtOR9b
         dcp/CiMJPvnr3/ZimB6ftidW/unEhXbLviXy+EmNimh3OuRcvYGzIkcVyc0ezcIWHB3/
         ASMBCkktHNEqtbojvLpAmbaPWIT87tMcdiJa/ge2mUukmuSoTRV7sSdN1VPtBEQFl1Tu
         lko9Yrhx42EqofCybVhOsORD3Z7O13x7SI+0lBmragm0LTbMrwttqC/VGXYU8JsUZJA4
         DlBw==
X-Forwarded-Encrypted: i=1; AJvYcCX4gp6ExRXdpBSRN1ofPcVlkhh5fBVGTNlvt39Am453Akre56CVHUiCinoBL2EurbQSKHvRq0kJUF70y+aq9mD22FPGekjzr3Ct7sRczg==
X-Gm-Message-State: AOJu0YzNeAy9cK0kYjfn5izAaD4rorFU620vyuIU1y72eCtbWuUEHGSP
	n+Uk5Tm3xhxzVMWs4lvup5CdfP3U6Mr/4WSHihaM8Btm2N4PVQscz2DTpYcSlw==
X-Google-Smtp-Source: AGHT+IHEAC5qNhYBF14RuyiMsQL8IDhPP6lbNZuwJIZWarWyGBLPSFdo+w5w+ficdZzhLBjRgODR3A==
X-Received: by 2002:a05:620a:460a:b0:7a2:db1:573d with SMTP id af79cd13be357-7a4e153e4femr367590785a.36.1723551229916;
        Tue, 13 Aug 2024 05:13:49 -0700 (PDT)
Received: from denia.c.googlers.com (123.178.145.34.bc.googleusercontent.com. [34.145.178.123])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7a4c7d71ca8sm331765485a.50.2024.08.13.05.13.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Aug 2024 05:13:49 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH 0/6] media: Fix last smatch warnings
Date: Tue, 13 Aug 2024 12:13:47 +0000
Message-Id: <20240813-smatch-clock-v1-0-664c84295b1c@chromium.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPtNu2YC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDC0Nj3eLcxJLkDN3knPzkbF2jtETjJENDcxMLU3MloJaCotS0zAqwcdG
 xtbUAgffoXl4AAAA=
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 =?utf-8?q?Krzysztof_Ha=C5=82asa?= <khalasa@piap.pl>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.13.0

This series completes the smatch warning cleanout.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
Ricardo Ribalda (6):
      media: ar0521: Refactor ar0521_power_off()
      media: i2c: ov5645: Refactor ov5645_set_power_off()
      media: i2c: s5c73m3: Move clk_prepare to its own function
      media: tc358746: Move clk_prepare to its own function
      media: meson: vdec_1: Refactor vdec_1_stop()
      media: meson: vdec: hevc: Refactor vdec_hevc_start and vdec_hevc_stop

 drivers/media/i2c/ar0521.c                   | 15 ++++++++--
 drivers/media/i2c/ov5645.c                   | 15 ++++++++--
 drivers/media/i2c/s5c73m3/s5c73m3-core.c     | 13 ++++++++-
 drivers/media/i2c/tc358746.c                 | 12 +++++++-
 drivers/staging/media/meson/vdec/vdec_1.c    | 16 ++++++++---
 drivers/staging/media/meson/vdec/vdec_hevc.c | 43 +++++++++++++++++++++-------
 6 files changed, 92 insertions(+), 22 deletions(-)
---
base-commit: c80bfa4f9e0ebfce6ac909488d412347acbcb4f9
change-id: 20240813-smatch-clock-2fa3b1174857

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>

