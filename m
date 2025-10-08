Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 023932F39AB
	for <linux-staging@lists.linux.dev>; Wed,  8 Oct 2025 07:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759908687; cv=none; b=U2aHZjM2TTN22GN58duj0L16XL941+FqaExcUPfh0RpXrT9pDnWuyI6xxFUvTE3fJqqBbq6PyL3eAAWAprD4lQT1wVHlLJLqh8Th4LznS2oyxypMJKAuyea4hcIk+aAhAJOzt8Cga0bltyqPveIeI8RZe3A6nBBqJbekyNZv0ss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759908687; c=relaxed/simple;
	bh=a/48XUdptj6+42+EZNzEr2TY6pY90ELY94jo1ZmZXkk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mYBEW/RdRm1bDNvVjCIYPF4MV6AP2KJT6vvdFMMmXhoLq2vBC7BFrYzEcY2Fx2DgESTqAbXPkZwVGOcnYV/gsH1368XV7xfMBRyyzRdZAhBi5cLwleYTrjxvPbafEQB84OCFccDE4oZ7R2OrjZhhKBe2yAWwIMi3baLJ+LXOmW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VhdnnEXk; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VhdnnEXk"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-57bd04f2e84so7960783e87.1
        for <linux-staging@lists.linux.dev>; Wed, 08 Oct 2025 00:31:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759908682; x=1760513482; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=enLEHKOtNTzkrWiTnMIts9Lyjvegz+xp8xyikQdOjDk=;
        b=VhdnnEXkOAzyaxjXijLOYyaNLH9KuU8si03r+jlnQJChZC9ipbZW+NJMR+cteBCFeH
         CqOEPEYNh6eA4BPMowwy0Xbas7IzuBs6k4PSIU2RefIKz/LkhvBm5qQDawTHxQ3yDM2w
         LlZeOxYf1ok6GJ+W0wowgYhDfwM8SWXDD4FuBSF5rM7wOXERYoLJ1ExrRlhIH0S7qAr3
         RpLOlerg88bFm+LkcRgDxiD3uwlT4PaVH2GmPeR9Jdkc+J5ZFoEXFUspArLtAQMwNm6T
         1cjf4TUy+phoOCLX6lxMZG0ndIkeIZgktFqwvwQv/6gB0XCwcUNonQdib58HCgYr/Yrs
         nFjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759908682; x=1760513482;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=enLEHKOtNTzkrWiTnMIts9Lyjvegz+xp8xyikQdOjDk=;
        b=kuDvNjRZppkIXOBlmiaaD37dN280ua5a6/Erh7muNtLyk5rzLhWojBNJLdyTU6MEWf
         vgbP4W25akYa046MRnC1RcgAF0FfGeDwmsraP1TmqtUREbh+iJ4FivccfJFvjUdYBu4U
         bMZlpoNf4RE4DWQ1ZVYaLWt/1ofoZcREUjNmEQUk2L0aF0rzNl2XPjs7ZcfAYMkyUA/o
         lMnNPabs1FvW6+778uMCQ4BK5FAMTbb6l9pIFW4TS4DKZ/xZdYzOyiuZ+HBkPhSzE1dv
         RkKLlMtiUptyT87BrJoZGO/KsRGIyUrVi70w2F6kDnWk3yRtTZUB6tGhcjwAykz9dHZS
         YDJg==
X-Forwarded-Encrypted: i=1; AJvYcCXmMN0pdr0CCqijdJ9RxVA4EXsNY3+03d6WwsZN0Fj3IgraWcuJZgVFJAM6UC/8O4wualwzGMvXzgBE0uO4@lists.linux.dev
X-Gm-Message-State: AOJu0Yz9ejzFS8YRz57Wq2WIt0On9Q3AkHBoTHeHea8luTir3aBuJCBK
	diWvy8eZpqAuctRSATmG/n7XUwQU4J4Cy1fMtw+L6IxpfSUpGBgi4k7L
X-Gm-Gg: ASbGncto2UTFO1M0jBxxt9Hq2TkAGsnma2wiHLJIc9KX3fWbcqh8hVSVnnEDNSi03PM
	MgI/K6OB2vCsVRPVcartZLp79JUSpPQ1XGukrm+OQpEiuNQWIFO2GOoIX/0TTxQbbP6WDWSKMH6
	2+TZjJHhm88qxCZy5UV0WaiqHwHhRV6J1D3pUweCq3cGqdUCl6U9s429iAWqTz7EzdI/VSuPCIL
	TCDaGY0neozBGMZ26N7qHrzhiBDasARmyj4DJzEGalh7qPeaQgd2d4lfdkHGQP8EUtXkXcCEFfS
	mBDyCiug89CnOagsZGDfMR1kkP7qbHHzxOrDYzfqIkOrcK3zYTytF5IEYELRR7L9SfrFBBDNC74
	fx8K/TGhcQyKG2Yxo2sZS1fE26myN34LLSQMstQ==
X-Google-Smtp-Source: AGHT+IE6CzpQ7p9cWL2g2u1KCij/uULFzIog+MKLpggK4YVhbmnkBbPJg12jiL753WYqBvss1sNwdg==
X-Received: by 2002:a05:6512:ac4:b0:581:7f39:d34f with SMTP id 2adb3069b0e04-5906dd74a07mr738319e87.43.1759908681823;
        Wed, 08 Oct 2025 00:31:21 -0700 (PDT)
Received: from xeon.. ([188.163.112.70])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58b0118d22bsm6911016e87.85.2025.10.08.00.31.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 00:31:21 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
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
Subject: [PATCH v4 05/24] dt-bindings: display: tegra: document Tegra30 VI and VIP
Date: Wed,  8 Oct 2025 10:30:27 +0300
Message-ID: <20251008073046.23231-6-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251008073046.23231-1-clamor95@gmail.com>
References: <20251008073046.23231-1-clamor95@gmail.com>
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
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
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

