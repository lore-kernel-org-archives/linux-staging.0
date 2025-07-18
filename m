Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FCE32E2F0C
	for <linux-staging@lists.linux.dev>; Fri, 18 Jul 2025 15:25:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752852345; cv=none; b=SB2vMmZBgIdVkxe3NJVUA5lUcfRuK0fktGyYjy/dYrFqKkcq8/CKJpDELKqwsKpo9XYbiCge3iQojBBJjY4WvN8AH9ed/eqLIhZH536mP8GC+mlvWGA3XkqeA5ZEHpPqlztkX7lIvQtVbYbS/zNxVoen0DgEecLZMYinhGENjKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752852345; c=relaxed/simple;
	bh=A8TElTk1Fj3is2z75X3heqyGoQRmHGTT2JdVWiyMUYI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=m7zLfhUzGEy2Lm38wwthRpi2BX5ynpuR29cQnYy0C55wENkw1W6orQTJZ/AcGK2gYJ0Zo8trNmFLjh3kG/bDKoLxe5y6PM1DhP/IGz0r/crSEiqnGNHXkXpineVrXbvUC8hy7ABp9JPmZ/kBBLIuOYctnT5vXblheSlSwu5x3P8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YZUfjg3J; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YZUfjg3J"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3a503d9ef59so1557409f8f.3
        for <linux-staging@lists.linux.dev>; Fri, 18 Jul 2025 08:25:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752852343; x=1753457143; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lKwNNCz2eG9U29ALEDHAFId45pOA3pYtpGo8B4QYY6k=;
        b=YZUfjg3JMomBDcf8k9EZMl8anP0wnjDFwx1X8KhvDSFuIzB42HqF9apb577EdqINt5
         auuQiZ7Y5+RaTzvXNTLIAw6rWD28aRXnphHjI+H7DH6BWnjQ3CxsXZSJwPRPEScYnoEb
         c1UbBYOr+bjBsSMjwGOpPiKhtNQWaF9ZxCEhdRI0gsXgvxmw3t4ZjcJukDWdcjdvk9D4
         uHlut28WUsiQ310yXj5KLIfjh7Q5/pbnpF+kutdmPMa+0dFzk1WIX7+MsDKyNT+MsiHm
         JDEsPYJH1H8ntviiz/KLtXs5q1nzwGjlYvfGdTc8egNRzN5ploFAs1RMXCm/eeW5JnZJ
         FKUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752852343; x=1753457143;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lKwNNCz2eG9U29ALEDHAFId45pOA3pYtpGo8B4QYY6k=;
        b=PQ2GQFj4QykRMjcvGeLD3FEvFJtiDigmkb2BO82/KXuoYbnL6rK/JVjawmfHcjWQmD
         WL9boE538OUgrK0llkgb8zJCMh0UfakAl7SLtrVndiTVnhBtc7F+9U8bkJhyK81mk35S
         umTMpXRp8Gwd4ZFtcJnIYz0UNkZlVG771sYS0QYGeiKGpD3Mw+YdbvOfFu9xOLsnoBkI
         vTgyoyr5VdDTkZ+q0mR0yj0N2do8S96WIFtYqLOAGVugpeab7cIwj9YyHm3Rfm5VAKme
         gupTgZqaauXr654JAEw7jK4cygyEwthxVzaggMrzGYVp5ufzWwvL1x9Fa5zlZDoyPSQm
         FkYw==
X-Forwarded-Encrypted: i=1; AJvYcCXTWgTk1JGVpbYAci7T+EwnpRQL36aB51FD2S+fIhgNLMtPBOH/i+miZtwX3GfSPxsXrlaY2LX0CLm6zjAO@lists.linux.dev
X-Gm-Message-State: AOJu0YxpXDXP5mELsFdZMkzNVW5w01ocH9T3UwUWPnJeQT5710SQIORe
	2mVkjKr7cKmBd819aUs7yKKPtLCJFfzUjBGQK4eML+g5LauoqoSIi9Ja
X-Gm-Gg: ASbGncuZ29wjgLJEvvujqX27B9SC03k0F1nh6+QTwVqFrqA/yPizMtv8cpWJa+7Krr2
	AXdddy6IOlHxDPe7JSC44z/efK/n4GOMcUX6KsLycUYEkEdPC66WVErxoMphI0jovaCug0mHNuI
	5JPa+hyxnJV1gOq7P6CBN9h4n++IEXvn/ylZj++H4++36v2qqSSv/5E7QOb7bIoyI8Lr9HbOxIW
	S9eOk4KNXWSRHV6thKQH4Pm5cv9HQ+vG7UFATrGdbo8ymMaqZst/CJcbnMie29/u8x0WDl7Qe0D
	EdqrmaIYV1JalWvmQSD9Qnk7MhKEF2KQBaN7jdLwDipjLruY74XlDw/0oVXPFuKyXopPefQGMgI
	9OWR3ZPHLWxK/aKFpiGAu1Gwm+s1e/SYFpbE=
X-Google-Smtp-Source: AGHT+IGK51BdL+yXQJI7ETdHEtahe2g0TA1zj3GYacJnrCDjJBB0ZM/jW6qp7Gsv+wdfK8sGbDTVrA==
X-Received: by 2002:a05:6000:4311:b0:3a5:25e4:264f with SMTP id ffacd0b85a97d-3b60e51caa8mr8808575f8f.31.1752852342522;
        Fri, 18 Jul 2025 08:25:42 -0700 (PDT)
Received: from demon-pc.localdomain ([86.121.79.159])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b61ca4893fsm2195780f8f.52.2025.07.18.08.25.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jul 2025 08:25:41 -0700 (PDT)
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
Subject: [PATCH v7 13/24] dt-bindings: media: i2c: max96714: add support for MAX96714R
Date: Fri, 18 Jul 2025 18:24:49 +0300
Message-ID: <20250718152500.2656391-14-demonsingur@gmail.com>
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

MAX96714R is a lower capability variant of the MAX96714 which only
supports a fixed rate of 3Gbps in the forward direction.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../devicetree/bindings/media/i2c/maxim,max96714.yaml        | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml
index f53c72e5c5727..1c97624833ebd 100644
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
2.50.1

