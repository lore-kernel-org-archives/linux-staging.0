Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61E6F282F30
	for <linux-staging@lists.linux.dev>; Sat, 18 Apr 2026 16:47:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776530856; cv=none; b=sRwWjB/Zx3c3lej4K69p6F7m27kKO+XXEKj0uvJqoSrrMefCloNIb9VgNtwJMjmJcVgQ4AZoSd5eanlMM1ttwyehIQ+gRrf7EFa56LIYXSPeWr7ltQ/ngR1f2M9G4XNacgi422xu9zqiNquSR9dn1COLm2y3/Z9PSYziOOGqSXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776530856; c=relaxed/simple;
	bh=tmJT43AypjjE6e5vBKmblh07+ro1Vm9Ao5OiiIoAHMo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=X9dbCvPE2bK3Uqj6mE6Z+YWft7dFC6ZO0R1y6krytLLvj7/vtRAj6MtfW/vSEvpgpVgRaDnYvoZay+nlakWEMZnUSUpchUng/I409uU/FR1grnkOM7SFlk+Yu33HB/pPjOEsMKxhXuQYTs/P1ToEOUwTIVtOMWEOfvpRAoSK01A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=crimson.net.eu.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=crimson.net.eu.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-488b150559bso12722975e9.1
        for <linux-staging@lists.linux.dev>; Sat, 18 Apr 2026 09:47:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776530853; x=1777135653;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PosRtc72mrCXOGf7Y0BHBJl8eUZQ01weq4M+FpaeyGA=;
        b=Bw2g7tXv5bj5WyKkvoy8mjLiAQ391gRhr/WuyLj5Ak/8ZsdrVET7NTbs3KctxLIYuu
         S811pIEsSaxPu9i/hmPfrpiU5HiRhWqJExoHe+fDOEyOlkhNRiHAnJFkxQmuXttqoUGT
         Q2fWfUfdoUx/QFPzLDSpBNoF3T4uD1I3MlPZUL9zW+YAON1dlhiZ+P2c8vcnxP2UmqfN
         EWPAbmH5WF3jpkj/gwj/GzUkQnmZ7cFpWStBieWFf3/QDAsVv2auFfcT0DqJSA3/Z8E9
         hLzKRCjTNKOp31PhyO1stZaA2z5mYv5Qz3mx+7xuv4Q1sEX2PEyvSJkGZoCbTbBViz/i
         IuYQ==
X-Forwarded-Encrypted: i=1; AFNElJ8BQL/eZfSE2TJJkF2I9v5D7obQvXQCL2iFWxcvTjh/GojlefNQxKOJVMAOZj/qdLJZtejx0ny4ksN7L3c/@lists.linux.dev
X-Gm-Message-State: AOJu0Yz99LQW+MgHCkEGtjN2ERtfQF4xMw/Y8Kr8gfm6ltwgUMvuHB+z
	LL+EFfoPyppEoF/LJeeuWN7ju0k6e+UQ9HhvI8fvYUzHx7QN0LV5KbBD
X-Gm-Gg: AeBDiesPLq8Jru3Jfc8XPG0KDtCiLv0JNdB7QNOi3PhVBuEGP9OwxR92HMHIcqTFMq5
	q6wY8ubvwMlvxFgfOqPHgW7UqDdk3GVweVJtbgxpsdxIC/NX/Lyq+qxfc1KFGiPt4rRTx96qrkO
	bWFI2ZntiWlXmV6c2O65lg0DadANCaUFK6Xl5rLmLS/yzBcNUa2igffaX2dwuNdHlqPLSzb/yKG
	V6LUqqnc0j2QtNYqCMmeozaDDrn/9/qLRTS0NQDG9/PjferlYOQ9maXLvVl4xssj6+saZhfC6fe
	GnniLnUcP5EkVzpGGFhwI4dfvZixOmAz7cmlkItwY0ugPnZoeA9DnHTYAcezkisxsgZcfZF7PBx
	S8G4M2guQBqWvRrNUt3v8nbIHG2CLou4FPI+k7CpoecVzedwBfEo9IB7kM1lLXMNcIWPJZv34Dn
	842mIvTE43jqYrxpCX+H+IRooq8F09YqaJJP/9n40GAvwMkntdYrD1fAbUDEYTaRJBbAJYlo0jz
	JAOShlkKFjhKMFyL/rA8twRxWfQKIemJijPm6P6gwbN
X-Received: by 2002:a05:600c:c0c8:b0:487:21c7:2885 with SMTP id 5b1f17b1804b1-488fb73d9ffmr81681675e9.5.1776530852586;
        Sat, 18 Apr 2026 09:47:32 -0700 (PDT)
Received: from localhost.localdomain ([151.41.34.202])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fb7bd700sm44349075e9.31.2026.04.18.09.47.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Apr 2026 09:47:32 -0700 (PDT)
From: deep@crimson.net.eu.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dan Carpenter <error27@gmail.com>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Kenet Jovan Sokoli <deep@crimson.net.eu.org>
Subject: [PATCH] staging: rtl8723bs: refactor code flow and fix sleep ranges
Date: Sat, 18 Apr 2026 18:47:19 +0200
Message-ID: <20260418164719.1069618-1-deep@crimson.net.eu.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Kenet Jovan Sokoli <deep@crimson.net.eu.org>

Clean up core files to improve readability and style compliance

- Flatten deeply nested if-statements mainly in rtw_security.c.
- Correct usleep_range() arguments where min > max.
- Improve code flow and readability by using early returns/breaks.

Signed-off-by: Kenet Jovan Sokoli <deep@crimson.net.eu.org>
---
some if statements still give warnings when checked with checkpatch.pl.
I thought about removing them entirely since they're currently blank,
but decided against it. If it is necessary to revert them or delete them,
please let me know.
---
 drivers/staging/rtl8723bs/core/rtw_cmd.c      |   3 +-
 drivers/staging/rtl8723bs/core/rtw_mlme.c     |   8 +-
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c |   3 +-
 drivers/staging/rtl8723bs/core/rtw_pwrctrl.c  |   6 +-
 drivers/staging/rtl8723bs/core/rtw_recv.c     |  10 +-
 drivers/staging/rtl8723bs/core/rtw_security.c | 120 +++++++++---------
 drivers/staging/rtl8723bs/core/rtw_xmit.c     |   3 +-
 7 files changed, 77 insertions(+), 76 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
index abb84f8aecbe..439591608c84 100644
--- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
+++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
@@ -8,6 +8,7 @@
 #include <hal_btcoex.h>
 #include <linux/jiffies.h>
 #include <linux/align.h>
+#include <linux/delay.h>
 
 static struct _cmd_callback rtw_cmd_callback[] = {
 	{GEN_CMD_CODE(_Read_MACREG), NULL}, /*0*/
@@ -214,7 +215,7 @@ void _rtw_free_evt_priv(struct	evt_priv *pevtpriv)
 {
 	_cancel_workitem_sync(&pevtpriv->c2h_wk);
 	while (pevtpriv->c2h_wk_alive)
-		msleep(10);
+		usleep_range(10000, 11000);
 
 	while (!rtw_cbuf_empty(pevtpriv->c2h_queue)) {
 		void *c2h = rtw_cbuf_pop(pevtpriv->c2h_queue);
diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index 1ef48bf6581c..dd9d6af127ab 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -501,7 +501,7 @@ void rtw_update_scanned_network(struct adapter *adapter, struct wlan_bssid_ex *t
 		}
 
 		if (rtw_roam_flags(adapter)) {
-			/* TODO: don't select network in the same ess as oldest if it's new enough*/
+			/* TODO: don't select network in the same ess as oldest if it's new enough */
 		}
 
 		if (!oldest || time_after(oldest->last_scanned, pnetwork->last_scanned))
@@ -1195,10 +1195,8 @@ void rtw_joinbss_event_prehandle(struct adapter *adapter, u8 *pbuf)
 						rtw_free_stainfo(adapter,  pcur_sta);
 
 					ptarget_wlan = rtw_find_network(&pmlmepriv->scanned_queue, pnetwork->network.mac_address);
-					if (check_fwstate(pmlmepriv, WIFI_STATION_STATE)) {
-						if (ptarget_wlan)
-							ptarget_wlan->fixed = true;
-					}
+					if (check_fwstate(pmlmepriv, WIFI_STATION_STATE) && ptarget_wlan)
+						ptarget_wlan->fixed = true;
 				}
 
 			} else {
diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index b1f20aa81efb..53bc015c0deb 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -9,6 +9,7 @@
 #include <hal_btcoex.h>
 #include <linux/kernel.h>
 #include <linux/unaligned.h>
+#include <linux/delay.h>
 
 static struct mlme_handler mlme_sta_tbl[] = {
 	{WIFI_ASSOCREQ,		"OnAssocReq",	&OnAssocReq},
@@ -5833,7 +5834,7 @@ u8 chk_bmc_sleepq_hdl(struct adapter *padapter, unsigned char *pbuf)
 		return H2C_SUCCESS;
 
 	if ((pstapriv->tim_bitmap & BIT(0)) && (psta_bmc->sleepq_len > 0)) {
-		msleep(10);/*  10ms, ATIM(HIQ) Windows */
+		usleep_range(10000, 11000);/*  10ms, ATIM(HIQ) Windows */
 
 		/* spin_lock_bh(&psta_bmc->sleep_q.lock); */
 		spin_lock_bh(&pxmitpriv->lock);
diff --git a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
index 1c9e02732687..e78f80f9d3b5 100644
--- a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
+++ b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
@@ -7,6 +7,7 @@
 #include <drv_types.h>
 #include <hal_data.h>
 #include <linux/jiffies.h>
+#include <linux/delay.h>
 
 void _ips_enter(struct adapter *padapter)
 {
@@ -420,7 +421,7 @@ s32 LPS_RF_ON_check(struct adapter *padapter, u32 delay_ms)
 			err = -1;
 			break;
 		}
-		msleep(1);
+		usleep_range(1000, 2000);
 	}
 
 	return err;
@@ -571,7 +572,7 @@ void LPS_Leave_check(struct adapter *padapter)
 		if (jiffies_to_msecs(jiffies - start_time) > 100)
 			break;
 
-		msleep(1);
+		usleep_range(1000, 2000);
 	}
 }
 
@@ -991,6 +992,7 @@ void rtw_free_pwrctrl_priv(struct adapter *adapter)
 inline void rtw_set_ips_deny(struct adapter *padapter, u32 ms)
 {
 	struct pwrctrl_priv *pwrpriv = adapter_to_pwrctl(padapter);
+
 	pwrpriv->ips_deny_time = jiffies + msecs_to_jiffies(ms);
 }
 
diff --git a/drivers/staging/rtl8723bs/core/rtw_recv.c b/drivers/staging/rtl8723bs/core/rtw_recv.c
index 337671b1211f..a83d60dbd3ea 100644
--- a/drivers/staging/rtl8723bs/core/rtw_recv.c
+++ b/drivers/staging/rtl8723bs/core/rtw_recv.c
@@ -1339,11 +1339,10 @@ static signed int validate_recv_data_frame(struct adapter *adapter, union recv_f
 
 	}
 
-	if (ret == _FAIL) {
+	if (ret == _FAIL)
 		goto exit;
-	} else if (ret == RTW_RX_HANDLED) {
+	else if (ret == RTW_RX_HANDLED)
 		goto exit;
-	}
 
 
 	if (!psta) {
@@ -1593,7 +1592,7 @@ static signed int wlanhdr_to_ethhdr(union recv_frame *precvframe)
 	eth_type = ntohs(be_tmp); /* pattrib->ether_type */
 	pattrib->eth_type = eth_type;
 
-	if ((check_fwstate(pmlmepriv, WIFI_MP_STATE) == true)) {
+	if (check_fwstate(pmlmepriv, WIFI_MP_STATE) == true) {
 		ptr += rmv_len;
 		*ptr = 0x87;
 		*(ptr+1) = 0x12;
@@ -1837,8 +1836,7 @@ static int enqueue_reorder_recvframe(struct recv_reorder_ctrl *preorder_ctrl, un
 			/* Duplicate entry is found!! Do not insert current entry. */
 			/* spin_unlock_irqrestore(&ppending_recvframe_queue->lock, irql); */
 			return false;
-		else
-			break;
+		break;
 
 	}
 
diff --git a/drivers/staging/rtl8723bs/core/rtw_security.c b/drivers/staging/rtl8723bs/core/rtw_security.c
index b489babe7432..084dda858582 100644
--- a/drivers/staging/rtl8723bs/core/rtw_security.c
+++ b/drivers/staging/rtl8723bs/core/rtw_security.c
@@ -521,82 +521,82 @@ u32 rtw_tkip_decrypt(struct adapter *padapter, u8 *precvframe)
 	pframe = (unsigned char *)((union recv_frame *)precvframe)->u.hdr.rx_data;
 
 	/* 4 start to decrypt recvframe */
-	if (prxattrib->encrypt == _TKIP_) {
-		stainfo = rtw_get_stainfo(&padapter->stapriv, &prxattrib->ta[0]);
-		if (stainfo) {
-			if (is_multicast_ether_addr(prxattrib->ra)) {
-				static unsigned long start;
-				static u32 no_gkey_bc_cnt;
-				static u32 no_gkey_mc_cnt;
+	if (prxattrib->encrypt != _TKIP_)
+		goto exit;
 
-				if (!psecuritypriv->binstallGrpkey) {
-					res = _FAIL;
+	stainfo = rtw_get_stainfo(&padapter->stapriv, &prxattrib->ta[0]);
+	if (!stainfo) {
+		res = _FAIL;
+		goto exit;
+	}
 
-					if (start == 0)
-						start = jiffies;
+	if (is_multicast_ether_addr(prxattrib->ra)) {
+		static unsigned long start;
+		static u32 no_gkey_bc_cnt;
+		static u32 no_gkey_mc_cnt;
 
-					if (is_broadcast_mac_addr(prxattrib->ra))
-						no_gkey_bc_cnt++;
-					else
-						no_gkey_mc_cnt++;
+		if (!psecuritypriv->binstallGrpkey) {
+			res = _FAIL;
 
-					if (jiffies_to_msecs(jiffies - start) > 1000) {
-						if (no_gkey_bc_cnt || no_gkey_mc_cnt) {
-							netdev_dbg(padapter->pnetdev,
-								   FUNC_ADPT_FMT " no_gkey_bc_cnt:%u, no_gkey_mc_cnt:%u\n",
-								   FUNC_ADPT_ARG(padapter),
-								   no_gkey_bc_cnt,
-								   no_gkey_mc_cnt);
-						}
-						start = jiffies;
-						no_gkey_bc_cnt = 0;
-						no_gkey_mc_cnt = 0;
-					}
-					goto exit;
-				}
+			if (start == 0)
+				start = jiffies;
 
-				if (no_gkey_bc_cnt || no_gkey_mc_cnt) {
-					netdev_dbg(padapter->pnetdev,
-						   FUNC_ADPT_FMT " gkey installed. no_gkey_bc_cnt:%u, no_gkey_mc_cnt:%u\n",
-						   FUNC_ADPT_ARG(padapter),
-						   no_gkey_bc_cnt,
-						   no_gkey_mc_cnt);
-				}
-				start = 0;
+			if (is_broadcast_mac_addr(prxattrib->ra))
+				no_gkey_bc_cnt++;
+			else
+				no_gkey_mc_cnt++;
+
+			if (jiffies_to_msecs(jiffies - start) > 1000 && (no_gkey_bc_cnt || no_gkey_mc_cnt)) {
+				netdev_dbg(padapter->pnetdev,
+						FUNC_ADPT_FMT " no_gkey_bc_cnt:%u, no_gkey_mc_cnt:%u\n",
+						FUNC_ADPT_ARG(padapter),
+						no_gkey_bc_cnt,
+						no_gkey_mc_cnt);
+				start = jiffies;
 				no_gkey_bc_cnt = 0;
 				no_gkey_mc_cnt = 0;
-
-				prwskey = psecuritypriv->dot118021XGrpKey[prxattrib->key_index].skey;
-			} else {
-				prwskey = &stainfo->dot118021x_UncstKey.skey[0];
 			}
+			goto exit;
+		}
 
-			iv = pframe + prxattrib->hdrlen;
-			payload = pframe + prxattrib->iv_len + prxattrib->hdrlen;
-			length = ((union recv_frame *)precvframe)->u.hdr.len - prxattrib->hdrlen - prxattrib->iv_len;
+		if (no_gkey_bc_cnt || no_gkey_mc_cnt) {
+			netdev_dbg(padapter->pnetdev,
+					FUNC_ADPT_FMT " gkey installed. no_gkey_bc_cnt:%u, no_gkey_mc_cnt:%u\n",
+					FUNC_ADPT_ARG(padapter),
+					no_gkey_bc_cnt,
+					no_gkey_mc_cnt);
+		}
+		start = 0;
+		no_gkey_bc_cnt = 0;
+		no_gkey_mc_cnt = 0;
 
-			GET_TKIP_PN(iv, dot11txpn);
+		prwskey = psecuritypriv->dot118021XGrpKey[prxattrib->key_index].skey;
+	} else {
+		prwskey = &stainfo->dot118021x_UncstKey.skey[0];
+	}
 
-			pnl = (u16)(dot11txpn.val);
-			pnh = (u32)(dot11txpn.val >> 16);
+	iv = pframe + prxattrib->hdrlen;
+	payload = pframe + prxattrib->iv_len + prxattrib->hdrlen;
+	length = ((union recv_frame *)precvframe)->u.hdr.len - prxattrib->hdrlen - prxattrib->iv_len;
 
-			phase1((u16 *)&ttkey[0], prwskey, &prxattrib->ta[0], pnh);
-			phase2(&rc4key[0], prwskey, (unsigned short *)&ttkey[0], pnl);
+	GET_TKIP_PN(iv, dot11txpn);
 
-			/* 4 decrypt payload include icv */
+	pnl = (u16)(dot11txpn.val);
+	pnh = (u32)(dot11txpn.val >> 16);
 
-			arc4_setkey(ctx, rc4key, 16);
-			arc4_crypt(ctx, payload, payload, length);
+	phase1((u16 *)&ttkey[0], prwskey, &prxattrib->ta[0], pnh);
+	phase2(&rc4key[0], prwskey, (unsigned short *)&ttkey[0], pnl);
 
-			*((u32 *)crc) = ~crc32_le(~0, payload, length - 4);
+	/* 4 decrypt payload include icv */
 
-			if (crc[3] != payload[length - 1] || crc[2] != payload[length - 2] ||
-			    crc[1] != payload[length - 3] || crc[0] != payload[length - 4])
-				res = _FAIL;
-		} else {
-			res = _FAIL;
-		}
-	}
+	arc4_setkey(ctx, rc4key, 16);
+	arc4_crypt(ctx, payload, payload, length);
+
+	*((u32 *)crc) = ~crc32_le(~0, payload, length - 4);
+
+	if (crc[3] != payload[length - 1] || crc[2] != payload[length - 2] ||
+		crc[1] != payload[length - 3] || crc[0] != payload[length - 4])
+		res = _FAIL;
 exit:
 	return res;
 }
diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c b/drivers/staging/rtl8723bs/core/rtw_xmit.c
index 7b18be8912e6..1904b9162262 100644
--- a/drivers/staging/rtl8723bs/core/rtw_xmit.c
+++ b/drivers/staging/rtl8723bs/core/rtw_xmit.c
@@ -5,6 +5,7 @@
  *
  ******************************************************************************/
 #include <drv_types.h>
+#include <linux/delay.h>
 
 static u8 P802_1H_OUI[P80211_OUI_LEN] = { 0x00, 0x00, 0xf8 };
 static u8 RFC1042_OUI[P80211_OUI_LEN] = { 0x00, 0x00, 0x00 };
@@ -128,7 +129,7 @@ s32 _rtw_init_xmit_priv(struct xmit_priv *pxmitpriv, struct adapter *padapter)
 		/* Tx buf allocation may fail sometimes, so sleep and retry. */
 		res = rtw_os_xmit_resource_alloc(padapter, pxmitbuf, (MAX_XMITBUF_SZ + XMITBUF_ALIGN_SZ), true);
 		if (res == _FAIL) {
-			msleep(10);
+			usleep_range(10000, 11000);
 			res = rtw_os_xmit_resource_alloc(padapter, pxmitbuf, (MAX_XMITBUF_SZ + XMITBUF_ALIGN_SZ), true);
 			if (res == _FAIL)
 				goto exit;
-- 
2.43.0

