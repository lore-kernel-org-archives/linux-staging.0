Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEC4E72
	for <linux-staging@lists.linux.dev>; Fri, 22 Oct 2021 17:19:38 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id l13so4316686edi.8
        for <linux-staging@lists.linux.dev>; Fri, 22 Oct 2021 10:19:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Fc2M2n/Ujvx3JC5y1BrKvmu6wHRj6aoeAosOblV9VJM=;
        b=IXVS0wkk+tc70BvFj8qo4HpjBaFtU+hpDI6eSbtzKsZn0LQaFZ0oaN381B/5zVZH7u
         MghqDZY8IlxAAm9Ys+HHyQhj91owXV7pfL87fXewgTAYq4u1LdqKq8lkOaZOYVbjLbXj
         2Lnuj9c1LRFv70pFzpWW0ut6TVoJMKzNQZlnJQACSk0rxckH1S7Gn2M2g9b79p/Fksm4
         2T1KKWpvfU5hWXY3rj3yKDuXXwIbZyaG2KzflGQwflWQGOn0Obah/FU9h98KiXhLc1+4
         Qleb9NXSjyWNlNhjBr3uDaVIoSOWVGdp5LHbMMZ3P7rG++Q4igloevGFBeNoSAJGSTD8
         qeuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Fc2M2n/Ujvx3JC5y1BrKvmu6wHRj6aoeAosOblV9VJM=;
        b=bolUZyo2VHkG2O6CpmXP5XcjgjPiiO9fyuBOWq/6ePm9ZHSngWrKp3cFB5vQRqzXS4
         Dc2oaw8sIZ46M2GoU7lxE4SPvX8e35OPDi2lx7rBv2ypSeBJu5InKM9v4v147bfJFFMQ
         T1IGcCoiWkR8WyplNpnEyVpeVa9Z5YuabegGbctt1xKVf96VidFUADMoX7hEfLJE+Ce7
         pTD9VrVuRC2h50J2NJmsEIVZT78crx7b/Qa/VP6tdBDELnlGNDhGINa+DCSyvegJWSTJ
         bUY5AeyFP8X3szR2eMEhxnTQD13+J/6AetlEi+kNZaqhHeXKB8hc3Yc9uIzMpMKGPHg4
         oUdg==
X-Gm-Message-State: AOAM532pGzGpfgwf1177hl8ZUkj27RYdBnmWJllCY2O4hcGi28csttiH
	oE5ClG790YAo1MlhzZR3ux0=
X-Google-Smtp-Source: ABdhPJz5V/REUPGOqVcWfrlMz3cTMrkpBfJzEqLpjTs+k7PbAGcRvB7vkyx9VHXhD5hH1LLb6sgYuQ==
X-Received: by 2002:a05:6402:34d0:: with SMTP id w16mr1658824edc.98.1634923177164;
        Fri, 22 Oct 2021 10:19:37 -0700 (PDT)
Received: from localhost.localdomain.it (host-80-181-148-119.pool80181.interbusiness.it. [80.181.148.119])
        by smtp.gmail.com with ESMTPSA id dd3sm3995446ejb.55.2021.10.22.10.19.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Oct 2021 10:19:36 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Subject: [PATCH] staging: r8188eu: Use a Mutex instead of a binary Semaphore
Date: Fri, 22 Oct 2021 19:19:17 +0200
Message-Id: <20211022171917.24363-1-fmdefrancesco@gmail.com>
X-Mailer: git-send-email 2.33.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use a Mutex instead of a binary Semaphore for the purpose of enforcing
mutual exclusive access to the "pwrctrl_priv" structure.

Mutexes are sleeping locks similar to Semaphores with a 'count' of one
(like binary Semaphores), however they have a simpler interface, more
efficient performance, and additional constraints.

There is no change in the logic of the new code; however it is more
simple because it gets rid of four unnecessary wrappers:
_init_pwrlock(), _enter_pwrlock(),_exit_pwrlock(), _rtw_down_sema().

Actually, there is a change in the state in which the code waits for
acquiring locks, because it makes it in an uninterruptible state
(instead the old code used down_interruptibe()). Interruptible
waits are neither required nor wanted in this driver.

Tested with ASUSTek Computer, Inc. Realtek 8188EUS [USB-N10 Nano].

Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_pwrctrl.c      | 10 +++++-----
 drivers/staging/r8188eu/include/osdep_service.h |  2 --
 drivers/staging/r8188eu/include/rtw_pwrctrl.h   | 17 +----------------
 drivers/staging/r8188eu/os_dep/osdep_service.c  |  8 --------
 drivers/staging/r8188eu/os_dep/usb_intf.c       |  8 ++++----
 5 files changed, 10 insertions(+), 35 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_pwrctrl.c b/drivers/staging/r8188eu/core/rtw_pwrctrl.c
index 19cac5814ea4..5d595cf2a47e 100644
--- a/drivers/staging/r8188eu/core/rtw_pwrctrl.c
+++ b/drivers/staging/r8188eu/core/rtw_pwrctrl.c
@@ -21,7 +21,7 @@ void ips_enter(struct adapter *padapter)
 		return;
 	}
 
-	_enter_pwrlock(&pwrpriv->lock);
+	mutex_lock(&pwrpriv->lock);
 
 	pwrpriv->bips_processing = true;
 
@@ -42,7 +42,7 @@ void ips_enter(struct adapter *padapter)
 	}
 	pwrpriv->bips_processing = false;
 
-	_exit_pwrlock(&pwrpriv->lock);
+	mutex_unlock(&pwrpriv->lock);
 }
 
 int ips_leave(struct adapter *padapter)
@@ -53,7 +53,7 @@ int ips_leave(struct adapter *padapter)
 	int result = _SUCCESS;
 	int keyid;
 
-	_enter_pwrlock(&pwrpriv->lock);
+	mutex_lock(&pwrpriv->lock);
 
 	if ((pwrpriv->rf_pwrstate == rf_off) && (!pwrpriv->bips_processing)) {
 		pwrpriv->bips_processing = true;
@@ -87,7 +87,7 @@ int ips_leave(struct adapter *padapter)
 		pwrpriv->bpower_saving = false;
 	}
 
-	_exit_pwrlock(&pwrpriv->lock);
+	mutex_unlock(&pwrpriv->lock);
 
 	return result;
 }
@@ -337,7 +337,7 @@ void rtw_init_pwrctrl_priv(struct adapter *padapter)
 {
 	struct pwrctrl_priv *pwrctrlpriv = &padapter->pwrctrlpriv;
 
-	_init_pwrlock(&pwrctrlpriv->lock);
+	mutex_init(&pwrctrlpriv->lock);
 	pwrctrlpriv->rf_pwrstate = rf_on;
 	pwrctrlpriv->ips_enter_cnts = 0;
 	pwrctrlpriv->ips_leave_cnts = 0;
diff --git a/drivers/staging/r8188eu/include/osdep_service.h b/drivers/staging/r8188eu/include/osdep_service.h
index 886a1b6f30b4..efab3a97eb46 100644
--- a/drivers/staging/r8188eu/include/osdep_service.h
+++ b/drivers/staging/r8188eu/include/osdep_service.h
@@ -141,8 +141,6 @@ extern unsigned char RSN_TKIP_CIPHER[4];
 
 void *rtw_malloc2d(int h, int w, int size);
 
-u32  _rtw_down_sema(struct semaphore *sema);
-
 #define rtw_init_queue(q)					\
 	do {							\
 		INIT_LIST_HEAD(&((q)->queue));			\
diff --git a/drivers/staging/r8188eu/include/rtw_pwrctrl.h b/drivers/staging/r8188eu/include/rtw_pwrctrl.h
index 04236e42fbf9..b19ef796ab54 100644
--- a/drivers/staging/r8188eu/include/rtw_pwrctrl.h
+++ b/drivers/staging/r8188eu/include/rtw_pwrctrl.h
@@ -27,21 +27,6 @@ enum power_mgnt {
 	PS_MODE_NUM
 };
 
-static inline void _init_pwrlock(struct semaphore  *plock)
-{
-	sema_init(plock, 1);
-}
-
-static inline void _enter_pwrlock(struct semaphore  *plock)
-{
-	_rtw_down_sema(plock);
-}
-
-static inline void _exit_pwrlock(struct semaphore  *plock)
-{
-	up(plock);
-}
-
 #define LPS_DELAY_TIME	1*HZ /*  1 sec */
 
 /*  RF state. */
@@ -60,7 +45,7 @@ enum { /*  for ips_mode */
 };
 
 struct pwrctrl_priv {
-	struct semaphore lock;
+	struct mutex lock; /* Mutex used to protect struct pwrctrl_priv */
 
 	u8	pwr_mode;
 	u8	smart_ps;
diff --git a/drivers/staging/r8188eu/os_dep/osdep_service.c b/drivers/staging/r8188eu/os_dep/osdep_service.c
index 6bee194fc35d..59bdd0abea7e 100644
--- a/drivers/staging/r8188eu/os_dep/osdep_service.c
+++ b/drivers/staging/r8188eu/os_dep/osdep_service.c
@@ -42,14 +42,6 @@ Otherwise, there will be racing condition.
 Caller must check if the list is empty before calling rtw_list_delete
 */
 
-u32 _rtw_down_sema(struct semaphore *sema)
-{
-	if (down_interruptible(sema))
-		return _FAIL;
-	else
-		return _SUCCESS;
-}
-
 inline u32 rtw_systime_to_ms(u32 systime)
 {
 	return systime * 1000 / HZ;
diff --git a/drivers/staging/r8188eu/os_dep/usb_intf.c b/drivers/staging/r8188eu/os_dep/usb_intf.c
index 7ed9f5f54472..fc74c93272a8 100644
--- a/drivers/staging/r8188eu/os_dep/usb_intf.c
+++ b/drivers/staging/r8188eu/os_dep/usb_intf.c
@@ -233,7 +233,7 @@ static int rtw_suspend(struct usb_interface *pusb_intf, pm_message_t message)
 	rtw_cancel_all_timer(padapter);
 	LeaveAllPowerSaveMode(padapter);
 
-	_enter_pwrlock(&pwrpriv->lock);
+	mutex_lock(&pwrpriv->lock);
 	/* s1. */
 	if (pnetdev) {
 		netif_carrier_off(pnetdev);
@@ -262,7 +262,7 @@ static int rtw_suspend(struct usb_interface *pusb_intf, pm_message_t message)
 	rtw_free_network_queue(padapter, true);
 
 	rtw_dev_unload(padapter);
-	_exit_pwrlock(&pwrpriv->lock);
+	mutex_unlock(&pwrpriv->lock);
 
 	if (check_fwstate(pmlmepriv, _FW_UNDER_SURVEY))
 		rtw_indicate_scan_done(padapter, 1);
@@ -291,7 +291,7 @@ static int rtw_resume(struct usb_interface *pusb_intf)
 	pnetdev = padapter->pnetdev;
 	pwrpriv = &padapter->pwrctrlpriv;
 
-	_enter_pwrlock(&pwrpriv->lock);
+	mutex_lock(&pwrpriv->lock);
 	rtw_reset_drv_sw(padapter);
 	if (pwrpriv)
 		pwrpriv->bkeepfwalive = false;
@@ -303,7 +303,7 @@ static int rtw_resume(struct usb_interface *pusb_intf)
 	netif_device_attach(pnetdev);
 	netif_carrier_on(pnetdev);
 
-	_exit_pwrlock(&pwrpriv->lock);
+	mutex_unlock(&pwrpriv->lock);
 
 	if (padapter->pid[1] != 0) {
 		DBG_88E("pid[1]:%d\n", padapter->pid[1]);
-- 
2.33.1

