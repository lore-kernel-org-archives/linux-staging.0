Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3133F168
	for <linux-staging@lists.linux.dev>; Thu, 19 Aug 2021 06:08:43 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id w5so10418671ejq.2
        for <linux-staging@lists.linux.dev>; Wed, 18 Aug 2021 23:08:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dg8tJtA/mpAsn1Z5f0hfRAUxeWjHIlYjDakwDIUZfgw=;
        b=u2vpZhuPa0bk3gdpVB0eiZye4ynDqANT1dRqy4ZOTuxjj9vyqYql0QtIN8V3Dug6RF
         ov1xGDQMDrugzSENn49CLLTuk0x0Qey2TaoqYltbUm6N1S9Bnmr2qYfMSn0pVZEW9Jno
         JDBWCcffyRgMvntVVQWhe2KFeAMz3V1F9Oh24CEWS6JwK3SevoeqxUe8UVcJf6nKVwDB
         xW8PN2N715dC8vsHaef3aIbqr8rpFEjbI90nv98/aFDYtUsyRx9fapSgaLKzFs/ckW38
         DHIUYPDw6Um4i0VHyvSrkAGuFc73bmAc8dausbC31mw8EaPt+VKL3HV/1rrg1ND6Cg7d
         1ijA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dg8tJtA/mpAsn1Z5f0hfRAUxeWjHIlYjDakwDIUZfgw=;
        b=MGHW6hI+07mVn5mmqX8jOuNkV5Qjujb8M31xK3HYjkNdljQg4Qc++MPNgmPKWZIbRs
         yR1xT43zRxRJp9cbmk1b7+HjCWGE4h+BNxtJN33H/qMunmMyT9y+BYTiZCAVZeuxJ9HM
         H8d1fqjKoUabcfjHWdPJ36sKZ1hVha1uSCPp3xOBw103J8c2a2MJUsccLU8V/oImXFwo
         EWuafleGkCv8VbYjtsUOHLc4ue0DDNb+jVcrLMgnaytAQA2sJxJbe78pLBUZyKNiTm3v
         tkzfdyNRAvKT6/x+lfB8z6qg48FJ0UCtFne82DwdDIGxaEI4y2bZvv1txpiPh9PFEe0o
         7Jrg==
X-Gm-Message-State: AOAM530SMfPUGN15xTLD5q7I9fY5FY3c6IG6o9FiCpUI+ZUFPk7omOjE
	nDWvOElFApNw6Nh0ksfAE9A=
X-Google-Smtp-Source: ABdhPJwvrvXtCMyC6m0oETTT/WyRaRS0cLIlYd5blZmuLKVVRpoHVI/4r05loVqnLr7ZOA18Ju242w==
X-Received: by 2002:a17:906:1416:: with SMTP id p22mr13672241ejc.364.1629353321546;
        Wed, 18 Aug 2021 23:08:41 -0700 (PDT)
Received: from localhost.localdomain (host-79-22-109-211.retail.telecomitalia.it. [79.22.109.211])
        by smtp.gmail.com with ESMTPSA id d22sm782862ejk.5.2021.08.18.23.08.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Aug 2021 23:08:41 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Martin Kaiser <martin@kaiser.cx>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Subject: [PATCH] staging: r8188eu: Remove _enter/_exit_critical_mutex()
Date: Thu, 19 Aug 2021 08:08:37 +0200
Message-Id: <20210819060837.23983-1-fmdefrancesco@gmail.com>
X-Mailer: git-send-email 2.32.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove _enter_critical_mutex() and _exit_critical_mutex(). They are
unnecessary wrappers, respectively to mutex_lock_interruptible and to
mutex_unlock(). They also have an odd interface that takes an unused
second parameter "unsigned long *pirqL".

Use directly the in-kernel API; check and manage the return value of
mutex_lock_interruptible().

Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_mlme_ext.c     |  5 +++--
 drivers/staging/r8188eu/hal/usb_ops_linux.c     |  7 +++++--
 drivers/staging/r8188eu/include/osdep_service.h | 13 -------------
 drivers/staging/r8188eu/os_dep/os_intfs.c       |  5 +++--
 4 files changed, 11 insertions(+), 19 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_mlme_ext.c b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
index f6ee72d5af09..484083468ebb 100644
--- a/drivers/staging/r8188eu/core/rtw_mlme_ext.c
+++ b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
@@ -4358,7 +4358,8 @@ s32 dump_mgntframe_and_wait_ack(struct adapter *padapter, struct xmit_frame *pmg
 	if (padapter->bSurpriseRemoved || padapter->bDriverStopped)
 		return -1;
 
-	_enter_critical_mutex(&pxmitpriv->ack_tx_mutex, NULL);
+	if (mutex_lock_interruptible(&pxmitpriv->ack_tx_mutex))
+		return -EINTR;
 	pxmitpriv->ack_tx = true;
 
 	pmgntframe->ack_report = 1;
@@ -4367,7 +4368,7 @@ s32 dump_mgntframe_and_wait_ack(struct adapter *padapter, struct xmit_frame *pmg
 	}
 
 	pxmitpriv->ack_tx = false;
-	_exit_critical_mutex(&pxmitpriv->ack_tx_mutex, NULL);
+	mutex_unlock(&pxmitpriv->ack_tx_mutex);
 
 	return ret;
 }
diff --git a/drivers/staging/r8188eu/hal/usb_ops_linux.c b/drivers/staging/r8188eu/hal/usb_ops_linux.c
index 953fa05dc30c..52cb32f898e0 100644
--- a/drivers/staging/r8188eu/hal/usb_ops_linux.c
+++ b/drivers/staging/r8188eu/hal/usb_ops_linux.c
@@ -32,7 +32,10 @@ static int usbctrl_vendorreq(struct intf_hdl *pintfhdl, u16 value, void *pdata,
 		goto exit;
 	}
 
-	_enter_critical_mutex(&dvobjpriv->usb_vendor_req_mutex, NULL);
+	if (mutex_lock_interruptible(&dvobjpriv->usb_vendor_req_mutex)) {
+		status = -EINTR;
+		goto exit;
+	}
 
 	/*  Acquire IO memory for vendorreq */
 	pIo_buf = dvobjpriv->usb_vendor_req_buf;
@@ -96,7 +99,7 @@ static int usbctrl_vendorreq(struct intf_hdl *pintfhdl, u16 value, void *pdata,
 			break;
 	}
 release_mutex:
-	_exit_critical_mutex(&dvobjpriv->usb_vendor_req_mutex, NULL);
+	mutex_unlock(&dvobjpriv->usb_vendor_req_mutex);
 exit:
 	return status;
 }
diff --git a/drivers/staging/r8188eu/include/osdep_service.h b/drivers/staging/r8188eu/include/osdep_service.h
index 029aa4e92c9b..bb92b9d74bd7 100644
--- a/drivers/staging/r8188eu/include/osdep_service.h
+++ b/drivers/staging/r8188eu/include/osdep_service.h
@@ -56,19 +56,6 @@ static inline struct list_head *get_list_head(struct __queue *queue)
 	return (&(queue->queue));
 }
 
-static inline int _enter_critical_mutex(struct mutex *pmutex, unsigned long *pirqL)
-{
-	int ret;
-
-	ret = mutex_lock_interruptible(pmutex);
-	return ret;
-}
-
-static inline void _exit_critical_mutex(struct mutex *pmutex, unsigned long *pirqL)
-{
-		mutex_unlock(pmutex);
-}
-
 static inline void rtw_list_delete(struct list_head *plist)
 {
 	list_del_init(plist);
diff --git a/drivers/staging/r8188eu/os_dep/os_intfs.c b/drivers/staging/r8188eu/os_dep/os_intfs.c
index 1aa65925e1da..4768e3a507f6 100644
--- a/drivers/staging/r8188eu/os_dep/os_intfs.c
+++ b/drivers/staging/r8188eu/os_dep/os_intfs.c
@@ -1065,9 +1065,10 @@ int netdev_open(struct net_device *pnetdev)
 	int ret;
 	struct adapter *padapter = (struct adapter *)rtw_netdev_priv(pnetdev);
 
-	_enter_critical_mutex(padapter->hw_init_mutex, NULL);
+	if (mutex_lock_interruptible(padapter->hw_init_mutex))
+		return -EINTR;
 	ret = _netdev_open(pnetdev);
-	_exit_critical_mutex(padapter->hw_init_mutex, NULL);
+	mutex_unlock(padapter->hw_init_mutex);
 	return ret;
 }
 
-- 
2.32.0

