Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A60B5136C
	for <linux-staging@lists.linux.dev>; Sat,  2 Apr 2022 09:23:47 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id ot30so528629ejb.12
        for <linux-staging@lists.linux.dev>; Sat, 02 Apr 2022 02:23:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=p1nCazU2RR08u9chSBMxQI9AzP6gAEkfhwUIFi0LIXg=;
        b=Wg7mpw7XUE4bov9iBjuBYKFcVHyxOb+b9cnznxNDNvkRKByMlQ7DM4l1oY7shpcn7Z
         Mp3duqVwKMMQS0k8odTmhEn8wBwbhUff89OkcdqppYTImkQ8/2eE2brZQC8XLFBqlUIG
         WvLby9+1lF2IxSRDIQ0MWXsPzcCasBitTAqHvgLm78AtAkSour981+e+X5gAWiqMifo9
         cyhclO/5zGCHK0PsB83VIND20i/wKTfkIEsbKX4vMG519BakSPP+inVty+D44YTYbl7r
         d4myFPDQ3GKa3SOpY42ShIFERYpO7YhTAXTzNAHtoh7/BD18u96vVjRkGIyBBeFHdpK7
         FV+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=p1nCazU2RR08u9chSBMxQI9AzP6gAEkfhwUIFi0LIXg=;
        b=S9gd+rrcFXSlleqiOfSTLhyv5bJJTmwd9BqcTKXtXYo+AQSTCshRotCPMoupUkzy+1
         ToKBouuK0p9VpnEp1RsIurYga7NmTC6ob334iQss4UaHsbkgkTrgJm19atLJreaT4HBI
         aOwkqfvD0OF07kvaImZzkPOOujyzx+NYLXU4k0vwmfd9Q2Qzbpi5q9GkNszKMRPbfmfo
         kialHBeALtoLemz3dYmGBzkbk9hw26usByDpLJnuNPOl5Ahf6ByHYalEgmeFErsBIh/X
         n3/S9tI6ah4BqWyzJEGyWCOyDHmevW1vhYQ2umnYXW2GIJ29ydg+JyTGRO5703ZjkIBx
         vDqQ==
X-Gm-Message-State: AOAM53323AXI4oivlvQeg5hvGKShv/7fTrfl2sAhWtG7Nh7MaT/gU/+5
	PQ7MrtUNNIPIEm7vdoBxsSA=
X-Google-Smtp-Source: ABdhPJyrGqa254pGglGEIFCVEPeMoDDg7oWpzf0Pv4SVMvPPifEA4K17QwjnhZRW3g/ZSTqFTJ5DRg==
X-Received: by 2002:a17:907:7da5:b0:6e4:e40f:60a0 with SMTP id oz37-20020a1709077da500b006e4e40f60a0mr3240474ejc.486.1648891426020;
        Sat, 02 Apr 2022 02:23:46 -0700 (PDT)
Received: from localhost.localdomain (ip5f5abb55.dynamic.kabel-deutschland.de. [95.90.187.85])
        by smtp.gmail.com with ESMTPSA id jv19-20020a170907769300b006e095c047d6sm1897679ejc.109.2022.04.02.02.23.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Apr 2022 02:23:45 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 7/7] staging: r8188eu: remove HW_VAR_H2C_FW_P2P_PS_OFFLOAD from SetHwReg8188EU()
Date: Sat,  2 Apr 2022 11:23:32 +0200
Message-Id: <20220402092332.6627-8-straube.linux@gmail.com>
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

The HW_VAR_H2C_FW_P2P_PS_OFFLOAD case in SetHwReg8188EU() just calls a
function. Call the function directly and remove the
HW_VAR_H2C_FW_P2P_PS_OFFLOAD case from SetHwReg8188EU(). This is part
of the ongoing effort to get rid of the unwanted hal layer.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_p2p.c     | 6 +++---
 drivers/staging/r8188eu/hal/usb_halinit.c  | 6 ------
 drivers/staging/r8188eu/include/hal_intf.h | 1 -
 3 files changed, 3 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_p2p.c b/drivers/staging/r8188eu/core/rtw_p2p.c
index 48500fb82250..1e728a03e0ac 100644
--- a/drivers/staging/r8188eu/core/rtw_p2p.c
+++ b/drivers/staging/r8188eu/core/rtw_p2p.c
@@ -1602,7 +1602,7 @@ void p2p_ps_wk_hdl(struct adapter *padapter, u8 p2p_ps_state)
 	case P2P_PS_DISABLE:
 		pwdinfo->p2p_ps_state = p2p_ps_state;
 
-		SetHwReg8188EU(padapter, HW_VAR_H2C_FW_P2P_PS_OFFLOAD, (u8 *)(&p2p_ps_state));
+		rtl8188e_set_p2p_ps_offload_cmd(padapter, p2p_ps_state);
 
 		pwdinfo->noa_index = 0;
 		pwdinfo->ctwindow = 0;
@@ -1626,7 +1626,7 @@ void p2p_ps_wk_hdl(struct adapter *padapter, u8 p2p_ps_state)
 					SetHwReg8188EU(padapter, HW_VAR_H2C_FW_PWRMODE, (u8 *)(&padapter->pwrctrlpriv.pwr_mode));
 				}
 			}
-			SetHwReg8188EU(padapter, HW_VAR_H2C_FW_P2P_PS_OFFLOAD, (u8 *)(&p2p_ps_state));
+			rtl8188e_set_p2p_ps_offload_cmd(padapter, p2p_ps_state);
 		}
 		break;
 	case P2P_PS_SCAN:
@@ -1634,7 +1634,7 @@ void p2p_ps_wk_hdl(struct adapter *padapter, u8 p2p_ps_state)
 	case P2P_PS_ALLSTASLEEP:
 		if (pwdinfo->p2p_ps_mode > P2P_PS_NONE) {
 			pwdinfo->p2p_ps_state = p2p_ps_state;
-			SetHwReg8188EU(padapter, HW_VAR_H2C_FW_P2P_PS_OFFLOAD, (u8 *)(&p2p_ps_state));
+			rtl8188e_set_p2p_ps_offload_cmd(padapter, p2p_ps_state);
 		}
 		break;
 	default:
diff --git a/drivers/staging/r8188eu/hal/usb_halinit.c b/drivers/staging/r8188eu/hal/usb_halinit.c
index cbd49183be13..4bc6b08fb282 100644
--- a/drivers/staging/r8188eu/hal/usb_halinit.c
+++ b/drivers/staging/r8188eu/hal/usb_halinit.c
@@ -1150,12 +1150,6 @@ void SetHwReg8188EU(struct adapter *Adapter, u8 variable, u8 *val)
 			rtl8188e_set_FwPwrMode_cmd(Adapter, psmode);
 		}
 		break;
-	case HW_VAR_H2C_FW_P2P_PS_OFFLOAD:
-		{
-			u8 p2p_ps_state = (*(u8 *)val);
-			rtl8188e_set_p2p_ps_offload_cmd(Adapter, p2p_ps_state);
-		}
-		break;
 	case HW_VAR_INITIAL_GAIN:
 		{
 			struct rtw_dig *pDigTable = &podmpriv->DM_DigTable;
diff --git a/drivers/staging/r8188eu/include/hal_intf.h b/drivers/staging/r8188eu/include/hal_intf.h
index 0f64cb41cca6..e222ab89bfc5 100644
--- a/drivers/staging/r8188eu/include/hal_intf.h
+++ b/drivers/staging/r8188eu/include/hal_intf.h
@@ -22,7 +22,6 @@ enum hw_variables {
 	HW_VAR_AC_PARAM_BE,
 	HW_VAR_AMPDU_FACTOR,
 	HW_VAR_H2C_FW_PWRMODE,
-	HW_VAR_H2C_FW_P2P_PS_OFFLOAD,
 	HW_VAR_INITIAL_GAIN,
 	HW_VAR_FIFO_CLEARN_UP,
 	HW_VAR_H2C_MEDIA_STATUS_RPT,
-- 
2.35.1

