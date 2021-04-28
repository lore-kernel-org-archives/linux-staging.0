Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5FD62F80
	for <linux-staging@lists.linux.dev>; Wed, 28 Apr 2021 07:28:10 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id q9so7709894wrs.6
        for <linux-staging@lists.linux.dev>; Wed, 28 Apr 2021 00:28:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hCW3WF/R+saMUVhD+ewp4j355vrqq752B+7QT7xE/dc=;
        b=r4rxidKJjtKIw7dB11Nz9Ao7JtdAz5jwz3R4UszGzeM5kFGWBMc6VjbHPDzd6xADLs
         9eeCKGvdIGVsL8+8dGXxZdD2nU34N7NmGHGUK06uAjH1RMBckcBKlAL77hifQ66gR1CC
         Sqktif06J8rJ/+bifMzkLfd9KESddW8z0DzB0CYkPlXdS3f+IweIJpMRFKZ3pLZstzxY
         IUH6Czm25TQ+NSb8Rc+c9NA/R1ryigKNmeBpbhubD8L2+l5VLHLsJhgOPGte6AezaHYA
         EdtEyQGNWI/ebKiXUhKyCpFZxinDbIT0EHRJFo1hoK0SX+GPxHZSlR2KFpx/cD7TFmCx
         MgvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hCW3WF/R+saMUVhD+ewp4j355vrqq752B+7QT7xE/dc=;
        b=FYEJ67LZSHVVBpI19/W8bLR21ySf+jFdAatlzfdvSKH4dP09L2W8tyoQqqeWoo1wAG
         ScIgCFWXv41E5tAPlGC/76Xv0rxMVrWpjfzsjhvDl92Q7DphvdzOsjGxDuRo1DnEa4BZ
         U0UYdT9IAncF7hYEtVjt4I6n2IQ7pzSWjRb01UovnYIfUwaxjgrWH2hT5IRQVzNDGEg0
         GtFERGwpp4kdXZWuCJhFTcBSLiu4aqWNLpbnOsoXM0Xf6E2OaDng0iiZzma1xw12jtsY
         lskVE6728yIsfuz0nhqNLB8OnyVSRxtNxDyhgDQPOd7T3bRrakY6OHH7qAxQD7R1W4TL
         VFog==
X-Gm-Message-State: AOAM532X4q5INNtkjoqgKgGTdirnrrVmd2t8+ZMUmsTj4yVbT8V3IWeC
	9TLTKhsmryCHO7TkhBVboFQ=
X-Google-Smtp-Source: ABdhPJw/MwrO9tTCtl279JcTucj6T58wts+nXPzPZHDewbSxKwvTW4ippi4w9r6ehLUOa0AQaYNyHw==
X-Received: by 2002:adf:e608:: with SMTP id p8mr34669543wrm.249.1619594889336;
        Wed, 28 Apr 2021 00:28:09 -0700 (PDT)
Received: from agape ([5.171.72.119])
        by smtp.gmail.com with ESMTPSA id e12sm3999648wrt.51.2021.04.28.00.28.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Apr 2021 00:28:09 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: joe@perches.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] staging: rtl8723bs: remove unnecessary hex dumps
Date: Wed, 28 Apr 2021 09:28:04 +0200
Message-Id: <8bbf5ce17f2d778a67e86cb948395e9ed27478d9.1619594707.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1619594707.git.fabioaiuto83@gmail.com>
References: <cover.1619594707.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unnecessary hex dumps in kernel log.

This deletion has been done with the following
semantic patch:

@@
@@

-	print_hex_dump_debug(...);

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/hal/hal_com.c        |  6 ------
 drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c   | 18 ------------------
 .../staging/rtl8723bs/hal/rtl8723b_hal_init.c  |  3 ---
 3 files changed, 27 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/hal_com.c b/drivers/staging/rtl8723bs/hal/hal_com.c
index e82f59fc5e9b..2c82282958e9 100644
--- a/drivers/staging/rtl8723bs/hal/hal_com.c
+++ b/drivers/staging/rtl8723bs/hal/hal_com.c
@@ -916,16 +916,10 @@ s32 c2h_evt_read_88xx(struct adapter *adapter, u8 *buf)
 	c2h_evt->seq = rtw_read8(adapter, REG_C2HEVT_CMD_SEQ_88XX);
 	c2h_evt->plen = rtw_read8(adapter, REG_C2HEVT_CMD_LEN_88XX);
 
-	print_hex_dump_debug(DRIVER_PREFIX ": c2h_evt_read(): ", DUMP_PREFIX_NONE,
-			     16, 1, &c2h_evt, sizeof(c2h_evt), false);
-
 	/* Read the content */
 	for (i = 0; i < c2h_evt->plen; i++)
 		c2h_evt->payload[i] = rtw_read8(adapter, REG_C2HEVT_MSG_NORMAL + 2 + i);
 
-	print_hex_dump_debug(DRIVER_PREFIX ": c2h_evt_read(): Command Content:\n",
-			     DUMP_PREFIX_NONE, 16, 1, c2h_evt->payload, c2h_evt->plen, false);
-
 	ret = _SUCCESS;
 
 clear_evt:
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c b/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
index 2451875ab3c0..e2ec82915073 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
@@ -309,9 +309,6 @@ static void rtl8723b_set_FwRsvdPage_cmd(struct adapter *padapter, struct rsvdpag
 	SET_8723B_H2CCMD_RSVDPAGE_LOC_QOS_NULL_DATA(u1H2CRsvdPageParm, rsvdpageloc->LocQosNull);
 	SET_8723B_H2CCMD_RSVDPAGE_LOC_BT_QOS_NULL_DATA(u1H2CRsvdPageParm, rsvdpageloc->LocBTQosNull);
 
-	print_hex_dump_debug(DRIVER_PREFIX ": u1H2CRsvdPageParm:", DUMP_PREFIX_NONE,
-			     16, 1, u1H2CRsvdPageParm, H2C_RSVDPAGE_LOC_LEN, false);
-
 	FillH2CCmd8723B(padapter, H2C_8723B_RSVD_PAGE, H2C_RSVDPAGE_LOC_LEN, u1H2CRsvdPageParm);
 }
 
@@ -329,9 +326,6 @@ void rtl8723b_set_FwMediaStatusRpt_cmd(struct adapter *padapter, u8 mstatus, u8
 	SET_8723B_H2CCMD_MSRRPT_PARM_MACID(u1H2CMediaStatusRptParm, macid);
 	SET_8723B_H2CCMD_MSRRPT_PARM_MACID_END(u1H2CMediaStatusRptParm, macid_end);
 
-	print_hex_dump_debug(DRIVER_PREFIX ": u1H2CMediaStatusRptParm:", DUMP_PREFIX_NONE,
-			     16, 1, u1H2CMediaStatusRptParm, H2C_MEDIA_STATUS_RPT_LEN, false);
-
 	FillH2CCmd8723B(padapter, H2C_8723B_MEDIA_STATUS_RPT, H2C_MEDIA_STATUS_RPT_LEN, u1H2CMediaStatusRptParm);
 }
 
@@ -348,9 +342,6 @@ void rtl8723b_set_FwMacIdConfig_cmd(struct adapter *padapter, u8 mac_id, u8 raid
 	SET_8723B_H2CCMD_MACID_CFG_RATE_MASK2(u1H2CMacIdConfigParm, (u8)((mask & 0x00ff0000) >> 16));
 	SET_8723B_H2CCMD_MACID_CFG_RATE_MASK3(u1H2CMacIdConfigParm, (u8)((mask & 0xff000000) >> 24));
 
-	print_hex_dump_debug(DRIVER_PREFIX ": u1H2CMacIdConfigParm:", DUMP_PREFIX_NONE,
-			     16, 1, u1H2CMacIdConfigParm, H2C_MACID_CFG_LEN, false);
-
 	FillH2CCmd8723B(padapter, H2C_8723B_MACID_CFG, H2C_MACID_CFG_LEN, u1H2CMacIdConfigParm);
 }
 
@@ -365,9 +356,6 @@ void rtl8723b_set_rssi_cmd(struct adapter *padapter, u8 *param)
 	SET_8723B_H2CCMD_RSSI_SETTING_RSSI(u1H2CRssiSettingParm, rssi);
 	SET_8723B_H2CCMD_RSSI_SETTING_ULDL_STATE(u1H2CRssiSettingParm, uldl_state);
 
-	print_hex_dump_debug(DRIVER_PREFIX ": u1H2CRssiSettingParm:", DUMP_PREFIX_NONE,
-			     16, 1, u1H2CRssiSettingParm, H2C_RSSI_SETTING_LEN, false);
-
 	FillH2CCmd8723B(padapter, H2C_8723B_RSSI_SETTING, H2C_RSSI_SETTING_LEN, u1H2CRssiSettingParm);
 }
 
@@ -465,9 +453,6 @@ void rtl8723b_set_FwPwrMode_cmd(struct adapter *padapter, u8 psmode)
 
 	hal_btcoex_RecordPwrMode(padapter, u1H2CPwrModeParm, H2C_PWRMODE_LEN);
 
-	print_hex_dump_debug(DRIVER_PREFIX ": u1H2CPwrModeParm:", DUMP_PREFIX_NONE,
-			     16, 1, u1H2CPwrModeParm, H2C_PWRMODE_LEN, false);
-
 	FillH2CCmd8723B(padapter, H2C_8723B_SET_PWR_MODE, H2C_PWRMODE_LEN, u1H2CPwrModeParm);
 }
 
@@ -485,9 +470,6 @@ void rtl8723b_set_FwPsTuneParam_cmd(struct adapter *padapter)
 	SET_8723B_H2CCMD_PSTUNE_PARM_ADOPT(u1H2CPsTuneParm, 1);
 	SET_8723B_H2CCMD_PSTUNE_PARM_DTIM_PERIOD(u1H2CPsTuneParm, dtim_period);
 
-	print_hex_dump_debug(DRIVER_PREFIX ": u1H2CPsTuneParm:", DUMP_PREFIX_NONE,
-			     16, 1, u1H2CPsTuneParm, H2C_PSTUNEPARAM_LEN, false);
-
 	FillH2CCmd8723B(padapter, H2C_8723B_PS_TUNING_PARA, H2C_PSTUNEPARAM_LEN, u1H2CPsTuneParm);
 }
 
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
index 082448557b53..103135aad41a 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
@@ -3315,9 +3315,6 @@ void C2HPacketHandler_8723B(struct adapter *padapter, u8 *pbuffer, u16 length)
 	C2hEvent.CmdLen = length-2;
 	tmpBuf = pbuffer+2;
 
-	print_hex_dump_debug(DRIVER_PREFIX ": C2HPacketHandler_8723B(): Command Content:\n",
-			     DUMP_PREFIX_NONE, 16, 1, tmpBuf, C2hEvent.CmdLen, false);
-
 	process_c2h_event(padapter, &C2hEvent, tmpBuf);
 	/* c2h_handler_8723b(padapter,&C2hEvent); */
 }
-- 
2.20.1

