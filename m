Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A093F286D7A
	for <linux-staging@lists.linux.dev>; Wed, 18 Jun 2025 09:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750240781; cv=none; b=Fq9+wzcbOHjioE2U7w1BS8bfJxRE3GlSGNaxeDvIWh/K0590Y4U3smHdBb/pmYWVFxlFyN27DJlbhBUo3EFT67EbWzclHJCA0SrBYZhHQm+k/VJphTkxQZuV8E09aAG/nJb2uEJRRrXcZThYw+XcHuphXKRQa0JDNAlSb691xw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750240781; c=relaxed/simple;
	bh=LS51SAOjeVQ+DKPYqQ59vFdlIMwnoNIzslebEFvdf/0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZyR0xBENGTVZCjubdvApTFZrdtKNSJMFJvVEuCpwMv8p7otNLVH67EzlGfeFdB7AZoryM7MBJ+hTfyi7xY9XhIq/ojM4Mt/7kc3WBtbzexDEDKffauYcurj71mdw0/jJEI9qA6peOtuGjOSfQsQPhS5I/IQLtqaoVp21Prn5vPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DQbx4ZQX; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DQbx4ZQX"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-607434e1821so9741293a12.0
        for <linux-staging@lists.linux.dev>; Wed, 18 Jun 2025 02:59:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750240778; x=1750845578; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QyMjYlp8tiGaFTfB5olHuf8CDtVtbOO4FPZ1k0DdjyQ=;
        b=DQbx4ZQX5WIneDbkNbicAKhqi8pDDEKXnZkNyI9V2fqzfdushqYrOTDmFrUZVtnMA8
         Uj/jOud95raMVfy52ZG1mvqsXPDxrahwBvYKD3+ESVzawPMFrGyzNftHyRNNfASMQlSl
         rGkh2t8XDe6dJ++k5P5UqP5/ZrHVi2LciMzpwSf2LnJFPpcWx5nS0HeBKW2G/Tr/OMA5
         NQWmqdaKS4Q29x6rrtwCJxUBHh4nkR2xmDNUyM6W63Uil8IDoEc827qNGBrflyvutc1M
         cfp7o1MK8tlBZbpgZ4AKCpJfrcuiXF/LHW14gmedVrNvcy9ScZxrqA51u2Wknpj5vxZh
         zRNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750240778; x=1750845578;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QyMjYlp8tiGaFTfB5olHuf8CDtVtbOO4FPZ1k0DdjyQ=;
        b=i8bm+lsSqh+1KLL6JVCXf9VsM+zPWux+CwAQ3yIxQDpiFsELJZJ0XuC9ooigXlCw48
         OLyZpAWKlEd+ni7zkMMWOdH+peWsoeRojnLsNMUEy0LGWL44Wh2SQKGaduObcCHW7ivH
         2Sxzpa95MMnHl88aSRKeGA7m0TUiv0fYg5Kkx6PXncvWA8BFkWNeYxQQkvDjBAVwJ4uc
         /McS8eDr5e1h5/yrqiy0FmUIw4lGwqwEI9MdpXc5XWlus1231rx+u19RfZ8SifZ4BHFZ
         f9WJWZkIu56KMnZjL9+/gZNHQrHmPeUWV2zUwKjKw2S/xaQp4s3qITwRdpZeiaBH6Irg
         KDFw==
X-Forwarded-Encrypted: i=1; AJvYcCXx7+qS2DlOVgfPq4naaRynLFFu1hwI5okd4WHuBWV0Xl11ngJY8/oJ43/dSy2kz+M3V55VLhd4dB22OAKU@lists.linux.dev
X-Gm-Message-State: AOJu0Yx8xUicbR5nOX+SR4tOwJ4OcKM22uTp1fWbqUwIqKUC3TRr1KMF
	YT/ZC3QdakH4x/cW1QUhohjvPueeP6flzhqy7KY+/KyxU52i15EFLVy7
X-Gm-Gg: ASbGncvkuzSIZkNUDt9pppu/GhvQR6yeZg6oasF6X3g1OwDbArQMtsMaGTh7YL5WiOq
	viEMa2Y9ykBTmBJqerCjk3KycYyo0gqPQKFjZFiJZVM/Y4ZzPK5+uabbkkqxWxExRrwGuKqZA6t
	Zk/Ta5vW/WthJ9xzqAOnlk1zJgz3PIvlyogR+22Xhr+HW3ZAAiFM/PV5Cp2rA8tX6T2++XhsXUe
	yMwZQzGIs34cwoDCMfgos/CYFIC7rbwSNKox+7tZ5HHURbKs5wVmBAF7Sm+jnc1kIOflqOX9i+o
	+Q4Io2qF9GMIxuEfYknv8V44/uDhkBRpT74w+ip2AcnZQkQYF5nSwopSL6kyT4WqA0/mriJ1Ezg
	=
X-Google-Smtp-Source: AGHT+IG6ppb/J0j8YRmIIXmzNHSVWkRtjbVe5WTms0GTJ75Un87Lu/WGD7mS34FxQ1gJTRZ1plZKNw==
X-Received: by 2002:a05:6402:5cd:b0:607:2469:68bb with SMTP id 4fb4d7f45d1cf-608d09a0dcfmr14594421a12.33.1750240777738;
        Wed, 18 Jun 2025 02:59:37 -0700 (PDT)
Received: from demon-pc.localdomain ([188.27.131.45])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-608b4a93b03sm9384691a12.54.2025.06.18.02.59.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 02:59:37 -0700 (PDT)
From: Cosmin Tanislav <demonsingur@gmail.com>
To: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Julien Massot <julien.massot@collabora.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: linux-media@vger.kernel.org (open list:MAXIM GMSL2 SERIALIZERS AND DESERIALIZERS),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM64 PORT (AARCH64 ARCHITECTURE)),
	linux-staging@lists.linux.dev (open list:STAGING SUBSYSTEM),
	linux-gpio@vger.kernel.org (open list:GPIO SUBSYSTEM:Keyword:(devm_)?gpio_(request|free|direction|get|set)),
	Cosmin Tanislav <cosmin.tanislav@analog.com>,
	Cosmin Tanislav <demonsingur@gmail.com>
Subject: [PATCH v4 05/19] dt-bindings: media: i2c: max96717: add support for MAX9295A
Date: Wed, 18 Jun 2025 12:58:41 +0300
Message-ID: <20250618095858.2145209-6-demonsingur@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250618095858.2145209-1-demonsingur@gmail.com>
References: <20250618095858.2145209-1-demonsingur@gmail.com>
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
index 5998e2518be9..ab46a5f0bd7e 100644
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
2.49.0

