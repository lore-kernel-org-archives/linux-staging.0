Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 474A83FC7
	for <linux-staging@lists.linux.dev>; Mon,  6 Sep 2021 19:02:57 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id r7so10619186edd.6
        for <linux-staging@lists.linux.dev>; Mon, 06 Sep 2021 12:02:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gmbLARluVxMQ+ZokkZJzSgEYmy1Qusxy/6FmmYzAGJc=;
        b=OjyEBq85EXnSmdQni4t4o/a0F2VyQrcxd7NlvdEAffSRudypur4PcvR/0H4/k4TC8F
         suxON3ntO2PXwvPRT16Ootac7WIq+zhoFd2lNuaf0kfCHO32aINr8EzNv7zyfxG3MOZD
         urWhf+hqhvGKSQsXiQjL9HIvCr/PHQmpVOOIvTZpN4gSA5yfI0Qu/gZGdkPHWTsr7p2N
         11q+SY8TtOhH2ooTNai/6m2MYzA0j6brMoZA1P47WSIYJueUcNVmhwdU5TxsyZ5xzcqZ
         jjWvdHThjFNFaiEubRzIE30rZPaHlmv2CzjCCxI6RJp3xOkdP9UP12ypiq+oVcIK3MBt
         rrMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gmbLARluVxMQ+ZokkZJzSgEYmy1Qusxy/6FmmYzAGJc=;
        b=RVZABfr1vn+K3mlkNyn1Ehi0K0m9Mtq5H9jqdkaWkvJtr7+/JCHjk3J04irfillztg
         uXSMhgOoo6sEwyDkYllfzL8fMO3ec2+4qYUv6db8fQPjpDhrWewk18W8SU4LovNPBJcN
         +sQI1Z/9rGk4VeseYneJxGZE7nSNzDTzw/ArE3nb5UWhSVZ/kUiOvqo323YNOKztpLXa
         JsgjhyMwUihjvg3t4YYVVwEX336p3nFGddvUbO0hTxA4cxXUsoS0OijC+ywCV105FCUN
         t5xalNIjGLOm5bbNBG+GptNm/r8QciZ+0y2lLygr/CLs6NPcCQFcKDjH7Sbm7y9nDnYm
         r8uw==
X-Gm-Message-State: AOAM5320nbZROY56Yh0Hf+90/nShyaL0tqxpo7mraaQnF0U6a8csTaVC
	0vfQsk+WkY7J6FUNT/OEUsQ=
X-Google-Smtp-Source: ABdhPJxmA1nCb4FriIsPzsBDcZdNByhrlK7bX+M0yR3Xe7cdR9uslsj/orTVwX+9HBiofuR82ZqC8g==
X-Received: by 2002:a05:6402:1703:: with SMTP id y3mr14724939edu.355.1630954975715;
        Mon, 06 Sep 2021 12:02:55 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::8fe1])
        by smtp.gmail.com with ESMTPSA id k15sm4372018ejb.92.2021.09.06.12.02.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Sep 2021 12:02:55 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH v3 14/40] staging: r8188eu: remove hal_power_on from hal_ops
Date: Mon,  6 Sep 2021 21:01:57 +0200
Message-Id: <20210906190223.11396-15-straube.linux@gmail.com>
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

Remove hal_power_on from hal_ops and remove its wrapper
rtw_hal_power_on(). Call rtl8188eu_InitPowerOn() directly instead.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/hal/hal_intf.c          | 7 -------
 drivers/staging/r8188eu/hal/rtl8188e_hal_init.c | 2 +-
 drivers/staging/r8188eu/hal/usb_halinit.c       | 3 +--
 drivers/staging/r8188eu/include/hal_intf.h      | 4 +---
 4 files changed, 3 insertions(+), 13 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/hal_intf.c b/drivers/staging/r8188eu/hal/hal_intf.c
index 39b1a8711754..58ece9a1232c 100644
--- a/drivers/staging/r8188eu/hal/hal_intf.c
+++ b/drivers/staging/r8188eu/hal/hal_intf.c
@@ -12,13 +12,6 @@ void rtw_hal_free_data(struct adapter *adapt)
 		adapt->HalFunc.free_hal_data(adapt);
 }
 
-u32 rtw_hal_power_on(struct adapter *adapt)
-{
-	if (adapt->HalFunc.hal_power_on)
-		return adapt->HalFunc.hal_power_on(adapt);
-	return _FAIL;
-}
-
 uint	 rtw_hal_init(struct adapter *adapt)
 {
 	uint	status = _SUCCESS;
diff --git a/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c b/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
index 0b14748e1346..207fb182ee6c 100644
--- a/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
+++ b/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
@@ -904,7 +904,7 @@ static void ReadEFuseByIC(struct adapter *Adapter, u8 efuseType, u16 _offset, u1
 	if (!bPseudoTest) {
 		int ret = _FAIL;
 		if (rtw_IOL_applied(Adapter)) {
-			rtw_hal_power_on(Adapter);
+			rtl8188eu_InitPowerOn(Adapter);
 
 			iol_mode_enable(Adapter, 1);
 			ret = iol_read_efuse(Adapter, 0, _offset, _size_byte, pbuf);
diff --git a/drivers/staging/r8188eu/hal/usb_halinit.c b/drivers/staging/r8188eu/hal/usb_halinit.c
index 7b9cca4e3cb4..2c010f12118a 100644
--- a/drivers/staging/r8188eu/hal/usb_halinit.c
+++ b/drivers/staging/r8188eu/hal/usb_halinit.c
@@ -85,7 +85,7 @@ void rtl8188eu_interface_configure(struct adapter *adapt)
 				pdvobjpriv->RtNumInPipes, pdvobjpriv->RtNumOutPipes);
 }
 
-static u32 rtl8188eu_InitPowerOn(struct adapter *adapt)
+u32 rtl8188eu_InitPowerOn(struct adapter *adapt)
 {
 	u16 value16;
 	/*  HW Power on sequence */
@@ -2214,7 +2214,6 @@ void rtl8188eu_set_hal_ops(struct adapter *adapt)
 		DBG_88E("cant not alloc memory for HAL DATA\n");
 	adapt->hal_data_sz = sizeof(struct hal_data_8188e);
 
-	halfunc->hal_power_on = rtl8188eu_InitPowerOn;
 	halfunc->hal_init = &rtl8188eu_hal_init;
 	halfunc->hal_deinit = &rtl8188eu_hal_deinit;
 
diff --git a/drivers/staging/r8188eu/include/hal_intf.h b/drivers/staging/r8188eu/include/hal_intf.h
index 9f804f9f5363..63842cd469c5 100644
--- a/drivers/staging/r8188eu/include/hal_intf.h
+++ b/drivers/staging/r8188eu/include/hal_intf.h
@@ -124,7 +124,6 @@ enum hal_odm_variable {
 typedef s32 (*c2h_id_filter)(u8 id);
 
 struct hal_ops {
-	u32	(*hal_power_on)(struct adapter *padapter);
 	u32	(*hal_init)(struct adapter *padapter);
 	u32	(*hal_deinit)(struct adapter *padapter);
 
@@ -227,10 +226,9 @@ void ReadAdapterInfo8188EU(struct adapter *Adapter);
 void rtl8188eu_init_default_value(struct adapter *adapt);
 void rtl8188e_SetHalODMVar(struct adapter *Adapter,
 			   enum hal_odm_variable eVariable, void *pValue1, bool bSet);
+u32 rtl8188eu_InitPowerOn(struct adapter *adapt);
 
 void	rtw_hal_free_data(struct adapter *padapter);
-
-u32 rtw_hal_power_on(struct adapter *padapter);
 uint rtw_hal_init(struct adapter *padapter);
 uint rtw_hal_deinit(struct adapter *padapter);
 void rtw_hal_stop(struct adapter *padapter);
-- 
2.33.0

