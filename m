Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 572A27B
	for <linux-staging@lists.linux.dev>; Thu, 13 Oct 2022 00:20:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE87DC433D6;
	Thu, 13 Oct 2022 00:20:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1665620426;
	bh=v54vnW+bX4cKUN2tJYHQtuvmIGDk0z24Qkca/Gc9l6g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UK+MWsOS7u33u3q4IvzC0Arlp4jV97BLdsazOg7/6yv9IV0FGXO9W/lIGZ8GNvZoQ
	 SoSTP/PnlQAxXw4qsHlzamd36hkW2yv0Z5cS0qYOD/p080RLPg8AmUrsISXpJVug8w
	 lLAy9LHfFWtPAmoEQL+7JQSQokkc9Ph6ElwUNRn8XK3Ph3zegIb0OWnAv1r1GsMOOh
	 uPvhaFVpmXMgYY0HQyemW5T8KcnnM99EgeprHkfMpQhSCX/MfTg3/1GjASjkfGS/NP
	 YYw2DunDugRi+feFX9e3BcuUhz/WcxyjWLD7AeefImmCQ8jhBs3VyX3llhTpNFNf8v
	 1n+dBHR+LhVag==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Xiaoke Wang <xkernel.wang@foxmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sasha Levin <sashal@kernel.org>,
	kuba@kernel.org,
	macromorgan@hotmail.com,
	hdegoede@redhat.com,
	chi.minghao@zte.com.cn,
	linux-staging@lists.linux.dev
Subject: [PATCH AUTOSEL 5.19 43/63] staging: rtl8723bs: fix potential memory leak in rtw_init_drv_sw()
Date: Wed, 12 Oct 2022 20:18:17 -0400
Message-Id: <20221013001842.1893243-43-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221013001842.1893243-1-sashal@kernel.org>
References: <20221013001842.1893243-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit

From: Xiaoke Wang <xkernel.wang@foxmail.com>

[ Upstream commit 5a5aa9cce621e2c0e25a1e5d72d6be1749167cc0 ]

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
Link: https://lore.kernel.org/r/tencent_C3B899D2FC3F1BC827F3552E0B0734056006@qq.com
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/staging/rtl8723bs/os_dep/os_intfs.c | 60 +++++++++++----------
 1 file changed, 31 insertions(+), 29 deletions(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/os_intfs.c b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
index 380d8c9e1239..68bba3c0e757 100644
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
2.35.1

