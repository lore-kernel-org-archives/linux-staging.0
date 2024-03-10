Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B70B73F8DA
	for <linux-staging@lists.linux.dev>; Sun, 10 Mar 2024 23:56:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710114964; cv=none; b=tPiXbBtDwp6yTVRy1ulbapf4dlF3Beto/nJ5FQZw2Dily9xP4L4dyBZESmEyhFNFSgivboVCC6jL7/ea0U6SDThn6hQTLbWD6GjvHEfpOiZc5PPr5o6ck743KZPAp+cm6D27t/3HpSy7J4Cn3CLfbSOSzqUwtL3vhYTLI2g3AI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710114964; c=relaxed/simple;
	bh=vt2AS0MY2T5K9VNmNLC6qpITMvYnpGjqYDDGu9p7wvM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=o/kjKSLec0ohV4amyMktvGTElHTACBFbkk61Bx3bc9iLtbZOlVpKyNOQdorF/r9BCgz46mtGhtqjS8AXV/wqimunl2D+4U8yE8IrRkrM9wUJ+maKRxe4LPO4StvAkzRUtn564AbSkhzsaw1QadRYsYVnuqNdUcCFj+zVkDSkmQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=S5OJVjSd; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="S5OJVjSd"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-29bfc3ca816so232760a91.0
        for <linux-staging@lists.linux.dev>; Sun, 10 Mar 2024 16:56:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1710114962; x=1710719762; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2jkuqB7qYV1V/hZ7KuA1uZbe/cubaPjlVg/I55Vf+yE=;
        b=S5OJVjSd1n4kiDj17qniYe7U532bfRyqUd7TI8bhW5C/kYcOkQWd0Ns8Bwd4yySbxY
         kiHiHzB+QFEx3msndgADOfd0zRC0ULRj6AvliOQSNd2aqvns5moosa8Zan7VxveksMTU
         Pko+AVADpT9dFdat/xj1cizVdQSBqY5g6b+KZlP4vo/knLusD42U7ph5t7S0KUmVst0y
         9MgLbvG7glkJgRHempxVMvfFUQv8Jse73FvM+gQylVWwzjHT4A5Qi3ei7+jZf+Iqnj0w
         cgGIvILaRjocaWutLc8C5inDmAP8U3gOP8Cx3dXPva5r3QIk8JiP1UaiLU9y/RsaRqsp
         glEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710114962; x=1710719762;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2jkuqB7qYV1V/hZ7KuA1uZbe/cubaPjlVg/I55Vf+yE=;
        b=RB3jAMGgnSMRRhIP9DmsCrr2hE0h8i1nL869LD8Euo3/PXKD+7MOd2SRjo0d3pnwYf
         YE0QBhjkKHB7+XQSU0YQsexodJJXml8imkM4WtogjQMJy0iF54sZYdA3SO3BqN9ia5Zu
         emHQ7nigEt3aH0rCYwmullwFIgUd6lgViiIM4CVVZmdxSw+epK+dKWM10ARFjdsep6v+
         ej78qSw6NHqYKpfXo0GsqspxavR9+Jv9Ak1+MzFY2v2cvttRoxuSWMbYRpmyylDV6wU0
         WhxOIe/qAcw0OC/WtmjZUeilDaC0gZkS+dWuILpLm+XppHUsberO+OcgEfLuVor2O7Uq
         95bQ==
X-Gm-Message-State: AOJu0Yx1UQcaZ2baJGbhBvqAuehImqqSZ/H3WAgTIiVByrGUZFql7Gyl
	gCwSz5+S3iOibepvqEpKMDpKmQA7NM/7AGusstw3sqtDnwBHM7kxL4kreXKczZg=
X-Google-Smtp-Source: AGHT+IErnq8bbjzofXvfZsXHjRCyuNv83rcb1XF4zm4IiAjFp2CfdNYJUbASppyyMagZYgs85rgH1g==
X-Received: by 2002:a17:90b:a18:b0:29b:badf:cc1d with SMTP id gg24-20020a17090b0a1800b0029bbadfcc1dmr3893667pjb.29.1710114962133;
        Sun, 10 Mar 2024 16:56:02 -0700 (PDT)
Received: from lunchbox.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id o7-20020a17090ac08700b0029bb29ef41bsm2903439pjs.50.2024.03.10.16.56.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Mar 2024 16:56:01 -0700 (PDT)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 08/11] Staging: rtl8192e: Rename variable pBssHT
Date: Sun, 10 Mar 2024 16:55:49 -0700
Message-Id: <20240310235552.4217-9-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240310235552.4217-1-tdavies@darkphysics.net>
References: <20240310235552.4217-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename variable pBssHT to bss_ht
to fix checkpatch warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtl819x_HTProc.c | 20 ++++++++++----------
 drivers/staging/rtl8192e/rtllib.h         |  2 +-
 2 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl819x_HTProc.c b/drivers/staging/rtl8192e/rtl819x_HTProc.c
index 1c3ef1b7ebd8..618523bacc8e 100644
--- a/drivers/staging/rtl8192e/rtl819x_HTProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_HTProc.c
@@ -543,19 +543,19 @@ void ht_initialize_ht_info(struct rtllib_device *ieee)
 	}
 }
 
-void ht_initialize_bss_desc(struct bss_ht *pBssHT)
+void ht_initialize_bss_desc(struct bss_ht *bss_ht)
 {
-	pBssHT->bd_support_ht = false;
-	memset(pBssHT->bd_ht_cap_buf, 0, sizeof(pBssHT->bd_ht_cap_buf));
-	pBssHT->bd_ht_cap_len = 0;
-	memset(pBssHT->bd_ht_info_buf, 0, sizeof(pBssHT->bd_ht_info_buf));
-	pBssHT->bd_ht_info_len = 0;
+	bss_ht->bd_support_ht = false;
+	memset(bss_ht->bd_ht_cap_buf, 0, sizeof(bss_ht->bd_ht_cap_buf));
+	bss_ht->bd_ht_cap_len = 0;
+	memset(bss_ht->bd_ht_info_buf, 0, sizeof(bss_ht->bd_ht_info_buf));
+	bss_ht->bd_ht_info_len = 0;
 
-	pBssHT->bd_ht_spec_ver = HT_SPEC_VER_IEEE;
+	bss_ht->bd_ht_spec_ver = HT_SPEC_VER_IEEE;
 
-	pBssHT->bd_rt2rt_aggregation = false;
-	pBssHT->bd_rt2rt_long_slot_time = false;
-	pBssHT->rt2rt_ht_mode = (enum rt_ht_capability)0;
+	bss_ht->bd_rt2rt_aggregation = false;
+	bss_ht->bd_rt2rt_long_slot_time = false;
+	bss_ht->rt2rt_ht_mode = (enum rt_ht_capability)0;
 }
 
 void ht_reset_self_and_save_peer_setting(struct rtllib_device *ieee,
diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index cf75d1225501..3819a859710d 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -1742,7 +1742,7 @@ void ht_construct_rt2rt_agg_element(struct rtllib_device *ieee,
 				u8 *posRT2RTAgg, u8 *len);
 void ht_on_assoc_rsp(struct rtllib_device *ieee);
 void ht_initialize_ht_info(struct rtllib_device *ieee);
-void ht_initialize_bss_desc(struct bss_ht *pBssHT);
+void ht_initialize_bss_desc(struct bss_ht *bss_ht);
 void ht_reset_self_and_save_peer_setting(struct rtllib_device *ieee,
 				   struct rtllib_network *pNetwork);
 void HT_update_self_and_peer_setting(struct rtllib_device *ieee,
-- 
2.30.2

