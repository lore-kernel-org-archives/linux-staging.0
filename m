Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8869C17A586
	for <linux-staging@lists.linux.dev>; Sun,  8 Sep 2024 19:26:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725823609; cv=none; b=X1h3vqY6GOHOrkJEcFlgiJAWW8cY9fvWzbqxxR2ykTSDGSiYYEUMAJhWNklOK6rElr5N6fHdxMCJCHhh5U3lTgHQi5YG++9WSCPKMCJPkBT+xQDEjJ+v5X56dP5vmPbwgCSIJzxXgUTnkoFVQSSO1xjO0t6i+DomLw6W4mwhlVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725823609; c=relaxed/simple;
	bh=JzkYesItRdPywlcTwoNQUMjC7AQGa+S9Iz69eRwz31Q=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=sPU4DIaLkGoI8I2ciqwD8zRtUWRdFEt/z62hHPGHY43LusyS9Ax5qSR1FNsXEovuLaDuT24nrmNe65bSXOrZ+6nb9FD0kX+jkKOM0zeqNKdH+is46B27ef8GC7gROppvZuTpTbe6pCgrc5sbSCHqKk+QY37hFoApIMelkVdY1AE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=iNIyowzJ; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="iNIyowzJ"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2068bee21d8so35573225ad.2
        for <linux-staging@lists.linux.dev>; Sun, 08 Sep 2024 12:26:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1725823607; x=1726428407; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3b2uQ0KLJAAtQJ2wmUi2c9S1xBAjjzTRADBi7POwrfY=;
        b=iNIyowzJ2lGnsanoMbXhoPgAfkYiB4/aszRcHriiSdWk5LDsT/YgykTxEj5yJltI5x
         fOjdKkBWlZpMLzzwIxBAXAS+PznEI5FmPIUQnZ8OB3W9+1+AJ6sBOxEceAGQr1HTeFmc
         jRLEcygPfuz+p0Nzt+Hl4jK1WYakP4E1REnwQIXVsp/i289TTgXCLtMkQlaujZlsRL8q
         PzDIpORXQKsi+jDuET2BIcMP5CSMcFj7TMWVnIuXSTVi4Gogq9QQYn9h+9F+q8TvLWdA
         r75pcYYMXurl++8tMvF2GQFm+smBVD+j8QrlZZreSBBOCQEbFk9REx/wjVvKuCRedsep
         /B/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725823607; x=1726428407;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3b2uQ0KLJAAtQJ2wmUi2c9S1xBAjjzTRADBi7POwrfY=;
        b=Dugf0KAQeVHEEXegSYYfM1nzrsxj+4QzkntZOl8Ck0v76ZGOIqugJT+ZY1WNKdxgcq
         Jf5XETWXWnpngqnNp61Nt9gA3IUEvRShkH7O2+zzj9VMkDgPBrubgwb2XWHW6mHvqZU3
         Qh+WEm04j85+BFlsLJ6t6c/6Majvp3vP+KmR32swydrbwsSSkWCfZu1H1UimYjNkxabl
         lSK5bRcG2DHtL8pVB5w7lOkSL619ptDy7EXQyG5G43OgMYdrp5iLiYOYqUI0LPruJ0kJ
         gNffwILgR5IYlPMRG7TvqaOE7rluOSxi1/Uyva4mK0Ye66W5X/0Bkcjlg/HxXheE4u9J
         6eJg==
X-Gm-Message-State: AOJu0YzrrrCEwKytMmj7CcibpXe2KpDePntPxsGo2TGiIphEUmhxIfU/
	wOLlFyRO2V5JBVxJVZBQrO9ASgkYUoXn8fHKrVeEqOkxWX8oSar0huYztP9ma7Y=
X-Google-Smtp-Source: AGHT+IHDxtbQnGaGi1juqUlvIl0ykr1sv4pKQVI8yozX2KId5ji/h6/YeJ0OSduDeyLYMC7fvWQDkw==
X-Received: by 2002:a17:902:e847:b0:205:755c:dde6 with SMTP id d9443c01a7336-2070c0d83b2mr72644015ad.30.1725823606904;
        Sun, 08 Sep 2024 12:26:46 -0700 (PDT)
Received: from lunchbox.darkphysics (c-73-83-183-190.hsd1.wa.comcast.net. [73.83.183.190])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20710e1b085sm22703305ad.36.2024.09.08.12.26.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Sep 2024 12:26:46 -0700 (PDT)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 13/16] Staging: rtl8192e: Rename variable nStuckCount
Date: Sun,  8 Sep 2024 12:26:30 -0700
Message-Id: <20240908192633.94144-14-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240908192633.94144-1-tdavies@darkphysics.net>
References: <20240908192633.94144-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename variable nStuckCount to stuck_count
to fix checkpatch warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtl8192e/rtl_core.c | 8 ++++----
 drivers/staging/rtl8192e/rtllib.h            | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
index a5980253183e..5a4113c97b1c 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
@@ -860,13 +860,13 @@ static enum reset_type _rtl92e_tx_check_stuck(struct net_device *dev)
 			skb = __skb_peek(&ring->queue);
 			tcb_desc = (struct cb_desc *)(skb->cb +
 				    MAX_DEV_ADDR_SIZE);
-			tcb_desc->nStuckCount++;
+			tcb_desc->stuck_count++;
 			bCheckFwTxCnt = true;
-			if (tcb_desc->nStuckCount > 1)
+			if (tcb_desc->stuck_count > 1)
 				netdev_info(dev,
-					    "%s: QueueID=%d tcb_desc->nStuckCount=%d\n",
+					    "%s: QueueID=%d tcb_desc->stuck_count=%d\n",
 					    __func__, QueueID,
-					    tcb_desc->nStuckCount);
+					    tcb_desc->stuck_count);
 		}
 	}
 	spin_unlock_irqrestore(&priv->irq_th_lock, flags);
diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index 5ff3fab72589..540ab4e34e70 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -107,7 +107,7 @@ struct cb_desc {
 	u8 tx_use_drv_assinged_rate:1;
 	u8 hw_sec:1;
 
-	u8 nStuckCount;
+	u8 stuck_count;
 
 	/* Tx Firmware Related flags (10-11)*/
 	u8 cts_enable:1;
-- 
2.30.2

