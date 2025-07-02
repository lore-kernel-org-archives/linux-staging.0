Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFAAA28C5BD
	for <linux-staging@lists.linux.dev>; Wed,  2 Jul 2025 13:21:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751462501; cv=none; b=cg8V0vLT7y+clf2TRHBVSaBL+hNB7BFpKxZ8hW5EQbSTxFmnL8DqcyNWsDR0fgZq7VVTXKg7fdcZXYNDCk3EK9NLPGSYNLddrv4iBsyE0tvBnZwydIyxgDZG0e3S0fKLo3o6rRU5x5hXHr9taZ2hWRWubfZJ8Um9c85N3lEHKt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751462501; c=relaxed/simple;
	bh=Hx07C8J+kaLoUADpRmG579tBQ5v1v2hmHsUK2Ea3QMg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eiu8gYyIYTJNpUviD2Cqb9nAmK55aeNrQZSkeeN4XQYtyvqDSq1eVDCtRTB3msAWL3MGIla2HJWFyW4FjSwL0Y5oaap5VgR3OXaSycAQwpM53IWZeSW8GG6irfAZCb8p1qI3e7uRBRvezg6EbSd71PduFGxzeNfevkhOphh5W50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Cf42c++i; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cf42c++i"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-addda47ebeaso1424963666b.1
        for <linux-staging@lists.linux.dev>; Wed, 02 Jul 2025 06:21:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751462498; x=1752067298; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BFetkJ8v62nDUZ4qivoqFltXa9e9lgHI4HWafIdFbA8=;
        b=Cf42c++iaxxEcaiQgGT2+AIezfMiTgu8JsoYZcoF1JHSBmkSZpdJPBUZ0EbB2GU+Gz
         hL0p/aj0K50LGeGOfkzdpoJw5ynOO2/vlrs1fGWut3DUIgkUzjqZO9a9IiMhKZYRttdM
         MqKCchtnARM0yih3Dhr2rM9WUxjnBT9yt8mw2UWQXQxTpB8zz7WSO1tgKjGCPDywKRWv
         rwhwsOkX4J2kaVz8W+FVJzjddxyd2qZPaOLQiOoUXQqxzXrX0fxa3ghRhjXVY/tJdE5F
         KkULaFEjh8CCi9jhXHo/5I9y5dKbn3gCE1qEe+UCAppXV9BafRzn9S0HtHTZugWSS6t6
         j1+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751462498; x=1752067298;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BFetkJ8v62nDUZ4qivoqFltXa9e9lgHI4HWafIdFbA8=;
        b=oGuwEhU1V57v66THeOwY4xVIA28vOB9k8LTbJkTDGn7J4knZAr24sTHubiWt4z8aU8
         MVEx3kHygHqs52/gTylM911YNzVJiJPOvLcjrflsnCrBImGG5BCgznphss14/89CbCJ5
         P5H4tvtCuyKWZPXjBQhypfDs/9cnoWFFOF6lhMROiCnpME1+Yy+gysDGMEKlhGd8b8oF
         Hv4giEKp+2k6x3q20gVf9sUQ7BIaCLFk6d4WxXI0NWRBcZdv56TWbflPubUa2COH0gNb
         1LybYukDP5qQox3b5hiAsne4FXMqH6n++NA6KIl7kNWfjxXNuKkQz42pErydp7h2M9c3
         62Nw==
X-Forwarded-Encrypted: i=1; AJvYcCU4TR8lfceAOrSXIMzuQl/dWxMIk1p7qF18rQs/L9dk8Vxz8cBeukGwxss4ZuXX/bSQxj2OSAOKFjQGrrjL@lists.linux.dev
X-Gm-Message-State: AOJu0YxCKxBMtWBWv2XDvbEo6cv+6LuHI7FGBTXg0zc+ZC/5++Br88UI
	B6duD9F8QaEFj2vHLoqUUL0j1oDz5cOb0fwjVeym7fsAxCkI1pf5yskc
X-Gm-Gg: ASbGncs18DSUtAvylE3DjTPGzJHt6Of03sSF28vsCqHimc5OGzFWvAFQ+YkOE97Ifbr
	hHPyH2FhClfRcbj5uCqW8bthXgcik2/Rc68chbTps/1nSicil436UaibAZg+ggEIH5IfyDWuTmo
	+nTp67/AMLT8ExyQy9xX6ygjWCjCOeic2UTiVp61TtrSjOf5RhMhUuQsf1BDJuWw7SF2WKMncZX
	Rl65jrjzy6+WyxB1HqKYAaQioE6xR/qZUv/oPZ6JYeMUjNgFCkzw8zuXfAFAHlDZ5ZWHmI+P+5z
	m2nxE7h4VAuSlDQ1r8E96ZSplGpbJ9YQ8iBpEdUjM2wKHVcYXWkRcVvYyVsAYJovfKw+xvFqZJw
	=
X-Google-Smtp-Source: AGHT+IHI//NlJkyO0mAJLjERVp3Si571/ndIJ883TF/dcmn6gSg4Dwn/0R3LyLHWa3KrwYYCeLuPyw==
X-Received: by 2002:a17:907:3d8b:b0:ae3:b2b7:7f2f with SMTP id a640c23a62f3a-ae3c2d7fa07mr318636466b.40.1751462497763;
        Wed, 02 Jul 2025 06:21:37 -0700 (PDT)
Received: from demon-pc.localdomain ([188.27.131.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae35363b094sm1063800966b.22.2025.07.02.06.21.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 06:21:37 -0700 (PDT)
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
Subject: [PATCH v5 12/24] dt-bindings: media: i2c: max96714: add myself as maintainer
Date: Wed,  2 Jul 2025 16:20:38 +0300
Message-ID: <20250702132104.1537926-13-demonsingur@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250702132104.1537926-1-demonsingur@gmail.com>
References: <20250702132104.1537926-1-demonsingur@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Analog Devices is taking responsability for the maintenance of the Maxim
GMSL2/3 devices.
Add myself to the maintainers list and to the device tree bindings.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml | 1 +
 MAINTAINERS                                                     | 1 +
 2 files changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml
index 3ace50e11921..f53c72e5c572 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml
@@ -8,6 +8,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Maxim MAX96714 GMSL2 to CSI-2 Deserializer
 
 maintainers:
+  - Cosmin Tanislav <cosmin.tanislav@analog.com>
   - Julien Massot <julien.massot@collabora.com>
 
 description:
diff --git a/MAINTAINERS b/MAINTAINERS
index 6a89cbb2d14a..2fd3edef879f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14736,6 +14736,7 @@ F:	drivers/staging/media/max96712/max96712.c
 
 MAX96714 GMSL2 DESERIALIZER DRIVER
 M:	Julien Massot <julien.massot@collabora.com>
+M:	Cosmin Tanislav <cosmin.tanislav@analog.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml
-- 
2.50.0

