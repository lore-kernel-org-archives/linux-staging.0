Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9472B285404
	for <linux-staging@lists.linux.dev>; Wed,  2 Jul 2025 13:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751462503; cv=none; b=DIzx5Xdu/Oi2BQ1rd/PgpeAtGjMTbyyerjoewFeNOuITVuagLBTcvOheigxcDTzTbLhOHKKgmaUI5WFfe5zujFaWD5HfNEBO2ktamImgF8GjIniejoNOWjr9VsYf6vGnbjVQgvchwmyEaApVwliVe00kyBsmdHmEW4gUWXkyZa8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751462503; c=relaxed/simple;
	bh=ghXZMToAsypTjoUt2g2lpxT7MAA49Nbf+kAqmkife/s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=R+At62/6JB0Bu/ai0ln/YzMCAsPFYt5wCwhukvz2dyQvSS1RXZUU/YK1UPkGU3NSRF2kExIUjwd6pd+Ao/qqmzz86McCD5JMNs7Uklz4MAr1rm8oEZDNPXvwRfC4vpExZI8LJbzaDVX7UfO5FE3xXvd2VgeW8+fKtUz5gB7DY+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iCSyvE1o; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iCSyvE1o"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-ae36dc91dc7so761032366b.2
        for <linux-staging@lists.linux.dev>; Wed, 02 Jul 2025 06:21:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751462500; x=1752067300; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H03QxZ8jCGcSyzf0c9ETEKnlCFRjYaAWDRsc1hq5beQ=;
        b=iCSyvE1oPacJUI1Xwieil8p20APGYlKqIZ1POI7CoJJnCaudOcBYyfGvtIhXmf6tjM
         m1M9gohBh7PVaWtjHBRZD9APido3JsJ24dr0jlWEmU9g2qfr9jFI3pEntZ0IRg22joi1
         sMmo2to6OZYj0rJRaX0nPCUVIPMiYphu9QmyQoXPu7VCMDrzqwhkXg0KHjmBr10HriDJ
         tM8qgO2ZOcUgsnrenHB30+1EnnT47YQk5TAt9OdnOMI2gW/u3rDmR7R9QtUcX5rK/wP7
         6FGpj1TQzWP3R2ZuLeovYe8o47zWscUuowMw0qyB1CKmfFDLZnVR+vgnILOkO57TGLj7
         X5VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751462500; x=1752067300;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H03QxZ8jCGcSyzf0c9ETEKnlCFRjYaAWDRsc1hq5beQ=;
        b=BYgJgCJziePYfpD5+85mPPuSk4fz/nVSdP6fJRhqH7/Dhdmwm32E7SEbwS6kxs2n1q
         EazYjrof7R/Bxq60DLW91+YlruqIuaR/PRSJx8h7oif4zO1yu4HevmRwrIgkz3LVXlcN
         Y2GxIT7GcQamTxVfKqiyz8ym58sQOunmq650eOpD6qPbnj3bFTuey54CTX7hAyppczs/
         ab1ZglYkK5VHQbMP2MdQY9wDfEZfGNn2MrdZ2igg3ex567UdXPkqKZqwUE9Gn4OojRQU
         9UgQ58f/Aa/3z7mI//81/WjFowpnsl09XKKge/CAMLw/gZkePg+7pqYQPuu1cBPLaR80
         t57A==
X-Forwarded-Encrypted: i=1; AJvYcCWCL3HQl8mpNyKeKGX2mZQLtsTbRzhTOLoVwnGJpQJEgXce6Djh6YWPB0SN6SHa7Z1kHsjO5s8TRd2F69cX@lists.linux.dev
X-Gm-Message-State: AOJu0Yxt/byETWnxj/V3BqTgugFfQzCf2GneN49d/Q9SoqGI/5+9/4Ki
	d7SA7eX19wV5nMRwipZwXoFojJ3meIBo70ulC4MUaxq+/BZPzjmo9Sp9
X-Gm-Gg: ASbGncuR9q6bvysIKL8ONnc2MHmFMavKgLmQN4bmuS9NeyxKeUUvPdvPDD8tJIos7/m
	g/gCGbxJIomhTMXATC0z1F0N0OeQy40/WhV+G7tckIx9yRl41FPwyj6hMe66v1CU2cw/LK59kdx
	zrWVmJxPA7Wwy6/GmOripCJh6Sp+itKHYy6MzKIzl0PaWGG3oTs39EVISttKzI349+BGhGBc+Ah
	/MNVLubJcw+HSLGHAbzqt5VjuwVr6IcS5We6fkmbeHsr6nJ1OVIoA3AyFDvg/kQ7lahYQC0s+R+
	7MJ1sUrqr4CkhEH6yMDyCbL6ZnEoUBzFgX3Dx95iMn0E3OOjrpvv/hC2ue/PWSPvv7LqcTVTwCo
	=
X-Google-Smtp-Source: AGHT+IFSFezEWpfgEBsp/mJRLUM12wzHFLkzaMEJRfqJQGh3GVulCFiNoRfRWUaVV2bT/4DwuhdRIA==
X-Received: by 2002:a17:907:94cc:b0:ae0:ba0f:85af with SMTP id a640c23a62f3a-ae3c2dfc3fcmr314072766b.51.1751462499748;
        Wed, 02 Jul 2025 06:21:39 -0700 (PDT)
Received: from demon-pc.localdomain ([188.27.131.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae35363b094sm1063800966b.22.2025.07.02.06.21.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 06:21:39 -0700 (PDT)
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
Subject: [PATCH v5 13/24] dt-bindings: media: i2c: max96714: add support for MAX96714R
Date: Wed,  2 Jul 2025 16:20:39 +0300
Message-ID: <20250702132104.1537926-14-demonsingur@gmail.com>
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

MAX96714R is a lower capability variant of the MAX96714 which only
supports a fixed rate of 3Gbps in the forward direction.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../devicetree/bindings/media/i2c/maxim,max96714.yaml        | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml
index f53c72e5c572..1c97624833eb 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml
@@ -23,7 +23,9 @@ description:
 
   The GMSL2 serial link operates at a fixed rate of 3Gbps or 6Gbps in the
   forward direction and 187.5Mbps in the reverse direction.
-  MAX96714F only supports a fixed rate of 3Gbps in the forward direction.
+
+  MAX96714F and MAX96714R only support a fixed rate of 3Gbps in the forward
+  direction.
 
 properties:
   compatible:
@@ -32,6 +34,7 @@ properties:
       - items:
           - enum:
               - maxim,max96714
+              - maxim,max96714r
           - const: maxim,max96714f
 
   reg:
-- 
2.50.0

