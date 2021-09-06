Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3858D3FC7
	for <linux-staging@lists.linux.dev>; Mon,  6 Sep 2021 19:03:16 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id a25so15139661ejv.6
        for <linux-staging@lists.linux.dev>; Mon, 06 Sep 2021 12:03:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=IEOqP/a3Ml1D77dDy56BnF0eXKCaiuHX10tPsGM0jZI=;
        b=YVVRc0+dtTO0rH6qckqMy3cOiYmRm74JKzIHgrYjinzk0StLRPHxeB0sOa4bkiBSg3
         NhvMFa3n4YObV2vWjZ6oESVe2u8tohGORXkn4xWvMwTGNA9oUv5SwCA2S4iKE/227m5+
         DDBDHX0m/mUxJG6nYMBpsFoSBL2z635oEdVcjUlLgq7gpA5AhG8nCmOwBorEIRzlF9v6
         ORT8USLqzmdx4XmRdlkSbu40zObBwoFRHizHNrLL1rNxJAwAckOUOyBWutSOHtVvDkTQ
         egDz3jY5SQuOPN9hHJc4vlGSfmMhsoecX5mVRc1HhdHVvz1UFp/lf9Ojt6y4rBkRvELL
         RSEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IEOqP/a3Ml1D77dDy56BnF0eXKCaiuHX10tPsGM0jZI=;
        b=M1br0fhsbnPePiHvx13clgvY/nZncOTZ6x6zYEi7IvXGAlBIGSRHGZdNeRJq2wq+Jl
         XGUZiPqW22jUorp+Z2pwzDnE0XJ8v2aJ8J5G+OMSFDSLcZ4FUY7Q3Eppvdi9Mwcpvvhu
         k+p6se7UDQSfqhbFLNbYobEhsy7Orgsl1mU5ZuVR/FS5nh3YzzbqFVcaYc3DDPPNjHNh
         xqsrusctGe1BLFtZHd9JcmNExe4jBBosq00fnlOX1CRBM72aIr8eFNw9CtoVn9AQdy7E
         6GFOHJvguxvVCQj7b8VQT4teMGWaLDRUH3xZXffl+4e5MIuS35n7f4JLB1br8bDuokLk
         T3Qg==
X-Gm-Message-State: AOAM533uFdAZmFm38wNCX6DUFqTi+oYszG2T7otEs3g/RG1fq9rIEuyQ
	nuBADUlfT1Ie4sFHCmtKxXs=
X-Google-Smtp-Source: ABdhPJwU2y9NsU2KDRM1gdb/AW1E4RYtx720Jm8C9vFkloM4Tq9OFGsQXCWfhNW++C9uuO2Ra7XNWQ==
X-Received: by 2002:a17:907:7f93:: with SMTP id qk19mr14372687ejc.433.1630954994646;
        Mon, 06 Sep 2021 12:03:14 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::8fe1])
        by smtp.gmail.com with ESMTPSA id k15sm4372018ejb.92.2021.09.06.12.03.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Sep 2021 12:03:14 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH v3 40/40] staging: r8188eu: remove UpdateHalRAMask8188EUsb from hal_ops
Date: Mon,  6 Sep 2021 21:02:23 +0200
Message-Id: <20210906190223.11396-41-straube.linux@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210906190223.11396-1-straube.linux@gmail.com>
References: <20210906190223.11396-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove UpdateHalRAMask8188EUsb from hal_ops and call
UpdateHalRAMask8188EUsb() directly instead.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/hal/hal_intf.c     | 4 +---
 drivers/staging/r8188eu/hal/usb_halinit.c  | 4 +---
 drivers/staging/r8188eu/include/hal_intf.h | 4 +---
 3 files changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/hal_intf.c b/drivers/staging/r8188eu/hal/hal_intf.c
index d38a8134b243..92c55b9ab244 100644
--- a/drivers/staging/r8188eu/hal/hal_intf.c
+++ b/drivers/staging/r8188eu/hal/hal_intf.c
@@ -139,9 +139,7 @@ void rtw_hal_update_ra_mask(struct adapter *adapt, u32 mac_id, u8 rssi_level)
 			add_RATid(adapt, psta, 0);/* todo: based on rssi_level*/
 #endif
 	} else {
-		if (adapt->HalFunc.UpdateRAMaskHandler)
-			adapt->HalFunc.UpdateRAMaskHandler(adapt, mac_id,
-							      rssi_level);
+		UpdateHalRAMask8188EUsb(adapt, mac_id, rssi_level);
 	}
 }
 
diff --git a/drivers/staging/r8188eu/hal/usb_halinit.c b/drivers/staging/r8188eu/hal/usb_halinit.c
index 4d60b5156995..37a976c56f06 100644
--- a/drivers/staging/r8188eu/hal/usb_halinit.c
+++ b/drivers/staging/r8188eu/hal/usb_halinit.c
@@ -2064,7 +2064,7 @@ static u8 SetHalDefVar8188EUsb(struct adapter *Adapter, enum hal_def_variable eV
 	return bResult;
 }
 
-static void UpdateHalRAMask8188EUsb(struct adapter *adapt, u32 mac_id, u8 rssi_level)
+void UpdateHalRAMask8188EUsb(struct adapter *adapt, u32 mac_id, u8 rssi_level)
 {
 	u8 init_rate = 0;
 	u8 networkType, raid;
@@ -2230,8 +2230,6 @@ void rtl8188eu_set_hal_ops(struct adapter *adapt)
 	halfunc->GetHalDefVarHandler = &GetHalDefVar8188EUsb;
 	halfunc->SetHalDefVarHandler = &SetHalDefVar8188EUsb;
 
-	halfunc->UpdateRAMaskHandler = &UpdateHalRAMask8188EUsb;
-
 	halfunc->hal_xmit = &rtl8188eu_hal_xmit;
 	halfunc->mgnt_xmit = &rtl8188eu_mgnt_xmit;
 
diff --git a/drivers/staging/r8188eu/include/hal_intf.h b/drivers/staging/r8188eu/include/hal_intf.h
index 668a21cbe71e..727ef8511f64 100644
--- a/drivers/staging/r8188eu/include/hal_intf.h
+++ b/drivers/staging/r8188eu/include/hal_intf.h
@@ -147,9 +147,6 @@ struct hal_ops {
 				       enum hal_def_variable eVariable,
 				       void *pValue);
 
-	void	(*UpdateRAMaskHandler)(struct adapter *padapter,
-				       u32 mac_id, u8 rssi_level);
-
 	s32	(*hal_xmit)(struct adapter *padapter,
 			    struct xmit_frame *pxmitframe);
 	s32 (*mgnt_xmit)(struct adapter *padapter,
@@ -205,6 +202,7 @@ int rtl8188e_Efuse_PgPacketWrite(struct adapter *pAdapter, u8 offset, u8 word_en
 void hal_notch_filter_8188e(struct adapter *adapter, bool enable);
 
 void SetBeaconRelatedRegisters8188EUsb(struct adapter *adapt);
+void UpdateHalRAMask8188EUsb(struct adapter *adapt, u32 mac_id, u8 rssi_level);
 
 uint rtw_hal_init(struct adapter *padapter);
 uint rtw_hal_deinit(struct adapter *padapter);
-- 
2.33.0

