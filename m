Received: from mail-vs2-f12.google.com (mail-vs2-f12.google.com [74.125.227.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C15E3BED59
	for <linux-staging@lists.linux.dev>; Thu, 24 Sep 2026 22:21:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790288507; cv=none; b=hvKP1JlaNk7aEaWRHifsTkwgM92xj3isndOPebRhYCiGR5YQsTw2cbK4cF3CV84DITcYYHmvcMNz1TOce06g08XdBgIukGRYjRnUhltNyd2igNNT4n4JfOn1J2n6oZNSS8ytEjPWtDCG7hVQHnmpoC15ue+VUj32PiU5fES80Bc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790288507; c=relaxed/simple;
	bh=VGnx62vJu8x6U3p4kivR/4DDstToyFK7UfpRsYleEVg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PN4cFPpd06Rcv9fres35eKyn46F9hKxPPqgor8ZFMI3yw6YDYOVfnixECYLYRcjyhQpDgVPttG+Lk+jHeb6SCIsOxJwMS2Mh4iKXogtrd+5V8N9noWwrcwSPhLR2uX7HEnM/cr6ty1IfY68Ek5K5oN84ocpSQXf5nsSe+JMFh/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KRTsRv2V; arc=none smtp.client-ip=74.125.227.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KRTsRv2V"
Received: by mail-vs2-f12.google.com with SMTP id ada2fe7eead31-785692e59a4so169905137.3
        for <linux-staging@lists.linux.dev>; Thu, 24 Sep 2026 15:21:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790288504; x=1790893304; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Sa89UHRmyzmZY6TxGzw+0o/wrvuxvTidU3ERLkCQopo=;
        b=KRTsRv2V1e2Nu2PvhxQWqA0FrW0KEsyVgxTrT6mQSpWcbup2ZfIMw0u1r5d/9uOKjl
         KvJxzUacD7v091Bo5tWRadGGzDUFVB5oaG6k7JDztgXWAg4JjKnRBuPknkS9Ecdfg1IP
         bP5FYz5r81mt5E2zP1qQS6ElsSemYLZ+2g5fsxJskwo/apln7ww/aqspN55tzIm4ll8g
         KIgXbblZoo7TLV7Y/AU5VQkJheK4jqXjK7Dv+fnuzwFKku1QM5My82IUaUgP59vkRWGC
         lZYj/8LK7zLsqRl9OxyPlOTM3m/pF/q1En4SVDOW7XRYSHRywCkVQffyx7M49ZCm3FNJ
         si/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790288504; x=1790893304;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Sa89UHRmyzmZY6TxGzw+0o/wrvuxvTidU3ERLkCQopo=;
        b=2WFaevc1Bwje6enk/2Pvn5uTIZHUPZin5wgE9aiDVzxgxZOVR2s/+Nktuy6UmH+kYM
         2maBlAhBLkYQnDS7ouqvcTyXjwCXMIdTQIbdVfGCpqXoUQMqxjWRcYwdfKVGPliLSL/A
         sN06oVGxBTZ5CxlK7dqpFPCNp58o3rqXDu6rJimbSTfSsAM6uQNuW1wTnci/vbldc08n
         sBVfMaiwFh3OCsGoGmI0ina9hLbcJ7u9viYMyM6FvtMRaPHentyYqhs+eVVwhL9pLC2q
         y7Z6K3ZpWHVDpSBAn5LV/nqv0oaqxSgjCYgTcTqYJKdHudm1brkN1QxI8YHizaU+XYlr
         zlXA==
X-Forwarded-Encrypted: i=1; AKwUvBxHGy2v2sAep7pQeGWOqETI6rYKHzlrfhFpHiugMOTTwzZfCf2KUwPE9ae/Bcopeu22q2i1d8EQdnKyHVEu@lists.linux.dev
X-Gm-Message-State: AFuF++mh4tF1Dn1Eb4Ml6n9Awh5rubGiUyW6r+FEOqClJEWDy1nXax3H
	Pq9vKcRd4e66RCPsa4uSkvOEh0+km+bGY6/nnrj4Ex7PRtKP9vF9xuh0
X-Gm-Gg: AYBFou1FOc7U57dc5MlCIbp2mddVFT7Ac3tUZn5qwwStl3qvtXyGKxLnCNd51ufmDhx
	FP17XkSOF5FzwftCAVwSxB8ogmWch7REwi0v6omSDAbK4HMkxYCriT6SGjGvNSndwFT4x4yi59c
	flXuu24ifN5i22fuZunC8Wg/EK1q3noDzYP2HhRZrgGGuzkFs+FGk2ofwooUyZpMXx4oEtG1UFd
	WkVJLmDkvdHkm8KFzXJ1mXln5mVxQ/7S1uOrERky0KNgwxD8aojsaqhSigZVjmuRA09Qqcdb+IO
	fTROEDV5VzJGzUIsqZO8xZSPPec3ggzKUBeA4HjvnGhSpd3+pNKhfuzBa1f/BYBwTJBbT0wloz9
	3NOXqi9gm7rJXxVvLxHwmXLkbT8gNfv9JpqlO/iBnd7/wnwXOO5I84sUAB+6XNB1Y0v39VFUnzb
	HYelrnXX0uIT/aBCJL0oU2RQM/yKvPEYK3jMatZrOhAJ9Dryg0QnUHMyVocTKGfq2Ml2voiLwKA
	BLqaTvF/R8fB3tE
X-Received: by 2002:a05:6102:3f46:b0:7a7:19aa:8a88 with SMTP id ada2fe7eead31-7af1f2fda6cmr2110732137.35.1790288504244;
        Thu, 24 Sep 2026 15:21:44 -0700 (PDT)
Received: from pop-os.lan ([2803:9810:44c0:6b08:5f74:5a16:c98e:9be])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9860de80b19sm540339241.1.2026.09.24.15.21.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 15:21:43 -0700 (PDT)
From: Franco Hector Hugo Montenegro <franco.montenegro.ruke@gmail.com>
To: gregkh@linuxfoundation.org
Cc: ethantidmore06@gmail.com,
	nikolayof23@gmail.com,
	trohan2000@gmail.com,
	error27@gmail.com,
	fliegbert2@gmail.com,
	s9430939@naver.com,
	luka.gejak@linux.dev,
	khushalchitturi@gmail.com,
	khomenkov@mailbox.org,
	me@cipherat.com,
	azpijr@gmail.com,
	gianmariabiselli@gmail.com,
	johannes.berg@intel.com,
	arend.vanspriel@broadcom.com,
	asm.artisan256@gmail.com,
	miriam.rachel.korenblit@intel.com,
	serhatkumral1@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Franco Hector Hugo Montenegro <franco.montenegro.ruke@gmail.com>
Subject: [PATCH] Staging: rtl8723bs: fixed camel case coding style issue.
Date: Thu, 24 Sep 2026 19:21:22 -0300
Message-ID: <20260924222122.682920-1-franco.montenegro.ruke@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixed a coding style issue for the field dot118021XPrivacy in the struct
sta_info.

Signed-off-by: Franco Hector Hugo Montenegro
<franco.montenegro.ruke@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_ap.c        |  2 +-
 drivers/staging/rtl8723bs/core/rtw_mlme.c      |  4 ++--
 .../staging/rtl8723bs/include/rtw_security.h   |  2 +-
 drivers/staging/rtl8723bs/include/sta_info.h   |  2 +-
 .../staging/rtl8723bs/os_dep/ioctl_cfg80211.c  | 18 +++++++++---------
 5 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ap.c b/drivers/staging/rtl8723bs/core/rtw_ap.c
index 9face4c8ded2..0486e55da68f 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ap.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ap.c
@@ -1165,7 +1165,7 @@ u8 rtw_ap_set_pairwise_key(struct adapter *padapter, struct sta_info *psta)
 
 	init_h2fwcmd_w_parm_no_rsp(ph2c, psetstakey_para, SET_STA_KEY_CMD);
 
-	psetstakey_para->algorithm = (u8)psta->dot118021XPrivacy;
+	psetstakey_para->algorithm = (u8)psta->dot118021_x_privacy;
 
 	memcpy(psetstakey_para->addr, psta->hwaddr, ETH_ALEN);
 
diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index e22e33c364bb..56b5da67cf3b 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -982,7 +982,7 @@ static struct sta_info *rtw_joinbss_update_stainfo(struct adapter *adapter, stru
 			adapter->securitypriv.bgrpkey_handshake = false;
 
 			psta->ieee8021x_blocked = true;
-			psta->dot118021XPrivacy = adapter->securitypriv.dot11_privacy_algrthm;
+			psta->dot118021_x_privacy = adapter->securitypriv.dot11_privacy_algrthm;
 
 			memset((u8 *)&psta->dot118021x_UncstKey, 0, sizeof(union Keytype));
 
@@ -1340,7 +1340,7 @@ void rtw_stassoc_event_callback(struct adapter *adapter, u8 *buf)
 	rtw_sta_media_status_rpt(adapter, psta, 1);
 
 	if (adapter->securitypriv.dot11_auth_algrthm == dot11_auth_algrthm_8021x)
-		psta->dot118021XPrivacy = adapter->securitypriv.dot11_privacy_algrthm;
+		psta->dot118021_x_privacy = adapter->securitypriv.dot11_privacy_algrthm;
 
 	psta->ieee8021x_blocked = false;
 
diff --git a/drivers/staging/rtl8723bs/include/rtw_security.h b/drivers/staging/rtl8723bs/include/rtw_security.h
index a3bbc605e2ba..88131a027221 100644
--- a/drivers/staging/rtl8723bs/include/rtw_security.h
+++ b/drivers/staging/rtl8723bs/include/rtw_security.h
@@ -180,7 +180,7 @@ do {\
 		if (bmcst)\
 			encry_algo = (u8)psecuritypriv->dot118021XGrpPrivacy;\
 		else\
-			encry_algo = (u8)psta->dot118021XPrivacy;\
+			encry_algo = (u8)psta->dot118021_x_privacy;\
 		break;\
 	case dot11_auth_algrthm_wapi:\
 		encry_algo = (u8)psecuritypriv->dot11_privacy_algrthm;\
diff --git a/drivers/staging/rtl8723bs/include/sta_info.h b/drivers/staging/rtl8723bs/include/sta_info.h
index bc78c32192c0..e7c69c4de615 100644
--- a/drivers/staging/rtl8723bs/include/sta_info.h
+++ b/drivers/staging/rtl8723bs/include/sta_info.h
@@ -87,7 +87,7 @@ struct sta_info {
 	u8 hwaddr[ETH_ALEN];
 
 	bool ieee8021x_blocked;
-	uint dot118021XPrivacy; /* aes, tkip... */
+	uint dot118021_x_privacy; /* aes, tkip... */
 	union Keytype dot11tkiptxmickey;
 	union Keytype dot11tkiprxmickey;
 	union Keytype dot118021x_UncstKey;
diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
index 4416d0ec1db9..f29f8a39ec0b 100644
--- a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
+++ b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
@@ -602,7 +602,7 @@ static int rtw_cfg80211_ap_set_encryption(struct net_device *dev, struct ieee_pa
 			pbcmc_sta = rtw_get_bcmc_stainfo(padapter);
 			if (pbcmc_sta) {
 				pbcmc_sta->ieee8021x_blocked = false;
-				pbcmc_sta->dot118021XPrivacy = psecuritypriv->dot118021XGrpPrivacy;/* rx will use bmc_sta's dot118021XPrivacy */
+				pbcmc_sta->dot118021_x_privacy = psecuritypriv->dot118021XGrpPrivacy;/* rx will use bmc_sta's dot118021_x_privacy */
 			}
 		}
 
@@ -615,11 +615,11 @@ static int rtw_cfg80211_ap_set_encryption(struct net_device *dev, struct ieee_pa
 				memcpy(psta->dot118021x_UncstKey.skey, param->u.crypt.key, (param->u.crypt.key_len > 16 ? 16 : param->u.crypt.key_len));
 
 				if (strcmp(param->u.crypt.alg, "WEP") == 0) {
-					psta->dot118021XPrivacy = _WEP40_;
+					psta->dot118021_x_privacy = _WEP40_;
 					if (param->u.crypt.key_len == 13)
-						psta->dot118021XPrivacy = _WEP104_;
+						psta->dot118021_x_privacy = _WEP104_;
 				} else if (strcmp(param->u.crypt.alg, "TKIP") == 0) {
-					psta->dot118021XPrivacy = _TKIP_;
+					psta->dot118021_x_privacy = _TKIP_;
 
 					/* set mic key */
 					memcpy(psta->dot11tkiptxmickey.skey, &param->u.crypt.key[16], 8);
@@ -628,9 +628,9 @@ static int rtw_cfg80211_ap_set_encryption(struct net_device *dev, struct ieee_pa
 					psecuritypriv->busetkipkey = true;
 
 				} else if (strcmp(param->u.crypt.alg, "CCMP") == 0) {
-					psta->dot118021XPrivacy = _AES_;
+					psta->dot118021_x_privacy = _AES_;
 				} else {
-					psta->dot118021XPrivacy = _NO_PRIVACY_;
+					psta->dot118021_x_privacy = _NO_PRIVACY_;
 				}
 
 				rtw_ap_set_pairwise_key(padapter, psta);
@@ -676,7 +676,7 @@ static int rtw_cfg80211_ap_set_encryption(struct net_device *dev, struct ieee_pa
 				pbcmc_sta = rtw_get_bcmc_stainfo(padapter);
 				if (pbcmc_sta) {
 					pbcmc_sta->ieee8021x_blocked = false;
-					pbcmc_sta->dot118021XPrivacy = psecuritypriv->dot118021XGrpPrivacy;/* rx will use bmc_sta's dot118021XPrivacy */
+					pbcmc_sta->dot118021_x_privacy = psecuritypriv->dot118021XGrpPrivacy;/* rx will use bmc_sta's dot118021_x_privacy */
 				}
 			}
 		}
@@ -770,7 +770,7 @@ static int rtw_cfg80211_set_encryption(struct net_device *dev, struct ieee_param
 
 				if ((padapter->securitypriv.ndisencryptstatus == Ndis802_11Encryption2Enabled) ||
 				    (padapter->securitypriv.ndisencryptstatus ==  Ndis802_11Encryption3Enabled)) {
-					psta->dot118021XPrivacy = padapter->securitypriv.dot11_privacy_algrthm;
+					psta->dot118021_x_privacy = padapter->securitypriv.dot11_privacy_algrthm;
 				}
 
 				if (param->u.crypt.set_tx == 1) { /* pairwise key */
@@ -812,7 +812,7 @@ static int rtw_cfg80211_set_encryption(struct net_device *dev, struct ieee_param
 
 				if ((padapter->securitypriv.ndisencryptstatus == Ndis802_11Encryption2Enabled) ||
 				    (padapter->securitypriv.ndisencryptstatus ==  Ndis802_11Encryption3Enabled)) {
-					pbcmc_sta->dot118021XPrivacy = padapter->securitypriv.dot11_privacy_algrthm;
+					pbcmc_sta->dot118021_x_privacy = padapter->securitypriv.dot11_privacy_algrthm;
 				}
 			}
 		} else if (check_fwstate(pmlmepriv, WIFI_ADHOC_STATE)) { /* adhoc mode */
-- 
2.43.0

