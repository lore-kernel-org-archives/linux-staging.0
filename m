Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 412EE629
	for <linux-staging@lists.linux.dev>; Fri,  6 Oct 2023 00:51:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="t7uAYmJb"
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-1dc863efb61so972525fac.0
        for <linux-staging@lists.linux.dev>; Thu, 05 Oct 2023 17:51:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1696553465; x=1697158265; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Dj54Gl1jd+w9QgbJ5IpGgS95Y27Kw5ws4fL1QKoqHoA=;
        b=t7uAYmJb3EAOv3l0L53o0xL043XiW+xASrfT6OlLWkODcuBSS/Zpj+dnjH4mHKHb2I
         W+ftO7L3vJSfX23IcJO/kxKdVe7xqpDdVnFirZ5jnWbYjm4mB8fr/v58JqZI4ebyttng
         iQb4eiJrZ1HsJrWQwZ0HzGcj+j021hUz+5MK8cmOIVTSoioN5D92C5inJrkO4aKD0BUI
         DCohhAACzhBOP1NCM+xKCE7dpbPy2DNNC2n7xfoCjYRDnzkvs34eXhCbKbQGrGkFtQBy
         TTtjA/q4PUkzy0rhHurfMowuv7ZsUniDQnrZcO7WCq3eM324ep59WIBxuA2WQRH5JO8q
         +fUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696553465; x=1697158265;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Dj54Gl1jd+w9QgbJ5IpGgS95Y27Kw5ws4fL1QKoqHoA=;
        b=r9eahxeYll7WU5HLCl0Hch5XC7jHvbS4LJOiv0LKWAPuqmuBMCtW8//i1cs1NJT3VV
         +l78H6XdOapA+m5IRolyId2cyP5DKKZilCnNFMjQOMRrQ0PtR2MXkuXzDpIBW2xLSt9K
         WaM4iq0Tqbr+rZcv5vr4u9jTox6nE4lTC+O+Ei42pPa/MF5CR8kLbjJh5qnmo90Tg4wV
         4xWzitHrbA2tujKYWk0NYYdocsogICvtYd+zHUhAMEkLg4xHsyqBfqIfmpPL2zOKATo+
         tCLcYtuXj5EcFzNFNbdv2NUbIdOzHuO2tqjXBgG9foNDOylPkHeVhMHdbxSkK9a97sef
         fL6g==
X-Gm-Message-State: AOJu0YwYmSt02PFjwprsyDIfj8KBS5WDO69+wCeNx6xVID8jSLK0DctN
	FDwlMqmv7nUqGw00GwtqlHJ2eg==
X-Google-Smtp-Source: AGHT+IG1hSjqGVvnbK0ZQXLALAHV4h6eK08b8Sg1VE/BxT+UJ3tKdYKuqZ0DT9gCvR470zCjPxGqCw==
X-Received: by 2002:a05:6870:96a3:b0:1dc:7e71:d471 with SMTP id o35-20020a05687096a300b001dc7e71d471mr7341864oaq.31.1696553465199;
        Thu, 05 Oct 2023 17:51:05 -0700 (PDT)
Received: from freyr.lechnology.com (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id mo9-20020a056871320900b001dd0ff401edsm545072oac.51.2023.10.05.17.51.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Oct 2023 17:51:04 -0700 (PDT)
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
Subject: [PATCH v4 00/17] iio: resolver: move ad2s1210 out of staging
Date: Thu,  5 Oct 2023 19:50:17 -0500
Message-ID: <20231005-ad2s1210-mainline-v4-0-ec00746840fc@baylibre.com>
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
  * "iio: adc: MCP3564: fix the static checker warning"
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
David Lechner (17):
      staging: iio: resolver: ad2s1210: do not use fault register for dummy read
      staging: iio: resolver: ad2s1210: implement hysteresis as channel attr
      staging: iio: resolver: ad2s1210: convert fexcit to channel attribute
      staging: iio: resolver: ad2s1210: convert resolution to devicetree property
      staging: iio: resolver: ad2s1210: add phase lock range support
      staging: iio: resolver: ad2s1210: add triggered buffer support
      staging: iio: resolver: ad2s1210: convert LOT threshold attrs to event attrs
      staging: iio: resolver: ad2s1210: convert LOS threshold to event attr
      staging: iio: resolver: ad2s1210: convert DOS overrange threshold to event attr
      staging: iio: resolver: ad2s1210: convert DOS mismatch threshold to event attr
      staging: iio: resolver: ad2s1210: rename DOS reset min/max attrs
      iio: event: add optional event label support
      staging: iio: resolver: ad2s1210: implement fault events
      staging: iio: resolver: ad2s1210: add register/fault support summary
      staging: iio: resolver: ad2s1210: add label attribute support
      staging: iio: resolver: ad2s1210: remove fault attribute
      staging: iio: resolver: ad2s1210: simplify code with guard(mutex)

 Documentation/ABI/testing/sysfs-bus-iio            |   15 +
 drivers/iio/industrialio-event.c                   |   55 +
 .../Documentation/sysfs-bus-iio-resolver-ad2s1210  |   27 +
 drivers/staging/iio/resolver/ad2s1210.c            | 1194 ++++++++++++++++----
 include/linux/iio/iio.h                            |    8 +
 5 files changed, 1061 insertions(+), 238 deletions(-)
---
base-commit: 2d3dff577dd0ea8fe9637a13822f7603c4a881c8
change-id: 20230925-ad2s1210-mainline-2791ef75e386
