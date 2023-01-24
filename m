Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FF3C8F70
	for <linux-staging@lists.linux.dev>; Tue, 24 Jan 2023 22:04:01 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id k16so12501136wms.2
        for <linux-staging@lists.linux.dev>; Tue, 24 Jan 2023 14:04:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=75/IjlhstHHhYWzsbQIR4Dd2QgIIp4238rHFb4NvJPg=;
        b=AUJrtPJNhcoozirZE5FdY6iWPNtWlFrObe7Pouo+G3eNQt8ubArB/ugRI/EzBk9OSX
         1aq6Z17HKeVHJ/q36qE9oS1RMEDv5jjAwcewxT63fnFkjsgfFANbeaC3arfNSH+yM7w2
         xT7f7b4ycOCZWq8KFDadRPl3sUvStDTw/0DCHEhhkrbsPyqrywJjmLakQirMH9f56Nu1
         d6ulFPt+bPPB/tuHOHKArqU+uU1/KlbWsy+JHfYYHQKIlxIL5g/E7Ok8V27Swx2PG+xI
         1/hicgnaOETKo56WUCdj+ruFnlflR0QyzyQ7Dfnx1/hAKZq5jdVhJ55hXLmYCbtzS97/
         osZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=75/IjlhstHHhYWzsbQIR4Dd2QgIIp4238rHFb4NvJPg=;
        b=j3P7s8XNHY9D23L0GId6TZT5Wx6GEoEaPPlc3XNd/n6ysYXXsFa5ewc1pSk/V9XaZo
         Qr61LjF+PcjuCmFPi5b4RGKo9CRpxUGIWkrjAh8RVZ118gllW+rRIqttrSuatBJiBcqD
         KCJL8o5JOdzDn+VcrKmzHvoruY5LWxusUEl1kcKZpF5TYwASw4BUZpXeq+T4tBrGW0CJ
         NZlgTWOMQ+gOBOYwtDV7sGGJVqxwGsaysksHNySkDLNW20yC2RbIW8XutZBnyqUq/dNh
         IXnc1de/tMsUBdK2/fI8Ky+wimDqLGaOYLB7hKtq7wmrCq46LHsqRIdCNng5UX2JlfY1
         UmhQ==
X-Gm-Message-State: AFqh2koW8F83QynrweL1T/6Z1V0KJkKsql5syAGp3QzlH9JkmrBNpxQG
	hwJiSVW5TT80rDPG37SmXK3rEOEDDOU=
X-Google-Smtp-Source: AMrXdXvPIiEYoW3FFnicK63HVnZ60Kn25+lMO0cy3c8fv9g/eF5VwtcTTBClDdTgkZLG/JiH5W4cxg==
X-Received: by 2002:a05:600c:3b0a:b0:3db:22a:1349 with SMTP id m10-20020a05600c3b0a00b003db022a1349mr7678769wms.2.1674597839531;
        Tue, 24 Jan 2023 14:03:59 -0800 (PST)
Received: from matrix-ESPRIMO-P710 (p57935ca5.dip0.t-ipconnect.de. [87.147.92.165])
        by smtp.gmail.com with ESMTPSA id j20-20020a05600c489400b003db0f4e12c8sm22371wmp.34.2023.01.24.14.03.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jan 2023 14:03:58 -0800 (PST)
Date: Tue, 24 Jan 2023 23:03:56 +0100
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 06/11] staging: rtl8192e: Remove unused variables num_proc..,
 recei.. and rxov..
Message-ID: <67df12497bc6f93c6ef85b4dda7490b037f2a3da.1674596722.git.philipp.g.hortmann@gmail.com>
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

num_process_phyinfo, received_bwtype and rxoverflow are initialized and
increased but never read. Remove dead code.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c | 5 -----
 drivers/staging/rtl8192e/rtl8192e/rtl_core.c   | 4 +---
 drivers/staging/rtl8192e/rtl8192e/rtl_core.h   | 3 ---
 3 files changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
index 31b4823e6324..154d15b68b8e 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
@@ -1469,10 +1469,6 @@ static void _rtl92e_query_rxphystatus(
 		rxsc_sgien_exflg = pofdm_buf->rxsc_sgien_exflg;
 		prxsc = (struct phy_ofdm_rx_status_rxsc_sgien_exintfflag *)
 			&rxsc_sgien_exflg;
-		if (pdrvinfo->BW)
-			priv->stats.received_bwtype[1+prxsc->rxsc]++;
-		else
-			priv->stats.received_bwtype[0]++;
 	}
 
 	if (is_cck_rate) {
@@ -1535,7 +1531,6 @@ static void _rtl92e_process_phyinfo(struct r8192_priv *priv, u8 *buffer,
 	if (!bcheck)
 		return;
 
-	priv->stats.num_process_phyinfo++;
 	if (!prev_st->bIsCCK && prev_st->bPacketToSelf) {
 		for (rfpath = RF90_PATH_A; rfpath < RF90_PATH_C; rfpath++) {
 			if (!rtl92e_is_legal_rf_path(priv->rtllib->dev, rfpath))
diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
index e0d0f4faeca7..c5fe8e0aa83f 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
@@ -2183,10 +2183,8 @@ static irqreturn_t _rtl92e_irq(int irq, void *netdev)
 		tasklet_schedule(&priv->irq_rx_tasklet);
 	}
 
-	if (inta & IMR_RXFOVW) {
-		priv->stats.rxoverflow++;
+	if (inta & IMR_RXFOVW)
 		tasklet_schedule(&priv->irq_rx_tasklet);
-	}
 
 	if (inta & IMR_TXFOVW)
 		priv->stats.txoverflow++;
diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.h b/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
index e38de4d8a467..bb942283bc7a 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
@@ -184,9 +184,6 @@ enum reset_type {
 
 struct rt_stats {
 	unsigned long received_rate_histogram[4][32];
-	unsigned long num_process_phyinfo;
-	unsigned long received_bwtype[5];
-	unsigned long rxoverflow;
 	unsigned long rxint;
 	unsigned long ints;
 	unsigned long shints;
-- 
2.39.1

