Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A10762D5A08
	for <linux-staging@lists.linux.dev>; Wed, 16 Jul 2025 19:31:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752694295; cv=none; b=cuFVighpBKPmazcF0Xrh+GvHCBlZHMK9f2V3XW4oW/yXknWkqkUIFHE1MVdncebmRKhYIIWYb2yVwTPkb59TToaONca0PXbzqV/rxNC5CcGTJlzvwMjjaUJ7Njha8cmTWxX6yGcdoVDIEBaCtkUOSGfepYhd4UuiMn7QJtnC1yI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752694295; c=relaxed/simple;
	bh=Le3fKPFnTnPrgHTj8F78EVXFR3HaOupXcG+QIrk9gZg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uLVnl75fz2/UiKrc+IsGdVZMmIcAHIJsSF/7An8o3xAWsf52ynLeZs3JxxLvWrmoL1p0saysmC9rIC3flzH1qIatsRIZA5mZImTpvZ/nLEAceQsgio/o5j9x/MaT/RBsienW8tG8IYqLIqeD/Lqc1krC8eqd6UAKQ97MvdZ29QY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UCuYCOMq; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UCuYCOMq"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-60c5b7cae8bso287638a12.1
        for <linux-staging@lists.linux.dev>; Wed, 16 Jul 2025 12:31:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752694292; x=1753299092; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VdFIW0lYJtAbQLEa3GdGav6joQZ/CRQ0x8q7C38QxqU=;
        b=UCuYCOMq4voo8V+ximsDvugiBieIJ1zGlCRSRpsIEz3TycCtXVq28YIcdkWABPb0p6
         8Q9FmkU0MHygQAgjhnLDrTPs4KBgylUQ0B5IatTYUH0HRKz+tPyNIci1nl4Bazq7g70D
         YaE2iOIH7telY049xLpc3cpOKHarM6NcHFYvX0PFWt00VCbImqGShC3BGQMlyAGsA97e
         SKkScAX0sK0PWX4+h8xJk9Z1hHjrFKQtcYMvLvQOQ/O/IorKn97+elbRJqcB0f3BWSdN
         KHt3kdHUa9MrnyOAAlaSYCbcMT3s/XREYvtq+giazhSVBHRGZwDjpCjv+yJUp07bg2O4
         weQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752694292; x=1753299092;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VdFIW0lYJtAbQLEa3GdGav6joQZ/CRQ0x8q7C38QxqU=;
        b=XFKEQX14WLM+Z3cypSxvfJuhWFfxCTOhj5yLwxW0OBfu5eZmKhnkdIqylUTVpgDiU9
         QtqeCtWcUwV5mH8RkFMYsrXTsLtfYqKVgvLVlfY6yIvYQc7ND4TWiWwKkg0dfiKx1QxN
         gSoeRr/6LAGbC1sQnPI0wy7V1AE/wG9PeVit9spq+MVzb5gqOgHo/k6hh1sWk4ZGRohw
         62V6QV9dqLGb84iOJKO+0beoDnmH/TO3yfivL9TASkB4TRXdRXxse9d+SLRbWW2a9NJw
         xJtk1h5kgsrp8y05MIryz+PjA2SgMpSuvQS248mrX8w8zAwXDSIuh/rzn8u6OZFcSXrW
         GtCQ==
X-Forwarded-Encrypted: i=1; AJvYcCUr/kHV752LtDupLFZA9GB3LLHXcaQMW/XmhkQWdE4CWUSidQJGyGvlf9fJRYlfVfMBjxb/u6Z3TWcc5mso@lists.linux.dev
X-Gm-Message-State: AOJu0YwOMXv6x8zo4M8C05QRcwfRhfPJR/hHlD0XyACf1OwOLYmQwiwT
	XL/RBB+NCVCx/36YAjhXQm8F9JLyEEmInAueIbukcuvAvB54NuV6UBUE
X-Gm-Gg: ASbGncs5IxX4DB75popz9HBBJ4loa8VOuIDT+FnnNbyxWzEV2PHzCqp+LM/bN89Bc2Y
	dxnjPUx3IhEUHPReQog9xdbMzxtv0uo01ztz+ASIaBeRZUZv8V+F6ttNO1DwgjQS+Kz0UPpdgdo
	A+G9W6XoNH553HCwecncB0shQRnp72WKKLeNx7mTAIrbPAsQfyXqosg13F8Tk8lEcEp6gtPknLd
	OldW9L4otO9rNfbBf0qIv7bRYrXclaF0Kjvaw8ZmOhJ8oXAuqUH5zm2gnNOdRwUMH40QGnScluR
	Mq1UisoiAu+ZmvolOQe91qSSDUq9lY1w6wI5+n5PZoW2wcd8z0zLtIWT91XSZZUzI7aEbm/ch11
	1YOCIDwCkNj5gBehh7EfsV2tjfKaFhGvT8vw=
X-Google-Smtp-Source: AGHT+IEZMD5Zc3OOnACa7/C5CBcH3nlthXXafeTAcO25bIUK50cADPzmkF5lGfh1XauxfD+fLFBGwQ==
X-Received: by 2002:a17:907:3f22:b0:ae0:db23:e3e3 with SMTP id a640c23a62f3a-ae9cde0032fmr402005466b.16.1752694291809;
        Wed, 16 Jul 2025 12:31:31 -0700 (PDT)
Received: from demon-pc.localdomain ([188.27.131.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e82df54csm1226534666b.155.2025.07.16.12.31.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 12:31:31 -0700 (PDT)
From: Cosmin Tanislav <demonsingur@gmail.com>
To: Cosmin Tanislav <cosmin.tanislav@analog.com>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Julien Massot <julien.massot@collabora.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-gpio@vger.kernel.org,
	Cosmin Tanislav <demonsingur@gmail.com>
Subject: [PATCH v6 05/24] dt-bindings: media: i2c: max96717: add support for MAX9295A
Date: Wed, 16 Jul 2025 22:30:50 +0300
Message-ID: <20250716193111.942217-6-demonsingur@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250716193111.942217-1-demonsingur@gmail.com>
References: <20250716193111.942217-1-demonsingur@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

MAX9295A is an older variant of the MAX96717 which does not support
tunnel mode.

Document the compatibility.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../devicetree/bindings/media/i2c/maxim,max96717.yaml      | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
index 9afaa8a7a3f52..78ecbab8205a5 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
@@ -25,12 +25,17 @@ description:
 
   The GMSL2 serial link operates at a fixed rate of 3Gbps or 6Gbps in the
   forward direction and 187.5Mbps in the reverse direction.
+
   MAX96717F only supports a fixed rate of 3Gbps in the forward direction.
 
+  MAX9295A only supports pixel mode.
+
 properties:
   compatible:
     oneOf:
-      - const: maxim,max96717f
+      - enum:
+          - maxim,max9295a
+          - maxim,max96717f
       - items:
           - enum:
               - maxim,max96717
-- 
2.50.1

