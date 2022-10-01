Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF4F923D1
	for <linux-staging@lists.linux.dev>; Sat,  1 Oct 2022 09:41:35 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id rk17so13511228ejb.1
        for <linux-staging@lists.linux.dev>; Sat, 01 Oct 2022 02:41:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date;
        bh=QebgOJCMMd7aL0SENMI3D3xLF5otmlOv1Qyo2XKNJuc=;
        b=EfNGeGd1tInuCofbuCama1/NKS6boZJHSdKp0qCIKseKBhXD+6AUG8tFcyzm1eR/zg
         GC0ET1ZtDwCw2fCI5hQfw49fOHxf48OD27hH9tVaviPntpT++viHX5+Hri13IlROwNS9
         YNhyzMZNt1Hs+1tgnSsytE1FeVweIYq0UAp4fg0unOdn9/aZO+swKuKmDWhA08WAG0j1
         pefswubvqxvQ/wzzsO6RAKspURqe8ISRnB51NOy83cW01vgpgm4cxzO0OS0ea58eD+Jd
         ig64wlO6z6ErH6vWekUNem849NKX2FN4BtPGAupis0NC9I2Wq/fqgJ0qoOW5q7iZrJ3m
         5GYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=QebgOJCMMd7aL0SENMI3D3xLF5otmlOv1Qyo2XKNJuc=;
        b=GtpIJex4R/Ql5RgAgaOQm4TENVCJ20c/lijSUD3whRDZX0kjVce0YxN9wtlbZgaYJp
         OwVW4S1PTeh30/D49GE0MUlu/XE2OMygi0vmhMnvlIXiE2ksiz7snu6T+6gmN9ifUjjv
         0kIKDXuCgV+06oZQ0Npm59JeHZJ9jEOYkc8pySABQR31/pwk8pDxzMn3HW3V0pEfrBi7
         weQW0G7UOcr40HEe4PwQ9NDnGKdZfmQ8BK08vRi6IzT7h6LVDWVxPUZ/tf8g2DIKels7
         4+H+QATX4RXvnLKpGBRsXv9LcKQvgdVqrpIePGQfct6MADCvCpREduqXYqd/XtWnewkO
         hAZA==
X-Gm-Message-State: ACrzQf3j8f/KGd3fxWw61f89kxyxWfftNvGlVa36RQbPaanXNNDo5V5K
	14HD/QMvVc8UeJPtZ9mO46E=
X-Google-Smtp-Source: AMsMyM4E0nxncAwpRHl8Bp0FOW1Fnwd0w6TGq8XVIdTq7xRnbRjyz293H+ghyCotrWdMFXb1Fmp4ow==
X-Received: by 2002:a17:907:2c77:b0:77c:59aa:c011 with SMTP id ib23-20020a1709072c7700b0077c59aac011mr9410696ejc.724.1664617294208;
        Sat, 01 Oct 2022 02:41:34 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p57ba2cf5.dip0.t-ipconnect.de. [87.186.44.245])
        by smtp.gmail.com with ESMTPSA id i26-20020a50fc1a000000b00457c9b7ac07sm3220134edr.84.2022.10.01.02.41.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Oct 2022 02:41:33 -0700 (PDT)
Date: Sat, 1 Oct 2022 11:41:31 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 09/10] staging: rtl8192e: Remove unused variable ScanDelay
Message-ID: <13d0b993d077490c65768f2b11a631a447f8e86f.1664616227.git.philipp.g.hortmann@gmail.com>
References: <cover.1664616227.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1664616227.git.philipp.g.hortmann@gmail.com>

ScanDelay is never evaluated. Remove resulting dead code.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c | 1 -
 drivers/staging/rtl8192e/rtl8192e/rtl_core.c   | 1 -
 drivers/staging/rtl8192e/rtl8192e/rtl_core.h   | 2 --
 3 files changed, 4 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
index f2cbec6eb08f..c3dcaa27fd2e 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
@@ -503,7 +503,6 @@ static void _rtl92e_read_eeprom_info(struct net_device *dev)
 			priv->ChannelPlan = 0x0;
 		break;
 	case EEPROM_CID_Nettronix:
-		priv->ScanDelay = 100;
 		priv->CustomerID = RT_CID_Nettronix;
 		break;
 	case EEPROM_CID_Pronet:
diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
index ae0fcbbee2bb..f07f0fc690a3 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
@@ -868,7 +868,6 @@ static void _rtl92e_init_priv_variable(struct net_device *dev)
 	priv->rfa_txpowertrackingindex = 0;
 	priv->rfc_txpowertrackingindex = 0;
 	priv->CckPwEnl = 6;
-	priv->ScanDelay = 50;
 	priv->ResetProgress = RESET_TYPE_NORESET;
 	priv->force_reset = false;
 	memset(priv->rtllib->swcamtable, 0, sizeof(struct sw_cam_table) * 32);
diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.h b/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
index 763ed761bb38..c536131ecd5d 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
@@ -410,8 +410,6 @@ struct r8192_priv {
 	short	chan;
 	short	sens;
 	short	max_sens;
-
-	u8 ScanDelay;
 	bool ps_force;
 
 	u32 irq_mask[2];
-- 
2.37.3

