Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42FBAA4A
	for <linux-staging@lists.linux.dev>; Thu, 30 Jun 2022 06:17:46 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id g26so36916431ejb.5
        for <linux-staging@lists.linux.dev>; Wed, 29 Jun 2022 23:17:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yvHWb6v/L+9TZulap61szS7kTn+A6pLkouACTWq4ICs=;
        b=O4H/GNUaM/GvnoSxCdLpx5xQY6bwb28Lp46JQ5zdGTFD6CbTr1GFpG6J8PVz3tT4sc
         DFgs09OoHNGhAOUGtznZk+QlMCXtFobTmGm1HhIyTqM6uOXZDKaukavsoSP1/kBCvnhx
         tPYIo/12QBPwdJOmvBZwnKBHlTBmhZH+P5IPjahz29soU/DJCpDsgkj1FGcezlOoKct/
         1oc+Jl65hPvaZZZKEFbdljeYIA8SJN77rxBo271eSnSrYWaLIoifhKBiFWzH41XDCX7r
         FuO4lvfKsSt2IUFsl6fB6XRGkvXArNes3cMS/wyYzrhOAAqXWuFEWalDb92d5ZRrTCCP
         Xvig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yvHWb6v/L+9TZulap61szS7kTn+A6pLkouACTWq4ICs=;
        b=nwNw0Y1sYZgHG6JKod5mNhUnFLvrK28iOg9NEfDySGe/eAKbM+0X70vbYweoqQh9hp
         xTTIx0ZJpz31h28Lene1VJzVcvsMy8nqmwWb9rYPqBHpDQ6jq8HJAQpPdwjjSCE+Dv83
         DSx3y+GtenRfNRCx89gpDqSmSXLIWN7ejhk+Ha5iR6Ho0QsCx6zwodt8T+Df4Drjdj6U
         hIP6LFPl8L6IgxDlWyoII8kFl97qoMdmo4OiKLYVU8q6zqmo4F/zUoHO0gxs4HRUzXnQ
         Z1fmrG7yCQUrD9goH6oRHJ7jiND2CBmDDESgRYc3UBtpEnKrD6oNz8NN08KMRz+ykOHN
         72eg==
X-Gm-Message-State: AJIora+ykarwDJ9JLYB6IPaQtLWIB8+WBsaMwiWRR9oin7iM2j9MAfii
	tzocLe/gUJtL5f+eOc+cfLE=
X-Google-Smtp-Source: AGRyM1v5UhqAppkr1+rRYEt0Ld4fLLrvujMKGPsKLjbVw+1Cf27ruc7TcbrqO0oMOsjj8ioRCtat3w==
X-Received: by 2002:a17:907:3f9d:b0:726:31d9:c872 with SMTP id hr29-20020a1709073f9d00b0072631d9c872mr7179147ejc.524.1656569864540;
        Wed, 29 Jun 2022 23:17:44 -0700 (PDT)
Received: from localhost.localdomain (ip5f5abb57.dynamic.kabel-deutschland.de. [95.90.187.87])
        by smtp.gmail.com with ESMTPSA id jw14-20020a170906e94e00b007263481a43fsm8317524ejb.81.2022.06.29.23.17.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jun 2022 23:17:43 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH] staging: r8188eu: remove HW_VAR_H2C_MEDIA_STATUS_RPT from SetHwReg8188EU()
Date: Thu, 30 Jun 2022 08:17:36 +0200
Message-Id: <20220630061736.9200-1-straube.linux@gmail.com>
X-Mailer: git-send-email 2.36.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The HW_VAR_H2C_MEDIA_STATUS_RPT case in SetHwReg8188EU() only calls
rtl8188e_set_FwMediaStatus_cmd(). In order to get rid of
SetHwReg8188EU() remove the case HW_VAR_H2C_MEDIA_STATUS_RPT and call
rtl8188e_set_FwMediaStatus_cmd() directly.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_mlme.c     | 4 ++--
 drivers/staging/r8188eu/core/rtw_mlme_ext.c | 2 +-
 drivers/staging/r8188eu/hal/usb_halinit.c   | 3 ---
 drivers/staging/r8188eu/include/hal_intf.h  | 1 -
 4 files changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_mlme.c b/drivers/staging/r8188eu/core/rtw_mlme.c
index 56c8bd5f4c60..2705c9d87b14 100644
--- a/drivers/staging/r8188eu/core/rtw_mlme.c
+++ b/drivers/staging/r8188eu/core/rtw_mlme.c
@@ -1117,7 +1117,7 @@ void rtw_sta_media_status_rpt(struct adapter *adapter, struct sta_info *psta,
 
 	/* MACID|OPMODE:1 connect */
 	media_status_rpt = (u16)((psta->mac_id << 8) | mstatus);
-	SetHwReg8188EU(adapter, HW_VAR_H2C_MEDIA_STATUS_RPT, (u8 *)&media_status_rpt);
+	rtl8188e_set_FwMediaStatus_cmd(adapter, media_status_rpt);
 }
 
 void rtw_stassoc_event_callback(struct adapter *adapter, u8 *pbuf)
@@ -1195,7 +1195,7 @@ void rtw_stadel_event_callback(struct adapter *adapter, u8 *pbuf)
 		u16 media_status;
 		media_status = (mac_id << 8) | 0; /*   MACID|OPMODE:0 means disconnect */
 		/* for STA, AP, ADHOC mode, report disconnect stauts to FW */
-		SetHwReg8188EU(adapter, HW_VAR_H2C_MEDIA_STATUS_RPT, (u8 *)&media_status);
+		rtl8188e_set_FwMediaStatus_cmd(adapter, media_status);
 	}
 
 	if (check_fwstate(pmlmepriv, WIFI_AP_STATE))
diff --git a/drivers/staging/r8188eu/core/rtw_mlme_ext.c b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
index cce0575e93b7..7122d5d85e8c 100644
--- a/drivers/staging/r8188eu/core/rtw_mlme_ext.c
+++ b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
@@ -6709,7 +6709,7 @@ void mlmeext_joinbss_event_callback(struct adapter *padapter, int join_res)
 		rtw_set_max_rpt_macid(padapter, psta->mac_id);
 
 		media_status = (psta->mac_id << 8) | 1; /*   MACID|OPMODE: 1 means connect */
-		SetHwReg8188EU(padapter, HW_VAR_H2C_MEDIA_STATUS_RPT, (u8 *)&media_status);
+		rtl8188e_set_FwMediaStatus_cmd(padapter, media_status);
 	}
 
 	mlme_join(padapter, 2);
diff --git a/drivers/staging/r8188eu/hal/usb_halinit.c b/drivers/staging/r8188eu/hal/usb_halinit.c
index bb3045111147..3908c46d2fbe 100644
--- a/drivers/staging/r8188eu/hal/usb_halinit.c
+++ b/drivers/staging/r8188eu/hal/usb_halinit.c
@@ -1235,9 +1235,6 @@ void SetHwReg8188EU(struct adapter *Adapter, u8 variable, u8 *val)
 			}
 		}
 		break;
-	case HW_VAR_H2C_MEDIA_STATUS_RPT:
-		rtl8188e_set_FwMediaStatus_cmd(Adapter, (*(__le16 *)val));
-		break;
 	default:
 		break;
 	}
diff --git a/drivers/staging/r8188eu/include/hal_intf.h b/drivers/staging/r8188eu/include/hal_intf.h
index 0104ee463a10..c3704618bccc 100644
--- a/drivers/staging/r8188eu/include/hal_intf.h
+++ b/drivers/staging/r8188eu/include/hal_intf.h
@@ -18,7 +18,6 @@ enum hw_variables {
 	HW_VAR_DM_FUNC_RESET,
 	HW_VAR_DM_FUNC_CLR,
 	HW_VAR_AMPDU_FACTOR,
-	HW_VAR_H2C_MEDIA_STATUS_RPT,
 };
 
 typedef s32 (*c2h_id_filter)(u8 id);
-- 
2.36.1

