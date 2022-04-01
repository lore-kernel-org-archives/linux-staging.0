Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CC4A7C;
	Fri,  1 Apr 2022 19:07:14 +0000 (UTC)
Received: by mail-qv1-f50.google.com with SMTP id jo24so2742962qvb.5;
        Fri, 01 Apr 2022 12:07:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7duh5/e6azg6x7M9ZEJraSnYR2xg1p2mo3IgTU2n19I=;
        b=ixCVpPmT/JlXNt6KzufnyJWEqNtOWAo85HK28S7mlmUNz7+i+Xn2ycK3NtwdyV/3Ws
         im+/dNS7arlQR3WljVo4QAnmbBbFbEWexnKya1xQXePJMI6X/aeQkvVEsNqaLv8hOedT
         2pCzBm9lLcNw1XPFNOWd7YHC81/woL+Akco37rWL2xbn/fIsiyemhEveLI5NMLtd1ph0
         HPvF+IuqC9qQAKpJuFTTm+a9KWHRw+YQd1uiasqUktgDSsxeDzJ9tqoBeP9L8gED8HNX
         vm0KcOre3UBqdAWaiY04VWpAcV8o1dqVb1ol/Oxpu08qoU2KVPRpwfZ7f9LsR+p8qho4
         2nHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7duh5/e6azg6x7M9ZEJraSnYR2xg1p2mo3IgTU2n19I=;
        b=Famxg1d1vj+/EqJ1JyeRUjkUTXzjAIVXhK273VkGcIsxmQvyj3mCtsdS4Y65VHeLzp
         DNZdQ4gZ07edA5Zjs+zmKZNO01oU21AuYqf2KUPHA+pO4ihh4a8nzld9CBmuZQBbsK50
         RWxmZ7O2my/+cslvlkLOlSQUVv6pBXtn+ie7pnZD5nWqZV8bOQnCV/Y0s1PUJhV8YyK0
         FWA5zKtwGtEedyRou09ZNEeeS7QVSSCVWsJFOAhjxO91JXx18wn1dmEO2KN2IgNtCeqF
         gKylEYde3FK+rJ4Y/qbF4BEkpD05mZ40pckKyKC4Af8hN2Hk8aEq7oa+CPpUVwgezLDu
         IQTA==
X-Gm-Message-State: AOAM531Vq8pZ/PT6tIhbWztdFBzK6CRCnf1I7sUvLvhzUY0/PlJqtNhl
	ODkWdUSUUvyvJ34k6A0PxU/f+F3M+neajTYh
X-Google-Smtp-Source: ABdhPJw2mfHY0gOg+ec3qnwP3hWFN+2tbRKgXUdgtDXbIGg/5BcqyaMV0aj88gpDCQmfER129js3Cg==
X-Received: by 2002:ad4:4874:0:b0:440:f735:2743 with SMTP id u20-20020ad44874000000b00440f7352743mr9362812qvy.0.1648840033574;
        Fri, 01 Apr 2022 12:07:13 -0700 (PDT)
Received: from euclid ([71.58.109.160])
        by smtp.gmail.com with ESMTPSA id h22-20020a05620a245600b0067d6dae634csm2070825qkn.9.2022.04.01.12.07.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Apr 2022 12:07:12 -0700 (PDT)
From: Sevinj Aghayeva <sevinj.aghayeva@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev,
	Sevinj Aghayeva <sevinj.aghayeva@gmail.com>
Subject: [PATCH 2/2] staging: rtl8723bs: remove redundant else branches
Date: Fri,  1 Apr 2022 15:06:59 -0400
Message-Id: <eb57817c25a90a98d5f1602f6595cae13b2ae7ef.1648839290.git.sevinj.aghayeva@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1648839290.git.sevinj.aghayeva@gmail.com>
References: <cover.1648839290.git.sevinj.aghayeva@gmail.com>
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
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 63 +++++++++----------
 1 file changed, 30 insertions(+), 33 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index 81e4b1bf68f6..7a941832ee34 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -907,10 +907,9 @@ unsigned int OnAuthClient(struct adapter *padapter, union recv_frame *precv_fram
 			set_link_timer(pmlmeext, REAUTH_TO);
 
 			return _SUCCESS;
-		} else {
-			/*  open system */
-			go2asoc = 1;
 		}
+		/*  open system */
+		go2asoc = 1;
 	} else if (seq == 4) {
 		if (pmlmeinfo->auth_algo == dot11AuthAlgrthm_Shared)
 			go2asoc = 1;
@@ -1467,6 +1466,7 @@ unsigned int OnDeAuth(struct adapter *padapter, union recv_frame *precv_frame)
 	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
 	struct mlme_ext_info *pmlmeinfo = &(pmlmeext->mlmext_info);
 	u8 *pframe = precv_frame->u.hdr.rx_data;
+	int ignore_received_deauth = 0;
 
 	/* check A3 */
 	if (memcmp(GetAddr3Ptr(pframe), get_my_bssid(&pmlmeinfo->network), ETH_ALEN))
@@ -1502,32 +1502,31 @@ unsigned int OnDeAuth(struct adapter *padapter, union recv_frame *precv_frame)
 
 
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
+		(pmlmeinfo->state & WIFI_FW_ASSOC_STATE)) {
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
+		"sta recv deauth reason code(%d) sta:%pM, ignore = %d\n",
+		reason, GetAddr3Ptr(pframe),
+		ignore_received_deauth);
+
+	if (ignore_received_deauth == 0)
+		receive_disconnect(padapter, GetAddr3Ptr(pframe), reason);
 
-		if (ignore_received_deauth == 0)
-			receive_disconnect(padapter, GetAddr3Ptr(pframe), reason);
-	}
 	pmlmepriv->LinkDetectInfo.bBusyTraffic = false;
 	return _SUCCESS;
 
@@ -1574,16 +1573,14 @@ unsigned int OnDisassoc(struct adapter *padapter, union recv_frame *precv_frame)
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
+		"sta recv disassoc reason code(%d) sta:%pM\n",
+		reason, GetAddr3Ptr(pframe));
+
+	receive_disconnect(padapter, GetAddr3Ptr(pframe), reason);
 	pmlmepriv->LinkDetectInfo.bBusyTraffic = false;
 	return _SUCCESS;
-
 }
 
 unsigned int OnAtim(struct adapter *padapter, union recv_frame *precv_frame)
-- 
2.25.1

