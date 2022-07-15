Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14BD820E2
	for <linux-staging@lists.linux.dev>; Fri, 15 Jul 2022 06:29:18 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id m16so5033096edb.11
        for <linux-staging@lists.linux.dev>; Thu, 14 Jul 2022 23:29:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2O/uYRshHQMHbYI/vornb8qnNhKEQ6GUPb1j3U9RmRc=;
        b=JqtQ96+vZsYrvnsILvvlOXUm1ha7+djdjKnUrDYm5ik2k+DyTbB4ZF1DSeeiaMx92f
         Ly9KrVsxE/ZRY8D17j3CRUmS5Hk0XpgqkHTVi1OyNh/yrhotEq88m1YKNyoApbFgbHMQ
         a7q/VUgrn3tUxVAhnlJ+Pk5ECgf6WrM8APoJHAHMVFgqQVRWDBn0y6QspKTKEd6UFldm
         oQ8drVOD2YmDfA56YwdOtMtue2DrkHC/uQpWNJ3qS5GwV8ynBxmQo6+jXn5SxYSe/EH9
         aBn+eXcmaIOwNngZxBtatrD+ch3WNKi4sSsNmRULM/EbeYBTox5rV9TNjGr1ESAOmLxU
         Ee1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2O/uYRshHQMHbYI/vornb8qnNhKEQ6GUPb1j3U9RmRc=;
        b=2kErekWU9U7pIjft6L3LAPEJFyo6Avi/sb3suf2POU29FVb3PlOPjGq9FipiiNO2/o
         An8yPD3PKsshdDFVr+rwv2v4CQ5Gv9E6OC3dL2nrzI0t4Hym9f9Qn+NZHWW6gDOxjMkE
         fdNfFbsDqomsiAMZQ+6PGwssrVcuJz29eVJCJn3w3IcsyW8ngYK6ry7GN3yJ02vkRMpX
         JjkZ8B2YTxuhIM7hIiLZ+mYej04ze3knF3Y2QUUHPJ2AlZ0ILoyyj08YF2EIZZGj5OxT
         8BnD5azBpqYe4vh6ANHLfPRouRrLHUewJDQ7WEhZ/B6pgwwpq/pKoDYXOO9y30K6XxB1
         mGkA==
X-Gm-Message-State: AJIora960Wd10KPARlaoq5pRM0h7NQNMObw95gmgT2OpaXiP3SS6ZsVM
	/0YOwNDiXuLu9odyPNZ57ns=
X-Google-Smtp-Source: AGRyM1vL189/RM+6v4C21HG4ijWVy7NJ/WsAgm4+y1rD46JsLNH2Iqax5L0J8Q0UXPXR9bIYg4J50g==
X-Received: by 2002:aa7:c650:0:b0:43a:2c9a:fd1f with SMTP id z16-20020aa7c650000000b0043a2c9afd1fmr16814000edr.318.1657866557369;
        Thu, 14 Jul 2022 23:29:17 -0700 (PDT)
Received: from localhost.localdomain (ip5f5abb91.dynamic.kabel-deutschland.de. [95.90.187.145])
        by smtp.gmail.com with ESMTPSA id ku5-20020a170907788500b007262a5e2204sm1614515ejc.153.2022.07.14.23.29.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Jul 2022 23:29:17 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 3/5] staging: r8188eu: remove unused parameter from update_TSF()
Date: Fri, 15 Jul 2022 08:29:06 +0200
Message-Id: <20220715062908.8547-4-straube.linux@gmail.com>
X-Mailer: git-send-email 2.37.0
In-Reply-To: <20220715062908.8547-1-straube.linux@gmail.com>
References: <20220715062908.8547-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The parameter 'len' of update_TSF() is unused. Remove it.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_mlme_ext.c    | 4 ++--
 drivers/staging/r8188eu/core/rtw_wlan_util.c   | 2 +-
 drivers/staging/r8188eu/include/rtw_mlme_ext.h | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_mlme_ext.c b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
index 985cb3b4ba30..c23be5d9eaaf 100644
--- a/drivers/staging/r8188eu/core/rtw_mlme_ext.c
+++ b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
@@ -582,7 +582,7 @@ unsigned int OnBeacon(struct adapter *padapter, struct recv_frame *precv_frame)
 			pmlmeinfo->assoc_AP_vendor = check_assoc_AP(pframe + sizeof(struct ieee80211_hdr_3addr), len - sizeof(struct ieee80211_hdr_3addr));
 
 			/* update TSF Value */
-			update_TSF(pmlmeext, pframe, len);
+			update_TSF(pmlmeext, pframe);
 
 			/* start auth */
 			start_clnt_auth(padapter);
@@ -625,7 +625,7 @@ unsigned int OnBeacon(struct adapter *padapter, struct recv_frame *precv_frame)
 				}
 
 				/* update TSF Value */
-				update_TSF(pmlmeext, pframe, len);
+				update_TSF(pmlmeext, pframe);
 
 				/* report sta add event */
 				report_add_sta_event(padapter, GetAddr2Ptr(pframe), cam_idx);
diff --git a/drivers/staging/r8188eu/core/rtw_wlan_util.c b/drivers/staging/r8188eu/core/rtw_wlan_util.c
index 7b705e2ea04a..9e920a320d71 100644
--- a/drivers/staging/r8188eu/core/rtw_wlan_util.c
+++ b/drivers/staging/r8188eu/core/rtw_wlan_util.c
@@ -1571,7 +1571,7 @@ int update_sta_support_rate(struct adapter *padapter, u8 *pvar_ie, uint var_ie_l
 	return _SUCCESS;
 }
 
-void update_TSF(struct mlme_ext_priv *pmlmeext, u8 *pframe, uint len)
+void update_TSF(struct mlme_ext_priv *pmlmeext, u8 *pframe)
 {
 	u8 *pIE;
 	__le32 *pbuf;
diff --git a/drivers/staging/r8188eu/include/rtw_mlme_ext.h b/drivers/staging/r8188eu/include/rtw_mlme_ext.h
index 2110affc180f..54384b4c6b1a 100644
--- a/drivers/staging/r8188eu/include/rtw_mlme_ext.h
+++ b/drivers/staging/r8188eu/include/rtw_mlme_ext.h
@@ -596,7 +596,7 @@ void addba_timer_hdl(struct sta_info *psta);
 bool cckrates_included(unsigned char *rate, int ratelen);
 bool cckratesonly_included(unsigned char *rate, int ratelen);
 
-void update_TSF(struct mlme_ext_priv *pmlmeext, u8 *pframe, uint len);
+void update_TSF(struct mlme_ext_priv *pmlmeext, u8 *pframe);
 void correct_TSF(struct adapter *padapter);
 
 struct cmd_hdl {
-- 
2.37.0

