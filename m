Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8264124A0E
	for <linux-staging@lists.linux.dev>; Mon, 10 Jun 2024 05:49:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717998546; cv=none; b=OFtLOvce2CY3oPzcwXdnSP1Ul6u7sHFi0icXh486kRT10UBHJYX8KAAADXUGPGbX1edH9g8Vd3HB1iQ+gx+FAuKS3riluu3e+ayZkNPNHOvykKN3NikUvrgeNxt9fzXidpD4AJHwEvrbHd5UImCAqDDcRQDsUK4ajZK5DekU47I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717998546; c=relaxed/simple;
	bh=+g1s3fKgiuz8BQyPHgSzUFAdsHTRDc6WhvjqJjVn1mE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=FjA4IaERcbXY8tfhL8mLxMijVwWG7U7XJ8Hs+4A+W3763IdaM5aZIzHFhNQSBg649RhnxxUi6lqOmAjRYY/zS38ZjTdbWuq6zVAVdtm7pb8XB6L4JRRmb65VKXq2ibLeoCK/bZc5v6q4I+Xco0U4NC+kz+Gb2qgK2+HEomtHhXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=gxJLhUZr; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="gxJLhUZr"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-7041f4553ccso1899242b3a.1
        for <linux-staging@lists.linux.dev>; Sun, 09 Jun 2024 22:49:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1717998544; x=1718603344; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sPdygZcOUupzqKLEFg5pCHVy6dyamPHzEutqCiiZtWE=;
        b=gxJLhUZrgBb0owoOkCnoaRwx7Uf6+JpEr/ibVNuI7TqZBOTefs7K2OcsCDYjvvcBVW
         APOEl+zYOLjuB6ZjNlDX+AGsrqXJborw01Tvla6CZa0jJmRpG4rOEdoAV9VTdgwFkn6X
         CNyoMvF/bIopcn0/rqR59HDl97xMB3ejNoMxpSYkcZVfAxqLteji3n6kwsEUuscc/gHx
         wRcfEpSoBq+tImR1SsRC2mgzMnTEtPpBLQzbTH0w6kU2U1XoAK62yVGqefOSc5i4xbKo
         G6jA0hNS7CXlU89D+HQQVqkp6b3bOmTH8sn23LsZdyJ5Us2dMESWlglcBOBFJIrc6e/m
         Z5qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717998544; x=1718603344;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sPdygZcOUupzqKLEFg5pCHVy6dyamPHzEutqCiiZtWE=;
        b=QM3TLuNJgAdzFUCppcq+8dqD1b/BGKiCEI4K6P5iMaS6xjXApmOjVjRktAnrQVJWsE
         wlD1zqKBnZnI/ORGTsRzxRckqBWQdDeECc78Kbm04knMQqtfaat/FpUuiFIeJq3yQ+PJ
         S1Y/9zBDLaawRqxAyxjGS1CEXaUfOVRtr8fUO+E7HM4RApCNeMummN3Uzxzaj+JJ05Vu
         1pa5Tl4nI+O5o3aZ8NuOg0FGhfHo/15NgpA6PSUX1XzjoqLWb0Rjhokyu6suAvtQwalI
         /2PYLY30PBnVIIqU+f8LrKquPp82uH7aVY63GBUnHGmeHiU9LTktQsKmYPOGmwwp+OWo
         qpcg==
X-Gm-Message-State: AOJu0Yw+BwaB0tXu6qtBlsjxNQo8qIaLliPbqxUSV8UnqAz8A0QTcMFf
	KG7HCnJ98Ux7w3JJLbs85BpOZN9uX5NFGUsjLgCKYfkeN19+88Cu2xqJZoLHZOw=
X-Google-Smtp-Source: AGHT+IEhVE7YFbxlaAiOG1M2FQxuEuPvxdtHTifeQB5RuCxEKIryT3twaJ3ZnRA0vWWT8jbaGPesFw==
X-Received: by 2002:a05:6a20:1048:b0:1b2:5baa:7acb with SMTP id adf61e73a8af0-1b2f9699cd9mr8866497637.1.1717998543667;
        Sun, 09 Jun 2024 22:49:03 -0700 (PDT)
Received: from lunchbox.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f6f1aced64sm35653725ad.9.2024.06.09.22.49.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Jun 2024 22:49:03 -0700 (PDT)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 08/24] Staging: rtl8192e: Rename variable bRTSUseShortGI
Date: Sun,  9 Jun 2024 22:44:33 -0700
Message-Id: <20240610054449.71316-9-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240610054449.71316-1-tdavies@darkphysics.net>
References: <20240610054449.71316-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename variable bRTSUseShortGI to rts_use_short_gi
to fix checkpatch warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c | 2 +-
 drivers/staging/rtl8192e/rtllib.h              | 2 +-
 drivers/staging/rtl8192e/rtllib_tx.c           | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
index 4117530f19b1..a52db6b1fdb5 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
@@ -901,7 +901,7 @@ void  rtl92e_fill_tx_desc(struct net_device *dev, struct tx_desc *pdesc,
 	pTxFwInfo->RtsSubcarrier = cb_desc->RTSSC;
 	pTxFwInfo->RtsShort = (pTxFwInfo->RtsHT == 0) ?
 			  (cb_desc->rts_use_short_preamble ? 1 : 0) :
-			  (cb_desc->bRTSUseShortGI ? 1 : 0);
+			  (cb_desc->rts_use_short_gi ? 1 : 0);
 	if (priv->current_chnl_bw == HT_CHANNEL_WIDTH_20_40) {
 		if (cb_desc->bPacketBW) {
 			pTxFwInfo->TxBandwidth = 1;
diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index 2282c709654d..bd18d866ce22 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -122,7 +122,7 @@ struct cb_desc {
 	u8 rts_bw:1;
 	u8 bPacketBW:1;
 	u8 rts_use_short_preamble:1;
-	u8 bRTSUseShortGI:1;
+	u8 rts_use_short_gi:1;
 	u8 multicast:1;
 	u8 bBroadcast:1;
 	u8 drv_agg_enable:1;
diff --git a/drivers/staging/rtl8192e/rtllib_tx.c b/drivers/staging/rtl8192e/rtllib_tx.c
index c0fe00d0df02..d376c35a5ad7 100644
--- a/drivers/staging/rtl8192e/rtllib_tx.c
+++ b/drivers/staging/rtl8192e/rtllib_tx.c
@@ -373,7 +373,7 @@ static void rtllib_query_protectionmode(struct rtllib_device *ieee,
 	struct rt_hi_throughput *ht_info;
 
 	tcb_desc->bRTSSTBC			= false;
-	tcb_desc->bRTSUseShortGI		= false;
+	tcb_desc->rts_use_short_gi		= false;
 	tcb_desc->cts_enable			= false;
 	tcb_desc->RTSSC				= 0;
 	tcb_desc->rts_bw			= false;
-- 
2.30.2

