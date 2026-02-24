Received: from out-181.mta0.migadu.com (out-181.mta0.migadu.com [91.218.175.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B7E13A0E88
	for <linux-staging@lists.linux.dev>; Tue, 24 Feb 2026 13:28:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771939704; cv=none; b=Jx5dz0Xv0FoPbDw9KZotmxuX9Af9Cy1O19bbJxznm6JZVkIMtltEbJy2T7hYU2fwyq7BQYkineeSSyOEkogMvvco7FkWAviAJg0YPuIGMHh4Hs8IKS05bFuVLi7stjEo5QSdi+CG0xAFvZDWIeOERsaqrBnoGW7XO6mPA72EY0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771939704; c=relaxed/simple;
	bh=r3m6Qdg53byVQWyclyR2C3s6dR8QbZ8E8JOH93OYMDM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uRTs+mFssdDnYx23yhPKkjk1o7/Ch8U4TyAr5vshpsMv2SHDQGTjpOPztYmRrGPwpoe5h2Ij9+Ow0yXICmenEy82fcS/nuSGN2aAeI+3q2MC6igfZ8ZriWSGmiK+Gu7MEF7qZ1W2f0+GsRQkD2UXmgQ0bPOKgARw8X6LQiy0o/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=aH8OHwBa; arc=none smtp.client-ip=91.218.175.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="aH8OHwBa"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1771939699;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iXzH0vcwsec8EsxzLkAr6OHuv9c/P8QoKBXgyBZN72s=;
	b=aH8OHwBaBWofbpXUMzvBFfcSFL34VPHAI7whgkQGaXqYGIKobJX0yLCryPnINXcVB83pXi
	q5S41Ks79XE3uLcIhT0QqhpGi6k4/kMUiQkWMtci063gbHxKNP87L5efweDjCG+tgAWRkv
	ot76A81Ty2laIDdE0uz8+IbaDaryo1c=
From: luka.gejak@linux.dev
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Luka Gejak <luka.gejak@linux.dev>
Subject: [PATCH 14/21] staging: rtl8723bs: core: fix various line length overflows
Date: Tue, 24 Feb 2026 14:27:41 +0100
Message-ID: <20260224132748.12336-15-luka.gejak@linux.dev>
In-Reply-To: <20260224132748.12336-1-luka.gejak@linux.dev>
References: <20260224132748.12336-1-luka.gejak@linux.dev>
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
2.53.0

