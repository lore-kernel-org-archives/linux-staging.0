Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8169C355F29
	for <linux-staging@lists.linux.dev>; Wed, 18 Mar 2026 17:45:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773855940; cv=none; b=uO2EXOHuX+0/QLy2I825ZnelETxOpnnVLiVcrvGtIKgeYF7LkC/Ujgo21sUQHx80HQ/MDsU7sKG/gvzRASEac8rUAMMWH2ClZ3qDJOZhdBxGtQyw3g0vUe/uTQ+udW5aqfdYhyE5tDcJ4yIBc/fPBuCZ9YdTf8f82e274g7T0HU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773855940; c=relaxed/simple;
	bh=U1gxl9Z5TINzkbQuOBc3NcgJZ62PxNWy0pkcJegQj2o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FUVKMXb+Nna8swDlgkKbEuYTfoumog+/v/+Y275zWlVgyiK1PpfJpQLuLzVnrCDdQ0T8DDiNYlJH56UC/yo8OhOJQZxgxBSlv/YX0zbAzrQ4mkLPrj/AEFagdQ2XxS0WwYjMLtNDyuwEWppezjVG+8T32juINDeHTPJMxuGq13c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KeUUmvLP; arc=none smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KeUUmvLP"
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-2bd9a485bd6so293157eec.1
        for <linux-staging@lists.linux.dev>; Wed, 18 Mar 2026 10:45:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773855932; x=1774460732; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=W6nR1fdNVOV6QH4eDboqGr9O4XnB7Uh0NiD4mn1VeZg=;
        b=KeUUmvLPTwZd/h+CTtNzrSMhStV+SlGZflms+yB9qNP+zsACMratAEHXFg+mBSDADR
         3Kszjoafra3kJ6Et7r2mC/UtrFwMZ0fISx//hfNjrI7HBrBGKGoj2DW5XNGVxbo7ffc0
         VWL3Hj7h/WPMZcbXa10a+nUz9CKXboT4es4m9OyJZk0Jlk2SRALF9oZEBuS2hEeMeOQz
         Oprrqk9T80h98wHRRsx1arW9tME/CosIAwW/cdPWnt3Wshs0AcSgLIY5tSnswFm9KfaI
         4muy+oN2vfcF9ChB1/fQPhWWhkcwjMReLITOvmrKDJMDKYDQBxU9miTLWc4XrwH67LrG
         FyIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773855932; x=1774460732;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W6nR1fdNVOV6QH4eDboqGr9O4XnB7Uh0NiD4mn1VeZg=;
        b=OBrZUzo9o0OJWi6TJFFBflLuwBHaqe1YZOcSp3MkIMQ8xDB22Rn4mMNEwfYtN2/X2W
         i/drk95oYUpGfT+rgi1xTl2n9Hrsk1ufJuFW9VtKBj0eEnTF4+ZSQ9JHPcbZqKFZO9z8
         dVuRqSGxkC8dyX5MLRltkpfOysdFfgapDznPx8f7ELRPh1DxVbIV7p+XvfX8BIAWF3i1
         4phFMA9kwpja5WZ/yUCrUU+ozHimTIsx57PKofgtMJ5Y9ILU33Dw+crSbG7zTT8o86Il
         5xKamJDMObuVZQP1QPLe1nq79SglVRlLo2lpEW3RyKTWOSXNR0Kq2vQ+hktoA10wHwcP
         td2w==
X-Gm-Message-State: AOJu0Yx83zVG3CwRRyEalzfRvhQ6egmRKFZokUaxCDx6Qx/glOAHQICh
	0yzy9L3w9oWisZYRN/WAPffuhR+IVTZnK2aKak+3rc4mG/8ftsVnB8Xg
X-Gm-Gg: ATEYQzx0lyR6Wm+eHxM0znGueAHO1iyGONtSJC/4XmgrQYQgu++TpQEvUwSEpqYT5m2
	5lHBn+ulpVaVXD+kCUFUeZphu/el7jdEeKCRCRgjJr+J/RzXbeogSM4XSwzeSrx/swZmi0ULawD
	KRMeFOtYYbZDJWukXk57VEdgm2kcrUHz5Muatx/gv1Kdun8FKSQC5uioowpzzojXZMUkaMGE/Eh
	XqR3aMdfk87YA7KPVb0Xuy7aAU/BWucdE4X60LTh6ojo6ZuYU0ycYv6iJqYfDvfsMiNCc6nnsZg
	lJXlezAJg11zP27p0mLbVsX1PkXIXmnWIxgDIQx4qldOrnoF+3dpkEnn/RTTwNrUGTUqnqNkv6G
	0qEDQuKU38rBEG8H6QRwQvGDfzGh4Xd5qP0LYmefl3BL5WwN9MneuPsZHdT5wbxS8zH1rLsE+tl
	3JaG+lW38egSmaLmAgrXInLRfdxKuMQOa5ufHQb9rNnMHUY9SCiq27pBYBudyptjzncXevnTNT3
	3w=
X-Received: by 2002:a05:7300:cd8d:b0:2be:22b0:8be7 with SMTP id 5a478bee46e88-2c0e5080669mr2463084eec.35.1773855931607;
        Wed, 18 Mar 2026 10:45:31 -0700 (PDT)
Received: from Malavya ([130.212.92.173])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c0e51dd413sm4991967eec.0.2026.03.18.10.45.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 10:45:30 -0700 (PDT)
From: Malavya Raval <malavyaraval@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Malavya Raval <malavyaraval@gmail.com>
Subject: [PATCH] staging: rtl8723bs: coding style cleanups
Date: Wed, 18 Mar 2026 10:44:46 -0700
Message-ID: <20260318174516.847-1-malavyaraval@gmail.com>
X-Mailer: git-send-email 2.53.0.windows.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Renaming CamelCase variables and macros to snake_case and fixing=0D
formatting issues in the rtl8723bs staging driver to align=0D
with kernel coding style standards.=0D
=0D
Signed-off-by: Malavya Raval <malavyaraval@gmail.com>=0D
=0D
---=0D
diff --git a/drivers/staging/rtl8723bs/core/rtw_ap.c b/drivers/staging/rtl8=
723bs/core/rtw_ap.c=0D
index 864cd8b6d..284c49bf4 100644=0D
--- a/drivers/staging/rtl8723bs/core/rtw_ap.c=0D
+++ b/drivers/staging/rtl8723bs/core/rtw_ap.c=0D
@@ -720,10 +720,10 @@ void start_bss_network(struct adapter *padapter)=0D
=0D
                /* disable dynamic functions, such as high power, DIG */=0D
                /* Save_DM_Func_Flag(padapter); */=0D
-               /* Switch_DM_Func(padapter, DYNAMIC_FUNC_DISABLE, false); *=
/=0D
+               /* switch_dm_func(padapter, DYNAMIC_FUNC_DISABLE, false); *=
/=0D
=0D
                /* turn on all dynamic functions */=0D
-               Switch_DM_Func(padapter, DYNAMIC_ALL_FUNC_ENABLE, true);=0D
+               switch_dm_func(padapter, DYNAMIC_ALL_FUNC_ENABLE, true);=0D
=0D
                /* rtw_hal_set_hwreg(padapter, HW_VAR_INITIAL_GAIN, (u8 *)(=
&initialgain)); */=0D
        }=0D
@@ -2001,7 +2001,7 @@ void rtw_ap_restore_network(struct adapter *padapter)=
=0D
=0D
                if (psta->state & _FW_LINKED) {=0D
                rtw_sta_media_status_rpt(padapter, psta, 1);=0D
-               Update_RA_Entry(padapter, psta);=0D
+               update_ra_entry(padapter, psta);=0D
                /* pairwise key */=0D
                /* per sta pairwise key and settings */=0D
                if ((psecuritypriv->dot11PrivacyAlgrthm =3D=3D _TKIP_) ||=0D
diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl=
8723bs/core/rtw_cmd.c=0D
index abb84f8ae..0bc78ee50 100644=0D
--- a/drivers/staging/rtl8723bs/core/rtw_cmd.c=0D
+++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c=0D
@@ -10,78 +10,78 @@=0D
 #include <linux/align.h>=0D
=0D
 static struct _cmd_callback rtw_cmd_callback[] =3D {=0D
-       {GEN_CMD_CODE(_Read_MACREG), NULL}, /*0*/=0D
-       {GEN_CMD_CODE(_Write_MACREG), NULL},=0D
-       {GEN_CMD_CODE(_Read_BBREG), &rtw_getbbrfreg_cmdrsp_callback},=0D
-       {GEN_CMD_CODE(_Write_BBREG), NULL},=0D
-       {GEN_CMD_CODE(_Read_RFREG), &rtw_getbbrfreg_cmdrsp_callback},=0D
-       {GEN_CMD_CODE(_Write_RFREG), NULL}, /*5*/=0D
-       {GEN_CMD_CODE(_Read_EEPROM), NULL},=0D
-       {GEN_CMD_CODE(_Write_EEPROM), NULL},=0D
-       {GEN_CMD_CODE(_Read_EFUSE), NULL},=0D
-       {GEN_CMD_CODE(_Write_EFUSE), NULL},=0D
-=0D
-       {GEN_CMD_CODE(_Read_CAM), NULL}, /*10*/=0D
-       {GEN_CMD_CODE(_Write_CAM), NULL},=0D
-       {GEN_CMD_CODE(_setBCNITV), NULL},=0D
-       {GEN_CMD_CODE(_setMBIDCFG), NULL},=0D
-       {GEN_CMD_CODE(_JoinBss), &rtw_joinbss_cmd_callback}, /*14*/=0D
-       {GEN_CMD_CODE(_DisConnect), &rtw_disassoc_cmd_callback}, /*15*/=0D
-       {GEN_CMD_CODE(_CreateBss), &rtw_createbss_cmd_callback},=0D
-       {GEN_CMD_CODE(_SetOpMode), NULL},=0D
-       {GEN_CMD_CODE(_SiteSurvey), &rtw_survey_cmd_callback}, /*18*/=0D
-       {GEN_CMD_CODE(_SetAuth), NULL},=0D
-=0D
-       {GEN_CMD_CODE(_SetKey), NULL}, /*20*/=0D
-       {GEN_CMD_CODE(_SetStaKey), &rtw_setstaKey_cmdrsp_callback},=0D
-       {GEN_CMD_CODE(_SetAssocSta), &rtw_setassocsta_cmdrsp_callback},=0D
-       {GEN_CMD_CODE(_DelAssocSta), NULL},=0D
-       {GEN_CMD_CODE(_SetStaPwrState), NULL},=0D
-       {GEN_CMD_CODE(_SetBasicRate), NULL}, /*25*/=0D
-       {GEN_CMD_CODE(_GetBasicRate), NULL},=0D
-       {GEN_CMD_CODE(_SetDataRate), NULL},=0D
-       {GEN_CMD_CODE(_GetDataRate), NULL},=0D
-       {GEN_CMD_CODE(_SetPhyInfo), NULL},=0D
-=0D
-       {GEN_CMD_CODE(_GetPhyInfo), NULL}, /*30*/=0D
-       {GEN_CMD_CODE(_SetPhy), NULL},=0D
-       {GEN_CMD_CODE(_GetPhy), NULL},=0D
-       {GEN_CMD_CODE(_readRssi), NULL},=0D
-       {GEN_CMD_CODE(_readGain), NULL},=0D
-       {GEN_CMD_CODE(_SetAtim), NULL}, /*35*/=0D
-       {GEN_CMD_CODE(_SetPwrMode), NULL},=0D
-       {GEN_CMD_CODE(_JoinbssRpt), NULL},=0D
-       {GEN_CMD_CODE(_SetRaTable), NULL},=0D
-       {GEN_CMD_CODE(_GetRaTable), NULL},=0D
-=0D
-       {GEN_CMD_CODE(_GetCCXReport), NULL}, /*40*/=0D
-       {GEN_CMD_CODE(_GetDTMReport), NULL},=0D
-       {GEN_CMD_CODE(_GetTXRateStatistics), NULL},=0D
-       {GEN_CMD_CODE(_SetUsbSuspend), NULL},=0D
-       {GEN_CMD_CODE(_SetH2cLbk), NULL},=0D
-       {GEN_CMD_CODE(_AddBAReq), NULL}, /*45*/=0D
-       {GEN_CMD_CODE(_SetChannel), NULL}, /*46*/=0D
-       {GEN_CMD_CODE(_SetTxPower), NULL},=0D
-       {GEN_CMD_CODE(_SwitchAntenna), NULL},=0D
-       {GEN_CMD_CODE(_SetCrystalCap), NULL},=0D
-       {GEN_CMD_CODE(_SetSingleCarrierTx), NULL}, /*50*/=0D
-=0D
-       {GEN_CMD_CODE(_SetSingleToneTx), NULL}, /*51*/=0D
-       {GEN_CMD_CODE(_SetCarrierSuppressionTx), NULL},=0D
-       {GEN_CMD_CODE(_SetContinuousTx), NULL},=0D
-       {GEN_CMD_CODE(_SwitchBandwidth), NULL}, /*54*/=0D
-       {GEN_CMD_CODE(_TX_Beacon), NULL},/*55*/=0D
-=0D
-       {GEN_CMD_CODE(_Set_MLME_EVT), NULL},/*56*/=0D
-       {GEN_CMD_CODE(_Set_Drv_Extra), NULL},/*57*/=0D
-       {GEN_CMD_CODE(_Set_H2C_MSG), NULL},/*58*/=0D
-       {GEN_CMD_CODE(_SetChannelPlan), NULL},/*59*/=0D
-=0D
-       {GEN_CMD_CODE(_SetChannelSwitch), NULL},/*60*/=0D
-       {GEN_CMD_CODE(_TDLS), NULL},/*61*/=0D
-       {GEN_CMD_CODE(_ChkBMCSleepq), NULL}, /*62*/=0D
-=0D
-       {GEN_CMD_CODE(_RunInThreadCMD), NULL},/*63*/=0D
+       {GEN_CMD_CODE(_read_macreg), NULL}, /*0*/=0D
+       {GEN_CMD_CODE(_write_macreg), NULL},=0D
+       {GEN_CMD_CODE(_read_bbreg), &rtw_getbbrfreg_cmdrsp_callback},=0D
+       {GEN_CMD_CODE(_write_bbreg), NULL},=0D
+       {GEN_CMD_CODE(_read_rfreg), &rtw_getbbrfreg_cmdrsp_callback},=0D
+       {GEN_CMD_CODE(_write_rfreg), NULL}, /*5*/=0D
+       {GEN_CMD_CODE(_read_eeprom), NULL},=0D
+       {GEN_CMD_CODE(_write_eeprom), NULL},=0D
+       {GEN_CMD_CODE(_read_efuse), NULL},=0D
+       {GEN_CMD_CODE(_write_efuse), NULL},=0D
+=0D
+       {GEN_CMD_CODE(_read_cam), NULL}, /*10*/=0D
+       {GEN_CMD_CODE(_write_cam), NULL},=0D
+       {GEN_CMD_CODE(_set_bcn_itv), NULL},=0D
+       {GEN_CMD_CODE(_set_mbid_cfg), NULL},=0D
+       {GEN_CMD_CODE(_join_bss), &rtw_joinbss_cmd_callback}, /*14*/=0D
+       {GEN_CMD_CODE(_disconnect), &rtw_disassoc_cmd_callback}, /*15*/=0D
+       {GEN_CMD_CODE(_create_bss), &rtw_createbss_cmd_callback},=0D
+       {GEN_CMD_CODE(_set_op_mode), NULL},=0D
+       {GEN_CMD_CODE(_site_survey), &rtw_survey_cmd_callback}, /*18*/=0D
+       {GEN_CMD_CODE(_set_auth), NULL},=0D
+=0D
+       {GEN_CMD_CODE(_set_key), NULL}, /*20*/=0D
+       {GEN_CMD_CODE(_set_sta_key), &rtw_set_sta_key_cmdrsp_callback},=0D
+       {GEN_CMD_CODE(_set_assoc_sta), &rtw_setassocsta_cmdrsp_callback},=0D
+       {GEN_CMD_CODE(_del_assoc_sta), NULL},=0D
+       {GEN_CMD_CODE(_set_sta_pwr_state), NULL},=0D
+       {GEN_CMD_CODE(_set_basic_rate), NULL}, /*25*/=0D
+       {GEN_CMD_CODE(_get_basic_rate), NULL},=0D
+       {GEN_CMD_CODE(_set_data_rate), NULL},=0D
+       {GEN_CMD_CODE(_get_data_rate), NULL},=0D
+       {GEN_CMD_CODE(_set_phy_info), NULL},=0D
+=0D
+       {GEN_CMD_CODE(_get_phy_info), NULL}, /*30*/=0D
+       {GEN_CMD_CODE(_set_phy), NULL},=0D
+       {GEN_CMD_CODE(_get_phy), NULL},=0D
+       {GEN_CMD_CODE(_read_rssi), NULL},=0D
+       {GEN_CMD_CODE(_read_gain), NULL},=0D
+       {GEN_CMD_CODE(_set_atim), NULL}, /*35*/=0D
+       {GEN_CMD_CODE(_set_pwr_mode), NULL},=0D
+       {GEN_CMD_CODE(_join_bss_rpt), NULL},=0D
+       {GEN_CMD_CODE(_set_ra_table), NULL},=0D
+       {GEN_CMD_CODE(_get_ra_table), NULL},=0D
+=0D
+       {GEN_CMD_CODE(_get_ccx_report), NULL}, /*40*/=0D
+       {GEN_CMD_CODE(_get_dtm_report), NULL},=0D
+       {GEN_CMD_CODE(_get_tx_rate_statistics), NULL},=0D
+       {GEN_CMD_CODE(_set_usb_suspend), NULL},=0D
+       {GEN_CMD_CODE(_set_h2c_lbk), NULL},=0D
+       {GEN_CMD_CODE(_add_ba_req), NULL}, /*45*/=0D
+       {GEN_CMD_CODE(_set_channel), NULL}, /*46*/=0D
+       {GEN_CMD_CODE(_set_tx_power), NULL},=0D
+       {GEN_CMD_CODE(_switch_antenna), NULL},=0D
+       {GEN_CMD_CODE(_set_crystal_cap), NULL},=0D
+       {GEN_CMD_CODE(_set_single_carrier_tx), NULL}, /*50*/=0D
+=0D
+       {GEN_CMD_CODE(_set_single_tone_tx), NULL},/*51*/=0D
+       {GEN_CMD_CODE(_set_carrier_suppression_tx), NULL},=0D
+       {GEN_CMD_CODE(_set_continuous_tx), NULL},=0D
+       {GEN_CMD_CODE(_switch_bandwidth), NULL}, /*54*/=0D
+       {GEN_CMD_CODE(_tx_beacon), NULL},/*55*/=0D
+=0D
+       {GEN_CMD_CODE(_set_mlme_evt), NULL},/*56*/=0D
+       {GEN_CMD_CODE(_set_drv_extra), NULL},/*57*/=0D
+       {GEN_CMD_CODE(_set_h2c_msg), NULL},/*58*/=0D
+       {GEN_CMD_CODE(_set_channel_plan), NULL},/*59*/=0D
+=0D
+       {GEN_CMD_CODE(_set_channel_switch), NULL},/*60*/=0D
+       {GEN_CMD_CODE(_tdls), NULL},/*61*/=0D
+       {GEN_CMD_CODE(_chk_bmc_sleepq), NULL}, /*62*/=0D
+=0D
+       {GEN_CMD_CODE(_run_in_thread_cmd), NULL},/*63*/=0D
 };=0D
=0D
 static struct cmd_hdl wlancmds[] =3D {=0D
@@ -300,7 +300,7 @@ int rtw_cmd_filter(struct cmd_priv *pcmdpriv, struct cm=
d_obj *cmd_obj)=0D
 {=0D
        u8 bAllow =3D false; /* set to true to allow enqueuing cmd when hw_=
init_completed is false */=0D
=0D
-       if (cmd_obj->cmdcode =3D=3D GEN_CMD_CODE(_SetChannelPlan))=0D
+       if (cmd_obj->cmdcode =3D=3D GEN_CMD_CODE(_set_channel_plan))=0D
                bAllow =3D true;=0D
=0D
        if ((!pcmdpriv->padapter->hw_init_completed && !bAllow) ||=0D
@@ -342,8 +342,8 @@ struct cmd_obj *rtw_dequeue_cmd(struct cmd_priv *pcmdpr=
iv)=0D
=0D
 void rtw_free_cmd_obj(struct cmd_obj *pcmd)=0D
 {=0D
-       if ((pcmd->cmdcode !=3D _JoinBss_CMD_) &&=0D
-               (pcmd->cmdcode !=3D _CreateBss_CMD_)) {=0D
+       if ((pcmd->cmdcode !=3D _join_bss_CMD_) &&=0D
+               (pcmd->cmdcode !=3D _create_bss_CMD_)) {=0D
                /* free parmbuf in cmd_obj */=0D
                kfree(pcmd->parmbuf);=0D
        }=0D
@@ -500,7 +500,7 @@ int rtw_cmd_thread(void *context)=0D
                break;=0D
        }=0D
=0D
-       if (pcmd->cmdcode =3D=3D GEN_CMD_CODE(_Set_Drv_Extra)) {=0D
+       if (pcmd->cmdcode =3D=3D GEN_CMD_CODE(_set_drv_extra)) {=0D
                extra_parm =3D (struct drvextra_cmd_parm *)pcmd->parmbuf;=0D
                if (extra_parm->pbuf && extra_parm->size > 0)=0D
                        kfree(extra_parm->pbuf);=0D
@@ -545,7 +545,7 @@ u8 rtw_sitesurvey_cmd(struct adapter *padapter, struct =
ndis_802_11_ssid *ssid,=0D
=0D
        rtw_free_network_queue(padapter, false);=0D
=0D
-       init_h2fwcmd_w_parm_no_rsp(ph2c, psurveyPara, GEN_CMD_CODE(_SiteSur=
vey));=0D
+       init_h2fwcmd_w_parm_no_rsp(ph2c, psurveyPara, GEN_CMD_CODE(_site_su=
rvey));=0D
=0D
        /* psurveyPara->bsslimit =3D 48; */=0D
        psurveyPara->scan_mode =3D pmlmepriv->scan_mode;=0D
@@ -608,7 +608,7 @@ u8 rtw_createbss_cmd(struct adapter *padapter)=0D
        }=0D
=0D
        INIT_LIST_HEAD(&pcmd->list);=0D
-       pcmd->cmdcode =3D _CreateBss_CMD_;=0D
+       pcmd->cmdcode =3D _create_bss_CMD_;=0D
        pcmd->parmbuf =3D (unsigned char *)pdev_network;=0D
        pcmd->cmdsz =3D get_wlan_bssid_ex_sz((struct wlan_bssid_ex *)pdev_n=
etwork);=0D
        pcmd->rsp =3D NULL;=0D
@@ -641,7 +641,7 @@ int rtw_startbss_cmd(struct adapter *padapter, int flag=
s)=0D
        }=0D
=0D
        INIT_LIST_HEAD(&pcmd->list);=0D
-       pcmd->cmdcode =3D GEN_CMD_CODE(_CreateBss);=0D
+       pcmd->cmdcode =3D GEN_CMD_CODE(_create_bss);=0D
        pcmd->parmbuf =3D NULL;=0D
        pcmd->cmdsz =3D 0;=0D
        pcmd->rsp =3D NULL;=0D
@@ -776,7 +776,7 @@ u8 rtw_joinbss_cmd(struct adapter *padapter, struct wla=
n_network *pnetwork)=0D
        pcmd->cmdsz =3D get_wlan_bssid_ex_sz(psecnetwork);/* get cmdsz befo=
re endian conversion */=0D
=0D
        INIT_LIST_HEAD(&pcmd->list);=0D
-       pcmd->cmdcode =3D _JoinBss_CMD_;/* GEN_CMD_CODE(_JoinBss) */=0D
+       pcmd->cmdcode =3D _join_bss_CMD_;/* GEN_CMD_CODE(_join_bss) */=0D
        pcmd->parmbuf =3D (unsigned char *)psecnetwork;=0D
        pcmd->rsp =3D NULL;=0D
        pcmd->rspsz =3D 0;=0D
@@ -810,7 +810,7 @@ u8 rtw_disassoc_cmd(struct adapter *padapter, u32 deaut=
h_timeout_ms, bool enqueu=0D
        kfree(param);=0D
        goto exit;=0D
        }=0D
-       init_h2fwcmd_w_parm_no_rsp(cmdobj, param, _DisConnect_CMD_);=0D
+       init_h2fwcmd_w_parm_no_rsp(cmdobj, param, _disconnect_CMD_);=0D
        res =3D rtw_enqueue_cmd(cmdpriv, cmdobj);=0D
        } else {=0D
        /* no need to enqueue, do the cmd hdl directly and free cmd paramet=
er */=0D
@@ -846,7 +846,7 @@ u8 rtw_setopmode_cmd(struct adapter *padapter, enum ndi=
s_802_11_network_infrast=0D
        goto exit;=0D
        }=0D
=0D
-       init_h2fwcmd_w_parm_no_rsp(ph2c, psetop, _SetOpMode_CMD_);=0D
+       init_h2fwcmd_w_parm_no_rsp(ph2c, psetop, _set_op_mode_CMD_);=0D
        res =3D rtw_enqueue_cmd(pcmdpriv, ph2c);=0D
        } else {=0D
        setopmode_hdl(padapter, (u8 *)psetop);=0D
@@ -903,7 +903,7 @@ u8 rtw_setstakey_cmd(struct adapter *padapter, struct s=
ta_info *sta, u8 unicast_=0D
        goto exit;=0D
        }=0D
=0D
-       init_h2fwcmd_w_parm_no_rsp(ph2c, psetstakey_para, _SetStaKey_CMD_);=
=0D
+       init_h2fwcmd_w_parm_no_rsp(ph2c, psetstakey_para, _set_sta_key_CMD_=
);=0D
        ph2c->rsp =3D (u8 *)psetstakey_rsp;=0D
        ph2c->rspsz =3D sizeof(struct set_stakey_rsp);=0D
        res =3D rtw_enqueue_cmd(pcmdpriv, ph2c);=0D
@@ -954,7 +954,7 @@ u8 rtw_clearstakey_cmd(struct adapter *padapter, struct=
 sta_info *sta, u8 enqueu=0D
        goto exit;=0D
        }=0D
=0D
-       init_h2fwcmd_w_parm_no_rsp(ph2c, psetstakey_para, _SetStaKey_CMD_);=
=0D
+       init_h2fwcmd_w_parm_no_rsp(ph2c, psetstakey_para, _set_sta_key_CMD_=
);=0D
        ph2c->rsp =3D (u8 *)psetstakey_rsp;=0D
        ph2c->rspsz =3D sizeof(struct set_stakey_rsp);=0D
=0D
@@ -992,7 +992,7 @@ u8 rtw_addbareq_cmd(struct adapter *padapter, u8 tid, u=
8 *addr)=0D
        paddbareq_parm->tid =3D tid;=0D
        memcpy(paddbareq_parm->addr, addr, ETH_ALEN);=0D
=0D
-       init_h2fwcmd_w_parm_no_rsp(ph2c, paddbareq_parm, GEN_CMD_CODE(_AddB=
AReq));=0D
+       init_h2fwcmd_w_parm_no_rsp(ph2c, paddbareq_parm, GEN_CMD_CODE(_add_=
ba_req));=0D
=0D
        /* rtw_enqueue_cmd(pcmdpriv, ph2c); */=0D
        res =3D rtw_enqueue_cmd(pcmdpriv, ph2c);=0D
@@ -1027,7 +1027,7 @@ u8 rtw_reset_securitypriv_cmd(struct adapter *padapte=
r)=0D
        pdrvextra_cmd_parm->size =3D 0;=0D
        pdrvextra_cmd_parm->pbuf =3D NULL;=0D
=0D
-       init_h2fwcmd_w_parm_no_rsp(ph2c, pdrvextra_cmd_parm, GEN_CMD_CODE(_=
Set_Drv_Extra));=0D
+       init_h2fwcmd_w_parm_no_rsp(ph2c, pdrvextra_cmd_parm, GEN_CMD_CODE(_=
set_drv_extra));=0D
=0D
        /* rtw_enqueue_cmd(pcmdpriv, ph2c); */=0D
        res =3D rtw_enqueue_cmd(pcmdpriv, ph2c);=0D
@@ -1060,7 +1060,7 @@ u8 rtw_free_assoc_resources_cmd(struct adapter *padap=
ter)=0D
        pdrvextra_cmd_parm->size =3D 0;=0D
        pdrvextra_cmd_parm->pbuf =3D NULL;=0D
=0D
-       init_h2fwcmd_w_parm_no_rsp(ph2c, pdrvextra_cmd_parm, GEN_CMD_CODE(_=
Set_Drv_Extra));=0D
+       init_h2fwcmd_w_parm_no_rsp(ph2c, pdrvextra_cmd_parm, GEN_CMD_CODE(_=
set_drv_extra));=0D
=0D
        /* rtw_enqueue_cmd(pcmdpriv, ph2c); */=0D
        res =3D rtw_enqueue_cmd(pcmdpriv, ph2c);=0D
@@ -1093,7 +1093,7 @@ u8 rtw_dynamic_chk_wk_cmd(struct adapter *padapter)=0D
        pdrvextra_cmd_parm->type =3D 0;=0D
        pdrvextra_cmd_parm->size =3D 0;=0D
        pdrvextra_cmd_parm->pbuf =3D NULL;=0D
-       init_h2fwcmd_w_parm_no_rsp(ph2c, pdrvextra_cmd_parm, GEN_CMD_CODE(_=
Set_Drv_Extra));=0D
+       init_h2fwcmd_w_parm_no_rsp(ph2c, pdrvextra_cmd_parm, GEN_CMD_CODE(_=
set_drv_extra));=0D
=0D
        /* rtw_enqueue_cmd(pcmdpriv, ph2c); */=0D
        res =3D rtw_enqueue_cmd(pcmdpriv, ph2c);=0D
@@ -1173,21 +1173,21 @@ u8 traffic_status_watchdog(struct adapter *padapter=
, u8 from_timer)=0D
        bEnterPS =3D false;=0D
=0D
        if (bBusyTraffic) {=0D
-       if (pmlmepriv->LinkDetectInfo.TrafficTransitionCount <=3D 4)=0D
-       pmlmepriv->LinkDetectInfo.TrafficTransitionCount =3D 4;=0D
+       if (pmlmepriv->LinkDetectInfo.traffic_transition_count <=3D 4)=0D
+       pmlmepriv->LinkDetectInfo.traffic_transition_count =3D 4;=0D
=0D
-       pmlmepriv->LinkDetectInfo.TrafficTransitionCount++;=0D
+       pmlmepriv->LinkDetectInfo.traffic_transition_count++;=0D
=0D
-       if (pmlmepriv->LinkDetectInfo.TrafficTransitionCount > 30/*TrafficT=
ransitionLevel*/)=0D
-       pmlmepriv->LinkDetectInfo.TrafficTransitionCount =3D 30;=0D
+       if (pmlmepriv->LinkDetectInfo.traffic_transition_count > 30/*Traffi=
cTransitionLevel*/)=0D
+       pmlmepriv->LinkDetectInfo.traffic_transition_count =3D 30;=0D
        }=0D
        } else {=0D
-       if (pmlmepriv->LinkDetectInfo.TrafficTransitionCount >=3D 2)=0D
-       pmlmepriv->LinkDetectInfo.TrafficTransitionCount -=3D 2;=0D
+       if (pmlmepriv->LinkDetectInfo.traffic_transition_count >=3D 2)=0D
+       pmlmepriv->LinkDetectInfo.traffic_transition_count -=3D 2;=0D
        else=0D
-       pmlmepriv->LinkDetectInfo.TrafficTransitionCount =3D 0;=0D
+       pmlmepriv->LinkDetectInfo.traffic_transition_count =3D 0;=0D
=0D
-       if (pmlmepriv->LinkDetectInfo.TrafficTransitionCount =3D=3D 0)=0D
+       if (pmlmepriv->LinkDetectInfo.traffic_transition_count =3D=3D 0)=0D
        bEnterPS =3D true;=0D
        }=0D
=0D
@@ -1335,7 +1335,7 @@ u8 rtw_lps_ctrl_wk_cmd(struct adapter *padapter, u8 l=
ps_ctrl_type, u8 enqueue)=0D
        pdrvextra_cmd_parm->size =3D 0;=0D
        pdrvextra_cmd_parm->pbuf =3D NULL;=0D
=0D
-       init_h2fwcmd_w_parm_no_rsp(ph2c, pdrvextra_cmd_parm, GEN_CMD_CODE(_=
Set_Drv_Extra));=0D
+       init_h2fwcmd_w_parm_no_rsp(ph2c, pdrvextra_cmd_parm, GEN_CMD_CODE(_=
set_drv_extra));=0D
=0D
        res =3D rtw_enqueue_cmd(pcmdpriv, ph2c);=0D
        } else {=0D
@@ -1376,7 +1376,7 @@ u8 rtw_dm_in_lps_wk_cmd(struct adapter *padapter)=0D
        pdrvextra_cmd_parm->size =3D 0;=0D
        pdrvextra_cmd_parm->pbuf =3D NULL;=0D
=0D
-       init_h2fwcmd_w_parm_no_rsp(ph2c, pdrvextra_cmd_parm, GEN_CMD_CODE(_=
Set_Drv_Extra));=0D
+       init_h2fwcmd_w_parm_no_rsp(ph2c, pdrvextra_cmd_parm, GEN_CMD_CODE(_=
set_drv_extra));=0D
=0D
        res =3D rtw_enqueue_cmd(pcmdpriv, ph2c);=0D
=0D
@@ -1438,7 +1438,7 @@ u8 rtw_dm_ra_mask_wk_cmd(struct adapter *padapter, u8=
 *psta)=0D
        pdrvextra_cmd_parm->size =3D 0;=0D
        pdrvextra_cmd_parm->pbuf =3D psta;=0D
=0D
-       init_h2fwcmd_w_parm_no_rsp(ph2c, pdrvextra_cmd_parm, GEN_CMD_CODE(_=
Set_Drv_Extra));=0D
+       init_h2fwcmd_w_parm_no_rsp(ph2c, pdrvextra_cmd_parm, GEN_CMD_CODE(_=
set_drv_extra));=0D
=0D
        res =3D rtw_enqueue_cmd(pcmdpriv, ph2c);=0D
=0D
@@ -1471,7 +1471,7 @@ u8 rtw_ps_cmd(struct adapter *padapter)=0D
        pdrvextra_cmd_parm->type =3D 0;=0D
        pdrvextra_cmd_parm->size =3D 0;=0D
        pdrvextra_cmd_parm->pbuf =3D NULL;=0D
-       init_h2fwcmd_w_parm_no_rsp(ppscmd, pdrvextra_cmd_parm, GEN_CMD_CODE=
(_Set_Drv_Extra));=0D
+       init_h2fwcmd_w_parm_no_rsp(ppscmd, pdrvextra_cmd_parm, GEN_CMD_CODE=
(_set_drv_extra));=0D
=0D
        res =3D rtw_enqueue_cmd(pcmdpriv, ppscmd);=0D
=0D
@@ -1542,7 +1542,7 @@ u8 rtw_chk_hi_queue_cmd(struct adapter *padapter)=0D
        pdrvextra_cmd_parm->size =3D 0;=0D
        pdrvextra_cmd_parm->pbuf =3D NULL;=0D
=0D
-       init_h2fwcmd_w_parm_no_rsp(ph2c, pdrvextra_cmd_parm, GEN_CMD_CODE(_=
Set_Drv_Extra));=0D
+       init_h2fwcmd_w_parm_no_rsp(ph2c, pdrvextra_cmd_parm, GEN_CMD_CODE(_=
set_drv_extra));=0D
=0D
        res =3D rtw_enqueue_cmd(pcmdpriv, ph2c);=0D
=0D
@@ -1554,14 +1554,14 @@ struct btinfo {=0D
        u8 cid;=0D
        u8 len;=0D
=0D
-       u8 bConnection:1;=0D
-       u8 bSCOeSCO:1;=0D
-       u8 bInQPage:1;=0D
-       u8 bACLBusy:1;=0D
-       u8 bSCOBusy:1;=0D
-       u8 bHID:1;=0D
-       u8 bA2DP:1;=0D
-       u8 bFTP:1;=0D
+       u8 is_connection:1;=0D
+       u8 is_sco_esco:1;=0D
+       u8 is_in_q_page:1;=0D
+       u8 is_acl_busy:1;=0D
+       u8 is_sco_busy:1;=0D
+       u8 is_hid:1;=0D
+       u8 is_a2dp:1;=0D
+       u8 is_ftp:1;=0D
=0D
        u8 retry_cnt:4;=0D
        u8 rsvd_34:1;=0D
@@ -1634,7 +1634,7 @@ u8 rtw_c2h_packet_wk_cmd(struct adapter *padapter, u8=
 *pbuf, u16 length)=0D
        pdrvextra_cmd_parm->size =3D length;=0D
        pdrvextra_cmd_parm->pbuf =3D pbuf;=0D
=0D
-       init_h2fwcmd_w_parm_no_rsp(ph2c, pdrvextra_cmd_parm, GEN_CMD_CODE(_=
Set_Drv_Extra));=0D
+       init_h2fwcmd_w_parm_no_rsp(ph2c, pdrvextra_cmd_parm, GEN_CMD_CODE(_=
set_drv_extra));=0D
=0D
        res =3D rtw_enqueue_cmd(pcmdpriv, ph2c);=0D
=0D
@@ -1669,7 +1669,7 @@ u8 rtw_c2h_wk_cmd(struct adapter *padapter, u8 *c2h_e=
vt)=0D
        pdrvextra_cmd_parm->size =3D c2h_evt ? 16 : 0;=0D
        pdrvextra_cmd_parm->pbuf =3D c2h_evt;=0D
=0D
-       init_h2fwcmd_w_parm_no_rsp(ph2c, pdrvextra_cmd_parm, GEN_CMD_CODE(_=
Set_Drv_Extra));=0D
+       init_h2fwcmd_w_parm_no_rsp(ph2c, pdrvextra_cmd_parm, GEN_CMD_CODE(_=
set_drv_extra));=0D
=0D
        res =3D rtw_enqueue_cmd(pcmdpriv, ph2c);=0D
=0D
@@ -1882,7 +1882,7 @@ void rtw_createbss_cmd_callback(struct adapter *padap=
ter, struct cmd_obj *pcmd)=0D
        rtw_free_cmd_obj(pcmd);=0D
        }=0D
=0D
-void rtw_setstaKey_cmdrsp_callback(struct adapter *padapter, struct cmd_ob=
j *pcmd)=0D
+void rtw_set_sta_key_cmdrsp_callback(struct adapter *padapter, struct cmd_=
obj *pcmd)=0D
 {=0D
        struct sta_priv *pstapriv =3D &padapter->stapriv;=0D
        struct set_stakey_rsp *psetstakey_rsp =3D (struct set_stakey_rsp *)=
(pcmd->rsp);=0D
diff --git a/drivers/staging/rtl8723bs/core/rtw_io.c b/drivers/staging/rtl8=
723bs/core/rtw_io.c=0D
index 965c3cfea..75fa48ab8 100644=0D
--- a/drivers/staging/rtl8723bs/core/rtw_io.c=0D
+++ b/drivers/staging/rtl8723bs/core/rtw_io.c=0D
@@ -75,6 +75,7 @@ int rtw_write8(struct adapter *adapter, u32 addr, u8 val)=
=0D
=0D
        return RTW_STATUS_CODE(ret);=0D
        }=0D
+=0D
 int rtw_write16(struct adapter *adapter, u32 addr, u16 val)=0D
 {=0D
        /* struct io_queue *pio_queue =3D (struct io_queue *)adapter->pio_q=
ueue; */=0D
@@ -88,6 +89,7 @@ int rtw_write16(struct adapter *adapter, u32 addr, u16 va=
l)=0D
        ret =3D _write16(pintfhdl, addr, val);=0D
        return RTW_STATUS_CODE(ret);=0D
        }=0D
+=0D
 int rtw_write32(struct adapter *adapter, u32 addr, u32 val)=0D
 {=0D
        /* struct io_queue *pio_queue =3D (struct io_queue *)adapter->pio_q=
ueue; */=0D
@@ -114,7 +116,9 @@ u32 rtw_write_port(struct adapter *adapter, u32 addr, u=
32 cnt, u8 *pmem)=0D
        return _write_port(pintfhdl, addr, cnt, pmem);=0D
        }=0D
=0D
-int rtw_init_io_priv(struct adapter *padapter, void (*set_intf_ops)(struct=
 adapter *padapter, struct _io_ops *pops))=0D
+int rtw_init_io_priv(struct adapter *padapter,=0D
+       void (*set_intf_ops)(struct adapter *padapter,=0D
+       struct _io_ops *pops))=0D
 {=0D
        struct io_priv *piopriv =3D &padapter->iopriv;=0D
        struct intf_hdl *pintf =3D &piopriv->intf;=0D
@@ -132,7 +136,8 @@ int rtw_init_io_priv(struct adapter *padapter, void (*s=
et_intf_ops)(struct adapt=0D
        }=0D
=0D
        /*=0D
-        * Increase and check if the continual_io_error of this @param dvob=
jprive is larger than MAX_CONTINUAL_IO_ERR=0D
+        * Increase and check if the continual_io_error of this @param dvob=
jprive is=0D
+        * larger than MAX_CONTINUAL_IO_ERR=0D
         * @return true:=0D
         * @return false:=0D
         */=0D
diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rt=
l8723bs/core/rtw_mlme.c=0D
index 1ef48bf65..b27a726d8 100644=0D
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c=0D
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c=0D
@@ -1174,7 +1174,7 @@ void rtw_joinbss_event_prehandle(struct adapter *adap=
ter, u8 *pbuf)=0D
=0D
        spin_lock_bh(&pmlmepriv->lock);=0D
=0D
-       pmlmepriv->LinkDetectInfo.TrafficTransitionCount =3D 0;=0D
+       pmlmepriv->LinkDetectInfo.traffic_transition_count =3D 0;=0D
        pmlmepriv->LinkDetectInfo.LowPowerTransitionCount =3D 0;=0D
=0D
        if (pnetwork->join_res > 0) {=0D
diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/stagin=
g/rtl8723bs/core/rtw_mlme_ext.c=0D
index b1f20aa81..69c056243 100644=0D
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c=0D
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c=0D
@@ -11,16 +11,16 @@=0D
 #include <linux/unaligned.h>=0D
=0D
 static struct mlme_handler mlme_sta_tbl[] =3D {=0D
-       {WIFI_ASSOCREQ, "OnAssocReq", &OnAssocReq},=0D
-       {WIFI_ASSOCRSP, "OnAssocRsp", &OnAssocRsp},=0D
-       {WIFI_REASSOCREQ, "OnReAssocReq", &OnAssocReq},=0D
-       {WIFI_REASSOCRSP, "OnReAssocRsp", &OnAssocRsp},=0D
-       {WIFI_PROBEREQ, "OnProbeReq", &OnProbeReq},=0D
-       {WIFI_PROBERSP, "OnProbeRsp", &OnProbeRsp},=0D
+       {WIFI_ASSOCREQ, "on_assoc_req", &on_assoc_req},=0D
+       {WIFI_ASSOCRSP, "on_assoc_rsp", &on_assoc_rsp},=0D
+       {WIFI_REASSOCREQ, "OnReAssocReq", &on_assoc_req},=0D
+       {WIFI_REASSOCRSP, "OnReAssocRsp", &on_assoc_rsp},=0D
+       {WIFI_PROBEREQ, "on_probe_req", &on_probe_req},=0D
+       {WIFI_PROBERSP, "on_probe_rsp", &on_probe_rsp},=0D
=0D
        /* below 2 are reserved */=0D
-       {0, "DoReserved", &DoReserved},=0D
-       {0, "DoReserved", &DoReserved},=0D
+       {0, "do_reserved", &do_reserved},=0D
+       {0, "do_reserved", &do_reserved},=0D
        {WIFI_BEACON, "OnBeacon", &OnBeacon},=0D
        {WIFI_ATIM, "OnATIM", &OnAtim},=0D
        {WIFI_DISASSOC, "OnDisassoc", &OnDisassoc},=0D
@@ -32,18 +32,18 @@ static struct mlme_handler mlme_sta_tbl[] =3D {=0D
=0D
 static struct action_handler OnAction_tbl[] =3D {=0D
        {RTW_WLAN_CATEGORY_SPECTRUM_MGMT, "ACTION_SPECTRUM_MGMT", on_action=
_spct},=0D
-       {RTW_WLAN_CATEGORY_QOS, "ACTION_QOS", &DoReserved},=0D
-       {RTW_WLAN_CATEGORY_DLS, "ACTION_DLS", &DoReserved},=0D
+       {RTW_WLAN_CATEGORY_QOS, "ACTION_QOS", &do_reserved},=0D
+       {RTW_WLAN_CATEGORY_DLS, "ACTION_DLS", &do_reserved},=0D
        {RTW_WLAN_CATEGORY_BACK, "ACTION_BACK", &OnAction_back},=0D
        {RTW_WLAN_CATEGORY_PUBLIC, "ACTION_PUBLIC", on_action_public},=0D
-       {RTW_WLAN_CATEGORY_RADIO_MEASUREMENT, "ACTION_RADIO_MEASUREMENT", &=
DoReserved},=0D
-       {RTW_WLAN_CATEGORY_FT, "ACTION_FT", &DoReserved},=0D
+       {RTW_WLAN_CATEGORY_RADIO_MEASUREMENT, "ACTION_RADIO_MEASUREMENT", &=
do_reserved},=0D
+       {RTW_WLAN_CATEGORY_FT, "ACTION_FT", &do_reserved},=0D
        {RTW_WLAN_CATEGORY_HT, "ACTION_HT", &OnAction_ht},=0D
        {RTW_WLAN_CATEGORY_SA_QUERY, "ACTION_SA_QUERY", &OnAction_sa_query}=
,=0D
-       {RTW_WLAN_CATEGORY_UNPROTECTED_WNM, "ACTION_UNPROTECTED_WNM", &DoRe=
served},=0D
-       {RTW_WLAN_CATEGORY_SELF_PROTECTED, "ACTION_SELF_PROTECTED", &DoRese=
rved},=0D
-       {RTW_WLAN_CATEGORY_WMM, "ACTION_WMM", &DoReserved},=0D
-       {RTW_WLAN_CATEGORY_P2P, "ACTION_P2P", &DoReserved},=0D
+       {RTW_WLAN_CATEGORY_UNPROTECTED_WNM, "ACTION_UNPROTECTED_WNM", &do_r=
eserved},=0D
+       {RTW_WLAN_CATEGORY_SELF_PROTECTED, "ACTION_SELF_PROTECTED", &do_res=
erved},=0D
+       {RTW_WLAN_CATEGORY_wmm, "ACTION_wmm", &do_reserved},=0D
+       {RTW_WLAN_CATEGORY_P2P, "ACTION_P2P", &do_reserved},=0D
 };=0D
=0D
 static u8 null_addr[ETH_ALEN] =3D {0, 0, 0, 0, 0, 0};=0D
@@ -496,7 +496,7 @@ void mgt_dispatcher(struct adapter *padapter, union rec=
v_frame *precv_frame)=0D
=0D
        /* Following are the callback functions for each subtype of the man=
agement frames */=0D
=0D
-unsigned int OnProbeReq(struct adapter *padapter, union recv_frame *precv_=
frame)=0D
+unsigned int on_probe_req(struct adapter *padapter, union recv_frame *prec=
v_frame)=0D
 {=0D
        unsigned int ielen;=0D
        unsigned char *p;=0D
@@ -541,7 +541,7 @@ unsigned int OnProbeReq(struct adapter *padapter, union=
 recv_frame *precv_frame)=0D
=0D
        }=0D
=0D
-unsigned int OnProbeRsp(struct adapter *padapter, union recv_frame *precv_=
frame)=0D
+unsigned int on_probe_rsp(struct adapter *padapter, union recv_frame *prec=
v_frame)=0D
 {=0D
        struct mlme_ext_priv *pmlmeext =3D &padapter->mlmeextpriv;=0D
=0D
@@ -926,7 +926,7 @@ unsigned int OnAuthClient(struct adapter *padapter, uni=
on recv_frame *precv_fram=0D
=0D
        }=0D
=0D
-unsigned int OnAssocReq(struct adapter *padapter, union recv_frame *precv_=
frame)=0D
+unsigned int on_assoc_req(struct adapter *padapter, union recv_frame *prec=
v_frame)=0D
 {=0D
        u16 capab_info;=0D
        struct rtw_ieee802_11_elems elems;=0D
@@ -1352,7 +1352,7 @@ unsigned int OnAssocReq(struct adapter *padapter, uni=
on recv_frame *precv_frame)=0D
        return _FAIL;=0D
        }=0D
=0D
-unsigned int OnAssocRsp(struct adapter *padapter, union recv_frame *precv_=
frame)=0D
+unsigned int on_assoc_rsp(struct adapter *padapter, union recv_frame *prec=
v_frame)=0D
 {=0D
        uint i;=0D
        int res;=0D
@@ -1643,20 +1643,20 @@ unsigned int OnAction_back(struct adapter *padapter=
, union recv_frame *precv_fra=0D
=0D
        action =3D frame_body[1];=0D
        switch (action) {=0D
-       case WLAN_ACTION_ADDBA_REQ: /* ADDBA request */=0D
+       case WLAN_ACTION_ADD_BA_REQ: /* ADDBA request */=0D
=0D
        memcpy(&(pmlmeinfo->ADDBA_req), &(frame_body[2]), sizeof(struct ADD=
BA_request));=0D
        /* process_addba_req(padapter, (u8 *)&(pmlmeinfo->ADDBA_req), GetAd=
dr3Ptr(pframe)); */=0D
        process_addba_req(padapter, (u8 *)&(pmlmeinfo->ADDBA_req), addr);=0D
=0D
        if (pmlmeinfo->accept_addba_req)=0D
-       issue_action_BA(padapter, addr, WLAN_ACTION_ADDBA_RESP, 0);=0D
+       issue_action_BA(padapter, addr, WLAN_ACTION_ADD_BA_RESP, 0);=0D
        else=0D
-       issue_action_BA(padapter, addr, WLAN_ACTION_ADDBA_RESP, 37);/* reje=
ct ADDBA Req */=0D
+       issue_action_BA(padapter, addr, WLAN_ACTION_ADD_BA_RESP, 37);/* rej=
ect ADDBA Req */=0D
=0D
        break;=0D
=0D
-       case WLAN_ACTION_ADDBA_RESP: /* ADDBA response */=0D
+       case WLAN_ACTION_ADD_BA_RESP: /* ADDBA response */=0D
        status =3D get_unaligned_le16(&frame_body[3]);=0D
        tid =3D ((frame_body[5] >> 2) & 0x7);=0D
=0D
@@ -1880,7 +1880,7 @@ unsigned int OnAction(struct adapter *padapter, union=
 recv_frame *precv_frame)=0D
=0D
        }=0D
=0D
-unsigned int DoReserved(struct adapter *padapter, union recv_frame *precv_=
frame)=0D
+unsigned int do_reserved(struct adapter *padapter, union recv_frame *precv=
_frame)=0D
 {=0D
        return _SUCCESS;=0D
        }=0D
@@ -3023,12 +3023,12 @@ static int _issue_nulldata(struct adapter *padapter=
, unsigned char *da,=0D
        *(fctrl) =3D 0;=0D
=0D
        if ((pmlmeinfo->state&0x03) =3D=3D WIFI_FW_AP_STATE)=0D
-       SetFrDs(fctrl);=0D
+       set_fr_ds(fctrl);=0D
        else if ((pmlmeinfo->state&0x03) =3D=3D WIFI_FW_STATION_STATE)=0D
-       SetToDs(fctrl);=0D
+       set_to_ds(fctrl);=0D
=0D
        if (power_mode)=0D
-       SetPwrMgt(fctrl);=0D
+       set_pwr_mgt(fctrl);=0D
=0D
        memcpy(pwlanhdr->addr1, da, ETH_ALEN);=0D
        memcpy(pwlanhdr->addr2, myid(&(padapter->eeprompriv)), ETH_ALEN);=0D
@@ -3167,17 +3167,17 @@ static int _issue_qos_nulldata(struct adapter *pada=
pter, unsigned char *da,=0D
        *(fctrl) =3D 0;=0D
=0D
        if ((pmlmeinfo->state&0x03) =3D=3D WIFI_FW_AP_STATE)=0D
-       SetFrDs(fctrl);=0D
+       set_fr_ds(fctrl);=0D
        else if ((pmlmeinfo->state&0x03) =3D=3D WIFI_FW_STATION_STATE)=0D
-       SetToDs(fctrl);=0D
+       set_to_ds(fctrl);=0D
=0D
        qc =3D (unsigned short *)(pframe + pattrib->hdrlen - 2);=0D
=0D
-       SetPriority(qc, tid);=0D
+       set_priority(qc, tid);=0D
=0D
-       SetEOSP(qc, pattrib->eosp);=0D
+       set_eosp(qc, pattrib->eosp);=0D
=0D
-       SetAckpolicy(qc, pattrib->ack_policy);=0D
+       set_ack_policy(qc, pattrib->ack_policy);=0D
=0D
        memcpy(pwlanhdr->addr1, da, ETH_ALEN);=0D
        memcpy(pwlanhdr->addr2, myid(&(padapter->eeprompriv)), ETH_ALEN);=0D
@@ -3466,11 +3466,11 @@ void issue_action_BA(struct adapter *padapter, unsi=
gned char *raddr, unsigned ch=0D
        /* A-MSDU NOT Supported */=0D
        BA_para_set =3D 0;=0D
        /* immediate Block Ack */=0D
-       BA_para_set |=3D BIT(1) & IEEE80211_ADDBA_PARAM_POLICY_MASK;=0D
+       BA_para_set |=3D BIT(1) & IEEE80211_add_ba_PARAM_POLICY_MASK;=0D
        /* TID */=0D
-       BA_para_set |=3D (status << 2) & IEEE80211_ADDBA_PARAM_TID_MASK;=0D
+       BA_para_set |=3D (status << 2) & IEEE80211_add_ba_PARAM_TID_MASK;=0D
        /* max buffer size is 8 MSDU */=0D
-       BA_para_set |=3D (8 << 6) & IEEE80211_ADDBA_PARAM_BUF_SIZE_MASK;=0D
+       BA_para_set |=3D (8 << 6) & IEEE80211_add_ba_PARAM_BUF_SIZE_MASK;=0D
        } else {=0D
        BA_para_set =3D (0x1002 | ((status & 0xf) << 2)); /* immediate ack =
& 64 buffer size */=0D
        }=0D
@@ -3519,8 +3519,8 @@ void issue_action_BA(struct adapter *padapter, unsign=
ed char *raddr, unsigned ch=0D
        if (hal_btcoex_IsBTCoexCtrlAMPDUSize(padapter) &&=0D
        padapter->driver_rx_ampdu_factor =3D=3D 0xFF) {=0D
        /* max buffer size is 8 MSDU */=0D
-       BA_para_set &=3D ~IEEE80211_ADDBA_PARAM_BUF_SIZE_MASK;=0D
-       BA_para_set |=3D (8 << 6) & IEEE80211_ADDBA_PARAM_BUF_SIZE_MASK;=0D
+       BA_para_set &=3D ~IEEE80211_add_ba_PARAM_BUF_SIZE_MASK;=0D
+       BA_para_set |=3D (8 << 6) & IEEE80211_add_ba_PARAM_BUF_SIZE_MASK;=0D
        }=0D
=0D
        if (pregpriv->ampdu_amsdu =3D=3D 0)/* disabled */=0D
@@ -3567,7 +3567,7 @@ static void issue_action_BSSCoexistPacket(struct adap=
ter *padapter)=0D
        struct mlme_ext_priv *pmlmeext =3D &(padapter->mlmeextpriv);=0D
        struct mlme_ext_info *pmlmeinfo =3D &pmlmeext->mlmext_info;=0D
        struct __queue *queue =3D &(pmlmepriv->scanned_queue);=0D
-       u8 InfoContent[16] =3D {0};=0D
+       u8 info_content[16] =3D {0};=0D
        u8 ICS[8][15];=0D
=0D
        if ((pmlmepriv->num_FortyMHzIntolerant =3D=3D 0) || (pmlmepriv->num=
_sta_no_ht =3D=3D 0))=0D
@@ -3668,8 +3668,8 @@ static void issue_action_BSSCoexistPacket(struct adap=
ter *padapter)=0D
        if (ICS[i][0] !=3D 1)=0D
        continue;=0D
=0D
-       InfoContent[k] =3D i;=0D
-       /* SET_BSS_INTOLERANT_ELE_REG_CLASS(InfoContent, i); */=0D
+       info_content[k] =3D i;=0D
+       /* SET_BSS_INTOLERANT_ELE_REG_CLASS(info_content, i); */=0D
        k++;=0D
=0D
        for (j =3D 1; j <=3D 14; j++) {=0D
@@ -3677,13 +3677,13 @@ static void issue_action_BSSCoexistPacket(struct ad=
apter *padapter)=0D
        continue;=0D
=0D
        if (k < 16) {=0D
-       InfoContent[k] =3D j; /* channel number */=0D
-       /* SET_BSS_INTOLERANT_ELE_CHANNEL(InfoContent+k, j); */=0D
+       info_content[k] =3D j; /* channel number */=0D
+       /* SET_BSS_INTOLERANT_ELE_CHANNEL(info_content+k, j); */=0D
        k++;=0D
        }=0D
        }=0D
=0D
-       pframe =3D rtw_set_ie(pframe, WLAN_EID_BSS_INTOLERANT_CHL_REPORT, k=
, InfoContent, &(pattrib->pktlen));=0D
+       pframe =3D rtw_set_ie(pframe, WLAN_EID_BSS_INTOLERANT_CHL_REPORT, k=
, info_content, &(pattrib->pktlen));=0D
=0D
        }=0D
=0D
@@ -3858,8 +3858,8 @@ void site_survey(struct adapter *padapter)=0D
        initialgain =3D 0xff; /* restore RX GAIN */=0D
        rtw_hal_set_hwreg(padapter, HW_VAR_INITIAL_GAIN, (u8 *)(&initialgai=
n));=0D
        /* turn on dynamic functions */=0D
-       Restore_DM_Func_Flag(padapter);=0D
-       /* Switch_DM_Func(padapter, DYNAMIC_ALL_FUNC_ENABLE, true); */=0D
+       restore_dm_func_flag(padapter);=0D
+       /* switch_dm_func(padapter, DYNAMIC_ALL_FUNC_ENABLE, true); */=0D
=0D
        if (is_client_associated_to_ap(padapter))=0D
        issue_nulldata(padapter, NULL, 0, 3, 500);=0D
@@ -3930,9 +3930,9 @@ u8 collect_bss_info(struct adapter *padapter, union r=
ecv_frame *precv_frame, str=0D
        memcpy(bssid->ies, (pframe + sizeof(struct ieee80211_hdr_3addr)), b=
ssid->ie_length);=0D
=0D
        /* get the signal strength */=0D
-       bssid->rssi =3D precv_frame->u.hdr.attrib.phy_info.RecvSignalPower;=
 /* in dBM.raw data */=0D
-       bssid->phy_info.signal_quality =3D precv_frame->u.hdr.attrib.phy_in=
fo.SignalQuality;/* in percentage */=0D
-       bssid->phy_info.signal_strength =3D precv_frame->u.hdr.attrib.phy_i=
nfo.SignalStrength;/* in percentage */=0D
+       bssid->rssi =3D precv_frame->u.hdr.attrib.phy_info.recv_signal_powe=
r; /* in dBM.raw data */=0D
+       bssid->phy_info.signal_quality =3D precv_frame->u.hdr.attrib.phy_in=
fo.signal_quality;/* in percentage */=0D
+       bssid->phy_info.signal_strength =3D precv_frame->u.hdr.attrib.phy_i=
nfo.signal_strength;/* in percentage */=0D
=0D
        /* checking SSID */=0D
        p =3D rtw_get_ie(bssid->ies + ie_offset, WLAN_EID_SSID, &len, bssid=
->ie_length - ie_offset);=0D
@@ -4398,7 +4398,7 @@ void report_survey_event(struct adapter *padapter, un=
ion recv_frame *precv_frame=0D
=0D
        pc2h_evt_hdr =3D (struct C2HEvent_Header *)(pevtcmd);=0D
        pc2h_evt_hdr->len =3D sizeof(struct survey_event);=0D
-       pc2h_evt_hdr->ID =3D GEN_EVT_CODE(_Survey);=0D
+       pc2h_evt_hdr->ID =3D GEN_EVT_CODE(_survey);=0D
        pc2h_evt_hdr->seq =3D atomic_inc_return(&pmlmeext->event_seq);=0D
=0D
        psurvey_evt =3D (struct survey_event *)(pevtcmd + sizeof(struct C2H=
Event_Header));=0D
@@ -4451,7 +4451,7 @@ void report_surveydone_event(struct adapter *padapter=
)=0D
=0D
        pc2h_evt_hdr =3D (struct C2HEvent_Header *)(pevtcmd);=0D
        pc2h_evt_hdr->len =3D sizeof(struct surveydone_event);=0D
-       pc2h_evt_hdr->ID =3D GEN_EVT_CODE(_SurveyDone);=0D
+       pc2h_evt_hdr->ID =3D GEN_EVT_CODE(_surveyDone);=0D
        pc2h_evt_hdr->seq =3D atomic_inc_return(&pmlmeext->event_seq);=0D
=0D
        psurveydone_evt =3D (struct surveydone_event *)(pevtcmd + sizeof(st=
ruct C2HEvent_Header));=0D
@@ -4545,7 +4545,7 @@ void report_wmm_edca_update(struct adapter *padapter)=
=0D
=0D
        pc2h_evt_hdr =3D (struct C2HEvent_Header *)(pevtcmd);=0D
        pc2h_evt_hdr->len =3D sizeof(struct wmm_event);=0D
-       pc2h_evt_hdr->ID =3D GEN_EVT_CODE(_WMM);=0D
+       pc2h_evt_hdr->ID =3D GEN_EVT_CODE(_wmm);=0D
        pc2h_evt_hdr->seq =3D atomic_inc_return(&pmlmeext->event_seq);=0D
=0D
        pwmm_event =3D (struct wmm_event *)(pevtcmd + sizeof(struct C2HEven=
t_Header));=0D
@@ -4591,7 +4591,7 @@ void report_del_sta_event(struct adapter *padapter, u=
nsigned char *MacAddr, unsi=0D
=0D
        pc2h_evt_hdr =3D (struct C2HEvent_Header *)(pevtcmd);=0D
        pc2h_evt_hdr->len =3D sizeof(struct stadel_event);=0D
-       pc2h_evt_hdr->ID =3D GEN_EVT_CODE(_DelSTA);=0D
+       pc2h_evt_hdr->ID =3D GEN_EVT_CODE(_del_sta);=0D
        pc2h_evt_hdr->seq =3D atomic_inc_return(&pmlmeext->event_seq);=0D
=0D
        pdel_sta_evt =3D (struct stadel_event *)(pevtcmd + sizeof(struct C2=
HEvent_Header));=0D
@@ -4642,7 +4642,7 @@ void report_add_sta_event(struct adapter *padapter, u=
nsigned char *MacAddr, int=0D
=0D
        pc2h_evt_hdr =3D (struct C2HEvent_Header *)(pevtcmd);=0D
        pc2h_evt_hdr->len =3D sizeof(struct stassoc_event);=0D
-       pc2h_evt_hdr->ID =3D GEN_EVT_CODE(_AddSTA);=0D
+       pc2h_evt_hdr->ID =3D GEN_EVT_CODE(_add_sta);=0D
        pc2h_evt_hdr->seq =3D atomic_inc_return(&pmlmeext->event_seq);=0D
=0D
        padd_sta_evt =3D (struct stassoc_event *)(pevtcmd + sizeof(struct C=
2HEvent_Header));=0D
@@ -4757,7 +4757,7 @@ static void rtw_mlmeext_disconnect(struct adapter *pa=
dapter)=0D
        timer_delete_sync(&pmlmeext->link_timer);=0D
=0D
        /* pmlmepriv->LinkDetectInfo.TrafficBusyState =3D false; */=0D
-       pmlmepriv->LinkDetectInfo.TrafficTransitionCount =3D 0;=0D
+       pmlmepriv->LinkDetectInfo.traffic_transition_count =3D 0;=0D
        pmlmepriv->LinkDetectInfo.LowPowerTransitionCount =3D 0;=0D
=0D
        }=0D
@@ -4785,7 +4785,7 @@ void mlmeext_joinbss_event_callback(struct adapter *p=
adapter, int join_res)=0D
=0D
=0D
        /* turn on dynamic functions */=0D
-       Switch_DM_Func(padapter, DYNAMIC_ALL_FUNC_ENABLE, true);=0D
+       switch_dm_func(padapter, DYNAMIC_ALL_FUNC_ENABLE, true);=0D
=0D
        /* update IOT-related issue */=0D
        update_IOT_info(padapter);=0D
@@ -4876,8 +4876,8 @@ void mlmeext_sta_add_event_callback(struct adapter *p=
adapter, struct sta_info *p=0D
=0D
        pmlmeinfo->FW_sta_info[psta->mac_id].psta =3D psta;=0D
=0D
-       psta->bssratelen =3D rtw_get_rateset_len(pmlmeinfo->FW_sta_info[pst=
a->mac_id].SupportedRates);=0D
-       memcpy(psta->bssrateset, pmlmeinfo->FW_sta_info[psta->mac_id].Suppo=
rtedRates, psta->bssratelen);=0D
+       psta->bssratelen =3D rtw_get_rateset_len(pmlmeinfo->FW_sta_info[pst=
a->mac_id].supported_rates);=0D
+       memcpy(psta->bssrateset, pmlmeinfo->FW_sta_info[psta->mac_id].suppo=
rted_rates, psta->bssratelen);=0D
=0D
        /* update adhoc sta_info */=0D
        update_sta_info(padapter, psta);=0D
@@ -4889,7 +4889,7 @@ void mlmeext_sta_add_event_callback(struct adapter *p=
adapter, struct sta_info *p=0D
        psta->raid =3D networktype_to_raid_ex(padapter, psta);=0D
=0D
        /* rate radaptive */=0D
-       Update_RA_Entry(padapter, psta);=0D
+       update_ra_entry(padapter, psta);=0D
        }=0D
=0D
        void mlmeext_sta_del_event_callback(struct adapter *padapter)=0D
@@ -4905,15 +4905,15 @@ void _linked_info_dump(struct adapter *padapter)=0D
        int i;=0D
        struct mlme_ext_priv *pmlmeext =3D &padapter->mlmeextpriv;=0D
        struct mlme_ext_info *pmlmeinfo =3D &pmlmeext->mlmext_info;=0D
-       int UndecoratedSmoothedPWDB;=0D
+       int undecorated_smoothed_pwdb;=0D
        struct dvobj_priv *pdvobj =3D adapter_to_dvobj(padapter);=0D
=0D
-       if (padapter->bLinkInfoDump) {=0D
+       if (padapter->is_link_info_dump) {=0D
=0D
        if ((pmlmeinfo->state&0x03) =3D=3D WIFI_FW_STATION_STATE)=0D
        rtw_hal_get_def_var(padapter,=0D
        HAL_DEF_UNDERCORATEDSMOOTHEDPWDB,=0D
-       &UndecoratedSmoothedPWDB);=0D
+       &undecorated_smoothed_pwdb);=0D
=0D
        for (i =3D 0; i < NUM_STA; i++) {=0D
        if (pdvobj->macid[i]) {=0D
@@ -5225,7 +5225,7 @@ u8 createbss_hdl(struct adapter *padapter, u8 *pbuf)=
=0D
=0D
        /* disable dynamic functions, such as high power, DIG */=0D
        Save_DM_Func_Flag(padapter);=0D
-       Switch_DM_Func(padapter, DYNAMIC_FUNC_DISABLE, false);=0D
+       switch_dm_func(padapter, DYNAMIC_FUNC_DISABLE, false);=0D
=0D
        /* config the initial gain under linking, need to write the BB regi=
sters */=0D
        /* initialgain =3D 0x1E; */=0D
@@ -5375,7 +5375,7 @@ u8 join_cmd_hdl(struct adapter *padapter, u8 *pbuf)=0D
        }=0D
=0D
        /* disable dynamic functions, such as high power, DIG */=0D
-       /* Switch_DM_Func(padapter, DYNAMIC_FUNC_DISABLE, false); */=0D
+       /* switch_dm_func(padapter, DYNAMIC_FUNC_DISABLE, false); */=0D
=0D
        /* config the initial gain under linking, need to write the BB regi=
sters */=0D
        /* initialgain =3D 0x1E; */=0D
@@ -5533,7 +5533,7 @@ u8 sitesurvey_cmd_hdl(struct adapter *padapter, u8 *p=
buf)=0D
        (pmlmeext->sitesurvey_res.state =3D=3D SCAN_TXNULL)) {=0D
        /* disable dynamic functions, such as high power, DIG */=0D
        Save_DM_Func_Flag(padapter);=0D
-       Switch_DM_Func(padapter, DYNAMIC_FUNC_DISABLE, false);=0D
+       switch_dm_func(padapter, DYNAMIC_FUNC_DISABLE, false);=0D
=0D
        /* config the initial gain under scanning, need to write the BB=0D
        * registers=0D
@@ -5674,7 +5674,7 @@ u8 add_ba_hdl(struct adapter *padapter, unsigned char=
 *pbuf)=0D
        /* pmlmeinfo->ADDBA_retry_count =3D 0; */=0D
        /* pmlmeinfo->candidate_tid_bitmap |=3D (0x1 << pparm->tid); */=0D
        /* psta->htpriv.candidate_tid_bitmap |=3D BIT(pparm->tid); */=0D
-       issue_action_BA(padapter, pparm->addr, WLAN_ACTION_ADDBA_REQ, (u16)=
pparm->tid);=0D
+       issue_action_BA(padapter, pparm->addr, WLAN_ACTION_ADD_BA_REQ, (u16=
)pparm->tid);=0D
        /* _set_timer(&pmlmeext->ADDBA_timer, ADDBA_TO); */=0D
        _set_timer(&psta->addba_retry_timer, ADDBA_TO);=0D
        } else {=0D
@@ -5785,7 +5785,7 @@ void report_survey_event(struct adapter *padapter, un=
ion recv_frame *precv_frame)=0D
=0D
        pc2h_evt_hdr =3D (struct C2HEvent_Header *)(pevtcmd);=0D
        pc2h_evt_hdr->len =3D sizeof(struct survey_event);=0D
-       pc2h_evt_hdr->ID =3D GEN_EVT_CODE(_Survey);=0D
+       pc2h_evt_hdr->ID =3D GEN_EVT_CODE(_survey);=0D
        pc2h_evt_hdr->seq =3D atomic_inc_return(&pmlmeext->event_seq);=0D
=0D
        psurvey_evt =3D (struct survey_event *)(pevtcmd + sizeof(struct C2H=
Event_Header));=0D
@@ -5839,7 +5839,7 @@ void report_surveydone_event(struct adapter *padapter=
)=0D
=0D
        pc2h_evt_hdr =3D (struct C2HEvent_Header *)(pevtcmd);=0D
        pc2h_evt_hdr->len =3D sizeof(struct surveydone_event);=0D
-       pc2h_evt_hdr->ID =3D GEN_EVT_CODE(_SurveyDone);=0D
+       pc2h_evt_hdr->ID =3D GEN_EVT_CODE(_surveyDone);=0D
        pc2h_evt_hdr->seq =3D atomic_inc_return(&pmlmeext->event_seq);=0D
=0D
        psurveydone_evt =3D (struct surveydone_event *)(pevtcmd + sizeof(st=
ruct C2HEvent_Header));=0D
@@ -5933,7 +5933,7 @@ void report_wmm_edca_update(struct adapter *padapter)=
=0D
=0D
        pc2h_evt_hdr =3D (struct C2HEvent_Header *)(pevtcmd);=0D
        pc2h_evt_hdr->len =3D sizeof(struct wmm_event);=0D
-       pc2h_evt_hdr->ID =3D GEN_EVT_CODE(_WMM);=0D
+       pc2h_evt_hdr->ID =3D GEN_EVT_CODE(_wmm);=0D
        pc2h_evt_hdr->seq =3D atomic_inc_return(&pmlmeext->event_seq);=0D
=0D
        pwmm_event =3D (struct wmm_event *)(pevtcmd + sizeof(struct C2HEven=
t_Header));=0D
@@ -5979,7 +5979,7 @@ void report_del_sta_event(struct adapter *padapter, u=
nsigned char *MacAddr, unsi=0D
=0D
        pc2h_evt_hdr =3D (struct C2HEvent_Header *)(pevtcmd);=0D
        pc2h_evt_hdr->len =3D sizeof(struct stadel_event);=0D
-       pc2h_evt_hdr->ID =3D GEN_EVT_CODE(_DelSTA);=0D
+       pc2h_evt_hdr->ID =3D GEN_EVT_CODE(_del_sta);=0D
        pc2h_evt_hdr->seq =3D atomic_inc_return(&pmlmeext->event_seq);=0D
=0D
        pdel_sta_evt =3D (struct stadel_event *)(pevtcmd + sizeof(struct C2=
HEvent_Header));=0D
@@ -6030,7 +6030,7 @@ void report_add_sta_event(struct adapter *padapter, u=
nsigned char *MacAddr, int=0D
=0D
        pc2h_evt_hdr =3D (struct C2HEvent_Header *)(pevtcmd);=0D
        pc2h_evt_hdr->len =3D sizeof(struct stassoc_event);=0D
-       pc2h_evt_hdr->ID =3D GEN_EVT_CODE(_AddSTA);=0D
+       pc2h_evt_hdr->ID =3D GEN_EVT_CODE(_add_sta);=0D
        pc2h_evt_hdr->seq =3D atomic_inc_return(&pmlmeext->event_seq);=0D
=0D
        padd_sta_evt =3D (struct stassoc_event *)(pevtcmd + sizeof(struct C=
2HEvent_Header));=0D
@@ -6145,7 +6145,7 @@ static void rtw_mlmeext_disconnect(struct adapter *pa=
dapter)=0D
        timer_delete_sync(&pmlmeext->link_timer);=0D
=0D
        /* pmlmepriv->LinkDetectInfo.TrafficBusyState =3D false; */=0D
-       pmlmepriv->LinkDetectInfo.TrafficTransitionCount =3D 0;=0D
+       pmlmepriv->LinkDetectInfo.traffic_transition_count =3D 0;=0D
        pmlmepriv->LinkDetectInfo.LowPowerTransitionCount =3D 0;=0D
=0D
        }=0D
@@ -6173,7 +6173,7 @@ void mlmeext_joinbss_event_callback(struct adapter *p=
adapter, int join_res)=0D
=0D
=0D
        /* turn on dynamic functions */=0D
-       Switch_DM_Func(padapter, DYNAMIC_ALL_FUNC_ENABLE, true);=0D
+       switch_dm_func(padapter, DYNAMIC_ALL_FUNC_ENABLE, true);=0D
=0D
        /* update IOT-related issue */=0D
        update_IOT_info(padapter);=0D
@@ -6264,8 +6264,8 @@ void mlmeext_sta_add_event_callback(struct adapter *p=
adapter, struct sta_info *p=0D
=0D
        pmlmeinfo->FW_sta_info[psta->mac_id].psta =3D psta;=0D
=0D
-       psta->bssratelen =3D rtw_get_rateset_len(pmlmeinfo->FW_sta_info[pst=
a->mac_id].SupportedRates);=0D
-       memcpy(psta->bssrateset, pmlmeinfo->FW_sta_info[psta->mac_id].Suppo=
rtedRates, psta->bssratelen);=0D
+       psta->bssratelen =3D rtw_get_rateset_len(pmlmeinfo->FW_sta_info[pst=
a->mac_id].supported_rates);=0D
+       memcpy(psta->bssrateset, pmlmeinfo->FW_sta_info[psta->mac_id].suppo=
rted_rates, psta->bssratelen);=0D
=0D
        /* update adhoc sta_info */=0D
        update_sta_info(padapter, psta);=0D
@@ -6277,7 +6277,7 @@ void mlmeext_sta_add_event_callback(struct adapter *p=
adapter, struct sta_info *p=0D
        psta->raid =3D networktype_to_raid_ex(padapter, psta);=0D
=0D
        /* rate radaptive */=0D
-       Update_RA_Entry(padapter, psta);=0D
+       update_ra_entry(padapter, psta);=0D
        }=0D
=0D
        void mlmeext_sta_del_event_callback(struct adapter *padapter)=0D
@@ -6293,15 +6293,15 @@ void _linked_info_dump(struct adapter *padapter)=0D
        int i;=0D
        struct mlme_ext_priv *pmlmeext =3D &padapter->mlmeextpriv;=0D
        struct mlme_ext_info *pmlmeinfo =3D &pmlmeext->mlmext_info;=0D
-       int UndecoratedSmoothedPWDB;=0D
+       int undecorated_smoothed_pwdb;=0D
        struct dvobj_priv *pdvobj =3D adapter_to_dvobj(padapter);=0D
=0D
-       if (padapter->bLinkInfoDump) {=0D
+       if (padapter->is_link_info_dump) {=0D
=0D
        if ((pmlmeinfo->state&0x03) =3D=3D WIFI_FW_STATION_STATE)=0D
        rtw_hal_get_def_var(padapter,=0D
        HAL_DEF_UNDERCORATEDSMOOTHEDPWDB,=0D
-       &UndecoratedSmoothedPWDB);=0D
+       &undecorated_smoothed_pwdb);=0D
=0D
        for (i =3D 0; i < NUM_STA; i++) {=0D
        if (pdvobj->macid[i]) {=0D
@@ -6613,7 +6613,7 @@ u8 createbss_hdl(struct adapter *padapter, u8 *pbuf)=
=0D
=0D
        /* disable dynamic functions, such as high power, DIG */=0D
        Save_DM_Func_Flag(padapter);=0D
-       Switch_DM_Func(padapter, DYNAMIC_FUNC_DISABLE, false);=0D
+       switch_dm_func(padapter, DYNAMIC_FUNC_DISABLE, false);=0D
=0D
        /* config the initial gain under linking, need to write the BB regi=
sters */=0D
        /* initialgain =3D 0x1E; */=0D
@@ -6763,7 +6763,7 @@ u8 join_cmd_hdl(struct adapter *padapter, u8 *pbuf)=0D
        }=0D
=0D
        /* disable dynamic functions, such as high power, DIG */=0D
-       /* Switch_DM_Func(padapter, DYNAMIC_FUNC_DISABLE, false); */=0D
+       /* switch_dm_func(padapter, DYNAMIC_FUNC_DISABLE, false); */=0D
=0D
        /* config the initial gain under linking, need to write the BB regi=
sters */=0D
        /* initialgain =3D 0x1E; */=0D
@@ -6921,7 +6921,7 @@ u8 sitesurvey_cmd_hdl(struct adapter *padapter, u8 *p=
buf)=0D
        (pmlmeext->sitesurvey_res.state =3D=3D SCAN_TXNULL)) {=0D
        /* disable dynamic functions, such as high power, DIG */=0D
        Save_DM_Func_Flag(padapter);=0D
-       Switch_DM_Func(padapter, DYNAMIC_FUNC_DISABLE, false);=0D
+       switch_dm_func(padapter, DYNAMIC_FUNC_DISABLE, false);=0D
=0D
        /* config the initial gain under scanning, need to write the BB=0D
        * registers=0D
@@ -7062,7 +7062,7 @@ u8 add_ba_hdl(struct adapter *padapter, unsigned char=
 *pbuf)=0D
        /* pmlmeinfo->ADDBA_retry_count =3D 0; */=0D
        /* pmlmeinfo->candidate_tid_bitmap |=3D (0x1 << pparm->tid); */=0D
        /* psta->htpriv.candidate_tid_bitmap |=3D BIT(pparm->tid); */=0D
-       issue_action_BA(padapter, pparm->addr, WLAN_ACTION_ADDBA_REQ, (u16)=
pparm->tid);=0D
+       issue_action_BA(padapter, pparm->addr, WLAN_ACTION_ADD_BA_REQ, (u16=
)pparm->tid);=0D
        /* _set_timer(&pmlmeext->ADDBA_timer, ADDBA_TO); */=0D
        _set_timer(&psta->addba_retry_timer, ADDBA_TO);=0D
        } else {=0D
