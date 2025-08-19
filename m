Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E0EA3570A6
	for <linux-staging@lists.linux.dev>; Tue, 19 Aug 2025 12:17:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755605835; cv=none; b=IW4fpr7p7VGjOzDtCqdom2tMUWQrY3nWWpRhrT2dbBemzpFRX28pweXlvdhZ6SFKRu6qH8wjlSIMTMRIYkUQwqZYgpxWYBTPHu9HOfCo3KWc2pWyeDABtWv5cQYfCxjXp5BTcpu9rxwoIlmmqkLxnMlT0XPhcVBr38QCCK3VU0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755605835; c=relaxed/simple;
	bh=fIIWgWwa1cNjmo8m5IZObO858X88oB6pEyhk3u1RmuI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=F8jsMl7V/o961SN+QuXuBKcFjM+g+z7vWAGrrVuKg2lp5r7RXs6LDB/nU5vhhuXYRNEONwA+RVU9Q6p9/JIGkA2Dw/wh3ekmLkg54jUxah5yOyt4B8V4zIo9XpaZhK/W39TiX1zRZI+Oqp5dnKxvHgRp1LllmHJxcxA2zuojs3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jy5+qDDZ; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jy5+qDDZ"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-afcb731ca8eso835407366b.0
        for <linux-staging@lists.linux.dev>; Tue, 19 Aug 2025 05:17:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755605831; x=1756210631; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XhbWfkMKF6hF66NOAL+RPoWVZuRp+fSGcoMAU/Szml0=;
        b=jy5+qDDZpHK8kQn9Zl6aOvYoJ2lRIFjmiumPw7/8C3Kdw7rL5eT54KG2aHa7mqHnvs
         AZLQrkRKZg+JRNMVCsitiDGmYp3Aapj8bbAwC+rPsIS2CsiExVXMFuvYjq6iWFkb6CyW
         o7TsMlKxfBZ3fNpKsL2GnKERjKp40Z8eBA0eLw2t8jkgqeYvom83+y+jyoZOx6C2S9G4
         U5CmzP2n3PI0gBIieYUa9KRX4R6dQEuATh/hgUmVv2m0rv1ffQiKGNli39UxoUQkOX2S
         pMTcQmkdgl6LdFTKm+Uix3tfTweDOj7q1oO2g3w0wdbr/G3f76q0TlzSqKTbINgMaRuL
         BDmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755605831; x=1756210631;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XhbWfkMKF6hF66NOAL+RPoWVZuRp+fSGcoMAU/Szml0=;
        b=gCMiXF/XYzMnG/rB6/c4UKeXp2YtYk1NR39wHq3QpI2qJ2kJIXvPQLg9S26dUiHy9H
         XgGgZNfdvxn2MtNurmU7jGSc+UOODls/xDpcJv9NMmGtVkcy0VOThtp8k+mPScrVkAPM
         y7A/4WeDfiwh4J19D0CkDRU+Fax2Sf9p2GiUKb/0FjRtKln1r6kKJLGLlfBbkc/ToDJB
         FZT8HjUI2P2OhrUmxSsaQiVRZDNky8o+sext558/wD8AzLC0+WrcLaPPY0U+RDQrtIls
         PD2yEIdjIBhD1zPMxscLrKjNyhRW3YVlvMCv7dOkW2bpXz2tPtHyybHm4fLU2kmMHRsb
         +UTw==
X-Forwarded-Encrypted: i=1; AJvYcCUaIAKh8TjPPRjUPJ6ZNtSbc9EHtp70N8krOnkKyYyn3Pjkbuz9TghwkQFSlRb4DT7/rmqei3jkattBbNsX@lists.linux.dev
X-Gm-Message-State: AOJu0YzYbliUZ1LLNQVPbRbaN1fmwDpeAYy+opphvt7wuAxNgL47TnE5
	oQRew4CtaZhfLbVkgmF2YjYogKw4VOmKHJ5IikAz2xxfWP/BHNj2mrTl
X-Gm-Gg: ASbGncurvTtHa1XqMs6SDCOSnzVnC+BLhVaTrvFzJmakUVbn70WyGM1WmLkDEvxwXeP
	spgdXIxetGOKDpEntwZMwCPCn7sRreBVWIOX1py7bB6kYgLnt8M9h4pUSzbIOLe+pHQNNmDcQ7R
	BEkDB91RMSFhuOWrGTj70zo0hNHVomGGwB7YSbt+j7USQXyQtOFwDmGdd2grqWgZdcuiH+LjmIi
	7Ltx7EMILxA4iPDf6hOoDYCftJFqkjapaA5OqQnUIhFXvaQdCgccJNp8mGkl1FxDHbGv5ANYHaD
	f8HjbIb1+U/eerK7Sg9+U7YlUu9eF0Uf+NY5QruJWnq0htgmTlcOiJVth5aVNZ2FDCRFwEczpSu
	C0CiTcM855uB+aA==
X-Google-Smtp-Source: AGHT+IFsyn72hjdeQEsFRbU5nBWZrG6wCs9qdktkISE8s0ETQsL6XXo/oatl3CIX8p7Q4Fqo+MpW3A==
X-Received: by 2002:a17:907:9706:b0:ae3:f2a0:459f with SMTP id a640c23a62f3a-afddd1f0af0mr248773766b.54.1755605831408;
        Tue, 19 Aug 2025 05:17:11 -0700 (PDT)
Received: from xeon.. ([188.163.112.76])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afcdce72cbbsm1012018666b.35.2025.08.19.05.17.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 05:17:11 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
	Thierry Reding <treding@nvidia.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Peter De Schrijver <pdeschrijver@nvidia.com>,
	Prashant Gaikwad <pgaikwad@nvidia.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Dmitry Osipenko <digetx@gmail.com>,
	Charan Pedumuru <charan.pedumuru@gmail.com>
Cc: linux-media@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v1 17/19] dt-bindings: display: tegra: document Tegra20 and Tegra30 CSI
Date: Tue, 19 Aug 2025 15:16:29 +0300
Message-ID: <20250819121631.84280-18-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250819121631.84280-1-clamor95@gmail.com>
References: <20250819121631.84280-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document CSI hw block found in Tegra20 and Tegra30 SoC.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../display/tegra/nvidia,tegra210-csi.yaml    | 78 +++++++++++++++----
 1 file changed, 63 insertions(+), 15 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra210-csi.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra210-csi.yaml
index fa07a40d1004..a5669447a33b 100644
--- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra210-csi.yaml
+++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra210-csi.yaml
@@ -16,30 +16,78 @@ properties:
 
   compatible:
     enum:
+      - nvidia,tegra20-csi
+      - nvidia,tegra30-csi
       - nvidia,tegra210-csi
 
   reg:
     maxItems: 1
 
-  clocks:
-    items:
-      - description: module clock
-      - description: A/B lanes clock
-      - description: C/D lanes clock
-      - description: E lane clock
-      - description: test pattern generator clock
-
-  clock-names:
-    items:
-      - const: csi
-      - const: cilab
-      - const: cilcd
-      - const: cile
-      - const: csi_tpg
+  clocks: true
+  clock-names: true
 
   power-domains:
     maxItems: 1
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - nvidia,tegra20-csi
+    then:
+      properties:
+        clocks:
+          items:
+            - description: module clock
+
+        clock-names:
+          items:
+            - const: csi
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - nvidia,tegra30-csi
+    then:
+      properties:
+        clocks:
+          items:
+            - description: module clock
+            - description: PAD A clock
+            - description: PAD B clock
+
+        clock-names:
+          items:
+            - const: csi
+            - const: csia_pad
+            - const: csib_pad
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - nvidia,tegra210-csi
+    then:
+      properties:
+        clocks:
+          items:
+            - description: module clock
+            - description: A/B lanes clock
+            - description: C/D lanes clock
+            - description: E lane clock
+            - description: test pattern generator clock
+
+        clock-names:
+          items:
+            - const: csi
+            - const: cilab
+            - const: cilcd
+            - const: cile
+            - const: csi_tpg
+
 additionalProperties: false
 
 required:
-- 
2.48.1

