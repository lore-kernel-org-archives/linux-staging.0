Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D24853FC8
	for <linux-staging@lists.linux.dev>; Wed, 22 Sep 2021 20:05:52 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id u15so10387336wru.6
        for <linux-staging@lists.linux.dev>; Wed, 22 Sep 2021 13:05:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qI/xLHpU06C05zRaDpeIlkhzxTRXSNV1nXcZzQIB8+w=;
        b=ji0iPTheDQSsb1QkLd54H9X5vXszvdOo/6q8nheN4ElsmFgRXPAo5zaFiznUDiqX6T
         60mVAKtAjni2DRcZuxUm5hY0MSaNk99/SrBZVfZhVkEAbs5yLRRny7xhqeRV6jbVPaHf
         bo+Ec+UGj48ofb8HQyQaQba9J8TknleqH03BlTCO15mgNMNA9GbsntH1mZdhojrQuwXo
         w2Cv0Zwv7Msehuw0g7jXhL3mzipPhVrJZ5xW5VYJOeEKyqwEOOwusKv256Z64rlGeW+h
         zrx9DhopetXokMadsGTVIIRFgZAYCTbMl4m12qliz1YihN1BA2EokfHx6MWh9uZ9Ihhi
         WGQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qI/xLHpU06C05zRaDpeIlkhzxTRXSNV1nXcZzQIB8+w=;
        b=nMM8VY/wnBu1tuDq2UH2IyBKpSsHUBPr1KOoQlJnAmNialpjiioPdNvCOsjX6GcJfG
         h5D0GCrvzOpQ2yI+JFnELSP5C2gAY+cthinVn2u8ZGemwcjvlELhdSytcAhDcVu1Q7qS
         PLh1Qe1nDG9zm0z90YJ3Kd4t285g0i1Zw02pCPlGav2N8TGl4LqzR4rsz4PPaFTZJoWE
         b1RT6Ilts4QQ6vh+G9DI/fKahfCzjF1DxfCI9bdD4hlrVR3lKGA8bvDLEE3TE1fhbpy2
         x27C5gqj+t9BstwosE5BEp4j6Jb4xRvzW7W4aJ/EY0BkOavR+f3iNtSU5lA+NcgeHXr0
         IQ5g==
X-Gm-Message-State: AOAM532DfUF87Bv11EaWFBjz39qIxKjmxYtf7YnJwzTICvs+kvNvsa7v
	5V4OtWEB6dXpxNmZ1NPZmKEZFxxLsUTF1Q==
X-Google-Smtp-Source: ABdhPJyZFvMTkEm+F9vHpOBpL4InsZisXhOYJajF5UVgLHe4mkCyGBSLd1rniuWIPzkKliPTY5T9Og==
X-Received: by 2002:a05:6000:11ca:: with SMTP id i10mr859330wrx.317.1632341151379;
        Wed, 22 Sep 2021 13:05:51 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::cde])
        by smtp.gmail.com with ESMTPSA id e2sm3219761wra.40.2021.09.22.13.05.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Sep 2021 13:05:51 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 28/47] staging: r8188eu: remove rtw_os_read_port()
Date: Wed, 22 Sep 2021 22:04:01 +0200
Message-Id: <20210922200420.9693-29-straube.linux@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210922200420.9693-1-straube.linux@gmail.com>
References: <20210922200420.9693-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Function rtw_os_read_port() is not used, remove it.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/include/recv_osdep.h |  2 --
 drivers/staging/r8188eu/os_dep/recv_linux.c  | 14 --------------
 2 files changed, 16 deletions(-)

diff --git a/drivers/staging/r8188eu/include/recv_osdep.h b/drivers/staging/r8188eu/include/recv_osdep.h
index 72ddf515071e..e87467022b39 100644
--- a/drivers/staging/r8188eu/include/recv_osdep.h
+++ b/drivers/staging/r8188eu/include/recv_osdep.h
@@ -27,8 +27,6 @@ void rtw_os_recv_resource_free(struct recv_priv *precvpriv);
 int rtw_os_recvbuf_resource_alloc(struct adapter *adapt, struct recv_buf *buf);
 int rtw_os_recvbuf_resource_free(struct adapter *adapt, struct recv_buf *buf);
 
-void rtw_os_read_port(struct adapter *padapter, struct recv_buf *precvbuf);
-
 void rtw_init_recv_timer(struct recv_reorder_ctrl *preorder_ctrl);
 int _netdev_open(struct net_device *pnetdev);
 int netdev_open(struct net_device *pnetdev);
diff --git a/drivers/staging/r8188eu/os_dep/recv_linux.c b/drivers/staging/r8188eu/os_dep/recv_linux.c
index 917a63e3e94c..5a7fb94e21c1 100644
--- a/drivers/staging/r8188eu/os_dep/recv_linux.c
+++ b/drivers/staging/r8188eu/os_dep/recv_linux.c
@@ -186,20 +186,6 @@ int rtw_recv_indicatepkt(struct adapter *padapter,
 	 return _FAIL;
 }
 
-void rtw_os_read_port(struct adapter *padapter, struct recv_buf *precvbuf)
-{
-	struct recv_priv *precvpriv = &padapter->recvpriv;
-
-	precvbuf->ref_cnt--;
-	/* free skb in recv_buf */
-	dev_kfree_skb_any(precvbuf->pskb);
-	precvbuf->pskb = NULL;
-	precvbuf->reuse = false;
-	if (!precvbuf->irp_pending)
-		rtw_read_port(padapter, precvpriv->ff_hwaddr, 0,
-			      (unsigned char *)precvbuf);
-}
-
 static void _rtw_reordering_ctrl_timeout_handler(struct timer_list *t)
 {
 	struct recv_reorder_ctrl *preorder_ctrl;
-- 
2.33.0

