Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A22172
	for <linux-staging@lists.linux.dev>; Mon,  6 Sep 2021 19:03:02 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id g8so9392012edt.7
        for <linux-staging@lists.linux.dev>; Mon, 06 Sep 2021 12:03:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0JLjw1LG1EqFWNQ8nBF3vVHD63NcJfn88butHEvinAA=;
        b=T1griKZtt9nUYthUy8YwEod8iMiugibDhE31UGT8TQYAqSOW8VZCJVdvyt24xuUeH5
         fV5oI7G/L8c+ltvw3Oyc0SGuj3DFH1daLv3Vgl+kYO9jyhq9ty56YfI54iyNzEX3+fqM
         me+Z9T4nFHF+Q7ljzSxQcn9nFNhQ73SqMaVD7OHknTFGvAv9/jie26L/cjAJzgP9N7hc
         +bFlqh18hu8IGRTuj64lhnO+PYnqSHPN1IlhK0JWomtmoy5n7hZQnnH985G1UvD6G9nX
         ZrbXDXJ6MuN7uQGRno20gE9JORFdggnKVI3Ev+T8ChyTQcTd100sXd5p/zuEn/Ei2wGT
         THIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0JLjw1LG1EqFWNQ8nBF3vVHD63NcJfn88butHEvinAA=;
        b=e8yjqmDBs8XY1hgSKkNm5RksPt1Ny9zZ0vzW0xVCXwITkdWO9jnk+CfNZG3icCWjRO
         dtr/LbPLo58hW6aDBzooVoOY6d4V/y1sxoAwMOJyQO7Wb4ALw/1FWUKbK2tgVgW9WT+w
         UXATUOIBvTs/Hps2wR2gFXenVYZLr+8T8YFwqiop6z/PtZRXw09ORkj3eHCrBpzDan1j
         v35CzCDZcNj+iZbwhiRJLjjryE4mH2aiFSzA8CVuj+8WQjDnN+D9aOvV9/+3eQOtG2Sd
         EpQ+9U0OQks0/yMMyUrgey76U1UCbsz63btz7Ita7rLVB9hIf5voIqAueJa8gGUpI1Ef
         opfA==
X-Gm-Message-State: AOAM530S0FagdKhh8B6I4Pe/PZ8ZV86UpW4r8gfGjBiLTYJ3oRLz6uRf
	vowtyAs1HekqrjPTlC0D2MYl4wQtOZDSkA==
X-Google-Smtp-Source: ABdhPJzbGrH5V3a9AIvgqkeCHmbUpJvTRyr94GzfBWzK1IuxAv329DVgVJHjHPhLxRqQ+yNn76U1fA==
X-Received: by 2002:a05:6402:3090:: with SMTP id de16mr14920253edb.7.1630954981052;
        Mon, 06 Sep 2021 12:03:01 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::8fe1])
        by smtp.gmail.com with ESMTPSA id k15sm4372018ejb.92.2021.09.06.12.03.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Sep 2021 12:03:00 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH v3 21/40] staging: r8188eu: remove EfusePowerSwitch from hal_ops
Date: Mon,  6 Sep 2021 21:02:04 +0200
Message-Id: <20210906190223.11396-22-straube.linux@gmail.com>
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

Remove EfusePowerSwitch from hal_ops and call
rtl8188e_EfusePowerSwitch() directly instead.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_efuse.c        | 2 +-
 drivers/staging/r8188eu/hal/rtl8188e_hal_init.c | 7 +------
 drivers/staging/r8188eu/include/hal_intf.h      | 4 ++--
 3 files changed, 4 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_efuse.c b/drivers/staging/r8188eu/core/rtw_efuse.c
index e1a9c031435b..8388ec60d21d 100644
--- a/drivers/staging/r8188eu/core/rtw_efuse.c
+++ b/drivers/staging/r8188eu/core/rtw_efuse.c
@@ -82,7 +82,7 @@ Efuse_PowerSwitch(
 		u8 write,
 		u8 PwrState)
 {
-	pAdapter->HalFunc.EfusePowerSwitch(pAdapter, write, PwrState);
+	rtl8188e_EfusePowerSwitch(pAdapter, write, PwrState);
 }
 
 /*-----------------------------------------------------------------------------
diff --git a/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c b/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
index 04c382e698f9..c7edb9ba4085 100644
--- a/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
+++ b/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
@@ -757,11 +757,7 @@ hal_EfusePowerSwitch_RTL8188E(
 	}
 }
 
-static void
-rtl8188e_EfusePowerSwitch(
-		struct adapter *pAdapter,
-		u8 bWrite,
-		u8 PwrState)
+void rtl8188e_EfusePowerSwitch(struct adapter *pAdapter, u8 bWrite, u8 PwrState)
 {
 	hal_EfusePowerSwitch_RTL8188E(pAdapter, bWrite, PwrState);
 }
@@ -1795,7 +1791,6 @@ void rtl8188e_set_hal_ops(struct hal_ops *pHalFunc)
 	pHalFunc->write_rfreg = &rtl8188e_PHY_SetRFReg;
 
 	/*  Efuse related function */
-	pHalFunc->EfusePowerSwitch = &rtl8188e_EfusePowerSwitch;
 	pHalFunc->ReadEFuse = &rtl8188e_ReadEFuse;
 	pHalFunc->EFUSEGetEfuseDefinition = &rtl8188e_EFUSE_GetEfuseDefinition;
 	pHalFunc->EfuseGetCurrentSize = &rtl8188e_EfuseGetCurrentSize;
diff --git a/drivers/staging/r8188eu/include/hal_intf.h b/drivers/staging/r8188eu/include/hal_intf.h
index f85385cc9288..86456bac3a5a 100644
--- a/drivers/staging/r8188eu/include/hal_intf.h
+++ b/drivers/staging/r8188eu/include/hal_intf.h
@@ -177,8 +177,6 @@ struct hal_ops {
 			       enum rf_radio_path eRFPath, u32 RegAddr,
 			       u32 BitMask, u32 Data);
 
-	void (*EfusePowerSwitch)(struct adapter *padapter, u8 bWrite,
-				 u8 PwrState);
 	void (*ReadEFuse)(struct adapter *padapter, u8 efuseType, u16 _offset,
 			  u16 _size_byte, u8 *pbuf, bool bPseudoTest);
 	void (*EFUSEGetEfuseDefinition)(struct adapter *padapter, u8 efuseType,
@@ -221,6 +219,8 @@ void rtl8188e_SetHalODMVar(struct adapter *Adapter,
 			   enum hal_odm_variable eVariable, void *pValue1, bool bSet);
 u32 rtl8188eu_InitPowerOn(struct adapter *adapt);
 
+void rtl8188e_EfusePowerSwitch(struct adapter *pAdapter, u8 bWrite, u8 PwrState);
+
 void	rtw_hal_free_data(struct adapter *padapter);
 uint rtw_hal_init(struct adapter *padapter);
 uint rtw_hal_deinit(struct adapter *padapter);
-- 
2.33.0

