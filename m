Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D92D93FC9
	for <linux-staging@lists.linux.dev>; Wed, 22 Sep 2021 20:05:44 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id t8so10537471wri.1
        for <linux-staging@lists.linux.dev>; Wed, 22 Sep 2021 13:05:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=pvFi6Lh6hhIQe/suRiePTd0Fvwz6G2PG4dOZHSvZFjU=;
        b=hwkaj68bVErQw5j2o3OVuY1/UR4JZMLyJa62EKXrdLFBbZS9nMr5VhKvFWmq25Hmwa
         b42La8CgjUeNsYGX8+UxMWmRA3UUo44nwOPSIzqaC3Ybgc9N+I2g5bfDvmh8w+N/+CVk
         Cf5CPQSVeLbGFhBqHFdoIXppdsqPa87YAb/rUqEPhgfC7ZFXvDSqygeoeERtoJWwN4C6
         mZM2cbAD1jjFGYG7fI5OCoBJ1h2OdyRjRxsxhDKtIoQ+GVVQ4pFUjI6BTYgf1ygG5rN7
         HI3qagWwSRqqTg4TcpBaE66ocRGpbtEMQ1vy9gcz6PRqFOtEoPqSOOn+U4UtojbrzYGa
         A5gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pvFi6Lh6hhIQe/suRiePTd0Fvwz6G2PG4dOZHSvZFjU=;
        b=7+v5zc+nRwZOfsgbk9INodLkbWV1/I4H4YXVH6twWoDuSk/4k+WB1T6O1PdAf7hUws
         Pej1AskLZMC+4W8W44sJvi9w5S7+40i2Wmykwn+UunlY7fqqM2ddkOiusjmvE5v8mFwt
         4TJzAWTfjMUFPjKq7gyn+DsFtdC2Y525oKWU6hHlr5W1PhiWRuN0sRft0+bKP81jxkqD
         Yf2zOn4VJ/L9UKpg3okkRVUKI1duPxWU0ae+8bn0TxiPb5hfumVNItIB5X1xJeG2ptEm
         u7mP+Bas5QEZi7/k0e7u6EJnwTgtz3br7bbVdv+i2qV13mSoDw7uT3YJ/jv0YLf6euEm
         JzqQ==
X-Gm-Message-State: AOAM530yH82EIMmtHd0EdQRY3LYtWQhZrp0aFIOtfdOSoMjNe70/qicB
	auLzFBv1ZSlyAQ50Vej6FBI=
X-Google-Smtp-Source: ABdhPJy7t4A4H1RvVlONYlL5FyBDlDJUtQ5dCVrzbHCn0QmfwZdsvW1OCQGTVmmpH+XGHP49OZzQIg==
X-Received: by 2002:a7b:c248:: with SMTP id b8mr2666805wmj.124.1632341143256;
        Wed, 22 Sep 2021 13:05:43 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::cde])
        by smtp.gmail.com with ESMTPSA id e2sm3219761wra.40.2021.09.22.13.05.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Sep 2021 13:05:42 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 18/47] staging: r8188eu: remove rtw_set_802_11_add_key()
Date: Wed, 22 Sep 2021 22:03:51 +0200
Message-Id: <20210922200420.9693-19-straube.linux@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210922200420.9693-1-straube.linux@gmail.com>
References: <20210922200420.9693-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Function rtw_set_802_11_add_key() is not used, remove it.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_ioctl_set.c  | 230 ------------------
 .../staging/r8188eu/include/rtw_ioctl_set.h   |   1 -
 2 files changed, 231 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_ioctl_set.c b/drivers/staging/r8188eu/core/rtw_ioctl_set.c
index a0702bfaa549..afa72b21fc0b 100644
--- a/drivers/staging/r8188eu/core/rtw_ioctl_set.c
+++ b/drivers/staging/r8188eu/core/rtw_ioctl_set.c
@@ -492,236 +492,6 @@ u8 rtw_set_802_11_remove_wep(struct adapter *padapter, u32 keyindex)
 	return ret;
 }
 
-u8 rtw_set_802_11_add_key(struct adapter *padapter, struct ndis_802_11_key *key)
-{
-	uint	encryptionalgo;
-	u8 *pbssid;
-	struct sta_info *stainfo;
-	u8	bgroup = false;
-	u8	bgrouptkey = false;/* can be removed later */
-	u8	ret = _SUCCESS;
-
-	if (((key->KeyIndex & 0x80000000) == 0) && ((key->KeyIndex & 0x40000000) > 0)) {
-		/*  It is invalid to clear bit 31 and set bit 30. If the miniport driver encounters this combination, */
-		/*  it must fail the request and return NDIS_STATUS_INVALID_DATA. */
-		ret = _FAIL;
-		goto exit;
-	}
-
-	if (key->KeyIndex & 0x40000000) {
-		/*  Pairwise key */
-
-		pbssid = get_bssid(&padapter->mlmepriv);
-		stainfo = rtw_get_stainfo(&padapter->stapriv, pbssid);
-
-		if (stainfo && padapter->securitypriv.dot11AuthAlgrthm == dot11AuthAlgrthm_8021X)
-			encryptionalgo = stainfo->dot118021XPrivacy;
-		else
-			encryptionalgo = padapter->securitypriv.dot11PrivacyAlgrthm;
-
-		if (key->KeyIndex & 0x000000FF) {
-			/*  The key index is specified in the lower 8 bits by values of zero to 255. */
-			/*  The key index should be set to zero for a Pairwise key, and the driver should fail with */
-			/*  NDIS_STATUS_INVALID_DATA if the lower 8 bits is not zero */
-			ret = _FAIL;
-			goto exit;
-		}
-
-		/*  check BSSID */
-		if (is_broadcast_ether_addr(key->BSSID)) {
-			ret = false;
-			goto exit;
-		}
-
-		/*  Check key length for TKIP. */
-		if ((encryptionalgo == _TKIP_) && (key->KeyLength != 32)) {
-			ret = _FAIL;
-			goto exit;
-		}
-
-		/*  Check key length for AES. */
-		if ((encryptionalgo == _AES_) && (key->KeyLength != 16)) {
-			/*  For our supplicant, EAPPkt9x.vxd, cannot differentiate TKIP and AES case. */
-			if (key->KeyLength == 32) {
-				key->KeyLength = 16;
-			} else {
-				ret = _FAIL;
-				goto exit;
-			}
-		}
-
-		/*  Check key length for WEP. For NDTEST, 2005.01.27, by rcnjko. */
-		if ((encryptionalgo == _WEP40_ || encryptionalgo == _WEP104_) &&
-		    (key->KeyLength != 5 && key->KeyLength != 13)) {
-			ret = _FAIL;
-			goto exit;
-		}
-
-		bgroup = false;
-	} else {
-		/*  Group key - KeyIndex(BIT(30) == 0) */
-		/*  when add wep key through add key and didn't assigned encryption type before */
-		if ((padapter->securitypriv.ndisauthtype <= 3) &&
-		    (padapter->securitypriv.dot118021XGrpPrivacy == 0)) {
-			switch (key->KeyLength) {
-			case 5:
-				padapter->securitypriv.dot11PrivacyAlgrthm = _WEP40_;
-				break;
-			case 13:
-				padapter->securitypriv.dot11PrivacyAlgrthm = _WEP104_;
-				break;
-			default:
-				padapter->securitypriv.dot11PrivacyAlgrthm = _NO_PRIVACY_;
-				break;
-			}
-
-			encryptionalgo = padapter->securitypriv.dot11PrivacyAlgrthm;
-		} else {
-			encryptionalgo = padapter->securitypriv.dot118021XGrpPrivacy;
-		}
-
-		if (check_fwstate(&padapter->mlmepriv, WIFI_ADHOC_STATE) && !is_broadcast_ether_addr(key->BSSID)) {
-			ret = _FAIL;
-			goto exit;
-		}
-
-		/*  Check key length for TKIP */
-		if ((encryptionalgo == _TKIP_) && (key->KeyLength != 32)) {
-			ret = _FAIL;
-			goto exit;
-		} else if (encryptionalgo == _AES_ && (key->KeyLength != 16 && key->KeyLength != 32)) {
-			/*  Check key length for AES */
-			/*  For NDTEST, we allow keylen = 32 in this case. 2005.01.27, by rcnjko. */
-			ret = _FAIL;
-			goto exit;
-		}
-
-		/*  Change the key length for EAPPkt9x.vxd. Added by Annie, 2005-11-03. */
-		if ((encryptionalgo ==  _AES_) && (key->KeyLength == 32))
-			key->KeyLength = 16;
-
-		if (key->KeyIndex & 0x8000000) {/* error ??? 0x8000_0000 */
-			bgrouptkey = true;
-		}
-
-		if ((check_fwstate(&padapter->mlmepriv, WIFI_ADHOC_STATE)) &&
-		    (check_fwstate(&padapter->mlmepriv, _FW_LINKED)))
-			bgrouptkey = true;
-		bgroup = true;
-	}
-
-	/*  If WEP encryption algorithm, just call rtw_set_802_11_add_wep(). */
-	if ((padapter->securitypriv.dot11AuthAlgrthm != dot11AuthAlgrthm_8021X) &&
-	    (encryptionalgo == _WEP40_ || encryptionalgo == _WEP104_)) {
-		u32 keyindex;
-		u32 len = FIELD_OFFSET(struct ndis_802_11_key, KeyMaterial) + key->KeyLength;
-		struct ndis_802_11_wep *wep = &padapter->securitypriv.ndiswep;
-
-		wep->Length = len;
-		keyindex = key->KeyIndex & 0x7fffffff;
-		wep->KeyIndex = keyindex;
-		wep->KeyLength = key->KeyLength;
-
-		memcpy(wep->KeyMaterial, key->KeyMaterial, key->KeyLength);
-		memcpy(&padapter->securitypriv.dot11DefKey[keyindex].skey[0], key->KeyMaterial, key->KeyLength);
-
-		padapter->securitypriv.dot11DefKeylen[keyindex] = key->KeyLength;
-		padapter->securitypriv.dot11PrivacyKeyIndex = keyindex;
-
-		ret = rtw_set_802_11_add_wep(padapter, wep);
-		goto exit;
-	}
-	if (key->KeyIndex & 0x20000000) {
-		/*  SetRSC */
-		if (bgroup) {
-			unsigned long long keysrc = key->KeyRSC & 0x00FFFFFFFFFFFFULL;
-			memcpy(&padapter->securitypriv.dot11Grprxpn, &keysrc, 8);
-		} else {
-			unsigned long long keysrc = key->KeyRSC & 0x00FFFFFFFFFFFFULL;
-			memcpy(&padapter->securitypriv.dot11Grptxpn, &keysrc, 8);
-		}
-	}
-
-	/*  Indicate this key idx is used for TX */
-	/*  Save the key in KeyMaterial */
-	if (bgroup) { /*  Group transmit key */
-		int res;
-
-		if (bgrouptkey)
-			padapter->securitypriv.dot118021XGrpKeyid = (u8)key->KeyIndex;
-		if ((key->KeyIndex & 0x3) == 0) {
-			ret = _FAIL;
-			goto exit;
-		}
-		memset(&padapter->securitypriv.dot118021XGrpKey[(u8)((key->KeyIndex) & 0x03)], 0, 16);
-		memset(&padapter->securitypriv.dot118021XGrptxmickey[(u8)((key->KeyIndex) & 0x03)], 0, 16);
-		memset(&padapter->securitypriv.dot118021XGrprxmickey[(u8)((key->KeyIndex) & 0x03)], 0, 16);
-
-		if ((key->KeyIndex & 0x10000000)) {
-			memcpy(&padapter->securitypriv.dot118021XGrptxmickey[(u8)((key->KeyIndex) & 0x03)], key->KeyMaterial + 16, 8);
-			memcpy(&padapter->securitypriv.dot118021XGrprxmickey[(u8)((key->KeyIndex) & 0x03)], key->KeyMaterial + 24, 8);
-		} else {
-			memcpy(&padapter->securitypriv.dot118021XGrptxmickey[(u8)((key->KeyIndex) & 0x03)], key->KeyMaterial + 24, 8);
-			memcpy(&padapter->securitypriv.dot118021XGrprxmickey[(u8)((key->KeyIndex) & 0x03)], key->KeyMaterial + 16, 8);
-		}
-
-		/* set group key by index */
-		memcpy(&padapter->securitypriv.dot118021XGrpKey[(u8)((key->KeyIndex) & 0x03)], key->KeyMaterial, key->KeyLength);
-
-		key->KeyIndex = key->KeyIndex & 0x03;
-
-		padapter->securitypriv.binstallGrpkey = true;
-
-		padapter->securitypriv.bcheck_grpkey = false;
-
-		res = rtw_set_key(padapter, &padapter->securitypriv, key->KeyIndex, 1);
-
-		if (res == _FAIL)
-			ret = _FAIL;
-
-		goto exit;
-
-	} else { /*  Pairwise Key */
-		u8 res;
-
-		pbssid = get_bssid(&padapter->mlmepriv);
-		stainfo = rtw_get_stainfo(&padapter->stapriv, pbssid);
-
-		if (stainfo) {
-			memset(&stainfo->dot118021x_UncstKey, 0, 16);/*  clear keybuffer */
-
-			memcpy(&stainfo->dot118021x_UncstKey, key->KeyMaterial, 16);
-
-			if (encryptionalgo == _TKIP_) {
-				padapter->securitypriv.busetkipkey = false;
-
-				/* _set_timer(&padapter->securitypriv.tkip_timer, 50); */
-
-				/*  if TKIP, save the Receive/Transmit MIC key in KeyMaterial[128-255] */
-				if ((key->KeyIndex & 0x10000000)) {
-					memcpy(&stainfo->dot11tkiptxmickey, key->KeyMaterial + 16, 8);
-					memcpy(&stainfo->dot11tkiprxmickey, key->KeyMaterial + 24, 8);
-
-				} else {
-					memcpy(&stainfo->dot11tkiptxmickey, key->KeyMaterial + 24, 8);
-					memcpy(&stainfo->dot11tkiprxmickey, key->KeyMaterial + 16, 8);
-				}
-			}
-
-			/* Set key to CAM through H2C command */
-			if (bgrouptkey) /* never go to here */
-				res = rtw_setstakey_cmd(padapter, (unsigned char *)stainfo, false);
-			else
-				res = rtw_setstakey_cmd(padapter, (unsigned char *)stainfo, true);
-			if (!res)
-				ret = _FAIL;
-		}
-	}
-exit:
-
-	return ret;
-}
-
 u8 rtw_set_802_11_remove_key(struct adapter *padapter, struct ndis_802_11_remove_key *key)
 {
 	u8 *pbssid;
diff --git a/drivers/staging/r8188eu/include/rtw_ioctl_set.h b/drivers/staging/r8188eu/include/rtw_ioctl_set.h
index 6216b8ab3a79..3f4b4873eb98 100644
--- a/drivers/staging/r8188eu/include/rtw_ioctl_set.h
+++ b/drivers/staging/r8188eu/include/rtw_ioctl_set.h
@@ -8,7 +8,6 @@
 
 typedef u8 NDIS_802_11_PMKID_VALUE[16];
 
-u8 rtw_set_802_11_add_key(struct adapter *adapt, struct ndis_802_11_key *key);
 u8 rtw_set_802_11_authentication_mode(struct adapter *adapt,
 				      enum ndis_802_11_auth_mode authmode);
 u8 rtw_set_802_11_bssid(struct adapter*adapter, u8 *bssid);
-- 
2.33.0

