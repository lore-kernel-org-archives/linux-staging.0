Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EDD1136C
	for <linux-staging@lists.linux.dev>; Sat,  2 Apr 2022 09:23:45 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id dr20so10406175ejc.6
        for <linux-staging@lists.linux.dev>; Sat, 02 Apr 2022 02:23:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Hbv2IFTUt2O0NPVNkUCtxSG4zAl7/ejUdRHICxrAZZk=;
        b=jcenvO0vKctUXrUDIqaYaOXojqkx0Y5AMRoUgCR51aP3CppK4yzOjnGRCG5RfnWxzq
         OKG+DG31VTLSRSYffuPe7J2RoFsX29XpH1QS9+kWiD4rKPNru+1bNG8igkVrOl0bGjTW
         8fxsfSZTaCQpLipZ5lBpCUZ0IXqipDnoQzZ2LG86k7GgPNjzoHn44FO0l3ivZCzNFSYV
         Mn0XI0m65TkWoz5cdUv8vRSWxFkXlVTROayBfuNZQKZln9WYWc8o+M02aXIdfQi+plyv
         wyyemAe/yZ4RBguCP3EVgIaM52+EBx/Vr5DevaD6slNz2PnqZvsCBOylDJ1aOpcSRiSX
         EJmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Hbv2IFTUt2O0NPVNkUCtxSG4zAl7/ejUdRHICxrAZZk=;
        b=K1Q4srsYXxpP+d4rp0DF1bSs88g9iUMomS6lp/SgoNb7ulz0+1XxuHToqTjfhxZupD
         1wj7yCfojBzPhoroNcE+ATQ7b99upoBcF7+ZTQf9DKhqmU40ppeK+jfrQQ6Cu7vLncm6
         Snar22t3xyRPphx4uY5SKBwbDNlB5VhJdBpwqzKaVYKcPJPTsVB4GNPDFPfK02+ZgOtp
         3LbMWqbAJEMChkp6EiORes2LAcngF+ZaBGtH+wGz/x3E1rj7eD3WcRPXJ1svSHhivu02
         SDRoKHleHTb4lKpmDu9zrYiathq8k9dDHapZ9J51gIalKCWYfDN91sjdShNMMEVkYtEK
         iiVQ==
X-Gm-Message-State: AOAM5325Pxut6HWr+8dIrgz+GyV4+5LYVM3RnBlZR57uLSpTz98XHqhw
	3iDHgG1XSSkTF+AmLauUV9U=
X-Google-Smtp-Source: ABdhPJzMURrKj96ef7bpn1gmvX8XmHJZgVTaR2+n0/FIGaMTjQ/Hpxq3o3NXB3iH247WNkKdSor7yg==
X-Received: by 2002:a17:907:6092:b0:6db:ab31:96a2 with SMTP id ht18-20020a170907609200b006dbab3196a2mr3078780ejc.361.1648891423436;
        Sat, 02 Apr 2022 02:23:43 -0700 (PDT)
Received: from localhost.localdomain (ip5f5abb55.dynamic.kabel-deutschland.de. [95.90.187.85])
        by smtp.gmail.com with ESMTPSA id jv19-20020a170907769300b006e095c047d6sm1897679ejc.109.2022.04.02.02.23.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Apr 2022 02:23:42 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 6/7] staging: r8188eu: remove HW_VAR_H2C_FW_JOINBSSRPT from SetHwReg8188EU()
Date: Sat,  2 Apr 2022 11:23:31 +0200
Message-Id: <20220402092332.6627-7-straube.linux@gmail.com>
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

The HW_VAR_H2C_FW_JOINBSSRPT case in SetHwReg8188EU() just calls a
function. Call the function directly and remove the
HW_VAR_H2C_FW_JOINBSSRPT case from SetHwReg8188EU(). This is part of
the ongoing effort to get rid of the unwanted hal layer.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_cmd.c     | 4 ++--
 drivers/staging/r8188eu/hal/usb_halinit.c  | 6 ------
 drivers/staging/r8188eu/include/hal_intf.h | 1 -
 3 files changed, 2 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_cmd.c b/drivers/staging/r8188eu/core/rtw_cmd.c
index 19a04fcb6762..439d639a7c36 100644
--- a/drivers/staging/r8188eu/core/rtw_cmd.c
+++ b/drivers/staging/r8188eu/core/rtw_cmd.c
@@ -985,12 +985,12 @@ static void lps_ctrl_wk_hdl(struct adapter *padapter, u8 lps_ctrl_type)
 		mstatus = 1;/* connect */
 		/*  Reset LPS Setting */
 		padapter->pwrctrlpriv.LpsIdleCount = 0;
-		SetHwReg8188EU(padapter, HW_VAR_H2C_FW_JOINBSSRPT, (u8 *)(&mstatus));
+		rtl8188e_set_FwJoinBssReport_cmd(padapter, mstatus);
 		break;
 	case LPS_CTRL_DISCONNECT:
 		mstatus = 0;/* disconnect */
 		LPS_Leave(padapter);
-		SetHwReg8188EU(padapter, HW_VAR_H2C_FW_JOINBSSRPT, (u8 *)(&mstatus));
+		rtl8188e_set_FwJoinBssReport_cmd(padapter, mstatus);
 		break;
 	case LPS_CTRL_SPECIAL_PACKET:
 		pwrpriv->DelayLPSLastTimeStamp = jiffies;
diff --git a/drivers/staging/r8188eu/hal/usb_halinit.c b/drivers/staging/r8188eu/hal/usb_halinit.c
index d13a8ab598fd..cbd49183be13 100644
--- a/drivers/staging/r8188eu/hal/usb_halinit.c
+++ b/drivers/staging/r8188eu/hal/usb_halinit.c
@@ -1150,12 +1150,6 @@ void SetHwReg8188EU(struct adapter *Adapter, u8 variable, u8 *val)
 			rtl8188e_set_FwPwrMode_cmd(Adapter, psmode);
 		}
 		break;
-	case HW_VAR_H2C_FW_JOINBSSRPT:
-		{
-			u8 mstatus = (*(u8 *)val);
-			rtl8188e_set_FwJoinBssReport_cmd(Adapter, mstatus);
-		}
-		break;
 	case HW_VAR_H2C_FW_P2P_PS_OFFLOAD:
 		{
 			u8 p2p_ps_state = (*(u8 *)val);
diff --git a/drivers/staging/r8188eu/include/hal_intf.h b/drivers/staging/r8188eu/include/hal_intf.h
index edc4c6f42bc8..0f64cb41cca6 100644
--- a/drivers/staging/r8188eu/include/hal_intf.h
+++ b/drivers/staging/r8188eu/include/hal_intf.h
@@ -22,7 +22,6 @@ enum hw_variables {
 	HW_VAR_AC_PARAM_BE,
 	HW_VAR_AMPDU_FACTOR,
 	HW_VAR_H2C_FW_PWRMODE,
-	HW_VAR_H2C_FW_JOINBSSRPT,
 	HW_VAR_H2C_FW_P2P_PS_OFFLOAD,
 	HW_VAR_INITIAL_GAIN,
 	HW_VAR_FIFO_CLEARN_UP,
-- 
2.35.1

