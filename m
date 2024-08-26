Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73F45BA3F
	for <linux-staging@lists.linux.dev>; Mon, 26 Aug 2024 00:17:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724631455; cv=none; b=Vfxs5KD8FFDia056CpOkY2tS4IuW2KB2YTEOkm3fzxkddScnE7m5hPHC182yE2pMONiQh3usz06jdMfclA/aj7V7qewvFc83ZPWMPiXIVXSwuhUvGO+wb30qnSlMW/Q2HOIC8tpWD9d6nTN4iAFcbnKI8gIDS0Hr5s5ZLo8plKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724631455; c=relaxed/simple;
	bh=zJE4yeKuaoyoi4Jo6/8iLqyv4Ax/0tmF0Uqz/TM69gM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=K1INtjM/wE/1W88BvkJMLCvP53WyQYsG1DzrgHYpp4Q7m0rF82xP63npMhpRVfs88UZVC6DF9bWmcMVnGPzumolFVC4UlfRu9ClIJKTq98xYobPddUs6gz8CJ08SJUcxRO4ytEMRlx0hTuuDLGz0Fwtt0Fttv6nXEUIvvtg32rQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=G9bVzqFp; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="G9bVzqFp"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-202508cb8ebso24309705ad.3
        for <linux-staging@lists.linux.dev>; Sun, 25 Aug 2024 17:17:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1724631454; x=1725236254; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/3FbEnIMuszk6cKLXUnn3+Uk+c/zxQQ0xu6nNjwDcyE=;
        b=G9bVzqFpQgKuhCdAGD1fyd/lkCdViOG8ulbVoxcTsASAvYlA1uujjETmZbk30KpaKG
         ZPe8iidLFsnO6QumWJ3TmURkiD9vnsdCyaK3eEuKtPUuaiV+bUl9J75YgIKzMvTosoPz
         atbuZWfFRuo+DnX2sVMNtmyX5PB6Xx+fH0Hph/1ogNiykQ5lCIslB5pTlfEwvf33DycY
         zZ4ZRfUf82IA2IrFEbMDHp7ewnNoJOvhrn161JnKkfpEmKred2KHv1SqaPOZ8FuaRz4S
         UlK1n4E6DyhNYHy85OIyAV8rn80PqrDsWEdSTBtdszZu7tPcst+IdxeYPcJHYlMoQxte
         1EKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724631454; x=1725236254;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/3FbEnIMuszk6cKLXUnn3+Uk+c/zxQQ0xu6nNjwDcyE=;
        b=tXPmY5KKaK8Q9SNjb+iaGhvVSLTMMjQi4IPGNtK4nx4PC3gEDfClBycXDZBzeS6e5i
         13ry6RTRMbkB0uMGDr04Esy0Q0gmbdS//Kj41U2rwLljVQxBRWDXryMAo/O78qtLgy1c
         1gzYqdDuQlWLNxnEEt3p5zff1XrYiMotpRzuu8xIqKsVDY30/zRfBC05UNtByEve1HwZ
         jn8Cmp+NRr/PMtIC7pzkRo6zhKvNY/gqi+cOZPyYTt2XgBnCpDd6S30gGwdenbrYAN9J
         U+kQTfvfq8C4HLg6AIBG25upc6RVWOuMd//0uhYITBxb4pvWsEDZb0lU7Ac8vidqdRna
         YYlQ==
X-Gm-Message-State: AOJu0YwgMs/7KiWa1pJ5k2wmZBJRPhxFZV9jLknIx77qV7/3aY4dfj6B
	BWD4m3CB3QSGKGmty+764FFijmyuBPdbJGR6r783cKXgZWBnuMyq3vADbxAaimY=
X-Google-Smtp-Source: AGHT+IHL3L4ZGJVusWxEPBeZu31/2LgHsqi7FJ0ncEGe0ckHnLnw6vIqzeJHzf9nPzT3JlmOTopyaw==
X-Received: by 2002:a17:902:f115:b0:202:4a00:444c with SMTP id d9443c01a7336-2039e6691c2mr58140155ad.55.1724631453648;
        Sun, 25 Aug 2024 17:17:33 -0700 (PDT)
Received: from lunchbox.darkphysics (c-73-83-183-190.hsd1.wa.comcast.net. [73.83.183.190])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-203857051b9sm58695955ad.234.2024.08.25.17.17.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Aug 2024 17:17:33 -0700 (PDT)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 5/6] Staging: rtl8192e: Rename variable msDelay
Date: Sun, 25 Aug 2024 17:17:23 -0700
Message-Id: <20240826001724.274811-6-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240826001724.274811-1-tdavies@darkphysics.net>
References: <20240826001724.274811-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename variable msDelay to ms_delay
to fix checkpatch warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c | 6 +++---
 drivers/staging/rtl8192e/rtllib.h              | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c b/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
index 939f0a7c3a90..059b1f478a6c 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
@@ -510,7 +510,7 @@ static u8 _rtl92e_phy_set_sw_chnl_cmd_array(struct net_device *dev,
 					    struct sw_chnl_cmd *CmdTable,
 					    u32 CmdTableIdx, u32 CmdTableSz,
 					    enum sw_chnl_cmd_id cmd_id,
-					    u32 Para1, u32 Para2, u32 msDelay)
+					    u32 Para1, u32 Para2, u32 ms_delay)
 {
 	struct sw_chnl_cmd *pCmd;
 
@@ -527,7 +527,7 @@ static u8 _rtl92e_phy_set_sw_chnl_cmd_array(struct net_device *dev,
 	pCmd->cmd_id = cmd_id;
 	pCmd->Para1 = Para1;
 	pCmd->Para2 = Para2;
-	pCmd->msDelay = msDelay;
+	pCmd->ms_delay = ms_delay;
 
 	return true;
 }
@@ -645,7 +645,7 @@ static u8 _rtl92e_phy_switch_channel_step(struct net_device *dev, u8 channel,
 		} while (true);
 	} /*for (Number of RF paths)*/
 
-	(*delay) = CurrentCmd->msDelay;
+	(*delay) = CurrentCmd->ms_delay;
 	(*step)++;
 	return false;
 }
diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index 41ae98e01a30..a5ce3d2b8600 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -166,7 +166,7 @@ struct sw_chnl_cmd {
 	enum sw_chnl_cmd_id cmd_id;
 	u32			Para1;
 	u32			Para2;
-	u32			msDelay;
+	u32			ms_delay;
 };
 
 /*--------------------------Define -------------------------------------------*/
-- 
2.30.2

