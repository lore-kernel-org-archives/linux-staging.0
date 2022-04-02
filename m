Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5B61136C
	for <linux-staging@lists.linux.dev>; Sat,  2 Apr 2022 09:23:41 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id z92so5503719ede.13
        for <linux-staging@lists.linux.dev>; Sat, 02 Apr 2022 02:23:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=X+8dg39ZMxlEKu2qH0LGovBPHbNVLriY80Y0/3wt26s=;
        b=jlUnGQO7VLQB02aBXnzHHIIQmsem5Y7978FHYZkQ13bzMli1+/HLZRuLxcIJF2DJs1
         +92SzMyRr2jGVIYK4S8AcAVtkFyzHqdHAW+7aIZWIy/lH1263RcEqYOAadjdfALFIGv4
         7/Orl4U2qSYVqXpF2AalYXFufuAuYZv+rQc+CIHxZhzKL4PugBSzc3Jwvaa5FMJzxJvt
         +qZlNfs22J2AujLaEGaIQy4tlmw4emRFE5TQc5GcKYvInTtoYMF0HYF0bG38MRdEJIBe
         q9Zi3EWk4BdbxuXNnRFOcPW5E8Ys1sXeAVZ3bypyZBUKzRvE29UeZiSOlcBY8MbAM6Ou
         koww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=X+8dg39ZMxlEKu2qH0LGovBPHbNVLriY80Y0/3wt26s=;
        b=dbuSpxriY/1IlqABk5Ta68IwHxKBYIKyv9vc43SqNcmUwvkSJHJWr7kvDEeIAlXu1w
         6xWorROIdOyoLgUDMA3zkacbFWus8JDuyOnTX6m/LIl76VcgsGgNkvQ4UKyBAN2WYsy0
         gAFP69wycqsCsEYfvImh6JNFrCd2eHWzluFX7PXOBUW1g8QdlmN7Omo886xAM1u4TWeN
         3PTIL/mpPUhMcyu6PEjrKzr3nS+OnrJPEXrqV42OA/5eJy4NewSnYYyYeeA4LqMHNW0v
         HFHTCId1KxPPFFSkUmqAtMEIdAVhpWqAcOQbGwO/7XRchNzsqLsRjDstQ1T0G2uzjP8e
         urJQ==
X-Gm-Message-State: AOAM530Gi3fWxk8pAjqeD7pg3X5zBndyw5Ckty7egGfRRNOvaVpv0Ygp
	M6Rzf9w7mD5OCo8xbLgArgc=
X-Google-Smtp-Source: ABdhPJw7gJEAS/rD6G/8I5GInrNgjVelEj0neKitE2n+7DXDAwmVMyaJi0UH53HFZgBul7DOyMPxrQ==
X-Received: by 2002:a05:6402:5245:b0:419:5437:fc6b with SMTP id t5-20020a056402524500b004195437fc6bmr24091277edd.282.1648891420229;
        Sat, 02 Apr 2022 02:23:40 -0700 (PDT)
Received: from localhost.localdomain (ip5f5abb55.dynamic.kabel-deutschland.de. [95.90.187.85])
        by smtp.gmail.com with ESMTPSA id jv19-20020a170907769300b006e095c047d6sm1897679ejc.109.2022.04.02.02.23.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Apr 2022 02:23:39 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 3/7] staging: r8188eu: remove HW_VAR_AMPDU_MIN_SPACE from SetHwReg8188EU()
Date: Sat,  2 Apr 2022 11:23:28 +0200
Message-Id: <20220402092332.6627-4-straube.linux@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220402092332.6627-1-straube.linux@gmail.com>
References: <20220402092332.6627-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the HW_VAR_AMPDU_MIN_SPACE case from SetHwReg8188EU() and move
its functionality to rtw_wlan_util.c where it is actually used. This
is part of the ongoing effort to get rid of the unwanted hal layer.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_wlan_util.c | 31 +++++++++++++++++++-
 drivers/staging/r8188eu/hal/usb_halinit.c    | 28 ------------------
 drivers/staging/r8188eu/include/hal_intf.h   |  1 -
 3 files changed, 30 insertions(+), 30 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_wlan_util.c b/drivers/staging/r8188eu/core/rtw_wlan_util.c
index acc554627adc..b526715a70bc 100644
--- a/drivers/staging/r8188eu/core/rtw_wlan_util.c
+++ b/drivers/staging/r8188eu/core/rtw_wlan_util.c
@@ -760,6 +760,35 @@ void HT_info_handler(struct adapter *padapter, struct ndis_802_11_var_ie *pIE)
 	memcpy(&pmlmeinfo->HT_info, pIE->data, pIE->Length);
 }
 
+static void set_min_ampdu_spacing(struct adapter *adapter, u8 spacing)
+{
+	u8 sec_spacing;
+
+	if (spacing <= 7) {
+		switch (adapter->securitypriv.dot11PrivacyAlgrthm) {
+		case _NO_PRIVACY_:
+		case _AES_:
+			sec_spacing = 0;
+			break;
+		case _WEP40_:
+		case _WEP104_:
+		case _TKIP_:
+		case _TKIP_WTMIC_:
+			sec_spacing = 6;
+			break;
+		default:
+			sec_spacing = 7;
+			break;
+		}
+
+		if (spacing < sec_spacing)
+			spacing = sec_spacing;
+
+		rtw_write8(adapter, REG_AMPDU_MIN_SPACE,
+			   (rtw_read8(adapter, REG_AMPDU_MIN_SPACE) & 0xf8) | spacing);
+	}
+}
+
 void HTOnAssocRsp(struct adapter *padapter)
 {
 	unsigned char		max_AMPDU_len;
@@ -784,7 +813,7 @@ void HTOnAssocRsp(struct adapter *padapter)
 
 	min_MPDU_spacing = (pmlmeinfo->HT_caps.u.HT_cap_element.AMPDU_para & 0x1c) >> 2;
 
-	SetHwReg8188EU(padapter, HW_VAR_AMPDU_MIN_SPACE, (u8 *)(&min_MPDU_spacing));
+	set_min_ampdu_spacing(padapter, min_MPDU_spacing);
 
 	SetHwReg8188EU(padapter, HW_VAR_AMPDU_FACTOR, (u8 *)(&max_AMPDU_len));
 }
diff --git a/drivers/staging/r8188eu/hal/usb_halinit.c b/drivers/staging/r8188eu/hal/usb_halinit.c
index 9326a6080819..7b231e9a2193 100644
--- a/drivers/staging/r8188eu/hal/usb_halinit.c
+++ b/drivers/staging/r8188eu/hal/usb_halinit.c
@@ -1113,34 +1113,6 @@ void SetHwReg8188EU(struct adapter *Adapter, u8 variable, u8 *val)
 		haldata->AcParam_BE = ((u32 *)(val))[0];
 		rtw_write32(Adapter, REG_EDCA_BE_PARAM, ((u32 *)(val))[0]);
 		break;
-	case HW_VAR_AMPDU_MIN_SPACE:
-		{
-			u8 MinSpacingToSet;
-			u8 SecMinSpace;
-
-			MinSpacingToSet = *((u8 *)val);
-			if (MinSpacingToSet <= 7) {
-				switch (Adapter->securitypriv.dot11PrivacyAlgrthm) {
-				case _NO_PRIVACY_:
-				case _AES_:
-					SecMinSpace = 0;
-					break;
-				case _WEP40_:
-				case _WEP104_:
-				case _TKIP_:
-				case _TKIP_WTMIC_:
-					SecMinSpace = 6;
-					break;
-				default:
-					SecMinSpace = 7;
-					break;
-				}
-				if (MinSpacingToSet < SecMinSpace)
-					MinSpacingToSet = SecMinSpace;
-				rtw_write8(Adapter, REG_AMPDU_MIN_SPACE, (rtw_read8(Adapter, REG_AMPDU_MIN_SPACE) & 0xf8) | MinSpacingToSet);
-			}
-		}
-		break;
 	case HW_VAR_AMPDU_FACTOR:
 		{
 			u8 RegToSet_Normal[4] = {0x41, 0xa8, 0x72, 0xb9};
diff --git a/drivers/staging/r8188eu/include/hal_intf.h b/drivers/staging/r8188eu/include/hal_intf.h
index c2b97fa4e372..c18ff1469c2b 100644
--- a/drivers/staging/r8188eu/include/hal_intf.h
+++ b/drivers/staging/r8188eu/include/hal_intf.h
@@ -20,7 +20,6 @@ enum hw_variables {
 	HW_VAR_DM_FUNC_RESET,
 	HW_VAR_DM_FUNC_CLR,
 	HW_VAR_AC_PARAM_BE,
-	HW_VAR_AMPDU_MIN_SPACE,
 	HW_VAR_AMPDU_FACTOR,
 	HW_VAR_H2C_FW_PWRMODE,
 	HW_VAR_H2C_FW_JOINBSSRPT,
-- 
2.35.1

