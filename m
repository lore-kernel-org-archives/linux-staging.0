Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1079E28A72C
	for <linux-staging@lists.linux.dev>; Wed,  2 Jul 2025 13:21:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751462496; cv=none; b=Lwttcv+dD/SmtA+wE6vTcdHXvNZn2RjcRBJnPZGcvMqQOsQeMc8HphbOgINxH3QF895yaUtv01p3j1XH2f7woE1GKY3CMzxsI1+J7yHbQvchpP1g7bAdePO3uFYKAZmndbQ1IVocQfQt8eV/mpVd5QeD3ZDv1Scsfz8MOpCKqW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751462496; c=relaxed/simple;
	bh=FlUeBByjjmUWDFCviH/QuygzCnSHCQcTvS1UEc7C/m8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HlEk5XZss87HU2ZxGQ+DxRiHe0IGadV6D45Brujap56FfdysHZSCSvuQRPJOLhS4oRW3UnRus5sLaYefK4XdeWdTGtkrhw/E7OGu7f780IvFtqMfX9thtyv8GYvaYV9b4jFrNSGSrpjw08Mb1TTItvBPBYPHM1vJhClSKKJsYvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BOX2q+bp; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BOX2q+bp"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-addda47ebeaso1424946866b.1
        for <linux-staging@lists.linux.dev>; Wed, 02 Jul 2025 06:21:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751462493; x=1752067293; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=woN3IMIK0eyXUy8BqjMpuHpqxM7ZtBG0o8DuW1QypD8=;
        b=BOX2q+bpRY1dnBWD1tY17IAMMY7o9dCoiYwFHb+boSL7Ad1F18o9gbEU6XwrGqEoDD
         0mi035jv/1jwGSLjFdjoWXDHn4YFZ9rD3jGATYum406YZBU3o8ua2cQAa2OLLVFYOwG5
         j6QGF6elBGtXoGv8o180BDTgQ9uWclpUvGnVqGhksH8tjngtRBJ3hWlO+Ex5Pbhxhwvz
         ysrmyd0HYoTxUu2FhlFUuxg3ZSnTL5DtFcn14vOqOgNDw94BwzP+Veek+s9bKxKhODlc
         5YLBf+SP5j+qwmQFzRf+5yIguD+mJLC7LGl+Wo57F97e+TANr6kN4jGla8su8PqFhsaW
         MWbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751462493; x=1752067293;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=woN3IMIK0eyXUy8BqjMpuHpqxM7ZtBG0o8DuW1QypD8=;
        b=kMHD1xT7/AMhSUK19tmPOImbOiinh5JnqJI4ncshSQxU6KB5ubgavadyBM89d/RcnY
         cygPmZ6y+Lrz36ZoZBDYRO/V/cDqcEKoidr1tRG2wpPzL5DKoTMXRc+5uQ0k/QwTvD6T
         YyuvAmVNIdZWkxJrUr2bgJtM1LOAbiZ0f32fPo7DBzTVQhrJR7XREhVc8pNRkv4AQXR+
         LVgapSoOOLEwCSc1YwWeFWMNyT2TUS/jb95Zwl4gP9tG4KwQgfFzNNwAf+O8kXSR32EP
         po9oPyKtXJBLFNk8W9PqGiRJELQW+fA8YTA5TtCTnswEkJ91fCXyZu4Ga4aRdnDRpKw1
         2cnw==
X-Forwarded-Encrypted: i=1; AJvYcCUsdluSKTvrGv2HIBrTCRt2PzLBP1oq3Cx1T1SVaYhK1KpOoVAuZJmM5ah0ObnzNl9VybyLeKcpZg6aGaWD@lists.linux.dev
X-Gm-Message-State: AOJu0YySylh6jAJGi/zU6j6J6sCnKTHRth8zvtgz5H+xvLmH04Ypky2z
	gN00XGx9uCCWt8hB5C3bJ4mgQ6GDOg6W5B3Uju2btO7CXDM2+7UUVPui
X-Gm-Gg: ASbGncvnIwYG9wVPTDHolb8KiepXsj0Y1H7GFGoGJZDVnvFa0gFzlkP5jnAlTDT6eIB
	D7ay2R7FrWy5+lzRjtC7g7Lrt8cjiiSlCzHQhmyugMfrqQscNgJONUI3xauimnrUoqroY+ye4LW
	5WI2OCJBLOtWu/Eds95nSyzIZHPv0NwqHEx7wxul6obEzV3KiV9/fqsRaMGe5utgAHqoF1sRW3m
	yAgSTtWJAjOj46sdHoFkJdEYCE9UPNRhhA4thlg8TAUsew/XNgbUnbljJMZEZ8h1aRrn9+HJHEC
	PXFTtNAu+Fbjgbi+Xfr8GEt3P73Bn5zSGvJ+EFBcxJCbFIDyRWAvl6sn7+FfY3QhRdoSes6/0/c
	=
X-Google-Smtp-Source: AGHT+IGlHDeC2VpgxzSynRb5GjQ581DXed8/GXSRXFEwPtFkw5Rr8/fs8tBrPXGwcvbY6SDwagW99g==
X-Received: by 2002:a17:907:1c1f:b0:ad5:4806:4f07 with SMTP id a640c23a62f3a-ae3c2b10b5amr283503466b.2.1751462493272;
        Wed, 02 Jul 2025 06:21:33 -0700 (PDT)
Received: from demon-pc.localdomain ([188.27.131.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae35363b094sm1063800966b.22.2025.07.02.06.21.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 06:21:32 -0700 (PDT)
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
Subject: [PATCH v5 10/24] dt-bindings: media: i2c: max96712: add support for POC supplies
Date: Wed,  2 Jul 2025 16:20:36 +0300
Message-ID: <20250702132104.1537926-11-demonsingur@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250702132104.1537926-1-demonsingur@gmail.com>
References: <20250702132104.1537926-1-demonsingur@gmail.com>
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
index 758c0223977d..b345305acc4c 100644
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
2.50.0

