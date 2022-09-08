Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A51AC7C
	for <linux-staging@lists.linux.dev>; Thu,  8 Sep 2022 13:09:29 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id fy31so37948033ejc.6
        for <linux-staging@lists.linux.dev>; Thu, 08 Sep 2022 06:09:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=bFqxdPA34fBehnbSp3k/mNFHYFTdf2a6bzWDE1HOQiA=;
        b=M1xjCXfWrc6HNSbMz1Z5Dc85Hyz/AoQ/ZM0MBsn2McqOk4hTpoojCBxbej/jRFyGbs
         I7LrhNJweCpICR3XrKWTp5mokrPwUXkPRGFVb1etwJdXR6rN9b59Q2cDWgKcq3zdL5qK
         ICnCpl52/pTXSbiTKHElBJkHT0Rm+o/YNEw2SA3VERlRuIlDc04o0XfkM3uk/oorm5ty
         grp0tJxSO74Mw/JP3LlBInn1ZMxP7z4O6lUTIx7QZUqN/Ik5ZFOgtxv+OcACpCpdIxGF
         T1rojMliAgdbwnNMVT6bCFiWPWzNt5LZNMwKX+UElBAI56rzoymJio2dbnetxW2hLPTR
         cz6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=bFqxdPA34fBehnbSp3k/mNFHYFTdf2a6bzWDE1HOQiA=;
        b=MmNoD7MwGQTszm+7ZbsqerU7PPDp2kBSpSv84ooMb70K06Nl12M2KpL7EN+OUCovXM
         LnmdzVh9hDN+2XkuyZoYrK+fAwSKChQfepTUuOQkWwMwoTQKsYQfT2BiA08JVOz2ytrz
         6calbW3tAKAVjn3lfRwT6XJ1cDrosco5nbY3Vyx+uQKp34ycAfTP+f0eMN8pFp7KvisA
         FdTSpqpcTK3dW53E9HHTb77tWpibwZaGr5w9AjqFuWHU/E9TTUYuiVshoFX7EwNrbbgW
         Old+Bd+/NSautQahxzADTtWhnPkcpq6/dtiUuxMc2YZ0LcjFJ76vhlFxFWqsUiR5k7P1
         Z1Sg==
X-Gm-Message-State: ACgBeo2nPWCdD2hLrF4MoI5YSHAkWDyxlSG9/mzkbikC4b+uRnaVyidL
	TF+aF+0KwQxF6u0605bYgac=
X-Google-Smtp-Source: AA6agR7AggqzJ6OW4WbMptOsRrGp+z8wVvemfZdMVRW/PE7dazn1RxQF3O51GGQsuFflQgreDHcZ9A==
X-Received: by 2002:a17:907:2da6:b0:730:8b30:e517 with SMTP id gt38-20020a1709072da600b007308b30e517mr5985555ejc.291.1662642567943;
        Thu, 08 Sep 2022 06:09:27 -0700 (PDT)
Received: from localhost.localdomain (ip5f5abb6b.dynamic.kabel-deutschland.de. [95.90.187.107])
        by smtp.gmail.com with ESMTPSA id cf6-20020a0564020b8600b0044edf0a2deasm4847978edb.69.2022.09.08.06.09.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Sep 2022 06:09:27 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 3/4] staging: r8188eu: make two functions static
Date: Thu,  8 Sep 2022 15:09:14 +0200
Message-Id: <20220908130915.8406-4-straube.linux@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220908130915.8406-1-straube.linux@gmail.com>
References: <20220908130915.8406-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The functions UpdateBrateTbl() and UpdateBrateTblForSoftAP() are only
used in rtw_mlme_ext.c. Make them static.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_mlme_ext.c   | 40 +++++++++++++++++++
 drivers/staging/r8188eu/core/rtw_wlan_util.c  | 40 -------------------
 .../staging/r8188eu/include/rtw_mlme_ext.h    |  2 -
 3 files changed, 40 insertions(+), 42 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_mlme_ext.c b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
index ad8bfc29c4ce..03b1e6ab9053 100644
--- a/drivers/staging/r8188eu/core/rtw_mlme_ext.c
+++ b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
@@ -932,6 +932,46 @@ unsigned int OnAuthClient(struct adapter *padapter, struct recv_frame *precv_fra
 	return _FAIL;
 }
 
+static void UpdateBrateTbl(u8 *mbrate)
+{
+	u8 i;
+	u8 rate;
+
+	/*  1M, 2M, 5.5M, 11M, 6M, 12M, 24M are mandatory. */
+	for (i = 0; i < NDIS_802_11_LENGTH_RATES_EX; i++) {
+		rate = mbrate[i] & 0x7f;
+		switch (rate) {
+		case IEEE80211_CCK_RATE_1MB:
+		case IEEE80211_CCK_RATE_2MB:
+		case IEEE80211_CCK_RATE_5MB:
+		case IEEE80211_CCK_RATE_11MB:
+		case IEEE80211_OFDM_RATE_6MB:
+		case IEEE80211_OFDM_RATE_12MB:
+		case IEEE80211_OFDM_RATE_24MB:
+			mbrate[i] |= IEEE80211_BASIC_RATE_MASK;
+			break;
+		}
+	}
+}
+
+static void UpdateBrateTblForSoftAP(u8 *bssrateset, u32 bssratelen)
+{
+	u8 i;
+	u8 rate;
+
+	for (i = 0; i < bssratelen; i++) {
+		rate = bssrateset[i] & 0x7f;
+		switch (rate) {
+		case IEEE80211_CCK_RATE_1MB:
+		case IEEE80211_CCK_RATE_2MB:
+		case IEEE80211_CCK_RATE_5MB:
+		case IEEE80211_CCK_RATE_11MB:
+			bssrateset[i] |= IEEE80211_BASIC_RATE_MASK;
+			break;
+		}
+	}
+}
+
 unsigned int OnAssocReq(struct adapter *padapter, struct recv_frame *precv_frame)
 {
 	u16 capab_info;
diff --git a/drivers/staging/r8188eu/core/rtw_wlan_util.c b/drivers/staging/r8188eu/core/rtw_wlan_util.c
index 065ab274b0b4..e50631848cab 100644
--- a/drivers/staging/r8188eu/core/rtw_wlan_util.c
+++ b/drivers/staging/r8188eu/core/rtw_wlan_util.c
@@ -222,46 +222,6 @@ void get_rate_set(struct adapter *padapter, unsigned char *pbssrate, int *bssrat
 	memcpy(pbssrate, supportedrates, *bssrate_len);
 }
 
-void UpdateBrateTbl(u8 *mbrate)
-{
-	u8	i;
-	u8	rate;
-
-	/*  1M, 2M, 5.5M, 11M, 6M, 12M, 24M are mandatory. */
-	for (i = 0; i < NDIS_802_11_LENGTH_RATES_EX; i++) {
-		rate = mbrate[i] & 0x7f;
-		switch (rate) {
-		case IEEE80211_CCK_RATE_1MB:
-		case IEEE80211_CCK_RATE_2MB:
-		case IEEE80211_CCK_RATE_5MB:
-		case IEEE80211_CCK_RATE_11MB:
-		case IEEE80211_OFDM_RATE_6MB:
-		case IEEE80211_OFDM_RATE_12MB:
-		case IEEE80211_OFDM_RATE_24MB:
-			mbrate[i] |= IEEE80211_BASIC_RATE_MASK;
-			break;
-		}
-	}
-}
-
-void UpdateBrateTblForSoftAP(u8 *bssrateset, u32 bssratelen)
-{
-	u8	i;
-	u8	rate;
-
-	for (i = 0; i < bssratelen; i++) {
-		rate = bssrateset[i] & 0x7f;
-		switch (rate) {
-		case IEEE80211_CCK_RATE_1MB:
-		case IEEE80211_CCK_RATE_2MB:
-		case IEEE80211_CCK_RATE_5MB:
-		case IEEE80211_CCK_RATE_11MB:
-			bssrateset[i] |= IEEE80211_BASIC_RATE_MASK;
-			break;
-		}
-	}
-}
-
 void Save_DM_Func_Flag(struct adapter *padapter)
 {
 	struct hal_data_8188e *haldata = &padapter->haldata;
diff --git a/drivers/staging/r8188eu/include/rtw_mlme_ext.h b/drivers/staging/r8188eu/include/rtw_mlme_ext.h
index e70640f1e41d..b322d0848db9 100644
--- a/drivers/staging/r8188eu/include/rtw_mlme_ext.h
+++ b/drivers/staging/r8188eu/include/rtw_mlme_ext.h
@@ -393,8 +393,6 @@ extern struct xmit_frame *alloc_mgtxmitframe(struct xmit_priv *pxmitpriv);
 unsigned char networktype_to_raid(unsigned char network_type);
 u8 judge_network_type(struct adapter *padapter, unsigned char *rate, int len);
 void get_rate_set(struct adapter *padapter, unsigned char *pbssrate, int *len);
-void UpdateBrateTbl(u8 *mBratesOS);
-void UpdateBrateTblForSoftAP(u8 *bssrateset, u32 bssratelen);
 
 void Save_DM_Func_Flag(struct adapter *padapter);
 void Restore_DM_Func_Flag(struct adapter *padapter);
-- 
2.37.2

