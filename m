Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B398628C037
	for <linux-staging@lists.linux.dev>; Wed,  4 Mar 2026 13:16:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772630178; cv=none; b=izbIiWSZA1qmPH35lu9UmMlGCwaCf0AIpN76vmOSxfKcpyYE4690Szu1DKOYtJ+f3jq7rTprXSstzBDZ1tpSsEIKWazU9RUMxW0336ujcU2+bIut8hCauDW0lIZBEm/S/QJLs6L58cdyC9+2Bu6ck/sn7v409ENi1gwP+825Mjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772630178; c=relaxed/simple;
	bh=ZM0UeGckLgWfb8A9LZDrdGuBcoOBBI4fXdeLoyxc1d8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lOVjN7IWtocx2dEXINv5RsCBGywps9N1icpmKnMLb85szKY9az2aYvEB6j7HV8qkltx7N7ymz3uiVTprcK8YnbIVK51THURK0dgYyc1qSy9Hx5r77Suvms70l5GSOYY6NHtsqC1WBh/BkGLK4sxaVt69iZ1lWg+9bkTraR1C7zY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k1TZecgZ; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k1TZecgZ"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b904e1cd038so908410866b.1
        for <linux-staging@lists.linux.dev>; Wed, 04 Mar 2026 05:16:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772630174; x=1773234974; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=veByMjsGeeA2OCIj+ldV0X1YxNMqgif+fScGvqauuiw=;
        b=k1TZecgZkFRx9RzKoTHXpsbKsc5wwewe8XSHEX1MCM4zQP/zVxvP4UPrV2l9n97EEM
         PY9unpplYHupxBf3t+L9C9pqwC7Nxtwac9w0W4C2BeJSli7nlOZMf6C4OLy9h0pqtYci
         5nvGysc2YP6ze/0EKRW2MiQ3KIXtM0wMbiuNj4cn+h1pHgWSuU5Oz5xSNJNDd/AukPCy
         wMf9YqNfqS7/m4UpLKx8SjGp9Sb9FfHp8589ZY1LH3/Lrif1zG6vtDyD9j4tndt7ua7p
         Sf/kHFH1teYKU17TfVRR5Ks5Yu1VqapO1BL1N1cUxO8NyhLWQK7GA0S9V5Y+PDa6Uipo
         BaZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772630174; x=1773234974;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=veByMjsGeeA2OCIj+ldV0X1YxNMqgif+fScGvqauuiw=;
        b=PM0DGtLdMD8kQ1Y6Cwapra7D07yiMJHz0FXiivyducVNrdPdniokWJy8IYN98P97R2
         phVplbMsf2QEKOTcmmqdbEYjq2YykVLJ87k6Mf4ocKYwQ+KpqNmYFjUI4eE+xVWgZj9C
         +SkQC0/Vsid6rA0i+lFEGI38Km/iPc3GOQdrR4J6/tyE8RvZIkwpecpaQmKmALrdVpTE
         Eej/EXH/P55YLJ1x1CT/XxLxjaApiDRsfyzr3AslWeUg/H+zhJ0tOscDiGxmsFsEWuP1
         OK6UldgLIxMAMcE55IzF9U+JxE5ZhHiBqhw+H9mNPRg3uGVOjGCHEdLJOIK+a7bR2WvZ
         89Aw==
X-Forwarded-Encrypted: i=1; AJvYcCVlNvUpNsRL2Fx2en0RNGIWQzGrif+cnp1WI7ux1iNHjH7nn/P0vIPSKlxF+IJsPSn79TmaRsWMbWiaSfxo@lists.linux.dev
X-Gm-Message-State: AOJu0Yw/wiXiFwUIC6eDdUlQx9vFPQZiXIkTlrG9TfhNqQPzg85YYdO5
	LyIKtjtV/CzPMg3yIps9cyH/jYqwvw0vgOCz5aIqvudewNDljrve1B53
X-Gm-Gg: ATEYQzzvbiDX/NVdwKwbzn9hNQQsydPYXaNIFNkEgNTlQphgLQwuk/Z/ZMxdXUgei4R
	KhBfkbnakWDSOP4M82p3AHUeR2NYPholTkTpJwHjnIGNTfgWPOnpWqio/SHGyJmyXQ/aFOb5jwt
	Rxwgx3zr/WavEX9wmNgqCXFf1pBACLcuaZXIFYZMhZUX7lxYc/c9L2oo53FZ4351ND91yU+PyAy
	vLbfzxz7D+6UqU3ZOj4/6ZOJkh0m9Inc+YeVKNHu92ZYKDYYbmPeeCjWJd7rbPgaDLQJgja+41Q
	py+GWx9P31D6QB2ifNDyFG6QH6udscSp4cDfxcXIpVDPjhKv8YtMWcAodXrRKeLxebYr6kTqQpe
	YGAuE99quoDE/We1RdRwuNJzxM++wAKHNaul3n3ljmndnhsd6RIhu9Rfb8kIFnVx/O5kI2AYCkD
	5fncIvmcKIaYz9DLnliBInaieN7OoEZk4ikfpE9GtihzdLMEjB2a2OLxGR7z2f9/+nts+6PGB1z
	oyQcdwyLmU4Y17Rd0c0mzQ41n7/jvrbfj7iXvdfOgkjwtHRpkJQJyzxnskJ9HgUvFrr/9oR2omR
	BHr/Nn77D4+JJphC
X-Received: by 2002:a17:907:3f87:b0:b88:40bd:be54 with SMTP id a640c23a62f3a-b93f11b1f21mr110307966b.24.1772630173896;
        Wed, 04 Mar 2026 05:16:13 -0800 (PST)
Received: from DESKTOP-JNMGKT5.residents.sin.openfiber.nl ([88.202.160.248])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b935ac84357sm740226266b.30.2026.03.04.05.16.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 05:16:13 -0800 (PST)
From: Alexandru Hossu <hossu.alexandru@gmail.com>
To: krzk@kernel.org
Cc: robh@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	gregkh@linuxfoundation.org,
	krzk+dt@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Alexandru Hossu <hossu.alexandru@gmail.com>
Subject: [PATCH] dt-bindings: misc: xlnx,axi-fifo-mm-s: fix interrupt-parent property
Date: Wed,  4 Mar 2026 14:16:10 +0100
Message-ID: <20260304131610.37503-1-hossu.alexandru@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <e6f8db4d-2a5a-4424-b44d-6416ee0c5ca0@kernel.org>
References: <e6f8db4d-2a5a-4424-b44d-6416ee0c5ca0@kernel.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexandru Hossu <hossu.alexandru@gmail.com>
---
 .../devicetree/bindings/misc/xlnx,axi-fifo-mm-s.yaml   | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/misc/xlnx,axi-fifo-mm-s.yaml b/Documentation/devicetree/bindings/misc/xlnx,axi-fifo-mm-s.yaml
index 6d1cd651e..cdc295f2d 100644
--- a/Documentation/devicetree/bindings/misc/xlnx,axi-fifo-mm-s.yaml
+++ b/Documentation/devicetree/bindings/misc/xlnx,axi-fifo-mm-s.yaml
@@ -31,8 +31,6 @@ properties:
     items:
       - const: interrupt
 
-  interrupt-parent: true
-
   xlnx,use-rx-data:
     $ref: /schemas/types.yaml#/definitions/uint32
     enum: [0, 1]
@@ -56,7 +54,6 @@ required:
   - reg
   - interrupts
   - interrupt-names
-  - interrupt-parent
   - xlnx,use-rx-data
   - xlnx,use-tx-data
 
@@ -64,11 +61,16 @@ additionalProperties: true
 
 examples:
   - |
+    intc: interrupt-controller {
+      interrupt-controller;
+      #interrupt-cells = <1>;
+    };
+
     axi_fifo_mm_s_0: axi_fifo_mm_s@43c00000 {
       compatible = "xlnx,axi-fifo-mm-s-4.1";
       interrupt-names = "interrupt";
       interrupt-parent = <&intc>;
-      interrupts = <0 29 4>;
+      interrupts = <29>;
       reg = <0x43c00000 0x10000>;
       xlnx,use-rx-data = <0x0>;
       xlnx,use-tx-data = <0x1>;
-- 
2.43.0

