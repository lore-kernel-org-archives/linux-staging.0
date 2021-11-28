Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 138622C81
	for <linux-staging@lists.linux.dev>; Sun, 28 Nov 2021 17:09:56 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id i12so12694444wmq.4
        for <linux-staging@lists.linux.dev>; Sun, 28 Nov 2021 09:09:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3Ytho17AJ4uMgaRdXauPbFbIjw+Tbhbf5MABHEUnEio=;
        b=S2n9rH5XqMeOZSojmjg1+nvP40ECA1wvMIB0cXhsDFTkNWXDNHM0HfEJ/x1/wynatv
         CbNHwJMbITWfrfEB0+heUp6b8unN/7HS6Jmz+7lJLvZ0nqTzFFCPLhEE7brWK+/4lCnf
         eSEO15CGmld83lZIhEkxiUbqgjIlvmW8MBFuBSDh6+x/o7ecc/cAJoL0AKWi0ry0r7VK
         PCCEn44viBYhZaOKoVvaPaNCErWhcKfoAwlDdqa+F8cDqSyHQOvXWMTuu08HL2tRE7nn
         CadPhDpauL5/6/bjL7RP2LHcxQthPQp64T+BS3ycgIqHQ/SA7SB9IJNCRE/XIRoxmDD/
         Adbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3Ytho17AJ4uMgaRdXauPbFbIjw+Tbhbf5MABHEUnEio=;
        b=Kx0CDqcv8wqhY8tf/lCjOGDtxs8QLVwPsJAsXe2lxJ6/+RzDOUKx7X5Izt0i6JzJqJ
         6l2o3PwJL4Dwj5hbW0S/9K7BTXjewn2fuvgJieJttJ4BdPfBdAU1Oa2qaek/IUWTqxwW
         xhWRIAUXj+Ij2Wi9Ht0/RH3B3yoIA0TQ86GOiFUQtAwoCABuq2uBrS+C/sBSl/omm3/r
         FGW5apDt8PnYUchatDVMR8Lgbo55/mRnn84dNrHpz/bgJJz8c01yDtCq7aVvyVx0sa2o
         hKtAhhf+7hfA4vrTE5OyQb3EGdU448goArk65YP+L0rYZgn10ratcgCLxIeTnnaeuuzc
         v3TQ==
X-Gm-Message-State: AOAM530YPr8igw9aC3bxms7RQC1kLrEteplu+0zUb4C6FrnfEdE39TjW
	3FmOLUpS/et6iAGtEwMkcbU=
X-Google-Smtp-Source: ABdhPJzus2gUg/hBhfM+ogKF/EBfuXDSOjaJUGaYCnxO6hZHgqildW1ALIsObSUgUEDFN5rcURPmJg==
X-Received: by 2002:a7b:c1cb:: with SMTP id a11mr31181690wmj.30.1638119394500;
        Sun, 28 Nov 2021 09:09:54 -0800 (PST)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::ac86])
        by smtp.gmail.com with ESMTPSA id n15sm18243845wmq.38.2021.11.28.09.09.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Nov 2021 09:09:54 -0800 (PST)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH v2 09/10] staging: r8188eu: remove rf_type from struct hal_data_8188e
Date: Sun, 28 Nov 2021 18:09:23 +0100
Message-Id: <20211128170924.5874-10-straube.linux@gmail.com>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20211128170924.5874-1-straube.linux@gmail.com>
References: <20211128170924.5874-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The field rf_type of struct hal_data_8188e is set to RF_1T1R and
never changed. Also it is used only in a call to netdev_dbg() which
is not very useful since RTL8188EU chips are always 1T1R. Remove
the netdev_dbg() and remove rf_type from the hal_data_8188e
structure.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/hal/rtl8188e_hal_init.c | 4 ----
 drivers/staging/r8188eu/include/rtl8188e_hal.h  | 3 ---
 2 files changed, 7 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c b/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
index 001e4a198630..eeb5f46687e2 100644
--- a/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
+++ b/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
@@ -854,10 +854,6 @@ void rtl8188e_read_chip_version(struct adapter *padapter)
 	dump_chip_info(ChipVersion);
 
 	pHalData->VersionID = ChipVersion;
-
-	pHalData->rf_type = RF_1T1R;
-
-	netdev_dbg(padapter->pnetdev, "RF_Type is %x!!\n", pHalData->rf_type);
 }
 
 void rtl8188e_SetHalODMVar(struct adapter *Adapter, enum hal_odm_variable eVariable, void *pValue1, bool bSet)
diff --git a/drivers/staging/r8188eu/include/rtl8188e_hal.h b/drivers/staging/r8188eu/include/rtl8188e_hal.h
index 5848f1d4191a..be8af7497f4b 100644
--- a/drivers/staging/r8188eu/include/rtl8188e_hal.h
+++ b/drivers/staging/r8188eu/include/rtl8188e_hal.h
@@ -168,9 +168,6 @@ struct hal_data_8188e {
 
 	u16	BasicRateSet;
 
-	/* rf_ctrl */
-	u8	rf_type;
-
 	/*  EEPROM setting. */
 	u16	EEPROMSVID;
 	u16	EEPROMSDID;
-- 
2.34.0

