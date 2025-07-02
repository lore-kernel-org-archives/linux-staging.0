Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6DE228C032
	for <linux-staging@lists.linux.dev>; Wed,  2 Jul 2025 13:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751462500; cv=none; b=JOfELZN9s9q33inTB5TLWaeWOPrrW8MrIXfIQy3dHMFODpEKVrBThQ9NjGSV9OddKmW3WQL0syAvasOZIB3wpRRfeD59+/6hvLr3U/4GucRsIRDVi1EJduQTO9/f7ZJ9+4lKu6ZBIXJVmAwjlwNhenNHF54bg7uJ7WjuAno1neU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751462500; c=relaxed/simple;
	bh=+a1Q3SyZ+eedrs0uKf2yOD0UQ2+TD3ruCU+uflqFJX4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oBAsUsOpy07Vf/v1X0oE+hnE8laKijZ3J5hwGaBgEoXAGUfEd42rTEzUNS+g+Fj3jfobIT6XSFUPT19EeZZsMZr8CPju4uunV88Whut7JKuFfXhG5536LTAz5pDlTl8QOKRAFntjFDa4ro6/1b7Wg4GVftnUxd+S+xWCia+8q0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=igzhRSzv; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="igzhRSzv"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-ae0b6532345so1499571466b.1
        for <linux-staging@lists.linux.dev>; Wed, 02 Jul 2025 06:21:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751462496; x=1752067296; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B4xkda96iU56AIjh88wfUhrjBY3xcgi3zA63ltJo3+U=;
        b=igzhRSzvdu/RgeEd61EQoTHu6PLZCCHkQpAfOo1Pwv9BYqgMecf2Gc4MRFy5GymiG8
         JTn/6le6nahIuMpFzs5Rx0Y5xUPPugkS9fzFQ5IuvaIGbg9xWcOC8TajKCA9/e43StrF
         dhKEnWNFNJdEmwEFuzVDcuFfftIQn1PTdNrjU+DGJyw1WWOxRrIm3o0F4eWiYxYD7S0a
         aRx7R3AuTd/62Enr7/nLRBLMDMy3ZLS3J138nnV+TlVKeEz2yUpJ83j3YjCeoNpZ5wES
         xZWo0DzKq+BTgqoYWmN0JSckSx8d4rEyEG9dnSPjpthjb4ZrHearRIsGxqs2gwXAd6WY
         MBTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751462496; x=1752067296;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B4xkda96iU56AIjh88wfUhrjBY3xcgi3zA63ltJo3+U=;
        b=uIhhQulBLB1XQ86Wx50kdbi+ekX2IFkA68o7LJKjWH42hrdtSX4O9kH+ooSZoj0DFG
         nM8I+JlJSwjvm7aOq+EuL4I4p49bMbjtZck7NmYSgYB4t9B9l920oqVAwEcYHm+xCiw8
         7k38WsRSvE4Q4Kt8MsLx86haSDtH12SLkb7R5DG7Cfd6kNYv2WO0fYfNtxRzRMmkOJZ4
         WqTBtgyQCv39cLBvSojNzQl3bUlZRs633EWpDnaIYbVN/i2kyUXFkoGYgsCbQqG0VZag
         QHtELLT3B3/dmQ59txmnjJAMdxSZ82aIeg4GOcxHxVUeGYK6pJ7HM4LmxiW4H8NsfRcA
         NmCw==
X-Forwarded-Encrypted: i=1; AJvYcCVHLIhcyzYUKqER9cnfBH02Vvwv6aFdn7fVZLkypeYnPkpisM1cNzAgmMU3iyDHRjj2lKSyA6qUj2ZHVFPX@lists.linux.dev
X-Gm-Message-State: AOJu0Yw9jXRIOeVM6YnqxMYWIcv9MYFn+BFzu9C+sOH9Nn97z3VEFp6k
	C5u2+KrVeqx3HrwAGI+miWkMqc4qA04Tkj8xyCsoP582SlYApRy/cmHi
X-Gm-Gg: ASbGncuNzxLhA/DeVqyxR7Zfc6l38i7dDdHaJdC0weGC2x3jKMM1mEVEnWsS7dJtQkq
	UaRhGmIbrBWT4UUl2YpHrHwVkl1S+n/7pT3CpoG0JhQgQdv4L92jKlXbltgGq8zgVys0JxTyU9w
	3GQfZPOjiHi/x2sk5H3oL/yPr1e118wi87j5OU7JVLAsli7SzNKYUKcGEbCyUEE5CvOPe868unf
	zVXTAxCiaTITLoy9W0FnxyC75eMkCPkGtI4stCMS1BpR8XnQ8drgxL+fWTKGZXm0+7f5rbqxMSu
	coXx8XiGHSovdoMlHF9QCtFZk32rWcUR/CrcB78yw97swzEo2C2XwaCPpTa4LHNOyO+Y5T7Tyy4
	=
X-Google-Smtp-Source: AGHT+IETdXmWWO8BsapYdgRGQMH68L3eMnzhyeMCs3h5X0X+TL6jJaRfOlE9/LRKrYaPCn1JnQs1mA==
X-Received: by 2002:a17:907:d643:b0:ae0:bf99:6c5d with SMTP id a640c23a62f3a-ae3c3c55d50mr229980066b.26.1751462495739;
        Wed, 02 Jul 2025 06:21:35 -0700 (PDT)
Received: from demon-pc.localdomain ([188.27.131.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae35363b094sm1063800966b.22.2025.07.02.06.21.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 06:21:35 -0700 (PDT)
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
Subject: [PATCH v5 11/24] dt-bindings: media: i2c: max96712: add support for MAX96724F/R
Date: Wed,  2 Jul 2025 16:20:37 +0300
Message-ID: <20250702132104.1537926-12-demonsingur@gmail.com>
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

MAX96724F/MAX96724R are a lower capability variant of the MAX96724 which
only support a fixed rate of 3Gbps in the forward direction.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 .../devicetree/bindings/media/i2c/maxim,max96712.yaml        | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
index b345305acc4c..5dcafd46344c 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
@@ -24,12 +24,17 @@ description: |
   MAX96712 can be paired with first-generation 3.12Gbps or 1.5Gbps GMSL1
   serializers or operate up to 3.12Gbps with GMSL2 serializers in GMSL1 mode.
 
+  MAX96724F and MAX96724R only support a fixed rate of 3Gbps in the forward
+  direction.
+
 properties:
   compatible:
     items:
       - enum:
           - maxim,max96712
           - maxim,max96724
+          - maxim,max96724f
+          - maxim,max96724r
 
   reg:
     description: I2C device address
-- 
2.50.0

