Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 308F2315B2
	for <linux-staging@lists.linux.dev>; Tue, 10 Oct 2023 21:12:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="EIGqWe4I"
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-1dd1db54d42so4226240fac.3
        for <linux-staging@lists.linux.dev>; Tue, 10 Oct 2023 14:12:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1696972374; x=1697577174; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZlsnSgCmX4sVGhEbLuDndjyGxg5h5NrDjU/cZAb9NoA=;
        b=EIGqWe4IN+4c8ztiMslRewHWoErYb05Xywi4PMRYRl3rowVXmuL/hHdUbzDkVgGm1s
         Nzx9gJ77X8XUydcMUMAVNo/MqEWTn7M5J8tFpjOYyl+386sQS3WQ107SJvZKYZUkuoFN
         osCtlupNcuVAmmJlm3rlwqqw7atL9I9KlMDFglU36aa0yLPArl9R6DJnNuScQ9rLefJa
         Jku4NEXU9o+EicB6/Qm68CvA6iEkHQwCstp8MNT9ddN/Qdbuu6fbbuXlgUJr+OOvKREF
         RAbRjvaIhTMScCBWATpHZOqXw35xOHqGY+wnTC7sTM3tj8DuTV1bJ9EuC+WatSGecyqy
         JGYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696972374; x=1697577174;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZlsnSgCmX4sVGhEbLuDndjyGxg5h5NrDjU/cZAb9NoA=;
        b=l5/LPvnvRgpylI7z9Xw9EWj3sA5zzaaZ33x8SSrH+Mw2GchZcI6+DSE0v/x/HuhpJ2
         vJEk6iSMKpC9FTOnrp48++6aGCshO2BxVsC5WNBLoQxoxqRg1hi6xQte0DV+SUFXrD8c
         H4Cu6q24zDCzM8jtEvlX5ZcPwnVpjhKVmwV+Jw94rN7jqnZ+KvemROC+MjE+GbbLYsCO
         x0j2O+WdP0zsSogQxdNeBeEQ3iixOf3txD/4uHanFCdlidkAc9ol4kKYHisDCpWxmtQh
         edrqikQGPX5dgkWFkKhoaWErup2jdKHzDSTx9logJm4TT1EPOQQELumWnJJDsbS20iuG
         Ab2g==
X-Gm-Message-State: AOJu0YxwDgoj4o1y3DlZYmQsjwJYNwk3y0QbYNhIbjZ1k2uN2+aDF5WE
	BzhYLdQltAIQduHVeZxobOUf+w==
X-Google-Smtp-Source: AGHT+IFSw4GHNmx2wRUTzM1w0z5iHkn32KDkZKdCIDHjQDJtfMdEts3yp7oPhq3RhZHVfPAL7K6rqw==
X-Received: by 2002:a05:6870:808a:b0:1a6:c968:4a15 with SMTP id q10-20020a056870808a00b001a6c9684a15mr22571454oab.4.1696972374046;
        Tue, 10 Oct 2023 14:12:54 -0700 (PDT)
Received: from freyr.lechnology.com (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id ed46-20020a056870b7ae00b001e98b1544fesm52494oab.9.2023.10.10.14.12.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Oct 2023 14:12:53 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
To: linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev
Cc: David Lechner <dlechner@baylibre.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	=?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
	Axel Haslam <ahaslam@baylibre.com>,
	Philip Molloy <pmolloy@baylibre.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 0/4] iio: resolver: move ad2s1210 out of staging
Date: Tue, 10 Oct 2023 16:12:32 -0500
Message-ID: <20231010-ad2s1210-mainline-v5-0-35a0f6ffa04a@baylibre.com>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.12.3
Content-Transfer-Encoding: 8bit

This series is working towards moving the ad2s1210 resolver driver out of
staging (after 13 years!). It involves a bunch of fixes and improvements
to make proper device tree bindings and use standard IIO sysfs attributes.

This series has been tested on actual hardware using a EVAL-AD2S1210 evaluation
board. (Note: not all device tree features have been implemented in the driver
since the eval board doesn't support them out of the box. We plan to add them
later if needed.)

---

v5 changes:
* Dropped applied patches:
  * "staging: iio: resolver: ad2s1210: do not use fault register for dummy read"
  * "staging: iio: resolver: ad2s1210: implement hysteresis as channel attr"
  * "staging: iio: resolver: ad2s1210: convert fexcit to channel attribute"
  * "staging: iio: resolver: ad2s1210: convert resolution to devicetree property"
  * "staging: iio: resolver: ad2s1210: add phase lock range support"
  * "staging: iio: resolver: ad2s1210: add triggered buffer support"
  * "staging: iio: resolver: ad2s1210: convert LOT threshold attrs to event attrs"
  * "staging: iio: resolver: ad2s1210: convert LOS threshold to event attr"
  * "staging: iio: resolver: ad2s1210: convert DOS overrange threshold to event attr"
  * "staging: iio: resolver: ad2s1210: convert DOS mismatch threshold to event attr"
  * "staging: iio: resolver: ad2s1210: rename DOS reset min/max attrs"
  * "iio: event: add optional event label support"
  * "staging: iio: resolver: ad2s1210: implement fault events"
  * "staging: iio: resolver: ad2s1210: add register/fault support summary"
  * "staging: iio: resolver: ad2s1210: add label attribute support"
  * "staging: iio: resolver: ad2s1210: remove fault attribute"
* Added new patches:
  * "staging: iio: resolver: ad2s1210: refactor sample toggle"
  * "staging: iio: resolver: ad2s1210: clear faults after soft reset"
  * "iio: resolver: ad2s1210: move out of staging"

Link to v4: https://lore.kernel.org/r/20231005-ad2s1210-mainline-v4-0-ec00746840fc@baylibre.com

v4 changes:
* Dropped applied patches:
  * "dt-bindings: iio: resolver: add devicetree bindings for ad2s1210"
  * "staging: iio: resolver: ad2s1210: read excitation frequency from
    control register"
  * "staging: iio: resolver: ad2s1210: refactor setting excitation
    frequency"
  * "staging: iio: resolver: ad2s1210: rework gpios"
  * "staging: iio: resolver: ad2s1210: remove config attribute"
  * "staging: iio: resolver: ad2s1210: add debugfs reg access"
  * "staging: iio: resolver: ad2s1210: use regmap for config registers"
  * "staging: iio: resolver: ad2s1210: use devicetree to get CLKIN rate"
  * "staging: iio: resolver: ad2s1210: implement IIO_CHAN_INFO_SCALE"
  * "staging: iio: resolver: ad2s1210: always use 16-bit value for raw
    read"
  * "staging: iio: resolver: ad2s1210: sort imports"
  * "staging: iio: resolver: ad2s1210: remove spi_set_drvdata()"
  * "staging: iio: resolver: ad2s1210: check return of ad2s1210_initial()"
  * "staging: iio: resolver: ad2s1210: remove call to spi_setup()"
  * "staging: iio: resolver: ad2s1210: fix use before initialization"
* Added new patches:
  * "staging: iio: resolver: ad2s1210: do not use fault register for
    dummy read"
  * "iio: event: add optional event label support"
  * "staging: iio: resolver: ad2s1210: add register/fault support summary"
  * "staging: iio: resolver: ad2s1210: remove fault attribute"
  * "staging: iio: resolver: ad2s1210: simplify code with guard(mutex)"
* Fixed DT property name in commit description of "staging: iio:
  resolver: ad2s1210: convert resolution to devicetree property"
* Fixed compile error in "staging: iio: resolver: ad2s1210: implement
  fault events".
* Fixed angl0 hysteresis raw values when assigned-resolution-bits != 16.
* Fixed missing word in "staging: iio: resolver: ad2s1210: convert DOS
  overrange threshold to event attr" commit description.
* Fixed missing static qualifier on event attribute definitions.
* Dropped used of X/Y modifiers on sine/cosine channels.
* Changed type/direction on some events.
* Added event *_label attributes.

Link to v3: https://lore.kernel.org/r/20230929-ad2s1210-mainline-v3-0-fa4364281745@baylibre.com

v3 changes:
* Dropped applied patches:
  * "staging: iio: resolver: ad2s1210: fix ad2s1210_show_fault"
  * "staging: iio: resolver: ad2s1210: fix not restoring sample gpio in
    channel read"
* Dropped "staging: iio: Documentation: document IIO resolver AD2S1210
  sysfs attributes". We will attempt to use existing ABI for faults/
  thresholds in a future series.
* Added description of A0/A1 lines in DT bindings.
* Added power supply regulators to DT bindings.
* Moved sorting imports to separate patch.
* Renamed fclkin to clkin_hz.
* Added __be16 sample field to state struct for reading raw samples.
* Split out new function ad2s1210_single_conversion() from
  ad2s1210_read_raw().
* Split out new ad2s1210_get_hysteresis() and ad2s1210_set_hysteresis()
  functions.
* Fixed multi-line comment style.
* Added notes about soft reset not resetting config registers.
* Made use of FIELD_PREP() macro.
* Added more explanation to regmap commit message.
* Removed datasheet names from channel specs.
* Replaced "staging: iio: resolver: ad2s1210: rename fexcit attribute"
  with "staging: iio: resolver: ad2s1210: convert fexcit to channel
  attribute".
* Replaced "staging: iio: resolver: ad2s1210: add phase_lock_range
  attributes" with "staging: iio: resolver: ad2s1210: add phase lock
  range support"
* Added additional patches to convert custom device attributes to event
  attributes.
* Added patch for to add label attributes.

Link to v2: https://lore.kernel.org/r/20230921144400.62380-1-dlechner@baylibre.com

v2 changes:
* Address initial device tree patch feedback
* Drop "iio: sysfs: add IIO_DEVICE_ATTR_NAMED_RW macro" (related cleanups
  also dropped for now, will address in a future series if needed)
* Apply improvements as a series of patches to the staging driver. It is
  not quite ready for the move out of staging patch yet.

---
David Lechner (4):
      staging: iio: resolver: ad2s1210: refactor sample toggle
      staging: iio: resolver: ad2s1210: clear faults after soft reset
      staging: iio: resolver: ad2s1210: simplify code with guard(mutex)
      iio: resolver: ad2s1210: move out of staging

 .../ABI/testing}/sysfs-bus-iio-resolver-ad2s1210   |   0
 drivers/iio/resolver/Kconfig                       |  13 ++
 drivers/iio/resolver/Makefile                      |   1 +
 drivers/{staging => }/iio/resolver/ad2s1210.c      | 208 ++++++++++-----------
 drivers/staging/iio/Kconfig                        |   1 -
 drivers/staging/iio/Makefile                       |   1 -
 drivers/staging/iio/resolver/Kconfig               |  19 --
 drivers/staging/iio/resolver/Makefile              |   6 -
 8 files changed, 109 insertions(+), 140 deletions(-)
---
base-commit: 57fd97ead0e87ca528736f1945a3ba3096de2f3e
change-id: 20230925-ad2s1210-mainline-2791ef75e386

Best regards,
-- 
David Lechner <dlechner@baylibre.com>

