Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EABF93C2F
	for <linux-staging@lists.linux.dev>; Sun,  7 Aug 2022 18:15:50 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id k26so12896465ejx.5
        for <linux-staging@lists.linux.dev>; Sun, 07 Aug 2022 11:15:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=P1gpPfsIodgVIm9G1P/vlOiWdjuJeR0qp5ZcVhGWLIY=;
        b=ilNRWUIP5/wjwpue37LpskO1atBfOqpfrMJvdwKfooYdaBha//xLc5rvf7cQYQ+55n
         tmKQm1lri9ijUzyhz9tSQMTbYZxntl+clNUotA4ihpNwFpaevpTXRNpgCSqfMpxJc/v/
         /kjMuy6ntVq8HeMy3rZixPWUrXHIxA6np/KlHucaoyd9QqhOUG7Bxq7FNuGuZQhUC0vF
         oI4NcrDNayFYmEAlvJx2vfTvfPAHionobX2EpI8F67A92silFUHaPNGYrRuBjMmAAMAP
         EH1HjErNwCKfHbzj/KCaeKqtFP4GKYqPwQy07foy0VebrWWuwKgazjXTBj6Vjh2caFR8
         3pdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=P1gpPfsIodgVIm9G1P/vlOiWdjuJeR0qp5ZcVhGWLIY=;
        b=zcnVJMgJNYnQFhoaCrv0r5Glxp4gQoGciAFOuKCpp9RfWTH10zUh72CwsH/S+PoJC3
         562a2EgW7YGnLisu/jt3icAcG4hpoqUw427NRtmIKg5NsCI0Lmh7XrKQMi9EzN24wUGO
         ELOHylUGwlAwyGN6z8BS8zIWJd3Eh9R7aCAR2bVzDKptUErCjOJ06HJC8RTHeqMmk/5b
         kuP/6R9oFQ6C3tB2oIiQQgpgvbjlG1h1Acte5U2b7k+1W+KjyUBS7vUippbGFODvX8s7
         VLsc66Q0Vj5Oj7IFdDvjacIxj87yltM5TWYwc6tqJ5HolI/9YZwXd6QqBPkhgDv+3z7b
         2MBA==
X-Gm-Message-State: ACgBeo1yTKwSlO7ecvvs0ueBbSLF5eQ5U/1nZWeCCMotkymM0XEl+i4/
	jAv79f68Sw9KXAYlmMyNf0nf1tQfiw8=
X-Google-Smtp-Source: AA6agR5wlbk8paOgeHLrs/Tr+hb1rk+jzDakLxQCMn+54H/5X/x8IIyjFumMB5cDJjCjbYZHLui3DQ==
X-Received: by 2002:a17:907:7d91:b0:72b:4d74:f4f6 with SMTP id oz17-20020a1709077d9100b0072b4d74f4f6mr11228474ejc.314.1659896149366;
        Sun, 07 Aug 2022 11:15:49 -0700 (PDT)
Received: from localhost.localdomain (ip5f5abb84.dynamic.kabel-deutschland.de. [95.90.187.132])
        by smtp.gmail.com with ESMTPSA id b7-20020a17090630c700b0072b92daef1csm4157441ejb.146.2022.08.07.11.15.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Aug 2022 11:15:49 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 1/5] staging: r8188eu: merge rtw_os_recvbuf_resource_free() into rtw_recv.c
Date: Sun,  7 Aug 2022 20:15:34 +0200
Message-Id: <20220807181538.8499-2-straube.linux@gmail.com>
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

The function rtw_os_recvbuf_resource_free() is just a wrapper around
usb_free_urb(). Call usb_free_urb() directly in
rtl8188eu_free_recv_priv() and remove rtw_os_recvbuf_resource_free()
to simplify the driver code.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_recv.c      | 2 +-
 drivers/staging/r8188eu/include/recv_osdep.h | 1 -
 drivers/staging/r8188eu/os_dep/recv_linux.c  | 8 --------
 3 files changed, 1 insertion(+), 10 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_recv.c b/drivers/staging/r8188eu/core/rtw_recv.c
index 2d4baca804e9..7a97c090f297 100644
--- a/drivers/staging/r8188eu/core/rtw_recv.c
+++ b/drivers/staging/r8188eu/core/rtw_recv.c
@@ -159,7 +159,7 @@ static void rtl8188eu_free_recv_priv(struct adapter *padapter)
 	precvbuf = (struct recv_buf *)precvpriv->precv_buf;
 
 	for (i = 0; i < NR_RECVBUFF; i++) {
-		rtw_os_recvbuf_resource_free(padapter, precvbuf);
+		usb_free_urb(precvbuf->purb);
 		precvbuf++;
 	}
 
diff --git a/drivers/staging/r8188eu/include/recv_osdep.h b/drivers/staging/r8188eu/include/recv_osdep.h
index ca8a613508fd..b9dc32c20cfd 100644
--- a/drivers/staging/r8188eu/include/recv_osdep.h
+++ b/drivers/staging/r8188eu/include/recv_osdep.h
@@ -20,7 +20,6 @@ int rtw_init_recv_priv(struct recv_priv *precvpriv, struct adapter *padapter);
 void rtw_free_recv_priv(struct recv_priv *precvpriv);
 
 int rtw_os_recvbuf_resource_alloc(struct adapter *adapt, struct recv_buf *buf);
-int rtw_os_recvbuf_resource_free(struct adapter *adapt, struct recv_buf *buf);
 
 void rtw_init_recv_timer(struct recv_reorder_ctrl *preorder_ctrl);
 int _netdev_open(struct net_device *pnetdev);
diff --git a/drivers/staging/r8188eu/os_dep/recv_linux.c b/drivers/staging/r8188eu/os_dep/recv_linux.c
index 1e14b6d49795..abdb42ab649b 100644
--- a/drivers/staging/r8188eu/os_dep/recv_linux.c
+++ b/drivers/staging/r8188eu/os_dep/recv_linux.c
@@ -26,14 +26,6 @@ int rtw_os_recvbuf_resource_alloc(struct adapter *padapter,
 	return res;
 }
 
-/* free os related resource in struct recv_buf */
-int rtw_os_recvbuf_resource_free(struct adapter *padapter,
-				 struct recv_buf *precvbuf)
-{
-	usb_free_urb(precvbuf->purb);
-	return _SUCCESS;
-}
-
 void rtw_handle_tkip_mic_err(struct adapter *padapter, u8 bgroup)
 {
 	union iwreq_data wrqu;
-- 
2.37.1

