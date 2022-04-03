Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A0671FDB
	for <linux-staging@lists.linux.dev>; Sun,  3 Apr 2022 16:53:09 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id c42so994392edf.3
        for <linux-staging@lists.linux.dev>; Sun, 03 Apr 2022 09:53:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=M8SD2tWDFceFBc3Hy1HeduUtsXtz9wGLYrV1mAwzJ0s=;
        b=Ih+Vq66PmnEQifzPGWEAQYjEm+s7ZH/05V3TJsrkeZGdMphKGy6AksqvOuRbbCZDF5
         TK7cNEWdUiXK4Xme+ls/AZW+QHfMO8fYf6iD2KZGwiz7kapsMsfM4yJYI/vC7ab4E/bE
         m5KBaoUuG5CE8S/bDgzJfNzIGYdVc6gvk3LGQ1xC/cfdQhcw9J1h15WeVaBvLfkLHpZw
         pvc9Xg9ABwKQr9gm8RSqFcXYZTPhRRo0+WkPa3pwzH8yTmxhcLjlqqnxyjxMYXwcJffi
         e7iNqaz5BzOLQlUjjygJQr2yBIwmvtM7LbZFEZQ4740zxLHFeqwNHAj7RmFV3KtW0pFc
         W7tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=M8SD2tWDFceFBc3Hy1HeduUtsXtz9wGLYrV1mAwzJ0s=;
        b=5wSbo0zp+PPZ+gZAy3v/UgDHpCq8nRW4DVYE+vkdCUR686BLDZscDZh6L/FJovcrAM
         LTE+4Kzzi5w7DulOFA2tA5IkXBaZRQqsNeo5n0q77TkThlbK/MB1TyPSqa+tmVfdmer3
         /DezwQ4LfT9Gx7WPq2va0+WBFamJJH9NsjsykKNIMlIWueloMKypLEriHVRHrFvTuPzp
         gKohWTL/zGh/Ti7SSwgDtkr+RcGXind+X3SQxagCNViaRl6s7d3eF6cy2q1ULAMMekYM
         wv9MEx+S5rJ/zTi0tt/p4m6tJ8lzO+DgQa2cv9F3sKxZ1ko+m+8ZM1UwmuRUEEiuPyVJ
         lmkQ==
X-Gm-Message-State: AOAM533m5fXMwOMMtLWaZjbv9mgsYSquzn+zPpgOnH7tOk0uEWvHXhrd
	tYwzZVESEvXiNKA1jbUxp/E=
X-Google-Smtp-Source: ABdhPJwoufX7FfTOIR7O9fnlvrUb3MRXpRmZ/cTL5hm9tssCGUowDNRxlJSm4ANp1ZVQrxBicYHTZQ==
X-Received: by 2002:a05:6402:4254:b0:419:245b:8051 with SMTP id g20-20020a056402425400b00419245b8051mr29645806edb.295.1649004787558;
        Sun, 03 Apr 2022 09:53:07 -0700 (PDT)
Received: from localhost.localdomain (ip5f5abb55.dynamic.kabel-deutschland.de. [95.90.187.85])
        by smtp.gmail.com with ESMTPSA id d4-20020a056402000400b00412d60fee38sm4018138edu.11.2022.04.03.09.53.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Apr 2022 09:53:06 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 5/5] staging: r8188eu: remove GetHalDefVar8188EUsb()
Date: Sun,  3 Apr 2022 18:52:55 +0200
Message-Id: <20220403165255.6900-6-straube.linux@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220403165255.6900-1-straube.linux@gmail.com>
References: <20220403165255.6900-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The local variable odm_flag in rtw_dbg_port() is set but never used.
This are the last two remaining calls to GetHalDefVar8188EUsb(). Both
calls can be removed and we finally can remove GetHalDefVar8188EUsb()
itself. This is part of the ongoing effort to get rid of the unwanted
hal layer.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/hal/usb_halinit.c    | 14 --------------
 drivers/staging/r8188eu/include/hal_intf.h   |  1 -
 drivers/staging/r8188eu/os_dep/ioctl_linux.c |  8 +-------
 3 files changed, 1 insertion(+), 22 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/usb_halinit.c b/drivers/staging/r8188eu/hal/usb_halinit.c
index 7a7eceaac311..028ccce2c282 100644
--- a/drivers/staging/r8188eu/hal/usb_halinit.c
+++ b/drivers/staging/r8188eu/hal/usb_halinit.c
@@ -1212,20 +1212,6 @@ void SetHwReg8188EU(struct adapter *Adapter, u8 variable, u8 *val)
 
 }
 
-/* Query setting of specified variable. */
-void GetHalDefVar8188EUsb(struct adapter *Adapter, enum hal_def_variable eVariable, void *pValue)
-{
-	struct hal_data_8188e *haldata = &Adapter->haldata;
-
-	switch (eVariable) {
-	case HAL_DEF_DBG_DM_FUNC:
-		*((u32 *)pValue) = haldata->odmpriv.SupportAbility;
-		break;
-	default:
-		break;
-	}
-}
-
 /* Change default setting of specified variable. */
 void SetHalDefVar8188EUsb(struct adapter *Adapter, enum hal_def_variable eVariable, void *pValue)
 {
diff --git a/drivers/staging/r8188eu/include/hal_intf.h b/drivers/staging/r8188eu/include/hal_intf.h
index 92ba276031b0..c24059bab981 100644
--- a/drivers/staging/r8188eu/include/hal_intf.h
+++ b/drivers/staging/r8188eu/include/hal_intf.h
@@ -52,7 +52,6 @@ int rtl8188e_IOL_exec_cmds_sync(struct adapter *adapter,
 				struct xmit_frame *xmit_frame, u32 max_wating_ms, u32 bndy_cnt);
 
 void SetHalDefVar8188EUsb(struct adapter *Adapter, enum hal_def_variable eVariable, void *pValue);
-void GetHalDefVar8188EUsb(struct adapter *Adapter, enum hal_def_variable eVariable, void *pValue);
 
 unsigned int rtl8188eu_inirp_init(struct adapter *Adapter);
 
diff --git a/drivers/staging/r8188eu/os_dep/ioctl_linux.c b/drivers/staging/r8188eu/os_dep/ioctl_linux.c
index d127cebb6eae..b6851628e4d2 100644
--- a/drivers/staging/r8188eu/os_dep/ioctl_linux.c
+++ b/drivers/staging/r8188eu/os_dep/ioctl_linux.c
@@ -3675,22 +3675,16 @@ static int rtw_dbg_port(struct net_device *dev,
 			break;
 		case 0xee:/* turn on/off dynamic funcs */
 			{
-				u32 odm_flag;
-
-				if (0xf == extra_arg) {
-					GetHalDefVar8188EUsb(padapter, HAL_DEF_DBG_DM_FUNC, &odm_flag);
-				} else {
+				if (extra_arg != 0xf) {
 					/*	extra_arg = 0  - disable all dynamic func
 						extra_arg = 1  - disable DIG
 						extra_arg = 2  - disable tx power tracking
 						extra_arg = 3  - turn on all dynamic func
 					*/
 					SetHalDefVar8188EUsb(padapter, HAL_DEF_DBG_DM_FUNC, &extra_arg);
-					GetHalDefVar8188EUsb(padapter, HAL_DEF_DBG_DM_FUNC, &odm_flag);
 				}
 			}
 			break;
-
 		case 0xfd:
 			rtw_write8(padapter, 0xc50, arg);
 			rtw_write8(padapter, 0xc58, arg);
-- 
2.35.1

