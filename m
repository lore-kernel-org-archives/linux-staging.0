Received: from out-188.mta1.migadu.com (out-188.mta1.migadu.com [95.215.58.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7B3C34A775
	for <linux-staging@lists.linux.dev>; Sun,  8 Feb 2026 11:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770548512; cv=none; b=rLX9RBxQCoikxWnxdGVaBE2IedgUlrgG0y1DYIx8hi0nMMg/TYpq4ErI/wj+gBDZnwwFy2ceIn3Vbqi45mHieEyfiiwyMOF6miYqc2JJMVSiu2Mh7JN2HZ9U8OOP2JvMV3sG45dsLLGjp/nukvUFiI5ttGBiyuGYkxUaOztrPFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770548512; c=relaxed/simple;
	bh=08esEMksGnXGSfC9IVFrz4LIVAd2qdlNfWas6IAFE4Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rZcrY0tNa6IxD5sQ9+7Br3EcLNAlDZt+8RYdbI4+1XMbsto4f80CDvuxwdpfQQAIQ0cwuprLyG7/cB4PNGq3oa6U2kyF77YNHeKe+Gx7kJlnNQQPVK3S8ylXnIDyobhSf80oewUpUbXYwzlAlXtwDHrUkYYtbwarwYHZzd8QDLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=TgOycLZ4; arc=none smtp.client-ip=95.215.58.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="TgOycLZ4"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1770548511;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IrOwOuJw5qjYm1LT4Pb8Uj/QnplIIgXWbYvXFssnzik=;
	b=TgOycLZ4Oja6ZQikcbRFcSFk3mifG9kzTjU4P6N5ntMPK/6/ZZp95pxvYsmxeWCe87wHd1
	HLpuwV1WXKhATBlIDvAHNu6pfnr0M/o5Pe5+AlX6CytGF4uVTnEXwpagECwYfCUrlE5kRL
	mrr0aQIOvr5PLpZmCr+Mh+QWvbGpT4o=
From: luka.gejak@linux.dev
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Luka Gejak <luka.gejak@linux.dev>
Subject: [PATCH v3 15/22] staging: rtl8723bs: core: fix various line length overflows
Date: Sun,  8 Feb 2026 12:01:04 +0100
Message-ID: <20260208110111.46642-16-luka.gejak@linux.dev>
In-Reply-To: <20260208110111.46642-1-luka.gejak@linux.dev>
References: <20260208110111.46642-1-luka.gejak@linux.dev>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

From: Luka Gejak <luka.gejak@linux.dev>

Fix lines exceeding 100 characters in rtw_io.c, rtw_ioctl_set.c, and
rtw_pwrctrl.c to comply with kernel coding style.

Signed-off-by: Luka Gejak <luka.gejak@linux.dev>
---
 drivers/staging/rtl8723bs/core/rtw_io.c        |  4 +++-
 drivers/staging/rtl8723bs/core/rtw_ioctl_set.c | 16 ++++++++++++----
 drivers/staging/rtl8723bs/core/rtw_pwrctrl.c   |  3 ++-
 3 files changed, 17 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_io.c b/drivers/staging/rtl8723bs/core/rtw_io.c
index 965c3cfea103..0affb14e5842 100644
--- a/drivers/staging/rtl8723bs/core/rtw_io.c
+++ b/drivers/staging/rtl8723bs/core/rtw_io.c
@@ -114,7 +114,9 @@ u32 rtw_write_port(struct adapter *adapter, u32 addr, u32 cnt, u8 *pmem)
 	return _write_port(pintfhdl, addr, cnt, pmem);
 }
 
-int rtw_init_io_priv(struct adapter *padapter, void (*set_intf_ops)(struct adapter *padapter, struct _io_ops *pops))
+int rtw_init_io_priv(struct adapter *padapter,
+		     void (*set_intf_ops)(struct adapter *padapter,
+					  struct _io_ops *pops))
 {
 	struct io_priv *piopriv = &padapter->iopriv;
 	struct intf_hdl *pintf = &piopriv->intf;
diff --git a/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c b/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
index 587a87fbffeb..f16e94b28448 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
@@ -174,7 +174,11 @@ u8 rtw_set_802_11_ssid(struct adapter *padapter, struct ndis_802_11_ssid *ssid)
 						set_fwstate(pmlmepriv, WIFI_ADHOC_STATE);
 					}
 				} else {
-					goto release_mlme_lock;/* it means driver is in WIFI_ADHOC_MASTER_STATE, we needn't create bss again. */
+					/*
+					 * already in WIFI_ADHOC_MASTER_STATE,
+					 * no need to create bss again
+					 */
+					goto release_mlme_lock;
 				}
 			} else {
 				rtw_lps_ctrl_wk_cmd(padapter, LPS_CTRL_JOINBSS, 1);
@@ -309,8 +313,9 @@ u8 rtw_set_802_11_infrastructure_mode(struct adapter *padapter,
 			rtw_free_assoc_resources(padapter, 1);
 
 		if ((*pold_state == Ndis802_11Infrastructure) || (*pold_state == Ndis802_11IBSS)) {
+			/* clr Linked_state; issue dis-assoc_cmd already checked above */
 			if (check_fwstate(pmlmepriv, _FW_LINKED) == true)
-				rtw_indicate_disconnect(padapter); /* will clr Linked_state; before this function, we must have checked whether issue dis-assoc_cmd or not */
+				rtw_indicate_disconnect(padapter);
 		}
 
 		*pold_state = networktype;
@@ -365,7 +370,9 @@ u8 rtw_set_802_11_disassociate(struct adapter *padapter)
 	return true;
 }
 
-u8 rtw_set_802_11_bssid_list_scan(struct adapter *padapter, struct ndis_802_11_ssid *pssid, int ssid_max_num)
+u8 rtw_set_802_11_bssid_list_scan(struct adapter *padapter,
+				  struct ndis_802_11_ssid *pssid,
+				  int ssid_max_num)
 {
 	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
 	u8 res = true;
@@ -399,7 +406,8 @@ u8 rtw_set_802_11_bssid_list_scan(struct adapter *padapter, struct ndis_802_11_s
 	return res;
 }
 
-u8 rtw_set_802_11_authentication_mode(struct adapter *padapter, enum ndis_802_11_authentication_mode authmode)
+u8 rtw_set_802_11_authentication_mode(struct adapter *padapter,
+				      enum ndis_802_11_authentication_mode authmode)
 {
 	struct security_priv *psecuritypriv = &padapter->securitypriv;
 	int res;
diff --git a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
index 1c9e02732687..fbf5ab18c317 100644
--- a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
+++ b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
@@ -331,7 +331,8 @@ static u8 PS_RDY_CHECK(struct adapter *padapter)
 	return true;
 }
 
-void rtw_set_ps_mode(struct adapter *padapter, u8 ps_mode, u8 smart_ps, u8 bcn_ant_mode, const char *msg)
+void rtw_set_ps_mode(struct adapter *padapter, u8 ps_mode, u8 smart_ps,
+		     u8 bcn_ant_mode, const char *msg)
 {
 	struct pwrctrl_priv *pwrpriv = adapter_to_pwrctl(padapter);
 
-- 
2.52.0

