Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C89AFED1
	for <linux-staging@lists.linux.dev>; Sun, 10 Apr 2022 16:32:09 +0000 (UTC)
Received: by mail-pg1-f179.google.com with SMTP id q19so12105885pgm.6
        for <linux-staging@lists.linux.dev>; Sun, 10 Apr 2022 09:32:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=H1U7ig0yIYDqqdZdu4wVkYgw4NSUR1m80doAifHbSXg=;
        b=gVpK4lNxM7SmpfWWIq6ooT0wacd8j3RXrqoxFe8fhV0ureF9rZCnTWPLKZSKvZpiPO
         rlg+OUiCIEDO/lJRs95bKzafvIH6lTy+S8WB9dZcykiZ0jrUCBDEitQ5AXEvXpPtZbWR
         rZ7s3VH3O239WHcSmi5TOqN4U2J3ppVHi9LjYWkHPKBDCh4hJpQk8+/bOBP9lAPCwnK9
         oh4lhM1wdxpryANakPH3swYUH6fI1n52GsXI6EEdHZ8Rcwn+wDgh1OzG72bkc5pYh336
         a67AgupEomzdrRyBLksE6+DcyrssQQ8D6HqiJP4Vd3GfxEL4pe90Z3cbFJ+AEVcf4e5H
         TMKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=H1U7ig0yIYDqqdZdu4wVkYgw4NSUR1m80doAifHbSXg=;
        b=qoZNTMGnFWuuOtu5owHDQy41UW9ptL9iH7wQClqaFurxcIC4Y9FNLPPzF5qMxDzuzw
         W9ig+qgSyI34R+R3oeXLeicCGEB3+jFhjgMFo9KwGByuiJsAx1Un6+cdSgwITh79VA17
         URCSKzhy7e54eP1e7KalM+VBhhxz8FvYBz7n2zlI832MSJO+mk+xWq/bWsYAkBxM752U
         o26e4iA5yDcL3cLDc86v01Ksaay3Ar1JG9BsKQUObwyNRxCexJCgoYora0RIyh2tJy3X
         +ztEb8dpTCPsN8IMvC4WJY0ttsH0V9tvl7R426gtygBNX61rf5RywBp1UO+RpqYgd2kn
         rPVg==
X-Gm-Message-State: AOAM530Sp2Av3/fvDeDMac1RjGUBG4qvJmBKQTbF7ZZyXVQPy5VOb+sN
	LsOp+CGm5Xg3GFpXKvBYZFw=
X-Google-Smtp-Source: ABdhPJz4eUGNhq0nhWYowhDapkqRvXBafHMP7p7w4C4Eq0u7PXK4HDz8GAdi1GmOQe5VQmH2f69Sow==
X-Received: by 2002:a05:6a00:238f:b0:4f6:b09a:4c63 with SMTP id f15-20020a056a00238f00b004f6b09a4c63mr29014047pfc.35.1649608329324;
        Sun, 10 Apr 2022 09:32:09 -0700 (PDT)
Received: from makvihas.localhost.com ([2405:201:202b:15:606b:10e4:2085:6825])
        by smtp.gmail.com with ESMTPSA id f12-20020a056a001acc00b004fb37ecc6b2sm31940021pfv.29.2022.04.10.09.32.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Apr 2022 09:32:09 -0700 (PDT)
From: Vihas Makwana <makvihas@gmail.com>
To: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michael Straube <straube.linux@gmail.com>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Dan Carpenter <dan.carpenter@oracle.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	Vihas Makwana <makvihas@gmail.com>
Subject: [PATCH 6/6] staging: r8188eu: drop unnecessary wrapper rtw_free_mlme_priv
Date: Sun, 10 Apr 2022 22:01:17 +0530
Message-Id: <20220410163117.3964-7-makvihas@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220410163117.3964-1-makvihas@gmail.com>
References: <20220410163117.3964-1-makvihas@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the unnecessary wrapper. Drop rtw_free_mlme_priv and use 
_rtw_free_mlme_priv instead.

Signed-off-by: Vihas Makwana <makvihas@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_mlme.c    | 5 -----
 drivers/staging/r8188eu/include/rtw_mlme.h | 1 -
 drivers/staging/r8188eu/os_dep/os_intfs.c  | 4 ++--
 3 files changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_mlme.c b/drivers/staging/r8188eu/core/rtw_mlme.c
index f2a61c162..c09a565b4 100644
--- a/drivers/staging/r8188eu/core/rtw_mlme.c
+++ b/drivers/staging/r8188eu/core/rtw_mlme.c
@@ -288,11 +288,6 @@ u8 *rtw_get_beacon_interval_from_ie(u8 *ie)
 	return ie + 8;
 }
 
-void rtw_free_mlme_priv(struct mlme_priv *pmlmepriv)
-{
-	_rtw_free_mlme_priv(pmlmepriv);
-}
-
 static struct wlan_network *rtw_alloc_network(struct mlme_priv *pmlmepriv)
 {
 	struct	wlan_network	*pnetwork;
diff --git a/drivers/staging/r8188eu/include/rtw_mlme.h b/drivers/staging/r8188eu/include/rtw_mlme.h
index b5b1a0e10..4055a15e2 100644
--- a/drivers/staging/r8188eu/include/rtw_mlme.h
+++ b/drivers/staging/r8188eu/include/rtw_mlme.h
@@ -439,7 +439,6 @@ void rtw_join_timeout_handler (struct timer_list *t);
 void _rtw_scan_timeout_handler (struct timer_list *t);
 void rtw_free_network_queue(struct adapter *adapter, u8 isfreeall);
 int _rtw_init_mlme_priv(struct adapter *adapter);
-void rtw_free_mlme_priv (struct mlme_priv *pmlmepriv);
 int rtw_select_and_join_from_scanned_queue(struct mlme_priv *pmlmepriv);
 int rtw_set_key(struct adapter *adapter, struct security_priv *psecuritypriv,
 		int keyid, u8 set_tx);
diff --git a/drivers/staging/r8188eu/os_dep/os_intfs.c b/drivers/staging/r8188eu/os_dep/os_intfs.c
index 448ea9533..adfc1e763 100644
--- a/drivers/staging/r8188eu/os_dep/os_intfs.c
+++ b/drivers/staging/r8188eu/os_dep/os_intfs.c
@@ -528,7 +528,7 @@ u8 rtw_init_drv_sw(struct adapter *padapter)
 free_mlme_ext:
 	free_mlme_ext_priv(&padapter->mlmeextpriv);
 
-	rtw_free_mlme_priv(&padapter->mlmepriv);
+	_rtw_free_mlme_priv(&padapter->mlmepriv);
 
 free_evt_priv:
 	rtw_free_evt_priv(&padapter->evtpriv);
@@ -576,7 +576,7 @@ u8 rtw_free_drv_sw(struct adapter *padapter)
 
 	rtw_free_evt_priv(&padapter->evtpriv);
 
-	rtw_free_mlme_priv(&padapter->mlmepriv);
+	_rtw_free_mlme_priv(&padapter->mlmepriv);
 	_rtw_free_xmit_priv(&padapter->xmitpriv);
 
 	_rtw_free_sta_priv(&padapter->stapriv); /* will free bcmc_stainfo here */
-- 
2.30.2

