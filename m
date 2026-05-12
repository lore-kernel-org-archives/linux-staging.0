Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D15913C455F
	for <linux-staging@lists.linux.dev>; Tue, 12 May 2026 05:47:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778564865; cv=none; b=issT5ruaP0WFuXwzvlc9xZitr5Osv6sEpYkTXmuIbBzLYNxf9U1ZadPmTFy4ScqjtR7mrY+Jp4s16EsqPyrFwmikdcXKdZEp5RPyJt4LeP5sDe9Jj1SeDcQOzKk4/pGOyUzho1iJpqxet+d6JEExu869MtCPveKx6g0nokuGZ2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778564865; c=relaxed/simple;
	bh=xT7HEMeOiJVWoEw5Ip8GmBvl6eJHYgkEa8jFY5VBKn4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=BtFxLSf+s0zZdCPNHA/z46O6XORvtJnSbclMPaUR3d0C8j5HvktO2N0Qrbu6bM4757wnyKvBOKp85kC9H1wbDZS48LpFZ8Q3McfEA3ttYMUFT5S2Z3bljuzXq2gKNEB5/lpB0rAC+/cfVOCpGorCWQ4PqopUlO30R9T7YCOLAK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rK8Jc+Ao; arc=none smtp.client-ip=74.125.82.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rK8Jc+Ao"
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-12c8f9846c8so7455141c88.0
        for <linux-staging@lists.linux.dev>; Mon, 11 May 2026 22:47:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778564839; x=1779169639; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1n9yK5xnaGyW0IUzFo2XKuuG7fyDHSk/1QihT8INc9c=;
        b=rK8Jc+Aozu0oYDJUyYtrgsAq2YeznUvcikFycHAt+4l8cggtQmkdfxNfJTrNvDMbNs
         feZOFiUPhUszF85Iehs3ctcoSv8BFTvDyNC+AxrVbnQOHbKiwhRH+2yZzafZ+g/lt8kS
         /llThLnyvVYFrtNUukISSKoZIfUbaB4SauFlDRPZVe5/KWX5NmTPQsc81tcW9xqz+atk
         QjfG8TkjJmtjeaRXvJFoBF4j9hyWgqp0hsCC5nURQT3IL4LH9Urul/QErXqKJW6azEXj
         T0lAE5dcjr48ruFxOErPKXvX2fqoDBfuK0Rc4+ZP3V39v6RObc5UTyZtKI5VCaTn9QKh
         i47Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778564839; x=1779169639;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1n9yK5xnaGyW0IUzFo2XKuuG7fyDHSk/1QihT8INc9c=;
        b=i7yt0zsZMqK06n/0IVGkFGGP7Nh/5NRANT6qiNirPY5mEnU2Jcva8kEU0m4vYJ1vL8
         052A2fvU1Cqwa2Ivq8BlI2CQa0AXhqIQ5jJdAG9ve2UG5+6QX3CKYrTSISq35B4mzKpO
         gjc5CbAqkUoEx8E10rOcpSuaOKXruUN16ZznexmOCRR8DOtTbjl6sAW/om/tIuMs7ZlU
         W3UcJgTUfONYnGjUKX5KeDsb/0gemYOuMVBtQO+5BuaLiyiMvCOXUSq2TOFazRg/KvJ1
         LR+Ot+HL7vlnCoP/fiOBKYljOm1P0NUi/yzUW8/KfCys15CIRPAtLCJg31ELbr2KHA6X
         ivRg==
X-Gm-Message-State: AOJu0YyWiiYXgaYF5GjnIsO232Rp04HfGHlYPBj66xiiw/hO1FYeIrEe
	YkDqj7ZF9AZvwm3O5c3n+5BIhv9TQkZoyanZ13VxifP80V/czDnR99uLENupCw==
X-Gm-Gg: Acq92OFkO/IIoxN/9+mHTRREpcY59zJHo0LXrJb6laQ7qXnwGgBmum4de0NJxRkrljQ
	YbzZ9a4WCBMyaVWDajRhbF1cMXOQHl3HS/fmv4GhTYc7WnqAJj/AobdU10mxqrFlc3wpiJb1yKN
	LPWZRujh2xfz8bbmfhpBINO3nMm/3e1W++O8b0EvvE2gfNnTrHFtkqre0N12s0OXAh2f5L1KB3B
	XFMX2H3jZadPcBz8b1jUDjv08bGCXdw2ExlFDTwlZNUfPuKGPYloJ5cxC1blAW1FuBdPdbewbms
	+dwutyxWdDkJh3OniZbbJGsWvr5c11l+8/XfYlLT/74NNodWlrQkEtDkWxdP8zNFRPPYHYZ013K
	jY37nYbDSbHhbpnUzqKbTaa2FTaF8bO5WZLXbRXL+1sn2hIdnvkLaKyNeT0DwTDVSxfv+4F/pTI
	UqjQzLTB5XCvQLcUC03sg44DOUpWboowfX
X-Received: by 2002:a05:7022:11f:b0:132:fac:2fb2 with SMTP id a92af1059eb24-13344b2eae8mr1199729c88.8.1778564838663;
        Mon, 11 May 2026 22:47:18 -0700 (PDT)
Received: from TestUbuntu22.. ([73.15.108.84])
        by smtp.googlemail.com with ESMTPSA id a92af1059eb24-1327865955fsm22163322c88.11.2026.05.11.22.47.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 22:47:18 -0700 (PDT)
From: Jennifer Guo <guojy.bj@gmail.com>
To: linux-staging@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	mokshpanicker.7@gmail.com,
	Jennifer Guo <guojy.bj@gmail.com>
Subject: [PATCH] staging: rtl8723bs: fix unbalanced braces in 3 files
Date: Mon, 11 May 2026 22:46:55 -0700
Message-Id: <20260512054655.4800-1-guojy.bj@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add missing braces to if/else statements to comply with kernel coding
style.

This fixes the following checkpatch.pl checks:
- CHECK: Unbalanced braces around else statement
- CHECK: braces {} should be used on all arms of this statement

Signed-off-by: Jennifer Guo <guojy.bj@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_efuse.c |  4 ++--
 drivers/staging/rtl8723bs/core/rtw_mlme.c  | 17 ++++++++++-------
 drivers/staging/rtl8723bs/core/rtw_xmit.c  |  3 ++-
 3 files changed, 14 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_efuse.c b/drivers/staging/rtl8723bs/core/rtw_efuse.c
index 803a608b74fa..a40d6eab7249 100644
--- a/drivers/staging/rtl8723bs/core/rtw_efuse.c
+++ b/drivers/staging/rtl8723bs/core/rtw_efuse.c
@@ -76,9 +76,9 @@ u16		Address)
 				break;
 		}
 		return rtw_read8(Adapter, EFUSE_CTRL);
-	} else
+	} else {
 		return 0xFF;
-
+	}
 } /* rtw_efuse_read_1_byte */
 
 /*  11/16/2008 MH Read one byte from real Efuse. */
diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index 963b53027c68..6be53e6df1f5 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -742,9 +742,9 @@ void rtw_surveydone_event_callback(struct adapter	*adapter, u8 *pbuf)
 					} else {
 						pmlmepriv->to_join = true;
 					}
-				} else
+				} else {
 					rtw_indicate_disconnect(adapter);
-
+				}
 				_clr_fwstate_(pmlmepriv, _FW_UNDER_LINKING);
 			}
 		}
@@ -1554,15 +1554,17 @@ void rtw_mlme_reset_auto_scan_int(struct adapter *adapter)
 	struct mlme_ext_priv *pmlmeext = &adapter->mlmeextpriv;
 	struct mlme_ext_info *pmlmeinfo = &pmlmeext->mlmext_info;
 
-	if (pmlmeinfo->VHT_enable) /* disable auto scan when connect to 11AC AP */
+	if (pmlmeinfo->VHT_enable) {
+		/* disable auto scan when connect to 11AC AP */
 		mlme->auto_scan_int_ms = 0;
-	else if (adapter->registrypriv.wifi_spec && is_client_associated_to_ap(adapter))
+	} else if (adapter->registrypriv.wifi_spec && is_client_associated_to_ap(adapter)) {
 		mlme->auto_scan_int_ms = 60 * 1000;
-	else if (rtw_chk_roam_flags(adapter, RTW_ROAM_ACTIVE)) {
+	} else if (rtw_chk_roam_flags(adapter, RTW_ROAM_ACTIVE)) {
 		if (check_fwstate(mlme, WIFI_STATION_STATE) && check_fwstate(mlme, _FW_LINKED))
 			mlme->auto_scan_int_ms = mlme->roam_scan_int_ms;
-	} else
+	} else {
 		mlme->auto_scan_int_ms = 0; /* disabled */
+	}
 }
 
 static void rtw_auto_scan_handler(struct adapter *padapter)
@@ -2282,9 +2284,10 @@ unsigned int rtw_restructure_ht_ie(struct adapter *padapter, u8 *in_ie, u8 *out_
 			operation_bw = padapter->mlmeextpriv.cur_bwmode;
 			if (operation_bw > CHANNEL_WIDTH_40)
 				operation_bw = CHANNEL_WIDTH_40;
-		} else
+		} else {
 			/* TDLS: TODO 40? */
 			operation_bw = CHANNEL_WIDTH_40;
+		}
 	} else {
 		p = rtw_get_ie(in_ie, WLAN_EID_HT_OPERATION, &ielen, in_len);
 		if (p && (ielen == sizeof(struct ieee80211_ht_addt_info))) {
diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c b/drivers/staging/rtl8723bs/core/rtw_xmit.c
index 458e471535ad..a28830b4f4e7 100644
--- a/drivers/staging/rtl8723bs/core/rtw_xmit.c
+++ b/drivers/staging/rtl8723bs/core/rtw_xmit.c
@@ -2037,8 +2037,9 @@ inline bool xmitframe_hiq_filter(struct xmit_frame *xmitframe)
 	} else if (registry->hiq_filter == RTW_HIQ_FILTER_ALLOW_ALL)
 		allow = true;
 	else if (registry->hiq_filter == RTW_HIQ_FILTER_DENY_ALL) {
-	} else
+	} else {
 		WARN_ON(1);
+	}
 
 	return allow;
 }
-- 
2.34.1

