Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A6FB5F
	for <linux-staging@lists.linux.dev>; Thu,  1 Apr 2021 09:07:28 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id b16so1107170eds.7
        for <linux-staging@lists.linux.dev>; Thu, 01 Apr 2021 02:07:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=z0YLmu3Lbju6Wgix3IY/SiIi4DM91syLmnRJ1rA3xcc=;
        b=o+ynzMyfjE5dXDxHdXEKVPodhSTrEWxdUvPTDNHa1RCY/5iHA+2X+YcxT2Trjl18u2
         EZ1qOHiDmC5RoYGsAEo5AGl4k1UJg3RXdRaucsUzoZJ+J5ArfIESKkGcyxVz4uhzWN0v
         7t+dO+ar7CcNUJrSb+4C/TDkvIH5YuvUJLDjgO/uj+s4gmUg0CouTmAlbx7W/LJyx6rZ
         4bjzHKIo8kPaaNNxZkRlNzZZ4z2A2bN6a8URd76F4mjxp7DbOG0SiTAvLff64Bc9hT/b
         P2Nw1z740YVDrFdq4MN/GFCgnkmMkn65BMj8i/bbbQCCsjXmzFW+g2gUKDBVltEKfYLD
         G+8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=z0YLmu3Lbju6Wgix3IY/SiIi4DM91syLmnRJ1rA3xcc=;
        b=W/W/b146ADoe4cSmTZ5SjGLNO/HAHkbdT3f3/ooCYFRneGQFhXMe17XArgSDdPjged
         Gt4grTFW8zoLbg1GtLweZBd9g2vGiiYFx2gJIdHbMgieEeCAqLXZMg6Cp1rdy/Mbhk4l
         ochd8vPCUDzLdwo9kBd3iTCZzG7h4WdvHLGrRBjPyKEGqC4Rrd6BATt+m0a+UwLVASbv
         Fekt2pQDkwC+ZV+7j+mr+txS1eex3Pedqi5topjA8LGGciqioi5NXHdwbs5qM7i9yC3v
         bXqwTwxDa+vf6mMGKjN2yGZQQLMo2S7Ab2/o9BPBCExesNNwixLSyzSYJDukVy7AO9rD
         pdjg==
X-Gm-Message-State: AOAM531zR0w9KBZGqy301xtm1LTFblvyzmjUgcPT0vnJJu+WdJQuWZyJ
	HyIdwPpmcGO74+vaLszLZilgCpPaC7OOQQ==
X-Google-Smtp-Source: ABdhPJxlfee7OzMH6YD7VgC4GwHIkb8VhJHOyxhGH/c5aiHZgP3Hfp/7PvJaxxvgtJCkwkPJXgib0A==
X-Received: by 2002:a05:6402:34d5:: with SMTP id w21mr8764408edc.14.1617268047096;
        Thu, 01 Apr 2021 02:07:27 -0700 (PDT)
Received: from agape ([5.171.80.247])
        by smtp.gmail.com with ESMTPSA id bm10sm3290772edb.2.2021.04.01.02.07.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Apr 2021 02:07:26 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: joe@perches.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Fabio Aiuto <fabioaiuto83@gmail.com>
Subject: [PATCH v2 1/2] staging: rtl8723bs: use print_hex_dump_debug instead of private RT_PRINT_DATA
Date: Thu,  1 Apr 2021 11:07:21 +0200
Message-Id: <2ef2c25c928b15f1c4357146efe193afab606d33.1617267827.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1617267827.git.fabioaiuto83@gmail.com>
References: <cover.1617267827.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

replace private macro RT_PRINT_DATA with in-kernel helper
print_hex_dump_debug

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/hal/hal_com.c       | 13 ++++-------
 drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c  | 22 ++++++++++++++-----
 .../staging/rtl8723bs/hal/rtl8723b_hal_init.c |  3 ++-
 3 files changed, 22 insertions(+), 16 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/hal_com.c b/drivers/staging/rtl8723bs/hal/hal_com.c
index 98a363698843..e74d7e21372d 100644
--- a/drivers/staging/rtl8723bs/hal/hal_com.c
+++ b/drivers/staging/rtl8723bs/hal/hal_com.c
@@ -924,13 +924,8 @@ s32 c2h_evt_read_88xx(struct adapter *adapter, u8 *buf)
 	c2h_evt->seq = rtw_read8(adapter, REG_C2HEVT_CMD_SEQ_88XX);
 	c2h_evt->plen = rtw_read8(adapter, REG_C2HEVT_CMD_LEN_88XX);
 
-	RT_PRINT_DATA(
-		_module_hal_init_c_,
-		_drv_info_,
-		"c2h_evt_read(): ",
-		&c2h_evt,
-		sizeof(c2h_evt)
-	);
+	print_hex_dump_debug(DRIVER_PREFIX ": c2h_evt_read(): ", DUMP_PREFIX_NONE,
+			     16, 1, &c2h_evt, sizeof(c2h_evt), false);
 
 	DBG_871X(
 		"%s id:%u, len:%u, seq:%u, trigger:0x%02x\n",
@@ -945,8 +940,8 @@ s32 c2h_evt_read_88xx(struct adapter *adapter, u8 *buf)
 	for (i = 0; i < c2h_evt->plen; i++)
 		c2h_evt->payload[i] = rtw_read8(adapter, REG_C2HEVT_MSG_NORMAL + 2 + i);
 
-	RT_PRINT_DATA(_module_hal_init_c_, _drv_info_, "c2h_evt_read(): Command Content:\n",
-		c2h_evt->payload, c2h_evt->plen);
+	print_hex_dump_debug(DRIVER_PREFIX ": c2h_evt_read(): Command Content:\n",
+			     DUMP_PREFIX_NONE, 16, 1, c2h_evt->payload, c2h_evt->plen, false);
 
 	ret = _SUCCESS;
 
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c b/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
index 202974ccb739..88f908fd14e3 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
@@ -336,7 +336,9 @@ static void rtl8723b_set_FwRsvdPage_cmd(struct adapter *padapter, struct rsvdpag
 	SET_8723B_H2CCMD_RSVDPAGE_LOC_QOS_NULL_DATA(u1H2CRsvdPageParm, rsvdpageloc->LocQosNull);
 	SET_8723B_H2CCMD_RSVDPAGE_LOC_BT_QOS_NULL_DATA(u1H2CRsvdPageParm, rsvdpageloc->LocBTQosNull);
 
-	RT_PRINT_DATA(_module_hal_init_c_, _drv_always_, "u1H2CRsvdPageParm:", u1H2CRsvdPageParm, H2C_RSVDPAGE_LOC_LEN);
+	print_hex_dump_debug(DRIVER_PREFIX ": u1H2CRsvdPageParm:", DUMP_PREFIX_NONE,
+			     16, 1, u1H2CRsvdPageParm, H2C_RSVDPAGE_LOC_LEN, false);
+
 	FillH2CCmd8723B(padapter, H2C_8723B_RSVD_PAGE, H2C_RSVDPAGE_LOC_LEN, u1H2CRsvdPageParm);
 }
 
@@ -356,7 +358,9 @@ void rtl8723b_set_FwMediaStatusRpt_cmd(struct adapter *padapter, u8 mstatus, u8
 	SET_8723B_H2CCMD_MSRRPT_PARM_MACID(u1H2CMediaStatusRptParm, macid);
 	SET_8723B_H2CCMD_MSRRPT_PARM_MACID_END(u1H2CMediaStatusRptParm, macid_end);
 
-	RT_PRINT_DATA(_module_hal_init_c_, _drv_always_, "u1H2CMediaStatusRptParm:", u1H2CMediaStatusRptParm, H2C_MEDIA_STATUS_RPT_LEN);
+	print_hex_dump_debug(DRIVER_PREFIX ": u1H2CMediaStatusRptParm:", DUMP_PREFIX_NONE,
+			     16, 1, u1H2CMediaStatusRptParm, H2C_MEDIA_STATUS_RPT_LEN, false);
+
 	FillH2CCmd8723B(padapter, H2C_8723B_MEDIA_STATUS_RPT, H2C_MEDIA_STATUS_RPT_LEN, u1H2CMediaStatusRptParm);
 }
 
@@ -375,7 +379,9 @@ void rtl8723b_set_FwMacIdConfig_cmd(struct adapter *padapter, u8 mac_id, u8 raid
 	SET_8723B_H2CCMD_MACID_CFG_RATE_MASK2(u1H2CMacIdConfigParm, (u8)((mask & 0x00ff0000) >> 16));
 	SET_8723B_H2CCMD_MACID_CFG_RATE_MASK3(u1H2CMacIdConfigParm, (u8)((mask & 0xff000000) >> 24));
 
-	RT_PRINT_DATA(_module_hal_init_c_, _drv_always_, "u1H2CMacIdConfigParm:", u1H2CMacIdConfigParm, H2C_MACID_CFG_LEN);
+	print_hex_dump_debug(DRIVER_PREFIX ": u1H2CMacIdConfigParm:", DUMP_PREFIX_NONE,
+			     16, 1, u1H2CMacIdConfigParm, H2C_MACID_CFG_LEN, false);
+
 	FillH2CCmd8723B(padapter, H2C_8723B_MACID_CFG, H2C_MACID_CFG_LEN, u1H2CMacIdConfigParm);
 }
 
@@ -393,7 +399,9 @@ void rtl8723b_set_rssi_cmd(struct adapter *padapter, u8 *param)
 	SET_8723B_H2CCMD_RSSI_SETTING_RSSI(u1H2CRssiSettingParm, rssi);
 	SET_8723B_H2CCMD_RSSI_SETTING_ULDL_STATE(u1H2CRssiSettingParm, uldl_state);
 
-	RT_PRINT_DATA(_module_hal_init_c_, _drv_notice_, "u1H2CRssiSettingParm:", u1H2CRssiSettingParm, H2C_RSSI_SETTING_LEN);
+	print_hex_dump_debug(DRIVER_PREFIX ": u1H2CRssiSettingParm:", DUMP_PREFIX_NONE,
+			     16, 1, u1H2CRssiSettingParm, H2C_RSSI_SETTING_LEN, false);
+
 	FillH2CCmd8723B(padapter, H2C_8723B_RSSI_SETTING, H2C_RSSI_SETTING_LEN, u1H2CRssiSettingParm);
 }
 
@@ -514,7 +522,8 @@ void rtl8723b_set_FwPwrMode_cmd(struct adapter *padapter, u8 psmode)
 
 	hal_btcoex_RecordPwrMode(padapter, u1H2CPwrModeParm, H2C_PWRMODE_LEN);
 
-	RT_PRINT_DATA(_module_hal_init_c_, _drv_always_, "u1H2CPwrModeParm:", u1H2CPwrModeParm, H2C_PWRMODE_LEN);
+	print_hex_dump_debug(DRIVER_PREFIX ": u1H2CPwrModeParm:", DUMP_PREFIX_NONE,
+			     16, 1, u1H2CPwrModeParm, H2C_PWRMODE_LEN, false);
 
 	FillH2CCmd8723B(padapter, H2C_8723B_SET_PWR_MODE, H2C_PWRMODE_LEN, u1H2CPwrModeParm);
 }
@@ -535,7 +544,8 @@ void rtl8723b_set_FwPsTuneParam_cmd(struct adapter *padapter)
 	SET_8723B_H2CCMD_PSTUNE_PARM_ADOPT(u1H2CPsTuneParm, 1);
 	SET_8723B_H2CCMD_PSTUNE_PARM_DTIM_PERIOD(u1H2CPsTuneParm, dtim_period);
 
-	RT_PRINT_DATA(_module_hal_init_c_, _drv_always_, "u1H2CPsTuneParm:", u1H2CPsTuneParm, H2C_PSTUNEPARAM_LEN);
+	print_hex_dump_debug(DRIVER_PREFIX ": u1H2CPsTuneParm:", DUMP_PREFIX_NONE,
+			     16, 1, u1H2CPsTuneParm, H2C_PSTUNEPARAM_LEN, false);
 
 	FillH2CCmd8723B(padapter, H2C_8723B_PS_TUNING_PARA, H2C_PSTUNEPARAM_LEN, u1H2CPsTuneParm);
 }
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
index 0081fe0a431f..0273118e70af 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
@@ -3676,7 +3676,8 @@ void C2HPacketHandler_8723B(struct adapter *padapter, u8 *pbuffer, u16 length)
 
 	/* DBG_871X("%s C2hEvent.CmdID:%x C2hEvent.CmdLen:%x C2hEvent.CmdSeq:%x\n", */
 	/* 		__func__, C2hEvent.CmdID, C2hEvent.CmdLen, C2hEvent.CmdSeq); */
-	RT_PRINT_DATA(_module_hal_init_c_, _drv_notice_, "C2HPacketHandler_8723B(): Command Content:\n", tmpBuf, C2hEvent.CmdLen);
+	print_hex_dump_debug(DRIVER_PREFIX ": C2HPacketHandler_8723B(): Command Content:\n",
+			     DUMP_PREFIX_NONE, 16, 1, tmpBuf, C2hEvent.CmdLen, false);
 
 	process_c2h_event(padapter, &C2hEvent, tmpBuf);
 	/* c2h_handler_8723b(padapter,&C2hEvent); */
-- 
2.20.1

