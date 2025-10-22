Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECDBA34C98A
	for <linux-staging@lists.linux.dev>; Wed, 22 Oct 2025 14:21:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761142896; cv=none; b=ujl75cRQ13QEEalKFLAloMDmQkSvpx7ABKASS9X8np6Xxnqjy08Qw4gEBZAJ9Fr2kHlbXiIBbf619mci8aJ3hU1qqxXvalfIvoYKB2nLoaRkbio2wtzj5mJ+KpsFtAqIPUNZ9NL8kDkQAcJAA0/ccMvpZPDofVCB6YsnH/8eKI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761142896; c=relaxed/simple;
	bh=a/48XUdptj6+42+EZNzEr2TY6pY90ELY94jo1ZmZXkk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nAqqj919nVqONQdoOEj1xEWGhyZ4eOJuUShZBl5llEdx485PPlNxB8dZGnJjSC9hgrRzsphgJIdmuq86HAi6wW9LGWlE/nFHLDCCpFH6Z4ZU2istOWYAJWcLP67K12Y4uDvvxjlNo/vEBKt0ku4w/Q1Hn61bqupd9WfsUytPGFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QX7sDQOj; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QX7sDQOj"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3ee64bc6b85so8896997f8f.3
        for <linux-staging@lists.linux.dev>; Wed, 22 Oct 2025 07:21:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761142890; x=1761747690; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=enLEHKOtNTzkrWiTnMIts9Lyjvegz+xp8xyikQdOjDk=;
        b=QX7sDQOjIgU565UX9Wdr8aLLhOxapOOnJKk+kE5e+yvJdEBTyu8yHTm4k35y8t12zF
         eMIbLA4ZTsPJl55SKp12i4KGkLJLD8kdeL9mimn96otHP3W5RhwTQwTTp0gIQdi7m8mF
         x/yVc1jAMDVyk0gFQL+RAtDMyAE6AoBEIL8pFBLnzkMjeOwIqMOCcNH3En2uShUMmwg/
         Vyx1sKOoa5YjNoWqlPL4lcEOp6SNRowghlhybRZaK3RiaZuPwYYXWBznSQ8QpWbzWj4t
         8jPLQlplqsTmnylhhBI9jf+3GrUW68H0/Uel6E/VykDLoJZU2bYprh98KNByetT1oC9x
         m78g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761142890; x=1761747690;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=enLEHKOtNTzkrWiTnMIts9Lyjvegz+xp8xyikQdOjDk=;
        b=AARd/bXqxQOcQs9ZgzpHajreEtu1xHfXBqhO1tm13Nffg3690/jPuAp1vVuHgnN0kB
         Kw5iLJgqsIb8KdUuekb3GNp8W5L+EM8H/h5aYthnrRZnTSowaLWBMx8uBNlVu8Co/yWC
         1p4xVC2yu20iZx4nJkJ2rns2OGI3abj6dz4ekth7rbvfPiyA2/FNmYvw22qlSqjXxixX
         63vlB7XGGE6MlAQ1UCRgLsmeIdeBtWpxubhfJ3DqrLj+3w2CsVHyJtg9DH0FoBHOHV4h
         9cBbmd3bxpNHuC63VX/DcQ83iKQ2+gOqCYBJnFa8R4UFDNJAUrgSArxs4OiVwJwbkpuv
         l6Jg==
X-Forwarded-Encrypted: i=1; AJvYcCVflK4LfVV02SzEhKyCWpNj459WBf44Qln7lk46GZlEJFbMpOvhQZTNyuKiUwr3ULhzhR64hMRTNJav4l28@lists.linux.dev
X-Gm-Message-State: AOJu0YxSgrNWxINROBT/x8vojSZ3EsJz/XcKb3Gqknut4EKv7HC+mRk8
	DdLckoOPcxRPHlOwJMx/K1XM1q0fGinP4wcXoudA7KMPurt57hVb2xy2
X-Gm-Gg: ASbGncs0C1/wdxxvY+y0LLLM7xPgGJNoZC+4XGuOABLBrm+/F1bogY2gAwAuepLeMtJ
	mYSHic4wFziHiuK0zcuZ38fdz3D7IDWZg5lBxBjw8wI/ToO+n/MBdvMlw2qYo79qZIVR7E5Dqeg
	CO4CpCX8mQUgfFBBnhJcuRjfOdiYAe8818+GVFA85mcIWDJJmCq3wDSAdnxPRX2Yqec/YIvR8vU
	iGzvP4NTCZq7F9jp9M3VbiYGMmb4+P+7ve3wgPsOJNLKayTDLpTK3TDcTBF9uzoMEYCRr7AZ+x6
	ZGj6Jd+olTrmjjvhdcy2JDjJqFR30uASwzSyuwrnz+1NoX+G07fwVQmAWsMmKY2RPpkLe4Z+GUg
	b3sVO9+8V1AecUWLDTB+4tcN3sDXREGy+F8K6t8RHJ2I7TX2yMRXp/pHEExWZGKFhMeOceHWXU9
	zKcw==
X-Google-Smtp-Source: AGHT+IEfaZa8UfXSJQcTxYFG1UWlPPha1az3qIIfBFq7rCGZuYKGo9sPXz1gfue5h4gMcahe1PnCTQ==
X-Received: by 2002:a05:6000:2911:b0:425:8bc2:9c43 with SMTP id ffacd0b85a97d-42704d7e987mr13185292f8f.1.1761142889835;
        Wed, 22 Oct 2025 07:21:29 -0700 (PDT)
Received: from xeon.. ([188.163.112.61])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-427ea5b3d4csm24803518f8f.19.2025.10.22.07.21.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 07:21:29 -0700 (PDT)
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
	linux-staging@lists.linux.dev
Subject: [PATCH v5 04/23] dt-bindings: display: tegra: document Tegra30 VI and VIP
Date: Wed, 22 Oct 2025 17:20:32 +0300
Message-ID: <20251022142051.70400-5-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251022142051.70400-1-clamor95@gmail.com>
References: <20251022142051.70400-1-clamor95@gmail.com>
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

