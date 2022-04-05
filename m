Received: from out162-62-57-49.mail.qq.com (out162-62-57-49.mail.qq.com [162.62.57.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5507515A3
	for <linux-staging@lists.linux.dev>; Tue,  5 Apr 2022 04:51:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1649134276;
	bh=ZOWmbRSE1ugYDN4B9+8FobQREdvXAlF1kKgzI2u7cr0=;
	h=From:To:Cc:Subject:Date;
	b=KKkcLFo9IPmJVp1Uj67xgyf1Gd4st36Fo7S5mdn1neRopwJOol+KhMuIvwSkfZaq3
	 B2GzHwU28jHfnmkO9taBMjEb04A90JyZTN0U+SZXz92wUf1ENFfHofCkpmyzUlC3zu
	 GUAaSs23dlTspkRdgMjR3I5cnkhza4dyk0tTh2YY=
Received: from localhost.localdomain ([218.197.153.188])
	by newxmesmtplogicsvrsza9.qq.com (NewEsmtp) with SMTP
	id AD187C0F; Tue, 05 Apr 2022 12:43:17 +0800
X-QQ-mid: xmsmtpt1649133797tybode3xr
Message-ID: <tencent_B8048C592777830380A23A7C4409F9DF1305@qq.com>
X-QQ-XMAILINFO: Nci1v0XuD9lF/UxJPIUnSOW35WJxhNHJ9+ASszE4sLfv8CucVVmCZNiogRzfLA
	 FCueO2kxVwfgM/NnbjiZK+E+XJyJhRwuiBT8F7HDdKMjyH1CChIvlR3Axc1C++TAdWn+UWOmvfmv
	 uF94lvzfEtFV2S7zeuitxu28ku6Rhf/8skdeop9GbjdNtA7sVq9waWY1hedDYT6vinVAYaBc7Hns
	 2c2s3WvD2IPVB2J7qiF0HgGLj2nrIBqKGXlZUcXB+0pVBLoi1PWnrQj/bYQdEBQ0+IvgZqT/eFzx
	 hVuIGMhpi3r8Dj00Cccbdnc8xEqSNLbG0aYf0udQT4bS0kqVB1D7uR12PM/WeD4LeFzYwUIUzib2
	 Tes/qKEpqWiSFbtvV4VFXbK/RwdlCGsJ37J2tQ1PEKDK/WPOfpnLKKlUyBmFFH/8B9xwzy+0zJvw
	 DThKCloCsmnsTdDQGW1mvMhsVM0ITDHUgxlg170tsxA5uDrllGT9EvtZuL3N+FpwNEYTOacQiiIt
	 qear8mS+d6Q/F1TlpQ0D5ZgKgIi2zC+ZGT+chKu4HliSbEFDdP1fBBjI+f6iXgyCZljBzhSmjKH/
	 rRtchvP3GuTO7Mj2sWuxPWMSf79IjRGxWfloPEKsukVhfhnTi+NwdRExQ/XGsFE+E64wnPp+xQ/C
	 SNTRB7YGA8bxyoQknrdgj7WaY4Qp8WLdDuUXwsxUEzuUhtapC/8amBQLRVtxRAlpEHbq15ZqiM1f
	 vEi2c/qQmKPVG7r3r+worYmPOIBbZpdhK5lDk6Q6OcCKh5zjT4HDNmkQdLBmvWUgW5cT24aWrZDR
	 NE9VYuUcR5NE7S29TrUaz4TgTxe+xYejUQuiqixb2aEb3VjNAzW0WrqcomdjVahPMIw1U/3e33OB
	 gXjGbaibi/DfSQx6fyavUq1DanypyU8DEcmMAHMGxqc0wvClVp9m0/OZQqX5iQ4yccM97e2bWcDs
	 ipOKQzFdRCBjEYXM7avw==
From: xkernel.wang@foxmail.com
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	florian.c.schilhabel@googlemail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Xiaoke Wang <xkernel.wang@foxmail.com>
Subject: [PATCH] staging: rtl8712: fix a potential memory leak in r871xu_drv_init()
Date: Tue,  5 Apr 2022 12:43:07 +0800
X-OQ-MSGID: <20220405044307.11297-1-xkernel.wang@foxmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Xiaoke Wang <xkernel.wang@foxmail.com>

In r871xu_drv_init(), if r8712_init_drv_sw() fails, then the memory
allocated by r8712_alloc_io_queue() in r8712_usb_dvobj_init() is not
properly released as there is no action will be performed by
r8712_usb_dvobj_deinit().
To properly release it, we should call r8712_free_io_queue() in
r8712_usb_dvobj_deinit().

Besides, in r871xu_dev_remove(), r8712_usb_dvobj_deinit() will be called
by r871x_dev_unload() under condition `padapter->bup` and
r8712_free_io_queue() is called by r8712_free_drv_sw().
However, r8712_usb_dvobj_deinit() does not rely on `padapter->bup` and
calling r8712_free_io_queue() in r8712_free_drv_sw() is negative for
better understading the code.
So I move r8712_usb_dvobj_deinit() into r871xu_dev_remove(), and remove
r8712_free_io_queue() from r8712_free_drv_sw().

Signed-off-by: Xiaoke Wang <xkernel.wang@foxmail.com>
---
 drivers/staging/rtl8712/os_intfs.c | 1 -
 drivers/staging/rtl8712/usb_intf.c | 6 +++---
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8712/os_intfs.c b/drivers/staging/rtl8712/os_intfs.c
index 28b1684..220fed5 100644
--- a/drivers/staging/rtl8712/os_intfs.c
+++ b/drivers/staging/rtl8712/os_intfs.c
@@ -348,7 +348,6 @@ void r8712_free_drv_sw(struct _adapter *padapter)
 	r8712_free_evt_priv(&padapter->evtpriv);
 	r8712_DeInitSwLeds(padapter);
 	r8712_free_mlme_priv(&padapter->mlmepriv);
-	r8712_free_io_queue(padapter);
 	_free_xmit_priv(&padapter->xmitpriv);
 	_r8712_free_sta_priv(&padapter->stapriv);
 	_r8712_free_recv_priv(&padapter->recvpriv);
diff --git a/drivers/staging/rtl8712/usb_intf.c b/drivers/staging/rtl8712/usb_intf.c
index 8df50e2..8cbd419 100644
--- a/drivers/staging/rtl8712/usb_intf.c
+++ b/drivers/staging/rtl8712/usb_intf.c
@@ -265,6 +265,7 @@ static uint r8712_usb_dvobj_init(struct _adapter *padapter)
 
 static void r8712_usb_dvobj_deinit(struct _adapter *padapter)
 {
+	r8712_free_io_queue(padapter);
 }
 
 void rtl871x_intf_stop(struct _adapter *padapter)
@@ -302,9 +303,6 @@ void r871x_dev_unload(struct _adapter *padapter)
 			rtl8712_hal_deinit(padapter);
 		}
 
-		/*s6.*/
-		if (padapter->dvobj_deinit)
-			padapter->dvobj_deinit(padapter);
 		padapter->bup = false;
 	}
 }
@@ -607,6 +605,8 @@ static void r871xu_dev_remove(struct usb_interface *pusb_intf)
 	/* Stop driver mlme relation timer */
 	r8712_stop_drv_timers(padapter);
 	r871x_dev_unload(padapter);
+	if (padapter->dvobj_deinit)
+		padapter->dvobj_deinit(padapter);
 	r8712_free_drv_sw(padapter);
 	free_netdev(pnetdev);
 
-- 
