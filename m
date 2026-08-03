Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D19B2F7F1F
	for <linux-staging@lists.linux.dev>; Mon,  3 Aug 2026 02:07:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785722831; cv=none; b=qLNF0IIAV8MiuMGUSUAdDwjHFk//oQxwM3qRD7cdwmuLzdPnWxbGvs3Qs9VXdvmmZ2FcqxFP//STorXUVNRcqEwTooYOy3ka6xadEqT5Qeb+1TbKJQWGlb+X5mIh7V2WPwYh33IeJOjPscrmUoQQApcV2JMGcxHJy7FOzgtfIKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785722831; c=relaxed/simple;
	bh=0H56cN8OLvx7IHM9PUBzE5XNvWbZ98R7OzSbZsOwEuc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZbP53r0qS6FqGk8wq6uz5zrFiR8r7oRwDB9t57brQKPVN7U5TKNnl4sv6OAGGPKE7k01vMoPSKlmxtn8zI7bgO+1ZuCfmlBu/oOmlTXwuEYmtLO1F3bY0qlOpdz0I+C1RNWE7EpxSPQBWUbrQfQQhNNprwzJ1BVXtX+9v9Ak1Zk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VIM3GxNp; arc=none smtp.client-ip=209.85.221.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VIM3GxNp"
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-5bf8a2932a3so1538107e0c.1
        for <linux-staging@lists.linux.dev>; Sun, 02 Aug 2026 19:07:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785722829; x=1786327629; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=70JXVgQ+jeW3FDfdiYte2ODsaEhoEULCuPlp/iefJN4=;
        b=VIM3GxNp0vx+q/sVG/dKKahZsdPrC8ixu0lgeJsiX4Zi+DXHxGFXVSPikKFwXIH3X1
         KlM8iZ0UPLnQQQFlX6pgZEHY+wczRxRzQ1PdclYRPKi/Qi1cDIoSnyjkz3l9pkf+SdFH
         48DSB5PUZP/NN2lHbKSk/5SZtEbYW12RP5c1R+tFgYyzG5vxvVAnbqggGKxwKv0DLctH
         96EOxBCPJ1TBoLxU1S4VEOSRzKXuCrG7Za1HMg44tYDCx4pRFcr1X20amWKEUzgg4rT8
         RuWvenpoOT6Q48caE3gnOjnZ7feGIyzL6x7HmyKK/zIMhtOD1vNJ1sTuGGyEEBR03OYI
         MYuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785722829; x=1786327629;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=70JXVgQ+jeW3FDfdiYte2ODsaEhoEULCuPlp/iefJN4=;
        b=J5TViclcvb6YLUTVXWEt92D5EEslrtKGQaWytnpNbxvAO2B8G6vDu4QBnATARvTv4g
         pLoHacqq6cyd7WS2RN/ZNWQZfizal75Tbl5zj2K+gWVXWl86U8GykExXAx4mku4iXquO
         adOF++jnuhbsQ1FPEXgr+GUAfDgxjI307Y4QPaqraz1TX+IUfJeJiaD9/f6LBPG/O9Ld
         0JdFrpRwXMScGhGzO5oP1j/HS56KxQvHCvkvVHuSQiDW5A7cttoVK5mBV/FWo0stLBdC
         yWSvzm2iGoIHcMORD9GnegXaN4l+dAjYnu5oNfkh2OPdk52lIYQyLsd7lz/ZUiIWLuwt
         DUXw==
X-Forwarded-Encrypted: i=1; AHgh+Ro/qbDhG2tAYu9NDzXaaPCs/rkSgn7REASvhKg43FQhgNqiQuoI6zeipQs96UPffML2F6Ss35mwtp+/cXNo@lists.linux.dev
X-Gm-Message-State: AOJu0YwejeKqnH3U6gKE3DFyZ/V/ClmHLaUQQvuNQ+thsJOx/crmxm6+
	N78ajC7hq9+1eTgXDFJpLp8/gUVKnlc9NP3dl9VN8rYUnHUePpFIaz0ZebE6/R7PHkM=
X-Gm-Gg: AR+sD10jDChfkic6ezgga7ABQjbcH/YE2z8JK1dRY0fmOIYZetVauiI5CIpfYbenhBO
	pzg4dBrrliuX8+DgJcMnxM0gTRITXqhp4QICsvV2TQzeNXJFDeHWSznCay9CXfUnDMvWBmuzRf2
	DJaydHMrQqaSFnSTpLzFLLeFxLECvsuETlJz093mGSrrbRlePrnd4GD3bzd1rZNYjFmcbD3WPur
	kSHqES4CqXM+31R4RkjEJ1T5wDfxMreQGlq31FlHynNdn3wJidAkTpxnxhuZSmmTwQG7dyq53MK
	QCNvix88bGx+1Sj6nysQ/1r8ZoSi353Oq7NxP/l5mxBID5YAUGedY/J7WU5jbBZrwnMVUhXdLnE
	8Zi+/BwbbYwZaW8cJ/Fh9MsP2iFaQkfNgDH0O/abp4MjDdExn1CE6XsZaSeFa37aOhRY8EC3Z9a
	ao5QalnetdgGje/PH1b2Q4dwnfO6q/WrUOpEqiXeTtRX4fvnlMKsNveLme4YqIEb7bP6J6LyVq0
	3o4j89GgEaK209kD8QbZJwtHjb7b+9jPhvQplhrFxKU0lYxtA==
X-Received: by 2002:a05:6122:da2:b0:5bd:fb78:5461 with SMTP id 71dfb90a1353d-5c3873c15fdmr3050729e0c.0.1785722829054;
        Sun, 02 Aug 2026 19:07:09 -0700 (PDT)
Received: from NoahDesktop.tailef97f4.ts.net ([66.231.155.87])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c37ee14727sm7646401e0c.18.2026.08.02.19.07.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 19:07:08 -0700 (PDT)
From: Noah Techoueyres <noahtechoueyres@gmail.com>
To: pure.logic@nexus-software.ie,
	johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org
Cc: greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	Noah Techoueyres <noahtechoueyres@gmail.com>
Subject: [PATCH] staging: greybus: loopback: Add comment for mutex definition
Date: Sun,  2 Aug 2026 22:06:09 -0400
Message-ID: <20260803020609.693-1-noahtechoueyres@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a comment to the mutex field explaining what it protects,
as required by kernel coding style for lock definitions.

Signed-off-by: Noah Techoueyres <noahtechoueyres@gmail.com>
---
 drivers/staging/greybus/loopback.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/greybus/loopback.c b/drivers/staging/greybus/loopback.c
index c33b8aa5871c..f94077a9d64b 100644
--- a/drivers/staging/greybus/loopback.c
+++ b/drivers/staging/greybus/loopback.c
@@ -61,7 +61,7 @@ struct gb_loopback {
 
 	struct dentry *file;
 	struct kfifo kfifo_lat;
-	struct mutex mutex;
+	struct mutex mutex; /* Protects sysfs attributes */
 	struct task_struct *task;
 	struct device *dev;
 	wait_queue_head_t wq;
-- 
2.43.0

