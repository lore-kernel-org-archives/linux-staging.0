Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEE852E264D
	for <linux-staging@lists.linux.dev>; Fri, 18 Jul 2025 15:25:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752852344; cv=none; b=Ul0meh66ameJKxrYSbLgTVFhkAtjMVnDBTA+wA5ktipk4moPvJzE+VieD55cxky6rnBUCkB+IA6S2HnyE7aPRTxpkzFB779CJx/nJTUvR9zvmD+2EK2hdLbcccTsaTie52FR5UasoQDWEi6P9mho1Lz6qySfewW39u2gSV8h/yw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752852344; c=relaxed/simple;
	bh=6IaLZk5ajCLYmQ3Mz5pBghgvBkfz9rSnhglhzXJVewI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ejLaiUymwzLTSeIFbpq2+YMtITWTF0EzMjTQ/TS4USas3jXIhtSAu7VKGQ9peyxQGO4pijhpYT3xmyHyBIX0gr3rLElwlsnMuHVp13gYmnakSBYWM2Jc5XjCb/vpHoXTgO9lJCz4iJhWWem0PAoW6bcVy3/sXsfOXJSwWevTGP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C8NbRmtp; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C8NbRmtp"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3a588da60dfso1379035f8f.1
        for <linux-staging@lists.linux.dev>; Fri, 18 Jul 2025 08:25:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752852340; x=1753457140; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nPCXaM2fReTmTR1+dO9f5EB14T9FRoV7tVgoNxuKveQ=;
        b=C8NbRmtptgHbD3XyX3kq2b2U01l1OIAVgTwNEmpZw8NM7ZnPZCt9znvx7r+IRXiwcr
         G3RtRnEFx3RxnG5XYWVIsDwsRq8RPeqv7V5ZbftfCmW6yU5Wf0/eWbIXAKanhYRkDYQL
         EazlVTpSKAi9LCv7fRhzGSuxOWoet01zbI2exrhfGisZ1+4AOSRW9Nwi0qeXVK1yX5+g
         5IUHZQa2MaGBr/bmwxa3IusxxX3pT6G3NWFemoCmPdXwCTKXI6lPrmmIXF+c7zmW28Uw
         7xf+6Gp3EpHSgrrI3H3KwefDXY7EChNQHPYfF5I8VkUJPf67F5KAKtKGq7p3f6VQyazN
         FiUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752852340; x=1753457140;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nPCXaM2fReTmTR1+dO9f5EB14T9FRoV7tVgoNxuKveQ=;
        b=Iq34LX7ttarrwUoX+ANNzGQysgoISbXVnIhjpDTBk+dHHLA0HcWWHPLpLXExFORecS
         LPwvesW+UfpduzXiYcLaaqhx2g54HWqyDJKpEXKMBSaiDPddJ31dFB/5kLRPvW73wFtH
         UzyzDTfXySvhl44q1ptFB7hTQJLa4zWS/V4bAKqOojEyKIDbPININiGkiK/CAIfJibKz
         5Ik6E00Ro7Smbe5TkKjxH36bWURNpxyR02CsHAFdPrZhMlZfme/c4K3TcOtOL1F9+BjT
         w7A5tV4IDn7z1ivrfqsFIYHgvOj0+myGA5kPy/9d26tL5WY6UJlcuT8bZC19BYuhb9Yo
         JNgA==
X-Forwarded-Encrypted: i=1; AJvYcCWirdBAzhT2NecDTGGN451/j2DImeLTGcNp2oa5Bc+ERr0GdZ6KRDioX1ybtN9M5JIknB0kwk+dERqAnnlc@lists.linux.dev
X-Gm-Message-State: AOJu0YzCPXaO945KUhbHzxFzARtOowm2fGHhWPytPOoqSDW9+q+0zCIF
	kkZwmftDrIDZFVmdG7JxSzWWIYg0eozsv8EJOxpNqzeOQlLINJeS8b5w
X-Gm-Gg: ASbGncuI7qG40rMMIEH8eYPoVsvI+d9JtY7hm/9xEntMganCFGHtTGbhABRbsIP/PFO
	Go5pgy9we7NWP1RlEBRuFX37kTsOKfps42vtDDZkc3+19gibbzXN1r0b4u1qlFdHYdMXKO0uqQs
	DAxuywEq7Js45VlYiyA08KBlCnczmNUqF59g1IbemwpWoBPslj8qpPFtJFZ/mKWcHfE6caQd+2/
	6tRysEP1ylLRIUS5jnE3ICL38mNhFem9jQ3t4Q6FySl/50bzYNSFJuo0d8QCP3wcDL48dSdr7Qe
	mDKHfq6zwl88muGlj9/8Ys09R/uBHBGGAdIMkCBUfUxOG5QOmi7UseBI3VtQ4PxmofNAHh2iezG
	2B3ko4AHMNs9E0nsx4H0C+hU4qRlVm7/+klc=
X-Google-Smtp-Source: AGHT+IEZJvH2brWPqdjnylH1nGNNdQPMn9WAZeVtiulFy8Wb/LXo/qxYfZZtxFSL21iJFnc7/1b8ww==
X-Received: by 2002:a05:6000:290f:b0:3a3:6a9a:5ebf with SMTP id ffacd0b85a97d-3b60e4d0841mr10146216f8f.20.1752852340160;
        Fri, 18 Jul 2025 08:25:40 -0700 (PDT)
Received: from demon-pc.localdomain ([86.121.79.159])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b61ca4893fsm2195780f8f.52.2025.07.18.08.25.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jul 2025 08:25:39 -0700 (PDT)
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
Subject: [PATCH v7 12/24] dt-bindings: media: i2c: max96714: add myself as maintainer
Date: Fri, 18 Jul 2025 18:24:48 +0300
Message-ID: <20250718152500.2656391-13-demonsingur@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250718152500.2656391-1-demonsingur@gmail.com>
References: <20250718152500.2656391-1-demonsingur@gmail.com>
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
index 3ace50e11921b..f53c72e5c5727 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml
@@ -8,6 +8,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Maxim MAX96714 GMSL2 to CSI-2 Deserializer
 
 maintainers:
+  - Cosmin Tanislav <cosmin.tanislav@analog.com>
   - Julien Massot <julien.massot@collabora.com>
 
 description:
diff --git a/MAINTAINERS b/MAINTAINERS
index 3117345d0619c..93e22dfd61c17 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14755,6 +14755,7 @@ F:	drivers/staging/media/max96712/max96712.c
 
 MAX96714 GMSL2 DESERIALIZER DRIVER
 M:	Julien Massot <julien.massot@collabora.com>
+M:	Cosmin Tanislav <cosmin.tanislav@analog.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml
-- 
2.50.1

