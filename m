Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D4488F70
	for <linux-staging@lists.linux.dev>; Tue, 24 Jan 2023 22:04:25 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id c4-20020a1c3504000000b003d9e2f72093so41601wma.1
        for <linux-staging@lists.linux.dev>; Tue, 24 Jan 2023 14:04:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=u9KDPpjVKPB5sOQxBI2Abbi3wGikXqFCKNDvpCWP0FU=;
        b=V+OeiocRchdGib1s/15ba9Yh9kWOa/t6CczrE/IdZOPu/1PrCug4laVgpF+HwPlDWV
         VHn3u8bqvjBFwLtVoQeSpp91Z1PQrmoWgR1cea4FKAbINUtR+raHEXJB7lQDNZCtZJQt
         lIg6A50sfFwfeLIeYU2YZXSRC6uexu6CB6ZqGs/OWBgsYy/v38WCNCBjE78fFrkPTcW3
         TjardTD5pOArjJ9s/6xAieTfkIT/KkY207ARTpXLSsRqpL1mD5WVs/kFPXbVRkocOCno
         VlJS9uKOmBrYGWqgpgZPjMsd0AHB7fXSRn6zS4aLdlXbwFhZx767lKJHrkhJnmXR5jw1
         x/yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u9KDPpjVKPB5sOQxBI2Abbi3wGikXqFCKNDvpCWP0FU=;
        b=jdJaDM7FjGYeFAx0iEZkOB5R/CfLiwsuxN0gKoUNshjw4pysvOZXlJEfWat4avwtUn
         wUwbOlm34QqAC78OCKT1k8Zjxlv8U7i79IE+AfAAK6HrVzNkWthpbXVxXQW/JG8lDIOt
         9Kvx+l7mrtyjT2WAL8Ix+DFq5QBXULR/6Z+ZGoaxOzmy5AhLfTjKnN4YdAL+4KxUg0YW
         Chu9yamYFyjrA6/DlwnhM9+aqadSVaLb9TuiXwut4ajyOBrTYDhO8bA8P3rh1hRADR6m
         y+sqmGU4rTJhrAGUUJDuolUQdyHBNtQg2HRPs3Gz/pZO3EgDyAiRyrAJTLkm91SthIKz
         T68Q==
X-Gm-Message-State: AFqh2kpN5+7lm1lebZirET+aD07VMVgRpS1lWDDcK2NhT90lxSYQQbVR
	PnXFtJAzAF35gL/lS0lN/+Q=
X-Google-Smtp-Source: AMrXdXtH3CdSB3oUOj5iEag4fJDjpIu96ar2OFRhQagghXHtwgjdNkqiWHJXRLtfkN85CuIYZdK6kg==
X-Received: by 2002:a05:600c:1e22:b0:3db:2063:425e with SMTP id ay34-20020a05600c1e2200b003db2063425emr5573938wmb.1.1674597863634;
        Tue, 24 Jan 2023 14:04:23 -0800 (PST)
Received: from matrix-ESPRIMO-P710 (p57935ca5.dip0.t-ipconnect.de. [87.147.92.165])
        by smtp.gmail.com with ESMTPSA id f5-20020a05600c44c500b003d1de805de5sm42022wmo.16.2023.01.24.14.04.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jan 2023 14:04:22 -0800 (PST)
Date: Tue, 24 Jan 2023 23:04:20 +0100
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 08/11] staging: rtl8192e: Remove unused variables txov..,
 txbeokint and txbkokint
Message-ID: <9ded1e4c43c87faef908df1d4aa564d0ba00e1a3.1674596722.git.philipp.g.hortmann@gmail.com>
References: <cover.1674596722.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1674596722.git.philipp.g.hortmann@gmail.com>

txoverflow, txbeokint and txbkokint are initialized and increased but
never read. Remove dead code.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/rtl_core.c | 5 -----
 drivers/staging/rtl8192e/rtl8192e/rtl_core.h | 3 ---
 2 files changed, 8 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
index ff9dc06642f6..768324cbe253 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
@@ -2181,17 +2181,12 @@ static irqreturn_t _rtl92e_irq(int irq, void *netdev)
 	if (inta & IMR_RXFOVW)
 		tasklet_schedule(&priv->irq_rx_tasklet);
 
-	if (inta & IMR_TXFOVW)
-		priv->stats.txoverflow++;
-
 	if (inta & IMR_BKDOK) {
-		priv->stats.txbkokint++;
 		priv->rtllib->link_detect_info.NumTxOkInPeriod++;
 		_rtl92e_tx_isr(dev, BK_QUEUE);
 	}
 
 	if (inta & IMR_BEDOK) {
-		priv->stats.txbeokint++;
 		priv->rtllib->link_detect_info.NumTxOkInPeriod++;
 		_rtl92e_tx_isr(dev, BE_QUEUE);
 	}
diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.h b/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
index 2d1561a202d0..96d340f686e9 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
@@ -184,9 +184,6 @@ enum reset_type {
 
 struct rt_stats {
 	unsigned long received_rate_histogram[4][32];
-	unsigned long txoverflow;
-	unsigned long txbeokint;
-	unsigned long txbkokint;
 	unsigned long txviokint;
 	unsigned long txvookint;
 	unsigned long txbeaconokint;
-- 
2.39.1

