Received: from out162-62-57-87.mail.qq.com (out162-62-57-87.mail.qq.com [162.62.57.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9085F801
	for <linux-staging@lists.linux.dev>; Fri,  9 Sep 2022 10:56:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1662720977;
	bh=moyCOVLTLgtvkGdeoqzEJhhH4xd+dkMzT/AaRw4nmAo=;
	h=From:To:Cc:Subject:Date;
	b=udx49WwA7b7Ll96+tAIO3O4zNFJbvIru3dNCgoLO878ETpNWzCiLnVY3DTjh3b6J8
	 FPr0vi8rGGy4ZgUJJrBPTLjugG8J0PHVUkRl6MLcpyZIZsBTuYYgmKOiKfqPnsRGIH
	 S2eAqKxZQoTgdrpxZnZr2iPWfpcii2zrBYeZur3w=
Received: from localhost.localdomain ([59.172.176.188])
	by newxmesmtplogicsvrszc10.qq.com (NewEsmtp) with SMTP
	id A2810C67; Fri, 09 Sep 2022 18:40:40 +0800
X-QQ-mid: xmsmtpt1662720040tnqyheovx
Message-ID: <tencent_C3B899D2FC3F1BC827F3552E0B0734056006@qq.com>
X-QQ-XMAILINFO: NkHKfw09D6j8rYnMFzSHOj7N6uP2cMNaeRcALeO1T4QD1KAoh3JMHQQiA1TJ+w
	 FS1hGJ86uCYUhyRfg4lvZAhzu0juj8KxzyrluLkC8zDCMxNoyK8ikAP6U6Tpac1UY+zh6Zpoa8as
	 Z/Hs1ZzPglfURTRKZ4UDRc39P8JPUHNXa6pQRhqb6sHM03WPHHyvJsWxaBVL9MEy4HK4LvwOAz1x
	 mM4u0rxL1KrFWEWfE7yr3JedMUrJvWGkt78PtXJLEyGBg/DokOX8nVBqG06/nM+4zfHsdbieJ5rW
	 hYuPRUYA2WVFzqRmDfVVhOL8rCCi7ZtA45jgJhwbFwQ55Tl3vzRUXF6TKL7WLohzYrixTULVXDi8
	 urNA1vfqAdEqAIx51zztri3JjJZtxr/iSTsKImqutIgrfRxoVx7NEYdbuZeTbidjn89QNnmKsIxL
	 2lnOLCE0Go7wGzeWZaEEkg3+6AlpTMhWgaD/NWp+VLYQ0kuGBb1XUwyo0mheWYcCrFPDvN0jpoU1
	 SwEHh1Qmdj1Sy0e+huwnHTodLmRLu+RTXaDgJND71czc8Ou3mh6K7kBN4xCkGamZG54tperF94lB
	 eTsfXKYXoKeVOKxnWNI3f5zRmxTvQM2co/5l6f9WcQ3pHwtGeHQmFDEGAfA7wdB4JWp3LML4Hdw9
	 SrDjAtZOJ44tpF10GQbpnunzYYmS9IVXnM28AI8cxpmHglZYRcYIy08H9KBTtf7XqZZoLzA6VnE0
	 lGFlxT68tnNc+pZ7G32r4fDsb7NP5faKw6P8K4LVzJdYPGKDwEMeeEVXHYBLIkRyaGKsXOGuGCDt
	 ihbxDy1bTo0Ik0c34YkcRJrMUKtwLlZJzcLNq2hn14FQayyAa9lOJbMbls/uVfPMHYVsgoPSMrBg
	 bjnWYEAmaWQZOP3RxgB9IcO0sovbR40VWdzVfyUL4yfAlO0/J2B6gAQ0UClAxVSMehq991uFmQFJ
	 j+K15UbQbuvlRieT3GeV4Yx97Q37pMeDUjj8HQWGZ+E05aB62BjXxMBwfBSw3kXcU1+QhgbPo=
From: xkernel.wang@foxmail.com
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Xiaoke Wang <xkernel.wang@foxmail.com>
Subject: [PATCH v4] staging: rtl8723bs: fix potential memory leak in rtw_init_drv_sw()
Date: Fri,  9 Sep 2022 18:39:35 +0800
X-OQ-MSGID: <20220909103935.3196-1-xkernel.wang@foxmail.com>
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

This patch fixes them and keeps the success and error separate.
Note that these changes keep the form of `rtw_init_drv_sw()` in
"drivers/staging/r8188eu/os_dep/os_intfs.c". As there is no proper device
to test with, no runtime testing was performed.

Signed-off-by: Xiaoke Wang <xkernel.wang@foxmail.com>
---
ChangeLog:
v1->v2 update the description.
v2->v3 update the description.
v3->v4 remove trailing whitespace and update the description.
 drivers/staging/rtl8723bs/os_dep/os_intfs.c | 60 +++++++++++----------
 1 file changed, 31 insertions(+), 29 deletions(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/os_intfs.c b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
index 0a8c24e..1bf6fc0 100644
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
