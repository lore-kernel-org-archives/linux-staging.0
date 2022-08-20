Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 465253201
	for <linux-staging@lists.linux.dev>; Sat, 20 Aug 2022 18:16:39 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id z20so9104143edb.9
        for <linux-staging@lists.linux.dev>; Sat, 20 Aug 2022 11:16:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=h/sCmXVMZBCUJ8u5FcgfwSBgIpf0Du8Mi+DP75rSeIc=;
        b=HdabqiFeZaWjRT/jZcFmoOTy7I598cwDfZNRc7VXO4LptdQ9upQfJLqtNFIHo3kOGC
         BSkQGBmyvX8AjDm0oPwJIw+/Zfv/VJ77vopF2gzy8ZIBk4XMZqlv/m0pcl6lml+XilUf
         lToouyDvDS6vYvAwf4YllZS5mE0uhGxPngcHvgJ8UEAoa/gBngwzESq9+YHu2jrnXYJS
         h95eQXncEA6RZXB6rGpzopL8bo6TrDQe60okp4rhUcXIQgNkgvcq823m0YkywnFnRE+6
         UdWg45kmSRmX5BqvXHR6xZZ7Zwlm8l3wjxMRYx0lCffkBKb1jra3+fDhEvDKagRNB4lF
         1Rlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=h/sCmXVMZBCUJ8u5FcgfwSBgIpf0Du8Mi+DP75rSeIc=;
        b=dTZfI/24crJnlVzbwAj5KNu7882H1/OO2ure90kfq6gPww4vHEZMhVQ5f6m06QE6y6
         9vaxlLpwji6cORfoHVaiPukcLTRHW9MK/PBwEqWNTxRRWDWtXD2Gjol0W12XnOgVddu3
         Voo05FBZ0chi9LegFlRxXqyplcBExSxLzDba3RNY2LG9Kvg45SEs1QKaNVUmnTL4mtON
         aUyUsmiG9y3QGR9eCH2nvaCHVlE/cJAzNrE0DignDnMFdmaG+FyzZxIE1xbxoOs+8Zrz
         qDUVvdzW0mS7GAAadTf6t2BQxtJ90OCmUs6FPeIcdjs/GSQn78CSXDJBgOu1A2Nu4TB1
         uSEA==
X-Gm-Message-State: ACgBeo3s5Pd1zEfUAj/FzzQrgkLr1xcE4VUdM9JNFvzU7n2qnZ5YkU8U
	KiPGIDWeLsQkJVudvKytl3E=
X-Google-Smtp-Source: AA6agR7iObdlp02vy9+GZYF1PD3OTrPVPO56UxS0IZdwOtJL3qK2LFnX1OOWBTE8Lz0k+OOMQwZcJA==
X-Received: by 2002:a05:6402:440f:b0:435:2e63:aca9 with SMTP id y15-20020a056402440f00b004352e63aca9mr10005474eda.162.1661019397578;
        Sat, 20 Aug 2022 11:16:37 -0700 (PDT)
Received: from localhost.localdomain (ip5f5abb77.dynamic.kabel-deutschland.de. [95.90.187.119])
        by smtp.gmail.com with ESMTPSA id g2-20020a17090604c200b0072af890f52dsm3887833eja.88.2022.08.20.11.16.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Aug 2022 11:16:37 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 02/19] staging: r8188eu: make rtw_os_xmit_schedule() static
Date: Sat, 20 Aug 2022 20:16:06 +0200
Message-Id: <20220820181623.12497-3-straube.linux@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220820181623.12497-1-straube.linux@gmail.com>
References: <20220820181623.12497-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The function rtw_os_xmit_schedule() is only used in rtw_mlme.c.
Make it static.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_mlme.c      | 17 +++++++++++++++++
 drivers/staging/r8188eu/include/xmit_osdep.h |  2 --
 drivers/staging/r8188eu/os_dep/xmit_linux.c  | 17 -----------------
 3 files changed, 17 insertions(+), 19 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_mlme.c b/drivers/staging/r8188eu/core/rtw_mlme.c
index e3cf3e8962fb..c7f69f7918b8 100644
--- a/drivers/staging/r8188eu/core/rtw_mlme.c
+++ b/drivers/staging/r8188eu/core/rtw_mlme.c
@@ -641,6 +641,23 @@ void rtw_survey_event_callback(struct adapter	*adapter, u8 *pbuf)
 	spin_unlock_bh(&pmlmepriv->lock);
 }
 
+static void rtw_os_xmit_schedule(struct adapter *padapter)
+{
+	struct xmit_priv *pxmitpriv;
+
+	if (!padapter)
+		return;
+
+	pxmitpriv = &padapter->xmitpriv;
+
+	spin_lock_bh(&pxmitpriv->lock);
+
+	if (rtw_txframes_pending(padapter))
+		tasklet_hi_schedule(&pxmitpriv->xmit_tasklet);
+
+	spin_unlock_bh(&pxmitpriv->lock);
+}
+
 void rtw_surveydone_event_callback(struct adapter	*adapter, u8 *pbuf)
 {
 	struct	mlme_priv *pmlmepriv = &adapter->mlmepriv;
diff --git a/drivers/staging/r8188eu/include/xmit_osdep.h b/drivers/staging/r8188eu/include/xmit_osdep.h
index 55347de455c8..5a09355a142a 100644
--- a/drivers/staging/r8188eu/include/xmit_osdep.h
+++ b/drivers/staging/r8188eu/include/xmit_osdep.h
@@ -30,8 +30,6 @@ struct xmit_buf;
 
 int rtw_xmit_entry(struct sk_buff *pkt, struct  net_device *pnetdev);
 
-void rtw_os_xmit_schedule(struct adapter *padapter);
-
 int rtw_os_xmit_resource_alloc(struct adapter *padapter,
 			       struct xmit_buf *pxmitbuf, u32 alloc_sz);
 void rtw_os_xmit_resource_free(struct adapter *padapter,
diff --git a/drivers/staging/r8188eu/os_dep/xmit_linux.c b/drivers/staging/r8188eu/os_dep/xmit_linux.c
index 33400a9b08e1..9759ff5ea76d 100644
--- a/drivers/staging/r8188eu/os_dep/xmit_linux.c
+++ b/drivers/staging/r8188eu/os_dep/xmit_linux.c
@@ -105,23 +105,6 @@ void rtw_os_xmit_complete(struct adapter *padapter, struct xmit_frame *pxframe)
 	pxframe->pkt = NULL;
 }
 
-void rtw_os_xmit_schedule(struct adapter *padapter)
-{
-	struct xmit_priv *pxmitpriv;
-
-	if (!padapter)
-		return;
-
-	pxmitpriv = &padapter->xmitpriv;
-
-	spin_lock_bh(&pxmitpriv->lock);
-
-	if (rtw_txframes_pending(padapter))
-		tasklet_hi_schedule(&pxmitpriv->xmit_tasklet);
-
-	spin_unlock_bh(&pxmitpriv->lock);
-}
-
 static void rtw_check_xmit_resource(struct adapter *padapter, struct sk_buff *pkt)
 {
 	struct xmit_priv *pxmitpriv = &padapter->xmitpriv;
-- 
2.37.2

