Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57D367C;
	Fri,  1 Apr 2022 19:28:53 +0000 (UTC)
Received: by mail-qt1-f169.google.com with SMTP id o15so1636213qtv.8;
        Fri, 01 Apr 2022 12:28:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7duh5/e6azg6x7M9ZEJraSnYR2xg1p2mo3IgTU2n19I=;
        b=OCd3gsRyzYDvDg9YDJvm6gTOtL0bDx/HUB4aqjhCnua1UdduM1FJa09W17iXTQufZ+
         qhW/keWErJpwKgsd+dcRGjKQpGKUH0cFEx4yxd1YhhZKOjAsdw2W9j0OrHxfERT9LkW+
         yScp27OffdfjqiyTuE3rNkff7aMBuVpbUh+zU4zyRw70xOeXU3IsK5eA2+LBg5Mn3mgv
         HN3GgX6rIQdMWbYOb5mbphx4kZGbTuWdm+PbFpomJ3F0IEFQMU0dur+lUsGl/FgAyEuS
         T21r7a+0IfnpmZ3/KArTz0nNNaMIBinIwHdaGW/WU6O4dJF8syG0SS2bKUMHbGgKHemS
         25CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7duh5/e6azg6x7M9ZEJraSnYR2xg1p2mo3IgTU2n19I=;
        b=gZzpzi6IFZfYCWkB3HeWcNQxmVVdQKd+Gb/nt4ZIMED4gvyQPqTyhwlOa/+kzy6k5F
         PKUz/3jP+BnknebtklaSZbWa1rVXAMzXxIIrKgaG7E4Wr2FS19mBhvqoAXwRF4YJFNtS
         NAZzxFGU8h26aLQRN3ZIR6Gy6mNCFO/ItN9FKHpNXiouHauOMDn/nIe6k5XSed9GgXIQ
         DP2V7bGGLcujfZqjUsLNi99A0KPj34X/eGWY4zsumseVDxgFgIefSyNi2uuQILC795zG
         HpeRXoyeXCuUnEI86Ys6Ujnz0qLRxAo5aiSPj6+HkeJpC7ryrK9uf2sbYzL6o5Ttw6vz
         PfVQ==
X-Gm-Message-State: AOAM531EQuAYOFtJzKi/XzPqcJrUK+na4LJ/aUMjsYG/1ICkubcn0xat
	dKbgvdpOVzrqrM5b0+rkwNM=
X-Google-Smtp-Source: ABdhPJxXC0lHmceb2Y8k4OsE50EED8DUfZseas9xERkD5RyGCqRGAtTNynL89XVJY6mzl7JYj85oBw==
X-Received: by 2002:a05:622a:164e:b0:2e1:e204:44c6 with SMTP id y14-20020a05622a164e00b002e1e20444c6mr9708398qtj.193.1648841332284;
        Fri, 01 Apr 2022 12:28:52 -0700 (PDT)
Received: from euclid ([71.58.109.160])
        by smtp.gmail.com with ESMTPSA id g14-20020ae9e10e000000b0067b520a01afsm1646527qkm.108.2022.04.01.12.28.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Apr 2022 12:28:51 -0700 (PDT)
From: Sevinj Aghayeva <sevinj.aghayeva@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev,
	Sevinj Aghayeva <sevinj.aghayeva@gmail.com>
Subject: [PATCH v3 3/3] staging: rtl8723bs: remove redundant else branches
Date: Fri,  1 Apr 2022 15:28:38 -0400
Message-Id: <eb57817c25a90a98d5f1602f6595cae13b2ae7ef.1648840991.git.sevinj.aghayeva@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1648840991.git.sevinj.aghayeva@gmail.com>
References: <cover.1648840991.git.sevinj.aghayeva@gmail.com>
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

