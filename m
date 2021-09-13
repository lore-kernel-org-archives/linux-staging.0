Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9353F3FC3
	for <linux-staging@lists.linux.dev>; Mon, 13 Sep 2021 19:01:32 +0000 (UTC)
Received: from 250.57.4.146.static.wline.lns.sme.cust.swisscom.ch ([146.4.57.250] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1mPrCo-0005LG-UZ; Mon, 13 Sep 2021 21:01:26 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH v2 2/2] staging: r8188eu: remove rtw_hw_resume
Date: Mon, 13 Sep 2021 20:59:57 +0200
Message-Id: <20210913185957.3166-3-martin@kaiser.cx>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210913185957.3166-1-martin@kaiser.cx>
References: <20210911161019.26881-1-martin@kaiser.cx>
 <20210913185957.3166-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The bHWPwrPindetect cleanup removed the only call to rtw_hw_resume.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
v2:
- rebased against today's staging-testing branch

 drivers/staging/r8188eu/include/osdep_intf.h |  1 -
 drivers/staging/r8188eu/os_dep/usb_intf.c    | 39 --------------------
 2 files changed, 40 deletions(-)

diff --git a/drivers/staging/r8188eu/include/osdep_intf.h b/drivers/staging/r8188eu/include/osdep_intf.h
index 5a2c7a98f023..da36770852f8 100644
--- a/drivers/staging/r8188eu/include/osdep_intf.h
+++ b/drivers/staging/r8188eu/include/osdep_intf.h
@@ -58,6 +58,5 @@ void rtw_ips_dev_unload(struct adapter *padapter);
 
 int rtw_ips_pwr_up(struct adapter *padapter);
 void rtw_ips_pwr_down(struct adapter *padapter);
-int rtw_hw_resume(struct adapter *padapter);
 
 #endif	/* _OSDEP_INTF_H_ */
diff --git a/drivers/staging/r8188eu/os_dep/usb_intf.c b/drivers/staging/r8188eu/os_dep/usb_intf.c
index a23b0becb668..c40246bbb4f4 100644
--- a/drivers/staging/r8188eu/os_dep/usb_intf.c
+++ b/drivers/staging/r8188eu/os_dep/usb_intf.c
@@ -278,45 +278,6 @@ static void process_spec_devid(const struct usb_device_id *pdid)
 	}
 }
 
-int rtw_hw_resume(struct adapter *padapter)
-{
-	struct pwrctrl_priv *pwrpriv;
-	struct net_device *pnetdev = padapter->pnetdev;
-
-	if (!padapter)
-		goto error_exit;
-	pwrpriv = &padapter->pwrctrlpriv;
-	DBG_88E("==> rtw_hw_resume\n");
-	_enter_pwrlock(&pwrpriv->lock);
-	pwrpriv->bips_processing = true;
-	rtw_reset_drv_sw(padapter);
-
-	if (pm_netdev_open(pnetdev, false) != 0) {
-		_exit_pwrlock(&pwrpriv->lock);
-		goto error_exit;
-	}
-
-	netif_device_attach(pnetdev);
-	netif_carrier_on(pnetdev);
-
-	if (!netif_queue_stopped(pnetdev))
-		netif_start_queue(pnetdev);
-	else
-		netif_wake_queue(pnetdev);
-
-	pwrpriv->bkeepfwalive = false;
-
-	pwrpriv->rf_pwrstate = rf_on;
-	pwrpriv->bips_processing = false;
-
-	_exit_pwrlock(&pwrpriv->lock);
-
-	return 0;
-error_exit:
-	DBG_88E("%s, Open net dev failed\n", __func__);
-	return -1;
-}
-
 static int rtw_suspend(struct usb_interface *pusb_intf, pm_message_t message)
 {
 	struct dvobj_priv *dvobj = usb_get_intfdata(pusb_intf);
-- 
2.20.1

