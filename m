Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F205E347FE3
	for <linux-staging@lists.linux.dev>; Sun,  8 Mar 2026 19:28:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772998095; cv=none; b=nzrR1j97rUskSFTJukqx25f9w01lFNsjdM0YOL2aqfDq4qQvD6nwGCO42JTnLlnV97YCbRXzLSoS1TWdDYj06ZdDgRvN1OKS7s6Jga0IrJ9X2jggLkkFnXxwNDztgYoAWEbdtkIUZcleufUvPFL/zeM7qeAXp8gtxnWFPmzghPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772998095; c=relaxed/simple;
	bh=pHaZuAVnK0cB6bRgSXqzdcdWrF32lHK6QGHdEcCWrbg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uiZ7OivhTq5wnJVDRrmkrLwKMqCfPoFW1Ol6qWpuuQnXXXErNWzdkl4BQhgrg5Vn9ukcQXWAysJ8ccs+7N2AVqF6hcE9/+msHMgyj45xiqGu4ss4+YsnOra55RuQH1YI6FR7UNkpp3bf2RbSHpL4OcC+F6xHkG4duA7Nzx0hOoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RTePxjYJ; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RTePxjYJ"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4852f8ac7e9so16123155e9.1
        for <linux-staging@lists.linux.dev>; Sun, 08 Mar 2026 12:28:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772998090; x=1773602890; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6VpMwEPmmTpM2Xx/zGFhJhbZ3jUSaBZGmvLJZ75AiFw=;
        b=RTePxjYJW69+ljzje3G3WTFSV0Uzxyconv5cjfzsLZ3NTyC2KHY+XJLhEo3fz0rPEb
         HLH0h+YUI3SQkeugV+BKALlqqGu4bhhYFWsRTNk7yQnrG+Ehw3vHxaxUA3i30Y5MHokD
         M+VSorDRFFhVfezjsTsvn23PkLIJjRDq4dr9SRzSlaNzl1IEorwkgqYrB366JbFiT/jZ
         0TSoVtNu3A1p3cO+b7CQUyuVk6RTPq46f1lVdrnq5z3v3lLvSc92cAMVxkYh2lvZY8lJ
         Lmf5qceBW2bennnvZO20TIzRGbk94plk/WhIiUHYsIh0nijMapkY+80I1U7NsjL04x52
         eJBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772998090; x=1773602890;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6VpMwEPmmTpM2Xx/zGFhJhbZ3jUSaBZGmvLJZ75AiFw=;
        b=SBsHwpDK9RjyVedAHQJOFv1VnDUN7sLbKLCqKnbnDeOlui4T8ad8SD1QcCubHWeRND
         8twwoGWEl/QBqa24GnZCuV2eCzcCGql0ACmSuiEZ5DwDrDnsS7dtnJVFxec0K678qrDG
         scl75k/OngZkoqki53ipFF1XdCjOfZDfxlaAB9kRtS3zYP/oYufC9QBgX/n1/2znsrHT
         7ILM3MU8yOwyCeWN8Ilytclq7tH0ywjldNxgn+YYUszcjyD/UkdTdkaUuwcDZIFUNVd/
         rrtR8z25CHt8ezIpqQO/XZuMgTnABmQSoFvK48V5r3liQQwO0Q9rmIgQrJJiw/ytk6yC
         xk2A==
X-Gm-Message-State: AOJu0YxoBbtgBI5hpqJLlpnwiDUtWIB5WYEqALpEa6nKieQPJVLYJmAx
	9ZxhrXk8a/gtSfBrmngAFpZUnuxODvPL+59fMPHFe6MBGULzmU4z/V9kI0ZU1g==
X-Gm-Gg: ATEYQzy/QPa9R+kImIXx04gz/JIE2gK4i71yOU1irVZN9rDEFfZgIfRkmHOXfVseSQr
	vaXi9T7wZt5YkKh7Ka5dAzjTrKUL52HVnFm0Zfe3Cqi6MSaV2Ht0P5H72+VUp0yi1sUTLB3HkwB
	DoIiLIEJf3JZjzJadJ2HjGpkGQf20Qh6b4/cfMrjxR6RYWl7+I7mjcThyaetHuEcqWCidvPxEsl
	vwP53NotaqxUrLy9soKGH14d7xU3sVNSVRLXkkFfT25eu0PoWt1nR4HPIONKKa7zWMIM2m3R0jF
	1jk/YY4Pr2Lvm9PYQryHeP9iKCNr0UuCiZn5ACjnYDj4UFFolymEYrea6ZXhASgxRXiEL964RQ3
	KVJQ9MoScoHPHUTF6zvK44p4hHFt14/nqNCEOr5VEH0nPaJNZV7pb1l7ehMHi5JOvC35Sf8NhuI
	idGUiZ5jiRUYZYDQNk0KRMMiXs5zgFtth+NnarGgcSpg==
X-Received: by 2002:a05:600c:3504:b0:485:3a27:a960 with SMTP id 5b1f17b1804b1-4853a27aa3emr36146195e9.0.1772998089791;
        Sun, 08 Mar 2026 12:28:09 -0700 (PDT)
Received: from localhost.localdomain ([84.78.248.120])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4852378e700sm119168485e9.0.2026.03.08.12.28.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Mar 2026 12:28:09 -0700 (PDT)
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
To: linux-staging@lists.linux.dev
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/4] staging: rtl8723bs: remove Hungarian notation from booleans
Date: Sun,  8 Mar 2026 20:27:16 +0100
Message-ID: <20260308192734.186757-2-azpijr@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260308192734.186757-1-azpijr@gmail.com>
References: <20260308192734.186757-1-azpijr@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove Hungarian notation to snake_case to improve readability.

Signed-off-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_btcoex.c   |  2 +-
 drivers/staging/rtl8723bs/core/rtw_cmd.c      | 12 ++--
 drivers/staging/rtl8723bs/core/rtw_mlme.c     | 12 ++--
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 28 ++++----
 drivers/staging/rtl8723bs/core/rtw_pwrctrl.c  | 68 +++++++++----------
 drivers/staging/rtl8723bs/core/rtw_recv.c     | 18 ++---
 drivers/staging/rtl8723bs/core/rtw_security.c |  4 +-
 drivers/staging/rtl8723bs/hal/odm.c           |  2 +-
 drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c  | 12 ++--
 .../staging/rtl8723bs/hal/rtl8723b_hal_init.c | 10 +--
 .../staging/rtl8723bs/hal/rtl8723b_phycfg.c   |  4 +-
 .../staging/rtl8723bs/hal/rtl8723bs_xmit.c    | 14 ++--
 drivers/staging/rtl8723bs/hal/sdio_ops.c      |  2 +-
 drivers/staging/rtl8723bs/include/drv_types.h | 14 ++--
 .../staging/rtl8723bs/include/rtw_pwrctrl.h   |  6 +-
 .../staging/rtl8723bs/include/rtw_security.h  |  2 +-
 .../staging/rtl8723bs/os_dep/ioctl_cfg80211.c |  6 +-
 drivers/staging/rtl8723bs/os_dep/os_intfs.c   | 28 ++++----
 drivers/staging/rtl8723bs/os_dep/sdio_intf.c  | 12 ++--
 .../staging/rtl8723bs/os_dep/sdio_ops_linux.c | 32 ++++-----
 20 files changed, 144 insertions(+), 144 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_btcoex.c b/drivers/staging/rtl8723bs/core/rtw_btcoex.c
index f4b19ef7b341..cb13a39daa68 100644
--- a/drivers/staging/rtl8723bs/core/rtw_btcoex.c
+++ b/drivers/staging/rtl8723bs/core/rtw_btcoex.c
@@ -23,7 +23,7 @@ void rtw_btcoex_HaltNotify(struct adapter *padapter)
 	if (!padapter->bup)
 		return;
 
-	if (padapter->bSurpriseRemoved)
+	if (padapter->surprise_removed)
 		return;
 
 	hal_btcoex_HaltNotify(padapter);
diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
index 5d9b192805c9..10cec81de25d 100644
--- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
+++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
@@ -397,11 +397,11 @@ int rtw_cmd_thread(void *context)
 			break;
 		}
 
-		if (padapter->bDriverStopped || padapter->bSurpriseRemoved) {
+		if (padapter->driver_stopped || padapter->surprise_removed) {
 			netdev_dbg(padapter->pnetdev,
 				   "%s: DriverStopped(%d) SurpriseRemoved(%d) break at line %d\n",
-				   __func__, padapter->bDriverStopped,
-				   padapter->bSurpriseRemoved, __LINE__);
+				   __func__, padapter->driver_stopped,
+				   padapter->surprise_removed, __LINE__);
 			break;
 		}
 
@@ -420,11 +420,11 @@ int rtw_cmd_thread(void *context)
 			continue;
 
 _next:
-		if (padapter->bDriverStopped || padapter->bSurpriseRemoved) {
+		if (padapter->driver_stopped || padapter->surprise_removed) {
 			netdev_dbg(padapter->pnetdev,
 				   "%s: DriverStopped(%d) SurpriseRemoved(%d) break at line %d\n",
-				   __func__, padapter->bDriverStopped,
-				   padapter->bSurpriseRemoved, __LINE__);
+				   __func__, padapter->driver_stopped,
+				   padapter->surprise_removed, __LINE__);
 			break;
 		}
 
diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index 28dfb974fdff..0eac7e13a387 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -266,7 +266,7 @@ signed int rtw_if_up(struct adapter *padapter)
 {
 	signed int res;
 
-	if (padapter->bDriverStopped || padapter->bSurpriseRemoved ||
+	if (padapter->driver_stopped || padapter->surprise_removed ||
 		!check_fwstate(&padapter->mlmepriv, _FW_LINKED))
 		res = false;
 	else
@@ -927,7 +927,7 @@ inline void rtw_indicate_scan_done(struct adapter *padapter, bool aborted)
 {
 	rtw_cfg80211_indicate_scan_done(padapter, aborted);
 
-	if ((!adapter_to_pwrctl(padapter)->bInSuspend) &&
+	if ((!adapter_to_pwrctl(padapter)->in_suspend) &&
 	    (!check_fwstate(&padapter->mlmepriv,
 			    WIFI_ASOC_STATE | WIFI_UNDER_LINKING))) {
 		rtw_set_ips_deny(padapter, 0);
@@ -945,7 +945,7 @@ void rtw_scan_abort(struct adapter *adapter)
 	pmlmeext->scan_abort = true;
 	while (check_fwstate(pmlmepriv, _FW_UNDER_SURVEY)
 		&& jiffies_to_msecs(start) <= 200) {
-		if (adapter->bDriverStopped || adapter->bSurpriseRemoved)
+		if (adapter->driver_stopped || adapter->surprise_removed)
 			break;
 
 		msleep(20);
@@ -988,7 +988,7 @@ static struct sta_info *rtw_joinbss_update_stainfo(struct adapter *padapter, str
 
 		/* security related */
 		if (padapter->securitypriv.dot11AuthAlgrthm == dot11AuthAlgrthm_8021X) {
-			padapter->securitypriv.binstallGrpkey = false;
+			padapter->securitypriv.install_grpkey = false;
 			padapter->securitypriv.busetkipkey = false;
 			padapter->securitypriv.bgrpkey_handshake = false;
 
@@ -1534,7 +1534,7 @@ void _rtw_join_timeout_handler(struct timer_list *t)
 						     mlmepriv.assoc_timer);
 	struct	mlme_priv *pmlmepriv = &adapter->mlmepriv;
 
-	if (adapter->bDriverStopped || adapter->bSurpriseRemoved)
+	if (adapter->driver_stopped || adapter->surprise_removed)
 		return;
 
 	spin_lock_bh(&pmlmepriv->lock);
@@ -1634,7 +1634,7 @@ void rtw_dynamic_check_timer_handler(struct adapter *adapter)
 	if (!adapter->hw_init_completed)
 		return;
 
-	if (adapter->bDriverStopped || adapter->bSurpriseRemoved)
+	if (adapter->driver_stopped || adapter->surprise_removed)
 		return;
 
 	if (adapter->net_closed)
diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index a631fe323157..2775f464b37d 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -411,7 +411,7 @@ void free_mlme_ext_priv(struct mlme_ext_priv *pmlmeext)
 	if (!padapter)
 		return;
 
-	if (padapter->bDriverStopped) {
+	if (padapter->driver_stopped) {
 		timer_delete_sync(&pmlmeext->survey_timer);
 		timer_delete_sync(&pmlmeext->link_timer);
 		/* timer_delete_sync(&pmlmeext->ADDBA_timer); */
@@ -1983,8 +1983,8 @@ void update_mgntframe_attrib_addr(struct adapter *padapter, struct xmit_frame *p
 
 void dump_mgntframe(struct adapter *padapter, struct xmit_frame *pmgntframe)
 {
-	if (padapter->bSurpriseRemoved ||
-		padapter->bDriverStopped) {
+	if (padapter->surprise_removed ||
+		padapter->driver_stopped) {
 		rtw_free_xmitbuf(&padapter->xmitpriv, pmgntframe->pxmitbuf);
 		rtw_free_xmitframe(&padapter->xmitpriv, pmgntframe);
 		return;
@@ -2001,8 +2001,8 @@ s32 dump_mgntframe_and_wait(struct adapter *padapter, struct xmit_frame *pmgntfr
 	struct xmit_buf *pxmitbuf = pmgntframe->pxmitbuf;
 	struct submit_ctx sctx;
 
-	if (padapter->bSurpriseRemoved ||
-		padapter->bDriverStopped) {
+	if (padapter->surprise_removed ||
+		padapter->driver_stopped) {
 		rtw_free_xmitbuf(&padapter->xmitpriv, pmgntframe->pxmitbuf);
 		rtw_free_xmitframe(&padapter->xmitpriv, pmgntframe);
 		return ret;
@@ -2030,8 +2030,8 @@ s32 dump_mgntframe_and_wait_ack(struct adapter *padapter, struct xmit_frame *pmg
 	u32 timeout_ms = 500;/*   500ms */
 	struct xmit_priv *pxmitpriv = &padapter->xmitpriv;
 
-	if (padapter->bSurpriseRemoved ||
-		padapter->bDriverStopped) {
+	if (padapter->surprise_removed ||
+		padapter->driver_stopped) {
 		rtw_free_xmitbuf(&padapter->xmitpriv, pmgntframe->pxmitbuf);
 		rtw_free_xmitframe(&padapter->xmitpriv, pmgntframe);
 		return -1;
@@ -2535,7 +2535,7 @@ int issue_probereq_ex(struct adapter *padapter, struct ndis_802_11_ssid *pssid,
 
 		i++;
 
-		if (padapter->bDriverStopped || padapter->bSurpriseRemoved)
+		if (padapter->driver_stopped || padapter->surprise_removed)
 			break;
 
 		if (i < try_cnt && wait_ms > 0 && ret == _FAIL)
@@ -3090,7 +3090,7 @@ int issue_nulldata(struct adapter *padapter, unsigned char *da, unsigned int pow
 
 		i++;
 
-		if (padapter->bDriverStopped || padapter->bSurpriseRemoved)
+		if (padapter->driver_stopped || padapter->surprise_removed)
 			break;
 
 		if (i < try_cnt && wait_ms > 0 && ret == _FAIL)
@@ -3223,7 +3223,7 @@ int issue_qos_nulldata(struct adapter *padapter, unsigned char *da, u16 tid, int
 
 		i++;
 
-		if (padapter->bDriverStopped || padapter->bSurpriseRemoved)
+		if (padapter->driver_stopped || padapter->surprise_removed)
 			break;
 
 		if (i < try_cnt && wait_ms > 0 && ret == _FAIL)
@@ -3317,7 +3317,7 @@ int issue_deauth_ex(struct adapter *padapter, u8 *da, unsigned short reason, int
 
 		i++;
 
-		if (padapter->bDriverStopped || padapter->bSurpriseRemoved)
+		if (padapter->driver_stopped || padapter->surprise_removed)
 			break;
 
 		if (i < try_cnt && wait_ms > 0 && ret == _FAIL)
@@ -3752,11 +3752,11 @@ unsigned int send_beacon(struct adapter *padapter)
 			cond_resched();
 			rtw_hal_get_hwreg(padapter, HW_VAR_BCN_VALID, (u8 *)(&bxmitok));
 			poll++;
-		} while ((poll%10) != 0 && false == bxmitok && !padapter->bSurpriseRemoved && !padapter->bDriverStopped);
+		} while ((poll%10) != 0 && false == bxmitok && !padapter->surprise_removed && !padapter->driver_stopped);
 
-	} while (false == bxmitok && issue < 100 && !padapter->bSurpriseRemoved && !padapter->bDriverStopped);
+	} while (false == bxmitok && issue < 100 && !padapter->surprise_removed && !padapter->driver_stopped);
 
-	if (padapter->bSurpriseRemoved || padapter->bDriverStopped)
+	if (padapter->surprise_removed || padapter->driver_stopped)
 		return _FAIL;
 
 	if (!bxmitok)
diff --git a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
index 666e241704d9..ae931d2d15ed 100644
--- a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
+++ b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
@@ -147,7 +147,7 @@ void rtw_ps_processor(struct adapter *padapter)
 	if (ps_deny != 0)
 		goto exit;
 
-	if (pwrpriv->bInSuspend) /* system suspend or autosuspend */
+	if (pwrpriv->in_suspend) /* system suspend or autosuspend */
 		return;
 
 	pwrpriv->ps_processing = true;
@@ -181,7 +181,7 @@ void traffic_check_for_leave_lps(struct adapter *padapter, u8 tx, u32 tx_packets
 {
 	static unsigned long start_time;
 	static u32 xmit_cnt;
-	u8 bLeaveLPS = false;
+	u8 leave_lps = false;
 	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
 
 
@@ -194,10 +194,10 @@ void traffic_check_for_leave_lps(struct adapter *padapter, u8 tx, u32 tx_packets
 
 		if (jiffies_to_msecs(jiffies - start_time) > 2000) { /*  2 sec == watch dog timer */
 			if (xmit_cnt > 8) {
-				if (adapter_to_pwrctl(padapter)->bLeisurePs
+				if (adapter_to_pwrctl(padapter)->leisure_ps
 				    && (adapter_to_pwrctl(padapter)->pwr_mode != PS_MODE_ACTIVE)
 				    && !(hal_btcoex_IsBtControlLps(padapter))) {
-					bLeaveLPS = true;
+					leave_lps = true;
 				}
 			}
 
@@ -207,14 +207,14 @@ void traffic_check_for_leave_lps(struct adapter *padapter, u8 tx, u32 tx_packets
 
 	} else { /*  from rx path */
 		if (pmlmepriv->link_detect_info.num_rx_unicast_ok_in_period > 4) {
-			if (adapter_to_pwrctl(padapter)->bLeisurePs
+			if (adapter_to_pwrctl(padapter)->leisure_ps
 			    && (adapter_to_pwrctl(padapter)->pwr_mode != PS_MODE_ACTIVE)
 			    && !(hal_btcoex_IsBtControlLps(padapter)))
-				bLeaveLPS = true;
+				leave_lps = true;
 		}
 	}
 
-	if (bLeaveLPS)
+	if (leave_lps)
 		/* rtw_lps_ctrl_wk_cmd(padapter, LPS_CTRL_LEAVE, 1); */
 		rtw_lps_ctrl_wk_cmd(padapter, LPS_CTRL_LEAVE, tx?0:1);
 }
@@ -243,13 +243,13 @@ void rtw_set_rpwm(struct adapter *padapter, u8 pslv)
 
 	}
 
-	if ((padapter->bSurpriseRemoved) || !(padapter->hw_init_completed)) {
+	if ((padapter->surprise_removed) || !(padapter->hw_init_completed)) {
 		pwrpriv->cpwm = PS_STATE_S4;
 
 		return;
 	}
 
-	if (padapter->bDriverStopped) {
+	if (padapter->driver_stopped) {
 		if (pslv < PS_STATE_S2)
 			return;
 	}
@@ -303,7 +303,7 @@ static u8 PS_RDY_CHECK(struct adapter *padapter)
 	struct pwrctrl_priv *pwrpriv = adapter_to_pwrctl(padapter);
 	struct mlme_priv *pmlmepriv = &(padapter->mlmepriv);
 
-	if (pwrpriv->bInSuspend)
+	if (pwrpriv->in_suspend)
 		return false;
 
 	curr_time = jiffies;
@@ -322,7 +322,7 @@ static u8 PS_RDY_CHECK(struct adapter *padapter)
 		return false;
 
 	if (padapter->securitypriv.dot11AuthAlgrthm == dot11AuthAlgrthm_8021X &&
-	    !padapter->securitypriv.binstallGrpkey)
+	    !padapter->securitypriv.install_grpkey)
 		return false;
 
 	if (!rtw_cfg80211_pwr_mgmt(padapter))
@@ -401,17 +401,17 @@ void rtw_set_ps_mode(struct adapter *padapter, u8 ps_mode, u8 smart_ps, u8 bcn_a
 s32 LPS_RF_ON_check(struct adapter *padapter, u32 delay_ms)
 {
 	unsigned long start_time;
-	u8 bAwake = false;
+	u8 awake = false;
 	s32 err = 0;
 
 
 	start_time = jiffies;
 	while (1) {
-		rtw_hal_get_hwreg(padapter, HW_VAR_FWLPS_RF_ON, &bAwake);
-		if (bAwake)
+		rtw_hal_get_hwreg(padapter, HW_VAR_FWLPS_RF_ON, &awake);
+		if (awake)
 			break;
 
-		if (padapter->bSurpriseRemoved) {
+		if (padapter->surprise_removed) {
 			err = -2;
 			break;
 		}
@@ -446,7 +446,7 @@ void LPS_Enter(struct adapter *padapter, const char *msg)
 	if (!PS_RDY_CHECK(dvobj->padapters))
 		return;
 
-	if (pwrpriv->bLeisurePs) {
+	if (pwrpriv->leisure_ps) {
 		/*  Idle for a while if we connect to AP a while ago. */
 		if (pwrpriv->LpsIdleCount >= 2) { /*   4 Sec */
 			if (pwrpriv->pwr_mode == PS_MODE_ACTIVE) {
@@ -471,7 +471,7 @@ void LPS_Leave(struct adapter *padapter, const char *msg)
 	if (hal_btcoex_IsBtControlLps(padapter))
 		return;
 
-	if (pwrpriv->bLeisurePs) {
+	if (pwrpriv->leisure_ps) {
 		if (pwrpriv->pwr_mode != PS_MODE_ACTIVE) {
 			scnprintf(buf, sizeof(buf), "WIFI-%s", msg);
 			rtw_set_ps_mode(padapter, PS_MODE_ACTIVE, 0, 0, buf);
@@ -490,7 +490,7 @@ void LeaveAllPowerSaveModeDirect(struct adapter *Adapter)
 	struct mlme_priv *pmlmepriv = &(Adapter->mlmepriv);
 	struct pwrctrl_priv *pwrpriv = adapter_to_pwrctl(Adapter);
 
-	if (Adapter->bSurpriseRemoved)
+	if (Adapter->surprise_removed)
 		return;
 
 	if (check_fwstate(pmlmepriv, _FW_LINKED)) { /* connect */
@@ -524,7 +524,7 @@ void LeaveAllPowerSaveMode(struct adapter *Adapter)
 	if (!Adapter->bup)
 		return;
 
-	if (Adapter->bSurpriseRemoved)
+	if (Adapter->surprise_removed)
 		return;
 
 	if (check_fwstate(&(dvobj->padapters->mlmepriv), WIFI_ASOC_STATE))
@@ -546,11 +546,11 @@ void LPS_Leave_check(struct adapter *padapter)
 {
 	struct pwrctrl_priv *pwrpriv;
 	unsigned long	start_time;
-	u8 bReady;
+	u8 ready;
 
 	pwrpriv = adapter_to_pwrctl(padapter);
 
-	bReady = false;
+	ready = false;
 	start_time = jiffies;
 
 	cond_resched();
@@ -558,14 +558,14 @@ void LPS_Leave_check(struct adapter *padapter)
 	while (1) {
 		mutex_lock(&pwrpriv->lock);
 
-		if (padapter->bSurpriseRemoved ||
+		if (padapter->surprise_removed ||
 		    !(padapter->hw_init_completed) ||
 		    (pwrpriv->pwr_mode == PS_MODE_ACTIVE))
-			bReady = true;
+			ready = true;
 
 		mutex_unlock(&pwrpriv->lock);
 
-		if (bReady)
+		if (ready)
 			break;
 
 		if (jiffies_to_msecs(jiffies - start_time) > 100)
@@ -949,13 +949,13 @@ void rtw_init_pwrctrl_priv(struct adapter *padapter)
 
 	pwrctrlpriv->pwr_state_check_interval = RTW_PWR_STATE_CHK_INTERVAL;
 	pwrctrlpriv->pwr_state_check_cnts = 0;
-	pwrctrlpriv->bInternalAutoSuspend = false;
-	pwrctrlpriv->bInSuspend = false;
+	pwrctrlpriv->internal_auto_suspend = false;
+	pwrctrlpriv->in_suspend = false;
 	pwrctrlpriv->bkeepfwalive = false;
 
 	pwrctrlpriv->LpsIdleCount = 0;
 	pwrctrlpriv->power_mgnt = padapter->registrypriv.power_mgnt;/*  PS_MODE_MIN; */
-	pwrctrlpriv->bLeisurePs = pwrctrlpriv->power_mgnt != PS_MODE_ACTIVE;
+	pwrctrlpriv->leisure_ps = pwrctrlpriv->power_mgnt != PS_MODE_ACTIVE;
 
 	pwrctrlpriv->fw_current_in_ps_mode = false;
 
@@ -1025,19 +1025,19 @@ int _rtw_pwr_wakeup(struct adapter *padapter, u32 ips_deffer_ms, const char *cal
 		while (pwrpriv->ps_processing && jiffies_to_msecs(jiffies - start) <= 3000)
 			mdelay(10);
 
-	if (!(pwrpriv->bInternalAutoSuspend) && pwrpriv->bInSuspend)
-		while (pwrpriv->bInSuspend && jiffies_to_msecs(jiffies - start) <= 3000
+	if (!(pwrpriv->internal_auto_suspend) && pwrpriv->in_suspend)
+		while (pwrpriv->in_suspend && jiffies_to_msecs(jiffies - start) <= 3000
 		)
 			mdelay(10);
 
 	/* System suspend is not allowed to wakeup */
-	if (!(pwrpriv->bInternalAutoSuspend) && pwrpriv->bInSuspend) {
+	if (!(pwrpriv->internal_auto_suspend) && pwrpriv->in_suspend) {
 		ret = _FAIL;
 		goto exit;
 	}
 
 	/* block??? */
-	if (pwrpriv->bInternalAutoSuspend  && padapter->net_closed) {
+	if (pwrpriv->internal_auto_suspend  && padapter->net_closed) {
 		ret = _FAIL;
 		goto exit;
 	}
@@ -1058,7 +1058,7 @@ int _rtw_pwr_wakeup(struct adapter *padapter, u32 ips_deffer_ms, const char *cal
 	}
 
 	/* TODO: the following checking need to be merged... */
-	if (padapter->bDriverStopped || !padapter->bup || !padapter->hw_init_completed) {
+	if (padapter->driver_stopped || !padapter->bup || !padapter->hw_init_completed) {
 		ret = false;
 		goto exit;
 	}
@@ -1084,7 +1084,7 @@ int rtw_pm_set_lps(struct adapter *padapter, u8 mode)
 				pwrctrlpriv->LpsIdleCount = 2;
 
 			pwrctrlpriv->power_mgnt = mode;
-			pwrctrlpriv->bLeisurePs =
+			pwrctrlpriv->leisure_ps =
 				pwrctrlpriv->power_mgnt != PS_MODE_ACTIVE;
 		}
 	} else
@@ -1102,7 +1102,7 @@ int rtw_pm_set_ips(struct adapter *padapter, u8 mode)
 		return 0;
 	} else if (mode == IPS_NONE) {
 		rtw_ips_mode_req(pwrctrlpriv, mode);
-		if ((padapter->bSurpriseRemoved == 0) && (rtw_pwr_wakeup(padapter) == _FAIL))
+		if ((padapter->surprise_removed == 0) && (rtw_pwr_wakeup(padapter) == _FAIL))
 			return -EFAULT;
 	} else
 		return -EINVAL;
diff --git a/drivers/staging/rtl8723bs/core/rtw_recv.c b/drivers/staging/rtl8723bs/core/rtw_recv.c
index 1a52d3e1d285..c676ba4a9936 100644
--- a/drivers/staging/rtl8723bs/core/rtw_recv.c
+++ b/drivers/staging/rtl8723bs/core/rtw_recv.c
@@ -382,7 +382,7 @@ static signed int recvframe_chkmic(struct adapter *adapter,  union recv_frame *p
 
 				/* psecuritypriv->dot118021XGrpKeyid, pmlmeinfo->key_index, rxdata_key_idx); */
 
-				if (psecuritypriv->binstallGrpkey == false) {
+				if (psecuritypriv->install_grpkey == false) {
 					res = _FAIL;
 					goto exit;
 				}
@@ -1946,8 +1946,8 @@ static int recv_indicatepkts_in_order(struct adapter *padapter, struct recv_reor
 
 			/* indicate this recv_frame */
 			if (!pattrib->amsdu) {
-				if ((padapter->bDriverStopped == false) &&
-				    (padapter->bSurpriseRemoved == false))
+				if ((padapter->driver_stopped == false) &&
+				    (padapter->surprise_removed == false))
 					rtw_recv_indicatepkt(padapter, prframe);/* indicate this recv_frame */
 
 			} else if (pattrib->amsdu == 1) {
@@ -1987,8 +1987,8 @@ static int recv_indicatepkt_reorder(struct adapter *padapter, union recv_frame *
 		wlanhdr_to_ethhdr(prframe);
 
 		if (pattrib->qos != 1) {
-			if ((padapter->bDriverStopped == false) &&
-			    (padapter->bSurpriseRemoved == false)) {
+			if ((padapter->driver_stopped == false) &&
+			    (padapter->surprise_removed == false)) {
 				rtw_recv_indicatepkt(padapter, prframe);
 				return _SUCCESS;
 
@@ -2070,7 +2070,7 @@ void rtw_reordering_ctrl_timeout_handler(struct timer_list *t)
 	struct __queue *ppending_recvframe_queue = &preorder_ctrl->pending_recvframe_queue;
 
 
-	if (padapter->bDriverStopped || padapter->bSurpriseRemoved)
+	if (padapter->driver_stopped || padapter->surprise_removed)
 		return;
 
 	spin_lock_bh(&ppending_recvframe_queue->lock);
@@ -2095,8 +2095,8 @@ static int process_recv_indicatepkts(struct adapter *padapter, union recv_frame
 
 		if (recv_indicatepkt_reorder(padapter, prframe) != _SUCCESS) { /*  including perform A-MPDU Rx Ordering Buffer Control */
 
-			if ((padapter->bDriverStopped == false) &&
-			    (padapter->bSurpriseRemoved == false)) {
+			if ((padapter->driver_stopped == false) &&
+			    (padapter->surprise_removed == false)) {
 				retval = _FAIL;
 				return retval;
 			}
@@ -2106,7 +2106,7 @@ static int process_recv_indicatepkts(struct adapter *padapter, union recv_frame
 		if (retval != _SUCCESS)
 			return retval;
 
-		if ((padapter->bDriverStopped == false) && (padapter->bSurpriseRemoved == false)) {
+		if ((padapter->driver_stopped == false) && (padapter->surprise_removed == false)) {
 			/* indicate this recv_frame */
 			rtw_recv_indicatepkt(padapter, prframe);
 		} else {
diff --git a/drivers/staging/rtl8723bs/core/rtw_security.c b/drivers/staging/rtl8723bs/core/rtw_security.c
index 54e89f192b18..dc164e41aa16 100644
--- a/drivers/staging/rtl8723bs/core/rtw_security.c
+++ b/drivers/staging/rtl8723bs/core/rtw_security.c
@@ -525,7 +525,7 @@ u32 rtw_tkip_decrypt(struct adapter *padapter, u8 *precvframe)
 				static u32 no_gkey_bc_cnt;
 				static u32 no_gkey_mc_cnt;
 
-				if (!psecuritypriv->binstallGrpkey) {
+				if (!psecuritypriv->install_grpkey) {
 					res = _FAIL;
 
 					if (start == 0)
@@ -1217,7 +1217,7 @@ u32 rtw_aes_decrypt(struct adapter *padapter, u8 *precvframe)
 				static u32 no_gkey_bc_cnt;
 				static u32 no_gkey_mc_cnt;
 
-				if (!psecuritypriv->binstallGrpkey) {
+				if (!psecuritypriv->install_grpkey) {
 					res = _FAIL;
 
 					if (start == 0)
diff --git a/drivers/staging/rtl8723bs/hal/odm.c b/drivers/staging/rtl8723bs/hal/odm.c
index 639b6da2302b..a8aea404f8be 100644
--- a/drivers/staging/rtl8723bs/hal/odm.c
+++ b/drivers/staging/rtl8723bs/hal/odm.c
@@ -257,7 +257,7 @@ static void odm_RefreshRateAdaptiveMaskCE(struct dm_odm_t *pDM_Odm)
 	u8 i;
 	struct adapter *padapter =  pDM_Odm->Adapter;
 
-	if (padapter->bDriverStopped)
+	if (padapter->driver_stopped)
 		return;
 
 	if (!pDM_Odm->bUseRAMask)
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c b/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
index af6cdda8238d..705b706f30af 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
@@ -64,7 +64,7 @@ s32 FillH2CCmd8723B(struct adapter *padapter, u8 ElementID, u32 CmdLen, u8 *pCmd
 	if (CmdLen > RTL8723B_MAX_CMD_LEN)
 		goto exit;
 
-	if (padapter->bSurpriseRemoved)
+	if (padapter->surprise_removed)
 		goto exit;
 
 	/* pay attention to if  race condition happened in  H2C cmd setting. */
@@ -665,11 +665,11 @@ void rtl8723b_download_rsvd_page(struct adapter *padapter, u8 mstatus)
 				/*  check rsvd page download OK. */
 				rtw_hal_get_hwreg(padapter, HW_VAR_BCN_VALID, (u8 *)(&bcn_valid));
 				poll++;
-			} while (!bcn_valid && (poll%10) != 0 && !padapter->bSurpriseRemoved && !padapter->bDriverStopped);
+			} while (!bcn_valid && (poll%10) != 0 && !padapter->surprise_removed && !padapter->driver_stopped);
 
-		} while (!bcn_valid && DLBcnCount <= 100 && !padapter->bSurpriseRemoved && !padapter->bDriverStopped);
+		} while (!bcn_valid && DLBcnCount <= 100 && !padapter->surprise_removed && !padapter->driver_stopped);
 
-		if (padapter->bSurpriseRemoved || padapter->bDriverStopped) {
+		if (padapter->surprise_removed || padapter->driver_stopped) {
 		} else {
 			struct pwrctrl_priv *pwrctl = adapter_to_pwrctl(padapter);
 			pwrctl->fw_psmode_iface_id = padapter->iface_id;
@@ -930,8 +930,8 @@ void rtl8723b_download_BTCoex_AP_mode_rsvd_page(struct adapter *padapter)
 			/*  check rsvd page download OK. */
 			rtw_hal_get_hwreg(padapter, HW_VAR_BCN_VALID, &bcn_valid);
 			poll++;
-		} while (!bcn_valid && (poll%10) != 0 && !padapter->bSurpriseRemoved && !padapter->bDriverStopped);
-	} while (!bcn_valid && (DLBcnCount <= 100) && !padapter->bSurpriseRemoved && !padapter->bDriverStopped);
+		} while (!bcn_valid && (poll%10) != 0 && !padapter->surprise_removed && !padapter->driver_stopped);
+	} while (!bcn_valid && (DLBcnCount <= 100) && !padapter->surprise_removed && !padapter->driver_stopped);
 
 	if (bcn_valid) {
 		struct pwrctrl_priv *pwrctl = adapter_to_pwrctl(padapter);
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
index 513d0c346c5e..b36923f488a6 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
@@ -192,7 +192,7 @@ static s32 polling_fwdl_chksum(
 	do {
 		cnt++;
 		value32 = rtw_read32(adapter, REG_MCUFWDL);
-		if (value32 & FWDL_ChkSum_rpt || adapter->bSurpriseRemoved || adapter->bDriverStopped)
+		if (value32 & FWDL_ChkSum_rpt || adapter->surprise_removed || adapter->driver_stopped)
 			break;
 		yield();
 	} while (jiffies_to_msecs(jiffies-start) < timeout_ms || cnt < min_cnt);
@@ -233,7 +233,7 @@ static s32 _FWFreeToGo(struct adapter *adapter, u32 min_cnt, u32 timeout_ms)
 	do {
 		cnt++;
 		value32 = rtw_read32(adapter, REG_MCUFWDL);
-		if (value32 & WINTINI_RDY || adapter->bSurpriseRemoved || adapter->bDriverStopped)
+		if (value32 & WINTINI_RDY || adapter->surprise_removed || adapter->driver_stopped)
 			break;
 		yield();
 	} while (jiffies_to_msecs(jiffies - start) < timeout_ms || cnt < min_cnt);
@@ -389,8 +389,8 @@ s32 rtl8723b_FirmwareDownload(struct adapter *padapter, bool  bUsedWoWLANFw)
 	_FWDownloadEnable(padapter, true);
 	fwdl_start_time = jiffies;
 	while (
-		!padapter->bDriverStopped &&
-		!padapter->bSurpriseRemoved &&
+		!padapter->driver_stopped &&
+		!padapter->surprise_removed &&
 		(write_fw++ < 3 || jiffies_to_msecs(jiffies - fwdl_start_time) < 500)
 	) {
 		/* reset FWDL chksum */
@@ -2785,7 +2785,7 @@ void GetHwReg8723B(struct adapter *padapter, u8 variable, u8 *val)
 			u32 valRCR;
 
 			if (
-				padapter->bSurpriseRemoved  ||
+				padapter->surprise_removed  ||
 				(adapter_to_pwrctl(padapter)->rf_pwrstate == rf_off)
 			) {
 				/*  If it is in HW/SW Radio OFF or IPS state, we do not check Fw LPS Leave, */
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_phycfg.c b/drivers/staging/rtl8723bs/hal/rtl8723b_phycfg.c
index 6d5e531505f9..2b7ac57f0a19 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_phycfg.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_phycfg.c
@@ -670,7 +670,7 @@ static void phy_SwChnlAndSetBwMode8723B(struct adapter *Adapter)
 {
 	struct hal_com_data *pHalData = GET_HAL_DATA(Adapter);
 
-	if (Adapter->bDriverStopped || Adapter->bSurpriseRemoved)
+	if (Adapter->driver_stopped || Adapter->surprise_removed)
 		return;
 
 	if (pHalData->bSwChnl) {
@@ -738,7 +738,7 @@ static void PHY_HandleSwChnlAndSetBW8723B(
 	}
 
 	/* Switch workitem or set timer to do switch channel or setbandwidth operation */
-	if ((!Adapter->bDriverStopped) && (!Adapter->bSurpriseRemoved)) {
+	if ((!Adapter->driver_stopped) && (!Adapter->surprise_removed)) {
 		phy_SwChnlAndSetBwMode8723B(Adapter);
 	} else {
 		if (pHalData->bSwChnl) {
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c b/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
index 379d29d3f9d3..b03cbc47df2b 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
@@ -15,8 +15,8 @@ static u8 rtw_sdio_wait_enough_TxOQT_space(struct adapter *padapter, u8 agg_num)
 
 	while (pHalData->SdioTxOQTFreeSpace < agg_num) {
 		if (
-			(padapter->bSurpriseRemoved) ||
-			(padapter->bDriverStopped)
+			(padapter->surprise_removed) ||
+			(padapter->driver_stopped)
 		)
 			return false;
 
@@ -88,8 +88,8 @@ static s32 rtl8723_dequeue_writeport(struct adapter *padapter)
 	}
 
 	if (
-		(padapter->bSurpriseRemoved) ||
-		(padapter->bDriverStopped)
+		(padapter->surprise_removed) ||
+		(padapter->driver_stopped)
 	)
 		goto free_xmitbuf;
 
@@ -130,7 +130,7 @@ s32 rtl8723bs_xmit_buf_handler(struct adapter *padapter)
 		return _FAIL;
 	}
 
-	ret = (padapter->bDriverStopped) || (padapter->bSurpriseRemoved);
+	ret = (padapter->driver_stopped) || (padapter->surprise_removed);
 	if (ret)
 		return _FAIL;
 
@@ -365,8 +365,8 @@ static s32 rtl8723bs_xmit_handler(struct adapter *padapter)
 
 next:
 	if (
-		(padapter->bDriverStopped) ||
-		(padapter->bSurpriseRemoved)
+		(padapter->driver_stopped) ||
+		(padapter->surprise_removed)
 	)
 		return _FAIL;
 
diff --git a/drivers/staging/rtl8723bs/hal/sdio_ops.c b/drivers/staging/rtl8723bs/hal/sdio_ops.c
index 8cece69dbf79..8e1653beebb9 100644
--- a/drivers/staging/rtl8723bs/hal/sdio_ops.c
+++ b/drivers/staging/rtl8723bs/hal/sdio_ops.c
@@ -945,7 +945,7 @@ void sd_int_hdl(struct adapter *adapter)
 	struct hal_com_data *hal;
 
 	if (
-		(adapter->bDriverStopped) || (adapter->bSurpriseRemoved)
+		(adapter->driver_stopped) || (adapter->surprise_removed)
 	)
 		return;
 
diff --git a/drivers/staging/rtl8723bs/include/drv_types.h b/drivers/staging/rtl8723bs/include/drv_types.h
index 7ed375ba18d8..9f9321ad2c9c 100644
--- a/drivers/staging/rtl8723bs/include/drv_types.h
+++ b/drivers/staging/rtl8723bs/include/drv_types.h
@@ -297,8 +297,8 @@ struct adapter {
 	void *HalData;
 	u32 hal_data_sz;
 
-	s32	bDriverStopped;
-	s32	bSurpriseRemoved;
+	s32	driver_stopped;
+	s32	surprise_removed;
 	s32  bCardDisableWOHSM;
 
 	u32 IsrContent;
@@ -399,17 +399,17 @@ static inline void RTW_ENABLE_FUNC(struct adapter *padapter, int func_bit)
 #define RTW_IS_FUNC_DISABLED(padapter, func_bit) (atomic_read(&adapter_to_dvobj(padapter)->disable_func) & (func_bit))
 
 #define RTW_CANNOT_IO(padapter) \
-			((padapter)->bSurpriseRemoved || \
+			((padapter)->surprise_removed || \
 			 RTW_IS_FUNC_DISABLED((padapter), DF_IO_BIT))
 
 #define RTW_CANNOT_RX(padapter) \
-			((padapter)->bDriverStopped || \
-			 (padapter)->bSurpriseRemoved || \
+			((padapter)->driver_stopped || \
+			 (padapter)->surprise_removed || \
 			 RTW_IS_FUNC_DISABLED((padapter), DF_RX_BIT))
 
 #define RTW_CANNOT_TX(padapter) \
-			((padapter)->bDriverStopped || \
-			 (padapter)->bSurpriseRemoved || \
+			((padapter)->driver_stopped || \
+			 (padapter)->surprise_removed || \
 			 RTW_IS_FUNC_DISABLED((padapter), DF_TX_BIT))
 
 static inline u8 *myid(struct eeprom_priv *peepriv)
diff --git a/drivers/staging/rtl8723bs/include/rtw_pwrctrl.h b/drivers/staging/rtl8723bs/include/rtw_pwrctrl.h
index c27d07861b8c..2872501ac85f 100644
--- a/drivers/staging/rtl8723bs/include/rtw_pwrctrl.h
+++ b/drivers/staging/rtl8723bs/include/rtw_pwrctrl.h
@@ -164,7 +164,7 @@ struct pwrctrl_priv {
 	u8 ps_processing; /* temporarily used to mark whether in rtw_ps_processor */
 
 	u8 fw_psmode_iface_id;
-	u8 bLeisurePs;
+	u8 leisure_ps;
 	u8 LpsIdleCount;
 	u8 power_mgnt;
 	u8 org_power_mgnt;
@@ -174,8 +174,8 @@ struct pwrctrl_priv {
 	u8 pnp_bstop_trx;
 
 
-	u8 bInternalAutoSuspend;
-	u8 bInSuspend;
+	u8 internal_auto_suspend;
+	u8 in_suspend;
 
 	u8 bAutoResume;
 	u8 autopm_cnt;
diff --git a/drivers/staging/rtl8723bs/include/rtw_security.h b/drivers/staging/rtl8723bs/include/rtw_security.h
index 32f6d3a5e309..76af179c8981 100644
--- a/drivers/staging/rtl8723bs/include/rtw_security.h
+++ b/drivers/staging/rtl8723bs/include/rtw_security.h
@@ -126,7 +126,7 @@ struct security_priv {
 	struct arc4_ctx xmit_arc4_ctx;
 	struct arc4_ctx recv_arc4_ctx;
 
-	u8 binstallGrpkey;
+	u8 install_grpkey;
 	u8 binstallBIPkey;
 	u8 busetkipkey;
 	/* _timer tkip_timer; */
diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
index 47cba32375d9..a558592068e0 100644
--- a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
+++ b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
@@ -600,7 +600,7 @@ static int rtw_cfg80211_ap_set_encryption(struct net_device *dev, struct ieee_pa
 
 			psecuritypriv->dot118021XGrpKeyid = param->u.crypt.idx;
 
-			psecuritypriv->binstallGrpkey = true;
+			psecuritypriv->install_grpkey = true;
 
 			psecuritypriv->dot11PrivacyAlgrthm = psecuritypriv->dot118021XGrpPrivacy;/*  */
 
@@ -674,7 +674,7 @@ static int rtw_cfg80211_ap_set_encryption(struct net_device *dev, struct ieee_pa
 
 				psecuritypriv->dot118021XGrpKeyid = param->u.crypt.idx;
 
-				psecuritypriv->binstallGrpkey = true;
+				psecuritypriv->install_grpkey = true;
 
 				psecuritypriv->dot11PrivacyAlgrthm = psecuritypriv->dot118021XGrpPrivacy;/*  */
 
@@ -798,7 +798,7 @@ static int rtw_cfg80211_set_encryption(struct net_device *dev, struct ieee_param
 						memcpy(padapter->securitypriv.dot118021XGrpKey[param->u.crypt.idx].skey, param->u.crypt.key, (param->u.crypt.key_len > 16 ? 16 : param->u.crypt.key_len));
 						memcpy(padapter->securitypriv.dot118021XGrptxmickey[param->u.crypt.idx].skey, &(param->u.crypt.key[16]), 8);
 						memcpy(padapter->securitypriv.dot118021XGrprxmickey[param->u.crypt.idx].skey, &(param->u.crypt.key[24]), 8);
-						padapter->securitypriv.binstallGrpkey = true;
+						padapter->securitypriv.install_grpkey = true;
 
 						padapter->securitypriv.dot118021XGrpKeyid = param->u.crypt.idx;
 						rtw_set_key(padapter, &padapter->securitypriv, param->u.crypt.idx, 1, true);
diff --git a/drivers/staging/rtl8723bs/os_dep/os_intfs.c b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
index f2d64b05debb..c6d22d097af0 100644
--- a/drivers/staging/rtl8723bs/os_dep/os_intfs.c
+++ b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
@@ -530,7 +530,7 @@ static void rtw_init_default_value(struct adapter *padapter)
 	pmlmepriv->htpriv.ampdu_enable = false;/* set to disabled */
 
 	/* security_priv */
-	psecuritypriv->binstallGrpkey = _FAIL;
+	psecuritypriv->install_grpkey = _FAIL;
 	psecuritypriv->sw_encrypt = pregistrypriv->software_encrypt;
 	psecuritypriv->sw_decrypt = pregistrypriv->software_decrypt;
 
@@ -800,8 +800,8 @@ static int _netdev_open(struct net_device *pnetdev)
 	}
 
 	if (!padapter->bup) {
-		padapter->bDriverStopped = false;
-		padapter->bSurpriseRemoved = false;
+		padapter->driver_stopped = false;
+		padapter->surprise_removed = false;
 		padapter->bCardDisableWOHSM = false;
 
 		status = rtw_hal_init(padapter);
@@ -849,7 +849,7 @@ int netdev_open(struct net_device *pnetdev)
 	struct adapter *padapter = rtw_netdev_priv(pnetdev);
 	struct pwrctrl_priv *pwrctrlpriv = adapter_to_pwrctl(padapter);
 
-	if (pwrctrlpriv->bInSuspend)
+	if (pwrctrlpriv->in_suspend)
 		return 0;
 
 	if (mutex_lock_interruptible(&(adapter_to_dvobj(padapter)->hw_init_mutex)))
@@ -868,7 +868,7 @@ static int  ips_netdrv_open(struct adapter *padapter)
 
 	padapter->net_closed = false;
 
-	padapter->bDriverStopped = false;
+	padapter->driver_stopped = false;
 	padapter->bCardDisableWOHSM = false;
 	/* padapter->bup = true; */
 
@@ -905,7 +905,7 @@ void rtw_ips_pwr_down(struct adapter *padapter)
 
 void rtw_ips_dev_unload(struct adapter *padapter)
 {
-	if (!padapter->bSurpriseRemoved)
+	if (!padapter->surprise_removed)
 		rtw_hal_deinit(padapter);
 }
 
@@ -932,7 +932,7 @@ static int netdev_close(struct net_device *pnetdev)
 	struct adapter *padapter = rtw_netdev_priv(pnetdev);
 	struct pwrctrl_priv *pwrctl = adapter_to_pwrctl(padapter);
 
-	if (pwrctl->bInternalAutoSuspend) {
+	if (pwrctl->internal_auto_suspend) {
 		/* rtw_pwr_wakeup(padapter); */
 		if (pwrctl->rf_pwrstate == rf_off)
 			pwrctl->ps_flag = true;
@@ -975,14 +975,14 @@ void rtw_dev_unload(struct adapter *padapter)
 	u8 cnt = 0;
 
 	if (padapter->bup) {
-		padapter->bDriverStopped = true;
+		padapter->driver_stopped = true;
 		if (padapter->xmitpriv.ack_tx)
 			rtw_ack_tx_done(&padapter->xmitpriv, RTW_SCTX_DONE_DRV_STOP);
 
 		if (padapter->intf_stop)
 			padapter->intf_stop(padapter);
 
-		if (!pwrctl->bInternalAutoSuspend)
+		if (!pwrctl->internal_auto_suspend)
 			rtw_stop_drv_threads(padapter);
 
 		while (atomic_read(&pcmdpriv->cmdthd_running)) {
@@ -1005,13 +1005,13 @@ void rtw_dev_unload(struct adapter *padapter)
 				   "%s: driver not in IPS\n", __func__);
 		}
 
-		if (!padapter->bSurpriseRemoved) {
+		if (!padapter->surprise_removed) {
 			hal_btcoex_IpsNotify(padapter, pwrctl->ips_mode_req);
 
 			/* amy modify 20120221 for power seq is different between driver open and ips */
 			rtw_hal_deinit(padapter);
 
-			padapter->bSurpriseRemoved = true;
+			padapter->surprise_removed = true;
 		}
 
 		padapter->bup = false;
@@ -1088,12 +1088,12 @@ void rtw_suspend_common(struct adapter *padapter)
 
 	netdev_dbg(padapter->pnetdev, " suspend start\n");
 
-	pwrpriv->bInSuspend = true;
+	pwrpriv->in_suspend = true;
 
 	while (pwrpriv->bips_processing)
 		msleep(1);
 
-	if ((!padapter->bup) || (padapter->bDriverStopped) || (padapter->bSurpriseRemoved))
+	if ((!padapter->bup) || (padapter->driver_stopped) || (padapter->surprise_removed))
 		return;
 
 	rtw_ps_deny(padapter, PS_DENY_SUSPEND);
@@ -1185,7 +1185,7 @@ int rtw_resume_common(struct adapter *padapter)
 	hal_btcoex_SuspendNotify(padapter, 0);
 
 	if (pwrpriv)
-		pwrpriv->bInSuspend = false;
+		pwrpriv->in_suspend = false;
 
 	netdev_dbg(padapter->pnetdev, "%s:%d in %d ms\n", __func__, ret,
 		   jiffies_to_msecs(jiffies - start_time));
diff --git a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
index d664e254912c..126107d69a74 100644
--- a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
+++ b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
@@ -236,7 +236,7 @@ static struct adapter *rtw_sdio_if1_init(struct dvobj_priv *dvobj, const struct
 	padapter->dvobj = dvobj;
 	dvobj->if1 = padapter;
 
-	padapter->bDriverStopped = true;
+	padapter->driver_stopped = true;
 
 	dvobj->padapters = padapter;
 	padapter->iface_id = 0;
@@ -388,7 +388,7 @@ static void rtw_dev_remove(struct sdio_func *func)
 
 	rtw_unregister_netdevs(dvobj);
 
-	if (!padapter->bSurpriseRemoved) {
+	if (!padapter->surprise_removed) {
 		int err;
 
 		/* test surprise remove */
@@ -396,7 +396,7 @@ static void rtw_dev_remove(struct sdio_func *func)
 		sdio_readb(func, 0, &err);
 		sdio_release_host(func);
 		if (err == -ENOMEDIUM)
-			padapter->bSurpriseRemoved = true;
+			padapter->surprise_removed = true;
 	}
 
 	rtw_ps_deny(padapter, PS_DENY_DRV_REMOVE);
@@ -420,10 +420,10 @@ static int rtw_sdio_suspend(struct device *dev)
 	struct pwrctrl_priv *pwrpriv = dvobj_to_pwrctl(psdpriv);
 	struct adapter *padapter = psdpriv->if1;
 
-	if (padapter->bDriverStopped)
+	if (padapter->driver_stopped)
 		return 0;
 
-	if (pwrpriv->bInSuspend)
+	if (pwrpriv->in_suspend)
 		return 0;
 
 	rtw_suspend_common(padapter);
@@ -435,7 +435,7 @@ static int rtw_resume_process(struct adapter *padapter)
 {
 	struct pwrctrl_priv *pwrpriv = adapter_to_pwrctl(padapter);
 
-	if (!pwrpriv->bInSuspend)
+	if (!pwrpriv->in_suspend)
 		return -1;
 
 	return rtw_resume_common(padapter);
diff --git a/drivers/staging/rtl8723bs/os_dep/sdio_ops_linux.c b/drivers/staging/rtl8723bs/os_dep/sdio_ops_linux.c
index 3ea9fdfa14f8..cab8b20421ed 100644
--- a/drivers/staging/rtl8723bs/os_dep/sdio_ops_linux.c
+++ b/drivers/staging/rtl8723bs/os_dep/sdio_ops_linux.c
@@ -42,7 +42,7 @@ s32 _sd_cmd52_read(struct intf_hdl *pintfhdl, u32 addr, u32 cnt, u8 *pdata)
 	psdiodev = pintfhdl->pintf_dev;
 	psdio = &psdiodev->intf_data;
 
-	if (padapter->bSurpriseRemoved)
+	if (padapter->surprise_removed)
 		return err;
 
 	func = psdio->func;
@@ -74,7 +74,7 @@ s32 sd_cmd52_read(struct intf_hdl *pintfhdl, u32 addr, u32 cnt, u8 *pdata)
 	psdiodev = pintfhdl->pintf_dev;
 	psdio = &psdiodev->intf_data;
 
-	if (padapter->bSurpriseRemoved)
+	if (padapter->surprise_removed)
 		return err;
 
 	func = psdio->func;
@@ -106,7 +106,7 @@ s32 _sd_cmd52_write(struct intf_hdl *pintfhdl, u32 addr, u32 cnt, u8 *pdata)
 	psdiodev = pintfhdl->pintf_dev;
 	psdio = &psdiodev->intf_data;
 
-	if (padapter->bSurpriseRemoved)
+	if (padapter->surprise_removed)
 		return err;
 
 	func = psdio->func;
@@ -138,7 +138,7 @@ s32 sd_cmd52_write(struct intf_hdl *pintfhdl, u32 addr, u32 cnt, u8 *pdata)
 	psdiodev = pintfhdl->pintf_dev;
 	psdio = &psdiodev->intf_data;
 
-	if (padapter->bSurpriseRemoved)
+	if (padapter->surprise_removed)
 		return err;
 
 	func = psdio->func;
@@ -166,7 +166,7 @@ u8 sd_read8(struct intf_hdl *pintfhdl, u32 addr, s32 *err)
 	psdiodev = pintfhdl->pintf_dev;
 	psdio = &psdiodev->intf_data;
 
-	if (padapter->bSurpriseRemoved)
+	if (padapter->surprise_removed)
 		return v;
 
 	func = psdio->func;
@@ -193,7 +193,7 @@ u32 sd_read32(struct intf_hdl *pintfhdl, u32 addr, s32 *err)
 	psdiodev = pintfhdl->pintf_dev;
 	psdio = &psdiodev->intf_data;
 
-	if (padapter->bSurpriseRemoved)
+	if (padapter->surprise_removed)
 		return v;
 
 	func = psdio->func;
@@ -222,10 +222,10 @@ u32 sd_read32(struct intf_hdl *pintfhdl, u32 addr, s32 *err)
 			}
 
 			if ((-ESHUTDOWN == *err) || (-ENODEV == *err))
-				padapter->bSurpriseRemoved = true;
+				padapter->surprise_removed = true;
 
 			if (rtw_inc_and_chk_continual_io_error(psdiodev) == true) {
-				padapter->bSurpriseRemoved = true;
+				padapter->surprise_removed = true;
 				break;
 			}
 		}
@@ -245,7 +245,7 @@ void sd_write8(struct intf_hdl *pintfhdl, u32 addr, u8 v, s32 *err)
 	psdiodev = pintfhdl->pintf_dev;
 	psdio = &psdiodev->intf_data;
 
-	if (padapter->bSurpriseRemoved)
+	if (padapter->surprise_removed)
 		return;
 
 	func = psdio->func;
@@ -270,7 +270,7 @@ void sd_write32(struct intf_hdl *pintfhdl, u32 addr, u32 v, s32 *err)
 	psdiodev = pintfhdl->pintf_dev;
 	psdio = &psdiodev->intf_data;
 
-	if (padapter->bSurpriseRemoved)
+	if (padapter->surprise_removed)
 		return;
 
 	func = psdio->func;
@@ -298,10 +298,10 @@ void sd_write32(struct intf_hdl *pintfhdl, u32 addr, u32 v, s32 *err)
 			}
 
 			if ((-ESHUTDOWN == *err) || (-ENODEV == *err))
-				padapter->bSurpriseRemoved = true;
+				padapter->surprise_removed = true;
 
 			if (rtw_inc_and_chk_continual_io_error(psdiodev) == true) {
-				padapter->bSurpriseRemoved = true;
+				padapter->surprise_removed = true;
 				break;
 			}
 		}
@@ -336,7 +336,7 @@ s32 _sd_read(struct intf_hdl *pintfhdl, u32 addr, u32 cnt, void *pdata)
 	psdiodev = pintfhdl->pintf_dev;
 	psdio = &psdiodev->intf_data;
 
-	if (padapter->bSurpriseRemoved)
+	if (padapter->surprise_removed)
 		return err;
 
 	func = psdio->func;
@@ -386,7 +386,7 @@ s32 sd_read(struct intf_hdl *pintfhdl, u32 addr, u32 cnt, void *pdata)
 	psdiodev = pintfhdl->pintf_dev;
 	psdio = &psdiodev->intf_data;
 
-	if (padapter->bSurpriseRemoved)
+	if (padapter->surprise_removed)
 		return err;
 
 	func = psdio->func;
@@ -429,7 +429,7 @@ s32 _sd_write(struct intf_hdl *pintfhdl, u32 addr, u32 cnt, void *pdata)
 	psdiodev = pintfhdl->pintf_dev;
 	psdio = &psdiodev->intf_data;
 
-	if (padapter->bSurpriseRemoved)
+	if (padapter->surprise_removed)
 		return err;
 
 	func = psdio->func;
@@ -480,7 +480,7 @@ s32 sd_write(struct intf_hdl *pintfhdl, u32 addr, u32 cnt, void *pdata)
 	psdiodev = pintfhdl->pintf_dev;
 	psdio = &psdiodev->intf_data;
 
-	if (padapter->bSurpriseRemoved)
+	if (padapter->surprise_removed)
 		return err;
 
 	func = psdio->func;
-- 
2.53.0

