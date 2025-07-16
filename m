Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACEB62DFA2B
	for <linux-staging@lists.linux.dev>; Wed, 16 Jul 2025 19:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752694308; cv=none; b=uGBuHnNYx1BwPFssUKsQWGw/+jsvgzQLKhaqzpmPmZRs5T2bRt9g2CGrjB271Gl8qeZXZPMf/STvT0xFvCB4beUEfIh7ySHaUwzaRHAadaHprXsZj4ZSgAHCYfsJZT6llqI5slLfdFeYKKAzOoXPg/eq7AWEFWr+JgogloHvULc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752694308; c=relaxed/simple;
	bh=Tya7H69uCHv1F64bK9DJxRVSTo9tF9vvkubVhW3RXZc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Mzz+ZE+bhi2onN3dxSuh+zFkekEgxYvjErZaWeYPEZd5GYIBYPwsNJx94KVE0ngAQ/Sbl50TPo1Q9uYIVaG5n7wSuM5SgnaZNjljmaeLKIKmHWnnHKGaMrJJgGK0oCsrc37eopHhuiDCw7GHVjQAUaYQfeTaj63ORSx1T/O9Ql8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ikKc5yu9; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ikKc5yu9"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-60780d74c8cso281014a12.2
        for <linux-staging@lists.linux.dev>; Wed, 16 Jul 2025 12:31:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752694304; x=1753299104; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1YhQAjQyJkWY6Jp3g1C7XqqcjfeJK/9/EyL1eyErKpI=;
        b=ikKc5yu92SWnRtz840KlU0nlpHfWBiwt2M/X1FSZxCpM8s4gQDeO4B31o561Pd4Pl6
         ev9XiAJ8ONamZkGtU+OmqeYT4OT4JkpXFlt2DRoNdzdx3VP2pw7Meyh5Dpd/8+GwQP46
         mqQP9sb30TaM91YAI247jak1FKmU+XTLjKMahYz2TUSAYkOTFaaSGrwkYZxTMm35Po/l
         oS10MpNEE7KjatMcAl47vGx/2UOudHaclDL/BYvXtjT6EUL70/ye5TxIsU6++g0ir72O
         VawFcWDMASim9ktPkpTQeiQ1ZzPee3QayNttSjHkaX6i8u3dcDmnoMVToYlnLgND3Qmb
         D2ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752694304; x=1753299104;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1YhQAjQyJkWY6Jp3g1C7XqqcjfeJK/9/EyL1eyErKpI=;
        b=Zi8gh/6AioUxoCfIEX/UeclITgAN4uN6cOuTRjvBz3KeWdcOyulpk9sovGm1KgZ/Bz
         0+HY3VxKLFRhwuMaKoNn7Ex/LnUAavPNOkI3onrwb4w29GryAvBTgOOJkMbefw9Amcr5
         FDg5ySl8qpNF7IPnivFPO7wSJ55xsXsXUh/ryZo0BKixBjnBQwYgygCYSmW5NNgN4yrX
         LH5B0G4kfpB2OpNN4YJ06V7msYozKoNAZ/wh3oocSTB7tXlN9xWt6JJ2n7lvIjxIkNpe
         wN9FyYhmnTNP/rqWfFhUrvoplmb68FxU048tCXSKrUqMJDN+gOUuWsu2CYTYtLRmLmzo
         uUFw==
X-Forwarded-Encrypted: i=1; AJvYcCVsOMoD31tsIxsfg02W305houVjMVAREqeFVgUt8BMvqfxcjc9oZXuS3wpKn9silKlXQZoJTNjiEI+bJiJ/@lists.linux.dev
X-Gm-Message-State: AOJu0Yy07pYe0EKizoNVNZt4aToMrfCf+HrQt9jUxpWTuhGbxUf9QBrN
	a28exhFfWRYnMiEE0Tg64MIIECNMDkDhxWi1DlJftVqC2fLwJoR5ojrV
X-Gm-Gg: ASbGncsJZrKq5kmpiZLmhWcNaQRoRKxIAigT007CUC+4rneI2KteAByIVmFUQ5diiyn
	grP4o0FNtpGawkY+kJadsp6LeF6iwBjCpX9lVOJ/GY6U43x/BzY1BHwgLWoaeE3eMU2Lo5CHlCA
	4ibSjP20mQQnq3swAcwmsp4FzuP1dP/3cPWC8MDAPFivhmMB/0PWxH52J+kYGNIIxfia1caOI7y
	MukNSkaA8MgGBKoL78+qIfoMALJQ0vUU+UaXCOe5Tmdx7dyHK2SRHKp8K8pFeIMWe1e0QfRbiSa
	DxM02EbBIXj2mKeApXCdsd/P55D2FhgMZ1eXbyuuVD1NR6JwV9xV1J57XSDlCKNt/fqdIGwcRz/
	7mpiYa7v/bHcYZyj9/PrAe7k4wRzY8n6lTkQ=
X-Google-Smtp-Source: AGHT+IEsQJRdGqu/qTwBOaHc+FiLvZ4m8UDavPdSRUZGpJBwNjalNTkg+vxrzylDLQtfYyEHd3CBfQ==
X-Received: by 2002:a17:907:86a2:b0:ad8:a935:b8eb with SMTP id a640c23a62f3a-ae9cdda9e7cmr406952966b.3.1752694303989;
        Wed, 16 Jul 2025 12:31:43 -0700 (PDT)
Received: from demon-pc.localdomain ([188.27.131.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e82df54csm1226534666b.155.2025.07.16.12.31.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 12:31:43 -0700 (PDT)
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
	Cosmin Tanislav <demonsingur@gmail.com>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v6 10/24] dt-bindings: media: i2c: max96712: add support for POC supplies
Date: Wed, 16 Jul 2025 22:30:55 +0300
Message-ID: <20250716193111.942217-11-demonsingur@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250716193111.942217-1-demonsingur@gmail.com>
References: <20250716193111.942217-1-demonsingur@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The GMSL links can carry power to the serializer when using coaxial
cables.

Document this capability.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 .../devicetree/bindings/media/i2c/maxim,max96712.yaml         | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
index 758c0223977d4..b345305acc4c3 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
@@ -96,6 +96,10 @@ properties:
       - required: [port@6]
       - required: [port@7]
 
+patternProperties:
+  '^port[0-3]-poc-supply$':
+    description: Regulator providing Power over Coax for GMSL ports
+
 required:
   - compatible
   - reg
-- 
2.50.1

