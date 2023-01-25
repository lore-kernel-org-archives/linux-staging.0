Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66A8F6FB1
	for <linux-staging@lists.linux.dev>; Wed, 25 Jan 2023 20:09:30 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id y1so13733110wru.2
        for <linux-staging@lists.linux.dev>; Wed, 25 Jan 2023 12:09:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NDxe4oIJJSUOqPRwp3G0IGOgJo50hIDpNvcK0HbcW+I=;
        b=qAtHh3HwGlWTIavwZBR9eHLTvK0r//m0TwA4Wf7MIK+sqNyRDS3PBTtmyYxSdDSyAz
         0wCiETk9qiVzPJvSFoDDOueI0oJhHGQ5Lqa6G+DLURT6rn7UocCXrK2Pp5gYfhFFpOQc
         Nnc21ecuBb/maD0nI2yjRXyHfVHCjFXU8sIq6WkU7w4r7e50X5c+27sGqh91QyW44z7N
         qp5wDQqjntoRCjZ32ps2I21XkincXo2a7MgfTnSvvptA0UynoKz/F4ohixYTn9jQWKr3
         3BgCXgoqm+RkgjaTMCe9F2TMhzCHvkOZd8F6RsN5TL5HBO2tckVNf6KlnSQsjQb7/MVv
         ylxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NDxe4oIJJSUOqPRwp3G0IGOgJo50hIDpNvcK0HbcW+I=;
        b=L2Jw3dFx0swW0tHVg2jtuS0wEiNDBCyaobaymmd0KoG55xv+KEC98gzHqujK5P/zz8
         P5vGmHM6HnhkXxdZM6t8P9XD9LAJdEMWBGrOaCfaVd0yY7h+cRDrZf7xSoPQj+zzAYIE
         ddXR0waeuP744qFsQHK30NtTsaAA/TGybWh3BUf6k9n+s0Jo3QmuDPQub+/D+pE8mlco
         WkTj4J2B3wA9E/508gBC9eFCs+1886YH8JPxh/KHPthyBxUVN7U0gVOJ5+3msGiQu/Xr
         8xpAjnQxGXEWDjZphVy6JoxfUGdph4s8o2Hn+aW/EwG5BTi4X2wVq8Hl0yUdyUB+9Mmf
         ytZw==
X-Gm-Message-State: AO0yUKXKoRyguUFUUM3za8Wm6GJ/Z/dacd68GEReanbzSz/ceCvp33Ld
	RRThY3sIIVFH58CyQ25RtgRfpFkyOCQ=
X-Google-Smtp-Source: AK7set+gKyL1/EbwngB0SCDE5eQm9o64IfenrGX4+jjBe5iXQY2tEPg5qF3+P6yRQEdKGjIvZeijFg==
X-Received: by 2002:adf:e3d0:0:b0:2bf:b41c:61de with SMTP id k16-20020adfe3d0000000b002bfb41c61demr1049378wrm.4.1674677368768;
        Wed, 25 Jan 2023 12:09:28 -0800 (PST)
Received: from matrix-ESPRIMO-P710 (p57935ca5.dip0.t-ipconnect.de. [87.147.92.165])
        by smtp.gmail.com with ESMTPSA id f5-20020adffcc5000000b002bfae3f6802sm5124513wrs.58.2023.01.25.12.09.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jan 2023 12:09:28 -0800 (PST)
Date: Wed, 25 Jan 2023 21:09:26 +0100
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v2 10/11] staging: rtl8192e: Remove unused variables
 txbeac.., txman.. and txcmdp..
Message-ID: <6c922591c48512692f77729ac91849ebb4e61bd1.1674675808.git.philipp.g.hortmann@gmail.com>
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

txbeaconerr, txmanageokint and txcmdpktokint are initialized and increased
but never read. Remove dead code.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/rtl_core.c | 8 +-------
 drivers/staging/rtl8192e/rtl8192e/rtl_core.h | 3 ---
 2 files changed, 1 insertion(+), 10 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
index 4cc90425fa4c..2c5edda74e73 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
@@ -2139,11 +2139,7 @@ static irqreturn_t _rtl92e_irq(int irq, void *netdev)
 		goto done;
 	}
 
-	if (inta & IMR_TBDER)
-		priv->stats.txbeaconerr++;
-
 	if (inta  & IMR_MGNTDOK) {
-		priv->stats.txmanageokint++;
 		_rtl92e_tx_isr(dev, MGNT_QUEUE);
 		spin_unlock_irqrestore(&priv->irq_th_lock, flags);
 		if (priv->rtllib->ack_tx_to_ieee) {
@@ -2155,10 +2151,8 @@ static irqreturn_t _rtl92e_irq(int irq, void *netdev)
 		spin_lock_irqsave(&priv->irq_th_lock, flags);
 	}
 
-	if (inta & IMR_COMDOK) {
-		priv->stats.txcmdpktokint++;
+	if (inta & IMR_COMDOK)
 		_rtl92e_tx_isr(dev, TXCMD_QUEUE);
-	}
 
 	if (inta & IMR_HIGHDOK)
 		_rtl92e_tx_isr(dev, HIGH_QUEUE);
diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.h b/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
index f8b2201ea288..c6a4ac6ce959 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
@@ -184,9 +184,6 @@ enum reset_type {
 
 struct rt_stats {
 	unsigned long received_rate_histogram[4][32];
-	unsigned long txbeaconerr;
-	unsigned long txmanageokint;
-	unsigned long txcmdpktokint;
 	unsigned long txbytesmulticast;
 	unsigned long txbytesbroadcast;
 	unsigned long txbytesunicast;
-- 
2.39.1

