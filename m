Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA2BE1487F4
	for <linux-staging@lists.linux.dev>; Mon,  3 Mar 2025 23:59:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741046380; cv=none; b=TbD6ibaq7OYFdxwCkXTvd5Eb2xuxBAQ1NQCKZtmIM65RIYKbUZNOZhHvtBpJOBlff8/lbCT3otmToWCAM9nF9otsiXeBnvvsSGCSuWTmvOBTV0QlRU15l3riTouXYq69U2WT602nKCk0z8m3PT430WEVOTHRCF4cA7a1nmSfB+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741046380; c=relaxed/simple;
	bh=04bpoOcPW4nahyQoGffhYfeUl/7cvNwek56IxXN5nLE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ZOJQnHDOlOhGV9QeE1uKD7UCn4dLjPDEwmkwAkS1AFPR0/d+R2iMhymtt/3NKgaoN+TWN2nBwuN2JQUOoMdEfSYBhTsuLX6pB3N1FqsD2VkzwJuMPVmxO53mOzLjw6VhbTMQkW8P57fXbGRuUUR3UkWR5F+A0fqREu4yOY4qd4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b8OXi/M5; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b8OXi/M5"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2234e4b079cso91244355ad.1
        for <linux-staging@lists.linux.dev>; Mon, 03 Mar 2025 15:59:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741046378; x=1741651178; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+Nl5k4lX8ykAjaBSh+OFtZkq9yFs9ZO8ZZS3/cchBXs=;
        b=b8OXi/M5FUTTMpsOvJBxrcoVlg3iC741pLWmSULoZvxxGMnimGSeCtz7MpXcMyPoH6
         mmnK6X1OMIyohtEr74Vp0k9Ohy37e7vsNIIJB7TSjvfGyLYZOoVdSHQ5Xf6bw6T+zQgO
         3sfomwQCVOPDkqtqeJgH1v7PPaO4wbQk1ygyH+UdlxcZFhq51TFHKTa7dPuKO+23t0X/
         eS7inYNtVR03bYUcYq77wx7TfxmaIDm8/cCM7J4iBVbcBNaWn1OtTCG1eaoHgj2DAiPk
         C9LSqJGIQUMDKZaW2i6gAxukeuitriO47vv47NM6+oou61lAc0kw3IZ1f7au47xvT+RV
         oZvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741046378; x=1741651178;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+Nl5k4lX8ykAjaBSh+OFtZkq9yFs9ZO8ZZS3/cchBXs=;
        b=ingSER4SqHGQ3+auSHX8eoRBhYlwVf/Jx6bgWe+NHE4zj7Afz/Aa6kYMe3sAJsv/Ae
         WVB/pmUxjvwZlMYRHmZibw/zWa6tTVI2bvJV8Xxp8wdIA0yxVYXt0/SZJ9QX4FSaTpSc
         fk1XtAVIcNb80+0GTa6Qbzq5uvi7wOgX8urlwquVGG73jItUeMgg36o3St8BtDfZVfq+
         R9jwyorDa113V0/r3l8rbUoVmoGsJlLFE3sAPcPT9zkv+F0wI07U90Dcq0y2Ze0OIJhu
         ugjKk1iXN75x8L4GyHHfw3oj9J2Zki3DoABGBGjwgpEggv8PZrkiHEEh1jAR15HDoc++
         Q11A==
X-Forwarded-Encrypted: i=1; AJvYcCXoqgC3UZFSOCyTjrvHi7wcqUuFcl7RfqiYOXd9JfXBHXtonAnJ3Z5Y2M8lT8sqEEr8x0OsxXsaSj1thOwM@lists.linux.dev
X-Gm-Message-State: AOJu0YwXSi3Z4t8Y+FLtVbq3JhU0DVeO3XAareQSy2LaYjjJAT6lqo1+
	NQLw5Xj5s8N08mI6vUH3uxbHnBLzgwsE0+mFAPdWg/TcI4K3wMOPoJIEYPJb
X-Gm-Gg: ASbGncvd/TsEi3ctPnt+MWwwBubhqug8tNFa6Z4XsZRVLq3RXSBXESrLnqsEcp2NXD+
	c/nK1mQzHmrO12G3L96h1Kksp02gk2Aur+Vbn7x2cx3uKgRH+qSuPPGxJcuDWtYPiBZoGKyjjd9
	74+T1JjlNjvq5JGtECPjJ1p7N4YZALNaY5cgcv6SY02+behidXl7d7ZpG//OqH8bdIivxNqvlIV
	+0W4vInk4Hj6Ep2Y0YGL+8pyEgdQ96CkouEP1P8w7bexrcg53BivzYaprhMc9hxpSjaNrqH7CgS
	qWghPxm/Xbq4itdwYWPGZj/ZQ/8Vcu7YvjieYF519PjpiVlBfqY2mrgqcfWii3R311+E
X-Google-Smtp-Source: AGHT+IGk+zORULG18C0l/CqE4lIgOVZvq9u81/ReypCKT4mvBK1lYyGlpNr3ONZlH2rHl5CMFl/KhA==
X-Received: by 2002:a17:902:ce91:b0:223:64bb:f657 with SMTP id d9443c01a7336-2236922352bmr222799545ad.46.1741046377894;
        Mon, 03 Mar 2025 15:59:37 -0800 (PST)
Received: from danascape.tail34aafc.ts.net ([2402:e280:218d:2e5:7b03:1e42:d492:fb71])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22350531e1asm83591775ad.240.2025.03.03.15.59.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 15:59:37 -0800 (PST)
From: Saalim Quadri <danascape@gmail.com>
To: jic23@kernel.org
Cc: lars@metafoo.de,
	Michael.Hennerich@analog.com,
	gregkh@linuxfoundation.org,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	21cnbao@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	Saalim Quadri <danascape@gmail.com>
Subject: [PATCH v2] dt-bindings: iio: accel: add binding documentation for ADIS16203
Date: Tue,  4 Mar 2025 05:29:30 +0530
Message-Id: <20250303235930.68731-1-danascape@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch add device tree binding documentation for ADIS16203.

Signed-off-by: Saalim Quadri <danascape@gmail.com>
---
Changes:
V1 - V2: change compatible property from enum to const

 .../bindings/iio/accel/adi,adis16203.yaml     | 52 +++++++++++++++++++
 1 file changed, 52 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/accel/adi,adis16203.yaml

diff --git a/Documentation/devicetree/bindings/iio/accel/adi,adis16203.yaml b/Documentation/devicetree/bindings/iio/accel/adi,adis16203.yaml
new file mode 100644
index 000000000000..64370f13e1dc
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/accel/adi,adis16203.yaml
@@ -0,0 +1,52 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/iio/accel/adi,adis16203.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Analog Devices ADIS16203 Programmable 360 Degrees Inclinometer
+
+maintainers:
+  - Barry Song <21cnbao@gmail.com>
+
+description: |
+  https://www.analog.com/media/en/technical-documentation/data-sheets/adis16203.pdf
+
+properties:
+  compatible:
+    const:
+      - adi,adis16203
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
+        accelerometer@0 {
+            compatible = "adi,adis16203";
+            reg = <0>;
+            spi-max-frequency = <2500000>;
+            interrupt-parent = <&gpio0>;
+            interrupts = <0 IRQ_TYPE_LEVEL_HIGH>;
+        };
+    };
+...
-- 
2.34.1

