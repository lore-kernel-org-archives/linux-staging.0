Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B97FD28A3E2
	for <linux-staging@lists.linux.dev>; Wed,  2 Jul 2025 13:21:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751462492; cv=none; b=d/GKfuj+td0GNvsk1cc7F20LqB/CfaJFiaW499ilciAyHRCfCeREy8snEXz1gJx5f5PJIlbFYgPO62dO0b1GrEmLql+5RvopRpNsSguoWybAdQ9kYPWWOz2YOFkJrDNvqCQCvOlnMTdVmQP47DixMqKmLyXpho3yJ6pR6ofzbsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751462492; c=relaxed/simple;
	bh=/f22tLl0QicT2JvxTw25y1ue8KTJHB9qGNyEU0QNbnY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bnlSugMMnTp29LlEfhumNZA6AQDLC57zikW7p/n3N7RcDDfUzthAEOFaqY4UfCq8vVAYrgO0YtVpobIQL2M+FkKYrLek2gPrYmqc27nO1WaMkWDh73HgeSMNmCtipXf+8epMfVdGAE2h6fFgBR+sntb14+u+cCt8nVLi48nieJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DN72L07o; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DN72L07o"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-60702d77c60so13791079a12.3
        for <linux-staging@lists.linux.dev>; Wed, 02 Jul 2025 06:21:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751462489; x=1752067289; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KXo7RwJkGdY7uM9iH8W5HiYNzQJHvSV6wI6qYgD9ZKM=;
        b=DN72L07o+cdOhRTFLPVR/LLuN6bKMX/dghYSMAldIqFrKE7xWmoIQMcOjLiB6HKLYj
         LAU4ZrhoNd+tVhrDzd34iUukv5aP5m3jbkqRFS35v/OWV0BjzDfaMn63jmQcd1i1O3tm
         l53JE2e5TVp66aRwbCD6lujKWMXPR8IBEKj0H23+IsduhIwtGE18dInv9Zlx1LEgRBhj
         2Fl0WZGn3A6UHiQQ1U8dg8FY3YyzThWSMBzzcTf+GGQTWJQ8FCeCvdk2gAeWFkMKhQ1I
         ugxVrWl6a2+ga3gva4jKIcutawAMEhO5afnFZPTY1gIGvg6xa0OE8nRjsC3A6xq6GbEQ
         s2qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751462489; x=1752067289;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KXo7RwJkGdY7uM9iH8W5HiYNzQJHvSV6wI6qYgD9ZKM=;
        b=bNfMhyRVz+0/yOYuOosUSKRzn8ggOby381IB6YBJqXVwIKlbl4BNLNNxp3HK+C1NPu
         irbQCkHIuAmduW9AiLvKcqBhQO8AUn/arSCxNzLUno6doDEJVckM7+bQ5pF9If4n6c61
         3tswi7d32JGpAMoaaLxUTuUvlj6CUvTA/vUq8vfiK4uDL+8P4waRz3Ipbyj1+OZWrYq7
         gQVpGBQ7cHALFM6Nom+T42NHPdo2SoM7MB0irMgNBQCHZK5TEnD+5Wot0FsNQTNZBl3u
         U9ZLrkcqvyxREkBBITW+bpLPP2SGHRYS7PSgxZAdRVxeTH7/WuV+pqlxS/ws6igk/Kxl
         IbKw==
X-Forwarded-Encrypted: i=1; AJvYcCVRRknur7twzXY/ZCCW2pXyof6/c7gyMstdGZukjkK57ivwbCgFnKkHul/2oV3Ivh7l5YgvZDGpC+dO8lxx@lists.linux.dev
X-Gm-Message-State: AOJu0YxIhI8OR9UOocVe+vnS2E4eDtVb3mo205jR8FyeSArp58TFPGjH
	dJVKwDXJe3y+9bgVpRTMoAWgWkmjCYYS9UuTSmWMJHkOFkqqGz7mNs1T
X-Gm-Gg: ASbGncvy6S3JzU/Bh800/504QN3Wg5eWSb7Ay7b/qPqb4KZc7G09RRqiC4PvEmzR2+8
	qxay2btlnBsKfbJEm6oW2Z6s8JqKffTZJBZbqgzXUqMjSQ9C7Nw+tdd9NmDo3WfjnZbp99326Ka
	qwyWHr5w+1SSpEAkR21tWvWL9ynnNJbt+2y/r3/+SBN3+3bJbj/TOVOra8/bR25lrQ4/6fCr/7C
	q0wp29ybej2Z2cJy2OG5MbREtEwoJTBNx9nXFckElOfoaimrFvvD0WaRmxoFRwr0pvY+kymqzIo
	0KO0wfGlyXaXrM6OyQNfNPhrnTeAjlspwDj+jaIrbGfdRxpMT2+6ecvbaExQ2x7qvOew+6WfMP0
	=
X-Google-Smtp-Source: AGHT+IHTtF+lt1S4NFZQvii0Blm1rrAjgb5g9dP5Vwg0W84+je/og3eED034lCfhI7vq9B1qdE1n8w==
X-Received: by 2002:a17:907:9816:b0:adb:469d:2246 with SMTP id a640c23a62f3a-ae3c2b01b35mr292245266b.17.1751462488815;
        Wed, 02 Jul 2025 06:21:28 -0700 (PDT)
Received: from demon-pc.localdomain ([188.27.131.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae35363b094sm1063800966b.22.2025.07.02.06.21.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 06:21:28 -0700 (PDT)
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
Subject: [PATCH v5 08/24] dt-bindings: media: i2c: max96712: use pattern properties for ports
Date: Wed,  2 Jul 2025 16:20:34 +0300
Message-ID: <20250702132104.1537926-9-demonsingur@gmail.com>
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

The MAX96712 and MAX96724 support up to 4 separate PHYs, depending on
the selected PHY configuration. Use patternProperties to document this.

The input ports are all the same, use patternProperties for them.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 .../bindings/media/i2c/maxim,max96712.yaml    | 29 +++++++------------
 1 file changed, 10 insertions(+), 19 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
index efdece2b33b9..f712d7cfc35f 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
@@ -40,27 +40,15 @@ properties:
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
 
-    properties:
-      port@0:
+    patternProperties:
+      '^port@[0-3]$':
         $ref: /schemas/graph.yaml#/properties/port
-        description: GMSL Input 0
+        description: GMSL Input ports 0-3
 
-      port@1:
-        $ref: /schemas/graph.yaml#/properties/port
-        description: GMSL Input 1
-
-      port@2:
-        $ref: /schemas/graph.yaml#/properties/port
-        description: GMSL Input 2
-
-      port@3:
-        $ref: /schemas/graph.yaml#/properties/port
-        description: GMSL Input 3
-
-      port@4:
+      '^port@[4-7]$':
         $ref: /schemas/graph.yaml#/$defs/port-base
         unevaluatedProperties: false
-        description: CSI-2 Output
+        description: CSI-2 Output port 0-3
 
         properties:
           endpoint:
@@ -78,8 +66,11 @@ properties:
               - data-lanes
               - bus-type
 
-    required:
-      - port@4
+    anyOf:
+      - required: [port@4]
+      - required: [port@5]
+      - required: [port@6]
+      - required: [port@7]
 
 required:
   - compatible
-- 
2.50.0

