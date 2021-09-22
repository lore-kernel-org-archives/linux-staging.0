Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 970433FD1
	for <linux-staging@lists.linux.dev>; Wed, 22 Sep 2021 20:05:45 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id w17so10317920wrv.10
        for <linux-staging@lists.linux.dev>; Wed, 22 Sep 2021 13:05:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gBoZB6IPnDzP6Z2VHwZ4zwFC4j+SMIijYS+PLeU5dtg=;
        b=Y/x+r6lD5cYg3h5FLPDTx9DX0jlKGe/N/wPJDdhSBCPN0SmkbCfRytphYqPfGAC1ZK
         Q/YDtpwHbuLSn/xoZgKtJ8n0jBh6O16qId/J/CPUS/mG83PeE78ynkz7g7WZxWhKMBe4
         XWFc1t0zNTX4FyQwl1MJtT0IxyQkva99ngeUsyhfqavq3pmahTrvaV/bqqYz32bvzr/o
         DmyFMmTNW2VClTt9X5YxJ8V8fmt7f1WhJUe6JWhnlHi6bjZ5e+mMCbxSELuv0/AGguWn
         g9fEzH2Q7eqsvQwaqKi4Rhsl3dEXx69JUFxtvtfnyMea+PNv13SoA7lJ1IhPufl08ZIF
         gNSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gBoZB6IPnDzP6Z2VHwZ4zwFC4j+SMIijYS+PLeU5dtg=;
        b=XrglOpReXC5+xnHaWPg1aGCBo/ABss4KT7EePXrxe5FzWAhEl35dFukaXj3xRsUj2Y
         H76H0aD+CTOoK7OuniMyZYrHPtYluh1qqSdCCMgfbN/Pt4urGTOqpHDkX+vEd+DjPsor
         HWywzvi16YHi0NCaJ9o35pupka6A1TdCntSqhRbsdLTNv5VEYk/7xNDzZEcf+SC8Iopp
         BxWFqmBqn1O6Iyp6xS7asuj6UhjUEqhH6rXc4vRFc6X3jj1rAoXxs1gZ1CqbdFFyqg9W
         hPnjAr7+mOEpIJHISpwF+2TPtSif92QM8v9ksWN20P4GewCcwWHy8Srr1pqkOqoQQb1U
         pkUg==
X-Gm-Message-State: AOAM5318NZS1MFGJX4YOJs7knVRbvLOUw/oaI4XIR5JD6Pg1hq/E9VNH
	tTDss3250dFXgrxhx8EKDJSvGVONsBKH3g==
X-Google-Smtp-Source: ABdhPJxhv6/PN/ZF56m2oN3xBpX95/hcpPKNox0zpEkbEleST4iJ9HEJgjk2LtsYXiei5uyiCssFCQ==
X-Received: by 2002:a7b:cb4b:: with SMTP id v11mr12528883wmj.155.1632341144012;
        Wed, 22 Sep 2021 13:05:44 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::cde])
        by smtp.gmail.com with ESMTPSA id e2sm3219761wra.40.2021.09.22.13.05.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Sep 2021 13:05:43 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 19/47] staging: r8188eu: remove rtw_set_802_11_remove_key()
Date: Wed, 22 Sep 2021 22:03:52 +0200
Message-Id: <20210922200420.9693-20-straube.linux@gmail.com>
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

Function rtw_set_802_11_remove_key() is not used, remove it.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_ioctl_set.c  | 37 -------------------
 .../staging/r8188eu/include/rtw_ioctl_set.h   |  2 -
 2 files changed, 39 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_ioctl_set.c b/drivers/staging/r8188eu/core/rtw_ioctl_set.c
index afa72b21fc0b..219d579a853f 100644
--- a/drivers/staging/r8188eu/core/rtw_ioctl_set.c
+++ b/drivers/staging/r8188eu/core/rtw_ioctl_set.c
@@ -492,43 +492,6 @@ u8 rtw_set_802_11_remove_wep(struct adapter *padapter, u32 keyindex)
 	return ret;
 }
 
-u8 rtw_set_802_11_remove_key(struct adapter *padapter, struct ndis_802_11_remove_key *key)
-{
-	u8 *pbssid;
-	struct sta_info *stainfo;
-	u8	bgroup = (key->KeyIndex & 0x4000000) > 0 ? false : true;
-	u8	keyIndex = (u8)key->KeyIndex & 0x03;
-	u8	ret = _SUCCESS;
-
-	if ((key->KeyIndex & 0xbffffffc) > 0) {
-		ret = _FAIL;
-		goto exit;
-	}
-
-	if (bgroup) {
-		/*  clear group key by index */
-
-		memset(&padapter->securitypriv.dot118021XGrpKey[keyIndex], 0, 16);
-
-		/*  \todo Send a H2C Command to Firmware for removing this Key in CAM Entry. */
-	} else {
-		pbssid = get_bssid(&padapter->mlmepriv);
-		stainfo = rtw_get_stainfo(&padapter->stapriv, pbssid);
-		if (stainfo) {
-			/*  clear key by BSSID */
-			memset(&stainfo->dot118021x_UncstKey, 0, 16);
-
-			/*  \todo Send a H2C Command to Firmware for disable this Key in CAM Entry. */
-		} else {
-			ret = _FAIL;
-			goto exit;
-		}
-	}
-exit:
-
-	return ret;
-}
-
 /*
 * rtw_get_cur_max_rate -
 * @adapter: pointer to struct adapter structure
diff --git a/drivers/staging/r8188eu/include/rtw_ioctl_set.h b/drivers/staging/r8188eu/include/rtw_ioctl_set.h
index 3f4b4873eb98..6203f49f8bf7 100644
--- a/drivers/staging/r8188eu/include/rtw_ioctl_set.h
+++ b/drivers/staging/r8188eu/include/rtw_ioctl_set.h
@@ -20,8 +20,6 @@ u8 rtw_set_802_11_infrastructure_mode(struct adapter *adapter,
 				      enum ndis_802_11_network_infra type);
 u8 rtw_set_802_11_remove_wep(struct adapter *adapter, u32 keyindex);
 u8 rtw_set_802_11_ssid(struct adapter *adapt, struct ndis_802_11_ssid *ssid);
-u8 rtw_set_802_11_remove_key(struct adapter *adapt,
-			     struct ndis_802_11_remove_key *key);
 u8 rtw_validate_ssid(struct ndis_802_11_ssid *ssid);
 u16 rtw_get_cur_max_rate(struct adapter *adapter);
 int rtw_set_scan_mode(struct adapter *adapter, enum rt_scan_type scan_mode);
-- 
2.33.0

