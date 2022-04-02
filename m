Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1DB0136C
	for <linux-staging@lists.linux.dev>; Sat,  2 Apr 2022 09:23:43 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id c10so10350760ejs.13
        for <linux-staging@lists.linux.dev>; Sat, 02 Apr 2022 02:23:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Kj0NK64/6VOX5kKDITGHXBLvkxZmhHmuskzVJ746a1s=;
        b=Hv9it68CijLFSwsSmW/b2hNjYUjEItE+yy8rNczB4SS5RU5urdnFL8gJaBqWD2eTVC
         B5dPp85eANDq7D+3V3XUQqP80sahcSVvsyg5t2FnJ08oYppLvJiglXILTPxmisjWwnBc
         EuE8Y4kURuqIlsot5yBvPzVVjomFc1upW1eHFuAIpvcUzyU0nW9Sc5N4/Td2DPmUf96A
         JdggqdCH7skF6h4IAJ/WtW0IPs9Kdit2ewBxY6UlOF4EUK3prreb575i3nNGJjUOB0Ze
         96JzHZe1dG9snZkIAL5ej3P27WYHFppuCbFWYKlgyR54aqP3nLr6IwZt1tzUURzWXjfu
         zvIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Kj0NK64/6VOX5kKDITGHXBLvkxZmhHmuskzVJ746a1s=;
        b=KxWL/K9GH14Lqb6GNGcSirFNEKMeGi94eUU1wdJz1jaLpVUe3CJi9THNnRXkgoCYnE
         idSxFundzF3m7BFs5fVQ53QoTD9LG/UTtHomSudfgeI5GWU5rlsgxWncF89dDO5LftVo
         +NbECgPn1avtvuBVdOoLfiJW1PECgIt0nmHOMuyP/hpTLuV9TDcuQY2YX/r1vf0BZqVI
         n3Nd9wL/Us0X4X3ZbQ2yYjCmAuXdAy0WmzfdeWZeR/0VGNHCx6WnNMSHJV1R+MnK0A7u
         qzy+eyiD1ME68hEYWHrQo/zzK1djSnvQQKDKdWYIpyeZikbV3BIDofQDklMHfV+xNwc2
         YeeA==
X-Gm-Message-State: AOAM530bhB5pWHwSucQh+HSN7/U6V4DkyidjZIBdSIuGjRsXZbOGKTA/
	HLFfTjKaxZLL/EUA0MHWSrA=
X-Google-Smtp-Source: ABdhPJz/yRat7Vq2PFwQGRYsW6sE5hNV6cm2sFVOlgWjf7PnjhEo4k5+lvWjAuZd7Mbk3mOJA2grbQ==
X-Received: by 2002:a17:907:7d93:b0:6da:8f57:68fa with SMTP id oz19-20020a1709077d9300b006da8f5768famr3335611ejc.42.1648891422095;
        Sat, 02 Apr 2022 02:23:42 -0700 (PDT)
Received: from localhost.localdomain (ip5f5abb55.dynamic.kabel-deutschland.de. [95.90.187.85])
        by smtp.gmail.com with ESMTPSA id jv19-20020a170907769300b006e095c047d6sm1897679ejc.109.2022.04.02.02.23.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Apr 2022 02:23:41 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 5/7] staging: r8188eu: remove HW_VAR_RPT_TIMER_SETTING from SetHwReg8188EU()
Date: Sat,  2 Apr 2022 11:23:30 +0200
Message-Id: <20220402092332.6627-6-straube.linux@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220402092332.6627-1-straube.linux@gmail.com>
References: <20220402092332.6627-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the HW_VAR_RPT_TIMER_SETTING case from SetHwReg8188EU() and
move its functionality to rtw_cmd.c where it is actually used. This is
part of the ongoing effort to get rid of the unwanted hal layer.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_cmd.c     | 5 ++++-
 drivers/staging/r8188eu/hal/usb_halinit.c  | 6 ------
 drivers/staging/r8188eu/include/hal_intf.h | 1 -
 3 files changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_cmd.c b/drivers/staging/r8188eu/core/rtw_cmd.c
index a9152db589c7..19a04fcb6762 100644
--- a/drivers/staging/r8188eu/core/rtw_cmd.c
+++ b/drivers/staging/r8188eu/core/rtw_cmd.c
@@ -1049,7 +1049,10 @@ u8 rtw_lps_ctrl_wk_cmd(struct adapter *padapter, u8 lps_ctrl_type, u8 enqueue)
 
 static void rpt_timer_setting_wk_hdl(struct adapter *padapter, u16 min_time)
 {
-	SetHwReg8188EU(padapter, HW_VAR_RPT_TIMER_SETTING, (u8 *)(&min_time));
+	struct hal_data_8188e *haldata = &padapter->haldata;
+	struct odm_dm_struct *odmpriv = &haldata->odmpriv;
+
+	ODM_RA_Set_TxRPT_Time(odmpriv, min_time);
 }
 
 u8 rtw_rpt_timer_cfg_cmd(struct adapter *padapter, u16 min_time)
diff --git a/drivers/staging/r8188eu/hal/usb_halinit.c b/drivers/staging/r8188eu/hal/usb_halinit.c
index 39db038d75fd..d13a8ab598fd 100644
--- a/drivers/staging/r8188eu/hal/usb_halinit.c
+++ b/drivers/staging/r8188eu/hal/usb_halinit.c
@@ -1175,12 +1175,6 @@ void SetHwReg8188EU(struct adapter *Adapter, u8 variable, u8 *val)
 			}
 		}
 		break;
-	case HW_VAR_RPT_TIMER_SETTING:
-		{
-			u16 min_rpt_time = (*(u16 *)val);
-			ODM_RA_Set_TxRPT_Time(podmpriv, min_rpt_time);
-		}
-		break;
 	case HW_VAR_FIFO_CLEARN_UP:
 		{
 			struct pwrctrl_priv *pwrpriv = &Adapter->pwrctrlpriv;
diff --git a/drivers/staging/r8188eu/include/hal_intf.h b/drivers/staging/r8188eu/include/hal_intf.h
index 1ba2eb0a46b2..edc4c6f42bc8 100644
--- a/drivers/staging/r8188eu/include/hal_intf.h
+++ b/drivers/staging/r8188eu/include/hal_intf.h
@@ -26,7 +26,6 @@ enum hw_variables {
 	HW_VAR_H2C_FW_P2P_PS_OFFLOAD,
 	HW_VAR_INITIAL_GAIN,
 	HW_VAR_FIFO_CLEARN_UP,
-	HW_VAR_RPT_TIMER_SETTING,
 	HW_VAR_H2C_MEDIA_STATUS_RPT,
 };
 
-- 
2.35.1

