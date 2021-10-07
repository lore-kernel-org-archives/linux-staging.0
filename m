Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCC5B2C83
	for <linux-staging@lists.linux.dev>; Thu,  7 Oct 2021 10:39:51 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id r10so17632522wra.12
        for <linux-staging@lists.linux.dev>; Thu, 07 Oct 2021 03:39:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vhS2oauwcTbIVc13GVi1Gpn8ukjq7xSbYjS868HZNy4=;
        b=Ye2EmonxmTpR3IDZ3lbXdkqeJRNg/ZyGv45+Qp8aIdvevzdmEK4WtDeWS7wyqVt8Xz
         58Xdf8dK/ihTmlZJ1SFIemMGIrmXcdCVeGgd0WBF7yCZbHOY9UP6GS9QGqV9X7105pTV
         RtzoUJGOJKJ8Z+6u/HE2NzDjgH6Th21BmYu0/EH7YXkc9ydL6o2iTj2qjK/aC1Xdl5Fn
         P40cCGFV3a4PqAUtiS7vbhKsMbHi12uEmahKxrcWbl8kWkP7KWm3k+GWUBlXKMi+NTr8
         LYupil6B9RQ5t3o62phVxuZEnDPqOQRfaQDg/X1xEXdWErJsZKdfQHwgyoDs3YRuNs+u
         QtAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vhS2oauwcTbIVc13GVi1Gpn8ukjq7xSbYjS868HZNy4=;
        b=NVKRzJ063+5k9UkTfXFGwZTUXdCqtIW6i/nQvfQUpR1ReYYxDGlvwFlIjKeByuYsAk
         t9hLZCV4hYx8hYwuff34P2b1IYF5o2AUWDJ5AajMh+sJFEFlXg8LjPbCeqdR3Nfj7uRs
         FKHr+/AKT0nHzB84hFXPNBtLkl+Gim4t0Db4P1G8Rn5hongyMolSvq3UXGOTM2VNu57Z
         C999BM9Mwt6eXSqo1T5694tLO6xRHhO7IW3NPzGk9Ylp7/m0EODPpm0cHxQ3psQh08yP
         WmPb67pSSKCRWylIBSqbDHvk0y/l8oKWu1XLgfTRANNtjhS9qJHxdOSSdCWbYtHU2k3k
         rZlw==
X-Gm-Message-State: AOAM533hfD713Ekkiw/hqqKos5mxiQtvP8m4t9fLhMlPqKOWXWMga/6Q
	MG++vNjB04ppsCXY+WVS/8g=
X-Google-Smtp-Source: ABdhPJyKw5nMpOK3AC9ndagVkLmlkIk/4LcqgK7QoiCUd93rfzEDLuprxkkJiK43uGfKS19hT4WeWA==
X-Received: by 2002:a05:600c:354f:: with SMTP id i15mr15801640wmq.146.1633603190215;
        Thu, 07 Oct 2021 03:39:50 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::5d0b])
        by smtp.gmail.com with ESMTPSA id n14sm10224853wms.0.2021.10.07.03.39.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Oct 2021 03:39:49 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 3/5] staging: r8188eu: remove hal_init from hal_ops
Date: Thu,  7 Oct 2021 12:39:41 +0200
Message-Id: <20211007103943.8433-4-straube.linux@gmail.com>
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

Remove hal_init from struct hal_ops and call rtl8188eu_hal_init()
directly.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/hal/hal_intf.c     | 2 +-
 drivers/staging/r8188eu/hal/usb_halinit.c  | 3 +--
 drivers/staging/r8188eu/include/hal_intf.h | 3 ++-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/hal_intf.c b/drivers/staging/r8188eu/hal/hal_intf.c
index 6f39fc04df9b..30ddf174e4df 100644
--- a/drivers/staging/r8188eu/hal/hal_intf.c
+++ b/drivers/staging/r8188eu/hal/hal_intf.c
@@ -12,7 +12,7 @@ uint	 rtw_hal_init(struct adapter *adapt)
 
 	adapt->hw_init_completed = false;
 
-	status = adapt->HalFunc.hal_init(adapt);
+	status = rtl8188eu_hal_init(adapt);
 
 	if (status == _SUCCESS) {
 		adapt->hw_init_completed = true;
diff --git a/drivers/staging/r8188eu/hal/usb_halinit.c b/drivers/staging/r8188eu/hal/usb_halinit.c
index f6b90de1d063..07a29a7cf61d 100644
--- a/drivers/staging/r8188eu/hal/usb_halinit.c
+++ b/drivers/staging/r8188eu/hal/usb_halinit.c
@@ -657,7 +657,7 @@ enum rt_rf_power_state RfOnOffDetect(struct adapter *adapt)
 	return rfpowerstate;
 }	/*  HalDetectPwrDownMode */
 
-static u32 rtl8188eu_hal_init(struct adapter *Adapter)
+u32 rtl8188eu_hal_init(struct adapter *Adapter)
 {
 	u8 value8 = 0;
 	u16  value16;
@@ -2140,6 +2140,5 @@ void rtl8188eu_set_hal_ops(struct adapter *adapt)
 		DBG_88E("cant not alloc memory for HAL DATA\n");
 	adapt->hal_data_sz = sizeof(struct hal_data_8188e);
 
-	halfunc->hal_init = &rtl8188eu_hal_init;
 	halfunc->hal_deinit = &rtl8188eu_hal_deinit;
 }
diff --git a/drivers/staging/r8188eu/include/hal_intf.h b/drivers/staging/r8188eu/include/hal_intf.h
index 7d892bf496cc..1810197e81f6 100644
--- a/drivers/staging/r8188eu/include/hal_intf.h
+++ b/drivers/staging/r8188eu/include/hal_intf.h
@@ -122,7 +122,6 @@ enum hal_odm_variable {
 typedef s32 (*c2h_id_filter)(u8 id);
 
 struct hal_ops {
-	u32	(*hal_init)(struct adapter *padapter);
 	u32	(*hal_deinit)(struct adapter *padapter);
 };
 
@@ -175,6 +174,8 @@ uint rtw_hal_init(struct adapter *padapter);
 uint rtw_hal_deinit(struct adapter *padapter);
 void rtw_hal_stop(struct adapter *padapter);
 
+u32 rtl8188eu_hal_init(struct adapter *Adapter);
+
 void rtw_hal_update_ra_mask(struct adapter *padapter, u32 mac_id, u8 level);
 void	rtw_hal_clone_data(struct adapter *dst_adapt,
 			   struct adapter *src_adapt);
-- 
2.33.0

