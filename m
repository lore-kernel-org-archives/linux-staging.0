Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8E4C2E1758
	for <linux-staging@lists.linux.dev>; Fri,  5 Dec 2025 20:28:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764966517; cv=none; b=Y1HVrdrdn69NZGlbTQd1BgLR4Hz1CK3iSGt0yXhHe9CAcgL3SLq0zpzTmgWv8mRgCueozW3pXugEFvC75HLleWSZiAy88ArQyU5TBgEM+s9xbaGqBXALawmwz6rIvLWDME6MXa9hTv/m6DNCY+qPwI9PtO0is7X+/I5EIHm1j6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764966517; c=relaxed/simple;
	bh=azE6/sKR/pDr9h9pZaYF+h/EQIlraEjWOI9ZhVf1gRY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gsvzSaNZ8FZab3UqPMFnIu+qYDpx2H2GCsuianzeLmFfnLGcaaKS2hZnZOdXz3N3aFXCn1SEyhThnqV7GRNRseRR84ixdJ/OzKevhDkGx2UuQQc/UKxG7GAp8/IZYzUWu90iAV2S5rO7Dt2fKUAkpxy6Y6qBguRgaD7ei+eFei8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W41Q2Dxf; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W41Q2Dxf"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-29812589890so35520775ad.3
        for <linux-staging@lists.linux.dev>; Fri, 05 Dec 2025 12:28:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764966514; x=1765571314; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZogGanCrO7NukEfQvdNpvWFAmgObDEJxIVV+nj78Ze8=;
        b=W41Q2Dxf+S1zZVVQ+h/9/NHtZ7qoC3GQ5TU6Y0xblh5pfqCJA03r3XaEzPacHgHld8
         x5h+Vtj915a4iKzQ28r7ZZgvVIGZT3aT3HmN+SK45au5yAo0dnmz/UT/YRw4kuytuKSz
         ya69Oae2tdRpF3W0uXxNOfkhLiUDhdYt1O3TduF7hoQdXX3PwMr4Sdr3M6oNYblceZNY
         srHCx4xvoDPSF0gWMLkh75KSt8sfBFquAXKKMm3afIxvejRte6eWEghW74+IKV59UqcG
         /mzjNQpHwYtUE+bWxudKBn8QjaKV63t0STqBJPKF332JGMjNVaHCoaLp7F8VvWWB/27v
         2iLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764966514; x=1765571314;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZogGanCrO7NukEfQvdNpvWFAmgObDEJxIVV+nj78Ze8=;
        b=fqqWmLG7L1itgwvuBlHcHGylQPc7JfNqBwbicZ2DF29lnKWZCdn7g73sO/poWmGUnR
         zGBHvo3Rp6ZKbY9+8RcqFmuPrJBuRIlH963i8pdRXK9N/Vh/GjeZkR3NR31K9bN3twJd
         /7FjEDk4I1X+jAW0sBhzt6AkpMW9AL+ZV+XDW/u1q9CHDQJVY7joQZUpc0I8Uy/jFFmJ
         7fFiV6SVN2zH4knGolgV9pkzk0B1GCplMhKz5I5UYeS0iKi5wvWCV4nnGJhCQKE/Ocps
         nebYYE85C1m5lNMsuppDEZjlmCOcJRdf4A9M6d/MNJ2zkPOIeY6trVQOQNedlrz+fnih
         GdDw==
X-Forwarded-Encrypted: i=1; AJvYcCXAyKGa4gKvUIRI+W8crlSDtS1ybWO7t6kh08mxKQ6t2lATOGu6wr+x/4G8E8AhWdMVN3XFpx+5wbntjdCV@lists.linux.dev
X-Gm-Message-State: AOJu0YwuGBi5JYjQXSgzpfoqZ9+teD9rgRgtxy2AsMS4ptjczq8vJlNl
	P+l2ikzzBBRScplD19rMec8iBdIZUx2/Xg9NlzbuB/epruke2nYPcthk
X-Gm-Gg: ASbGncv9i+NVdGGf57lpUOdNjmwVf924idTABRyQdV4oNtKwk0mSrN9ExazyOZjwSp7
	JWNDOqklFr0W7BFq+9lrgWP/+vpEEQEUZU8QbSM5b6E2kmHmQ3uwH5NS6fqAqE5cCD3D53CZYpP
	isPATy0u7JVsRpuPM4b/JiLbBaULmuATIwZQVCI/W9ljLj7xSeAfMakron75+P6lgH1HaAs5Cih
	VI/sera3sVbc/mZDSmpvA73mFNPmDKLRDuiHEtemRYZsA6vFdlTe+g/x6YYbXPh1BFlWaTOWPNB
	9dxc0Gy/TEmzVgct4At9BU9+qou47mL9vHts2GtsoI+9lj+O07ZD8UZTxBnOatWHNvDWEqWb0mY
	UmomGTNAr8DQCYAoU2Lhw/N/VCFB8D3UjLYNb7Un//iOl0M0rnjCNObzskc8wGW5H/U42QyyNuI
	ZBh9JEh8VBcV/Y9Wc9J3zWGOmJj31kWoRKRPQxGr3JzQEAO92tY2MqSxUY+MxhJqEfs1IBIUYCZ
	ulxYaHqao7GlPdSLYjPuzXfTy4kQLbdnIEVAN9g7CrOcIHERuMLLsPG6XZw/7xddoUKvC49
X-Google-Smtp-Source: AGHT+IF1wT7Td3ZI2BC55SXXYAJaxCzsMe1hAMjfGfhAUPysLAPT7MMB+HubIzcEFfpLuQKK5R0Glg==
X-Received: by 2002:a17:902:cf0b:b0:297:fbff:fab8 with SMTP id d9443c01a7336-29df54761c4mr2295905ad.21.1764966513935;
        Fri, 05 Dec 2025 12:28:33 -0800 (PST)
Received: from Lewboski.localdomain ([181.191.143.42])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29dae99fa59sm57256845ad.58.2025.12.05.12.28.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Dec 2025 12:28:33 -0800 (PST)
From: Tomas Borquez <tomasborquez13@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Tomas Borquez <tomasborquez13@gmail.com>
Subject: [RFC PATCH 3/3] dt-bindings: iio: add analog devices ad9832/ad9835
Date: Fri,  5 Dec 2025 17:27:43 -0300
Message-ID: <20251205202743.10530-4-tomasborquez13@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251205202743.10530-1-tomasborquez13@gmail.com>
References: <20251205202743.10530-1-tomasborquez13@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add devicetree binding documentation for the AD9832 and AD9835
Digital Synthesizer chips.

Signed-off-by: Tomas Borquez <tomasborquez13@gmail.com>
---
 .../bindings/iio/frequency/adi,ad9832.yaml    | 65 +++++++++++++++++++
 1 file changed, 65 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/frequency/adi,ad9832.yaml

diff --git a/Documentation/devicetree/bindings/iio/frequency/adi,ad9832.yaml b/Documentation/devicetree/bindings/iio/frequency/adi,ad9832.yaml
new file mode 100644
index 0000000000..f14e054ab2
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/frequency/adi,ad9832.yaml
@@ -0,0 +1,65 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/iio/frequency/adi,ad9832.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Analog Devices AD9832/AD9835 Direct Digital Synthesizer
+
+maintainers:
+  - Michael Hennerich <michael.hennerich@analog.com>
+
+properties:
+  compatible:
+    enum:
+      - adi,ad9832
+      - adi,ad9835
+
+  reg:
+    maxItems: 1
+
+  spi-max-frequency:
+    maximum: 20000000
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    const: mclk
+
+  avdd-supply:
+    description: Analog power supply.
+
+  dvdd-supply:
+    description: Digital power supply.
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - avdd-supply
+  - dvdd-supply
+
+allOf:
+  - $ref: /schemas/spi/spi-peripheral-props.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    spi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        dds@0 {
+            compatible = "adi,ad9832";
+            reg = <0>;
+            spi-max-frequency = <20000000>;
+            clocks = <&dds_clk>;
+            clock-names = "mclk";
+            avdd-supply = <&avdd_reg>;
+            dvdd-supply = <&dvdd_reg>;
+        };
+    };
+...
-- 
2.43.0

