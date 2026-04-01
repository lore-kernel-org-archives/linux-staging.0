Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFCFD39FCB1
	for <linux-staging@lists.linux.dev>; Wed,  1 Apr 2026 16:25:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775060751; cv=none; b=hfFHwPwS6Jws0UMoCTh3MvBEPNf+26p6ZUktzGLDnn1kZG9E7iUqavyPf80DIMBcP83U6uAnNkrwtyQesE/eht1hPqxcJoj6Ye8/Gvjl9jAIGht/lCpx8F9KIs7U5wd/pS7pNvUet+TcRVPb/PC4a9VADZV49CXxEeW/gMHiuhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775060751; c=relaxed/simple;
	bh=y1smEGww2o/rd+W8nS0LWLrCoTwSm+mdCkNguHQRh2c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Vza3EbR405AjKi19sunQ+obktj5yIvQB9vHPSK3O2n/S+HrwW6wujkr8Am+weDTC9cwJSdmQV2O8cflQXh8NqfODilMaqYThuT4oB6eMl7aq86PP+dhtGSPMUg+u+5KeghVMecM6rB2qoIqfXoNNYhhWPtKOAIgznm1RjQ75JJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mirrorstack.ai; spf=none smtp.mailfrom=mirrorstack.ai; dkim=pass (2048-bit key) header.d=mirrorstack-ai.20230601.gappssmtp.com header.i=@mirrorstack-ai.20230601.gappssmtp.com header.b=AuJ5Kthi; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mirrorstack.ai
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mirrorstack.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mirrorstack-ai.20230601.gappssmtp.com header.i=@mirrorstack-ai.20230601.gappssmtp.com header.b="AuJ5Kthi"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-35d9f68d011so2826779a91.2
        for <linux-staging@lists.linux.dev>; Wed, 01 Apr 2026 09:25:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mirrorstack-ai.20230601.gappssmtp.com; s=20230601; t=1775060743; x=1775665543; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LScsGFwS6nIpkAboe0X19u7lqZkR6eLlyKmDNKTD1Lk=;
        b=AuJ5Kthi4ioiguQ91tyghk/jz+f1isB3lXMOLgf26qiNcHcgSmomc434xysPtW/uQY
         DTf1MNvsPIB4CzpOOy3x7ul0/7zdvCYQgXKG95syh/vmtxhKW+T1M5xGFnjQThN31GNk
         ldbcTdx0Z5UVwomLI/AijxVVpudl/69pZI8cg3yIOQst66H8bTXR4muQSa3f5dRCI9Ht
         K0f74FteoLMRK4iSF/fYp8rFOuCL14FqTlyhqEL20274/ZhTb2w3blnAgE6Q3Qd/8WkL
         BvJTyc4sUw3HI7kxhxBVMwMc0XvP9k+RaLltGIZNH2HIr7qYhW6fWVrOT2WMtpr0adWR
         HoxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775060743; x=1775665543;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LScsGFwS6nIpkAboe0X19u7lqZkR6eLlyKmDNKTD1Lk=;
        b=b5KVhWJc7m8+1J2iGVBTzYHdHCjVrvIYpDy4g4qNLIf13xrCawSvvA7xlrBrmxVkkR
         zlTXjKMGKy995hkbgPcq3zk7jFQhzm3hHCdLPXlXO59CXrvZdI9egooSA5aNn4ytaO0q
         5mE4ntMi5SoghF2pK4LA+ZuDFJQb0QwzPxsoQ22u8rMmrBc7nnb6ANxF6s3Je5aVZO/S
         wysgdWJan8OFzoVHlr1oHBP/OspOMPhEoUCMK1GxBtcJfTh71vPUJeQ/p4B4uen6CTC6
         4OtDu3ZoBuZ+TF+U/nL8XA6JtHORqpzZ+RL6xspA/pygPo9Udiu/WIWzOx95xR6WvUXI
         tvrw==
X-Forwarded-Encrypted: i=1; AJvYcCUdoxQ0EOp0vW3sv5+Kbys29dHLPnFFSvyvITHx0NVvgSUoS/Hb7sZJDRhuqv48bjzzzAHQdY8YzPpRshyM@lists.linux.dev
X-Gm-Message-State: AOJu0YwAly2QjhpdQVHJiM2u69V4TJ/EQ1cs6KQUGTE5AsoKnMU//s5s
	KvkY0kJHmQ7DrJ/ZbryWxt8dsrrQa/rEL6K59H66XtAexIPkc0XZ1MpFuAvAaKxRI7zXyRkw+wJ
	9J6V5NyupFwbU/Q==
X-Gm-Gg: ATEYQzwgRHK2w4CycrR8hfaXTvMXMwbgOInfLOVUCFi3AFm23cSN197rbeC90RzCxMl
	lp3vKJPDWz9iMjCuWh/ki49C+r8naYne0NXs3QUvXv5X6619DnieO/M9zanHwssUvCks8Enkws7
	WvHfgBk8PRs0WaYkULBuc/84N14P6nT+ef066sJLkBQ60JUE/BXZIa+RBoMPqKOuUnglSHlIJds
	Nnu3rg0Vi8vFu6DhrV+mTXypgYKJ1opl07xWlmxgvJgeK24j4DEIOvNmPwrx2mczelkZDG5xKrP
	0wmT8l8YuiV6erH6zCVBRpS6zl6YbkKGfGgS8uYQNBdUmdDG6x7qmgbzuxK1ysljwQs8Ibnl5gv
	BYpod9mFjLI+NZIe67GxVL5fMIvcz3g+FmibguQVmpNVEzNDvf9H31VSt88Bdf5j0nE95/hsK5n
	+adpwvWpHnYUJb8qd9KfNuHEPAv1UrNvFHiTA1v4wi8tlZrR2cuzySap9pYNx1EcIUn+JtwR1zz
	e7oZv2qBKCjqQIOVPnA5gfSgVvCr5TeiQIIES+FqA==
X-Received: by 2002:a17:90a:e710:b0:35d:a87b:ef69 with SMTP id 98e67ed59e1d1-35dc7070b31mr3944977a91.28.1775060742902;
        Wed, 01 Apr 2026 09:25:42 -0700 (PDT)
Received: from ip-172-26-8-186.ap-northeast-1.compute.internal ([2406:da14:e8:bc00:e546:17ee:7142:6d05])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35dd35e34eesm281813a91.2.2026.04.01.09.25.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 09:25:42 -0700 (PDT)
From: Sheng Kun Chang <nothingchang@mirrorstack.ai>
To: jic23@kernel.org
Cc: lars@metafoo.de,
	Michael.Hennerich@analog.com,
	dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	gregkh@linuxfoundation.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sheng Kun Chang <nothingchang@mirrorstack.ai>
Subject: [PATCH 1/3] dt-bindings: iio: accel: add binding for adi,adis16203
Date: Wed,  1 Apr 2026 16:24:55 +0000
Message-ID: <20260401162458.88110-2-nothingchang@mirrorstack.ai>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260401162458.88110-1-nothingchang@mirrorstack.ai>
References: <20260401162458.88110-1-nothingchang@mirrorstack.ai>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add devicetree binding documentation for the Analog Devices
ADIS16203 Programmable 360 Degrees Inclinometer, in preparation
for moving the driver out of staging.

Signed-off-by: Sheng Kun Chang <nothingchang@mirrorstack.ai>
---
 .../bindings/iio/accel/adi,adis16203.yaml     | 52 +++++++++++++++++++
 1 file changed, 52 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/accel/adi,adis16203.yaml

diff --git a/Documentation/devicetree/bindings/iio/accel/adi,adis16203.yaml b/Documentation/devicetree/bindings/iio/accel/adi,adis16203.yaml
new file mode 100644
index 000000000..6c5e2833c
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/accel/adi,adis16203.yaml
@@ -0,0 +1,52 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/iio/accel/adi,adis16203.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ADIS16203 Programmable 360 Degrees Inclinometer
+
+maintainers:
+  - Jonathan Cameron <jic23@kernel.org>
+
+description: |
+  Programmable 360 degrees inclinometer with SPI interface.
+    https://www.analog.com/en/products/adis16203.html
+
+properties:
+  compatible:
+    const: adi,adis16203
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  vdd-supply: true
+
+required:
+  - compatible
+  - reg
+
+allOf:
+  - $ref: /schemas/spi/spi-peripheral-props.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    spi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        inclinometer@0 {
+            compatible = "adi,adis16203";
+            reg = <0>;
+            spi-max-frequency = <2500000>;
+            interrupt-parent = <&gpio0>;
+            interrupts = <0 IRQ_TYPE_LEVEL_HIGH>;
+        };
+    };
+...
-- 
2.43.0

