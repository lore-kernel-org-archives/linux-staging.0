Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD85620E7
	for <linux-staging@lists.linux.dev>; Thu, 21 Sep 2023 14:44:14 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-405361bb94eso6291145e9.0
        for <linux-staging@lists.linux.dev>; Thu, 21 Sep 2023 07:44:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1695307453; x=1695912253; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2dbJ671h4+Zrpefl6Lm2RwGWdFjdR10s5YR4gHySBBk=;
        b=g5scswc5t6FJ9YpSB5zMVlBbBHOvUpb2juCh1KrWi1lWSOUw1FA0wv0i/LdUnVTr/c
         lE3xoLlvQSy4p81Qugs1JViBpYUMGOsTJk7zkaqAHmKd1mIolspE88VQbMRWwlzTnAqC
         5CnvMYZlDtIL4A7Iyef2lH/sj9TDZ2HFGU3xcwYhjgk7mOpsvGcMoKPxjbDBqZkks4F0
         VEmGfMUWq2nH5b1EYfZCOs9JPa8yN/LwRRuyLbYNHwcgNPcTO+cnlGuDQQ/rEawEwIaB
         AQ0GYbdpPq179YUIPaGb9JphIpURVLu+wNC0H9Dsep3jTi0f+wlV5WyFS7WkrXnYBZc9
         bkyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695307453; x=1695912253;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2dbJ671h4+Zrpefl6Lm2RwGWdFjdR10s5YR4gHySBBk=;
        b=CmoKXoWVY+ZWQvKWoOKcBOXrUp6y0wtpthNaluuIztWuj+owW0lWzwE2W03N82SJVt
         ip/ZAxUM+AkeJalnTW1BM996D0fqauFT5ksxCxAY/zKz/wxGfjkKBU+7odCiwg8V7Gkz
         qjAH7Mka0JQqP1XbMnSnG0WX0vej+xCOwfzk68e9++K02n1iz2d0KPBeIitKXLTX+a1Y
         cVJS7exnwSDT14P8g3d8xFD4W1zTnBSNbjxt0uAt1NNITKrZxQK1cLL5iJSh7ZKfou95
         8XHJ3lp/VqYHbT2W/LMrcygJP1nEWJXkOkR8nEidu48jwlcuZcnSTROMtXaRn1CCRlDc
         lNBQ==
X-Gm-Message-State: AOJu0YzfypY1jmCYfOPYD/rArGj3wNvsxfktbr6ss1oEpGCw9Qz0EjQF
	YnS//1oCxD+dUSJhaumusPZLYA==
X-Google-Smtp-Source: AGHT+IFl1Y1y2zMR1iNlW+1IiVeZ0qyN3wFDv4S8/6ruNMMK2i/+yZoG4piAY0plFw/WCYJXxcy+mQ==
X-Received: by 2002:a05:600c:152:b0:404:2dbb:8943 with SMTP id w18-20020a05600c015200b004042dbb8943mr5711734wmm.2.1695307452618;
        Thu, 21 Sep 2023 07:44:12 -0700 (PDT)
Received: from localhost.localdomain (abordeaux-655-1-129-86.w90-5.abo.wanadoo.fr. [90.5.10.86])
        by smtp.gmail.com with ESMTPSA id s17-20020a1cf211000000b003fe2a40d287sm2125515wmc.1.2023.09.21.07.44.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Sep 2023 07:44:12 -0700 (PDT)
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
Subject: [PATCH v2 00/19] iio: resolver: move ad2s1210 out of staging
Date: Thu, 21 Sep 2023 09:43:41 -0500
Message-Id: <20230921144400.62380-1-dlechner@baylibre.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Resending v2 with proper `PATCH v2` prefix.

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

