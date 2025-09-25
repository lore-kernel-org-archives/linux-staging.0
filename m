Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 384DA2F6176
	for <linux-staging@lists.linux.dev>; Thu, 25 Sep 2025 15:17:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758813443; cv=none; b=LDPnTCcPsjTBblAhQYYa5PlFM9ixe9iYJzD1OVOJxCwtgr63M62Wu6S8rfZHTpaN4fwhh+KpTouExN7VGYMi/9STKbbLseIkQxuOeJ8PUGOBqx6FXoM9RMW8dwZxDYw9YFXH+/PV6JPuSjTZnFW0pYfvx3bE4wxJuCHHSkynzvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758813443; c=relaxed/simple;
	bh=pmC8gc0UmEUr7LvPdnrQX6KOLyuZeAx82zdJKSWgn9E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZkLgSaePLXRfXdcQntm7pxjU6tfeTNRCZMj6jr6Z34h/9wMgjHZw50jo5gn0NP1Ko1FWtHS9gSx5NP66bZPXhGQKmJF3qQOgwystzNY5XlTaWQRiQT3Ro6bHL5sRfp1Wbt8DnJRqNCQ7Y7wNoRibu17XrpUBFuhP2i9OmT2W31k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HF2vozfM; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HF2vozfM"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5797c8612b4so1478376e87.2
        for <linux-staging@lists.linux.dev>; Thu, 25 Sep 2025 08:17:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758813439; x=1759418239; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J0spy4sLoz5G0gz2wiaev4JFU/nZDYKwDr/0mjQIAt8=;
        b=HF2vozfMZquVlk8/+ru32eLO/jsbhtk8ZjQpJ3JvtrVkT6uHFg1FGUkIMf+k3nvik0
         3CDOD3t0RaE1yKmS82N+PQYSFQBmzbQzEQnVjy63AHeniLtRmUNEj3vwZW/h+m+jzPGE
         rig7l+EIrJKECYV8JLjhOAMlDnoa0zR6l9W65/Jd7JWuznMrud8prHlZq9SnjZhvNirS
         28nEAJtLSGzFZXNfQQKwv/Ugy7mgYMT1ooqcq2hYqF6OE6VZOLSaKNCtNnOcqpAPPKlW
         XbSKIzcoBjEanZcl9UV8qvV2P7JMRislFhamTT2A3Broj03b+36c+/LkR356pQ/A3nlc
         0YaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758813439; x=1759418239;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J0spy4sLoz5G0gz2wiaev4JFU/nZDYKwDr/0mjQIAt8=;
        b=C9LRkQxYFSR+zQj7I1V2j0x2Fzm/lc/ZzmbKTDj9Bzes1WiQik4+OZwUyBzLz/PBfv
         JGZggbP8o0t5hDTq2p5c7J+mbmGjGwc5HLEACVkc6X8QJ30O054fbytRLY1o4tBXuEqV
         cLK37fCWK1WuTfdihOcS5B050fi50Hf2OHgeYv5waRqlI2GjgO6h6bmun+BjqAa9faH5
         +oi355vF3TR5Abk9D1VfJWrWQ/8yzApaPm0z6PkhthMAAYFUFbB4V2km/WPlHIUcUI4V
         7QsQxt3Hdr4CMl0U72isI3lt1CuPVicfOWNudvXNzB5Bb6+c7pNkN4sqgDcsDvNPdi22
         3LOA==
X-Forwarded-Encrypted: i=1; AJvYcCVkkDF3uw4LGqWjJN/aKqpthYNRhQcOJN+KFJzkIw8wMPVn7vVzSIqTVOvPs90A8Sf/6aeZfVnovLQ/nmFl@lists.linux.dev
X-Gm-Message-State: AOJu0Yzng/Iz52Sz2UA4LWgUyKHAS849OAiwOgAgBFQVsg0A5G3Db4To
	FjyHcYG3rXiuJQ4eb6hDAyDnG33+jLHJNzufUpJHy4t9dr6BF/NdqNlR
X-Gm-Gg: ASbGnctEh1MHzsxZWeKtAFYv8zop8VcXjQEeCLawuNLd0i2aIqzDs1n8H22U+PgUM/V
	xyp60xUoQudq+bfNE/LmWqf7PLhD1wcIyS4H2p3yMAb+cr96cBlWhg5t5Jh47w1MLAAwWf/Htys
	iLGiM/5qKc/l+uOHv8PSTCnRb9WRKjs4oG7/bI5LSc9F3oJNhYA24uuM0M+mtqvOQkfhHSyB69/
	Cwxa9Bn55fd1HWRCpgLuwkZRAtL2mDx+86c22RJt/wcbUzmP2gbsM7heNmBB3UWienPL18SHSb8
	52AtugdhrOVtzbh+b1RQXkx7uaqvbIV9wogRbU/t1+jDsslFecVKNBXRbrAQSRsP/hEghfMndLv
	S/nDBfi1cLhZAlA==
X-Google-Smtp-Source: AGHT+IGqaK5Z05hEk75mGW8qDiu630uMdDhjqt6kFcIL4trP2Pfk6uAyKaszBGaqiiXlJzv0dGCm8w==
X-Received: by 2002:a05:6512:104a:b0:57b:8675:e35b with SMTP id 2adb3069b0e04-582d073f694mr1192520e87.5.1758813438490;
        Thu, 25 Sep 2025 08:17:18 -0700 (PDT)
Received: from xeon.. ([188.163.112.70])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58313430496sm870084e87.27.2025.09.25.08.17.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 08:17:18 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Prashant Gaikwad <pgaikwad@nvidia.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	=?UTF-8?q?Jonas=20Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>,
	Dmitry Osipenko <digetx@gmail.com>,
	Charan Pedumuru <charan.pedumuru@gmail.com>,
	Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>,
	Aaron Kling <webgeek1234@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v3 04/22] dt-bindings: display: tegra: document Tegra30 VI and VIP
Date: Thu, 25 Sep 2025 18:16:30 +0300
Message-ID: <20250925151648.79510-5-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250925151648.79510-1-clamor95@gmail.com>
References: <20250925151648.79510-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Existing Parallel VI interface schema for Tegra20 is fully compatible with
Tegra30; hence, lets reuse it by setting fallback for Tegra30.

Adjust existing VI schema to reflect that Tegra20 VI is compatible with
Tegra30 by setting a fallback for Tegra30. Additionally, switch to using
an enum instead of list of const.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../display/tegra/nvidia,tegra20-vi.yaml      | 19 ++++++++++++-------
 .../display/tegra/nvidia,tegra20-vip.yaml     |  9 +++++++--
 2 files changed, 19 insertions(+), 9 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vi.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vi.yaml
index 2181855a0920..dd67d4162884 100644
--- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vi.yaml
+++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vi.yaml
@@ -16,16 +16,21 @@ properties:
 
   compatible:
     oneOf:
-      - const: nvidia,tegra20-vi
-      - const: nvidia,tegra30-vi
-      - const: nvidia,tegra114-vi
-      - const: nvidia,tegra124-vi
+      - enum:
+          - nvidia,tegra20-vi
+          - nvidia,tegra114-vi
+          - nvidia,tegra124-vi
+          - nvidia,tegra210-vi
+          - nvidia,tegra186-vi
+          - nvidia,tegra194-vi
+
+      - items:
+          - const: nvidia,tegra30-vi
+          - const: nvidia,tegra20-vi
+
       - items:
           - const: nvidia,tegra132-vi
           - const: nvidia,tegra124-vi
-      - const: nvidia,tegra210-vi
-      - const: nvidia,tegra186-vi
-      - const: nvidia,tegra194-vi
 
   reg:
     maxItems: 1
diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vip.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vip.yaml
index 14294edb8d8c..9104a36e16d9 100644
--- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vip.yaml
+++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vip.yaml
@@ -11,8 +11,13 @@ maintainers:
 
 properties:
   compatible:
-    enum:
-      - nvidia,tegra20-vip
+    oneOf:
+      - enum:
+          - nvidia,tegra20-vip
+
+      - items:
+          - const: nvidia,tegra30-vip
+          - const: nvidia,tegra20-vip
 
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
-- 
2.48.1

