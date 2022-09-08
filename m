Received: from out203-205-221-153.mail.qq.com (out203-205-221-153.mail.qq.com [203.205.221.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 667EC7C
	for <linux-staging@lists.linux.dev>; Thu,  8 Sep 2022 07:35:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1662622503;
	bh=bwQ65S53ALWy6bGST1Fb3/GMX9ST8lXV82dLJKNIlOQ=;
	h=From:To:Cc:Subject:Date;
	b=ZJWyE+1VbiGfQiQ96y8RsGpZQp7u2oNb6f4rSKJfj9COwcpprorVgdh5SQlpVbkJ5
	 nPpULZpPB2/woZN6fQ2DK9C+yAEfgJMEglYVIQNzApu029QuW4RMxpaDdqEVpqQ82f
	 bioedevl2q/b0nJT8Rp+H9UzdV1JgFWRffBg0/UE=
Received: from localhost.localdomain ([59.172.176.188])
	by newxmesmtplogicsvrsza30.qq.com (NewEsmtp) with SMTP
	id 7E618A06; Thu, 08 Sep 2022 15:31:38 +0800
X-QQ-mid: xmsmtpt1662622298tyuvudud9
Message-ID: <tencent_61623C1C5469E9DF0E448B5936B78E239C05@qq.com>
X-QQ-XMAILINFO: Mrv6PNPZjcp6xxCecALPcHbA4h6sD5OnU4pfgtJ5GcpkdxPxE/zW1HbCXHGX+0
	 LN9b6UbRqOgu7PtrFF2HtcnWoy8lHG/KsZOHCeenkYPO0jLpMr5yU1kkT+ChUpPvuzWwfuFCp0nc
	 ISzHFvRq8t3lP75VuYTtMjqiOrjwxczIUUFiTqCh00tCM5UA3Wp0Exc2KaN1h1ybZQl6AR19k0fX
	 FPPmIm+fwVb1VZ8pL3MrQ6lqP+dOre0gxoJRKFeHpnLeXJrRG3WOtxnKtYNRt9OGMMPZ7UDQ2xbK
	 /vqX/H9S0cdXd32wsgFjnBwp3Basc+QrjerAyuSrohJTYXGrx8pVw0/roB2MNzp2NXqAnfpuwufg
	 RAqKeajRSTQPHRQzNtCWXoaF7mn4N9WZrqYCMHW44wwPWw9PkGnsPHr3btIlw0HModR5ORXzisCK
	 5vYT+Kagndgdqq6QGuBlkwJJsvDm0aZNo0wwXhp5nvydcWl6cd8MgJb1YpXcEmzVSpNfnBpKkTsQ
	 EXfGIJf6IvpMi2cMvpYRTuwm7CxHDoPhR7Ws0t2hJjcK4eOR668ChbX0jxd6btbksL+X+QTG6csd
	 cL74h7oQ6YF1RIsunDQzBhMLYly+qfNsfi5rZRl7con9X7LgMopys/GL8jSfjhHVFwFKzYMV9n0S
	 AO6mBi1BMGZWSbFKyoGOUfqRGidSq31PGN8gyELZiZInGI1FXWzo6SmKTwULKATCyLDqyQItxtXs
	 dC4FVciebeZBMYOSAroaP9/ojspOX4jVBZmP3WGV6mQPVuZ/KtXkHuLWLO9TWND70y4p2di7M1tg
	 zdc+RpZgQei/OwslZNkUhX7SWLYos1U2ssTwlUX3nRWPZzlfksUNpQSfiEF60id0H6LADQYHwbaz
	 qOQxAo9zuZp/P11lLpGe0ypu3yjSmQAPT0zyEAE6ViR9yreIhD5wT6SIek//pszXQ9aTu7PGXCWe
	 PGHFMaVJyMOouxbceyICiX8+KQ4QwrWo76CNdbHEThqzwwUtyg3IDqGeubBaFFEKCQeQL92Wc=
From: xkernel.wang@foxmail.com
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Xiaoke Wang <xkernel.wang@foxmail.com>
Subject: [PATCH v3] staging: rtl8723bs: fix potential memory leak in rtw_init_drv_sw()
Date: Thu,  8 Sep 2022 15:31:25 +0800
X-OQ-MSGID: <20220908073125.2232-1-xkernel.wang@foxmail.com>
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

This patch fixes them and keeps the success and error separate. As there
is no FooBar device to test with, no runtime testing was performed.

Signed-off-by: Xiaoke Wang <xkernel.wang@foxmail.com>
---
ChangeLog:
v1->v2 update the description.
v2->v3 update the description.
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
