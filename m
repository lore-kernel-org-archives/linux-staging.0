Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 969963FC1
	for <linux-staging@lists.linux.dev>; Sat,  4 Sep 2021 12:40:53 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id e26so1135117wmk.2
        for <linux-staging@lists.linux.dev>; Sat, 04 Sep 2021 05:40:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Y9NOLVNCg5vyFaFZcP/LgsBaZ+PUGsqLHHY87rmIV10=;
        b=K8GRDebkz9ObEz33QLQH3DA0mEsuyqgTTO+Fg7Ec080oQCrncq+XL7qB/4zLyzEcJn
         MwgjOwFj2P9fU835mdGDt8pvBPIIprkrWyCsDrSxSrlsEEtZTwro3d/7+DPP6vki8BiE
         CklaCGm4vdgGOyz7bctcMZ1Cbe52LG3c/VHNeWZPwxEW0z9VGe4HHlk3eRfH2m4qRUWz
         JConsI1LcSqvjtFGGxavDoO6/r2vmSvQADlalMNCAZrMFqt9w22im3Bdk9oGeJdWiFsi
         QtuLMhdHhM5/JK2osZDJc5pEq02XxeyTHVOhiDDk6XpNqOX4NruKIRWFyf5KWBFxi+y3
         EcbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Y9NOLVNCg5vyFaFZcP/LgsBaZ+PUGsqLHHY87rmIV10=;
        b=SAY6y38fr0sG3Fd8tJqZ/xNwK7EQNc5RifRi4eocg/pQhSpHe7ikfhyOf6YAa7pM4l
         4IYcOycVASEi779eVI4Pv5xMNSoiQslIzGUKm5AKJj8g5colwRyt6CQZXrS33A6HX/fe
         TWgmOZ/3QJbzICOqxH5WlCFHO08DLkuHTpmhed7CwkWer5faE9D7ePwweVi+7lWIpIGL
         SXF+SEeIbodXl9dMqISzpw7Uvm74dI1jZJjByZasx/HF59sIpwtC2yuzmKsI+lt5EA7q
         BvxkYZBsVKqjlM8ZCkAK9dS7GjowWKq0UrAYVCTfPaf/LzWlwGBI1UEjH7gAn+fNpNJp
         o1nQ==
X-Gm-Message-State: AOAM533J61wrUqnmPOQyt4p8DKU/yW5Ibnf/v25nR3f3O1g8Sz21fyHj
	f8BgopUciEyBMIS3mjS+NoY=
X-Google-Smtp-Source: ABdhPJwt0vAGEDj3gBn7GJguPN7RbIKUbXuJvobhfWqJmYZmFZUjV77I1dSu55qspq8DRDvTLRfUNQ==
X-Received: by 2002:a05:600c:19ca:: with SMTP id u10mr3023465wmq.178.1630759252067;
        Sat, 04 Sep 2021 05:40:52 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::8fe1])
        by smtp.gmail.com with ESMTPSA id j207sm2094071wmj.40.2021.09.04.05.40.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Sep 2021 05:40:51 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 1/6] staging: r8188eu: remove intf_chip_configure from hal_ops
Date: Sat,  4 Sep 2021 14:40:28 +0200
Message-Id: <20210904124033.14244-2-straube.linux@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210904124033.14244-1-straube.linux@gmail.com>
References: <20210904124033.14244-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove intf_chip_configure from hal_ops and remove its wrapper
rtw_hal_chip_configure(). Call rtl8188eu_interface_configure()
directly instead.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/hal/hal_intf.c     | 6 ------
 drivers/staging/r8188eu/hal/usb_halinit.c  | 3 +--
 drivers/staging/r8188eu/include/hal_intf.h | 6 +++---
 drivers/staging/r8188eu/os_dep/usb_intf.c  | 2 +-
 4 files changed, 5 insertions(+), 12 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/hal_intf.c b/drivers/staging/r8188eu/hal/hal_intf.c
index bcc77da06c08..f52c77279f3d 100644
--- a/drivers/staging/r8188eu/hal/hal_intf.c
+++ b/drivers/staging/r8188eu/hal/hal_intf.c
@@ -6,12 +6,6 @@
 #include "../include/drv_types.h"
 #include "../include/hal_intf.h"
 
-void rtw_hal_chip_configure(struct adapter *adapt)
-{
-	if (adapt->HalFunc.intf_chip_configure)
-		adapt->HalFunc.intf_chip_configure(adapt);
-}
-
 void rtw_hal_read_chip_info(struct adapter *adapt)
 {
 	if (adapt->HalFunc.read_adapter_info)
diff --git a/drivers/staging/r8188eu/hal/usb_halinit.c b/drivers/staging/r8188eu/hal/usb_halinit.c
index 147c51255878..df1887bf29eb 100644
--- a/drivers/staging/r8188eu/hal/usb_halinit.c
+++ b/drivers/staging/r8188eu/hal/usb_halinit.c
@@ -60,7 +60,7 @@ static bool HalUsbSetQueuePipeMapping8188EUsb(struct adapter *adapt, u8 NumInPip
 	return result;
 }
 
-static void rtl8188eu_interface_configure(struct adapter *adapt)
+void rtl8188eu_interface_configure(struct adapter *adapt)
 {
 	struct hal_data_8188e	*haldata	= GET_HAL_DATA(adapt);
 	struct dvobj_priv	*pdvobjpriv = adapter_to_dvobj(adapt);
@@ -2250,7 +2250,6 @@ void rtl8188eu_set_hal_ops(struct adapter *adapt)
 	halfunc->DeInitSwLeds = &rtl8188eu_DeInitSwLeds;
 
 	halfunc->init_default_value = &rtl8188eu_init_default_value;
-	halfunc->intf_chip_configure = &rtl8188eu_interface_configure;
 	halfunc->read_adapter_info = &ReadAdapterInfo8188EU;
 
 	halfunc->SetHwRegHandler = &SetHwReg8188EU;
diff --git a/drivers/staging/r8188eu/include/hal_intf.h b/drivers/staging/r8188eu/include/hal_intf.h
index 5f6ef4d6333a..6740a6570e6a 100644
--- a/drivers/staging/r8188eu/include/hal_intf.h
+++ b/drivers/staging/r8188eu/include/hal_intf.h
@@ -152,8 +152,6 @@ struct hal_ops {
 
 	void	(*init_default_value)(struct adapter *padapter);
 
-	void	(*intf_chip_configure)(struct adapter *padapter);
-
 	void	(*read_adapter_info)(struct adapter *padapter);
 
 	void	(*enable_interrupt)(struct adapter *padapter);
@@ -267,6 +265,9 @@ struct hal_ops {
 #define is_boot_from_eeprom(adapter) (adapter->eeprompriv.EepromOrEfuse)
 
 void rtl8188eu_set_hal_ops(struct adapter *padapter);
+
+void rtl8188eu_interface_configure(struct adapter *adapt);
+
 void rtw_hal_def_value_init(struct adapter *padapter);
 
 void	rtw_hal_free_data(struct adapter *padapter);
@@ -283,7 +284,6 @@ void rtw_hal_stop(struct adapter *padapter);
 void rtw_hal_set_hwreg(struct adapter *padapter, u8 variable, u8 *val);
 void rtw_hal_get_hwreg(struct adapter *padapter, u8 variable, u8 *val);
 
-void rtw_hal_chip_configure(struct adapter *padapter);
 void rtw_hal_read_chip_info(struct adapter *padapter);
 void rtw_hal_read_chip_version(struct adapter *padapter);
 
diff --git a/drivers/staging/r8188eu/os_dep/usb_intf.c b/drivers/staging/r8188eu/os_dep/usb_intf.c
index bb85ab77fd26..d4765205ae26 100644
--- a/drivers/staging/r8188eu/os_dep/usb_intf.c
+++ b/drivers/staging/r8188eu/os_dep/usb_intf.c
@@ -602,7 +602,7 @@ static struct adapter *rtw_usb_if1_init(struct dvobj_priv *dvobj,
 	rtw_hal_read_chip_version(padapter);
 
 	/* step usb endpoint mapping */
-	rtw_hal_chip_configure(padapter);
+	rtl8188eu_interface_configure(padapter);
 
 	/* step read efuse/eeprom data and get mac_addr */
 	rtw_hal_read_chip_info(padapter);
-- 
2.33.0

