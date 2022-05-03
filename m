Received: from out203-205-221-192.mail.qq.com (out203-205-221-192.mail.qq.com [203.205.221.192])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E47FA17E9
	for <linux-staging@lists.linux.dev>; Tue,  3 May 2022 07:04:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1651561469;
	bh=z7k7wTsvrI8fXqJLaHdr3/8X38tXovOFrYAX07qVmJk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=nSSGsoUadKs78HbB04Psb8nlFPYoG9C1zYJFLgDnjWMnTAwJsbcdwk5dSgPLwpw+p
	 //I2Df3/sNLhJ8kjUoljDA21VqJjaLXVLkGQQ8hskBwdLia3olBjtZcj7g+DE369yS
	 fVifAQvYDrGfnbgMzzOXJSj3LyJ/Y5N/XWgmrsyk=
Received: from localhost.localdomain ([59.172.176.242])
	by newxmesmtplogicsvrszb7.qq.com (NewEsmtp) with SMTP
	id 47B2A2E; Tue, 03 May 2022 15:01:07 +0800
X-QQ-mid: xmsmtpt1651561267tyfxpeng7
Message-ID: <tencent_9F682882C21F9576FFA9407C989373913809@qq.com>
X-QQ-XMAILINFO: OCzxluqIaPHWvIXZHtlLtD7iWT1bC1Lh8aJmKj9qLArGKHdwufoP//lHCAaMd8
	 K5GSnOZOlDOL8hgkCkXL+Q+WIfvUSA14pBo9X5UVbos7ZBAd/Qu+7Gy9+Tg6pQ8oMJ0NQGURqyeL
	 5wQ1M5h/d2sJlcsUbLvoWuSjuTUnjJ4KspaTuzQA8EerXazMLyV60k2Wc6PdAej7q9A4OsYfD8aj
	 WoPLsm3mX/M//RlzkQxdTaovwWEWOhES5yd3NwEVD/gkmjOHghgFZsziSRSakrUGkDuzdQUwzxLr
	 Y2xP5EACCr8FLOSmkHB04cfCIjqXpzy862FUWwkQb0000YFI/OsOMIE8UKeGCY8s/fMRNhCCsc+K
	 8D5nBOR+HqLRUoDLnMEfVFk4a/nRa7g9QKsL6+JyVjKnXd0BOLXcuPQyQSdwZNN9AI//kjwDZwpy
	 kmaZ2m4EzmbFxCKfB3drmARBmM7lHFtiPptER6mNrrG1xJdujU5/W6SdYsgbpuKabc7QqBmK0N/5
	 +qt8EYJP7scz/HUGgEZR63M3Eiv77ofFTeGY3eYE4kRVXMFgWyASU/yVsQZ0oAfQXp2eyk2eODsA
	 ElGL68ZP7Xbh05fl4+iqc5i2qgmIkWvNODfkFBU3dUgW1hoKj+A8nWVsXmQjyhO8bHy829ooWqbl
	 CpWHSd7tuzmQlFIo/lM2t+AEgQvCi7Dq4viNHfa11tsM64qfC9xAbtNKGJLgEN84k4h3AdJDJzrc
	 0ALIM6vPrX8cLv2iGGELaPmOB8ZpmEj0s7aYtbLU9bFUQO1I8fuzXpNocgkiSweBm3rcntcP9zcn
	 gfiyN56KbeD6E19ucV9isyIzv9Pf/5wqM4uwTgeTSnH7u22l/mMEcskW8ut/Bo5F3kXLnPPrSlPQ
	 gjQ2WZ3xnDMPSE2xulbe261sGh5FWko9BqPHYGeHmTabqTl3fUtkma+LN3dqrgK9vwh4kwDYYJox
	 JNTunyMqNxSk5Gl3DyDAwNfcRiz9ofHny4rL4hQF8oIKZBEoHT2Bc92am8I85P
From: xkernel.wang@foxmail.com
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Xiaoke Wang <xkernel.wang@foxmail.com>
Subject: [PATCH 08/12] staging: rtl8723bs: fix potential memory leak in rtw_init_drv_sw()
Date: Tue,  3 May 2022 15:00:57 +0800
X-OQ-MSGID: <20220503070057.3325-1-xkernel.wang@foxmail.com>
In-Reply-To: <tencent_A80380E4306BE7BA73E450F084232B4DFC0A@qq.com>
References: <tencent_A80380E4306BE7BA73E450F084232B4DFC0A@qq.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Xiaoke Wang <xkernel.wang@foxmail.com>

In rtw_init_drv_sw(), there are various init functions are called to
populate the padapter structure and some checks for their return value.
However, except for the first one error path, the other five error paths
do not properly release the previous allocated resources, which leads to
various memory leaks.

This patch fixes this and keeps the success and error separate.

Signed-off-by: Xiaoke Wang <xkernel.wang@foxmail.com>
---
 drivers/staging/rtl8723bs/os_dep/os_intfs.c | 60 +++++++++++----------
 1 file changed, 31 insertions(+), 29 deletions(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/os_intfs.c b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
index 380d8c9..68bba3c 100644
--- a/drivers/staging/rtl8723bs/os_dep/os_intfs.c
+++ b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
@@ -664,51 +664,36 @@ void rtw_reset_drv_sw(struct adapter *padapter)
 
 u8 rtw_init_drv_sw(struct adapter *padapter)
 {
-	u8 ret8 = _SUCCESS;
-
 	rtw_init_default_value(padapter);
 
 	rtw_init_hal_com_default_value(padapter);
 
-	if (rtw_init_cmd_priv(&padapter->cmdpriv)) {
-		ret8 = _FAIL;
-		goto exit;
-	}
+	if (rtw_init_cmd_priv(&padapter->cmdpriv))
+		return _FAIL;
 
 	padapter->cmdpriv.padapter = padapter;
 
-	if (rtw_init_evt_priv(&padapter->evtpriv)) {
-		ret8 = _FAIL;
-		goto exit;
-	}
+	if (rtw_init_evt_priv(&padapter->evtpriv))
+		goto free_cmd_priv;
 
-
-	if (rtw_init_mlme_priv(padapter) == _FAIL) {
-		ret8 = _FAIL;
-		goto exit;
-	}
+	if (rtw_init_mlme_priv(padapter) == _FAIL)
+		goto free_evt_priv;
 
 	init_mlme_ext_priv(padapter);
 
-	if (_rtw_init_xmit_priv(&padapter->xmitpriv, padapter) == _FAIL) {
-		ret8 = _FAIL;
-		goto exit;
-	}
+	if (_rtw_init_xmit_priv(&padapter->xmitpriv, padapter) == _FAIL)
+		goto free_mlme_ext;
 
-	if (_rtw_init_recv_priv(&padapter->recvpriv, padapter) == _FAIL) {
-		ret8 = _FAIL;
-		goto exit;
-	}
+	if (_rtw_init_recv_priv(&padapter->recvpriv, padapter) == _FAIL)
+		goto free_xmit_priv;
 	/*  add for CONFIG_IEEE80211W, none 11w also can use */
 	spin_lock_init(&padapter->security_key_mutex);
 
 	/*  We don't need to memset padapter->XXX to zero, because adapter is allocated by vzalloc(). */
 	/* memset((unsigned char *)&padapter->securitypriv, 0, sizeof (struct security_priv)); */
 
-	if (_rtw_init_sta_priv(&padapter->stapriv) == _FAIL) {
-		ret8 = _FAIL;
-		goto exit;
-	}
+	if (_rtw_init_sta_priv(&padapter->stapriv) == _FAIL)
+		goto free_recv_priv;
 
 	padapter->stapriv.padapter = padapter;
 	padapter->setband = GHZ24_50;
@@ -719,9 +704,26 @@ u8 rtw_init_drv_sw(struct adapter *padapter)
 
 	rtw_hal_dm_init(padapter);
 
-exit:
+	return _SUCCESS;
+
+free_recv_priv:
+	_rtw_free_recv_priv(&padapter->recvpriv);
+
+free_xmit_priv:
+	_rtw_free_xmit_priv(&padapter->xmitpriv);
+
+free_mlme_ext:
+	free_mlme_ext_priv(&padapter->mlmeextpriv);
 
-	return ret8;
+	rtw_free_mlme_priv(&padapter->mlmepriv);
+
+free_evt_priv:
+	rtw_free_evt_priv(&padapter->evtpriv);
+
+free_cmd_priv:
+	rtw_free_cmd_priv(&padapter->cmdpriv);
+
+	return _FAIL;
 }
 
 void rtw_cancel_all_timer(struct adapter *padapter)
-- 
