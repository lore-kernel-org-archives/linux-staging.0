Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4986C23D1
	for <linux-staging@lists.linux.dev>; Sat,  1 Oct 2022 09:41:27 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id sd10so13556262ejc.2
        for <linux-staging@lists.linux.dev>; Sat, 01 Oct 2022 02:41:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date;
        bh=1UXfEwG6W+kKP5gjdCvT8XoeJBtVWkn+le2gvc+19Bo=;
        b=ddgWHzAmhkc62h3MIwIf8SIiSgihb1YrpJGwzeNuZRCyjVwYuw8OeK+hKfpT+4Wotf
         8C1RAb1nhz1i1nVSbLt91EJwPd45xIIWOff2+S0Kgmc66iEdpeIqy1rynQj5NCIml4F0
         NbSKhgNPL2dm7jfRKXAyCwsaE5UG5PrvZwIAx8y3/36MxNtcnCXTHbYIwxn4fZxwOakL
         NkhSO4KXPFMKPsG5MugwgYwPorS0ZDznVB3qEIHUmuRJ5rirDdVGrh8roEsB7vPrAuHE
         1AC0YKB7L2Kg8j675EDahPwwswrnHmmvQ/K8nVwwpr0MtRo2HRCLy54brXhuJfXgUnmd
         U4sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=1UXfEwG6W+kKP5gjdCvT8XoeJBtVWkn+le2gvc+19Bo=;
        b=p15UVqRCj1b4cOrEMU/X8G/kA4/a442o+4IOr2OL/CcGYaD7MieNhoqkMq0oNWrHAO
         ENOyCaxqWdUgsG3Qn8iutReYUEbf1fdYu1YqGmUxo2y89ZXJ9hXRPBITP5XkJ1pJ5mbz
         mi3koZw82KsS0H+gICsIscNEwuKO2YJOCUn8y/pAI/JJ1tu07ZM6ya4Z7hv3bIeg/NwE
         bZTqSNJn3I6orip19zk9wu7b67e5MUDvb+PQ+EhiQKhtU7tnV6aFTliVIJ6CRsW/27Ii
         nFsruAQ343mhoOuZeX6PTdHLoyawzRd1j5G9JbQ7YiCTo+jvu8jetePLZBWv03ALb4UV
         hgcg==
X-Gm-Message-State: ACrzQf141plBm8abQCNZqxwcY4er0u7D6tIsjIpnpErUjxqZEzHNad7O
	iD/YIIRtiUN8nxRE+lBcWlU=
X-Google-Smtp-Source: AMsMyM5ZuO0Ab5wX8LEbVB1bK0w1BKuSxjO5/35e20d4DBuFxCJmNz+C/m6ftGIxDgRqQwjTtSzujw==
X-Received: by 2002:a17:907:9717:b0:783:b2e4:23de with SMTP id jg23-20020a170907971700b00783b2e423demr8922396ejc.364.1664617286887;
        Sat, 01 Oct 2022 02:41:26 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p57ba2cf5.dip0.t-ipconnect.de. [87.186.44.245])
        by smtp.gmail.com with ESMTPSA id 10-20020a170906200a00b0074136cac2e7sm2422132ejo.81.2022.10.01.02.41.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Oct 2022 02:41:26 -0700 (PDT)
Date: Sat, 1 Oct 2022 11:41:24 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 08/10] staging: rtl8192e: Remove unused variable
 bForcedSilentReset
Message-ID: <10504e628eae110d73cd43050e7cc5801ce7f17b.1664616227.git.philipp.g.hortmann@gmail.com>
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

bForcedSilentReset is never evaluated. Remove resulting dead code.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/rtl_core.c | 4 ----
 drivers/staging/rtl8192e/rtl8192e/rtl_core.h | 1 -
 2 files changed, 5 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
index 9dcae5d71fb9..ae0fcbbee2bb 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
@@ -870,7 +870,6 @@ static void _rtl92e_init_priv_variable(struct net_device *dev)
 	priv->CckPwEnl = 6;
 	priv->ScanDelay = 50;
 	priv->ResetProgress = RESET_TYPE_NORESET;
-	priv->bForcedSilentReset = false;
 	priv->force_reset = false;
 	memset(priv->rtllib->swcamtable, 0, sizeof(struct sw_cam_table) * 32);
 
@@ -1240,8 +1239,6 @@ static void _rtl92e_if_silent_reset(struct net_device *dev)
 END:
 		priv->ResetProgress = RESET_TYPE_NORESET;
 		priv->reset_count++;
-
-		priv->bForcedSilentReset = false;
 		priv->bResetInProgress = false;
 
 		rtl92e_writeb(dev, UFWP, 1);
@@ -1410,7 +1407,6 @@ static void _rtl92e_watchdog_wq_cb(void *data)
 	if ((priv->force_reset || ResetType == RESET_TYPE_SILENT))
 		_rtl92e_if_silent_reset(dev);
 	priv->force_reset = false;
-	priv->bForcedSilentReset = false;
 	priv->bResetInProgress = false;
 }
 
diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.h b/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
index 8a24037a93ec..763ed761bb38 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
@@ -540,7 +540,6 @@ struct r8192_priv {
 	u32		reset_count;
 
 	enum reset_type ResetProgress;
-	bool		bForcedSilentReset;
 	u16		TxCounter;
 	u16		RxCounter;
 	bool		bResetInProgress;
-- 
2.37.3

