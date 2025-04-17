Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9771921767D
	for <linux-staging@lists.linux.dev>; Thu, 17 Apr 2025 00:33:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744849992; cv=none; b=d+u8/baJE1KYYTBQwwmob740mgryVZpZueJ18QNjpX+Oiqn8s0KhuIOMqRk1gmZfP0obLWI2XkoSHAeOx52N3iykqVBeGtOSb2yo+XqYIUxAolzXhrgFLq+dpl2SxO0kdtmWM18L0/RsvINt0v6uDdfZrJJTtVr9g7D4SjtYxXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744849992; c=relaxed/simple;
	bh=1yv5YY4t0Wi3X/jvcxjgbarzHO5IICMFfCZkUFOWK6w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OgmuZmoTus2vmy6mU0lFwUwdM7sh3EgHz4BGNU+bYXWmapYSdPBCifOUGRZnGTtbYSmXPX+AwYGnVHbVDpkyydTCSRdwy1+AjGO7b/SX1PnnE20x1X5y9/P/xfKjjwfmHIMYhoZW6e0iiBYzcEwL7BN51uCilSKoD8kOi7emfos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=VeNddyk6; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="VeNddyk6"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-22435603572so2610175ad.1
        for <linux-staging@lists.linux.dev>; Wed, 16 Apr 2025 17:33:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744849990; x=1745454790; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mNJv0lcmYb9f27nCiWvpiCIAVgYIbFQyGmxFaNMZD0I=;
        b=VeNddyk6kARemoE7WCAotKvWcyJMgOlp1jXqWyx0aHyide0pwZ3nRnkRlmhmuItjdw
         E9fMTWyrfvvtTY+zLYwDkY2+DsirwcrWq3LD6LQYa6w1OZifchjcUjlgBAvGi07qIvYQ
         bVryTKMIjYNSlTblU75wZ6NxA9OtEsvIw3c7Hg5NxVJz9f75LwmMXTYvIO2rEDyGWjKY
         Kj+Aih0ks4rrlgHn4YDH+igyZONf1+Km0LeBfuANGkiDY4CTFIdGl8dlwKb6dHbcXPnq
         CFKiTsPHOCtgB6NNYNowEfudHOUJMZ5HPqdWGoidXCsT9LNpXrxwyih4Dbsf4V/kO1ZJ
         gRLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744849990; x=1745454790;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mNJv0lcmYb9f27nCiWvpiCIAVgYIbFQyGmxFaNMZD0I=;
        b=vb179WvwEfFKpvGTd/KucamsSUAek/rJLb+klPiv028Va097HtzdmRnz4idItH60WA
         gKu1TvZY1PPTr0a5xfDhRi4FV4UxZIAnCifiC1ESPdq4P6XJB+loTOr9LuusDSExAD6L
         t5jnHwwVQinXzfKrV+b+Uk0Wrhvt16BIwfnTyg9WPXh3mhxJsXk0n+V6NbVrXfGM9oUr
         jQuYGgrZbTaJBhrFYdo4xaI+hPo4CkWwRCm64aR5l9u1eUKqHZH7n4UJZqLSAUlZG77E
         /hGpYESAT5PDDNQF8LKu2N5AhP8vlvZGQsPDYP9atJeOtkobEfBmjFfIKmf0rug4aM6y
         bsjw==
X-Gm-Message-State: AOJu0YwF5TUO9dFpsQccnPUCM+cmeXX+XD6PknXi2G4IzFrjhFNVOp4l
	DZLEv4AFRqbfGmoFTvHiIi+ocbSKapxTUmnlWPtdASgceVj0TEtgtE2EdvHdqbU50mByu6syp/U
	=
X-Gm-Gg: ASbGncuV3+e/kyzCC6rkc/Qsf9PLuk1R36Zlr8b2tKcXRT3qZYo6jdG26/15xNiQdWF
	KanRKKnvpnyYNKssKZKYuYq1zkedENM2NX82njGJBaffcrZ4GTdbtgIc5HkgKPdRiYlovDZKspZ
	yE/g8kY5t8mhfLBgPUWnmyDb89FY5Sfo7zM6Fajk2CJ/bbH0gYQKJLqETAJTmwUtMNk1z5n6trX
	w37dtmel5ztst3CXH4gccRXJU+smE5wWh0AHSU09H3juqwMRQaFG8i5n0L4RfR57zdXK9NWOA+W
	hLSjAoNR9nBPhNVBHf7413e79ee/gIQ5peCXl5Mg1dZvC+dE4YqzKEYK0Oi3YhP9mTO/voWcBCG
	1zFmxqw==
X-Google-Smtp-Source: AGHT+IFt5YbjpyD8D2gQOKv05BlHP4z3woA0O9Kc4hWd9HjFvBJUKUheFmrQ3NAFaHH4nieVN2A+aw==
X-Received: by 2002:a17:902:ecc6:b0:224:2715:bf44 with SMTP id d9443c01a7336-22c358d710amr58076925ad.19.1744849989906;
        Wed, 16 Apr 2025 17:33:09 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c33ef0e6dsm20876565ad.52.2025.04.16.17.33.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 17:33:09 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com,
	dan.carpenter@linaro.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v3 18/18] staging: gpib: Removing typedef gpib_interface_t
Date: Thu, 17 Apr 2025 00:32:46 +0000
Message-ID: <20250417003246.84445-19-matchstick@neverthere.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250417003246.84445-1-matchstick@neverthere.org>
References: <20250417003246.84445-1-matchstick@neverthere.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Removing gpib_interface_t to adhere to Linux code style.

Reported by checkpatch.pl

In general, a pointer, or a struct that has elements that can reasonably be
directly accessed should never be a typedef.

Signed-off-by: Michael Rubin <matchstick@neverthere.org>
---
 drivers/staging/gpib/include/gpib_types.h | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/gpib/include/gpib_types.h b/drivers/staging/gpib/include/gpib_types.h
index 712987ca139f..0dbe45894884 100644
--- a/drivers/staging/gpib/include/gpib_types.h
+++ b/drivers/staging/gpib/include/gpib_types.h
@@ -8,7 +8,7 @@
 #define _GPIB_TYPES_H
 
 #ifdef __KERNEL__
-/* gpib_interface_t defines the interface
+/* gpib_interface defines the interface
  * between the board-specific details dealt with in the drivers
  * and generic interface provided by gpib-common.
  * This really should be in a different header file.
@@ -22,7 +22,6 @@
 #include <linux/timer.h>
 #include <linux/interrupt.h>
 
-typedef struct gpib_interface gpib_interface_t;
 struct gpib_board;
 
 /* config parameters that are only used by driver attach functions */
@@ -212,7 +211,7 @@ static inline void init_gpib_pseudo_irq(struct gpib_pseudo_irq *pseudo_irq)
 /* list so we can make a linked list of drivers */
 struct gpib_interface_list {
 	struct list_head list;
-	gpib_interface_t *interface;
+	struct gpib_interface *interface;
 	struct module *module;
 };
 
@@ -222,7 +221,7 @@ struct gpib_interface_list {
  */
 struct gpib_board {
 	/* functions used by this board */
-	gpib_interface_t *interface;
+	struct gpib_interface *interface;
 	/* Pointer to module whose use count we should increment when
 	 * interface is in use
 	 */
-- 
2.43.0

