Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D68681B1427
	for <linux-staging@lists.linux.dev>; Fri, 16 Aug 2024 12:32:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723811526; cv=none; b=TmQp5nlOzUWbQ/H9IQY/XPn/HS/tkoGXeTMo8SKqHabwaRNyqNZOx4AkVR/4iJEwSo11jqnnSXU2zT2aMZNVgeWwPxaL4F6Np0Lju7ISKYfOPl5XeTHiD9g4Fuom0bjnblxa81adwboWbGXIUoKlbWnrLfN7dlidjZA/ci9rKFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723811526; c=relaxed/simple;
	bh=cS96YejF1hyqXIfwcjLi+WpI7c6G/R69dAKBtvxD1pw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=JRU03Qh3nTi2CHH0DnP7PFEvtsGASpyJEstMqRKKZAYFQq5XffQ4/4k2SAgPFdRc8yPzFvCB0gXn9fxBjb/BBuQ7vzo22sg6d9OfCiZUFTW/U+Dv/Kfmw88MivSt/xQdOp2mHsHqjtwK+bE7By+CqMf47WKycXX6oUqvN+F59i0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=WOhT8+FK; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="WOhT8+FK"
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-6b791cddfcbso10494526d6.0
        for <linux-staging@lists.linux.dev>; Fri, 16 Aug 2024 05:32:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1723811523; x=1724416323; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CCFoApgC3NvMeXYvVFjfg1wg+6p9sI3vxSueR9OSw4I=;
        b=WOhT8+FKT1uRfm9rb1Qxh/AjX3IvRwkBALsReNi6VKKQXieuEXtjKvQvK4e4Gq9hAo
         kn+hsB4qEjzx9q2uYOcKapP2fn+GtFfRQJq/fcru6vgQzKN22j54rJm4LHORm4SE8BFk
         WezmCRKs4WeNfApYHQxk3Nogh++HNZgjbMe+Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723811523; x=1724416323;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CCFoApgC3NvMeXYvVFjfg1wg+6p9sI3vxSueR9OSw4I=;
        b=KAaa9iXE8jfm7Vli1Gf7QW6O5c+jqy7Ihwf0mzLUnlkrngF2OAwjL2Xk1Y39H0dlg6
         jsHMSZW9opSMmbSLWQp03I0AwOAqFHyl1qV4PnPM6ZdXFDa0b2WoCpOyg5aN+Zmg1aWF
         +uEekmCTCJ1n7pA6UnBzajlZG6DnhSA5dYegydxPFSvBZ9/iHI3Apw4HDjft0Nvqz69d
         OB/PPx5vM/1nrcFjbVaxGBzr6BDpdcdLZn8Jzb2R4ZrINIKaNCh6OsvYmsMgZaZjY9XU
         i6QzmQdlU0x5tK3vFGqz7RQpU/AMyn/2ctgHx/M8KLYNNIc7EilHckuKm+BOpACczGb5
         VnAQ==
X-Forwarded-Encrypted: i=1; AJvYcCVkKSCyy0CVnfaesrsuC3Uqq7CYzgcXI5RXX8lAqtG/yW9uZ0q62jbMJUe3PwPt/xo8TkbeM1CE2RwHlmOWd2gq6dJS8J7WTZEv3p1HjQ==
X-Gm-Message-State: AOJu0YzA0vOoCxy5tMAxZbNRxmVus92tjk2SldSh0Wgx5q0i6cs3pBIU
	VyNavEpxT/k0zQQUnne+q+VyfIK5N2WmGd/sojlBiF+a/40EKnb4Y3NoLsS7Jw==
X-Google-Smtp-Source: AGHT+IFoKdLi76sGKTYFPYZCioyONlAB3ifLSzlc/E/kHAkYIvV8qgOxuFvA3vnNFKsn84Rla7Ntqg==
X-Received: by 2002:a05:6214:4a93:b0:6bf:75f8:250b with SMTP id 6a1803df08f44-6bf7cd799b3mr33366816d6.10.1723811522620;
        Fri, 16 Aug 2024 05:32:02 -0700 (PDT)
Received: from denia.c.googlers.com (123.178.145.34.bc.googleusercontent.com. [34.145.178.123])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6bf6fef3107sm16881426d6.121.2024.08.16.05.32.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Aug 2024 05:32:02 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v2 0/6] media: Fix last smatch warnings
Date: Fri, 16 Aug 2024 12:31:58 +0000
Message-Id: <20240816-smatch-clock-v2-0-c63105db07e8@chromium.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAL9Gv2YC/3XMQQ7CIBCF4as0sxYDlLboynuYLuhIy0RbDFSia
 bi72L3L/yXv2yDaQDbCudog2ESR/FJCHipAZ5bJMrqVBsml4lrULM5mRcfw4fHO5GjqQYhO6aa
 DcnkGO9J75659aUdx9eGz60n81j9QEoyztlWolTw1g8ALuuBnes1HHyboc85fp/U9f6sAAAA=
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
Changes in v2:
- Fix double free in ar0251 patch. Thanks Dan!
- Link to v1: https://lore.kernel.org/r/20240813-smatch-clock-v1-0-664c84295b1c@chromium.org

---
Ricardo Ribalda (6):
      media: ar0521: Refactor ar0521_power_off()
      media: i2c: ov5645: Refactor ov5645_set_power_off()
      media: i2c: s5c73m3: Move clk_prepare to its own function
      media: tc358746: Move clk_prepare to its own function
      media: meson: vdec_1: Refactor vdec_1_stop()
      media: meson: vdec: hevc: Refactor vdec_hevc_start and vdec_hevc_stop

 drivers/media/i2c/ar0521.c                   | 17 ++++++++---
 drivers/media/i2c/ov5645.c                   | 15 ++++++++--
 drivers/media/i2c/s5c73m3/s5c73m3-core.c     | 13 ++++++++-
 drivers/media/i2c/tc358746.c                 | 12 +++++++-
 drivers/staging/media/meson/vdec/vdec_1.c    | 16 ++++++++---
 drivers/staging/media/meson/vdec/vdec_hevc.c | 43 +++++++++++++++++++++-------
 6 files changed, 92 insertions(+), 24 deletions(-)
---
base-commit: c80bfa4f9e0ebfce6ac909488d412347acbcb4f9
change-id: 20240813-smatch-clock-2fa3b1174857

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>

