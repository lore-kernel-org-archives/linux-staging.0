Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BACC83FE0
	for <linux-staging@lists.linux.dev>; Sun, 30 Jan 2022 19:03:43 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id b13so22699260edn.0
        for <linux-staging@lists.linux.dev>; Sun, 30 Jan 2022 11:03:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ABytRs7kXzyQl1oWMNLrz9vNj9dbkxYUimcbfNxfvmk=;
        b=Qgo9WSeE3qKYQrUncnSeNX2H1TJ3YfR6c7x1nnagBmHQu7gdOjZXlzrB/to4888HDE
         M9F7eB8fQrdZkPRt8W7hDEnskhjMRGIKL7sNQJmfeQ6lNy9q/nOZuolwxPekrhaON2XK
         gLVljf99/3qApZzYcJQJGxK/mtBBkB1P1dz92U7pLtEd9J/vkCbc5rd+ABUb96CRZgXf
         opSYW9bSAFeCmYMh7OfH1JdisS8S5yq5eUF/y36xvdyXbVITvco8vlj8fAltdB7t6AQk
         r+PiN3Kg4HC370F/wwUChGpHA43mvx1v0HRZgJBu50FHknlG1IeYjA7f+q1D5QzPkct2
         yW5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ABytRs7kXzyQl1oWMNLrz9vNj9dbkxYUimcbfNxfvmk=;
        b=1mUBf9uV/3iHevYFSfW0alNcSD2AsuWbSgq8NGODjJfm9n9s18SWrArQbWVlZ+g/q1
         vcgZex9+KyY5FylmoHrAtcMB/hasQieKq+eRmYg4vNjcAHUXcZo7gzTJchHMl7s2+6u+
         D1cbIyuWydlCMfAc1vFlryI1oAfXWtcdVryuro6Tt/b1KMLgLqY6VbE9tCy3hcMLA5zD
         H26qs5BPv0cJz/1a32n6k+6DPc77+XBg6uPKDJTkYJpGfemq6QNmwYSq7Fx10qD9RZcB
         tWzjtUvwdCHEflE7++ynepWzGZ+ERKNPc0IZSXGnY1Px08dUGGIXCo3DNMxMcSgjE6xk
         Acfw==
X-Gm-Message-State: AOAM5304Z1zADGoAec38phM8MY47ubo2k3l18X3SV9Ku9Yn9BScKp3VB
	2yCAcRvjuO2JpsPQOQoSe/g=
X-Google-Smtp-Source: ABdhPJxKbKzQb7GzE2HbetOZFX76cytOXI2wE6Uh7FSbo2tI+jwKW7mgj6G7AuN+Ln9y971CcHqCPQ==
X-Received: by 2002:a05:6402:11cd:: with SMTP id j13mr8781032edw.116.1643569422192;
        Sun, 30 Jan 2022 11:03:42 -0800 (PST)
Received: from localhost.localdomain (ip5f5abb5a.dynamic.kabel-deutschland.de. [95.90.187.90])
        by smtp.gmail.com with ESMTPSA id n3sm921124ejr.6.2022.01.30.11.03.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Jan 2022 11:03:41 -0800 (PST)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 10/12] staging: r8188eu: remove HW_VAR_BCN_FUNC
Date: Sun, 30 Jan 2022 20:03:19 +0100
Message-Id: <20220130190321.7172-11-straube.linux@gmail.com>
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

The HW_VAR_BCN_FUNC case in SetHwReg8188EU() just calls
hw_var_set_bcn_func(). Remove HW_VAR_BCN_FUNC from SetHwReg8188EU(),
remove hw_var_set_bcn_func() and call rtw_write8() directly.

Since hw_var_set_bcn_func() was always called with value 0, we only
need to keep the else arm of the if statement that checks the value.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_mlme_ext.c |  4 ++--
 drivers/staging/r8188eu/hal/usb_halinit.c   | 15 ---------------
 drivers/staging/r8188eu/include/hal_intf.h  |  1 -
 3 files changed, 2 insertions(+), 18 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_mlme_ext.c b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
index e7782d2499a8..73069dddf6b7 100644
--- a/drivers/staging/r8188eu/core/rtw_mlme_ext.c
+++ b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
@@ -7644,8 +7644,8 @@ u8 disconnect_hdl(struct adapter *padapter, unsigned char *pbuf)
 
 	if (((pmlmeinfo->state & 0x03) == WIFI_FW_ADHOC_STATE) || ((pmlmeinfo->state & 0x03) == WIFI_FW_AP_STATE)) {
 		/* Stop BCN */
-		val8 = 0;
-		SetHwReg8188EU(padapter, HW_VAR_BCN_FUNC, (u8 *)(&val8));
+		val8 = rtw_read8(padapter, REG_BCN_CTRL);
+		rtw_write8(padapter, REG_BCN_CTRL, val8 & (~(EN_BCN_FUNCTION | EN_TXBCN_RPT)));
 	}
 
 	/* set MSR to no link state -> infra. mode */
diff --git a/drivers/staging/r8188eu/hal/usb_halinit.c b/drivers/staging/r8188eu/hal/usb_halinit.c
index d3daefc0e80f..796c898bfb8c 100644
--- a/drivers/staging/r8188eu/hal/usb_halinit.c
+++ b/drivers/staging/r8188eu/hal/usb_halinit.c
@@ -1049,18 +1049,6 @@ static void hw_var_set_bssid(struct adapter *Adapter, u8 *val)
 		rtw_write8(Adapter, (reg_bssid + idx), val[idx]);
 }
 
-static void hw_var_set_bcn_func(struct adapter *Adapter, u8 *val)
-{
-	u32 bcn_ctrl_reg;
-
-	bcn_ctrl_reg = REG_BCN_CTRL;
-
-	if (*((u8 *)val))
-		rtw_write8(Adapter, bcn_ctrl_reg, (EN_BCN_FUNCTION | EN_TXBCN_RPT));
-	else
-		rtw_write8(Adapter, bcn_ctrl_reg, rtw_read8(Adapter, bcn_ctrl_reg) & (~(EN_BCN_FUNCTION | EN_TXBCN_RPT)));
-}
-
 void SetHwReg8188EU(struct adapter *Adapter, u8 variable, u8 *val)
 {
 	struct hal_data_8188e *haldata = &Adapter->haldata;
@@ -1109,9 +1097,6 @@ void SetHwReg8188EU(struct adapter *Adapter, u8 variable, u8 *val)
 			rtw_write8(Adapter, REG_INIRTS_RATE_SEL, RateIndex);
 		}
 		break;
-	case HW_VAR_BCN_FUNC:
-		hw_var_set_bcn_func(Adapter, val);
-		break;
 	case HW_VAR_CORRECT_TSF:
 		{
 			u64	tsf;
diff --git a/drivers/staging/r8188eu/include/hal_intf.h b/drivers/staging/r8188eu/include/hal_intf.h
index edb4696218fb..7be5eb2c4a9b 100644
--- a/drivers/staging/r8188eu/include/hal_intf.h
+++ b/drivers/staging/r8188eu/include/hal_intf.h
@@ -13,7 +13,6 @@ enum hw_variables {
 	HW_VAR_BSSID,
 	HW_VAR_INIT_RTS_RATE,
 	HW_VAR_BASIC_RATE,
-	HW_VAR_BCN_FUNC,
 	HW_VAR_CORRECT_TSF,
 	HW_VAR_CHECK_BSSID,
 	HW_VAR_MLME_DISCONNECT,
-- 
2.34.1

