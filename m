Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 428D1435ED8
	for <linux-staging@lists.linux.dev>; Fri, 10 Jul 2026 16:00:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783699225; cv=none; b=kEI9FrpVjNbuwP+Y+XrXfnO32qRKGMAz0yEiiU5lXh/EHZfL0LAgp7r9+7BELiPZ+fv0y4rb1nB6KQ3AftRf7xBBBnXv0E1sK5XoJ5DSE0Mpz91w81ooOJn9wLYWCiuuTk5XFtEP6hvVICR+pESygQFCYN81QHNIEPs9hRPLug4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783699225; c=relaxed/simple;
	bh=2kx7pUx9tfhx0zv+z3s5tqYIU5nastRIq2hdNkClcbQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KLz83LhokWbw++YqNfSnnMnBdGmVXRhSarx1q6fzcYGgaP4RjqC4HZ5Qg/szWCLL+ozwaSjZsP4TU9+AeJfyTezcWK91+iRgX5DYQvbkQpPQXXvuAYNxyJVOy9AOeokGDwW5yU9D941IuU6yQUIvPtx8qb75qPW5BAOFtPxi2Lo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qYhx8cjV; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qYhx8cjV"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5b0190a62beso245992e87.0
        for <linux-staging@lists.linux.dev>; Fri, 10 Jul 2026 09:00:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783699214; x=1784304014; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ck1r2NVwZBaaF90kGpS5I0sjGQcOnMc2dil2XeQuca4=;
        b=qYhx8cjV+IDK7llxU/3AMwmdwTVvGegiYYFsbk5QdDLd2qVYOgzr7UKpRUcW9lNM/z
         GhnFMtoVMxiw7qGe7iMk+MfVOyoFveMuxGhLbSJRNl0LVjXs3pfyYAQS+nkUSjRB2e2y
         yL6FXDZVC0yOXvKGJKhPnWZyfFRxIG/3hJIqhWY6G7jMuLBPeBysW6l37kX2hwBG/rnq
         cq6a6SeY6kTm63nEnwrBAExHOfzYlS0Yd7DWDJsmHd23jM3pAqIKhmvqkK3mQYNQjfYN
         DXbblWV4EMu7snTdHw7GoeBL4wTMYgdTDrYhZUta9kqDJcFoHC8Eva6kZf1BDLmccpxG
         tMxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783699214; x=1784304014;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ck1r2NVwZBaaF90kGpS5I0sjGQcOnMc2dil2XeQuca4=;
        b=IzLo9MER5EqKl7D37fuiGRWozwO9mWhmak0Q9ObhTVKlRxQPSGo/3ZTugCva/35OIm
         FmUAcCIN4pA7GzKATbPzmWh+FOv67zmF7t62C3M3GsngIzpGgjBXg/OPolM3C6kqs0Jn
         +MKNeQdh/UQYkEzSihfVcMKW3LFPIr/4TNbijTzr/cnuTliA91/JS03iQfoFTTUnSSAc
         H0NizjicRyK1OnO6kh1DEmxJgUziVDwmuh/A3b2hPuBdGucuEhXMpf1Wkh14YF+dtQtn
         UmAD9Kl5AvQmCPjD3UuwY2WJX6uinHg1ytReFxrnOboYxhul8lY2PEjoCUx3xAjDvtJ4
         LBEA==
X-Forwarded-Encrypted: i=1; AHgh+RpJaBGvkxwRRylN3m/9zA9U6BsNc/NXBRF3MoLu5in530EB8f8nmVhHLn81fUYLx94ybGnXn8Hb1YqI3L20@lists.linux.dev
X-Gm-Message-State: AOJu0YyaB+WXDFxto8AHndIsA3xAcW4fEXxDvoOp+FMLUGpt+6awMrw8
	DCF/ghDKPgTQqgfxAu0gP2Y6lE/gNmAdw5lbrsCveCAJxtV0JDBpk5qY
X-Gm-Gg: AfdE7clOH0F5ppScx6ER6+BJ+YfMeKqG7bIAW6sScjNA0piv7AcvSXFH8ifTt+jnRep
	QY8gFU4QQsiby3/WVIgfxvACTyFE6rr9USKS0A1zdMDptJmF03xdcAUEKfCOu3BscZuiH/NhUZ/
	e0fVtja8FSfp2pQt6W5yEx0NOVMpWf/ZUbPL4JfvkhRVCjvQze5pmtICMdMYRuJYf18ObiBN7zY
	9QXsXX37jRcjwPwBed6lfgu+uBwmQPASnsl06R6UPeK4Z4onbq43vqKXwNVynP9w5g8z+xqmKCm
	b7Rm20IfGQXeTIoXmkQZZdP4ZRU09z2MAKZZSLbQS8lxq45EYLZLQHFRwdmbJYShvz+b+BcJXDT
	CXlrsCWMYJWJ5XPJAoXAeRPUJm8dvYpH/f+mSmcO7jBW2maWwGRnx8svmYGqS0oFZxX2b3hZ+in
	KCsejwJExyX57I5QUU7H1V6O86
X-Received: by 2002:a05:6512:12cd:b0:5ae:bce5:70f2 with SMTP id 2adb3069b0e04-5b0115af09amr1756207e87.4.1783699213314;
        Fri, 10 Jul 2026 09:00:13 -0700 (PDT)
Received: from localhost ([5.250.49.195])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b01ca54fddsm708567e87.33.2026.07.10.09.00.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 09:00:12 -0700 (PDT)
From: Taha Narimani <tahanarimani3443@gmail.com>
To: jic23@kernel.org,
	lars@metafoo.de,
	Michael.Hennerich@analog.com,
	gregkh@linuxfoundation.org
Cc: dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Taha Narimani <tahanarimani3443@gmail.com>
Subject: [PATCH v3 RFC v3] dt-bindings: iio: adc: add ad7816/7/8 digital temperature sensor / ADC
Date: Fri, 10 Jul 2026 16:00:00 +0000
Message-ID: <20260710160001.29856-1-tahanarimani3443@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the Analog Devices AD7816, AD7817, and AD7818 digital
temperature sensor and ADC bindings in YAML format.

Please note that the driver for this device is currently in drivers/staging.
This patch is sent as an RFC to clean up and standardize the device tree
bindings prior to any major driver refactoring.

While reviewing the AD7816/7/8 datasheet to correctly document the properties,
it was noted that the current staging driver attempts to request a 'busy' GPIO
for both AD7816 and AD7817. However, the AD7816 is an 8-pin device and does
not possess a BUSY pin (only the 16-pin AD7817 has it). Therefore, in this
binding, busy-gpios is strictly limited to adi,ad7817.

This resolves the checkpatch.pl warnings regarding undocumented DT
compatible strings.

Signed-off-by: Taha Narimani <tahanarimani3443@gmail.com>
---
Changes in v3:
  - Removed redundant conditional check around gpiod_get_value() as suggested by Andy Shevchenko and Dan Carpenter.
  - Switched to dev_err_probe() to avoid deferred probe spamming.
  - Introduced local struct device *dev pointer in probe and kept the GPIO request on a single line for better readability.
  - Added the missing Fixes tag requested by Jonathan Cameron.

 .../bindings/iio/adc/adi,ad7816.yaml          | 105 ++++++++++++++++++
 1 file changed, 105 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/adc/adi,ad7816.yaml

diff --git a/Documentation/devicetree/bindings/iio/adc/adi,ad7816.yaml b/Documentation/devicetree/bindings/iio/adc/adi,ad7816.yaml
new file mode 100644
index 0000000..48563e4
--- /dev/null
Changes in v3:
  - Removed redundant conditional check around gpiod_get_value() as suggested by Andy Shevchenko and Dan Carpenter.
  - Switched to dev_err_probe() to avoid deferred probe spamming.
  - Introduced local struct device *dev pointer in probe and kept the GPIO request on a single line for better readability.
  - Added the missing Fixes tag requested by Jonathan Cameron.

+++ b/Documentation/devicetree/bindings/iio/adc/adi,ad7816.yaml
@@ -0,0 +1,105 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/iio/adc/adi,ad7816.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Analog Devices AD7816/7/8 digital temperature sensor / ADC
+
+maintainers:
+  - Taha Narimani <tahanarimani3443@gmail.com>
+
+description: |
+  Analog Devices AD7816, AD7817, and AD7818 10-Bit general purpose ADC and
+  temperature sensor. The device communicates via an SPI interface.
+
+properties:
+  compatible:
+    enum:
+      - adi,ad7816
+      - adi,ad7817
+      - adi,ad7818
+
+  reg:
+    maxItems: 1
+
+  spi-max-frequency:
+    maximum: 12500000
+
+  vdd-supply:
+    description: Main power supply.
+
+  vref-supply:
+    description: |
+      Optional external reference voltage supply. If not provided, the
+      internal reference is used. Applicable for AD7816 and AD7817.
+
+  rdwr-gpios:
+    maxItems: 1
+    description: GPIO connected to the RD/WR pin.
+
+  convert-gpios:
+    maxItems: 1
+    description: GPIO connected to the CONVST (Convert Start) pin.
+
+  busy-gpios:
+    maxItems: 1
+    description: GPIO connected to the BUSY pin. Only applicable for AD7817.
+
+  interrupts:
+    maxItems: 1
+    description: OTI (Over Temperature Indicator) interrupt. Active low.
+
+required:
+  - compatible
+  - reg
+  - vdd-supply
+  - rdwr-gpios
+  - convert-gpios
+
+allOf:
+  - $ref: /schemas/spi/spi-peripheral-props.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: adi,ad7817
+    then:
+      required:
+        - busy-gpios
+    else:
+      properties:
+        busy-gpios: false
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: adi,ad7818
+    then:
+      properties:
+        vref-supply: false
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    spi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        adc@0 {
+            compatible = "adi,ad7817";
+            reg = <0>;
+            spi-max-frequency = <1000000>;
+            vdd-supply = <&vcc>;
+            vref-supply = <&vref>;
+            rdwr-gpios = <&gpio 5 GPIO_ACTIVE_HIGH>;
+            convert-gpios = <&gpio 6 GPIO_ACTIVE_HIGH>;
+            busy-gpios = <&gpio 7 GPIO_ACTIVE_HIGH>;
+            interrupts = <20 IRQ_TYPE_LEVEL_LOW>;
+            interrupt-parent = <&gpio>;
+        };
+    };
-- 
2.53.0

