Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37A7C71
	for <linux-staging@lists.linux.dev>; Sun, 28 Mar 2021 16:35:04 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id o10so14799798lfb.9
        for <linux-staging@lists.linux.dev>; Sun, 28 Mar 2021 09:35:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=h0ehMJS4X44VeO6a7OrN01uA4bYk3Kd4mEn9HL4pEt0=;
        b=NRJPzUklUiTmytIdxs5EjpqEGva8UvKDcImWfRlCkL/FY/ZoGf91a/g6FEIfYJT3lF
         bmvRQgG5refi7DGlRfCU11o02aMUQYN7ANh2TJPTp38Uq9fAiPZ9AcZGdZgPvK9kTNjr
         nmq7NUanItd7/LoJUT7/5JlEirkrGvumj05bNgEFZ/Hyld/gcws53LslnlLeT8Wr6Bsf
         kATHAipIzcYcNzMMsM7TGMDAvLCT12ML1h0ylgxPknZ/bmoBHecT9WXyQxhQElvEBwaG
         O/iu1s6GGNdNuEzF2q+ccnCRDNUs7KvXqIvPlmRl2M6npMAFgkS8P0DYu2Y/wivUFqTl
         eldQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=h0ehMJS4X44VeO6a7OrN01uA4bYk3Kd4mEn9HL4pEt0=;
        b=Hkav/3rW4o+q97nfgMsO47IOKNVrcKOz2yvYSBebh455wHeLc7/+OkjC1Xu8eRzMuT
         I5FTV8/8l7lbeiSITXab/H2Wz5QgIhN1ydDqRGHypffKrFBt9ejsJfoBvdlvLMAwZS7e
         e0WCouHcwWTckoiYS4QAPPGsfgCnRtzEYgTwfnhkmxPGqtqZC5uTTVV7cnptLpOz67HL
         4LOd9L//wyrcLd9vEe2yZQ3gUedlVvwzZCCikF15Pn7pDu5+9LvUlM0TsrmG6nRX5o7U
         FK1JHkoKg9+/LwwQar6SbpKjYkQrUcUVVXrrUrgJA9nJkryhg2VkHnycgSyEjOc1AGjm
         iOew==
X-Gm-Message-State: AOAM5331XqMRSZ/AezscSxLqdPHGQnaWfa/bia4Xae2I/SxKOYW+Y5Oc
	b70ljmh6ayTh6Luem/iaeSI=
X-Google-Smtp-Source: ABdhPJzH8BalufhVytwo2U2kFlrcdWwlVICUJWzqeLuK1kAVr2HSdyiPttOc4e3K47BzbGCPCGAUSA==
X-Received: by 2002:ac2:446d:: with SMTP id y13mr13835988lfl.365.1616949302470;
        Sun, 28 Mar 2021 09:35:02 -0700 (PDT)
Received: from alpha (10.177.smarthome.spb.ru. [109.71.177.10])
        by smtp.gmail.com with ESMTPSA id d4sm1525802lfs.45.2021.03.28.09.35.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Mar 2021 09:35:02 -0700 (PDT)
Received: (nullmailer pid 53216 invoked by uid 1000);
	Sun, 28 Mar 2021 16:34:31 -0000
From: Ivan Safonov <insafonov@gmail.com>
To: Larry Finger <Larry.Finger@lwfinger.net>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Michael Straube <straube.linux@gmail.com>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, Peilin Ye <yepeilin.cs@gmail.com>, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Ivan Safonov <insafonov@gmail.com>
Subject: [PATCH 2/2] staging:r8188eu: remove dummy handlers from OnAction()
Date: Sun, 28 Mar 2021 19:33:25 +0300
Message-Id: <20210328163323.53163-2-insafonov@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210328163323.53163-1-insafonov@gmail.com>
References: <20210328163323.53163-1-insafonov@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

on_action_spct() do nothing, because rtw_get_stainfo() has no side
effects. Other action handlers are trivial.

Signed-off-by: Ivan Safonov <insafonov@gmail.com>
---
 drivers/staging/rtl8188eu/core/rtw_mlme_ext.c | 95 -------------------
 1 file changed, 95 deletions(-)

diff --git a/drivers/staging/rtl8188eu/core/rtw_mlme_ext.c b/drivers/staging/rtl8188eu/core/rtw_mlme_ext.c
index 4d741737d671..fca02f17ba98 100644
--- a/drivers/staging/rtl8188eu/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8188eu/core/rtw_mlme_ext.c
@@ -3517,56 +3517,6 @@ static unsigned int OnAtim(struct adapter *padapter,
 	return _SUCCESS;
 }
 
-static unsigned int on_action_spct(struct adapter *padapter,
-				   struct recv_frame *precv_frame)
-{
-	struct sta_info *psta = NULL;
-	struct sta_priv *pstapriv = &padapter->stapriv;
-	u8 *pframe = precv_frame->pkt->data;
-	u8 *frame_body = pframe + sizeof(struct ieee80211_hdr_3addr);
-	u8 category;
-	u8 action;
-
-	DBG_88E(FUNC_NDEV_FMT"\n", FUNC_NDEV_ARG(padapter->pnetdev));
-
-	psta = rtw_get_stainfo(pstapriv, GetAddr2Ptr(pframe));
-
-	if (!psta)
-		goto exit;
-
-	category = frame_body[0];
-	if (category != RTW_WLAN_CATEGORY_SPECTRUM_MGMT)
-		goto exit;
-
-	action = frame_body[1];
-	switch (action) {
-	case WLAN_ACTION_SPCT_MSR_REQ:
-	case WLAN_ACTION_SPCT_MSR_RPRT:
-	case WLAN_ACTION_SPCT_TPC_REQ:
-	case WLAN_ACTION_SPCT_TPC_RPRT:
-		break;
-	case WLAN_ACTION_SPCT_CHL_SWITCH:
-		break;
-	default:
-		break;
-	}
-
-exit:
-	return _FAIL;
-}
-
-static unsigned int OnAction_qos(struct adapter *padapter,
-				 struct recv_frame *precv_frame)
-{
-	return _SUCCESS;
-}
-
-static unsigned int OnAction_dls(struct adapter *padapter,
-				 struct recv_frame *precv_frame)
-{
-	return _SUCCESS;
-}
-
 static unsigned int OnAction_back(struct adapter *padapter,
 				  struct recv_frame *precv_frame)
 {
@@ -3756,24 +3706,6 @@ static unsigned int on_action_public(struct adapter *padapter,
 	return ret;
 }
 
-static unsigned int OnAction_ht(struct adapter *padapter,
-				struct recv_frame *precv_frame)
-{
-	return _SUCCESS;
-}
-
-static unsigned int OnAction_wmm(struct adapter *padapter,
-				 struct recv_frame *precv_frame)
-{
-	return _SUCCESS;
-}
-
-static unsigned int OnAction_p2p(struct adapter *padapter,
-				 struct recv_frame *precv_frame)
-{
-	return _SUCCESS;
-}
-
 static unsigned int DoReserved(struct adapter *padapter,
 			       struct recv_frame *precv_frame)
 {
@@ -3792,39 +3724,12 @@ static unsigned int OnAction(struct adapter *padapter,
 	category = frame_body[0];
 
 	switch (category) {
-	case RTW_WLAN_CATEGORY_SPECTRUM_MGMT:
-		on_action_spct(padapter, precv_frame);
-		break;
-	case RTW_WLAN_CATEGORY_QOS:
-		OnAction_qos(padapter, precv_frame);
-		break;
-	case RTW_WLAN_CATEGORY_DLS:
-		OnAction_dls(padapter, precv_frame);
-		break;
 	case RTW_WLAN_CATEGORY_BACK:
 		OnAction_back(padapter, precv_frame);
 		break;
 	case RTW_WLAN_CATEGORY_PUBLIC:
 		on_action_public(padapter, precv_frame);
 		break;
-	case RTW_WLAN_CATEGORY_RADIO_MEASUREMENT:
-		DoReserved(padapter, precv_frame);
-		break;
-	case RTW_WLAN_CATEGORY_FT:
-		DoReserved(padapter, precv_frame);
-		break;
-	case RTW_WLAN_CATEGORY_HT:
-		OnAction_ht(padapter, precv_frame);
-		break;
-	case RTW_WLAN_CATEGORY_SA_QUERY:
-		DoReserved(padapter, precv_frame);
-		break;
-	case RTW_WLAN_CATEGORY_WMM:
-		OnAction_wmm(padapter, precv_frame);
-		break;
-	case RTW_WLAN_CATEGORY_P2P:
-		OnAction_p2p(padapter, precv_frame);
-		break;
 	default:
 		break;
 	}
-- 
2.26.2

