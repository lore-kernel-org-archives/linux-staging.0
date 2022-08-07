Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2F0A3C2F
	for <linux-staging@lists.linux.dev>; Sun,  7 Aug 2022 18:15:52 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id tl27so12921505ejc.1
        for <linux-staging@lists.linux.dev>; Sun, 07 Aug 2022 11:15:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4cI0C+edHqjQmmO/rArIoU+PLyf7AYRNI0KFouoRxco=;
        b=IlfguZNw5DsBKd9GOuXRcdMC7d9SV4iqU8oonFayH7IONPciQZHwTvQ6U20Srh6qrJ
         CBUVrWEI7CKWO2bUYVI9BFWA3sNVHNPuFXUOJf3NHFTIr9V14yO431vmfzpXb9rPYBiz
         Gue4DSMa+YgGZCdFHPy7TJscjag8Kzx0F4F+L0SIIjSTb2vRkqR6IJCPy9e4xeTNYpwA
         cAWXEZolY09u+DzHn9/xcki2HXsZ1zV8tZPLMrL3WjehP+RIxiFo5kigyLGxzqrXihVT
         z3WzUg1j4fe7ZPh9Vx2XZZE1pwjoUiAWh6qBI6x9j/v3W/K9oX7yf6eeasnkojvxgl/5
         KAZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4cI0C+edHqjQmmO/rArIoU+PLyf7AYRNI0KFouoRxco=;
        b=mxHbMEoAGfx6c6c/orB9NHG1TE89rRzZkgMrx0GqvNzlNgCzTnrdGfa2WjLR9Im+L0
         seFp9IDwdq80b9CNNZ6TnTvLl/s+6/haAiGVuX+P5HkCGvMzwofKDhjsHEd15OQi2IGa
         KVv907aDfJTuuSnd0jMdDfHoX4zDNNJFYUDq2eBFUnv6UqmQeoYPMTSYR+l6lKEyUTuD
         8ZVck9uVD2gxWqzoK62CWb+uGiDQF5myd4Pz5C/A0bXC6lnVFm0VjVWtRowtqF5z52sD
         gVr7MxpAGpNsI8QPSPmzw7OV/slKHjVrLWSGUCTRawMK5sLlYIY4v8VUPuonhowh37id
         Oduw==
X-Gm-Message-State: ACgBeo1cPYk5XkRhpYkpCzARq5eUHqbGuAvKeFte6GaqgjDFvGVUIB4z
	KbKtBXTib/myqE9+MRDjnzk=
X-Google-Smtp-Source: AA6agR5fa5mdkH83cIh2tWtL6RDyjFhuXdTLQnxKV+zSOJHJFHFkOKTz9VflpshhYcnDb6xlUPX82A==
X-Received: by 2002:a17:907:7388:b0:731:e57:dea3 with SMTP id er8-20020a170907738800b007310e57dea3mr7244985ejc.640.1659896151018;
        Sun, 07 Aug 2022 11:15:51 -0700 (PDT)
Received: from localhost.localdomain (ip5f5abb84.dynamic.kabel-deutschland.de. [95.90.187.132])
        by smtp.gmail.com with ESMTPSA id b7-20020a17090630c700b0072b92daef1csm4157441ejb.146.2022.08.07.11.15.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Aug 2022 11:15:50 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 3/5] staging: r8188eu: make rtw_handle_tkip_mic_err() static
Date: Sun,  7 Aug 2022 20:15:36 +0200
Message-Id: <20220807181538.8499-4-straube.linux@gmail.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220807181538.8499-1-straube.linux@gmail.com>
References: <20220807181538.8499-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The function rtw_handle_tkip_mic_err() is only used in rtw_recv.c.
Make it static.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_recv.c      | 36 ++++++++++++++++++++
 drivers/staging/r8188eu/include/recv_osdep.h |  2 --
 drivers/staging/r8188eu/os_dep/recv_linux.c  | 36 --------------------
 3 files changed, 36 insertions(+), 38 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_recv.c b/drivers/staging/r8188eu/core/rtw_recv.c
index 5de4e13b4b17..8f2b131eb767 100644
--- a/drivers/staging/r8188eu/core/rtw_recv.c
+++ b/drivers/staging/r8188eu/core/rtw_recv.c
@@ -327,6 +327,42 @@ u32 rtw_free_uc_swdec_pending_queue(struct adapter *adapter)
 	return cnt;
 }
 
+static void rtw_handle_tkip_mic_err(struct adapter *padapter, u8 bgroup)
+{
+	union iwreq_data wrqu;
+	struct iw_michaelmicfailure ev;
+	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
+	struct security_priv *psecuritypriv = &padapter->securitypriv;
+	u32 cur_time = 0;
+
+	if (psecuritypriv->last_mic_err_time == 0) {
+		psecuritypriv->last_mic_err_time = jiffies;
+	} else {
+		cur_time = jiffies;
+
+		if (cur_time - psecuritypriv->last_mic_err_time < 60 * HZ) {
+			psecuritypriv->btkip_countermeasure = true;
+			psecuritypriv->last_mic_err_time = 0;
+			psecuritypriv->btkip_countermeasure_time = cur_time;
+		} else {
+			psecuritypriv->last_mic_err_time = jiffies;
+		}
+	}
+
+	memset(&ev, 0x00, sizeof(ev));
+	if (bgroup)
+		ev.flags |= IW_MICFAILURE_GROUP;
+	else
+		ev.flags |= IW_MICFAILURE_PAIRWISE;
+
+	ev.src_addr.sa_family = ARPHRD_ETHER;
+	memcpy(ev.src_addr.sa_data, &pmlmepriv->assoc_bssid[0], ETH_ALEN);
+	memset(&wrqu, 0x00, sizeof(wrqu));
+	wrqu.data.length = sizeof(ev);
+	wireless_send_event(padapter->pnetdev, IWEVMICHAELMICFAILURE,
+			    &wrqu, (char *)&ev);
+}
+
 static int recvframe_chkmic(struct adapter *adapter,  struct recv_frame *precvframe)
 {
 	int	i, res = _SUCCESS;
diff --git a/drivers/staging/r8188eu/include/recv_osdep.h b/drivers/staging/r8188eu/include/recv_osdep.h
index 51dc287f263c..135fbb24fcbb 100644
--- a/drivers/staging/r8188eu/include/recv_osdep.h
+++ b/drivers/staging/r8188eu/include/recv_osdep.h
@@ -14,8 +14,6 @@ s32  rtw_recv_entry(struct recv_frame *precv_frame);
 int rtw_recv_indicatepkt(struct adapter *adapter, struct recv_frame *recv_frame);
 void rtw_recv_returnpacket(struct  net_device *cnxt, struct sk_buff *retpkt);
 
-void rtw_handle_tkip_mic_err(struct adapter *padapter, u8 bgroup);
-
 int rtw_init_recv_priv(struct recv_priv *precvpriv, struct adapter *padapter);
 void rtw_free_recv_priv(struct recv_priv *precvpriv);
 
diff --git a/drivers/staging/r8188eu/os_dep/recv_linux.c b/drivers/staging/r8188eu/os_dep/recv_linux.c
index c180f0e4dd3c..08dfe4482b8e 100644
--- a/drivers/staging/r8188eu/os_dep/recv_linux.c
+++ b/drivers/staging/r8188eu/os_dep/recv_linux.c
@@ -12,42 +12,6 @@
 #include "../include/osdep_intf.h"
 #include "../include/usb_ops.h"
 
-void rtw_handle_tkip_mic_err(struct adapter *padapter, u8 bgroup)
-{
-	union iwreq_data wrqu;
-	struct iw_michaelmicfailure    ev;
-	struct mlme_priv *pmlmepriv  = &padapter->mlmepriv;
-	struct security_priv	*psecuritypriv = &padapter->securitypriv;
-	u32 cur_time = 0;
-
-	if (psecuritypriv->last_mic_err_time == 0) {
-		psecuritypriv->last_mic_err_time = jiffies;
-	} else {
-		cur_time = jiffies;
-
-		if (cur_time - psecuritypriv->last_mic_err_time < 60 * HZ) {
-			psecuritypriv->btkip_countermeasure = true;
-			psecuritypriv->last_mic_err_time = 0;
-			psecuritypriv->btkip_countermeasure_time = cur_time;
-		} else {
-			psecuritypriv->last_mic_err_time = jiffies;
-		}
-	}
-
-	memset(&ev, 0x00, sizeof(ev));
-	if (bgroup)
-		ev.flags |= IW_MICFAILURE_GROUP;
-	else
-		ev.flags |= IW_MICFAILURE_PAIRWISE;
-
-	ev.src_addr.sa_family = ARPHRD_ETHER;
-	memcpy(ev.src_addr.sa_data, &pmlmepriv->assoc_bssid[0], ETH_ALEN);
-	memset(&wrqu, 0x00, sizeof(wrqu));
-	wrqu.data.length = sizeof(ev);
-	wireless_send_event(padapter->pnetdev, IWEVMICHAELMICFAILURE,
-			    &wrqu, (char *)&ev);
-}
-
 int rtw_recv_indicatepkt(struct adapter *padapter,
 			 struct recv_frame *precv_frame)
 {
-- 
2.37.1

