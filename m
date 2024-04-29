Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 258AE199E87
	for <linux-staging@lists.linux.dev>; Mon, 29 Apr 2024 23:40:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714434039; cv=none; b=tHcoPnucjZZ2iit7RDejVv95YX11O4NCpDS25P5rkJUgux7C9IrvCBH4tIuN0dDVQL+6nRUM7yXpNoVLTkWJeDjmJkDhfYYX05T845lFcGPdP0Etsjv/Db2MLT2e8SZbdLAaJ2eqvlQJc0CdTYcn+BxQFON5Kld534c6PlXnCRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714434039; c=relaxed/simple;
	bh=lue8tGKQodCQW7f9Ah8mLVDqX/DjwpQuD96ROdxcrKw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=E69lEYEvVnrNMYv7SgWxz/GTQOVMMeFgr1dUpbIOAiCwVWd7xhuJaLLZd0kWc+8RPd+AvmtRksFwJ86JmmZdKh0scx8I3ArZBMmrVLex3moIFCabtBwtHvlK/he9WzWgM0Q/K6cglrmulzXlN0OHYW6pUF63C15DS/GoT0vDDBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=vdvqlPDb; arc=none smtp.client-ip=209.85.210.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="vdvqlPDb"
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-6ee35146ac5so797548a34.0
        for <linux-staging@lists.linux.dev>; Mon, 29 Apr 2024 16:40:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1714434034; x=1715038834; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/RbyRopVLlo3z9muP6tADTHE5XtuugaNtZZWMLb0Jpk=;
        b=vdvqlPDb72LguygitUgKbiBnx1ja5MDM6yXZz1IzqM3KBBF3u/PeuCi5SMVi4Gy9eN
         DuhFXbDtSpJSl+EHzMTC6EDx6rWifmAsqlG7VGUBag4DA5Du425hhjJ7rmnDHevWpRfj
         0PwT+nCSty9KXuRDcqy86uZP7cO/OJtmYsJHTFHYQKO2C88Y3gOUQBG1EDLJChVFbXVA
         MxS/h5Ghw9hJtMNwksxEnDWAs91l/dLCHddRtU3SjDlZ1MFYHxXV82kZLkQ56v2pWEMk
         iC0+LHI2tYsX65AMPd42/LgsK4+gH4xyG6MkTlbrWWQWYgsiq7laGt2bKzTjxvh74YfL
         yJtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714434034; x=1715038834;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/RbyRopVLlo3z9muP6tADTHE5XtuugaNtZZWMLb0Jpk=;
        b=xNm/HxMnSsDKYlISS7XL0z9qo4QLQAd9ryngPynlRfqqXmC+O+dRH9Ssfh8HAhRKas
         81uiCs0LSy5DAv3CJNQDopiL0c9p9s634mlroR1NA/v6Ifke2CCLi1ZyUqEbuLwUx20g
         3NvCm00easCIiccHkaomvwHpVf5vwCHZxRaupiaI6RAuGwMubT4Uc2ZAIyCfVVc5ClWf
         IW53TfVFHyIlqFrIa9cLYByjxGwg753MHT1mkOdKGwI4TSocdIQCfhjb8s3dFdqqAq26
         KhZdXsIQXD0L0hD8kdVyjwBfbMbokUBZtnSXKHDlJWH/+PfuuYj7LNR97i401AOMikXg
         Rv5A==
X-Forwarded-Encrypted: i=1; AJvYcCVamYMmrvIDEGVY8SrK4O+zFc5AzByQPQ6K1L41uFF/xuZMSrQbqGkiM7I0NuHql2jqHMtvep5OpfnKvjQjARNCN1SZryWZuwQY9mkGZg==
X-Gm-Message-State: AOJu0YwtNpPUPNZV7Tc5QZXZUz60TiqBJptfTsnvVNNI12viUx3peeAt
	epE1ARpVTiHr3PMgLIj+oCJFNzrePhhGXT7wvKt9dnGzrlAQzHTNR+bCHpqtGew=
X-Google-Smtp-Source: AGHT+IGP5WuztYu6eAOehmTgcCwU3XFCxmv4osL3pF9V/oN2vHxn21J6GhNMYPv+HR2qW2NPzbUEJw==
X-Received: by 2002:a05:6870:f22a:b0:22e:c787:5fa2 with SMTP id t42-20020a056870f22a00b0022ec7875fa2mr12446265oao.58.1714434033950;
        Mon, 29 Apr 2024 16:40:33 -0700 (PDT)
Received: from freyr.lechnology.com (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id hp22-20020a0568709a9600b0023b58aa20afsm2144508oab.25.2024.04.29.16.40.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Apr 2024 16:40:33 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Jonathan Cameron <jic23@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: David Lechner <dlechner@baylibre.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Support Opensource <support.opensource@diasemi.com>,
	Cosmin Tanislav <cosmin.tanislav@analog.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	Antoniu Miclaus <antoniu.miclaus@analog.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-input@vger.kernel.org,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: [PATCH v2 0/7] regulator: new API for voltage reference supplies
Date: Mon, 29 Apr 2024 18:40:08 -0500
Message-ID: <20240429-regulator-get-enable-get-votlage-v2-0-b1f11ab766c1@baylibre.com>
X-Mailer: git-send-email 2.43.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.12.4
Content-Transfer-Encoding: 8bit

In the IIO subsystem, we noticed a pattern in many drivers where we need
to get, enable and get the voltage of a supply that provides a reference
voltage. In these cases, we only need the voltage and not a handle to
the regulator. Another common pattern is for chips to have an internal
reference voltage that is used when an external reference is not
available. There are also a few drivers outside of IIO that do the same.

So we would like to propose a new regulator consumer API to handle these
specific cases to avoid repeating the same boilerplate code in multiple
drivers.

As an example of how these functions are used, I have included a few
patches to consumer drivers. But to avoid a giant patch bomb, I have
omitted the iio/adc and iio/dac patches I have prepared from this
series. I will send those separately but these will add 36 more users
of devm_regulator_get_enable_read_voltage() in addition to the 6 here.
In total, this will eliminate nearly 1000 lines of similar code and will
simplify writing and reviewing new drivers in the future.

---
Changes in v2:
- Reworked regulator patch to remove dev_err_probe() and properly unwind
- Combined two proposed functions into a single function
- Renamed function to devm_regulator_get_enable_read_voltage() everywhere
- Fixed other feedback on consumer patches (see individual patches)
- Picked up Jonathan's Reviewed-bys (hopefully changes were trivial enough)
- Link to v1: https://lore.kernel.org/r/20240327-regulator-get-enable-get-votlage-v1-0-5f4517faa059@baylibre.com

---
David Lechner (7):
      regulator: devres: add API for reference voltage supplies
      hwmon: (adc128d818) Use devm_regulator_get_enable_read_voltage()
      hwmon: (da9052) Use devm_regulator_get_enable_read_voltage()
      iio: addac: ad74115: Use devm_regulator_get_enable_read_voltage()
      iio: frequency: admv1013: Use devm_regulator_get_enable_read_voltage()
      staging: iio: impedance-analyzer: ad5933: Use devm_regulator_get_enable_read_voltage()
      Input: mpr121: Use devm_regulator_get_enable_read_voltage()

 Documentation/driver-api/driver-model/devres.rst |  1 +
 drivers/hwmon/adc128d818.c                       | 57 +++++++----------------
 drivers/hwmon/da9052-hwmon.c                     | 38 ++++-----------
 drivers/iio/addac/ad74115.c                      | 40 ++++++----------
 drivers/iio/frequency/admv1013.c                 | 40 ++++------------
 drivers/input/keyboard/mpr121_touchkey.c         | 45 ++----------------
 drivers/regulator/devres.c                       | 59 ++++++++++++++++++++++++
 drivers/staging/iio/impedance-analyzer/ad5933.c  | 26 +----------
 include/linux/regulator/consumer.h               |  7 +++
 9 files changed, 124 insertions(+), 189 deletions(-)
---
base-commit: 84c1815e46bdcb8bb0259db3d6cdd934cb70a0e9
change-id: 20240326-regulator-get-enable-get-votlage-5dedf40ff338
