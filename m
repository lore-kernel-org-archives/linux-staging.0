Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA7E76FB1
	for <linux-staging@lists.linux.dev>; Wed, 25 Jan 2023 20:09:23 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id bg13-20020a05600c3c8d00b003d9712b29d2so2025612wmb.2
        for <linux-staging@lists.linux.dev>; Wed, 25 Jan 2023 12:09:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gMf09+fC4QI99DmXPRyQuRL+tFfoSe44zXEcxxr3d1Q=;
        b=pfhjKcsDMG0B6iYPy1uEpIfPgWWhr2EgYByXnBIKOjyeXxqKfvfk/XevDGkyN8CCTG
         16TteLtHyrNqg3yu6p5xze1CVd3TY/TGKo4DSghVvYHCArXdJMQuu9mWRoiXXtqsDrn6
         ohxv+G5zIn7LY0YrnCnNfKC83qiVIMcpYA6uuxogHZ/jcOlBJFYmV7lCe+sNR1dyCxfM
         D1VC9PZQ9SjwFKdS3uakSJVG3z4+sSJretwpGLGSJzmaQjK4ngH+YDsZUQpH3KWFAuH4
         ksYOHcqbqcEA/Bg8bBp6uAhwRgOG9y04bn4AnlgUOx/1UzZnErubqvtmvy0ZD/6R0hPr
         pSYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gMf09+fC4QI99DmXPRyQuRL+tFfoSe44zXEcxxr3d1Q=;
        b=Q8Kqdqdz7ZrxEOetYQUlnsEgO3AsufmygytgkXS3tQYLaEFyPfKVEtE/Z87OD8Cnsj
         EYy4SaRvJMHawa+7PDnmTz8QUebWLuQ8yPoDraRs242og1tAVEFHXr6laXqFdAzQhSvF
         w8rs4d1e//Io3hX0MvO00XPSkaw0fw7GPC4y+2QvPg89FVDkWc1w1PnG9OqLj8isSmLH
         QfrSU1NKHGp3iekUoJl6O0EKQbN6JG9TGBCu49jLk/lmskOzqOgswx2pxBJN5L71rMek
         bGDRCYPOOQdIFiDURAOXrxtYgJoTV9G9UPbM7k2ZoK2KF6QmShkhnBkWdtRLkr/G9RmL
         4PYg==
X-Gm-Message-State: AFqh2kpNBMmX+4DuEIEaijiPWm3enoX4n4dWCA7ZoJjXvU4cQ5YgJYJt
	G+43OAQ1SrFVCkswn2mS2RI=
X-Google-Smtp-Source: AMrXdXuRK3unvrxzTT2n3UwgPxByGkxRMh16tfnSW1GPMorniKmgRgivipCX6eq2+CH7VhJg8DoW2Q==
X-Received: by 2002:a05:600c:3ba8:b0:3d9:8635:a901 with SMTP id n40-20020a05600c3ba800b003d98635a901mr8574306wms.3.1674677362197;
        Wed, 25 Jan 2023 12:09:22 -0800 (PST)
Received: from matrix-ESPRIMO-P710 (p57935ca5.dip0.t-ipconnect.de. [87.147.92.165])
        by smtp.gmail.com with ESMTPSA id t16-20020a05600c329000b003d35acb0fd7sm2685430wmp.34.2023.01.25.12.09.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jan 2023 12:09:21 -0800 (PST)
Date: Wed, 25 Jan 2023 21:09:20 +0100
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v2 09/11] staging: rtl8192e: Remove unused variables
 txviok.., txvook.. and txbea..
Message-ID: <c45501eee5fbf2cc3e5ad999bbbe8e071e341a2c.1674675808.git.philipp.g.hortmann@gmail.com>
References: <cover.1674675808.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1674675808.git.philipp.g.hortmann@gmail.com>

txviokint, txvookint and txbeaconokint are initialized and increased but
never read. Remove dead code.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/rtl_core.c | 5 -----
 drivers/staging/rtl8192e/rtl8192e/rtl_core.h | 3 ---
 2 files changed, 8 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
index 768324cbe253..4cc90425fa4c 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
@@ -2139,9 +2139,6 @@ static irqreturn_t _rtl92e_irq(int irq, void *netdev)
 		goto done;
 	}
 
-	if (inta & IMR_TBDOK)
-		priv->stats.txbeaconokint++;
-
 	if (inta & IMR_TBDER)
 		priv->stats.txbeaconerr++;
 
@@ -2192,13 +2189,11 @@ static irqreturn_t _rtl92e_irq(int irq, void *netdev)
 	}
 
 	if (inta & IMR_VIDOK) {
-		priv->stats.txviokint++;
 		priv->rtllib->link_detect_info.NumTxOkInPeriod++;
 		_rtl92e_tx_isr(dev, VI_QUEUE);
 	}
 
 	if (inta & IMR_VODOK) {
-		priv->stats.txvookint++;
 		priv->rtllib->link_detect_info.NumTxOkInPeriod++;
 		_rtl92e_tx_isr(dev, VO_QUEUE);
 	}
diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.h b/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
index 96d340f686e9..f8b2201ea288 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
@@ -184,9 +184,6 @@ enum reset_type {
 
 struct rt_stats {
 	unsigned long received_rate_histogram[4][32];
-	unsigned long txviokint;
-	unsigned long txvookint;
-	unsigned long txbeaconokint;
 	unsigned long txbeaconerr;
 	unsigned long txmanageokint;
 	unsigned long txcmdpktokint;
-- 
2.39.1

