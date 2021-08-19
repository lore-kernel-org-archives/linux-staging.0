Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 240AB2FAD
	for <linux-staging@lists.linux.dev>; Thu, 19 Aug 2021 12:50:17 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id d11so12658597eja.8
        for <linux-staging@lists.linux.dev>; Thu, 19 Aug 2021 05:50:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dlk61iWrvdXGSmZ6Z0iCNse6iHDCWylNCH2RB7n2MT8=;
        b=itDdcR8SpGo0HQ1jFTHOmvo4REOsaCxgJQwemJN3AG2IqoB1oK7WHW4jnxZoIuASkd
         dqjNNQihM1cTpV0I39Q2x2aYZjJEf4Z/rPrsFWFiOBN691dqh6HzCcMy7Wepc0S17jZQ
         PKiBm1GYnZz9kFL+nTPc4NOBWSxfMPMxoX9Q5zm7mHIewnnN4MlxYd/HeIimwdIzPRsK
         NIKSNHZlSx5pxJ6iyD+kFmhGBb53/WHNK9E6eXJ3Hn+shGro+JrJ7dU/YnJXhVvS7uL0
         vhEgvgn4AeKdb72eZlLAkgpMGGz959nbsmQ3an7gqbJnE1qOgOkRhLvhGZ+38HqaTf/z
         8P+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dlk61iWrvdXGSmZ6Z0iCNse6iHDCWylNCH2RB7n2MT8=;
        b=XkQwRKUVuhisjr2qM070C1knNaMRsxQTorQli1hBlcPlQuFbCb4dZYwRWC6pXlNj51
         Ygl50Th/YLq9VYO/Osga2NTx1tHqM2G8pkAHgR6mYOqTSaWrQqykzjlH1VFqGlQgOh5F
         hlmUu4dkySdSEVRDJDOuI+9zWR9xUSwb+IS3GacEX0X7pnjSlzaIS7PuUTd3rpmXz3BG
         ZFRSUMwZ+FqlBuBarxdE8JupBmeK+toaADuOPxPjYQYXXbthrXhTf4Y/JXU6gC7DjU87
         +2E29dJikmJ64MGxtYAZkK6P5iANGLl8vgJ/0aDmYWnOL8EiltZaBdXSMBSDCYGTmAaZ
         RdPg==
X-Gm-Message-State: AOAM530vj8QzXno5g4585/c76M+gCEl50KPQNjmMxu7CrnqCyee/OJ2h
	m5jeucBIxSMkoPue2J0q+kM=
X-Google-Smtp-Source: ABdhPJxsZqqHQws3NT6BwHUlVngOL38XOjoRGkOZBH6lWJVyQVAqO66Ikcjbodt1+J3MmlUvL/Qa2w==
X-Received: by 2002:a17:906:a018:: with SMTP id p24mr15546269ejy.349.1629377415458;
        Thu, 19 Aug 2021 05:50:15 -0700 (PDT)
Received: from localhost.localdomain.it (host-79-22-100-164.retail.telecomitalia.it. [79.22.100.164])
        by smtp.gmail.com with ESMTPSA id c8sm1222305ejp.124.2021.08.19.05.50.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Aug 2021 05:50:14 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Martin Kaiser <martin@kaiser.cx>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Subject: [PATCH v2] staging: r8188eu: Remove _enter/_exit_critical_mutex()
Date: Thu, 19 Aug 2021 14:49:55 +0200
Message-Id: <20210819124955.25540-1-fmdefrancesco@gmail.com>
X-Mailer: git-send-email 2.32.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove _enter_critical_mutex() and _exit_critical_mutex(). They are
unnecessary wrappers, respectively to mutex_lock_interruptible() and
to mutex_unlock(). They also have an odd interface that takes an
unused argument named pirqL of type unsigned long.
Replace them with the in-kernel API. Ignore return values as it was
in the old code.

Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
---

v2: Ignore return values from Mutexes API.

 drivers/staging/r8188eu/core/rtw_mlme_ext.c     |  5 +++--
 drivers/staging/r8188eu/hal/usb_ops_linux.c     |  5 +++--
 drivers/staging/r8188eu/include/osdep_service.h | 13 -------------
 drivers/staging/r8188eu/os_dep/os_intfs.c       |  5 +++--
 4 files changed, 9 insertions(+), 19 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_mlme_ext.c b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
index 5325fe41fbee..9f53cab33333 100644
--- a/drivers/staging/r8188eu/core/rtw_mlme_ext.c
+++ b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
@@ -4359,7 +4359,8 @@ s32 dump_mgntframe_and_wait_ack(struct adapter *padapter, struct xmit_frame *pmg
 	if (padapter->bSurpriseRemoved || padapter->bDriverStopped)
 		return -1;
 
-	_enter_critical_mutex(&pxmitpriv->ack_tx_mutex, NULL);
+	if (mutex_lock_interruptible(&pxmitpriv->ack_tx_mutex))
+		;	/*ignore return value */
 	pxmitpriv->ack_tx = true;
 
 	pmgntframe->ack_report = 1;
@@ -4368,7 +4369,7 @@ s32 dump_mgntframe_and_wait_ack(struct adapter *padapter, struct xmit_frame *pmg
 	}
 
 	pxmitpriv->ack_tx = false;
-	_exit_critical_mutex(&pxmitpriv->ack_tx_mutex, NULL);
+	mutex_unlock(&pxmitpriv->ack_tx_mutex);
 
 	return ret;
 }
diff --git a/drivers/staging/r8188eu/hal/usb_ops_linux.c b/drivers/staging/r8188eu/hal/usb_ops_linux.c
index 953fa05dc30c..120d6e2c6065 100644
--- a/drivers/staging/r8188eu/hal/usb_ops_linux.c
+++ b/drivers/staging/r8188eu/hal/usb_ops_linux.c
@@ -32,7 +32,8 @@ static int usbctrl_vendorreq(struct intf_hdl *pintfhdl, u16 value, void *pdata,
 		goto exit;
 	}
 
-	_enter_critical_mutex(&dvobjpriv->usb_vendor_req_mutex, NULL);
+	if (mutex_lock_interruptible(&dvobjpriv->usb_vendor_req_mutex))
+		;	/* ignore return value */
 
 	/*  Acquire IO memory for vendorreq */
 	pIo_buf = dvobjpriv->usb_vendor_req_buf;
@@ -96,7 +97,7 @@ static int usbctrl_vendorreq(struct intf_hdl *pintfhdl, u16 value, void *pdata,
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
index 1aa65925e1da..3823042256a6 100644
--- a/drivers/staging/r8188eu/os_dep/os_intfs.c
+++ b/drivers/staging/r8188eu/os_dep/os_intfs.c
@@ -1065,9 +1065,10 @@ int netdev_open(struct net_device *pnetdev)
 	int ret;
 	struct adapter *padapter = (struct adapter *)rtw_netdev_priv(pnetdev);
 
-	_enter_critical_mutex(padapter->hw_init_mutex, NULL);
+	if (mutex_lock_interruptible(padapter->hw_init_mutex))
+		;	/* ignore return value */
 	ret = _netdev_open(pnetdev);
-	_exit_critical_mutex(padapter->hw_init_mutex, NULL);
+	mutex_unlock(padapter->hw_init_mutex);
 	return ret;
 }
 
-- 
2.32.0

