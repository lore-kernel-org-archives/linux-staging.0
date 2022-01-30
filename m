Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7C293FE4
	for <linux-staging@lists.linux.dev>; Sun, 30 Jan 2022 19:03:42 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id ah7so35959357ejc.4
        for <linux-staging@lists.linux.dev>; Sun, 30 Jan 2022 11:03:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=EBu/VgNr1P+8NOJbgZCzoP/cKUO7qZPe/m2OUsi2OqM=;
        b=SjcWhj7kEPfEDOFP2yv4cpBrfFZOAW8h+eozWkFGu+NqghG4Hq9FlI9Q+3wsl3XxPU
         bbEOiIii7LtFtPvy+mRTH6/6ykVuMPwIWQXpbWyKoS0fi1jNpMpOQPzleqoDLo7lveO5
         i6Q/AxTEtB6OfMCWceDqgdgN5GDkfComStlgmmN7yM9aVuf/nxEKWkG6NMoNG8ATeGu3
         uIh+45w22lSbRQBIRgNwonUyhF7F2T9vbbr1RxMVPONe+hpoHIgH03hOzgAV1NSWsxKt
         tx9cZCnKc5r47huUoAQDYDCh4uyt/mT22hY4Rz9K613r+NprxQL2POO9C5lSXyWHCccD
         ZpUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EBu/VgNr1P+8NOJbgZCzoP/cKUO7qZPe/m2OUsi2OqM=;
        b=VTuth/ZTyJGErx0fgP1ZqkUALuvFVc87EiOO4fj5uQa9BGJFWOusgJJP8UX2GnnkA5
         4HLupxZDEl8zxLMnPVTqQvwjiVG870APNqVWodFFgH8BjQIfmDBLMeAzSxYHTdKW+b2A
         fwSGcU0UlLL/dD8UTgndaNZBOIyaA3bsvU8Z+CX5PACiPm1Po2uPV3dV3wJBF7Ht1trv
         b0Gyq3naHPn1X4n6yP63Nm9h4beCfbjKOVJcTl9wCa2XELYKR/FtRTD6vBX6CYWcAa+l
         dmR+XyJJAv4ggNLEsxchAshJ6H2xoRedKvzFX+pESRmgsSpMZK6eR9r2OOb9HmYDbaAK
         41UA==
X-Gm-Message-State: AOAM532KXfFhNn664t+GGDlWt8XK9ZqXmhSypikB6lVDqTIZq8mQmeU6
	8SxklRRdHEjCF9NxCsbfIyI=
X-Google-Smtp-Source: ABdhPJzsi8U+lx5v5Yb/2+LFvC8xkhoYt+LtPlY30wrn4URXRCUfR/bWwC+jB36SG/41he2tOVpLZg==
X-Received: by 2002:a17:907:7248:: with SMTP id ds8mr14627823ejc.713.1643569421213;
        Sun, 30 Jan 2022 11:03:41 -0800 (PST)
Received: from localhost.localdomain (ip5f5abb5a.dynamic.kabel-deutschland.de. [95.90.187.90])
        by smtp.gmail.com with ESMTPSA id n3sm921124ejr.6.2022.01.30.11.03.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Jan 2022 11:03:40 -0800 (PST)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 09/12] staging: r8188eu: remove HW_VAR_CAM_WRITE
Date: Sun, 30 Jan 2022 20:03:18 +0100
Message-Id: <20220130190321.7172-10-straube.linux@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220130190321.7172-1-straube.linux@gmail.com>
References: <20220130190321.7172-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove HW_VAR_CAM_WRITE from SetHwReg8188EU() and call rtw_write32()
directly.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_wlan_util.c |  3 ++-
 drivers/staging/r8188eu/hal/usb_halinit.c    | 10 ----------
 drivers/staging/r8188eu/include/hal_intf.h   |  1 -
 3 files changed, 2 insertions(+), 12 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_wlan_util.c b/drivers/staging/r8188eu/core/rtw_wlan_util.c
index a8acec776b79..c6288c2d5f33 100644
--- a/drivers/staging/r8188eu/core/rtw_wlan_util.c
+++ b/drivers/staging/r8188eu/core/rtw_wlan_util.c
@@ -456,7 +456,8 @@ void write_cam(struct adapter *padapter, u8 entry, u16 ctrl, u8 *mac, u8 *key)
 		cam_val[0] = val;
 		cam_val[1] = addr + (unsigned int)j;
 
-		SetHwReg8188EU(padapter, HW_VAR_CAM_WRITE, (u8 *)cam_val);
+		rtw_write32(padapter, WCAMI, cam_val[0]);
+		rtw_write32(padapter, RWCAM, CAM_POLLINIG | CAM_WRITE | cam_val[1]);
 	}
 }
 
diff --git a/drivers/staging/r8188eu/hal/usb_halinit.c b/drivers/staging/r8188eu/hal/usb_halinit.c
index 96088a344d47..d3daefc0e80f 100644
--- a/drivers/staging/r8188eu/hal/usb_halinit.c
+++ b/drivers/staging/r8188eu/hal/usb_halinit.c
@@ -1323,16 +1323,6 @@ void SetHwReg8188EU(struct adapter *Adapter, u8 variable, u8 *val)
 			}
 		}
 		break;
-	case HW_VAR_CAM_WRITE:
-		{
-			u32 cmd;
-			u32 *cam_val = (u32 *)val;
-			rtw_write32(Adapter, WCAMI, cam_val[0]);
-
-			cmd = CAM_POLLINIG | CAM_WRITE | cam_val[1];
-			rtw_write32(Adapter, RWCAM, cmd);
-		}
-		break;
 	case HW_VAR_AC_PARAM_BE:
 		haldata->AcParam_BE = ((u32 *)(val))[0];
 		rtw_write32(Adapter, REG_EDCA_BE_PARAM, ((u32 *)(val))[0]);
diff --git a/drivers/staging/r8188eu/include/hal_intf.h b/drivers/staging/r8188eu/include/hal_intf.h
index 2912151c7830..edb4696218fb 100644
--- a/drivers/staging/r8188eu/include/hal_intf.h
+++ b/drivers/staging/r8188eu/include/hal_intf.h
@@ -28,7 +28,6 @@ enum hw_variables {
 	HW_VAR_DM_FUNC_SET,
 	HW_VAR_DM_FUNC_CLR,
 	HW_VAR_CAM_EMPTY_ENTRY,
-	HW_VAR_CAM_WRITE,
 	HW_VAR_CAM_READ,
 	HW_VAR_AC_PARAM_BE,
 	HW_VAR_ACM_CTRL,
-- 
2.34.1

