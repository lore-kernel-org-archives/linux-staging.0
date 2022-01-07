Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 345D52CA3
	for <linux-staging@lists.linux.dev>; Fri,  7 Jan 2022 21:50:52 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id v123so4834224wme.2
        for <linux-staging@lists.linux.dev>; Fri, 07 Jan 2022 13:50:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=glZSs3/XQjh2G5N2vOEcA3loKxbe1iN/kPhaUdhhepE=;
        b=FpkEuMCiVrVw/qTmkq7S9bVqRFluFqbxYVpA1Fv+6ULpGh4G9ltPAXwZ2XVO1iVQBs
         7f9YUcYKhao5+mGKvJcQLS4uz9kuHPMqfne/IruQRBqEuIW/XbfQKrqYk+QESrqGK0Nb
         ozO7+nLJ5C9zthvIIvC+LoyN7CB6mGbzsbl2DrcNJWyUhBQJcFgTsbhmxgcY6hStxEBn
         DzOw0pwSJMhisyiHFtV4gdRFqkay1HD/m93ws+esjyvq8IcfqnpiHj9tHU1acmoYF3VC
         TkPHU83L8dFI9g3kyQHd8pZOPf8aqML12wnuDS5GRb6TUOybzdtsZYfZLnZ9JOXtbKEJ
         Cypw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=glZSs3/XQjh2G5N2vOEcA3loKxbe1iN/kPhaUdhhepE=;
        b=AfyRxhCAv2HpW12geBD2zmtMPFGhpStpO4l9pPI+FnjMyXp8vfaggndEOqfoFwW+ga
         UtrU3r1PCY9p0bhv+FffzuZKcs+uT29jZoi8MpnCU6vZYr8rPIK/6TjNBfr4VfImVDNS
         METxGBplK2PER7ibj6y5UdXlUAUOVMsFu06cwIqXYiT2XYbeeeZqs2IPqpRN6fdCsoTL
         UcOX8CkEDClyz5fksmOkGh0m0qHwsvJhnHsahmpK+Yzs8Q3q9sST1Z8GFHyBLI1RTwTd
         ZoIee9QWQ7JQTzpzK2AOuZTgdmR61hGzoJJ8Nex8uXK/MoKnBfD+hLAV+Fuz5MB0Px19
         z3EQ==
X-Gm-Message-State: AOAM530qMV1dxkmsrpG1ddti2o8xBbmQrtPX1l7I++phGSS0GsQXBUOp
	2V8PvsBuMoC+D6y6rz2rgNvX64ixww0=
X-Google-Smtp-Source: ABdhPJwbmU13t91Q13fFOFQMLhIVJBHeIBsNTuRJcjq/K+2diA588Q73rPnr2G7JNlF5+ROUjT4TaQ==
X-Received: by 2002:a05:600c:34c4:: with SMTP id d4mr12713689wmq.53.1641592250663;
        Fri, 07 Jan 2022 13:50:50 -0800 (PST)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::51e2])
        by smtp.gmail.com with ESMTPSA id k14sm1729161wrn.59.2022.01.07.13.50.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jan 2022 13:50:50 -0800 (PST)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 6/6] staging: r8188eu: remove HW_VAR_APFM_ON_MAC
Date: Fri,  7 Jan 2022 22:50:33 +0100
Message-Id: <20220107215033.12257-7-straube.linux@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220107215033.12257-1-straube.linux@gmail.com>
References: <20220107215033.12257-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

SetHwReg8188EU() and GetHwReg8188EU() are never called with
HW_VAR_APFM_ON_MAC. Remove that case from both functions.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/hal/usb_halinit.c  | 7 -------
 drivers/staging/r8188eu/include/hal_intf.h | 2 --
 2 files changed, 9 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/usb_halinit.c b/drivers/staging/r8188eu/hal/usb_halinit.c
index 10e40e654775..91610e2adae2 100644
--- a/drivers/staging/r8188eu/hal/usb_halinit.c
+++ b/drivers/staging/r8188eu/hal/usb_halinit.c
@@ -1556,10 +1556,6 @@ void SetHwReg8188EU(struct adapter *Adapter, u8 variable, u8 *val)
 			}
 		}
 		break;
-	case HW_VAR_APFM_ON_MAC:
-		haldata->bMacPwrCtrlOn = *val;
-		DBG_88E("%s: bMacPwrCtrlOn=%d\n", __func__, haldata->bMacPwrCtrlOn);
-		break;
 	case HW_VAR_TX_RPT_MAX_MACID:
 		{
 			u8 maxMacid = *val;
@@ -1611,9 +1607,6 @@ void GetHwReg8188EU(struct adapter *Adapter, u8 variable, u8 *val)
 			}
 		}
 		break;
-	case HW_VAR_APFM_ON_MAC:
-		*val = haldata->bMacPwrCtrlOn;
-		break;
 	case HW_VAR_CHK_HI_QUEUE_EMPTY:
 		*val = ((rtw_read32(Adapter, REG_HGQ_INFORMATION) & 0x0000ff00) == 0) ? true : false;
 		break;
diff --git a/drivers/staging/r8188eu/include/hal_intf.h b/drivers/staging/r8188eu/include/hal_intf.h
index a86cb376a125..120b32994e1f 100644
--- a/drivers/staging/r8188eu/include/hal_intf.h
+++ b/drivers/staging/r8188eu/include/hal_intf.h
@@ -62,8 +62,6 @@ enum hw_variables {
 	HW_VAR_EFUSE_BT_USAGE,
 	HW_VAR_EFUSE_BT_BYTES,
 	HW_VAR_FIFO_CLEARN_UP,
-	HW_VAR_APFM_ON_MAC, /* Auto FSM to Turn On, include clock, isolation,
-			     * power control for MAC only */
 	/*  The valid upper nav range for the HW updating, if the true value is
 	 *  larger than the upper range, the HW won't update it. */
 	/*  Unit in microsecond. 0 means disable this function. */
-- 
2.34.1

