Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8426D15A7;
	Tue,  5 Apr 2022 03:16:27 +0000 (UTC)
Received: by mail-qk1-f175.google.com with SMTP id r127so9321228qke.13;
        Mon, 04 Apr 2022 20:16:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BJ7cxaRbKAyhta/oCZgwB/x5LwxJCNvCW+2zU0E+Y5k=;
        b=dLrvpeKHnrI4N6WvNfn5wDAyi72w2XOW2Mz/qI5cv1XUUQWXGaO9inRaDEi7Oqd/KS
         vGTTjjbhJY7145KVMP8yvYLXqhM5YnUE4iMR1Dh6c9sh/UgBSpCj8E518TPycQjAoWhW
         VZp07I0ymE9fe/Digyt/eaGQeF37a/2bcTkw5wV/wD63V/036+iRBbGTXmTwwToCtLIq
         ZO9+1izSrSKthLDV0JYulJaKHchtlkvFUNptFmBtZtc1xhuxoRrBKVrTX3UQ4bJ4re3T
         F4EPI6SX1UYKDf9htTVtbDlMyo5R0KYBEEsN08Jur/QDF7lubt93Bf5TiA6TR7Z+5GLa
         kz9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BJ7cxaRbKAyhta/oCZgwB/x5LwxJCNvCW+2zU0E+Y5k=;
        b=2iXT7OkHkr/HYVUpyEA69M5h0ENk8/F7HumqGL5tGYQjJGDylmM2y55Agu+PlUR1M6
         3orAxtE+qlvpMeD1PJeAmn9/N6L2ugbJWTpG7m5P5maAsfqTtKinQjwvdfE4IuDYndCf
         SBT64fKVisrbxxnHLsfYv9Ba5o2dNjUbi0sNsfE+AtoF2vE6mezszmhNLRf2gk/dcwTr
         F4IJ6Pvi1q3B5FxM/BbZ6UGhoWcgpIhOy7aW+sskQczpILS9HQ5WDDUhWwn4bhZsQ21L
         WuaCGN6LJlYrqOSWe5mwF5a/1EuVX7SLuRAhb8q6In3gKorPITVvZmTE6GRslJdjw7pp
         1sZA==
X-Gm-Message-State: AOAM532/+AfyBuhA7rYFUFiwyFZSuvWpBATemUhz0VD/M60hupr9WcS2
	Q8xS/85aWlUauClMpPj0ZQHPk/LnbG/HWA==
X-Google-Smtp-Source: ABdhPJwR2t57Egy+nHAQe7HDj3yiX5NJ6BgHpPqLMjHfQcQpIHqHqOzhK9Q9nz97ns4MNx8gquaOAA==
X-Received: by 2002:a05:620a:4706:b0:67d:c81b:b625 with SMTP id bs6-20020a05620a470600b0067dc81bb625mr907357qkb.775.1649128586529;
        Mon, 04 Apr 2022 20:16:26 -0700 (PDT)
Received: from euclid ([71.58.109.160])
        by smtp.gmail.com with ESMTPSA id v7-20020ac85787000000b002e1c8376517sm9534540qta.22.2022.04.04.20.16.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Apr 2022 20:16:26 -0700 (PDT)
From: Sevinj Aghayeva <sevinj.aghayeva@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev,
	Sevinj Aghayeva <sevinj.aghayeva@gmail.com>
Subject: [PATCH 2/5] staging: rtl8723bs: remove redundant else branches
Date: Mon,  4 Apr 2022 23:16:09 -0400
Message-Id: <fcb50e467d5ac81becf222379bcc21136966b86b.1649128267.git.sevinj.aghayeva@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1649128267.git.sevinj.aghayeva@gmail.com>
References: <cover.1649128267.git.sevinj.aghayeva@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adhere to Linux kernel coding style.

Reported by checkpatch:

WARNING: else is not generally useful after a break or return

Signed-off-by: Sevinj Aghayeva <sevinj.aghayeva@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 64 +++++++++----------
 1 file changed, 31 insertions(+), 33 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index 73891222f0d0..8c3b1448270a 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -908,10 +908,9 @@ unsigned int OnAuthClient(struct adapter *padapter, union recv_frame *precv_fram
 			set_link_timer(pmlmeext, REAUTH_TO);
 
 			return _SUCCESS;
-		} else {
-			/*  open system */
-			go2asoc = 1;
 		}
+		/* open system */
+		go2asoc = 1;
 	} else if (seq == 4) {
 		if (pmlmeinfo->auth_algo == dot11AuthAlgrthm_Shared)
 			go2asoc = 1;
@@ -1468,6 +1467,7 @@ unsigned int OnDeAuth(struct adapter *padapter, union recv_frame *precv_frame)
 	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
 	struct mlme_ext_info *pmlmeinfo = &(pmlmeext->mlmext_info);
 	u8 *pframe = precv_frame->u.hdr.rx_data;
+	int ignore_received_deauth = 0;
 
 	/* check A3 */
 	if (memcmp(GetAddr3Ptr(pframe), get_my_bssid(&pmlmeinfo->network), ETH_ALEN))
@@ -1503,35 +1503,33 @@ unsigned int OnDeAuth(struct adapter *padapter, union recv_frame *precv_frame)
 
 
 		return _SUCCESS;
-	} else {
-		int	ignore_received_deauth = 0;
-
-		/* 	Commented by Albert 20130604 */
-		/* 	Before sending the auth frame to start the STA/GC mode connection with AP/GO, */
-		/* 	we will send the deauth first. */
-		/* 	However, the Win8.1 with BRCM Wi-Fi will send the deauth with reason code 6 to us after receieving our deauth. */
-		/* 	Added the following code to avoid this case. */
-		if ((pmlmeinfo->state & WIFI_FW_AUTH_STATE) ||
-			(pmlmeinfo->state & WIFI_FW_ASSOC_STATE)) {
-			if (reason == WLAN_REASON_CLASS2_FRAME_FROM_NONAUTH_STA) {
-				ignore_received_deauth = 1;
-			} else if (reason == WLAN_REASON_PREV_AUTH_NOT_VALID) {
-				/*  TODO: 802.11r */
-				ignore_received_deauth = 1;
-			}
+	}
+
+	/* 	Commented by Albert 20130604 */
+	/* 	Before sending the auth frame to start the STA/GC mode connection with AP/GO, */
+	/* 	we will send the deauth first. */
+	/* 	However, the Win8.1 with BRCM Wi-Fi will send the deauth with reason code 6 to us after receieving our deauth. */
+	/* 	Added the following code to avoid this case. */
+	if ((pmlmeinfo->state & WIFI_FW_AUTH_STATE) ||
+	    (pmlmeinfo->state & WIFI_FW_ASSOC_STATE)) {
+		if (reason == WLAN_REASON_CLASS2_FRAME_FROM_NONAUTH_STA) {
+			ignore_received_deauth = 1;
+		} else if (reason == WLAN_REASON_PREV_AUTH_NOT_VALID) {
+			/*  TODO: 802.11r */
+			ignore_received_deauth = 1;
 		}
+	}
 
-		netdev_dbg(padapter->pnetdev,
-			   "sta recv deauth reason code(%d) sta:%pM, ignore = %d\n",
-			   reason, GetAddr3Ptr(pframe),
-			   ignore_received_deauth);
+	netdev_dbg(padapter->pnetdev,
+		   "sta recv deauth reason code(%d) sta:%pM, ignore = %d\n",
+		   reason, GetAddr3Ptr(pframe),
+		   ignore_received_deauth);
+
+	if (ignore_received_deauth == 0)
+		receive_disconnect(padapter, GetAddr3Ptr(pframe), reason);
 
-		if (ignore_received_deauth == 0)
-			receive_disconnect(padapter, GetAddr3Ptr(pframe), reason);
-	}
 	pmlmepriv->LinkDetectInfo.bBusyTraffic = false;
 	return _SUCCESS;
-
 }
 
 unsigned int OnDisassoc(struct adapter *padapter, union recv_frame *precv_frame)
@@ -1575,13 +1573,13 @@ unsigned int OnDisassoc(struct adapter *padapter, union recv_frame *precv_frame)
 		}
 
 		return _SUCCESS;
-	} else {
-		netdev_dbg(padapter->pnetdev,
-			   "sta recv disassoc reason code(%d) sta:%pM\n",
-			   reason, GetAddr3Ptr(pframe));
-
-		receive_disconnect(padapter, GetAddr3Ptr(pframe), reason);
 	}
+	netdev_dbg(padapter->pnetdev,
+		   "sta recv disassoc reason code(%d) sta:%pM\n",
+		   reason, GetAddr3Ptr(pframe));
+
+	receive_disconnect(padapter, GetAddr3Ptr(pframe), reason);
+
 	pmlmepriv->LinkDetectInfo.bBusyTraffic = false;
 	return _SUCCESS;
 
-- 
2.25.1

