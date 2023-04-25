Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 117297B
	for <linux-staging@lists.linux.dev>; Tue, 25 Apr 2023 00:48:57 +0000 (UTC)
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-b99efd7c335so293536276.0
        for <linux-staging@lists.linux.dev>; Mon, 24 Apr 2023 17:48:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682383737; x=1684975737;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xXD5oGyMJssR+MDeqCzSsR7IyyxKZwzZZxJX7GfHDyU=;
        b=rxYow8BQeAzw6gWcIH92VTnMPVFbAkixDKX0kYRwMzsfNmf59vDL1L8BHGoOyNjLpj
         1rocSm9QFZ7lEeoIknj/vJA5xiRyHEz/X6or2Jq1g4qlF9AwP/ZWkjUfW1FOpDSd6b0X
         y1h03z1/XXIhtR6yQWE2Wkkm6VuRuuYdQm2AksNIXpyIaCZz3jAPyxn8sqAx8ELvWP/G
         K6Fg10LlFyLtPYkX6VUVi5VFCL/YZmzv2AnL8ah87Re0ctd4LHmjTMRyvw8au9fJWWOk
         cN9uAeC0E5Yk5L3LW5KRpNMAT9xQ4PG0aXrYKl+fqaZYsTIV+mxOpAXWR89uVg6ZxzRu
         xp9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682383737; x=1684975737;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xXD5oGyMJssR+MDeqCzSsR7IyyxKZwzZZxJX7GfHDyU=;
        b=bz8ZYZQ1wx9/mbfbCR5SoCQKKpjVjkhBmT7YSFdTAjnVd5ZYLVIoUd0z0QRAJe0uP9
         qGzV8TmROjKl/NecqWJqv3sEKin3WG8wsd6WOnNsplpBYpB7i7B+07ZxiKVOSkV4sS8l
         Yz0cmSvfmnGKtqzmumkf1egmvzbBKuDuZQpFMYh+7BIXZzz742YW0C7zvspDR+0cpvbn
         dcMv8ecOaHCXihtHQnhnqS6x1UAYlwb3UmDzaiijugI6yV46q6YVntTiVQCx3sXxqE89
         i787ptAGBAwB5qYU3kqTGhjGCqzB+z0H/QPUO9ZaR4uOtHz1w8qXYf4qxiAkLvYgUi52
         0QUw==
X-Gm-Message-State: AAQBX9dpEEjcV0ZiZ0Sn9PnOLFjsAn5RebSePw1KBm1w12tJCGl+6VnB
	qOZhWyemAOWXCBekEX/KS38=
X-Google-Smtp-Source: AKy350bVESRWlrwo6kChB+EgNF9IXa+vTp+dUn4x92fGqFOB1BOKm9YGNnGCdhvxdug5UuqclOz6Qg==
X-Received: by 2002:a25:ae95:0:b0:b8f:327f:acab with SMTP id b21-20020a25ae95000000b00b8f327facabmr11830765ybj.13.1682383736701;
        Mon, 24 Apr 2023 17:48:56 -0700 (PDT)
Received: from iris ([2600:1700:ce00:d6f0::659])
        by smtp.gmail.com with ESMTPSA id b198-20020a0dd9cf000000b00545a0818487sm3260223ywe.23.2023.04.24.17.48.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Apr 2023 17:48:56 -0700 (PDT)
Date: Mon, 24 Apr 2023 20:48:53 -0400
From: John Grace <johnmgrace1@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev
Subject: [PATCH] staging: rtl8192e: avoid CamelCase <RATRIndex>
Message-ID: <ZEcjdUR/bnln7Z1J@iris>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Linux kernel coding-style suggests to not use mixed-case names. Fix
checkpatch issue by changing the variable name from camel case to snake
case.

Signed-off-by: John Grace <johnmgrace1@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c | 2 +-
 drivers/staging/rtl8192e/rtl8192e/rtl_core.c   | 4 ++--
 drivers/staging/rtl8192e/rtllib.h              | 2 +-
 drivers/staging/rtl8192e/rtllib_softmac.c      | 4 ++--
 drivers/staging/rtl8192e/rtllib_tx.c           | 6 +++---
 5 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
index aed53fedeb61..c612e31d1a84 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
@@ -1008,7 +1008,7 @@ void  rtl92e_fill_tx_desc(struct net_device *dev, struct tx_desc *pdesc,
 	pdesc->PktSize = skb->len - sizeof(struct tx_fwinfo_8190pci);
 
 	pdesc->SecCAMID = 0;
-	pdesc->RATid = cb_desc->RATRIndex;
+	pdesc->RATid = cb_desc->ratr_index;
 
 
 	pdesc->NoEnc = 1;
diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
index 27040d1e3230..b58a30d68f2f 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
@@ -466,7 +466,7 @@ static void _rtl92e_prepare_beacon(struct tasklet_struct *t)
 	tcb_desc = (struct cb_desc *)(pnewskb->cb + 8);
 	tcb_desc->queue_index = BEACON_QUEUE;
 	tcb_desc->data_rate = 2;
-	tcb_desc->RATRIndex = 7;
+	tcb_desc->ratr_index = 7;
 	tcb_desc->tx_dis_rate_fallback = 1;
 	tcb_desc->tx_use_drv_assinged_rate = 1;
 	skb_push(pnewskb, priv->rtllib->tx_headroom);
@@ -1440,7 +1440,7 @@ static int _rtl92e_hard_start_xmit(struct sk_buff *skb, struct net_device *dev)
 		return 0;
 	}
 
-	tcb_desc->RATRIndex = 7;
+	tcb_desc->ratr_index = 7;
 	tcb_desc->tx_dis_rate_fallback = 1;
 	tcb_desc->tx_use_drv_assinged_rate = 1;
 	tcb_desc->bTxEnableFwCalcDur = 1;
diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index 6e665e866f1f..d5f5ea5615fc 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -139,7 +139,7 @@ struct cb_desc {
 	u8 rata_index;
 	u8 queue_index;
 	u16 txbuf_size;
-	u8 RATRIndex;
+	u8 ratr_index;
 	u8 bAMSDU:1;
 	u8 bFromAggrQ:1;
 	u8 reserved6:6;
diff --git a/drivers/staging/rtl8192e/rtllib_softmac.c b/drivers/staging/rtl8192e/rtllib_softmac.c
index b9886e83a6dc..1ca77cdbafa3 100644
--- a/drivers/staging/rtl8192e/rtllib_softmac.c
+++ b/drivers/staging/rtl8192e/rtllib_softmac.c
@@ -219,7 +219,7 @@ inline void softmac_mgmt_xmit(struct sk_buff *skb, struct rtllib_device *ieee)
 		tcb_desc->queue_index = HIGH_QUEUE;
 
 	tcb_desc->data_rate = MgntQuery_MgntFrameTxRate(ieee);
-	tcb_desc->RATRIndex = 7;
+	tcb_desc->ratr_index = 7;
 	tcb_desc->tx_dis_rate_fallback = 1;
 	tcb_desc->tx_use_drv_assinged_rate = 1;
 	if (single) {
@@ -297,7 +297,7 @@ softmac_ps_mgmt_xmit(struct sk_buff *skb,
 
 
 	tcb_desc->data_rate = MgntQuery_MgntFrameTxRate(ieee);
-	tcb_desc->RATRIndex = 7;
+	tcb_desc->ratr_index = 7;
 	tcb_desc->tx_dis_rate_fallback = 1;
 	tcb_desc->tx_use_drv_assinged_rate = 1;
 	if (single) {
diff --git a/drivers/staging/rtl8192e/rtllib_tx.c b/drivers/staging/rtl8192e/rtllib_tx.c
index 9ab8ee46ef66..54119fba8a57 100644
--- a/drivers/staging/rtl8192e/rtllib_tx.c
+++ b/drivers/staging/rtl8192e/rtllib_tx.c
@@ -486,7 +486,7 @@ static void rtllib_txrate_selectmode(struct rtllib_device *ieee,
 	    !tcb_desc->tx_use_drv_assinged_rate) {
 		if (ieee->iw_mode == IW_MODE_INFRA ||
 		    ieee->iw_mode == IW_MODE_ADHOC)
-			tcb_desc->RATRIndex = 0;
+			tcb_desc->ratr_index = 0;
 	}
 }
 
@@ -892,7 +892,7 @@ static int rtllib_xmit_inter(struct sk_buff *skb, struct net_device *dev)
 				tcb_desc->tx_dis_rate_fallback = 1;
 			}
 
-			tcb_desc->RATRIndex = 7;
+			tcb_desc->ratr_index = 7;
 			tcb_desc->tx_use_drv_assinged_rate = 1;
 		} else {
 			if (is_multicast_ether_addr(header.addr1))
@@ -916,7 +916,7 @@ static int rtllib_xmit_inter(struct sk_buff *skb, struct net_device *dev)
 					tcb_desc->tx_dis_rate_fallback = 1;
 				}
 
-				tcb_desc->RATRIndex = 7;
+				tcb_desc->ratr_index = 7;
 				tcb_desc->tx_use_drv_assinged_rate = 1;
 				tcb_desc->bdhcp = 1;
 			}
-- 
2.39.2

