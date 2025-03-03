Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1CBF1EB9ED
	for <linux-staging@lists.linux.dev>; Mon,  3 Mar 2025 23:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741045765; cv=none; b=u0av3pYIGI9RrNIhdM6/dUd2s2rkc/dlGNTyGo3VgeEHDYylBA1uud4POIryjdTSQI0r1vY/cklfH0kz8qxuVR5d0/vuxAw5phpArnZsF8jiO/SL3anOiRhoJebE8LtFzVfmop5fWcKcuUdwwpBICmIWbENnqVYjH1OJd04ZGfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741045765; c=relaxed/simple;
	bh=oUi0jUhO0onTNNPUZafZGwsnGSvTxM55zWWRbgJAGRE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=YhwyJ/7pPO8g0dBK2034khqEeSIN/fzyBTNBplZMKqyHq560y2trKdCgif85AzF5/KHcE19i83rw38uH9f7yzV3PVGAAhcD3r4P/7j9bAlICmZeKwXmuSejZQs+uUGmh1js1wFxZF/Khvj08Cqh8EjLmwaLOZO5U3RpJnQtpeLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Run5kIL0; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Run5kIL0"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2239f8646f6so39219765ad.2
        for <linux-staging@lists.linux.dev>; Mon, 03 Mar 2025 15:49:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741045763; x=1741650563; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uYJ1AOOF6Fuast7FuJwQwgJn1W/QJXvpVCQfOQs8dx4=;
        b=Run5kIL0ze2anRZXGCKY0Y4SArMoxm6hNQXwHKX7zP8dCYHR51Q0/ikcJHJaCq2HST
         7X8HSSqtgwwcZoJzBtrgODrol8sKRLxphWFE/P6zdCFoU/NrWVFNrVgbeS0SNXG7yBii
         idNyPGcXUz52mp4OTtUYCRJuEbH+sNFinRNhuY4/vzSukDrgm+HFQMfm6YL01pHEpEsU
         pOtDFqaM7uTZimZEJL40HwSkUjHkVp/BqzjsNS4oMqFPdwD+59PckcPEZJvVwXk5qcwa
         GGqEgeOAMEyTVyvafGjCmoxma1nJZkKsDxWYvWMKeIzJttXlljrozi4Oi5MFFFJOWn42
         UuWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741045763; x=1741650563;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uYJ1AOOF6Fuast7FuJwQwgJn1W/QJXvpVCQfOQs8dx4=;
        b=BZv9VxRmh7b14Ffx3c5w78A/15IQD8SSMG5stdTHZKFJYUyaQddiZOdhElJoybzbOa
         iLCvTyNRAGYyql8Q/pS4JJ/GtXQrcyrb0FeZT8MB1HIEgBFY6j5sF+jXksr4GUoDqTVU
         3Z4H3t9KpOjC6dqF+i31JG+jQPFuqpv811ua4ZjdVZhTWHOwEdKm/9wtl2iK1qzjGRu7
         mKQ60/kgCccuyhyOpoPy1rpqxRrc6Y7lerSWiAVp5ZF/UZ6GwwaYfjmZxZ5UWwkZbbpI
         93oVE6auPxp6XWokk8LbYs8qc7hW4eeMHUhWPZI8aaEDLFMocRGYiU4DZ4+s5hoiZAAO
         K/IA==
X-Forwarded-Encrypted: i=1; AJvYcCUtuzmXWCEH2tuL/1iLq4LhYLiN/0M9j0f4ImmYah7OhnLU3SDfLMw/m46OtfrfbngpvTZ+BJPXLDj3bqDC@lists.linux.dev
X-Gm-Message-State: AOJu0YxnsutmpJY/bwJ+wcgsfr6P83XTnhQEio+7ci2FmzfETWT3jy+a
	JlOj8VqdB7aqDKKEqNzzeJwYnezannhxcHIYUQhBs8DIqIA02kG3
X-Gm-Gg: ASbGnctq6VCAOtiMzUfcpI8Rbnkdl47P0db8fmiiGKT7h/p+uJEh+77c9FduPrR4S5q
	8ykb3sfxVEfLFGEWPp0Op+EHYNohBZT9vNaBfFklkEybCNuKWxIBZ1rj4sFwKQHVo0Ek5AnaOPU
	OyAe+5y2+EvQhh5Z2b7FjmgQ90jFxAeWDrVE2ZGg9Qox3pjp3PfOp/qqHg0CqR3Iy3FnlsBjnvM
	CQfY7I0Wf/q2I32ragmTNfq1+4+uLQ+cTt4EWiHhZx9zIObyY7+SJJi+YrSSvTMDglw+0uRcJjg
	y8TwsATFAy1CeDIVghhDgd+Im8+3clAavkof1AXepUHRu2zUJ4OsVD7ZG6G/tV/JdY9A
X-Google-Smtp-Source: AGHT+IGud6PYFMMPUpGldM4VW41ELjduKt3ffPZ3XDhZP9ZtgQhTGW1FAO3MuExVyqDYgDsAPDZcwQ==
X-Received: by 2002:a05:6a20:3946:b0:1ee:ace8:8181 with SMTP id adf61e73a8af0-1f2f4d1d213mr26375064637.21.1741045762741;
        Mon, 03 Mar 2025 15:49:22 -0800 (PST)
Received: from danascape.tail34aafc.ts.net ([2402:e280:218d:2e5:7b03:1e42:d492:fb71])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af180155f85sm5689283a12.62.2025.03.03.15.49.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 15:49:22 -0800 (PST)
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
Subject: [PATCH] dt-bindings: iio: accel: add binding documentation for ADIS16203
Date: Tue,  4 Mar 2025 05:19:13 +0530
Message-Id: <20250303234913.66614-1-danascape@gmail.com>
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
 .../bindings/iio/accel/adi,adis16203.yaml     | 52 +++++++++++++++++++
 1 file changed, 52 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/accel/adi,adis16203.yaml

diff --git a/Documentation/devicetree/bindings/iio/accel/adi,adis16203.yaml b/Documentation/devicetree/bindings/iio/accel/adi,adis16203.yaml
new file mode 100644
index 000000000000..e67e856266f5
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
+    enum:
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

