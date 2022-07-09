Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BD1EEC0
	for <linux-staging@lists.linux.dev>; Sat,  9 Jul 2022 09:45:11 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id x91so1104365ede.1
        for <linux-staging@lists.linux.dev>; Sat, 09 Jul 2022 02:45:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nbBU8UprlApT8SHp7GiSQfbEyFFyRSEAF6EEqDhE6/s=;
        b=V6tncGnOADVLNrE7fjnOCUfh6ztrvwBvEEZLMU7ipcT6SpTirZpnZw7yQrTQLrLWVA
         Yj/lnGmkcPpyYCMgvd8gQIYr9QNqFrtRq9M9VNP+Xu63hxxtsIYaKg1HdHUmD5ugrDG9
         xTrMgWeUaL4EsAahLuxuXvAiQDGf5VPmfgLW2CyN1KirAhMt0DGXXDDdBOcAhWY8E5BJ
         /GXUHUZCF39FmXoDOUFZo5+QDYPvuYIl6+kITZda5pFqrRIrcSeSdfz+J9GqcQ7z9nPK
         T7Qtv/bOQ9rksSqUElmhldq5NcQ8R3MLpHrMjsl3UBMvoM+TaQDZ5XKgj1kiqHfKs3sI
         gxMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nbBU8UprlApT8SHp7GiSQfbEyFFyRSEAF6EEqDhE6/s=;
        b=ffkjDMLa4OVETp54oO/ANUHPBR0y2r7iwvBCOCO0DEcp1UcbF0I1lDbbqJzvit2OHJ
         2mK8+UyI1fPasaO0ZBjuoTgh66N3fp3eaPTTogfcJZDQB1As2I62mM5xfPP7fcu2Vf+C
         YDgBB8G6qm/S9z4V70dHwjRmc4zOnQ5MlkDewszh8mdaoMKiamvYfjvLq7NTX4+6lRri
         fiqk85GGiUjEkhGezkHOSNuAJ3nTYd2qC++W+LS5Ez0hSYssGjcNPXmdJUZnecjvyH4z
         2oh8SdVIhZRK2rGxYiqmaaaRnE0hQfC7ZnvtRWI8uROOAGCY6lC8YPan7HupJJdeFXOy
         DTog==
X-Gm-Message-State: AJIora/UGd6DbahEjCGcbc43wt1GrjA5NSkcdxtJw2AhrVIJdrGn9f73
	Nc3mNo8GrDPulwFw97nmOApIIrpfH0Q=
X-Google-Smtp-Source: AGRyM1uXi7EtOQUYimG8GwZOl6d3x0dFALtNJvmk5jrwS+VVfp4c4asw1VQ1rh8uRPjDMXtY9DXaEQ==
X-Received: by 2002:a05:6402:4306:b0:43a:b794:9f9f with SMTP id m6-20020a056402430600b0043ab7949f9fmr4993122edc.205.1657359909923;
        Sat, 09 Jul 2022 02:45:09 -0700 (PDT)
Received: from localhost.localdomain (ip5f5abb6f.dynamic.kabel-deutschland.de. [95.90.187.111])
        by smtp.gmail.com with ESMTPSA id hy10-20020a1709068a6a00b00704757b1debsm441521ejc.9.2022.07.09.02.45.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Jul 2022 02:45:09 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 3/5] staging: r8188eu: remove HW_VAR_DM_FLAG from SetHwReg8188EU()
Date: Sat,  9 Jul 2022 11:44:56 +0200
Message-Id: <20220709094458.9578-4-straube.linux@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220709094458.9578-1-straube.linux@gmail.com>
References: <20220709094458.9578-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the HW_VAR_DM_FLAG case from SetHwReg8188EU() and move its
functionality to a static function. This is part of the ongoing
effort to get rid of SetHwReg8188EU().

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/hal/usb_halinit.c    |  3 ---
 drivers/staging/r8188eu/include/hal_intf.h   |  1 -
 drivers/staging/r8188eu/os_dep/ioctl_linux.c | 10 +++++++++-
 3 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/usb_halinit.c b/drivers/staging/r8188eu/hal/usb_halinit.c
index 0aae713d2c1c..ece57565b082 100644
--- a/drivers/staging/r8188eu/hal/usb_halinit.c
+++ b/drivers/staging/r8188eu/hal/usb_halinit.c
@@ -1157,9 +1157,6 @@ void SetHwReg8188EU(struct adapter *Adapter, u8 variable, u8 *val)
 			rtw_write32(Adapter, REG_RCR, reg32 | RCR_CBSSID_BCN);
 		}
 		break;
-	case HW_VAR_DM_FLAG:
-		podmpriv->SupportAbility = *((u8 *)val);
-		break;
 	case HW_VAR_DM_FUNC_RESET:
 		podmpriv->SupportAbility = pdmpriv->InitODMFlag;
 		break;
diff --git a/drivers/staging/r8188eu/include/hal_intf.h b/drivers/staging/r8188eu/include/hal_intf.h
index 261823e7e8e8..89aeb6c2229f 100644
--- a/drivers/staging/r8188eu/include/hal_intf.h
+++ b/drivers/staging/r8188eu/include/hal_intf.h
@@ -12,7 +12,6 @@ enum hw_variables {
 	HW_VAR_SET_OPMODE,
 	HW_VAR_CORRECT_TSF,
 	HW_VAR_MLME_SITESURVEY,
-	HW_VAR_DM_FLAG,
 	HW_VAR_DM_FUNC_RESET,
 	HW_VAR_DM_FUNC_CLR,
 };
diff --git a/drivers/staging/r8188eu/os_dep/ioctl_linux.c b/drivers/staging/r8188eu/os_dep/ioctl_linux.c
index 047e9c7d38c3..930bb4aea435 100644
--- a/drivers/staging/r8188eu/os_dep/ioctl_linux.c
+++ b/drivers/staging/r8188eu/os_dep/ioctl_linux.c
@@ -3221,6 +3221,14 @@ static void rtw_set_dynamic_functions(struct adapter *adapter, u8 dm_func)
 	}
 }
 
+static void rtw_set_dm_func_flag(struct adapter *adapter, u32 odm_flag)
+{
+	struct hal_data_8188e *haldata = &adapter->haldata;
+	struct odm_dm_struct *odmpriv = &haldata->odmpriv;
+
+	odmpriv->SupportAbility = odm_flag;
+}
+
 static int rtw_dbg_port(struct net_device *dev,
 			       struct iw_request_info *info,
 			       union iwreq_data *wrqu, char *extra)
@@ -3459,7 +3467,7 @@ static int rtw_dbg_port(struct net_device *dev,
 		case 0x06:
 			{
 				u32 ODMFlag = (u32)(0x0f & arg);
-				SetHwReg8188EU(padapter, HW_VAR_DM_FLAG, (u8 *)(&ODMFlag));
+				rtw_set_dm_func_flag(padapter, ODMFlag);
 			}
 			break;
 		case 0x07:
-- 
2.36.1

