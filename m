Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E729D2C9D
	for <linux-staging@lists.linux.dev>; Fri, 19 Aug 2022 12:54:41 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id w3so5563667edc.2
        for <linux-staging@lists.linux.dev>; Fri, 19 Aug 2022 05:54:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=yyOz/wz9iFnuktDnmIg37pL//Hn26j/SMMCZDt4cX44=;
        b=mUD5vF9s6EowiuWQlcNrvyob52ML+8/CwuHe2GyqVRaVy978B3Prgv9D7XLQajVdoj
         bh1lC+5Cq+EPB1hBGxDOCnJTN4bGQLgNXGiP/7gDyMgdCWBmeTY7XA+RtohpGSMuP2iL
         5EK8ACZ9taMNpLeqD2BkqkeTLBtkJzpWg/t10gAUiFEnZleEf0ZLtcwVkQl9i/reFPOL
         PstlgsrCPYs389Az03Tn5/HRmprMxk4Huo01BgqTtu+orWIH7kMTzNfABFHjZtuJN2p1
         btlg22zfGsdvnAlNFLe3DVDBXBbFyLkJ83OgIoZCELAAP7Ikr+pMsnc9NODTgXTA9xzD
         SmJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=yyOz/wz9iFnuktDnmIg37pL//Hn26j/SMMCZDt4cX44=;
        b=WDbuwF4VL63wrLDPPustCNqBORKZwv4hUND2eE2qf0obwuHSi6+gWCE9euh6Qiyqln
         K0++wb7BAuVaODhP9BM0Pwf4b+bW7srbzAANq1DPbZTbL+5c7pEDmmTu6wOdRiVfpQ+Z
         XuG2sc5S0tArydTEs4AeuZ9i+piuzsSizIilGytW7JiUVZtG5GyNWZgzrRYZvLKyAhdW
         CeDkajPVYZIWRiU35aNs+K2xykcuB3cPaOi6ba0GCrzhLOU9ey/NwKkDwbRhbMnr/BZg
         cyayGQyzt+drcDCBxI+7Blviny9A3dVJNZ4JxlyCJJ/fKCoMAE5zu2h10V34Lr9semkI
         02pw==
X-Gm-Message-State: ACgBeo20Lk9Ai9pwp9F6vXX3QSjXV05LoXvCq6Zp4HDuANNz8sbyJ+UZ
	FAP20Pc+wQHj1H0MhgHfH8I=
X-Google-Smtp-Source: AA6agR5mLeaXTWb3gHpI5s3OBuGr2Z+OBYDfL89LkUYEZEoyg8fxykAnWDpyOUmmhYtK5Lsb5YsUuA==
X-Received: by 2002:a05:6402:43c8:b0:445:d773:c1ac with SMTP id p8-20020a05640243c800b00445d773c1acmr6191269edc.309.1660913680312;
        Fri, 19 Aug 2022 05:54:40 -0700 (PDT)
Received: from localhost.localdomain (ip5f5abb77.dynamic.kabel-deutschland.de. [95.90.187.119])
        by smtp.gmail.com with ESMTPSA id b12-20020a056402138c00b0043d6ece495asm3000955edv.55.2022.08.19.05.54.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Aug 2022 05:54:40 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 02/11] staging: r8188eu: make init_addba_retry_timer() static
Date: Fri, 19 Aug 2022 14:54:19 +0200
Message-Id: <20220819125428.8412-3-straube.linux@gmail.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220819125428.8412-1-straube.linux@gmail.com>
References: <20220819125428.8412-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The function init_addba_retry_timer() is only used in rtw_sta_mgt.c.
Make it static to get one step closer to removing os_dep/mlme_linux.c.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_sta_mgt.c     | 12 ++++++++++++
 drivers/staging/r8188eu/include/rtw_mlme_ext.h |  1 -
 drivers/staging/r8188eu/os_dep/mlme_linux.c    | 11 -----------
 3 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_sta_mgt.c b/drivers/staging/r8188eu/core/rtw_sta_mgt.c
index bbc1ef146826..2b58e11896b4 100644
--- a/drivers/staging/r8188eu/core/rtw_sta_mgt.c
+++ b/drivers/staging/r8188eu/core/rtw_sta_mgt.c
@@ -154,6 +154,18 @@ static void rtw_init_recv_timer(struct recv_reorder_ctrl *preorder_ctrl)
 	timer_setup(&preorder_ctrl->reordering_ctrl_timer, _rtw_reordering_ctrl_timeout_handler, 0);
 }
 
+static void _addba_timer_hdl(struct timer_list *t)
+{
+	struct sta_info *psta = from_timer(psta, t, addba_retry_timer);
+
+	addba_timer_hdl(psta);
+}
+
+static void init_addba_retry_timer(struct adapter *padapter, struct sta_info *psta)
+{
+	timer_setup(&psta->addba_retry_timer, _addba_timer_hdl, 0);
+}
+
 struct	sta_info *rtw_alloc_stainfo(struct sta_priv *pstapriv, u8 *hwaddr)
 {
 	s32	index;
diff --git a/drivers/staging/r8188eu/include/rtw_mlme_ext.h b/drivers/staging/r8188eu/include/rtw_mlme_ext.h
index a6b1b1b7da74..e092e646c0d2 100644
--- a/drivers/staging/r8188eu/include/rtw_mlme_ext.h
+++ b/drivers/staging/r8188eu/include/rtw_mlme_ext.h
@@ -388,7 +388,6 @@ struct mlme_ext_priv {
 void init_mlme_ext_priv(struct adapter *adapter);
 int init_hw_mlme_ext(struct adapter *padapter);
 void free_mlme_ext_priv (struct mlme_ext_priv *pmlmeext);
-extern void init_addba_retry_timer(struct adapter *adapt, struct sta_info *sta);
 extern struct xmit_frame *alloc_mgtxmitframe(struct xmit_priv *pxmitpriv);
 
 unsigned char networktype_to_raid(unsigned char network_type);
diff --git a/drivers/staging/r8188eu/os_dep/mlme_linux.c b/drivers/staging/r8188eu/os_dep/mlme_linux.c
index bc4f979280b6..b8d328d74443 100644
--- a/drivers/staging/r8188eu/os_dep/mlme_linux.c
+++ b/drivers/staging/r8188eu/os_dep/mlme_linux.c
@@ -130,17 +130,6 @@ void rtw_report_sec_ie(struct adapter *adapter, u8 authmode, u8 *sec_ie)
 	}
 }
 
-static void _addba_timer_hdl(struct timer_list *t)
-{
-	struct sta_info *psta = from_timer(psta, t, addba_retry_timer);
-	addba_timer_hdl(psta);
-}
-
-void init_addba_retry_timer(struct adapter *padapter, struct sta_info *psta)
-{
-	timer_setup(&psta->addba_retry_timer, _addba_timer_hdl, 0);
-}
-
 void rtw_indicate_sta_assoc_event(struct adapter *padapter, struct sta_info *psta)
 {
 	union iwreq_data wrqu;
-- 
2.37.1

