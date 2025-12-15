Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2A92313E0F
	for <linux-staging@lists.linux.dev>; Mon, 15 Dec 2025 19:08:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765825697; cv=none; b=rbyBYhVvdKCk8JlGaowALn4KeHiXZMlbZ+BhTkF7wTYdfIZmazZ9jxMh8LbDUdsoQU0s23gphBpN34TAAxOmDSBLL9L8lyGg2iJG6W8tBi+A3kYYgRe2jZmrLqYqO3GxoWDxgEWpt0EOnz4Q1aDmtg+g5qlq115GClMdoBsXcXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765825697; c=relaxed/simple;
	bh=TOl7QzXz9ynV1zhHHmuLrwdm34hK+gmILh1FdigSRcs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pbf5ooc1OnYHczgZ7qwP4CziWiXP4WTmvervzoBmF+mNhHStT6Udl1dXvHiscQWsn20IVueW2RJH4A/m7UQjykT4fTAdlg8kYiON+qWVFyMzGDSS9RqdNru4ahYY4p/jkHep5+I+bV5GqMe6y1AkZHbM9LOrR0bbCe9hng/EvwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y60H1lHc; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y60H1lHc"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-34abc7da414so2643917a91.0
        for <linux-staging@lists.linux.dev>; Mon, 15 Dec 2025 11:08:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765825695; x=1766430495; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Q44xMSPr/951RTwQ3DJqY5TH3wRlFesNoG+392y++54=;
        b=Y60H1lHcX8kIjL5YKnUuJz5uwuImu3i+I3m3ceoVfOnbaF44ckqErcVtm00vIXZB87
         ubXNMHo/taMiIWaJN2VkxrCkpWRJdwm146E+I/t48GHqRn8bBY3GLTTwhXvTW4iSi1iU
         8b809T5kXuZBgUZks4GVXG6M6HarWO7ZyWPn0+18M1kbiH/4TNGREFSvIt1f4F2uDNw2
         eneLZ82SMiMRk9RnanYi3tS+vigzkMGMIzy90XFHOpupch3HHpttJ2HrQVsIdtsQBUia
         7spjE3bzIrJLE2sCPXbntLd2dBUiEFxyIe3Il6iQwlPYoquABSmSznqhMECNAiQJ/W2b
         EeMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765825695; x=1766430495;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q44xMSPr/951RTwQ3DJqY5TH3wRlFesNoG+392y++54=;
        b=XsGX11heiQCs6cNov7dnROe2FgxFPKLu3Jw0f3PWXZIfaKgwvdsalee/rcBJ9/zXlQ
         gFb25YwXn2XyDDKPC1kndT3hsJd93iQWfUDNoYslNpcZw2Mruv/Ih1XnJuUzbNZ8wse0
         3TCIHq5R9XBWKDWQh3+kjEOSfMNvVszKzgra77SuNfvwmoP4j32DXrhW33NtvJiV+F9X
         KIfaMz8+SA4Rgm4MhwmQw1HY6G5Ck0JAUUTwAwQMAwxyUeyBiPTSfVW92VlCWyejHztC
         OnjLGiFPpjdbfNvvign21dC1PINHr+hOm8KcHl44LBq53h5xXbBK5246eG6/fKcCYAKH
         v40A==
X-Forwarded-Encrypted: i=1; AJvYcCXKVP6rNepRClV+kCAkaw5XqgWL2P+h7KsNNoWeHJH2P+l38VMn0U6I5WdT5hCCZ2l4OlFDRizVIQ/Wxp7t@lists.linux.dev
X-Gm-Message-State: AOJu0Yx2t1UOfTOuJr++x2OtGexaJlAwvm26dv6HOTbblXHGk8kLkZ9o
	CBvQvWiaWKL5BFixMOqklJnEro2aYA7o5dzhaGDwb7RM0Y2ESdoCJvJi
X-Gm-Gg: AY/fxX7U9K63gYSGkhsVvOEv2gkMaAVjIbJRrjV9hq3yLon2Bi1RIC0URVcDJylr3qt
	6BKA4V5aXsvA7wTjDZdbTiwKomucKcnMKr7YrzNqpDWGtjdZgH52lw84VuWRJIRNVcS3W756B/O
	irxli2551e5EgsKOLveM9INGK5y4lZiEBUtFbvnG6Vl6eT/jmAeNFcqXXsVlHbyK+ARBVjIC6We
	jydfqVZWoNjMEGyErdcvNKJDteoXowI/JsWOAJPHxP1rrJEa8L0mpbzzpfHGzBgobl5FjI4WAZT
	oPjcrvE1HZY3g9ZX7+1A8DAQt4KAcA1+rIc+vTf4xoIyTxTvuYqHa33AonU/OllJixDKwUGVaBG
	vT+KyAft70+1QMOPAklPmSF9btva1VIGr0B6k3X+pyQOUO3DAB3qT8XcWEGuCoVbPgOHfQ9pWrQ
	RnifQTwUgwa4lBHPhxrNW0pCofmdBeh4Au9kR/ul3he6seTJhDMNuIc4R2+rL5CtWctg2mJAa6t
	PzWmhoKCa/T5rkLtPWxTTtSgbdO5+DWxnyWEyfJ9eHHT2/yYVyWATzWriz2HaQEE1fPkNmf
X-Google-Smtp-Source: AGHT+IFOG7pmCyZDxSiXKnSyEk6MUYtinjZH97/IuvCjWcHbyd51A0PKmfIxl90xfHb5Co8/Lvuuag==
X-Received: by 2002:a17:90b:2749:b0:340:bb5c:7dd7 with SMTP id 98e67ed59e1d1-34abd6c6d69mr8988926a91.5.1765825695058;
        Mon, 15 Dec 2025 11:08:15 -0800 (PST)
Received: from Lewboski.localdomain ([181.191.143.42])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34abe2948d1sm9958875a91.9.2025.12.15.11.08.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 11:08:14 -0800 (PST)
From: Tomas Borquez <tomasborquez13@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Michael Hennerich <Michael.Hennerich@analog.com>
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Tomas Borquez <tomasborquez13@gmail.com>
Subject: [PATCH 0/5] staging: ad9832: driver cleanup
Date: Mon, 15 Dec 2025 16:08:01 -0300
Message-ID: <20251215190806.11003-1-tomasborquez13@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series cleans up the ad9832 driver with the goal of (eventually)
graduating it from staging. The main change is converting custom sysfs
attributes to IIO channel interface and adding sysfs documentation.

Changes since RFC:
  - Split unrelated changes into separate patches: whitespace cleanup,
    guard() conversion and dev_err_probe() (Jonathan)
  - Changed channel type from IIO_ALTVOLTAGE to IIO_ALTCURRENT since
    this is a current source DAC (Jonathan)
  - Kept single channel with ext_info for frequencyN/phaseN attributes
    rather than multiple indexed channels, as the device has only one
    output (Jonathan)
  - Phase attributes now accept radians directly instead of raw register
    values, driver performs the conversion internally (Jonathan)
  - Added read callbacks for frequency and phase attributes
  - Added TODO comment for pincontrol_en noting it should become a DT
    property during graduation (Jonathan)
  - Added ABI documentation for new sysfs attributes

Tomas Borquez (5):
  staging: iio: ad9832: clean up whitespace
  staging: iio: ad9832: convert to guard(mutex)
  staging: iio: ad9832: cleanup dev_err_probe()
  staging: iio: ad9832: convert to iio channels and ext_info attrs
  staging: iio: ad9832: add sysfs documentation

 .../Documentation/sysfs-bus-iio-dds-ad9832    |  41 +++
 drivers/staging/iio/frequency/ad9832.c        | 315 +++++++++++++-----
 2 files changed, 270 insertions(+), 86 deletions(-)
 create mode 100644 drivers/staging/iio/Documentation/sysfs-bus-iio-dds-ad9832

-- 
2.43.0

