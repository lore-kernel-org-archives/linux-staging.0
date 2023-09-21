Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 080ACB676
	for <linux-staging@lists.linux.dev>; Thu, 21 Sep 2023 14:22:31 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-401f68602a8so11042255e9.3
        for <linux-staging@lists.linux.dev>; Thu, 21 Sep 2023 07:22:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1695306150; x=1695910950; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iwcSCZesHpouCmyM1x03gSJSlBimDoKKMQ92GEpbtM8=;
        b=asTE7l29zYLvliJiVjb5xM6VLa7pqviAfcszqTyCGs25mgSHAOoRtO4GfC/ovFkUKi
         INMuiAGHfiapYt0qGBR9ezrAN8KE2HwCaqaULDVSFPOpJlaLEW2bUGKRdiTzWlq32KGC
         2CoKsksSUSWKq/JypzBjst4sLjmx16B1wx15ybSa13TbHIVUyNAP+EFu4tycT1WdlBt3
         YLwW7+No+VqQyeXWkaANk4nuGEqJjVGbNEHdGItYFcFkN+VYO5ugeJrZTK6ZkJuHBqSz
         YU3ZhGK0CnckQCnpv9lOw3cTkDHG6ml86jXWf2XLgMc1GT7KNgY0BYuH8U8BZ6INPDzn
         4z5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695306150; x=1695910950;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iwcSCZesHpouCmyM1x03gSJSlBimDoKKMQ92GEpbtM8=;
        b=ev4pl1jak8X5608Y0WxuBOiF0OXNJefI4gogCRwpsNCFMJjQtw+5M2eBw6ePAyf0fR
         CXTR9YzEsE2BLkpITnfwMWp2jxXL9L1JJuUXx/jYDg/uKlXsfj5AZbRbea+V2ykOB1QQ
         jCZWkCAbLv0IFrb95Ha1qv5tdvLUSgRNXJYuf0kIJjAq4v5GvvJ9w+WT57EXyjQZQfap
         TAjD79JKvKtbs1F4D1rxxtI00SxS6Fhs3bG1J3ziduza7UiQGW3efOIV8v+Bbp1Rw0nl
         NvoDqDM3spYqgnizqtIuFI4OPBX/7mibrTfoYxJEbTizKCsXwdrXg7IqJGGEkEqX3Gfx
         zaBQ==
X-Gm-Message-State: AOJu0YxB7WHqMCZ5H+JbmlFSOGwAoseqRxgczHkMyFaIVCow58BW3WFn
	99VcOrvTA/iDTFy45zksavpr4w==
X-Google-Smtp-Source: AGHT+IG49g6ISV8XsDHGebX6Lc2cVQ4WY3KL6XVuk0xRssZliSSwVsIESlfd0xSwvTf8N3arBNsQgw==
X-Received: by 2002:a05:6000:1752:b0:322:4892:17f with SMTP id m18-20020a056000175200b003224892017fmr922723wrf.7.1695306149946;
        Thu, 21 Sep 2023 07:22:29 -0700 (PDT)
Received: from localhost.localdomain (abordeaux-655-1-129-86.w90-5.abo.wanadoo.fr. [90.5.10.86])
        by smtp.gmail.com with ESMTPSA id n11-20020a5d4c4b000000b0031fbbe347ebsm1901426wrt.22.2023.09.21.07.22.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Sep 2023 07:22:29 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
To: linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-staging@lists.linux.dev
Cc: linux-kernel@vger.kernel.org,
	Jonathan Cameron <jic23@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Axel Haslam <ahaslam@baylibre.com>,
	Philip Molloy <pmolloy@baylibre.com>,
	David Lechner <dlechner@baylibre.com>
Subject: [v2 00/19] iio: resolver: move ad2s1210 out of staging
Date: Thu, 21 Sep 2023 09:19:26 -0500
Message-Id: <20230921141947.57784-1-dlechner@baylibre.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Changes since v1:
* Address initial device tree patch feedback
* Drop "iio: sysfs: add IIO_DEVICE_ATTR_NAMED_RW macro" (related cleanups
  also dropped for now, will address in a future series if needed)
* Apply improvements as a series as patches to the staging driver. It is not
  quite ready for the move out of staging patch yet.

This series has been tested on actual hardware using a EVAL-AD2S1210 evaluation
board. (Note: not all device tree features have been implemented in the driver
since the eval board doesn't support them out of the box. We plan to add them
later if needed.)

One thing left over from the staging driver that probably needs more attention
still is the fault handling (both the fault threshold attributes and how
userspace gets notified of fault conditions). We considered adding these as
events, but the fault conditions are related to internal measurements in the
chip that aren't available as channels.

Since the chip is designed to read the fault register each time we read the
data registers for one of the two channels it seems like faults should be
associated with channels one way or another. Would it make sense to add extra
channels for the internal signals that only have fault events (mostly with
IIO_EV_TYPE_THRESH)? Or would it make sense to add a new "flags" channel type
where the "raw" value is bit flags? Or something else?

Here is the table of available faults for context. Sine/cosine inputs are
internal signals.

| Bit | Description
+-----+------------
| D7  |  Sine/cosine inputs clipped
| D6  |  Sine/cosine inputs below LOS threshold
| D5  |  Sine/cosine inputs exceed DOS overrange threshold
| D4  |  Sine/cosine inputs exceed DOS mismatch threshold
| D3  |  Tracking error exceeds LOT threshold
| D2  |  Velocity exceeds maximum tracking rate
| D1  |  Phase error exceeds phase lock range
| D0  |  Configuration parity error

David Lechner (19):
  dt-bindings: iio: resolver: add devicetree bindings for ad2s1210
  staging: iio: Documentation: document IIO resolver AD2S1210 sysfs
    attributes
  staging: iio: resolver: ad2s1210: fix ad2s1210_show_fault
  staging: iio: resolver: ad2s1210: fix not restoring sample gpio in
    channel read
  staging: iio: resolver: ad2s1210: fix probe
  staging: iio: resolver: ad2s1210: always use 16-bit value for raw read
  staging: iio: resolver: ad2s1210: implement IIO_CHAN_INFO_SCALE
  staging: iio: resolver: ad2s1210: use devicetree to get fclkin
  staging: iio: resolver: ad2s1210: use regmap for config registers
  staging: iio: resolver: ad2s1210: add debugfs reg access
  staging: iio: resolver: ad2s1210: remove config attribute
  staging: iio: resolver: ad2s1210: rework gpios
  staging: iio: resolver: ad2s1210: implement hysteresis as channel attr
  staging: iio: resolver: ad2s1210: refactor setting excitation
    frequency
  staging: iio: resolver: ad2s1210: read excitation frequency from
    control register
  staging: iio: resolver: ad2s1210: rename fexcit attribute
  staging: iio: resolver: ad2s1210: convert resolution to devicetree
    property
  staging: iio: resolver: ad2s1210: add phase_lock_range attributes
  staging: iio: resolver: ad2s1210: add triggered buffer support

 .../bindings/iio/resolver/adi,ad2s1210.yaml   | 150 +++
 .../sysfs-bus-iio-resolver-ad2s1210           | 109 ++
 drivers/staging/iio/resolver/Kconfig          |   1 +
 drivers/staging/iio/resolver/ad2s1210.c       | 948 +++++++++++-------
 4 files changed, 857 insertions(+), 351 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/iio/resolver/adi,ad2s1210.yaml
 create mode 100644 drivers/staging/iio/Documentation/sysfs-bus-iio-resolver-ad2s1210

-- 
2.34.1

