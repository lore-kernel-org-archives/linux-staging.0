Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75B25D511
	for <linux-staging@lists.linux.dev>; Tue, 31 Oct 2023 05:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KLr92lPa"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1cc316ccc38so16424635ad.1
        for <linux-staging@lists.linux.dev>; Mon, 30 Oct 2023 22:35:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698730503; x=1699335303; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4I92nHjRtfgt/kVv9q05XvKDSG1e3bVqP1qntsFLqJw=;
        b=KLr92lPasD8CHZ8gYQT1YWX0u3EvBJm55i+ebHy5NZdvmjRWFfIi6WBTKmzAEhxnqZ
         W+UNp3kdh8EdR5zuYRsyKyOFqjz/k0smJHBSVU/xgMg6Ug4Z0pgsxXsZuct3hvpeI3kd
         RRoXTZx3P/o4LJu/466y9mMgfk99ge2z16mq6AAyc+8gFWi/nGDQkgQ/37lGrWAuFGFF
         jbjrg4ZMC1l3vW6lRB5SoKEKRBLb/y/ywKHkgXmkS/dp0zZ9t86EUnFrJBlncTD42cyE
         f9SaUVCNyQvoQ3okInnKgXwY+TvUqOMLs/G8sfZgtJrP6k8nZcJh/9aN7UrTr5RCmIkM
         8cFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698730503; x=1699335303;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4I92nHjRtfgt/kVv9q05XvKDSG1e3bVqP1qntsFLqJw=;
        b=DU4K/ljPFYRZbxSAAH+DKRuWM3pMb35l+cKZTkkj7NE87D1ReuphzsfxQcyAEJdR6U
         ep6e1zB1dnuyoHpvVSRvpuNzUrb1gMAbGtWADS7Cbh9VHYRHTm2R14n0h5472yZhEVvi
         rNZQmI7NYWDqIFzalF7cmR2A3xZFA6Kjwv8OgoIV9p3kHEenFqD3JlUaB6hY8NusxXQW
         Y+3ym3+rHqapoC3zjL0lw8ftHvQhCP9SbJKuPNwCU4zxAJgP6lWQOG/nfe+zScomrnLk
         SKVRXyoNz5jQ/I6M2ImT0xRW8dnYX3WK5wY9deumARtMe98DsaeqRwPefXDf3O4OIP9T
         F5fg==
X-Gm-Message-State: AOJu0YxOsM1ocnscvWzFVq9N7OT8ZLirWAS1mwqYVt3TBbr5nbArVLii
	9Y+o8x0R2f2VjbO/CB4I8bc=
X-Google-Smtp-Source: AGHT+IE0uMuwUFUKjYPaamC4PZGj44kXcL3wPEzEgIUwEptd/c5m5AV5W5Ave3zevUcZK6yjdvNJDw==
X-Received: by 2002:a17:903:442:b0:1ca:8541:e1fe with SMTP id iw2-20020a170903044200b001ca8541e1femr9221519plb.62.1698730502840;
        Mon, 30 Oct 2023 22:35:02 -0700 (PDT)
Received: from ubuntu.. ([122.182.231.82])
        by smtp.gmail.com with ESMTPSA id b17-20020a170902ed1100b001c0a414695bsm422211pld.43.2023.10.30.22.35.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Oct 2023 22:35:02 -0700 (PDT)
From: Pavan Bobba <opensource206@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Pavan Bobba <opensource206@gmail.com>
Subject: [PATCH 11/11] staging: vt6655: Type encoding info dropped from variable name "apTailTD"
Date: Tue, 31 Oct 2023 11:04:34 +0530
Message-Id: <482553f089fe86dc7ebecd96c9397cfaa9c7bdf9.1698730318.git.opensource206@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1698730318.git.opensource206@gmail.com>
References: <cover.1698730318.git.opensource206@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

variable name "apTailTD" updated like below:

a.type encoding info dropped from name
b.camelcase name replaced by snakecase

Issue found by checkpatch

Signed-off-by: Pavan Bobba <opensource206@gmail.com>
---
 drivers/staging/vt6655/card.c        | 4 ++--
 drivers/staging/vt6655/device.h      | 2 +-
 drivers/staging/vt6655/device_main.c | 8 ++++----
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/vt6655/card.c b/drivers/staging/vt6655/card.c
index d20afbc1072f..36183f2a64c1 100644
--- a/drivers/staging/vt6655/card.c
+++ b/drivers/staging/vt6655/card.c
@@ -388,10 +388,10 @@ void card_safe_reset_tx(struct vnt_private *priv)
 	struct vnt_tx_desc *curr_td;
 
 	/* initialize TD index */
-	priv->apTailTD[0] = &priv->apTD0Rings[0];
+	priv->tail_td[0] = &priv->apTD0Rings[0];
 	priv->apCurrTD[0] = &priv->apTD0Rings[0];
 
-	priv->apTailTD[1] = &priv->apTD1Rings[0];
+	priv->tail_td[1] = &priv->apTD1Rings[0];
 	priv->apCurrTD[1] = &priv->apTD1Rings[0];
 
 	for (uu = 0; uu < TYPE_MAXTD; uu++)
diff --git a/drivers/staging/vt6655/device.h b/drivers/staging/vt6655/device.h
index fadbfccf42de..0212240ba23f 100644
--- a/drivers/staging/vt6655/device.h
+++ b/drivers/staging/vt6655/device.h
@@ -133,7 +133,7 @@ struct vnt_private {
 	volatile int                iTDUsed[TYPE_MAXTD];
 
 	struct vnt_tx_desc *apCurrTD[TYPE_MAXTD];
-	struct vnt_tx_desc *apTailTD[TYPE_MAXTD];
+	struct vnt_tx_desc *tail_td[TYPE_MAXTD];
 
 	struct vnt_tx_desc *apTD0Rings;
 	struct vnt_tx_desc *apTD1Rings;
diff --git a/drivers/staging/vt6655/device_main.c b/drivers/staging/vt6655/device_main.c
index a1f3dc25ad0e..b0b262de6480 100644
--- a/drivers/staging/vt6655/device_main.c
+++ b/drivers/staging/vt6655/device_main.c
@@ -737,7 +737,7 @@ static int device_init_td0_ring(struct vnt_private *priv)
 
 	if (i > 0)
 		priv->apTD0Rings[i - 1].next_desc = cpu_to_le32(priv->td0_pool_dma);
-	priv->apTailTD[0] = priv->apCurrTD[0] = &priv->apTD0Rings[0];
+	priv->tail_td[0] = priv->apCurrTD[0] = &priv->apTD0Rings[0];
 
 	return 0;
 
@@ -777,7 +777,7 @@ static int device_init_td1_ring(struct vnt_private *priv)
 
 	if (i > 0)
 		priv->apTD1Rings[i - 1].next_desc = cpu_to_le32(priv->td1_pool_dma);
-	priv->apTailTD[1] = priv->apCurrTD[1] = &priv->apTD1Rings[0];
+	priv->tail_td[1] = priv->apCurrTD[1] = &priv->apTD1Rings[0];
 
 	return 0;
 
@@ -969,7 +969,7 @@ static int device_tx_srv(struct vnt_private *priv, unsigned int idx)
 	unsigned char byTsr0;
 	unsigned char byTsr1;
 
-	for (desc = priv->apTailTD[idx]; priv->iTDUsed[idx] > 0; desc = desc->next) {
+	for (desc = priv->tail_td[idx]; priv->iTDUsed[idx] > 0; desc = desc->next) {
 		if (desc->td0.owner == OWNED_BY_NIC)
 			break;
 		if (works++ > 15)
@@ -1007,7 +1007,7 @@ static int device_tx_srv(struct vnt_private *priv, unsigned int idx)
 		}
 	}
 
-	priv->apTailTD[idx] = desc;
+	priv->tail_td[idx] = desc;
 
 	return works;
 }
-- 
2.34.1

