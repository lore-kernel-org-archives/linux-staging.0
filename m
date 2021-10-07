Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 175852C8F
	for <linux-staging@lists.linux.dev>; Thu,  7 Oct 2021 10:39:53 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id v17so17602818wrv.9
        for <linux-staging@lists.linux.dev>; Thu, 07 Oct 2021 03:39:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KlVAOh2uFL8QQZXsnOc1O8ieTnDEHXdBpvEWZdWi12U=;
        b=Vb63thOIcGNVcqbnKiqS0JDsoArDC5aoN07ksQVw+YgkfVxwCkCGX4YflajLZfG5By
         9YWTkdxgYmekoWSkYQ5tRBWGJIKN4xGAe2AxGBRbhVXvChyyxFbQfXCkh1jFI3Q/c5oX
         LR0lWU7cXDGKcapFHQ35lbtpOWMqgiomHOopL9Q4Hg4NJB/2GQDzjd881RtcU2ZRco+r
         hQbCD60fil/G8TSS7J1LCPCW0Wse5/XcJXKo9IX6K4vocRrocNULMkhazwMWANJuMx/j
         EYrzJyfAZ/NAwbUFszFeSHTd4JHyXs6y+NLUtz6clH4pwE0F4byIPl/KTb9T6/7pwcLV
         67mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KlVAOh2uFL8QQZXsnOc1O8ieTnDEHXdBpvEWZdWi12U=;
        b=maYWrL18XYOE3DJKZGZQBOpY9lQh15SXDtkFk8HGB5P8CJRRUXpre5Mds06hjT+IFq
         BNdtJdiYt+YD9Tm+3QtxzBLCAsSEDR7zukW+PMH3k333/sMc5QnJHmSmcSXRpq/QE6/L
         vEIp4o54kuCexY9m8yDPEbgNNjuuPOYvXv5gZa4xkL9sA64A9ibSho0puCVC0lXjt3+I
         xFycrWvSkNw8VfzUl2yenyB4c7rjuiyFMT2+xcI2/A4OCXdIo0cHNpmYgxvxINT7aQlq
         3H7YLYrdvMJSn1Z8pT0ZRcVpOhLsSBHA+nT1E0D1mkWbgMX1llnc4vNm8xL7q+FtuWuY
         /TUA==
X-Gm-Message-State: AOAM530L8mBsUyWsL9bXFTRNxmwGT7NKyCNrhvV4uubD1nG5ZXUtfJAL
	RHa3NFXOpPMigyK1wNB/6s4=
X-Google-Smtp-Source: ABdhPJwomMYh83KHIFkpMMiBsN/ohzY4Oo0QW8Tfxu1sNTyVGCL++M5CCR1epww+OUJxfgMfgctJeg==
X-Received: by 2002:adf:fb89:: with SMTP id a9mr4332285wrr.164.1633603191561;
        Thu, 07 Oct 2021 03:39:51 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::5d0b])
        by smtp.gmail.com with ESMTPSA id n14sm10224853wms.0.2021.10.07.03.39.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Oct 2021 03:39:51 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 5/5] staging: r8188eu: rename rtl8188eu_set_hal_ops()
Date: Thu,  7 Oct 2021 12:39:43 +0200
Message-Id: <20211007103943.8433-6-straube.linux@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211007103943.8433-1-straube.linux@gmail.com>
References: <20211007103943.8433-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

After the removal of struct hal_ops function rtl8188eu_set_hal_ops()
only allocates memory for adapt->HalData. Rename the function to
rtl8188eu_alloc_haldata() to reflect what it actually does.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/hal/usb_halinit.c  | 2 +-
 drivers/staging/r8188eu/include/hal_intf.h | 2 +-
 drivers/staging/r8188eu/os_dep/usb_intf.c  | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/usb_halinit.c b/drivers/staging/r8188eu/hal/usb_halinit.c
index b4fbbfd0112a..018e7a45c92c 100644
--- a/drivers/staging/r8188eu/hal/usb_halinit.c
+++ b/drivers/staging/r8188eu/hal/usb_halinit.c
@@ -2131,7 +2131,7 @@ void rtl8188eu_init_default_value(struct adapter *adapt)
 		haldata->odmpriv.RFCalibrateInfo.ThermalValue_HP[i] = 0;
 }
 
-void rtl8188eu_set_hal_ops(struct adapter *adapt)
+void rtl8188eu_alloc_haldata(struct adapter *adapt)
 {
 	adapt->HalData = kzalloc(sizeof(struct hal_data_8188e), GFP_KERNEL);
 	if (!adapt->HalData)
diff --git a/drivers/staging/r8188eu/include/hal_intf.h b/drivers/staging/r8188eu/include/hal_intf.h
index c962cd353f43..abbc459d4bc2 100644
--- a/drivers/staging/r8188eu/include/hal_intf.h
+++ b/drivers/staging/r8188eu/include/hal_intf.h
@@ -131,7 +131,7 @@ typedef s32 (*c2h_id_filter)(u8 id);
 
 #define is_boot_from_eeprom(adapter) (adapter->eeprompriv.EepromOrEfuse)
 
-void rtl8188eu_set_hal_ops(struct adapter *padapter);
+void rtl8188eu_alloc_haldata(struct adapter *adapt);
 
 void rtl8188eu_interface_configure(struct adapter *adapt);
 void ReadAdapterInfo8188EU(struct adapter *Adapter);
diff --git a/drivers/staging/r8188eu/os_dep/usb_intf.c b/drivers/staging/r8188eu/os_dep/usb_intf.c
index b5e0c6561108..80364a74a500 100644
--- a/drivers/staging/r8188eu/os_dep/usb_intf.c
+++ b/drivers/staging/r8188eu/os_dep/usb_intf.c
@@ -398,8 +398,8 @@ static struct adapter *rtw_usb_if1_init(struct dvobj_priv *dvobj,
 	SET_NETDEV_DEV(pnetdev, dvobj_to_dev(dvobj));
 	padapter = rtw_netdev_priv(pnetdev);
 
-	/* step 2. hook HalFunc, allocate HalData */
-	rtl8188eu_set_hal_ops(padapter);
+	/* step 2. allocate HalData */
+	rtl8188eu_alloc_haldata(padapter);
 
 	padapter->intf_start = &usb_intf_start;
 	padapter->intf_stop = &usb_intf_stop;
-- 
2.33.0

