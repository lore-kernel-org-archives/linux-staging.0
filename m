Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 045153FE2
	for <linux-staging@lists.linux.dev>; Fri, 10 Sep 2021 20:50:52 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id n5so4353687wro.12
        for <linux-staging@lists.linux.dev>; Fri, 10 Sep 2021 13:50:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DFP20JdLWO44Og/uNow71PnOPRiaV70lhBMuJXoTRec=;
        b=LoKTUaI4giA4ss0KYOFiQc32KJcI6yJd1HI2Iveo4EiqbkSgfk4PITSi6YFtdFhsUx
         gtazEO54B4rAMlud//IKHFAMS2jbnYG77SAK+tPOslXDiS0oQkhG/wsEvhGDMVvLBw+g
         NRxTi94fLwEBFL3jeE98NTXlLHfviiwmha25n77ckVejLK8gKb0xFQC8fkhc7ax4grou
         ZlyyYKYPgKTdRAVht/ogrfSwo5mK0VuogOkDi92S1H1/SWWWqrop01MiqHq9K2k52R6F
         w+1Dv3C+3HZgss+ejFdf8ulb8dRsLGuNJnXh4V6303yt7dfEA7w4ivS1+4vYuSXN3Snn
         rtOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DFP20JdLWO44Og/uNow71PnOPRiaV70lhBMuJXoTRec=;
        b=kXkuo2+30S1wSZUm3p40OK3Zw5YfvC+1yNXoyJri9Fd3t9YzFtZRj0rX+uFjB2JflR
         fntcLLDiuY18stWwcewBHSXKl00Uq9QdzYQhYqRNES0HSVTriwu32UrJ2LjZgfwOrM0o
         KGimF6JEEPL8cIAcoOTikfDhs31QWujMugEY96Vw8VXwbUcI8pkBjYZ9wcppBeftRNdd
         LzsJaxs+WwHRAZA+phKtD0qsgGHg1wP3Kd0AW/zuIQJzqMG7Il5kB4eu+8R52gtid8Kw
         Ls9u+GtlDXTylcBgmQPXgUHHujdmxuaaJjU0VkRvmUCKvJTFRSJH4/+li+QaCmNPTJQK
         /kzQ==
X-Gm-Message-State: AOAM532eZUb6plhTkVc9WOHgCUKCIMuxVRHZ47sZX3kCF/OODplIa0fg
	aaDFdppvW4dYHPNYZTJhpjE=
X-Google-Smtp-Source: ABdhPJyDH6/NnvBEQjD+DiWZ/4IqsxX6uYqAr1fTReaCT+WQD1b5UKIJtdXSkZ6BeVogDqr386cQOw==
X-Received: by 2002:adf:902b:: with SMTP id h40mr11621131wrh.342.1631307050571;
        Fri, 10 Sep 2021 13:50:50 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::8fe1])
        by smtp.gmail.com with ESMTPSA id g11sm5592427wrx.30.2021.09.10.13.50.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Sep 2021 13:50:50 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 7/7] staging: r8188eu: remove rtl8188e_set_hal_ops()
Date: Fri, 10 Sep 2021 22:50:33 +0200
Message-Id: <20210910205033.3778-8-straube.linux@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210910205033.3778-1-straube.linux@gmail.com>
References: <20210910205033.3778-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

After the removal of some pointers from struct hal_ops the function
rtl8188e_set_hal_ops() is empty now. Remove it.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/hal/rtl8188e_hal_init.c | 3 ---
 drivers/staging/r8188eu/hal/usb_halinit.c       | 2 --
 drivers/staging/r8188eu/include/rtl8188e_hal.h  | 2 --
 3 files changed, 7 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c b/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
index 0d6c3adff27e..027dcfb95547 100644
--- a/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
+++ b/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
@@ -1748,9 +1748,6 @@ void hal_notch_filter_8188e(struct adapter *adapter, bool enable)
 		rtw_write8(adapter, rOFDM0_RxDSP + 1, rtw_read8(adapter, rOFDM0_RxDSP + 1) & ~BIT(1));
 	}
 }
-void rtl8188e_set_hal_ops(struct hal_ops *pHalFunc)
-{
-}
 
 u8 GetEEPROMSize8188E(struct adapter *padapter)
 {
diff --git a/drivers/staging/r8188eu/hal/usb_halinit.c b/drivers/staging/r8188eu/hal/usb_halinit.c
index aeaf53c1cfbf..0c317a8723ef 100644
--- a/drivers/staging/r8188eu/hal/usb_halinit.c
+++ b/drivers/staging/r8188eu/hal/usb_halinit.c
@@ -2227,6 +2227,4 @@ void rtl8188eu_set_hal_ops(struct adapter *adapt)
 	halfunc->GetHwRegHandler = &GetHwReg8188EU;
 	halfunc->GetHalDefVarHandler = &GetHalDefVar8188EUsb;
 	halfunc->SetHalDefVarHandler = &SetHalDefVar8188EUsb;
-
-	rtl8188e_set_hal_ops(halfunc);
 }
diff --git a/drivers/staging/r8188eu/include/rtl8188e_hal.h b/drivers/staging/r8188eu/include/rtl8188e_hal.h
index a9ca29b5b9c1..537a8d17642c 100644
--- a/drivers/staging/r8188eu/include/rtl8188e_hal.h
+++ b/drivers/staging/r8188eu/include/rtl8188e_hal.h
@@ -432,8 +432,6 @@ void Hal_ReadPowerSavingMode88E(struct adapter *pAdapter, u8 *hwinfo,
 
 bool HalDetectPwrDownMode88E(struct adapter *Adapter);
 
-void rtl8188e_set_hal_ops(struct hal_ops *pHalFunc);
-
 void rtl8188e_read_chip_version(struct adapter *padapter);
 
 void rtw_IOL_cmd_tx_pkt_buf_dump(struct adapter  *Adapter, int len);
-- 
2.33.0

