Received: from mail-dl1-f67.google.com (mail-dl1-f67.google.com [74.125.82.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C9A01624C0
	for <linux-staging@lists.linux.dev>; Thu, 11 Jun 2026 01:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781142279; cv=none; b=FhW6rWnRCzueKhdA6m0Elj1ptFVE1/qlIGRDNxroGFr7iG+f9q9C1T1EbHMYmr3ZvlUrmApKdvliPUt/f5z5Sm3XJRenLYGidD+jQPyu5nnBzdY8IhyCjHL++UzFpojvDURaisB3M6H/GDvXBcsQTaxwBkOpYDcWuG9+zUDYsTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781142279; c=relaxed/simple;
	bh=x/TZjbo/I1DEWiTnpzyRE/FdqVrSTVr/KKtZ+72LTo4=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=ZqqERiprvjUqC/H+Lcxn7qvAArFItkNwsjg1NYoUcWZZFE3xtD5nteMwKrmL5OBhwwZrlwmTz3I8zg/VVAwLiMY8wqKfAbsVppmdy4BH8A5xN+vVMYPmYkk8iSVIQdG0flR25HArBKZBIo+B89vY+yfka/wRBKku7Uv7Xm+fvdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=o5N9iJKm; arc=none smtp.client-ip=74.125.82.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o5N9iJKm"
Received: by mail-dl1-f67.google.com with SMTP id a92af1059eb24-137335bc3caso9521463c88.0
        for <linux-staging@lists.linux.dev>; Wed, 10 Jun 2026 18:44:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781142276; x=1781747076; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=/Vde/YW0kpe5zN8Y116xH5H8ljJSs7mj2tKFRGEqdjE=;
        b=o5N9iJKmV+KQQfj/z8hNipGllXSUHDlIu0eeVrmeliiyl6VKLwxfz4U5IJfbEKDAyP
         UkP9W5U8jjHMgG16o7frT7JOBAEWuxVq09ZF8qWusNS7baUzP1DuLbpBT4/XYXgjimUs
         N89bSlKtoqlCG5GY240TqPl5sch6GKQDWJGf28GOpJmHb/yW+i1mqzt/mf4i6U7dF+E/
         glkUa/i5VPflUUEWAIAqWLfC0CYjWm3apoABeFTJOrZeNzVQdenkbLPzVH6oz3SaG+qL
         0YexL2G5nMmfpx/fG+NQP55PSq0tEu3EHno3dT2L7myL0pgylr59sOpsSnEzM2G4n2St
         XGfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781142276; x=1781747076;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/Vde/YW0kpe5zN8Y116xH5H8ljJSs7mj2tKFRGEqdjE=;
        b=k7hH9+q4k8dPP7TTSpJhi9mO+FHuS3eQgC3plG7pKt2sUNiWCXC1Rw88l8t7D7Is03
         kk48k5S80MTLxLxrBkMu4lIWY5b1yy68miI7erTvFnb8w+l4wBLsatRRaOVXF1oCP0cN
         Ih2zXONZFbCR1LUSfQkAY7Ko01dBAPzwsXwVPkULb7dKM/ZDTdGimabBpHsn7aJpCr/+
         i5GQD+BS/1DmPRZwEx6AW5ww375IVRVLKKQHIbsMwym380odXjAS4KNe0dJGl1CRLtvJ
         q/j2OUDl5MNlAKcZSmZRFTM+I+BrRb1sALBCLBKRgfXBc8WuR+JtvS11bnQ7SSnEyJUd
         mJDw==
X-Forwarded-Encrypted: i=1; AFNElJ+F/A41CsuBz3WJhN+IKSWGZQkZXW1EIhNIhpo3OMcBZRw1oWboEjKpOztOnQ/kDFEsDIi6bEMJQlqfWloQ@lists.linux.dev
X-Gm-Message-State: AOJu0YyD+fN4Ib6BOaxdygElu7+fPj3ryuZvrTBICwhg4Uy2pIZ3V6Q3
	WUALFcNL46J2Wsw/vLx/6PTFAmeHFMHoPcPNu+Y10cBcys5oBWoOFGRX
X-Gm-Gg: Acq92OFknNnyD4Cbnlb7SS36Yqf155FHbzVf5nQ2Lm6JeCouyfnNjia8y5wafdct6Tc
	pldYHhoVSZfsHrVwGsDAQl8Ecv22lzS4HHG6hpoSq2QGqFVpwNi335t58GEy5WNL8i3K0ZUpnYo
	BL2sqX9mxuN13esXjEz1pObEjkYSDs/oSfrfAfcOvo21ZSwv2xNTDakucw9mkwJd4+IVNnSj8SQ
	Cv1MGiVpYBaLZmLkgAwOOYwO608UIS0O0nwWHjLm2fCzy426yLIjZkGftSxOACqOA1dFgM5hKey
	Ql90qG22GQwYU7bcnzr+hd/D1MyflKl2YtxzgUmfzUDjxPYd7d5eMyHojqZoxAX6G1lBHrPtnru
	xiDwFAa3R4+iAHE05/HV5lPCeDQu7T+lHmDqJjrdnjBTYikVowV6jFteeRhbzZU6JHjGbjkYvkX
	wuHcv7gI4MOB3QSda4CnkSWgfF+4F9JWlM80wYmcJOVCTEW4CCqogorw0MW+PoLHnXlpV2WevT6
	Ql36d4DMGPwYgXbNmAScehR2d64CYksTbq31wfjtDfkQpl97gB+uj7tH7/WcoVEJbXw2meqTkVo
	KVOFInbXXPmkUEBLURUBmhPEnc/G
X-Received: by 2002:a05:7300:a499:b0:2f2:6dde:df66 with SMTP id 5a478bee46e88-30804bbd42dmr577504eec.22.1781142276166;
        Wed, 10 Jun 2026 18:44:36 -0700 (PDT)
Received: from ethan-latitude5420.. (host-127-24.cafrjco.fresno.ca.us.clients.pavlovmedia.net. [68.180.127.24])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30806eb7570sm174027eec.20.2026.06.10.18.44.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 18:44:35 -0700 (PDT)
From: Ethan Nelson-Moore <enelsonmoore@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Khushal Chitturi <khushalchitturi@gmail.com>,
	Nikolay Kulikov <nikolayof23@gmail.com>,
	Michael Straube <straube.linux@gmail.com>,
	Dan Carpenter <error27@gmail.com>,
	Lin YuChen <starpt.official@gmail.com>,
	Sameeksha Sankpal <sameekshasankpal@gmail.com>,
	Ethan Tidmore <ethantidmore06@gmail.com>,
	Bryant Boatright <bryant.boatright@proton.me>,
	Tomasz Unger <tomasz.unger@yahoo.pl>,
	Ethan Nelson-Moore <enelsonmoore@gmail.com>,
	Samasth Norway Ananda <samasth.norway.ananda@oracle.com>,
	linux-staging@lists.linux.dev
Subject: [PATCH] staging: rtl8723bs: remove references to nonexistent CONFIG_IEEE80211W option
Date: Wed, 10 Jun 2026 18:44:04 -0700
Message-ID: <20260611014430.437534-1-enelsonmoore@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Comments in the rtl8723bs driver contain many references to
CONFIG_IEEE80211W, which does not exist in the kernel (though it does
exist in wpa_supplicant, where this code was likely also used). Remove
them.

Discovered while searching for CONFIG_* symbols referenced in code but
not defined in any Kconfig file.

Signed-off-by: Ethan Nelson-Moore <enelsonmoore@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_cmd.c      |  2 --
 .../staging/rtl8723bs/core/rtw_ioctl_set.c    |  1 -
 drivers/staging/rtl8723bs/core/rtw_mlme.c     |  3 ---
 drivers/staging/rtl8723bs/core/rtw_security.c | 26 ++++++-------------
 drivers/staging/rtl8723bs/include/drv_types.h |  2 +-
 drivers/staging/rtl8723bs/include/ieee80211.h |  4 +--
 drivers/staging/rtl8723bs/include/rtw_cmd.h   |  5 ++--
 drivers/staging/rtl8723bs/os_dep/os_intfs.c   |  1 -
 8 files changed, 13 insertions(+), 31 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
index c1185c25ed36..3b90ca548f98 100644
--- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
+++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
@@ -1002,7 +1002,6 @@ u8 rtw_addbareq_cmd(struct adapter *padapter, u8 tid, u8 *addr)
 	return res;
 }
 
-/* add for CONFIG_IEEE80211W, none 11w can use it */
 u8 rtw_reset_securitypriv_cmd(struct adapter *padapter)
 {
 	struct cmd_obj *ph2c;
@@ -1761,7 +1760,6 @@ u8 rtw_drvextra_cmd_hdl(struct adapter *padapter, unsigned char *pbuf)
 	case CHECK_HIQ_WK_CID:
 		rtw_chk_hi_queue_hdl(padapter);
 		break;
-	/* add for CONFIG_IEEE80211W, none 11w can use it */
 	case RESET_SECURITYPRIV:
 		rtw_reset_securitypriv(padapter);
 		break;
diff --git a/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c b/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
index c70541f95a73..b996ef9517a1 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
@@ -350,7 +350,6 @@ u8 rtw_set_802_11_disassociate(struct adapter *padapter)
 	if (check_fwstate(pmlmepriv, _FW_LINKED) == true) {
 		rtw_disassoc_cmd(padapter, 0, true);
 		rtw_indicate_disconnect(padapter);
-		/* modify for CONFIG_IEEE80211W, none 11w can use it */
 		rtw_free_assoc_resources_cmd(padapter);
 		rtw_pwr_wakeup(padapter);
 	}
diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index ddfc56f0253d..95cca19d7c63 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -900,7 +900,6 @@ void rtw_indicate_disconnect(struct adapter *padapter)
 
 		rtw_cfg80211_indicate_disconnect(padapter);
 
-		/* modify for CONFIG_IEEE80211W, none 11w also can use the same command */
 		rtw_reset_securitypriv_cmd(padapter);
 
 		/* set ips_deny_time to avoid enter IPS before LPS leave */
@@ -1084,7 +1083,6 @@ void rtw_reset_securitypriv(struct adapter *adapter)
 	u8 backupPMKIDIndex = 0;
 	u8 backupTKIPCountermeasure = 0x00;
 	u32 backupTKIPcountermeasure_time = 0;
-	/*  add for CONFIG_IEEE80211W, none 11w also can use */
 	struct mlme_ext_priv *pmlmeext = &adapter->mlmeextpriv;
 
 	spin_lock_bh(&adapter->security_key_mutex);
@@ -1134,7 +1132,6 @@ void rtw_reset_securitypriv(struct adapter *adapter)
 		psec_priv->ndisencryptstatus = Ndis802_11WEPDisabled;
 		/*  */
 	}
-	/*  add for CONFIG_IEEE80211W, none 11w also can use */
 	spin_unlock_bh(&adapter->security_key_mutex);
 }
 
diff --git a/drivers/staging/rtl8723bs/core/rtw_security.c b/drivers/staging/rtl8723bs/core/rtw_security.c
index a00504ff2910..3c4439e8d5ec 100644
--- a/drivers/staging/rtl8723bs/core/rtw_security.c
+++ b/drivers/staging/rtl8723bs/core/rtw_security.c
@@ -630,7 +630,7 @@ static void construct_mic_iv(u8 *mic_iv,
 			     u8 *mpdu,
 			     uint payload_length,
 			     u8 *pn_vector,
-			     uint frtype) /* add for CONFIG_IEEE80211W, none 11w also can use */
+			     uint frtype)
 {
 		signed int i;
 
@@ -671,7 +671,7 @@ static void construct_mic_iv(u8 *mic_iv,
 static void construct_mic_header1(u8 *mic_header1,
 				  signed int header_length,
 				  u8 *mpdu,
-				  uint frtype) /* for CONFIG_IEEE80211W, none 11w also can use */
+				  uint frtype)
 {
 		mic_header1[0] = (u8)((header_length - 2) / 256);
 		mic_header1[1] = (u8)((header_length - 2) % 256);
@@ -754,7 +754,7 @@ static void construct_ctr_preload(u8 *ctr_preload,
 				  u8 *mpdu,
 				  u8 *pn_vector,
 				  signed int c,
-				  uint frtype) /* for CONFIG_IEEE80211W, none 11w also can use */
+				  uint frtype)
 {
 	signed int i = 0;
 
@@ -819,7 +819,7 @@ static signed int aes_cipher(u8 *key, uint	hdrlen,
 		if (hdrlen !=  WLAN_HDR_A3_QOS_LEN)
 			hdrlen += 2;
 
-	} else if ((frtype == WIFI_DATA) && /*  add for CONFIG_IEEE80211W, none 11w also can use */
+	} else if ((frtype == WIFI_DATA) &&
 		   ((frsubtype == 0x08) ||
 		   (frsubtype == 0x09) ||
 		   (frsubtype == 0x0a) ||
@@ -845,12 +845,12 @@ static signed int aes_cipher(u8 *key, uint	hdrlen,
 			 pframe,	 /* message, */
 			 plen,
 			 pn_vector,
-			 frtype); /*  add for CONFIG_IEEE80211W, none 11w also can use */
+			 frtype);
 
 	construct_mic_header1(mic_header1,
 			      hdrlen,
 			      pframe,	/* message */
-			      frtype); /*  add for CONFIG_IEEE80211W, none 11w also can use */
+			      frtype);
 
 	construct_mic_header2(mic_header2,
 			      pframe,	/* message, */
@@ -899,7 +899,6 @@ static signed int aes_cipher(u8 *key, uint	hdrlen,
 	for (i = 0; i < num_blocks; i++) {
 		construct_ctr_preload(ctr_preload, a4_exists, qc_exists, pframe, /* message, */
 				      pn_vector, i + 1, frtype);
-		/*  add for CONFIG_IEEE80211W, none 11w also can use */
 		aes128k128d(key, ctr_preload, aes_out);
 		crypto_xor_cpy(chain_buffer, aes_out, &pframe[payload_index], 16);
 		for (j = 0; j < 16; j++)
@@ -911,7 +910,6 @@ static signed int aes_cipher(u8 *key, uint	hdrlen,
 		/* encrypt it and copy the unpadded part back   */
 		construct_ctr_preload(ctr_preload, a4_exists, qc_exists, pframe, /* message, */
 				      pn_vector, num_blocks + 1, frtype);
-		/*  add for CONFIG_IEEE80211W, none 11w also can use */
 
 		for (j = 0; j < 16; j++)
 			padded_buffer[j] = 0x00;
@@ -927,7 +925,6 @@ static signed int aes_cipher(u8 *key, uint	hdrlen,
 	/* Encrypt the MIC */
 	construct_ctr_preload(ctr_preload, a4_exists, qc_exists, pframe, /* message, */
 			      pn_vector, 0, frtype);
-	/*  add for CONFIG_IEEE80211W, none 11w also can use */
 
 	for (j = 0; j < 16; j++)
 		padded_buffer[j] = 0x00;
@@ -1037,7 +1034,7 @@ static signed int aes_decipher(u8 *key, uint	hdrlen,
 		if (hdrlen !=  WLAN_HDR_A3_QOS_LEN)
 			hdrlen += 2;
 
-	} else if ((frtype == WIFI_DATA) && /* only for data packet . add for CONFIG_IEEE80211W, none 11w also can use */
+	} else if ((frtype == WIFI_DATA) &&
 		   ((frsubtype == 0x08) ||
 		   (frsubtype == 0x09) ||
 		   (frsubtype == 0x0a) ||
@@ -1058,7 +1055,7 @@ static signed int aes_decipher(u8 *key, uint	hdrlen,
 		construct_ctr_preload(ctr_preload, a4_exists,
 				      qc_exists, pframe,
 				      pn_vector, i + 1,
-				      frtype); /*  add for CONFIG_IEEE80211W, none 11w also can use */
+				      frtype);
 
 		aes128k128d(key, ctr_preload, aes_out);
 		crypto_xor_cpy(chain_buffer, aes_out, &pframe[payload_index], 16);
@@ -1072,7 +1069,6 @@ static signed int aes_decipher(u8 *key, uint	hdrlen,
 		/* encrypt it and copy the unpadded part back   */
 		construct_ctr_preload(ctr_preload, a4_exists, qc_exists, pframe, pn_vector,
 				      num_blocks + 1, frtype);
-		/*  add for CONFIG_IEEE80211W, none 11w also can use */
 
 		for (j = 0; j < 16; j++)
 			padded_buffer[j] = 0x00;
@@ -1097,10 +1093,8 @@ static signed int aes_decipher(u8 *key, uint	hdrlen,
 	pn_vector[5] = pframe[hdrlen + 7];
 
 	construct_mic_iv(mic_iv, qc_exists, a4_exists, message, plen - 8, pn_vector, frtype);
-	/*  add for CONFIG_IEEE80211W, none 11w also can use */
 
 	construct_mic_header1(mic_header1, hdrlen, message, frtype);
-	/*  add for CONFIG_IEEE80211W, none 11w also can use */
 	construct_mic_header2(mic_header2, message, a4_exists, qc_exists);
 
 	payload_remainder = (plen - 8) % 16;
@@ -1145,7 +1139,6 @@ static signed int aes_decipher(u8 *key, uint	hdrlen,
 	for (i = 0; i < num_blocks; i++) {
 		construct_ctr_preload(ctr_preload, a4_exists, qc_exists, message, pn_vector, i + 1,
 				      frtype);
-		/*  add for CONFIG_IEEE80211W, none 11w also can use */
 		aes128k128d(key, ctr_preload, aes_out);
 		crypto_xor_cpy(chain_buffer, aes_out, &message[payload_index], 16);
 		for (j = 0; j < 16; j++)
@@ -1157,7 +1150,6 @@ static signed int aes_decipher(u8 *key, uint	hdrlen,
 		/* encrypt it and copy the unpadded part back   */
 		construct_ctr_preload(ctr_preload, a4_exists, qc_exists, message, pn_vector,
 				      num_blocks + 1, frtype);
-		/*  add for CONFIG_IEEE80211W, none 11w also can use */
 
 		for (j = 0; j < 16; j++)
 			padded_buffer[j] = 0x00;
@@ -1172,7 +1164,6 @@ static signed int aes_decipher(u8 *key, uint	hdrlen,
 
 	/* Encrypt the MIC */
 	construct_ctr_preload(ctr_preload, a4_exists, qc_exists, message, pn_vector, 0, frtype);
-	/*  add for CONFIG_IEEE80211W, none 11w also can use */
 
 	for (j = 0; j < 16; j++)
 		padded_buffer[j] = 0x00;
@@ -1446,7 +1437,6 @@ static int omac1_aes_128_vector(u8 *key, size_t num_elem,
  * This is a mode for using block cipher (AES in this case) for authentication.
  * OMAC1 was standardized with the name CMAC by NIST in a Special Publication
  * (SP) 800-38B.
- * modify for CONFIG_IEEE80211W
  */
 int omac1_aes_128(u8 *key, u8 *data, size_t data_len, u8 *mac)
 {
diff --git a/drivers/staging/rtl8723bs/include/drv_types.h b/drivers/staging/rtl8723bs/include/drv_types.h
index 7ed375ba18d8..b18762de49c4 100644
--- a/drivers/staging/rtl8723bs/include/drv_types.h
+++ b/drivers/staging/rtl8723bs/include/drv_types.h
@@ -286,7 +286,7 @@ struct adapter {
 	struct	recv_priv recvpriv;
 	struct	sta_priv stapriv;
 	struct	security_priv securitypriv;
-	spinlock_t   security_key_mutex; /*  add for CONFIG_IEEE80211W, none 11w also can use */
+	spinlock_t   security_key_mutex;
 	struct	registry_priv registrypriv;
 	struct	eeprom_priv eeprompriv;
 
diff --git a/drivers/staging/rtl8723bs/include/ieee80211.h b/drivers/staging/rtl8723bs/include/ieee80211.h
index fbb12fe31a6c..f63f9492088c 100644
--- a/drivers/staging/rtl8723bs/include/ieee80211.h
+++ b/drivers/staging/rtl8723bs/include/ieee80211.h
@@ -528,9 +528,9 @@ enum {
 	RTW_WLAN_CATEGORY_FT = 6,
 	RTW_WLAN_CATEGORY_HT = 7,
 	RTW_WLAN_CATEGORY_SA_QUERY = 8,
-	RTW_WLAN_CATEGORY_UNPROTECTED_WNM = 11, /*  add for CONFIG_IEEE80211W, none 11w also can use */
+	RTW_WLAN_CATEGORY_UNPROTECTED_WNM = 11,
 	RTW_WLAN_CATEGORY_TDLS = 12,
-	RTW_WLAN_CATEGORY_SELF_PROTECTED = 15, /*  add for CONFIG_IEEE80211W, none 11w also can use */
+	RTW_WLAN_CATEGORY_SELF_PROTECTED = 15,
 	RTW_WLAN_CATEGORY_WMM = 17,
 	RTW_WLAN_CATEGORY_P2P = 0x7f,/* P2P action frames */
 };
diff --git a/drivers/staging/rtl8723bs/include/rtw_cmd.h b/drivers/staging/rtl8723bs/include/rtw_cmd.h
index c4c3edee809d..a3dc7f6eea66 100644
--- a/drivers/staging/rtl8723bs/include/rtw_cmd.h
+++ b/drivers/staging/rtl8723bs/include/rtw_cmd.h
@@ -133,8 +133,8 @@ enum {
 	INTEl_WIDI_WK_CID,
 	C2H_WK_CID,
 	RTP_TIMER_CFG_WK_CID,
-	RESET_SECURITYPRIV, /*  add for CONFIG_IEEE80211W, none 11w also can use */
-	FREE_ASSOC_RESOURCES, /*  add for CONFIG_IEEE80211W, none 11w also can use */
+	RESET_SECURITYPRIV,
+	FREE_ASSOC_RESOURCES,
 	DM_IN_LPS_WK_CID,
 	DM_RA_MSK_WK_CID, /* add for STA update RAMask when bandwidth change. */
 	BEAMFORMING_WK_CID,
@@ -594,7 +594,6 @@ extern u8 rtw_setfwdig_cmd(struct adapter *padapter, u8 type);
 extern u8 rtw_setfwra_cmd(struct adapter *padapter, u8 type);
 
 extern u8 rtw_addbareq_cmd(struct adapter *padapter, u8 tid, u8 *addr);
-/*  add for CONFIG_IEEE80211W, none 11w also can use */
 extern u8 rtw_reset_securitypriv_cmd(struct adapter *padapter);
 extern u8 rtw_free_assoc_resources_cmd(struct adapter *padapter);
 extern u8 rtw_dynamic_chk_wk_cmd(struct adapter *adapter);
diff --git a/drivers/staging/rtl8723bs/os_dep/os_intfs.c b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
index e943dcea1a21..56eb3bbf7aa8 100644
--- a/drivers/staging/rtl8723bs/os_dep/os_intfs.c
+++ b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
@@ -658,7 +658,6 @@ u8 rtw_init_drv_sw(struct adapter *padapter)
 
 	if (_rtw_init_recv_priv(&padapter->recvpriv, padapter) == _FAIL)
 		goto free_xmit_priv;
-	/*  add for CONFIG_IEEE80211W, none 11w also can use */
 	spin_lock_init(&padapter->security_key_mutex);
 
 	/*  We don't need to memset padapter->XXX to zero, because adapter is allocated by vzalloc(). */
-- 
2.43.0

