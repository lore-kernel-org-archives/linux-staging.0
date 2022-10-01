Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D4D723D1
	for <linux-staging@lists.linux.dev>; Sat,  1 Oct 2022 09:41:21 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id sb3so13457510ejb.9
        for <linux-staging@lists.linux.dev>; Sat, 01 Oct 2022 02:41:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date;
        bh=O4Um8Ahpe4fGsaE3pfc2y2JDj9dfhTxsFAj901n8Dqc=;
        b=G1OfJFwuWmNwBOInZiSVDuwNpThyDHrbZPk2OhZvZliL2z5cByO0DmZreG2tvgdzGd
         Ihw/YpLkJ1qVBqQVOE0iRcMDNPPq+gJdeMedrMyBXoWDpgQL2Yyg0OMyJCSUBq05TJWr
         iywTsRQbj8Ao5Dsrfy6lbFiyacMg5fPMokfr55bOqtMnCwye8AIPRa+F2AUyuKFkciuu
         k7lgImuzSZ5huB01B1jTmGXPcbby370h2CfXyy3D8VuXKahjAahZd/w7/dAMKVFAiHmz
         gEXYBO7uZ0f+WOHZQ2gkAekbtJDhvcsuEc6Lqmy4hgHcTNhahSav/vF7zC7OWV678Zm9
         01SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=O4Um8Ahpe4fGsaE3pfc2y2JDj9dfhTxsFAj901n8Dqc=;
        b=BrKk85vNDFGK5n+4QhC+hIF5dAuSpW8VN6mBJvC3rnvTXqKN/rPj73Ull+GojvJgY/
         y15724nOc54dnUOrdk+soq5DEiNy5Dz+/Mq1yZSA+kqI3lkHO35UktFfSKdtVj9khtN2
         nYMxuslIubaSLswa/gtR8uDfN4bzBCsOVrfXvrphKvZS3o8+bQlT9iisHBw8KM9nafwa
         rIJVltmzABxus0j/l5ZD3Z17U+gySNOX3owJyFQmZCxjipgacRPR9OUf+plNdiMi590Y
         f/Cf3KuhOsV6GU0VDws1WyP1BpGWQS3wXdw3sPOyIfUd9pJd1baVipy8MVRws+2ea4Tr
         bX1w==
X-Gm-Message-State: ACrzQf0MS1wE9dewY/SlquKb7Jrxfju1w1JNTADowPMpa3H3pyrZWlaR
	tWaP3ipufZWaxfZ1NEajtp8=
X-Google-Smtp-Source: AMsMyM4RHLCJYhDiLDCAtJw+NmB8sEODCHPwUt4syAxkCB01VCxoDS4o6OyKjeq+8wpAEq9FOPNruA==
X-Received: by 2002:a17:907:a4e:b0:77d:94d:8148 with SMTP id be14-20020a1709070a4e00b0077d094d8148mr8818059ejc.607.1664617280851;
        Sat, 01 Oct 2022 02:41:20 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p57ba2cf5.dip0.t-ipconnect.de. [87.186.44.245])
        by smtp.gmail.com with ESMTPSA id r4-20020aa7cfc4000000b0044f21c69608sm3258698edy.10.2022.10.01.02.41.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Oct 2022 02:41:20 -0700 (PDT)
Date: Sat, 1 Oct 2022 11:41:18 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 07/10] staging: rtl8192e: Remove unchanged variable
 bDisableNormalResetCheck
Message-ID: <026313f17cf708bf8fa0661f83b2c2b515e55b12.1664616227.git.philipp.g.hortmann@gmail.com>
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

bDisableNormalResetCheck is just once initialized with false. All
evaluations will result in !false. Remove resulting dead code.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/rtl_core.c | 6 ++----
 drivers/staging/rtl8192e/rtl8192e/rtl_core.h | 1 -
 2 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
index e77a73df9bc5..9dcae5d71fb9 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
@@ -871,7 +871,6 @@ static void _rtl92e_init_priv_variable(struct net_device *dev)
 	priv->ScanDelay = 50;
 	priv->ResetProgress = RESET_TYPE_NORESET;
 	priv->bForcedSilentReset = false;
-	priv->bDisableNormalResetCheck = false;
 	priv->force_reset = false;
 	memset(priv->rtllib->swcamtable, 0, sizeof(struct sw_cam_table) * 32);
 
@@ -1403,13 +1402,12 @@ static void _rtl92e_watchdog_wq_cb(void *data)
 	}
 	spin_unlock_irqrestore(&priv->tx_lock, flags);
 
-	if (!priv->bDisableNormalResetCheck && ResetType == RESET_TYPE_NORMAL) {
+	if (ResetType == RESET_TYPE_NORMAL) {
 		priv->ResetProgress = RESET_TYPE_NORMAL;
 		return;
 	}
 
-	if (((priv->force_reset) || (!priv->bDisableNormalResetCheck &&
-	      ResetType == RESET_TYPE_SILENT)))
+	if ((priv->force_reset || ResetType == RESET_TYPE_SILENT))
 		_rtl92e_if_silent_reset(dev);
 	priv->force_reset = false;
 	priv->bForcedSilentReset = false;
diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.h b/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
index 7d716fa12995..8a24037a93ec 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
@@ -541,7 +541,6 @@ struct r8192_priv {
 
 	enum reset_type ResetProgress;
 	bool		bForcedSilentReset;
-	bool		bDisableNormalResetCheck;
 	u16		TxCounter;
 	u16		RxCounter;
 	bool		bResetInProgress;
-- 
2.37.3

