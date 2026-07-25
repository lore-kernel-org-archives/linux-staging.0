Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D226B390CB5
	for <linux-staging@lists.linux.dev>; Sat, 25 Jul 2026 09:08:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784970493; cv=none; b=cy2psqe3LjxDUhlmHaMmALVBdrndEXRFDIJYbs+HWPrdy4oVYF/I37h0UAUZdI1BpeKHJ3XjGipreOcq/FI2Z7E0KWoSU98H3gizdKS6MsuqpTWJceDfrxsKW0kl+Azr60fABOmoNEnfsejXbKyyJYHU7RrFf0likHE9AXBVcVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784970493; c=relaxed/simple;
	bh=KxHoVKT+TYBFpNxZl1pnAv0TCcwh76xyAHIqQ9FzO34=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mJc91IfP0/e2O3JGdjiKX6xWms3JwawVZzMMdLXJKO/AMQiUpa5VIck432gnXPGNzVaSwbDUkC5q07ZEm4V/eHsXYJRqwJ7X/mRVuNk3emouOu9AagPwhLBpevTIo4RTx8q85HHv/ebxIflvWG7+2c5+5urHqYacHmKPp85muUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i4H/0HH/; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i4H/0HH/"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-ca97d139d8dso732196a12.2
        for <linux-staging@lists.linux.dev>; Sat, 25 Jul 2026 02:08:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784970491; x=1785575291; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/dhpaHA58wTtBJFoLpIdqnrVEV4rKMcURpQAdaZKTc4=;
        b=i4H/0HH/DKk1oaO9PBdGhAOjjxjFqkBDQ0Znh1UawrlkeisE0KQfVuxFiEyiepm11H
         AXaSAJK0QT9hy4Tk69hGR1ksYMSoR4jm7YY1uW1XEShLLQD9gkRirv+y1/HoFyoYTLO3
         Yr4Ws9Lu0keFYYSjIAcF1HSD+aB9IC+i9QMSA9B2dgMwr5fx0YXFLuWZgLmzDM2jeO/Y
         NuzET9qxYfvG8qVpAovmag6kf7bThSqSUeYzFl768h00jICe+M5W7CWHw9ElBsGF6WhR
         zBRoZCn3NSNI8PNeaNeYJ/Q1vG7qX+pviXV4vBcWG5L8dwJ6qZy3ibvO0dmTvokQ+45C
         fb5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784970491; x=1785575291;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/dhpaHA58wTtBJFoLpIdqnrVEV4rKMcURpQAdaZKTc4=;
        b=ZWtM8ZWoFP21m3GLe7svyqoIYbM25YA3paY+4b/1jRE6r/iuwe24oWttYFR9U9H19M
         V9Q9UtJLiva1mj/iiRLtljF5j5QgsVoqfXMb2BkYDpd4HtoKWmfyEF0SKsDIWYUqbCmd
         t1H/yIyqUkIxCpAZCd6Cwd3LkjJD51KG6aaQi4S8h+avaR9IzpyELNF/Gbv1KTSW0VHi
         bU7xtlsSoGkBwLgbZ9OYI9Kv1PwQogH4O7BhAKbt7wIf77uMmuAssatnu07Ejryzl5CT
         7+KhnEMc+5Flrh2XEXENipuB0GORYGDtp7JeUANo4GNAAcEU2ZE0VzgC7SKrGe6kM5y7
         KSeg==
X-Forwarded-Encrypted: i=1; AHgh+RpoC2aHnXq7b42iYbUn//yaMTkaDs7rI+tmkj3mGRTyhSzbntmxrWPGBVq9lWITpRER+yYFe+1hmOi0mG68@lists.linux.dev
X-Gm-Message-State: AOJu0YxC02sn92F6o/LuzIgKj8f56gNBPW8TwBcY/RbxRuHtHS4IdVSG
	TPgYM287RK2JFp+Dx6cFIcP+oEw4Bw1SiwhBo6gyZPe8HhPLPE9HsvFF
X-Gm-Gg: AR+sD12rdIJDIHGAkuAoi1pDBvlnj5bA6fFu+a4RkxJ4Fo8t+EVK12+GKRiP5FFL4Kj
	ulxvqjQACSbrsYfM7q3HUkvIJKYC4CzlJlKZAPVM/gBoX4W8yFDm99dJb1cS3e56YZPtLiZFWVX
	OSnBpSAALqOMolM0pKcxWt3LFwSH3tZglgTnNiP425kAkifnmfSubXywNOq6UY2JuWakER/IaP6
	KkXaFgmGqe9F6f/QsPBhLv+EzAPkZkRl1bEVMgCBGvNLVXe1gZTmUZ/lFuc6lWoSNfWm1sVBhC3
	Y8xAT2usAWKjBG4DVWiysh159yEKf9TWP8yJQobdKhgtTO8GLUBlDZgs6MPITIPXQB6539snbXq
	G3iyT3x8ODm7XzuU8LHZf9iBncQ4h7jRoWCUY7KOM2AZRKaf13UYJd7CdpepFl59jgLr+oQmMt5
	/TrA==
X-Received: by 2002:a05:6a21:4784:b0:3c3:990b:2292 with SMTP id adf61e73a8af0-3c67dfe6723mr1497205637.57.1784970491169;
        Sat, 25 Jul 2026 02:08:11 -0700 (PDT)
Received: from PC.. ([103.172.209.188])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc447f6bsm9198169eec.12.2026.07.25.02.08.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jul 2026 02:08:10 -0700 (PDT)
From: Mohit Mishra <mishraloopmohit@gmail.com>
To: Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Teddy Wang <teddy.wang@siliconmotion.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Mohit Mishra <mishraloopmohit@gmail.com>
Subject: [PATCH v2 2/2] staging: sm750fb: Remove unused function sm750_enable_dma
Date: Sat, 25 Jul 2026 14:37:49 +0530
Message-ID: <20260725090750.113598-2-mishraloopmohit@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260725090750.113598-1-mishraloopmohit@gmail.com>
References: <20260725090750.113598-1-mishraloopmohit@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The function sm750_enable_dma is defined in ddk750_power.c and declared
in ddk750_power.h, but it is not called anywhere in the driver.

Remove the unused definition and declaration.

This addresses the first task in the drivers/staging/sm750fb/TODO list:
"- refine the code and remove unused code".

Signed-off-by: Mohit Mishra <mishraloopmohit@gmail.com>
---
v2: Remove double blank line flagged by checkpatch -f (Dan Carpenter).

 drivers/staging/sm750fb/ddk750_power.c | 14 --------------
 drivers/staging/sm750fb/ddk750_power.h |  5 -----
 2 files changed, 19 deletions(-)

diff --git a/drivers/staging/sm750fb/ddk750_power.c b/drivers/staging/sm750fb/ddk750_power.c
index 36fde3bcf1b7..59ded1163052 100644
--- a/drivers/staging/sm750fb/ddk750_power.c
+++ b/drivers/staging/sm750fb/ddk750_power.c
@@ -89,20 +89,6 @@ void sm750_enable_2d_engine(unsigned int enable)
 	sm750_set_current_gate(gate);
 }
 
-void sm750_enable_dma(unsigned int enable)
-{
-	u32 gate;
-
-	/* Enable DMA Gate */
-	gate = peek32(CURRENT_GATE);
-	if (enable)
-		gate |= CURRENT_GATE_DMA;
-	else
-		gate &= ~CURRENT_GATE_DMA;
-
-	sm750_set_current_gate(gate);
-}
-
 /*
  * This function enable/disable the GPIO Engine
  */
diff --git a/drivers/staging/sm750fb/ddk750_power.h b/drivers/staging/sm750fb/ddk750_power.h
index 1c4f054d7276..0c4ab2120385 100644
--- a/drivers/staging/sm750fb/ddk750_power.h
+++ b/drivers/staging/sm750fb/ddk750_power.h
@@ -23,11 +23,6 @@ void sm750_set_current_gate(unsigned int gate);
  */
 void sm750_enable_2d_engine(unsigned int enable);
 
-/*
- * This function enable/disable the DMA Engine
- */
-void sm750_enable_dma(unsigned int enable);
-
 /*
  * This function enable/disable the GPIO Engine
  */
-- 
2.43.0

