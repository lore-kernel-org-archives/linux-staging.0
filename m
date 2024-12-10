Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E37E423237B
	for <linux-staging@lists.linux.dev>; Tue, 10 Dec 2024 21:08:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733864909; cv=none; b=uVFhFjlSd5PnywW8VOjbNU0oQnj4VMR/sT4MBaS8MYWMpZD1UDvwUBESmTtt4MGdd2wgakkmrmrl3as7/W5hI5vZe879me+r+3MBQrNY4X1TXIhEzUA6ycochjiSv2gcFEVWETDzB7FrO3TQ7ZVEhkpHpl3MkL5Zzgp3OeKn53U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733864909; c=relaxed/simple;
	bh=qZGtZZutbMvlH+uph3zH7rgccrqwRhz3wHSsLjRGNeA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Hdb3lv2xWdtnwUhSvWtIVWaTQhx8NwOzeew/7s/7w3/0VzKGJwZHFXnOJL/2kKUsgG26guaGrOKLVhrI7PruKTaFQf0JrYCMcA9Vr4hVQ+BuoiLAvKVmakOeBTjULLWFvclRb/+W87YUb1/VkjLErsejRhYvr1ymtXgj92UOXQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ndKsn78B; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ndKsn78B"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2156e078563so45611355ad.2
        for <linux-staging@lists.linux.dev>; Tue, 10 Dec 2024 13:08:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733864905; x=1734469705; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q03WUTFmev9HP2RHXk39Wz7Ep62vHEDdq6OmuvP2N0I=;
        b=ndKsn78BKgQZ1CDVEHaw8ksnNsUttHojydKES35mpPf7I26VpzmtqQprsrtD2uv8xE
         wSAfrnNFg8ggUJ1x5xrtC70Mdk67Gs+Crzbr5jKyP9bN57sBDY/mABT8+YgE//noLG/w
         RR/pAdgw/dNTZ9sehTzmSpps8Wq0I/y5JUDC32NlESNvNdYxZUyz9yWZKs6RC65TD9eW
         tZw0nbayBjpsDIN6bfo9cUnrh6f8Mv+nT618k7lGNa2sM2NliQWezzjNN+AgYJ0Xn3uT
         CNfB5G0MbUplyyqQlZxKmHIpg5YL+TUHsvJku5heqhTP8HLRPHDJ0YXZToJlNLSzwMsl
         3e2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733864905; x=1734469705;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q03WUTFmev9HP2RHXk39Wz7Ep62vHEDdq6OmuvP2N0I=;
        b=CssjdHK5dgKd6OBmvhunybuTakZGMVyJM/5I1NJ68i56DU1BwLnC6hrhvbfA30eSe9
         9IGl41ezoOEa97tHg8UH0vDXUpMXy6EejZWCrzNVHa2NaiYTkDCbFinpSwGFs4DAqUuh
         vNy43I3GRxQ33nxewgWT/OlKD48oOi3i0aSgFy9Y7YG4xFvVQ/R21aC1dDPWCdQv58e0
         Wp7BkYSd59gItWQwYvP0paLFkH5RvlGfrZJ7qm0wHcMrkCBEd13JLtXuuYCnUPvoR6Zs
         5Bj64bW6mW8L6GmSQOFTLRIrgMARS7rsqUHqpRL4JKtyVZlysNbm80M3pEIvOG4hL/yI
         y6sg==
X-Forwarded-Encrypted: i=1; AJvYcCU+CwtL/bRk4SAK12YyCRGliFaLVQFhhdd6ISDVIfbExrhTkkg6yXcyAZ5KGHJFUCQHpK1uRP/SW06G1QUx@lists.linux.dev
X-Gm-Message-State: AOJu0YzJk7GRBrbB4YaCfPQm/dt1XNxDTBW+C3oukgBmssmVqZnGUovx
	zVyd6j6tn1qKdVz35ThytG0Jeu9oGi2aGbfl3c5Kau4BY5gGJQ4A
X-Gm-Gg: ASbGncs1urRRpEuD3opEHpBOYibwYKbVd3Iuw7FoCaS9g29CbvI3NBqA4svzDq41MLw
	ZkfbDMCt7pxqSENGxEJzs0xEd08S9Xh2yzzdtNf9KqUnkDLEY4ZVxNdBjOZfhJbwiylVGe9gzqC
	xFQVyRkmDTDA+4wWRISkPcPHj74HhnZts2YFVx46aZofP/c3WJGKu9IujTqxzfYDsZrDq/iFxuB
	3/YPqrmQmbp7UZHKK2S/sXz/eqp1hZigyRxXN2Lw6/uvBb4bmPAuk/fl9bXTtydJfC1VTiHAsUC
	ag==
X-Google-Smtp-Source: AGHT+IFXVjibjgKMMpneV2PFzLE+OdzrN5Y+d44zUeacgNzcWzOI8KwbWibXSxqnsYpNt692JVJh9Q==
X-Received: by 2002:a17:90b:4ace:b0:2ee:c2b5:97a0 with SMTP id 98e67ed59e1d1-2f128032302mr621367a91.25.1733864905089;
        Tue, 10 Dec 2024 13:08:25 -0800 (PST)
Received: from localhost.localdomain ([2804:14d:4c64:81ec:7409:107a:a63b:a3da])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ef2700979fsm13385731a91.18.2024.12.10.13.08.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 13:08:24 -0800 (PST)
From: Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com
Cc: ~lkcamp/patches@lists.sr.ht,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 2/3] staging: rtl8723bs: delete HAL_DEF_DBG_RX_INFO_DUMP enum
Date: Tue, 10 Dec 2024 17:48:19 -0300
Message-ID: <20241210210741.17101-3-rodrigo.gobbi.7@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241210210741.17101-1-rodrigo.gobbi.7@gmail.com>
References: <20241210210741.17101-1-rodrigo.gobbi.7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

After removing code isolated by DBG_RX_SIGNAL_DISPLAY_RAW_DATA cflag,
HAL_DEF_DBG_RX_INFO_DUMP enum lost it's use.

Signed-off-by: Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>
---
 drivers/staging/rtl8723bs/hal/hal_com.c      | 2 --
 drivers/staging/rtl8723bs/include/hal_intf.h | 1 -
 2 files changed, 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/hal_com.c b/drivers/staging/rtl8723bs/hal/hal_com.c
index 1803c0cd3a7e..b41ec89932af 100644
--- a/drivers/staging/rtl8723bs/hal/hal_com.c
+++ b/drivers/staging/rtl8723bs/hal/hal_com.c
@@ -682,8 +682,6 @@ u8 SetHalDefVar(
 	u8 bResult = _SUCCESS;
 
 	switch (variable) {
-	case HAL_DEF_DBG_RX_INFO_DUMP:
-		break;
 	case HW_DEF_ODM_DBG_FLAG:
 		ODM_CmnInfoUpdate(odm, ODM_CMNINFO_DBG_COMP, *((u64 *)value));
 		break;
diff --git a/drivers/staging/rtl8723bs/include/hal_intf.h b/drivers/staging/rtl8723bs/include/hal_intf.h
index 282e141616b0..85de862823c2 100644
--- a/drivers/staging/rtl8723bs/include/hal_intf.h
+++ b/drivers/staging/rtl8723bs/include/hal_intf.h
@@ -144,7 +144,6 @@ enum hal_def_variable {
 	HAL_DEF_PCI_AMD_L1_SUPPORT,
 	HAL_DEF_PCI_ASPM_OSC, /*  Support for ASPM OSC, added by Roger, 2013.03.27. */
 	HAL_DEF_MACID_SLEEP, /*  Support for MACID sleep */
-	HAL_DEF_DBG_RX_INFO_DUMP,
 };
 
 enum hal_odm_variable {
-- 
2.47.0

