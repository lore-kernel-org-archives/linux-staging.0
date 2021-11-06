Received: from mail-il1-f169.google.com (mail-il1-f169.google.com [209.85.166.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE91A2C96
	for <linux-staging@lists.linux.dev>; Sat,  6 Nov 2021 13:21:54 +0000 (UTC)
Received: by mail-il1-f169.google.com with SMTP id i9so12276090ilu.8
        for <linux-staging@lists.linux.dev>; Sat, 06 Nov 2021 06:21:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=ZXwRnzD4n3KQ5fo6YVF9JkCIbUW+DX3XTOkYB36mc+Q=;
        b=bcHg3MNzrT+xCn8+ycP1GNM37itr2E4o915Wh0zboprjEL020/boR4JqxTR5OZ+Oir
         ZBO+IsRtTzRLi0d7dg0RjtNwhJIWIddUv+3yAeZZlwuUxX6XbIzWP7nPzJi/sBRx7g0z
         gAHMEMM9TJkMcxPozvY2JkfEv2++lD8C+4fT98dbQNDsMhqq/NClO6FW0mWmRpYRRrcF
         yGI63rlDHP6Vx5VEKmk+XtjscoRrzjC0iIRGwGeISctslzwkkkKMdnrKAk2+Zm03pZLd
         93T9aLSe1RwaGDuKhVe6uNIqKpcedrzHS3zXP3LBR08j+6cBzsw0T3tCEjHYk3ubPrix
         VlHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=ZXwRnzD4n3KQ5fo6YVF9JkCIbUW+DX3XTOkYB36mc+Q=;
        b=rrHEqwJWhsYwaqRIiF5LcQNS1Y36G7NonbiqmhlWokYu+IYIyxcKC7jvSpmmWYwaAK
         SJPnjTZvCOJLHHPNE+2aHeYA4pECWnyer8qB9tEFCnZlcCJ5EMot2YSbF00XpnlyAqKO
         aS9Bjcq1+Lzl9vNFgb9/E5KBrO3mHaz83RSBqeAhwHcgrWHDSK9bYudncQuG95Y2IA3R
         BzRyZfvpLPNr/LBuPANSpqfJtBGe7/FseGQw5fkQ69uJiFaeCZuU42J1yctObAT8ptpQ
         70l8wyT85ROQhm3/ug+Yqd1GMklVmVFoUBDLVzp+FHf50YaXGcogcWB+ROpwg8uEfWt9
         xl3g==
X-Gm-Message-State: AOAM531IH90lnZ8YIDgDpC1LPcogFSqYKVmC2UEAkGp71nlZg6WhvWMZ
	kNVTumFxeABh099nAwV1aHIl9kgvkcmbM94tjmw=
X-Google-Smtp-Source: ABdhPJw8GnvCMq3y3oTkdqYexL2wNfc11/vWAwUaDR+4G0zdT3qD/VjmXjB3Ljw1+0WxMtlKbeDNjZIteiBM0DtEY8A=
X-Received: by 2002:a92:dd08:: with SMTP id n8mr28546567ilm.227.1636204912889;
 Sat, 06 Nov 2021 06:21:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CABtXzjTvsN8sCQq0tMG+VZ8Vu04a1zR20P-hbQf-Mnpmu2gTNg@mail.gmail.com>
 <2d7b9450-159b-f244-f4c3-e9db753f83eb@gmail.com> <CABtXzjSjkQTMmrA_PmbLaMUFR9X7xUMx+VG=v1jsdLQAdg+rJg@mail.gmail.com>
 <510e2388-41ea-bf66-16ee-eb282cc41405@gmail.com> <5ed4c9f0-111a-7a13-1426-2f9f26b9937a@gmail.com>
In-Reply-To: <5ed4c9f0-111a-7a13-1426-2f9f26b9937a@gmail.com>
From: Zameer Manji <zmanji@gmail.com>
Date: Sat, 6 Nov 2021 09:21:26 -0400
Message-ID: <CABtXzjSOXiZW5J3-k-jkFS3N9p9k_X=F2JrvJc9_T+By8FJc8A@mail.gmail.com>
Subject: Re: r8188eu driver in 5.15 only shows wifi networks on channel 11
To: Pavel Skripkin <paskripkin@gmail.com>
Cc: linux-staging@lists.linux.dev, 
	"Fabio M. De Francesco" <fmdefrancesco@gmail.com>, Phillip Potter <phil@philpotter.co.uk>, 
	Larry Finger <Larry.Finger@lwfinger.net>, Martin Kaiser <martin@kaiser.cx>, 
	Michael Straube <straube.linux@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello All,

Pavel, I believe we have different hardware since my lsusb
output shows

```
Bus 003 Device 002: ID 0bda:8179 Realtek Semiconductor Corp.
RTL8188EUS 802.11n Wireless Network Adapter
```

Where your device has a different id/name. Maybe that's the root
cause?

Phillip, the last release that worked for me was the 5.14 release.

Setting debug=3D9 set produces the following extra output. I am
not sure how to interpret it.

```
[   12.948694] R8188EU: RF_Type is 3!!
[   12.948700] R8188EU: _ConfigNormalChipOutEP_8188E
OutEpQueueSel(0x05), OutEpNumber(2)
[   12.952659] R8188EU: EEPROM type is E-FUSE
[   12.952684] R8188EU: =3D=3D=3D=3D> _ReadAdapterInfo8188EU
[   12.955785] R8188EU: Boot from EFUSE, Autoload OK !
[   12.981844] R8188EU: bFWReady =3D=3D false call reset 8051...
[   12.982228] R8188EU: =3D=3D=3D=3D=3D> _8051Reset88E(): 8051 reset succes=
s .
[   12.998575] R8188EU: efuse_read_phymap_from_txpktbuf bcnhead:0
[   12.999449] R8188EU: efuse_read_phymap_from_txpktbuf len:125, lenc:125
[   13.009205] R8188EU: efuse_read_phymap_from_txpktbuf read count:123
[   13.009619] R8188EU: VID =3D 0x0BDA, PID =3D 0x8179
[   13.009624] R8188EU: Customer ID: 0x00, SubCustomer ID: 0xCD
[   13.009629] R8188EU:
Hal_ReadPowerSavingMode88E...bHWPwrPindetect(0)-bHWPowerdown(0) ,
bSupportRemoteWakeup(1)
[   13.009636] R8188EU: ### PS params =3D>  power_mgnt(1), usbss_enable(0) =
###
[   13.009645] R8188EU: =3D=3D=3D=3D=3D=3D=3D Path 0, Channel 0 =3D=3D=3D=
=3D=3D=3D=3D
[   13.009649] R8188EU: Index24G_CCK_Base[0][0] =3D 0x27
[   13.009653] R8188EU: Index24G_BW40_Base[0][0] =3D 0x2b
[   13.009658] R8188EU: =3D=3D=3D=3D=3D=3D=3D Path 0, Channel 1 =3D=3D=3D=
=3D=3D=3D=3D
[   13.009662] R8188EU: Index24G_CCK_Base[0][1] =3D 0x27
[   13.009667] R8188EU: Index24G_BW40_Base[0][1] =3D 0x2b
[   13.009671] R8188EU: =3D=3D=3D=3D=3D=3D=3D Path 0, Channel 2 =3D=3D=3D=
=3D=3D=3D=3D
[   13.009675] R8188EU: Index24G_CCK_Base[0][2] =3D 0x27
[   13.009679] R8188EU: Index24G_BW40_Base[0][2] =3D 0x2b
[   13.009683] R8188EU: =3D=3D=3D=3D=3D=3D=3D Path 0, Channel 3 =3D=3D=3D=
=3D=3D=3D=3D
[   13.009687] R8188EU: Index24G_CCK_Base[0][3] =3D 0x27
[   13.009691] R8188EU: Index24G_BW40_Base[0][3] =3D 0x2b
[   13.009696] R8188EU: =3D=3D=3D=3D=3D=3D=3D Path 0, Channel 4 =3D=3D=3D=
=3D=3D=3D=3D
[   13.009699] R8188EU: Index24G_CCK_Base[0][4] =3D 0x27
[   13.009703] R8188EU: Index24G_BW40_Base[0][4] =3D 0x2b
[   13.009708] R8188EU: =3D=3D=3D=3D=3D=3D=3D Path 0, Channel 5 =3D=3D=3D=
=3D=3D=3D=3D
[   13.009711] R8188EU: Index24G_CCK_Base[0][5] =3D 0x27
[   13.009716] R8188EU: Index24G_BW40_Base[0][5] =3D 0x2b
[   13.009721] R8188EU: =3D=3D=3D=3D=3D=3D=3D Path 0, Channel 6 =3D=3D=3D=
=3D=3D=3D=3D
[   13.009724] R8188EU: Index24G_CCK_Base[0][6] =3D 0x26
[   13.009729] R8188EU: Index24G_BW40_Base[0][6] =3D 0x2a
[   13.009733] R8188EU: =3D=3D=3D=3D=3D=3D=3D Path 0, Channel 7 =3D=3D=3D=
=3D=3D=3D=3D
[   13.009737] R8188EU: Index24G_CCK_Base[0][7] =3D 0x26
[   13.009741] R8188EU: Index24G_BW40_Base[0][7] =3D 0x2a
[   13.009745] R8188EU: =3D=3D=3D=3D=3D=3D=3D Path 0, Channel 8 =3D=3D=3D=
=3D=3D=3D=3D
[   13.009750] R8188EU: Index24G_CCK_Base[0][8] =3D 0x26
[   13.009754] R8188EU: Index24G_BW40_Base[0][8] =3D 0x2a
[   13.009758] R8188EU: =3D=3D=3D=3D=3D=3D=3D Path 0, Channel 9 =3D=3D=3D=
=3D=3D=3D=3D
[   13.009762] R8188EU: Index24G_CCK_Base[0][9] =3D 0x25
[   13.009766] R8188EU: Index24G_BW40_Base[0][9] =3D 0x29
[   13.009770] R8188EU: =3D=3D=3D=3D=3D=3D=3D Path 0, Channel 10 =3D=3D=3D=
=3D=3D=3D=3D
[   13.009774] R8188EU: Index24G_CCK_Base[0][10] =3D 0x25
[   13.009779] R8188EU: Index24G_BW40_Base[0][10] =3D 0x29
[   13.009783] R8188EU: =3D=3D=3D=3D=3D=3D=3D Path 0, Channel 11 =3D=3D=3D=
=3D=3D=3D=3D
[   13.009787] R8188EU: Index24G_CCK_Base[0][11] =3D 0x25
[   13.009791] R8188EU: Index24G_BW40_Base[0][11] =3D 0x29
[   13.009796] R8188EU: =3D=3D=3D=3D=3D=3D=3D Path 0, Channel 12 =3D=3D=3D=
=3D=3D=3D=3D
[   13.009800] R8188EU: Index24G_CCK_Base[0][12] =3D 0x25
[   13.009804] R8188EU: Index24G_BW40_Base[0][12] =3D 0x29
[   13.009809] R8188EU: =3D=3D=3D=3D=3D=3D=3D Path 0, Channel 13 =3D=3D=3D=
=3D=3D=3D=3D
[   13.009812] R8188EU: Index24G_CCK_Base[0][13] =3D 0x25
[   13.009817] R8188EU: Index24G_BW40_Base[0][13] =3D 0x29
[   13.009822] R8188EU: =3D=3D=3D=3D=3D=3D=3D TxCount 0 =3D=3D=3D=3D=3D=3D=
=3D
[   13.009825] R8188EU: CCK_24G_Diff[0][0] =3D 0
[   13.009829] R8188EU: OFDM_24G_Diff[0][0] =3D 1
[   13.009834] R8188EU: BW20_24G_Diff[0][0] =3D -1
[   13.009838] R8188EU: BW40_24G_Diff[0][0] =3D 0
[   13.009843] R8188EU: =3D=3D=3D=3D=3D=3D=3D TxCount 1 =3D=3D=3D=3D=3D=3D=
=3D
[   13.009846] R8188EU: CCK_24G_Diff[0][1] =3D -2
[   13.009850] R8188EU: OFDM_24G_Diff[0][1] =3D -2
[   13.009854] R8188EU: BW20_24G_Diff[0][1] =3D -2
[   13.009858] R8188EU: BW40_24G_Diff[0][1] =3D -2
[   13.009863] R8188EU: =3D=3D=3D=3D=3D=3D=3D TxCount 2 =3D=3D=3D=3D=3D=3D=
=3D
[   13.009866] R8188EU: CCK_24G_Diff[0][2] =3D -2
[   13.009870] R8188EU: OFDM_24G_Diff[0][2] =3D -2
[   13.009874] R8188EU: BW20_24G_Diff[0][2] =3D -2
[   13.009878] R8188EU: BW40_24G_Diff[0][2] =3D -2
[   13.009883] R8188EU: =3D=3D=3D=3D=3D=3D=3D TxCount 3 =3D=3D=3D=3D=3D=3D=
=3D
[   13.009886] R8188EU: CCK_24G_Diff[0][3] =3D -2
[   13.009890] R8188EU: OFDM_24G_Diff[0][3] =3D -2
[   13.009894] R8188EU: BW20_24G_Diff[0][3] =3D -2
[   13.009898] R8188EU: BW40_24G_Diff[0][3] =3D -2
[   13.009903] R8188EU: EEPROMRegulatory =3D 0x1
[   13.009907] R8188EU: mlmepriv.ChannelPlan =3D 0x22
[   13.009912] R8188EU: CrystalCap: 0x f
[   13.009916] R8188EU: EEPROM Customer ID: 0x 0
[   13.009920] R8188EU: EEPROM : AntDivCfg =3D 0, TRxAntDivType =3D 3
[   13.009924] R8188EU: Board Type: 0x 0
[   13.009927] R8188EU: ThermalMeter =3D 0x15
[   13.009930] R8188EU: <=3D=3D=3D=3D _ReadAdapterInfo8188EU in 56 ms
[   13.014975] R8188EU:
[   13.015114] R8188EU: can't get autopm:
[   13.015143] R8188EU: rtw_macaddr_cfg MAC Address  =3D 98:48:27:e7:5c:e1
[   13.015152] R8188EU: MAC Address from pnetdev->dev_addr =3D  98:48:27:e7=
:5c:e1
[   13.016705] R8188EU: bDriverStopped:1, bSurpriseRemoved:0, bup:0,
hw_init_completed:0
[   14.024666] R8188EU: +88eu_drv - drv_open, bup =3D0
[   14.048746] R8188EU: INFO +load_firmware: !bUsedWoWLANFw, FmrmwareLen:13=
904+
[   14.048786] R8188EU: Firmware Version 11, SubVersion 1, Signature 0x88e1
[   14.154324] R8188EU: _FWFreeToGo: Checksum report OK! REG_MCUFWDL:0x0003=
0004
[   14.154944] R8188EU: =3D=3D=3D=3D=3D> _8051Reset88E(): 8051 reset succes=
s .
[   14.157582] R8188EU: _FWFreeToGo: Polling FW ready success!!
REG_MCUFWDL:0x000300c6
[   14.334320] R8188EU: =3D=3D> rtl8188e_iol_efuse_patch
[   14.384826] R8188EU: pDM_Odm TxPowerTrackControl =3D 1
[   14.641027] R8188EU: rtl8188eu_hal_init in 616ms
[   14.654367] R8188EU: -88eu_drv - drv_open, bup =3D1
[   14.657068] R8188EU: [rtw_wx_set_pmkid] IW_PMKSA_FLUSH!
[   14.657105] R8188EU: set_mode =3D IW_MODE_INFRA
[   14.657201] R8188EU: INFO set bssid:00:00:00:00:00:00
[   14.657258] R8188EU: =3D>rtw_wx_set_essid
[   14.657265] R8188EU: ssid
=3Dg\xc6isQ\xffJ\xec)=CD=BA\xab\xf2\xfb\xe3F|\xc2T\xf8\x1b\xe8\xe7\x8dvZ.c3=
\x9f=C9=9A,
len =3D32
[   14.657291] R8188EU: INFO set ssid
[g\xc6isQ\xffJ\xec)=CD=BA\xab\xf2\xfb\xe3F|\xc2T\xf8\x1b\xe8\xe7\x8dvZ.c3\x=
9f=C9=9A]
fw_state=3D0x00000008
[   14.657298] R8188EU: Set SSID under fw_state =3D 0x00000008
[   14.657319] R8188EU: <=3Drtw_wx_set_essid, ret 0
[   14.662822] R8188EU: hw_var_set_opmode()-1274 mode =3D 2
[   14.695431] R8188EU: [rtw_wx_set_pmkid] IW_PMKSA_FLUSH!
[   15.099210] R8188EU: survey done event(18)
[   15.099251] R8188EU: rtw_select_and_join_from_scanned_queue: return
_FAIL(candidate=3D=3DNULL)
[   15.099262] R8188EU: try_to_join, but select scanning queue fail,
to_roaming:0
[   15.099271] R8188EU: INFO indicate disassoc
[   15.099361] R8188EU: rtl8188e_set_FwJoinBssReport_cmd mstatus(0)
[   18.687068] R8188EU: =3D=3D>rtw_ps_processor .fw_state(8)
[   18.687103] R8188EU: =3D=3D>ips_enter cnts:1
[   18.687110] R8188EU: INFO nolinked power save enter
[   18.687115] R8188EU: =3D=3D=3D> rtw_ips_pwr_down...................
[   18.687578] R8188EU: =3D=3D=3D=3D> rtw_ips_dev_unload...
[   18.718081] R8188EU: usb_read_port_cancel
[   18.721768] R8188EU: usb_read_port_complete() RX Warning!
bDriverStopped(0) OR bSurpriseRemoved(0) bReadPortCancel(1)
[   18.725791] R8188EU: usb_read_port_complete() RX Warning!
bDriverStopped(0) OR bSurpriseRemoved(0) bReadPortCancel(1)
[   18.729058] R8188EU: usb_read_port_complete() RX Warning!
bDriverStopped(0) OR bSurpriseRemoved(0) bReadPortCancel(1)
[   18.732307] R8188EU: usb_read_port_complete() RX Warning!
bDriverStopped(0) OR bSurpriseRemoved(0) bReadPortCancel(1)
[   18.732503] R8188EU: usb_write_port_cancel
[   18.733419] R8188EU: =3D=3D> rtl8188eu_hal_deinit
[   18.737435] R8188EU: bkeepfwalive(0)
[   18.751071] R8188EU: <=3D=3D=3D rtw_ips_pwr_down..................... in=
 64ms
[   20.124577] R8188EU: _rtw_pwr_wakeup call ips_leave....
[   20.124608] R8188EU: =3D=3D>ips_leave cnts:1
[   20.124618] R8188EU: =3D=3D=3D>  rtw_ips_pwr_up..............
[   20.124630] R8188EU: =3D=3D=3D> ips_netdrv_open.........
[   20.169200] R8188EU: _FWFreeToGo: Checksum report OK! REG_MCUFWDL:0x0003=
0004
[   20.169821] R8188EU: =3D=3D=3D=3D=3D> _8051Reset88E(): 8051 reset succes=
s .
[   20.172448] R8188EU: _FWFreeToGo: Polling FW ready success!!
REG_MCUFWDL:0x000300c6
[   20.334325] R8188EU: =3D=3D> rtl8188e_iol_efuse_patch
[   20.375330] R8188EU: pDM_Odm TxPowerTrackControl =3D 1
[   20.615585] R8188EU: rtl8188eu_hal_init in 492ms
[   20.615656] R8188EU: <=3D=3D=3D  rtw_ips_pwr_up.............. in 492ms
[   20.615665] R8188EU: INFO nolinked power save leave
[   20.615833] R8188EU: =3D=3D> ips_leave.....LED(0x00088282)...
[   21.040209] R8188EU: survey done event(11)
[   22.623047] R8188EU: =3D=3D>rtw_ps_processor .fw_state(8)
[   22.623079] R8188EU: =3D=3D>ips_enter cnts:2
[   22.623087] R8188EU: INFO nolinked power save enter
[   22.623092] R8188EU: =3D=3D=3D> rtw_ips_pwr_down...................
[   22.623577] R8188EU: =3D=3D=3D=3D> rtw_ips_dev_unload...
[   22.651955] R8188EU: usb_read_port_cancel
[   22.655886] R8188EU: usb_read_port_complete() RX Warning!
bDriverStopped(0) OR bSurpriseRemoved(0) bReadPortCancel(1)
[   22.659061] R8188EU: usb_read_port_complete() RX Warning!
bDriverStopped(0) OR bSurpriseRemoved(0) bReadPortCancel(1)
[   22.662228] R8188EU: usb_read_port_complete() RX Warning!
bDriverStopped(0) OR bSurpriseRemoved(0) bReadPortCancel(1)
[   22.666936] R8188EU: usb_read_port_complete() RX Warning!
bDriverStopped(0) OR bSurpriseRemoved(0) bReadPortCancel(1)
[   22.666975] R8188EU: usb_write_port_cancel
[   22.667087] R8188EU: =3D=3D> rtl8188eu_hal_deinit
[   22.667320] R8188EU: bkeepfwalive(0)
[   22.673822] R8188EU: <=3D=3D=3D rtw_ips_pwr_down..................... in=
 48ms
[   26.043741] R8188EU: _rtw_pwr_wakeup call ips_leave....
[   26.043773] R8188EU: =3D=3D>ips_leave cnts:2
[   26.043783] R8188EU: =3D=3D=3D>  rtw_ips_pwr_up..............
[   26.043794] R8188EU: =3D=3D=3D> ips_netdrv_open.........
[   26.084825] R8188EU: _FWFreeToGo: Checksum report OK! REG_MCUFWDL:0x0003=
0004
[   26.085446] R8188EU: =3D=3D=3D=3D=3D> _8051Reset88E(): 8051 reset succes=
s .
[   26.089462] R8188EU: _FWFreeToGo: Polling FW ready success!!
REG_MCUFWDL:0x000300c6
[   26.270823] R8188EU: =3D=3D> rtl8188e_iol_efuse_patch
[   26.314451] R8188EU: pDM_Odm TxPowerTrackControl =3D 1
[   26.567450] R8188EU: rtl8188eu_hal_init in 524ms
[   26.567505] R8188EU: <=3D=3D=3D  rtw_ips_pwr_up.............. in 524ms
[   26.567512] R8188EU: INFO nolinked power save leave
[   26.567572] R8188EU: =3D=3D> ips_leave.....LED(0x00088282)...
[   27.004208] R8188EU: survey done event(11)
[   28.575034] R8188EU: =3D=3D>rtw_ps_processor .fw_state(8)
[   28.575064] R8188EU: =3D=3D>ips_enter cnts:3
[   28.575072] R8188EU: INFO nolinked power save enter
[   28.575077] R8188EU: =3D=3D=3D> rtw_ips_pwr_down...................
[   28.575577] R8188EU: =3D=3D=3D=3D> rtw_ips_dev_unload...
[   28.605205] R8188EU: usb_read_port_cancel
[   28.608779] R8188EU: usb_read_port_complete() RX Warning!
bDriverStopped(0) OR bSurpriseRemoved(0) bReadPortCancel(1)
[   28.612146] R8188EU: usb_read_port_complete() RX Warning!
bDriverStopped(0) OR bSurpriseRemoved(0) bReadPortCancel(1)
[   28.616566] R8188EU: usb_read_port_complete() RX Warning!
bDriverStopped(0) OR bSurpriseRemoved(0) bReadPortCancel(1)
[   28.619060] R8188EU: usb_read_port_complete() RX Warning!
bDriverStopped(0) OR bSurpriseRemoved(0) bReadPortCancel(1)
[   28.619081] R8188EU: usb_write_port_cancel
[   28.619170] R8188EU: =3D=3D> rtl8188eu_hal_deinit
[   28.619445] R8188EU: bkeepfwalive(0)
[   28.628449] R8188EU: <=3D=3D=3D rtw_ips_pwr_down..................... in=
 52ms
[   32.011182] R8188EU: _rtw_pwr_wakeup call ips_leave....
[   32.011213] R8188EU: =3D=3D>ips_leave cnts:3
[   32.011223] R8188EU: =3D=3D=3D>  rtw_ips_pwr_up..............
[   32.011235] R8188EU: =3D=3D=3D> ips_netdrv_open.........
[   32.058578] R8188EU: _FWFreeToGo: Checksum report OK! REG_MCUFWDL:0x0003=
0004
[   32.059203] R8188EU: =3D=3D=3D=3D=3D> _8051Reset88E(): 8051 reset succes=
s .
[   32.061821] R8188EU: _FWFreeToGo: Polling FW ready success!!
REG_MCUFWDL:0x000300c6
[   32.228699] R8188EU: =3D=3D> rtl8188e_iol_efuse_patch
[   32.267956] R8188EU: pDM_Odm TxPowerTrackControl =3D 1
[   32.502954] R8188EU: rtl8188eu_hal_init in 488ms
[   32.503058] R8188EU: <=3D=3D=3D  rtw_ips_pwr_up.............. in 492ms
[   32.503068] R8188EU: INFO nolinked power save leave
[   32.503202] R8188EU: =3D=3D> ips_leave.....LED(0x00088282)...
[   32.928209] R8188EU: survey done event(11)
[   34.527045] R8188EU: =3D=3D>rtw_ps_processor .fw_state(8)
[   34.527079] R8188EU: =3D=3D>ips_enter cnts:4
[   34.527087] R8188EU: INFO nolinked power save enter
[   34.527092] R8188EU: =3D=3D=3D> rtw_ips_pwr_down...................
[   34.527827] R8188EU: =3D=3D=3D=3D> rtw_ips_dev_unload...
[   34.556955] R8188EU: usb_read_port_cancel
[   34.560577] R8188EU: usb_read_port_complete() RX Warning!
bDriverStopped(0) OR bSurpriseRemoved(0) bReadPortCancel(1)
[   34.563059] R8188EU: usb_read_port_complete() RX Warning!
bDriverStopped(0) OR bSurpriseRemoved(0) bReadPortCancel(1)
[   34.566443] R8188EU: usb_read_port_complete() RX Warning!
bDriverStopped(0) OR bSurpriseRemoved(0) bReadPortCancel(1)
[   34.569685] R8188EU: usb_read_port_complete() RX Warning!
bDriverStopped(0) OR bSurpriseRemoved(0) bReadPortCancel(1)
[   34.569711] R8188EU: usb_write_port_cancel
[   34.569805] R8188EU: =3D=3D> rtl8188eu_hal_deinit
[   34.570069] R8188EU: bkeepfwalive(0)
[   34.582200] R8188EU: <=3D=3D=3D rtw_ips_pwr_down..................... in=
 52ms
[   37.933641] R8188EU: _rtw_pwr_wakeup call ips_leave....
[   37.933663] R8188EU: =3D=3D>ips_leave cnts:4
[   37.933670] R8188EU: =3D=3D=3D>  rtw_ips_pwr_up..............
[   37.933679] R8188EU: =3D=3D=3D> ips_netdrv_open.........
[   37.957578] R8188EU: _FWFreeToGo: Checksum report OK! REG_MCUFWDL:0x0003=
0004
[   37.958199] R8188EU: =3D=3D=3D=3D=3D> _8051Reset88E(): 8051 reset succes=
s .
[   37.960827] R8188EU: _FWFreeToGo: Polling FW ready success!!
REG_MCUFWDL:0x000300c6
[   38.080202] R8188EU: =3D=3D> rtl8188e_iol_efuse_patch
[   38.114205] R8188EU: pDM_Odm TxPowerTrackControl =3D 1
[   38.343579] R8188EU: rtl8188eu_hal_init in 412ms
[   38.343643] R8188EU: <=3D=3D=3D  rtw_ips_pwr_up.............. in 412ms
[   38.343651] R8188EU: INFO nolinked power save leave
[   38.343718] R8188EU: =3D=3D> ips_leave.....LED(0x00088282)...
[   38.768208] R8188EU: survey done event(10)
[   40.351030] R8188EU: =3D=3D>rtw_ps_processor .fw_state(8)
[   40.351051] R8188EU: =3D=3D>ips_enter cnts:5
[   40.351057] R8188EU: INFO nolinked power save enter
[   40.351061] R8188EU: =3D=3D=3D> rtw_ips_pwr_down...................
[   40.351572] R8188EU: =3D=3D=3D=3D> rtw_ips_dev_unload...
[   40.374952] R8188EU: usb_read_port_cancel
[   40.378317] R8188EU: usb_read_port_complete() RX Warning!
bDriverStopped(0) OR bSurpriseRemoved(0) bReadPortCancel(1)
[   40.381562] R8188EU: usb_read_port_complete() RX Warning!
bDriverStopped(0) OR bSurpriseRemoved(0) bReadPortCancel(1)
[   40.384810] R8188EU: usb_read_port_complete() RX Warning!
bDriverStopped(0) OR bSurpriseRemoved(0) bReadPortCancel(1)
[   40.387059] R8188EU: usb_read_port_complete() RX Warning!
bDriverStopped(0) OR bSurpriseRemoved(0) bReadPortCancel(1)
[   40.387080] R8188EU: usb_write_port_cancel
[   40.387171] R8188EU: =3D=3D> rtl8188eu_hal_deinit
[   40.387447] R8188EU: bkeepfwalive(0)
[   40.406319] R8188EU: <=3D=3D=3D rtw_ips_pwr_down..................... in=
 52ms
[   43.774948] R8188EU: _rtw_pwr_wakeup call ips_leave....
[   43.774979] R8188EU: =3D=3D>ips_leave cnts:5
[   43.775052] R8188EU: =3D=3D=3D>  rtw_ips_pwr_up..............
[   43.775065] R8188EU: =3D=3D=3D> ips_netdrv_open.........
[   43.815698] R8188EU: _FWFreeToGo: Checksum report OK! REG_MCUFWDL:0x0003=
0004
[   43.816320] R8188EU: =3D=3D=3D=3D=3D> _8051Reset88E(): 8051 reset succes=
s .
[   43.818947] R8188EU: _FWFreeToGo: Polling FW ready success!!
REG_MCUFWDL:0x000300c6
[   43.941702] R8188EU: =3D=3D> rtl8188e_iol_efuse_patch
[   43.975704] R8188EU: pDM_Odm TxPowerTrackControl =3D 1
[   44.195585] R8188EU: rtl8188eu_hal_init in 420ms
[   44.195660] R8188EU: <=3D=3D=3D  rtw_ips_pwr_up.............. in 420ms
[   44.195669] R8188EU: INFO nolinked power save leave
[   44.195833] R8188EU: =3D=3D> ips_leave.....LED(0x00088282)...
[   44.651572] R8188EU: survey done event(1a)
[   46.207046] R8188EU: =3D=3D>rtw_ps_processor .fw_state(8)
[   46.207080] R8188EU: =3D=3D>ips_enter cnts:6
[   46.207087] R8188EU: INFO nolinked power save enter
[   46.207092] R8188EU: =3D=3D=3D> rtw_ips_pwr_down...................
[   46.207577] R8188EU: =3D=3D=3D=3D> rtw_ips_dev_unload...
[   46.238599] R8188EU: usb_read_port_cancel
[   46.241789] R8188EU: usb_read_port_complete() RX Warning!
bDriverStopped(0) OR bSurpriseRemoved(0) bReadPortCancel(1)
[   46.245062] R8188EU: usb_read_port_complete() RX Warning!
bDriverStopped(0) OR bSurpriseRemoved(0) bReadPortCancel(1)
[   46.248308] R8188EU: usb_read_port_complete() RX Warning!
bDriverStopped(0) OR bSurpriseRemoved(0) bReadPortCancel(1)
[   46.251057] R8188EU: usb_read_port_complete() RX Warning!
bDriverStopped(0) OR bSurpriseRemoved(0) bReadPortCancel(1)
[   46.251092] R8188EU: usb_write_port_cancel
[   46.251182] R8188EU: =3D=3D> rtl8188eu_hal_deinit
[   46.252465] R8188EU: bkeepfwalive(0)
[   46.261952] R8188EU: <=3D=3D=3D rtw_ips_pwr_down..................... in=
 52ms
[   49.658312] R8188EU: _rtw_pwr_wakeup call ips_leave....
[   49.658342] R8188EU: =3D=3D>ips_leave cnts:6
[   49.658353] R8188EU: =3D=3D=3D>  rtw_ips_pwr_up..............
[   49.658365] R8188EU: =3D=3D=3D> ips_netdrv_open.........
[   49.698952] R8188EU: _FWFreeToGo: Checksum report OK! REG_MCUFWDL:0x0003=
0004
[   49.699583] R8188EU: =3D=3D=3D=3D=3D> _8051Reset88E(): 8051 reset succes=
s .
[   49.702572] R8188EU: _FWFreeToGo: Polling FW ready success!!
REG_MCUFWDL:0x000300c6
[   49.853200] R8188EU: =3D=3D> rtl8188e_iol_efuse_patch
[   49.895701] R8188EU: pDM_Odm TxPowerTrackControl =3D 1
[   50.154837] R8188EU: rtl8188eu_hal_init in 496ms
[   50.154913] R8188EU: <=3D=3D=3D  rtw_ips_pwr_up.............. in 496ms
[   50.154923] R8188EU: INFO nolinked power save leave
[   50.155090] R8188EU: =3D=3D> ips_leave.....LED(0x00088282)...
[   50.619821] R8188EU: survey done event(1a)
[   52.159036] R8188EU: =3D=3D>rtw_ps_processor .fw_state(8)
[   52.159070] R8188EU: =3D=3D>ips_enter cnts:7
[   52.159077] R8188EU: INFO nolinked power save enter
[   52.159083] R8188EU: =3D=3D=3D> rtw_ips_pwr_down...................
[   52.159578] R8188EU: =3D=3D=3D=3D> rtw_ips_dev_unload...
[   52.187953] R8188EU: usb_read_port_cancel
[   52.192815] R8188EU: usb_read_port_complete() RX Warning!
bDriverStopped(0) OR bSurpriseRemoved(0) bReadPortCancel(1)
[   52.198163] R8188EU: usb_read_port_complete() RX Warning!
bDriverStopped(0) OR bSurpriseRemoved(0) bReadPortCancel(1)
[   52.204076] R8188EU: usb_read_port_complete() RX Warning!
bDriverStopped(0) OR bSurpriseRemoved(0) bReadPortCancel(1)
[   52.210005] R8188EU: usb_read_port_complete() RX Warning!
bDriverStopped(0) OR bSurpriseRemoved(0) bReadPortCancel(1)
[   52.211918] R8188EU: usb_write_port_cancel
[   52.213849] R8188EU: =3D=3D> rtl8188eu_hal_deinit
[   52.216999] R8188EU: bkeepfwalive(0)
[   52.223444] R8188EU: <=3D=3D=3D rtw_ips_pwr_down..................... in=
 64ms
[   55.622577] R8188EU: _rtw_pwr_wakeup call ips_leave....
[   55.622606] R8188EU: =3D=3D>ips_leave cnts:7
[   55.622616] R8188EU: =3D=3D=3D>  rtw_ips_pwr_up..............
[   55.622628] R8188EU: =3D=3D=3D> ips_netdrv_open.........
[   55.661327] R8188EU: _FWFreeToGo: Checksum report OK! REG_MCUFWDL:0x0003=
0004
[   55.661947] R8188EU: =3D=3D=3D=3D=3D> _8051Reset88E(): 8051 reset succes=
s .
[   55.664577] R8188EU: _FWFreeToGo: Polling FW ready success!!
REG_MCUFWDL:0x000300c6
[   55.811076] R8188EU: =3D=3D> rtl8188e_iol_efuse_patch
[   55.857078] R8188EU: pDM_Odm TxPowerTrackControl =3D 1
[   56.111089] R8188EU: rtl8188eu_hal_init in 492ms
[   56.111163] R8188EU: <=3D=3D=3D  rtw_ips_pwr_up.............. in 492ms
[   56.111173] R8188EU: INFO nolinked power save leave
[   56.111335] R8188EU: =3D=3D> ips_leave.....LED(0x00088282)...
[   56.544209] R8188EU: survey done event(18)
[   58.143049] R8188EU: =3D=3D>rtw_ps_processor .fw_state(8)
[   58.143083] R8188EU: =3D=3D>ips_enter cnts:8
[   58.143090] R8188EU: INFO nolinked power save enter
[   58.143096] R8188EU: =3D=3D=3D> rtw_ips_pwr_down...................
[   58.143578] R8188EU: =3D=3D=3D=3D> rtw_ips_dev_unload...
[   58.175081] R8188EU: usb_read_port_cancel
[   58.178467] R8188EU: usb_read_port_complete() RX Warning!
bDriverStopped(0) OR bSurpriseRemoved(0) bReadPortCancel(1)
[   58.183935] R8188EU: usb_read_port_complete() RX Warning!
bDriverStopped(0) OR bSurpriseRemoved(0) bReadPortCancel(1)
[   58.187185] R8188EU: usb_read_port_complete() RX Warning!
bDriverStopped(0) OR bSurpriseRemoved(0) bReadPortCancel(1)
[   58.190431] R8188EU: usb_read_port_complete() RX Warning!
bDriverStopped(0) OR bSurpriseRemoved(0) bReadPortCancel(1)
[   58.190456] R8188EU: usb_write_port_cancel
[   58.190544] R8188EU: =3D=3D> rtl8188eu_hal_deinit
[   58.190817] R8188EU: bkeepfwalive(0)
[   58.199452] R8188EU: <=3D=3D=3D rtw_ips_pwr_down..................... in=
 56ms
[   61.551307] R8188EU: _rtw_pwr_wakeup call ips_leave....
[   61.551338] R8188EU: =3D=3D>ips_leave cnts:8
[   61.551348] R8188EU: =3D=3D=3D>  rtw_ips_pwr_up..............
[   61.551359] R8188EU: =3D=3D=3D> ips_netdrv_open.........
[   61.593451] R8188EU: _FWFreeToGo: Checksum report OK! REG_MCUFWDL:0x0003=
0004
[   61.594071] R8188EU: =3D=3D=3D=3D=3D> _8051Reset88E(): 8051 reset succes=
s .
[   61.596699] R8188EU: _FWFreeToGo: Polling FW ready success!!
REG_MCUFWDL:0x000300c6
[   61.741578] R8188EU: =3D=3D> rtl8188e_iol_efuse_patch
[   61.797083] R8188EU: pDM_Odm TxPowerTrackControl =3D 1
[   62.078962] R8188EU: rtl8188eu_hal_init in 524ms
[   62.079070] R8188EU: <=3D=3D=3D  rtw_ips_pwr_up.............. in 528ms
[   62.079081] R8188EU: INFO nolinked power save leave
[   62.079210] R8188EU: =3D=3D> ips_leave.....LED(0x00088282)...
[   62.508210] R8188EU: survey done event(15)
[   64.095049] R8188EU: =3D=3D>rtw_ps_processor .fw_state(8)
[   64.095084] R8188EU: =3D=3D>ips_enter cnts:9
[   64.095092] R8188EU: INFO nolinked power save enter
[   64.095097] R8188EU: =3D=3D=3D> rtw_ips_pwr_down...................
[   64.095578] R8188EU: =3D=3D=3D=3D> rtw_ips_dev_unload...
[   64.123329] R8188EU: usb_read_port_cancel
[   64.126686] R8188EU: usb_read_port_complete() RX Warning!
bDriverStopped(0) OR bSurpriseRemoved(0) bReadPortCancel(1)
[   64.129938] R8188EU: usb_read_port_complete() RX Warning!
bDriverStopped(0) OR bSurpriseRemoved(0) bReadPortCancel(1)
[   64.132913] R8188EU: usb_read_port_complete() RX Warning!
bDriverStopped(0) OR bSurpriseRemoved(0) bReadPortCancel(1)
[   64.137060] R8188EU: usb_read_port_complete() RX Warning!
bDriverStopped(0) OR bSurpriseRemoved(0) bReadPortCancel(1)
[   64.137095] R8188EU: usb_write_port_cancel
[   64.137193] R8188EU: =3D=3D> rtl8188eu_hal_deinit
[   64.137445] R8188EU: bkeepfwalive(0)
[   64.143944] R8188EU: <=3D=3D=3D rtw_ips_pwr_down..................... in=
 48ms
[   67.513448] R8188EU: _rtw_pwr_wakeup call ips_leave....
[   67.513478] R8188EU: =3D=3D>ips_leave cnts:9
[   67.513489] R8188EU: =3D=3D=3D>  rtw_ips_pwr_up..............
[   67.513500] R8188EU: =3D=3D=3D> ips_netdrv_open.........
[   67.549828] R8188EU: _FWFreeToGo: Checksum report OK! REG_MCUFWDL:0x0003=
0004
[   67.550449] R8188EU: =3D=3D=3D=3D=3D> _8051Reset88E(): 8051 reset succes=
s .
[   67.553077] R8188EU: _FWFreeToGo: Polling FW ready success!!
REG_MCUFWDL:0x000300c6
[   67.676951] R8188EU: =3D=3D> rtl8188e_iol_efuse_patch
[   67.710954] R8188EU: pDM_Odm TxPowerTrackControl =3D 1
[   67.939579] R8188EU: rtl8188eu_hal_init in 428ms
[   67.939639] R8188EU: <=3D=3D=3D  rtw_ips_pwr_up.............. in 428ms
[   67.939647] R8188EU: INFO nolinked power save leave
[   67.939829] R8188EU: =3D=3D> ips_leave.....LED(0x00088282)...
[   68.368209] R8188EU: survey done event(1a)
[   69.951047] R8188EU: =3D=3D>rtw_ps_processor .fw_state(8)
[   69.951080] R8188EU: =3D=3D>ips_enter cnts:10
[   69.951089] R8188EU: INFO nolinked power save enter
[   69.951094] R8188EU: =3D=3D=3D> rtw_ips_pwr_down...................
[   69.951577] R8188EU: =3D=3D=3D=3D> rtw_ips_dev_unload...
[   69.979576] R8188EU: usb_read_port_cancel
[   69.982936] R8188EU: usb_read_port_complete() RX Warning!
bDriverStopped(0) OR bSurpriseRemoved(0) bReadPortCancel(1)
[   69.986185] R8188EU: usb_read_port_complete() RX Warning!
bDriverStopped(0) OR bSurpriseRemoved(0) bReadPortCancel(1)
[   69.991936] R8188EU: usb_read_port_complete() RX Warning!
bDriverStopped(0) OR bSurpriseRemoved(0) bReadPortCancel(1)
[   69.995059] R8188EU: usb_read_port_complete() RX Warning!
bDriverStopped(0) OR bSurpriseRemoved(0) bReadPortCancel(1)
[   69.995094] R8188EU: usb_write_port_cancel
[   69.995192] R8188EU: =3D=3D> rtl8188eu_hal_deinit
[   69.995445] R8188EU: bkeepfwalive(0)
[   70.006575] R8188EU: <=3D=3D=3D rtw_ips_pwr_down..................... in=
 52ms
[   73.375378] R8188EU: _rtw_pwr_wakeup call ips_leave....
[   73.375408] R8188EU: =3D=3D>ips_leave cnts:10
[   73.375419] R8188EU: =3D=3D=3D>  rtw_ips_pwr_up..............
[   73.375430] R8188EU: =3D=3D=3D> ips_netdrv_open.........
[   73.414074] R8188EU: _FWFreeToGo: Checksum report OK! REG_MCUFWDL:0x0003=
0004
[   73.414695] R8188EU: =3D=3D=3D=3D=3D> _8051Reset88E(): 8051 reset succes=
s .
[   73.417324] R8188EU: _FWFreeToGo: Polling FW ready success!!
REG_MCUFWDL:0x000300c6
[   73.577078] R8188EU: =3D=3D> rtl8188e_iol_efuse_patch
[   73.611082] R8188EU: pDM_Odm TxPowerTrackControl =3D 1
[   73.855585] R8188EU: rtl8188eu_hal_init in 480ms
[   73.855661] R8188EU: <=3D=3D=3D  rtw_ips_pwr_up.............. in 480ms
[   73.855670] R8188EU: INFO nolinked power save leave
[   73.855833] R8188EU: =3D=3D> ips_leave.....LED(0x00088282)...
[   74.280209] R8188EU: survey done event(14)
[   75.871044] R8188EU: =3D=3D>rtw_ps_processor .fw_state(8)
[   75.871077] R8188EU: =3D=3D>ips_enter cnts:11
[   75.871085] R8188EU: INFO nolinked power save enter
[   75.871091] R8188EU: =3D=3D=3D> rtw_ips_pwr_down...................
[   75.871578] R8188EU: =3D=3D=3D=3D> rtw_ips_dev_unload...
[   75.900204] R8188EU: usb_read_port_cancel
[   75.904050] R8188EU: usb_read_port_complete() RX Warning!
bDriverStopped(0) OR bSurpriseRemoved(0) bReadPortCancel(1)
[   75.907061] R8188EU: usb_read_port_complete() RX Warning!
bDriverStopped(0) OR bSurpriseRemoved(0) bReadPortCancel(1)
[   75.910323] R8188EU: usb_read_port_complete() RX Warning!
bDriverStopped(0) OR bSurpriseRemoved(0) bReadPortCancel(1)
[   75.914185] R8188EU: usb_read_port_complete() RX Warning!
bDriverStopped(0) OR bSurpriseRemoved(0) bReadPortCancel(1)
[   75.914224] R8188EU: usb_write_port_cancel
[   75.914320] R8188EU: =3D=3D> rtl8188eu_hal_deinit
[   75.914570] R8188EU: bkeepfwalive(0)
[   75.926949] R8188EU: <=3D=3D=3D rtw_ips_pwr_down..................... in=
 52ms
[   79.287292] R8188EU: _rtw_pwr_wakeup call ips_leave....
[   79.287322] R8188EU: =3D=3D>ips_leave cnts:11
[   79.287334] R8188EU: =3D=3D=3D>  rtw_ips_pwr_up..............
[   79.287345] R8188EU: =3D=3D=3D> ips_netdrv_open.........
[   79.324825] R8188EU: _FWFreeToGo: Checksum report OK! REG_MCUFWDL:0x0003=
0004
[   79.325446] R8188EU: =3D=3D=3D=3D=3D> _8051Reset88E(): 8051 reset succes=
s .
[   79.328074] R8188EU: _FWFreeToGo: Polling FW ready success!!
REG_MCUFWDL:0x000300c6
[   79.642576] R8188EU: =3D=3D> rtl8188e_iol_efuse_patch
[   79.692577] R8188EU: pDM_Odm TxPowerTrackControl =3D 1
[   79.935573] R8188EU: rtl8188eu_hal_init in 648ms
[   79.935630] R8188EU: <=3D=3D=3D  rtw_ips_pwr_up.............. in 648ms
[   79.935636] R8188EU: INFO nolinked power save leave
[   79.935696] R8188EU: =3D=3D> ips_leave.....LED(0x00088282)...
[   80.360209] R8188EU: survey done event(18)
[   81.951038] R8188EU: =3D=3D>rtw_ps_processor .fw_state(8)
[   81.951068] R8188EU: =3D=3D>ips_enter cnts:12
[   81.951077] R8188EU: INFO nolinked power save enter
[   81.951082] R8188EU: =3D=3D=3D> rtw_ips_pwr_down...................
[   81.951577] R8188EU: =3D=3D=3D=3D> rtw_ips_dev_unload...
[   81.984986] R8188EU: usb_read_port_cancel
[   81.988187] R8188EU: usb_read_port_complete() RX Warning!
bDriverStopped(0) OR bSurpriseRemoved(0) bReadPortCancel(1)
[   81.991433] R8188EU: usb_read_port_complete() RX Warning!
bDriverStopped(0) OR bSurpriseRemoved(0) bReadPortCancel(1)
[   81.994683] R8188EU: usb_read_port_complete() RX Warning!
bDriverStopped(0) OR bSurpriseRemoved(0) bReadPortCancel(1)
[   81.997732] R8188EU: usb_read_port_complete() RX Warning!
bDriverStopped(0) OR bSurpriseRemoved(0) bReadPortCancel(1)
[   81.998621] R8188EU: usb_write_port_cancel
[   82.000203] R8188EU: =3D=3D> rtl8188eu_hal_deinit
[   82.000457] R8188EU: bkeepfwalive(0)
[   82.011839] R8188EU: <=3D=3D=3D rtw_ips_pwr_down..................... in=
 60ms
[   85.363250] R8188EU: _rtw_pwr_wakeup call ips_leave....
[   85.363280] R8188EU: =3D=3D>ips_leave cnts:12
[   85.363292] R8188EU: =3D=3D=3D>  rtw_ips_pwr_up..............
[   85.363303] R8188EU: =3D=3D=3D> ips_netdrv_open.........
[   85.410952] R8188EU: _FWFreeToGo: Checksum report OK! REG_MCUFWDL:0x0003=
0004
[   85.411574] R8188EU: =3D=3D=3D=3D=3D> _8051Reset88E(): 8051 reset succes=
s .
[   85.414196] R8188EU: _FWFreeToGo: Polling FW ready success!!
REG_MCUFWDL:0x000300c6
[   85.590202] R8188EU: =3D=3D> rtl8188e_iol_efuse_patch
[   85.627581] R8188EU: pDM_Odm TxPowerTrackControl =3D 1
[   85.879579] R8188EU: rtl8188eu_hal_init in 516ms
[   85.879645] R8188EU: <=3D=3D=3D  rtw_ips_pwr_up.............. in 516ms
[   85.879653] R8188EU: INFO nolinked power save leave
[   85.879826] R8188EU: =3D=3D> ips_leave.....LED(0x00088282)...
[   86.304209] R8188EU: survey done event(1b)
[   87.903037] R8188EU: =3D=3D>rtw_ps_processor .fw_state(8)
[   87.903071] R8188EU: =3D=3D>ips_enter cnts:13
[   87.903080] R8188EU: INFO nolinked power save enter
[   87.903085] R8188EU: =3D=3D=3D> rtw_ips_pwr_down...................
[   87.903577] R8188EU: =3D=3D=3D=3D> rtw_ips_dev_unload...
[   87.933329] R8188EU: usb_read_port_cancel
[   87.937131] R8188EU: usb_read_port_complete() RX Warning!
bDriverStopped(0) OR bSurpriseRemoved(0) bReadPortCancel(1)
[   87.940552] R8188EU: usb_read_port_complete() RX Warning!
bDriverStopped(0) OR bSurpriseRemoved(0) bReadPortCancel(1)
[   87.944934] R8188EU: usb_read_port_complete() RX Warning!
bDriverStopped(0) OR bSurpriseRemoved(0) bReadPortCancel(1)
[   87.948182] R8188EU: usb_read_port_complete() RX Warning!
bDriverStopped(0) OR bSurpriseRemoved(0) bReadPortCancel(1)
[   87.948218] R8188EU: usb_write_port_cancel
[   87.948305] R8188EU: =3D=3D> rtl8188eu_hal_deinit
[   87.952344] R8188EU: bkeepfwalive(0)
[   87.965445] R8188EU: <=3D=3D=3D rtw_ips_pwr_down..................... in=
 60ms
[   91.311128] R8188EU: _rtw_pwr_wakeup call ips_leave....
[   91.311157] R8188EU: =3D=3D>ips_leave cnts:13
[   91.311169] R8188EU: =3D=3D=3D>  rtw_ips_pwr_up..............
[   91.311180] R8188EU: =3D=3D=3D> ips_netdrv_open.........
[   91.349454] R8188EU: _FWFreeToGo: Checksum report OK! REG_MCUFWDL:0x0003=
0004
[   91.350074] R8188EU: =3D=3D=3D=3D=3D> _8051Reset88E(): 8051 reset succes=
s .
[   91.354505] R8188EU: _FWFreeToGo: Polling FW ready success!!
REG_MCUFWDL:0x000300c6
[   91.508204] R8188EU: =3D=3D> rtl8188e_iol_efuse_patch
[   91.552700] R8188EU: pDM_Odm TxPowerTrackControl =3D 1
[   91.805040] R8188EU: rtl8188eu_hal_init in 492ms
[   91.806549] R8188EU: <=3D=3D=3D  rtw_ips_pwr_up.............. in 492ms
[   91.806792] R8188EU: INFO nolinked power save leave
[   91.809447] R8188EU: =3D=3D> ips_leave.....LED(0x00088282)...
[   92.248210] R8188EU: survey done event(1d)
[   93.823048] R8188EU: =3D=3D>rtw_ps_processor .fw_state(8)
[   93.823081] R8188EU: =3D=3D>ips_enter cnts:14
[   93.823090] R8188EU: INFO nolinked power save enter
[   93.823095] R8188EU: =3D=3D=3D> rtw_ips_pwr_down...................
[   93.823578] R8188EU: =3D=3D=3D=3D> rtw_ips_dev_unload...
[   93.850955] R8188EU: usb_read_port_cancel
[   93.854311] R8188EU: usb_read_port_complete() RX Warning!
bDriverStopped(0) OR bSurpriseRemoved(0) bReadPortCancel(1)
[   93.857558] R8188EU: usb_read_port_complete() RX Warning!
bDriverStopped(0) OR bSurpriseRemoved(0) bReadPortCancel(1)
[   93.860616] R8188EU: usb_read_port_complete() RX Warning!
bDriverStopped(0) OR bSurpriseRemoved(0) bReadPortCancel(1)
[   93.864686] R8188EU: usb_read_port_complete() RX Warning!
bDriverStopped(0) OR bSurpriseRemoved(0) bReadPortCancel(1)
[   93.864730] R8188EU: usb_write_port_cancel
[   93.864827] R8188EU: =3D=3D> rtl8188eu_hal_deinit
[   93.865071] R8188EU: bkeepfwalive(0)
[   93.871573] R8188EU: <=3D=3D=3D rtw_ips_pwr_down..................... in=
 48ms
[   97.253168] R8188EU: _rtw_pwr_wakeup call ips_leave....
[   97.253199] R8188EU: =3D=3D>ips_leave cnts:14
[   97.253211] R8188EU: =3D=3D=3D>  rtw_ips_pwr_up..............
[   97.253222] R8188EU: =3D=3D=3D> ips_netdrv_open.........
[   97.294951] R8188EU: _FWFreeToGo: Checksum report OK! REG_MCUFWDL:0x0003=
0004
[   97.295574] R8188EU: =3D=3D=3D=3D=3D> _8051Reset88E(): 8051 reset succes=
s .
[   97.298197] R8188EU: _FWFreeToGo: Polling FW ready success!!
REG_MCUFWDL:0x000300c6
[   97.448700] R8188EU: =3D=3D> rtl8188e_iol_efuse_patch
[   97.497451] R8188EU: pDM_Odm TxPowerTrackControl =3D 1
[   97.731453] R8188EU: rtl8188eu_hal_init in 480ms
[   97.731518] R8188EU: <=3D=3D=3D  rtw_ips_pwr_up.............. in 480ms
[   97.731526] R8188EU: INFO nolinked power save leave
[   97.731606] R8188EU: =3D=3D> ips_leave.....LED(0x00088282)...
[   98.165083] R8188EU: survey done event(15)
[   99.743038] R8188EU: =3D=3D>rtw_ps_processor .fw_state(8)
[   99.743072] R8188EU: =3D=3D>ips_enter cnts:15
[   99.743081] R8188EU: INFO nolinked power save enter
[   99.743087] R8188EU: =3D=3D=3D> rtw_ips_pwr_down...................
[   99.743577] R8188EU: =3D=3D=3D=3D> rtw_ips_dev_unload...
[   99.773204] R8188EU: usb_read_port_cancel
[   99.776707] R8188EU: usb_read_port_complete() RX Warning!
bDriverStopped(0) OR bSurpriseRemoved(0) bReadPortCancel(1)
[   99.779997] R8188EU: usb_read_port_complete() RX Warning!
bDriverStopped(0) OR bSurpriseRemoved(0) bReadPortCancel(1)
[   99.784311] R8188EU: usb_read_port_complete() RX Warning!
bDriverStopped(0) OR bSurpriseRemoved(0) bReadPortCancel(1)
[   99.787058] R8188EU: usb_read_port_complete() RX Warning!
bDriverStopped(0) OR bSurpriseRemoved(0) bReadPortCancel(1)
[   99.787080] R8188EU: usb_write_port_cancel
[   99.787169] R8188EU: =3D=3D> rtl8188eu_hal_deinit
[   99.787446] R8188EU: bkeepfwalive(0)
[   99.800642] R8188EU: <=3D=3D=3D rtw_ips_pwr_down..................... in=
 56ms
[  103.175071] R8188EU: _rtw_pwr_wakeup call ips_leave....
[  103.175103] R8188EU: =3D=3D>ips_leave cnts:15
[  103.175115] R8188EU: =3D=3D=3D>  rtw_ips_pwr_up..............
[  103.175126] R8188EU: =3D=3D=3D> ips_netdrv_open.........
[  103.221825] R8188EU: _FWFreeToGo: Checksum report OK! REG_MCUFWDL:0x0003=
0004
[  103.222446] R8188EU: =3D=3D=3D=3D=3D> _8051Reset88E(): 8051 reset succes=
s .
[  103.225073] R8188EU: _FWFreeToGo: Polling FW ready success!!
REG_MCUFWDL:0x000300c6
[  103.380825] R8188EU: =3D=3D> rtl8188e_iol_efuse_patch
[  103.418956] R8188EU: pDM_Odm TxPowerTrackControl =3D 1
[  103.670961] R8188EU: rtl8188eu_hal_init in 492ms
[  103.671068] R8188EU: <=3D=3D=3D  rtw_ips_pwr_up.............. in 496ms
[  103.671078] R8188EU: INFO nolinked power save leave
[  103.671210] R8188EU: =3D=3D> ips_leave.....LED(0x00088282)...
[  104.096209] R8188EU: survey done event(1e)
[  105.695073] R8188EU: =3D=3D>rtw_ps_processor .fw_state(8)
[  105.695109] R8188EU: =3D=3D>ips_enter cnts:16
[  105.695118] R8188EU: INFO nolinked power save enter
[  105.695123] R8188EU: =3D=3D=3D> rtw_ips_pwr_down...................
[  105.695709] R8188EU: =3D=3D=3D=3D> rtw_ips_dev_unload...
[  105.723332] R8188EU: usb_read_port_cancel
[  105.726686] R8188EU: usb_read_port_complete() RX Warning!
bDriverStopped(0) OR bSurpriseRemoved(0) bReadPortCancel(1)
[  105.729936] R8188EU: usb_read_port_complete() RX Warning!
bDriverStopped(0) OR bSurpriseRemoved(0) bReadPortCancel(1)
[  105.733101] R8188EU: usb_read_port_complete() RX Warning!
bDriverStopped(0) OR bSurpriseRemoved(0) bReadPortCancel(1)
[  105.737559] R8188EU: usb_read_port_complete() RX Warning!
bDriverStopped(0) OR bSurpriseRemoved(0) bReadPortCancel(1)
[  105.737596] R8188EU: usb_write_port_cancel
[  105.737693] R8188EU: =3D=3D> rtl8188eu_hal_deinit
[  105.737945] R8188EU: bkeepfwalive(0)
[  105.744447] R8188EU: <=3D=3D=3D rtw_ips_pwr_down..................... in=
 48ms
[  109.103028] R8188EU: _rtw_pwr_wakeup call ips_leave....
[  109.103056] R8188EU: =3D=3D>ips_leave cnts:16
[  109.103068] R8188EU: =3D=3D=3D>  rtw_ips_pwr_up..............
[  109.103078] R8188EU: =3D=3D=3D> ips_netdrv_open.........
[  109.131701] R8188EU: _FWFreeToGo: Checksum report OK! REG_MCUFWDL:0x0003=
0004
[  109.132322] R8188EU: =3D=3D=3D=3D=3D> _8051Reset88E(): 8051 reset succes=
s .
[  109.136527] R8188EU: _FWFreeToGo: Polling FW ready success!!
REG_MCUFWDL:0x000300c6
[  109.282450] R8188EU: =3D=3D> rtl8188e_iol_efuse_patch
[  109.328202] R8188EU: pDM_Odm TxPowerTrackControl =3D 1
[  109.570961] R8188EU: rtl8188eu_hal_init in 464ms
[  109.571065] R8188EU: <=3D=3D=3D  rtw_ips_pwr_up.............. in 468ms
[  109.571075] R8188EU: INFO nolinked power save leave
[  109.571211] R8188EU: =3D=3D> ips_leave.....LED(0x00088282)...
[  110.000208] R8188EU: survey done event(17)
[  111.583049] R8188EU: =3D=3D>rtw_ps_processor .fw_state(8)
[  111.583080] R8188EU: =3D=3D>ips_enter cnts:17
[  111.583089] R8188EU: INFO nolinked power save enter
[  111.583095] R8188EU: =3D=3D=3D> rtw_ips_pwr_down...................
[  111.583579] R8188EU: =3D=3D=3D=3D> rtw_ips_dev_unload...
[  111.611081] R8188EU: usb_read_port_cancel
[  111.614436] R8188EU: usb_read_port_complete() RX Warning!
bDriverStopped(0) OR bSurpriseRemoved(0) bReadPortCancel(1)
[  111.617686] R8188EU: usb_read_port_complete() RX Warning!
bDriverStopped(0) OR bSurpriseRemoved(0) bReadPortCancel(1)
[  111.620901] R8188EU: usb_read_port_complete() RX Warning!
bDriverStopped(0) OR bSurpriseRemoved(0) bReadPortCancel(1)
[  111.625435] R8188EU: usb_read_port_complete() RX Warning!
bDriverStopped(0) OR bSurpriseRemoved(0) bReadPortCancel(1)
[  111.625469] R8188EU: usb_write_port_cancel
[  111.625567] R8188EU: =3D=3D> rtl8188eu_hal_deinit
[  111.625820] R8188EU: bkeepfwalive(0)
[  111.632319] R8188EU: <=3D=3D=3D rtw_ips_pwr_down..................... in=
 48ms
[  115.003324] R8188EU: _rtw_pwr_wakeup call ips_leave....
[  115.003354] R8188EU: =3D=3D>ips_leave cnts:17
[  115.003366] R8188EU: =3D=3D=3D>  rtw_ips_pwr_up..............
[  115.003377] R8188EU: =3D=3D=3D> ips_netdrv_open.........
[  115.035451] R8188EU: _FWFreeToGo: Checksum report OK! REG_MCUFWDL:0x0003=
0004
[  115.036072] R8188EU: =3D=3D=3D=3D=3D> _8051Reset88E(): 8051 reset succes=
s .
[  115.038698] R8188EU: _FWFreeToGo: Polling FW ready success!!
REG_MCUFWDL:0x000300c6
[  115.210449] R8188EU: =3D=3D> rtl8188e_iol_efuse_patch
[  115.259577] R8188EU: pDM_Odm TxPowerTrackControl =3D 1
[  115.491585] R8188EU: rtl8188eu_hal_init in 488ms
[  115.491661] R8188EU: <=3D=3D=3D  rtw_ips_pwr_up.............. in 488ms
[  115.491670] R8188EU: INFO nolinked power save leave
[  115.491834] R8188EU: =3D=3D> ips_leave.....LED(0x00088282)...
[  115.916208] R8188EU: survey done event(e)
[  117.503036] R8188EU: =3D=3D>rtw_ps_processor .fw_state(8)
[  117.503070] R8188EU: =3D=3D>ips_enter cnts:18
[  117.503078] R8188EU: INFO nolinked power save enter
[  117.503083] R8188EU: =3D=3D=3D> rtw_ips_pwr_down...................
[  117.503576] R8188EU: =3D=3D=3D=3D> rtw_ips_dev_unload...
[  117.531704] R8188EU: usb_read_port_cancel
[  117.535060] R8188EU: usb_read_port_complete() RX Warning!
bDriverStopped(0) OR bSurpriseRemoved(0) bReadPortCancel(1)
[  117.538309] R8188EU: usb_read_port_complete() RX Warning!
bDriverStopped(0) OR bSurpriseRemoved(0) bReadPortCancel(1)
[  117.541582] R8188EU: usb_read_port_complete() RX Warning!
bDriverStopped(0) OR bSurpriseRemoved(0) bReadPortCancel(1)
[  117.546060] R8188EU: usb_read_port_complete() RX Warning!
bDriverStopped(0) OR bSurpriseRemoved(0) bReadPortCancel(1)
[  117.546098] R8188EU: usb_write_port_cancel
[  117.546196] R8188EU: =3D=3D> rtl8188eu_hal_deinit
[  117.546445] R8188EU: bkeepfwalive(0)
[  117.552947] R8188EU: <=3D=3D=3D rtw_ips_pwr_down..................... in=
 48ms
[  120.923584] R8188EU: _rtw_pwr_wakeup call ips_leave....
[  120.923610] R8188EU: =3D=3D>ips_leave cnts:18
[  120.923621] R8188EU: =3D=3D=3D>  rtw_ips_pwr_up..............
[  120.923631] R8188EU: =3D=3D=3D> ips_netdrv_open.........
[  120.963576] R8188EU: _FWFreeToGo: Checksum report OK! REG_MCUFWDL:0x0003=
0004
[  120.964197] R8188EU: =3D=3D=3D=3D=3D> _8051Reset88E(): 8051 reset succes=
s .
[  120.968443] R8188EU: _FWFreeToGo: Polling FW ready success!!
REG_MCUFWDL:0x000300c6
[  121.118451] R8188EU: =3D=3D> rtl8188e_iol_efuse_patch
[  121.167450] R8188EU: pDM_Odm TxPowerTrackControl =3D 1
[  121.415585] R8188EU: rtl8188eu_hal_init in 492ms
[  121.415660] R8188EU: <=3D=3D=3D  rtw_ips_pwr_up.............. in 492ms
[  121.415669] R8188EU: INFO nolinked power save leave
[  121.415832] R8188EU: =3D=3D> ips_leave.....LED(0x00088282)...
[  121.852959] R8188EU: survey done event(13)
[  123.423036] R8188EU: =3D=3D>rtw_ps_processor .fw_state(8)
[  123.423070] R8188EU: =3D=3D>ips_enter cnts:19
[  123.423078] R8188EU: INFO nolinked power save enter
[  123.423084] R8188EU: =3D=3D=3D> rtw_ips_pwr_down...................
[  123.423577] R8188EU: =3D=3D=3D=3D> rtw_ips_dev_unload...
[  123.453455] R8188EU: usb_read_port_cancel
[  123.457283] R8188EU: usb_read_port_complete() RX Warning!
bDriverStopped(0) OR bSurpriseRemoved(0) bReadPortCancel(1)
[  123.461399] R8188EU: usb_read_port_complete() RX Warning!
bDriverStopped(0) OR bSurpriseRemoved(0) bReadPortCancel(1)
[  123.465558] R8188EU: usb_read_port_complete() RX Warning!
bDriverStopped(0) OR bSurpriseRemoved(0) bReadPortCancel(1)
[  123.468807] R8188EU: usb_read_port_complete() RX Warning!
bDriverStopped(0) OR bSurpriseRemoved(0) bReadPortCancel(1)
[  123.468843] R8188EU: usb_write_port_cancel
[  123.468930] R8188EU: =3D=3D> rtl8188eu_hal_deinit
[  123.470978] R8188EU: bkeepfwalive(0)
[  123.486071] R8188EU: <=3D=3D=3D rtw_ips_pwr_down..................... in=
 60ms
[  126.861067] R8188EU: _rtw_pwr_wakeup call ips_leave....
[  126.861094] R8188EU: =3D=3D>ips_leave cnts:19
[  126.861105] R8188EU: =3D=3D=3D>  rtw_ips_pwr_up..............
[  126.861116] R8188EU: =3D=3D=3D> ips_netdrv_open.........
[  126.896200] R8188EU: _FWFreeToGo: Checksum report OK! REG_MCUFWDL:0x0003=
0004
[  126.896821] R8188EU: =3D=3D=3D=3D=3D> _8051Reset88E(): 8051 reset succes=
s .
[  126.899449] R8188EU: _FWFreeToGo: Polling FW ready success!!
REG_MCUFWDL:0x000300c6
[  127.048327] R8188EU: =3D=3D> rtl8188e_iol_efuse_patch
[  127.106578] R8188EU: pDM_Odm TxPowerTrackControl =3D 1
[  127.355587] R8188EU: rtl8188eu_hal_init in 496ms
[  127.355665] R8188EU: <=3D=3D=3D  rtw_ips_pwr_up.............. in 496ms
[  127.355675] R8188EU: INFO nolinked power save leave
[  127.355833] R8188EU: =3D=3D> ips_leave.....LED(0x00088282)...
[  127.780207] R8188EU: survey done event(17)
[  129.375037] R8188EU: =3D=3D>rtw_ps_processor .fw_state(8)
[  129.375068] R8188EU: =3D=3D>ips_enter cnts:20
[  129.375076] R8188EU: INFO nolinked power save enter
[  129.375082] R8188EU: =3D=3D=3D> rtw_ips_pwr_down...................
[  129.375577] R8188EU: =3D=3D=3D=3D> rtw_ips_dev_unload...
[  129.403704] R8188EU: usb_read_port_cancel
[  129.407060] R8188EU: usb_read_port_complete() RX Warning!
bDriverStopped(0) OR bSurpriseRemoved(0) bReadPortCancel(1)
[  129.410309] R8188EU: usb_read_port_complete() RX Warning!
bDriverStopped(0) OR bSurpriseRemoved(0) bReadPortCancel(1)
[  129.413413] R8188EU: usb_read_port_complete() RX Warning!
bDriverStopped(0) OR bSurpriseRemoved(0) bReadPortCancel(1)
[  129.417685] R8188EU: usb_read_port_complete() RX Warning!
bDriverStopped(0) OR bSurpriseRemoved(0) bReadPortCancel(1)
[  129.417721] R8188EU: usb_write_port_cancel
[  129.417817] R8188EU: =3D=3D> rtl8188eu_hal_deinit
[  129.418070] R8188EU: bkeepfwalive(0)
[  129.424570] R8188EU: <=3D=3D=3D rtw_ips_pwr_down..................... in=
 48ms
[  132.787703] R8188EU: _rtw_pwr_wakeup call ips_leave....
[  132.787729] R8188EU: =3D=3D>ips_leave cnts:20
[  132.787740] R8188EU: =3D=3D=3D>  rtw_ips_pwr_up..............
[  132.787751] R8188EU: =3D=3D=3D> ips_netdrv_open.........
[  132.837580] R8188EU: _FWFreeToGo: Checksum report OK! REG_MCUFWDL:0x0003=
0004
[  132.838200] R8188EU: =3D=3D=3D=3D=3D> _8051Reset88E(): 8051 reset succes=
s .
[  132.844461] R8188EU: _FWFreeToGo: Polling FW ready success!!
REG_MCUFWDL:0x000300c6
[  132.997823] R8188EU: =3D=3D> rtl8188e_iol_efuse_patch
[  133.045578] R8188EU: pDM_Odm TxPowerTrackControl =3D 1
[  133.295585] R8188EU: rtl8188eu_hal_init in 508ms
[  133.295662] R8188EU: <=3D=3D=3D  rtw_ips_pwr_up.............. in 508ms
[  133.295672] R8188EU: INFO nolinked power save leave
[  133.295833] R8188EU: =3D=3D> ips_leave.....LED(0x00088282)...
[  133.720208] R8188EU: survey done event(15)
[  135.327037] R8188EU: =3D=3D>rtw_ps_processor .fw_state(8)
[  135.327070] R8188EU: =3D=3D>ips_enter cnts:21
[  135.327078] R8188EU: INFO nolinked power save enter
[  135.327084] R8188EU: =3D=3D=3D> rtw_ips_pwr_down...................
[  135.327577] R8188EU: =3D=3D=3D=3D> rtw_ips_dev_unload...
[  135.358974] R8188EU: usb_read_port_cancel
[  135.362310] R8188EU: usb_read_port_complete() RX Warning!
bDriverStopped(0) OR bSurpriseRemoved(0) bReadPortCancel(1)
[  135.365559] R8188EU: usb_read_port_complete() RX Warning!
bDriverStopped(0) OR bSurpriseRemoved(0) bReadPortCancel(1)
[  135.368807] R8188EU: usb_read_port_complete() RX Warning!
bDriverStopped(0) OR bSurpriseRemoved(0) bReadPortCancel(1)
[  135.372407] R8188EU: usb_read_port_complete() RX Warning!
bDriverStopped(0) OR bSurpriseRemoved(0) bReadPortCancel(1)
[  135.373725] R8188EU: usb_write_port_cancel
[  135.374493] R8188EU: =3D=3D> rtl8188eu_hal_deinit
[  135.374823] R8188EU: bkeepfwalive(0)
[  135.384414] R8188EU: <=3D=3D=3D rtw_ips_pwr_down..................... in=
 56ms
[  138.727185] R8188EU: _rtw_pwr_wakeup call ips_leave....
[  138.727213] R8188EU: =3D=3D>ips_leave cnts:21
[  138.727224] R8188EU: =3D=3D=3D>  rtw_ips_pwr_up..............
[  138.727234] R8188EU: =3D=3D=3D> ips_netdrv_open.........
[  138.766451] R8188EU: _FWFreeToGo: Checksum report OK! REG_MCUFWDL:0x0003=
0004
[  138.767075] R8188EU: =3D=3D=3D=3D=3D> _8051Reset88E(): 8051 reset succes=
s .
[  138.769698] R8188EU: _FWFreeToGo: Polling FW ready success!!
REG_MCUFWDL:0x000300c6
[  138.939699] R8188EU: =3D=3D> rtl8188e_iol_efuse_patch
[  138.985076] R8188EU: pDM_Odm TxPowerTrackControl =3D 1
[  139.222960] R8188EU: rtl8188eu_hal_init in 492ms
[  139.223048] R8188EU: <=3D=3D=3D  rtw_ips_pwr_up.............. in 496ms
[  139.223059] R8188EU: INFO nolinked power save leave
[  139.223208] R8188EU: =3D=3D> ips_leave.....LED(0x00088282)...
[  139.648208] R8188EU: survey done event(10)
[  141.247036] R8188EU: =3D=3D>rtw_ps_processor .fw_state(8)
[  141.247068] R8188EU: =3D=3D>ips_enter cnts:22
[  141.247077] R8188EU: INFO nolinked power save enter
[  141.247082] R8188EU: =3D=3D=3D> rtw_ips_pwr_down...................
[  141.247827] R8188EU: =3D=3D=3D=3D> rtw_ips_dev_unload...
[  141.276954] R8188EU: usb_read_port_cancel
[  141.280771] R8188EU: usb_read_port_complete() RX Warning!
bDriverStopped(0) OR bSurpriseRemoved(0) bReadPortCancel(1)
[  141.283883] R8188EU: usb_read_port_complete() RX Warning!
bDriverStopped(0) OR bSurpriseRemoved(0) bReadPortCancel(1)
[  141.287064] R8188EU: usb_read_port_complete() RX Warning!
bDriverStopped(0) OR bSurpriseRemoved(0) bReadPortCancel(1)
[  141.290306] R8188EU: usb_read_port_complete() RX Warning!
bDriverStopped(0) OR bSurpriseRemoved(0) bReadPortCancel(1)
[  141.290326] R8188EU: usb_write_port_cancel
[  141.290411] R8188EU: =3D=3D> rtl8188eu_hal_deinit
[  141.290691] R8188EU: bkeepfwalive(0)
[  141.302199] R8188EU: <=3D=3D=3D rtw_ips_pwr_down..................... in=
 52ms
[  144.650932] R8188EU: _rtw_pwr_wakeup call ips_leave....
[  144.650959] R8188EU: =3D=3D>ips_leave cnts:22
[  144.650972] R8188EU: =3D=3D=3D>  rtw_ips_pwr_up..............
[  144.650983] R8188EU: =3D=3D=3D> ips_netdrv_open.........
[  144.692075] R8188EU: _FWFreeToGo: Checksum report OK! REG_MCUFWDL:0x0003=
0004
[  144.692695] R8188EU: =3D=3D=3D=3D=3D> _8051Reset88E(): 8051 reset succes=
s .
[  144.697703] R8188EU: _FWFreeToGo: Polling FW ready success!!
REG_MCUFWDL:0x000300c6
[  144.863730] R8188EU: =3D=3D> rtl8188e_iol_efuse_patch
[  144.910826] R8188EU: pDM_Odm TxPowerTrackControl =3D 1
[  145.159574] R8188EU: rtl8188eu_hal_init in 508ms
[  145.159633] R8188EU: <=3D=3D=3D  rtw_ips_pwr_up.............. in 512ms
[  145.159640] R8188EU: INFO nolinked power save leave
[  145.159823] R8188EU: =3D=3D> ips_leave.....LED(0x00088282)...
[  145.584208] R8188EU: survey done event(16)
[  147.167034] R8188EU: =3D=3D>rtw_ps_processor .fw_state(8)
[  147.167067] R8188EU: =3D=3D>ips_enter cnts:23
[  147.167075] R8188EU: INFO nolinked power save enter
[  147.167081] R8188EU: =3D=3D=3D> rtw_ips_pwr_down...................
[  147.167576] R8188EU: =3D=3D=3D=3D> rtw_ips_dev_unload...
[  147.197579] R8188EU: usb_read_port_cancel
[  147.201160] R8188EU: usb_read_port_complete() RX Warning!
bDriverStopped(0) OR bSurpriseRemoved(0) bReadPortCancel(1)
[  147.205894] R8188EU: usb_read_port_complete() RX Warning!
bDriverStopped(0) OR bSurpriseRemoved(0) bReadPortCancel(1)
[  147.209183] R8188EU: usb_read_port_complete() RX Warning!
bDriverStopped(0) OR bSurpriseRemoved(0) bReadPortCancel(1)
[  147.212431] R8188EU: usb_read_port_complete() RX Warning!
bDriverStopped(0) OR bSurpriseRemoved(0) bReadPortCancel(1)
[  147.212465] R8188EU: usb_write_port_cancel
[  147.212552] R8188EU: =3D=3D> rtl8188eu_hal_deinit
[  147.214601] R8188EU: bkeepfwalive(0)
[  147.226446] R8188EU: <=3D=3D=3D rtw_ips_pwr_down..................... in=
 56ms
[  150.591290] R8188EU: _rtw_pwr_wakeup call ips_leave....
[  150.591320] R8188EU: =3D=3D>ips_leave cnts:23
[  150.591331] R8188EU: =3D=3D=3D>  rtw_ips_pwr_up..............
[  150.591342] R8188EU: =3D=3D=3D> ips_netdrv_open.........
[  150.622826] R8188EU: _FWFreeToGo: Checksum report OK! REG_MCUFWDL:0x0003=
0004
[  150.623455] R8188EU: =3D=3D=3D=3D=3D> _8051Reset88E(): 8051 reset succes=
s .
[  150.626072] R8188EU: _FWFreeToGo: Polling FW ready success!!
REG_MCUFWDL:0x000300c6
[  150.743080] R8188EU: =3D=3D> rtl8188e_iol_efuse_patch
[  150.777079] R8188EU: pDM_Odm TxPowerTrackControl =3D 1
[  151.011575] R8188EU: rtl8188eu_hal_init in 420ms
[  151.011635] R8188EU: <=3D=3D=3D  rtw_ips_pwr_up.............. in 420ms
[  151.011641] R8188EU: INFO nolinked power save leave
[  151.011714] R8188EU: =3D=3D> ips_leave.....LED(0x00088282)...
[  151.448209] R8188EU: survey done event(17)
[  153.023064] R8188EU: =3D=3D>rtw_ps_processor .fw_state(8)
[  153.023097] R8188EU: =3D=3D>ips_enter cnts:24
[  153.023106] R8188EU: INFO nolinked power save enter
[  153.023111] R8188EU: =3D=3D=3D> rtw_ips_pwr_down...................
[  153.023577] R8188EU: =3D=3D=3D=3D> rtw_ips_dev_unload...
[  153.053205] R8188EU: usb_read_port_cancel
[  153.056713] R8188EU: usb_read_port_complete() RX Warning!
bDriverStopped(0) OR bSurpriseRemoved(0) bReadPortCancel(1)
[  153.060940] R8188EU: usb_read_port_complete() RX Warning!
bDriverStopped(0) OR bSurpriseRemoved(0) bReadPortCancel(1)
[  153.065312] R8188EU: usb_read_port_complete() RX Warning!
bDriverStopped(0) OR bSurpriseRemoved(0) bReadPortCancel(1)
[  153.068559] R8188EU: usb_read_port_complete() RX Warning!
bDriverStopped(0) OR bSurpriseRemoved(0) bReadPortCancel(1)
[  153.068581] R8188EU: usb_write_port_cancel
[  153.068669] R8188EU: =3D=3D> rtl8188eu_hal_deinit
[  153.068945] R8188EU: bkeepfwalive(0)
[  153.087694] R8188EU: <=3D=3D=3D rtw_ips_pwr_down..................... in=
 64ms
[  156.452396] R8188EU: _rtw_pwr_wakeup call ips_leave....
[  156.452426] R8188EU: =3D=3D>ips_leave cnts:24
[  156.452438] R8188EU: =3D=3D=3D>  rtw_ips_pwr_up..............
[  156.452450] R8188EU: =3D=3D=3D> ips_netdrv_open.........
[  156.507570] R8188EU: _FWFreeToGo: Checksum report OK! REG_MCUFWDL:0x0003=
0004
[  156.508446] R8188EU: =3D=3D=3D=3D=3D> _8051Reset88E(): 8051 reset succes=
s .
[  156.511075] R8188EU: _FWFreeToGo: Polling FW ready success!!
REG_MCUFWDL:0x000300c6
[  156.649447] R8188EU: =3D=3D> rtl8188e_iol_efuse_patch
[  156.689701] R8188EU: pDM_Odm TxPowerTrackControl =3D 1
[  156.926959] R8188EU: rtl8188eu_hal_init in 472ms
[  156.927052] R8188EU: <=3D=3D=3D  rtw_ips_pwr_up.............. in 476ms
[  156.927062] R8188EU: INFO nolinked power save leave
[  156.927208] R8188EU: =3D=3D> ips_leave.....LED(0x00088282)...
[  157.352208] R8188EU: survey done event(12)
[  158.943036] R8188EU: =3D=3D>rtw_ps_processor .fw_state(8)
[  158.943069] R8188EU: =3D=3D>ips_enter cnts:25
[  158.943077] R8188EU: INFO nolinked power save enter
[  158.943083] R8188EU: =3D=3D=3D> rtw_ips_pwr_down...................
[  158.943578] R8188EU: =3D=3D=3D=3D> rtw_ips_dev_unload...
[  158.971330] R8188EU: usb_read_port_cancel
[  158.974685] R8188EU: usb_read_port_complete() RX Warning!
bDriverStopped(0) OR bSurpriseRemoved(0) bReadPortCancel(1)
[  158.977938] R8188EU: usb_read_port_complete() RX Warning!
bDriverStopped(0) OR bSurpriseRemoved(0) bReadPortCancel(1)
[  158.981753] R8188EU: usb_read_port_complete() RX Warning!
bDriverStopped(0) OR bSurpriseRemoved(0) bReadPortCancel(1)
[  158.986811] R8188EU: usb_read_port_complete() RX Warning!
bDriverStopped(0) OR bSurpriseRemoved(0) bReadPortCancel(1)
[  158.986841] R8188EU: usb_write_port_cancel
[  158.986938] R8188EU: =3D=3D> rtl8188eu_hal_deinit
[  158.987198] R8188EU: bkeepfwalive(0)
[  158.998196] R8188EU: <=3D=3D=3D rtw_ips_pwr_down..................... in=
 52ms
[  162.359146] R8188EU: _rtw_pwr_wakeup call ips_leave....
[  162.359175] R8188EU: =3D=3D>ips_leave cnts:25
[  162.359186] R8188EU: =3D=3D=3D>  rtw_ips_pwr_up..............
[  162.359197] R8188EU: =3D=3D=3D> ips_netdrv_open.........
[  162.401082] R8188EU: _FWFreeToGo: Checksum report OK! REG_MCUFWDL:0x0003=
0004
[  162.406698] R8188EU: =3D=3D=3D=3D=3D> _8051Reset88E(): 8051 reset succes=
s .
[  162.408698] R8188EU: _FWFreeToGo: Polling FW ready success!!
REG_MCUFWDL:0x000300c6
[  162.585075] R8188EU: =3D=3D> rtl8188e_iol_efuse_patch
[  162.633182] R8188EU: pDM_Odm TxPowerTrackControl =3D 1
[  162.871576] R8188EU: rtl8188eu_hal_init in 512ms
[  162.871634] R8188EU: <=3D=3D=3D  rtw_ips_pwr_up.............. in 512ms
[  162.871641] R8188EU: INFO nolinked power save leave
[  162.871824] R8188EU: =3D=3D> ips_leave.....LED(0x00088282)...
[  163.304208] R8188EU: survey done event(17)
[  164.895035] R8188EU: =3D=3D>rtw_ps_processor .fw_state(8)
[  164.895067] R8188EU: =3D=3D>ips_enter cnts:26
[  164.895076] R8188EU: INFO nolinked power save enter
[  164.895082] R8188EU: =3D=3D=3D> rtw_ips_pwr_down...................
[  164.895827] R8188EU: =3D=3D=3D=3D> rtw_ips_dev_unload...
[  164.923455] R8188EU: usb_read_port_cancel
[  164.926810] R8188EU: usb_read_port_complete() RX Warning!
bDriverStopped(0) OR bSurpriseRemoved(0) bReadPortCancel(1)
[  164.930574] R8188EU: usb_read_port_complete() RX Warning!
bDriverStopped(0) OR bSurpriseRemoved(0) bReadPortCancel(1)
[  164.935687] R8188EU: usb_read_port_complete() RX Warning!
bDriverStopped(0) OR bSurpriseRemoved(0) bReadPortCancel(1)
[  164.938933] R8188EU: usb_read_port_complete() RX Warning!
bDriverStopped(0) OR bSurpriseRemoved(0) bReadPortCancel(1)
[  164.938967] R8188EU: usb_write_port_cancel
[  164.939081] R8188EU: =3D=3D> rtl8188eu_hal_deinit
[  164.939320] R8188EU: bkeepfwalive(0)
[  164.945821] R8188EU: <=3D=3D=3D rtw_ips_pwr_down..................... in=
 48ms
[  168.310434] R8188EU: _rtw_pwr_wakeup call ips_leave....
[  168.310465] R8188EU: =3D=3D>ips_leave cnts:26
[  168.310476] R8188EU: =3D=3D=3D>  rtw_ips_pwr_up..............
[  168.310488] R8188EU: =3D=3D=3D> ips_netdrv_open.........
[  168.338451] R8188EU: _FWFreeToGo: Checksum report OK! REG_MCUFWDL:0x0003=
0004
[  168.339075] R8188EU: =3D=3D=3D=3D=3D> _8051Reset88E(): 8051 reset succes=
s .
[  168.341696] R8188EU: _FWFreeToGo: Polling FW ready success!!
REG_MCUFWDL:0x000300c6
[  168.508198] R8188EU: =3D=3D> rtl8188e_iol_efuse_patch
[  168.550076] R8188EU: pDM_Odm TxPowerTrackControl =3D 1
[  168.819091] R8188EU: rtl8188eu_hal_init in 512ms
[  168.819167] R8188EU: <=3D=3D=3D  rtw_ips_pwr_up.............. in 512ms
[  168.819176] R8188EU: INFO nolinked power save leave
[  168.819335] R8188EU: =3D=3D> ips_leave.....LED(0x00088282)...
[  169.252208] R8188EU: survey done event(14)
[  170.847036] R8188EU: =3D=3D>rtw_ps_processor .fw_state(8)
[  170.847069] R8188EU: =3D=3D>ips_enter cnts:27
[  170.847077] R8188EU: INFO nolinked power save enter
[  170.847083] R8188EU: =3D=3D=3D> rtw_ips_pwr_down...................
[  170.847577] R8188EU: =3D=3D=3D=3D> rtw_ips_dev_unload...
[  170.870957] R8188EU: usb_read_port_cancel
[  170.874343] R8188EU: usb_read_port_complete() RX Warning!
bDriverStopped(0) OR bSurpriseRemoved(0) bReadPortCancel(1)
[  170.877559] R8188EU: usb_read_port_complete() RX Warning!
bDriverStopped(0) OR bSurpriseRemoved(0) bReadPortCancel(1)
[  170.880667] R8188EU: usb_read_port_complete() RX Warning!
bDriverStopped(0) OR bSurpriseRemoved(0) bReadPortCancel(1)
[  170.884935] R8188EU: usb_read_port_complete() RX Warning!
bDriverStopped(0) OR bSurpriseRemoved(0) bReadPortCancel(1)
[  170.884970] R8188EU: usb_write_port_cancel
[  170.885067] R8188EU: =3D=3D> rtl8188eu_hal_deinit
[  170.885320] R8188EU: bkeepfwalive(0)
[  170.891819] R8188EU: <=3D=3D=3D rtw_ips_pwr_down..................... in=
 44ms
[  174.259174] R8188EU: _rtw_pwr_wakeup call ips_leave....
[  174.259203] R8188EU: =3D=3D>ips_leave cnts:27
[  174.259215] R8188EU: =3D=3D=3D>  rtw_ips_pwr_up..............
[  174.259226] R8188EU: =3D=3D=3D> ips_netdrv_open.........
[  174.295451] R8188EU: _FWFreeToGo: Checksum report OK! REG_MCUFWDL:0x0003=
0004
[  174.296071] R8188EU: =3D=3D=3D=3D=3D> _8051Reset88E(): 8051 reset succes=
s .
[  174.300123] R8188EU: _FWFreeToGo: Polling FW ready success!!
REG_MCUFWDL:0x000300c6
[  174.444450] R8188EU: =3D=3D> rtl8188e_iol_efuse_patch
[  174.500950] R8188EU: pDM_Odm TxPowerTrackControl =3D 1
[  174.751585] R8188EU: rtl8188eu_hal_init in 492ms
[  174.751661] R8188EU: <=3D=3D=3D  rtw_ips_pwr_up.............. in 492ms
[  174.751671] R8188EU: INFO nolinked power save leave
[  174.751832] R8188EU: =3D=3D> ips_leave.....LED(0x00088282)...
[  175.176208] R8188EU: survey done event(10)
[  176.767051] R8188EU: =3D=3D>rtw_ps_processor .fw_state(8)
[  176.767084] R8188EU: =3D=3D>ips_enter cnts:28
[  176.767093] R8188EU: INFO nolinked power save enter
[  176.767098] R8188EU: =3D=3D=3D> rtw_ips_pwr_down...................
[  176.767576] R8188EU: =3D=3D=3D=3D> rtw_ips_dev_unload...
[  176.795327] R8188EU: usb_read_port_cancel
[  176.798686] R8188EU: usb_read_port_complete() RX Warning!
bDriverStopped(0) OR bSurpriseRemoved(0) bReadPortCancel(1)
[  176.801935] R8188EU: usb_read_port_complete() RX Warning!
bDriverStopped(0) OR bSurpriseRemoved(0) bReadPortCancel(1)
[  176.807811] R8188EU: usb_read_port_complete() RX Warning!
bDriverStopped(0) OR bSurpriseRemoved(0) bReadPortCancel(1)
[  176.811058] R8188EU: usb_read_port_complete() RX Warning!
bDriverStopped(0) OR bSurpriseRemoved(0) bReadPortCancel(1)
[  176.811094] R8188EU: usb_write_port_cancel
[  176.811192] R8188EU: =3D=3D> rtl8188eu_hal_deinit
[  176.811445] R8188EU: bkeepfwalive(0)
[  176.823074] R8188EU: <=3D=3D=3D rtw_ips_pwr_down..................... in=
 56ms
[  180.183180] R8188EU: _rtw_pwr_wakeup call ips_leave....
[  180.183209] R8188EU: =3D=3D>ips_leave cnts:28
[  180.183221] R8188EU: =3D=3D=3D>  rtw_ips_pwr_up..............
[  180.183232] R8188EU: =3D=3D=3D> ips_netdrv_open.........
[  180.221574] R8188EU: _FWFreeToGo: Checksum report OK! REG_MCUFWDL:0x0003=
0004
[  180.222195] R8188EU: =3D=3D=3D=3D=3D> _8051Reset88E(): 8051 reset succes=
s .
[  180.224825] R8188EU: _FWFreeToGo: Polling FW ready success!!
REG_MCUFWDL:0x000300c6
[  180.378575] R8188EU: =3D=3D> rtl8188e_iol_efuse_patch
[  180.421700] R8188EU: pDM_Odm TxPowerTrackControl =3D 1
[  180.675214] R8188EU: rtl8188eu_hal_init in 492ms
[  180.675290] R8188EU: <=3D=3D=3D  rtw_ips_pwr_up.............. in 492ms
[  180.675299] R8188EU: INFO nolinked power save leave
[  180.675458] R8188EU: =3D=3D> ips_leave.....LED(0x00088282)...
[  181.104209] R8188EU: survey done event(13)
[  182.687038] R8188EU: =3D=3D>rtw_ps_processor .fw_state(8)
[  182.687070] R8188EU: =3D=3D>ips_enter cnts:29
[  182.687079] R8188EU: INFO nolinked power save enter
[  182.687084] R8188EU: =3D=3D=3D> rtw_ips_pwr_down...................
[  182.687579] R8188EU: =3D=3D=3D=3D> rtw_ips_dev_unload...
[  182.715077] R8188EU: usb_read_port_cancel
[  182.718435] R8188EU: usb_read_port_complete() RX Warning!
bDriverStopped(0) OR bSurpriseRemoved(0) bReadPortCancel(1)
[  182.721685] R8188EU: usb_read_port_complete() RX Warning!
bDriverStopped(0) OR bSurpriseRemoved(0) bReadPortCancel(1)
[  182.724758] R8188EU: usb_read_port_complete() RX Warning!
bDriverStopped(0) OR bSurpriseRemoved(0) bReadPortCancel(1)
[  182.728937] R8188EU: usb_read_port_complete() RX Warning!
bDriverStopped(0) OR bSurpriseRemoved(0) bReadPortCancel(1)
[  182.728968] R8188EU: usb_write_port_cancel
[  182.729063] R8188EU: =3D=3D> rtl8188eu_hal_deinit
[  182.729320] R8188EU: bkeepfwalive(0)
[  182.740070] R8188EU: <=3D=3D=3D rtw_ips_pwr_down..................... in=
 52ms
[  186.107369] R8188EU: _rtw_pwr_wakeup call ips_leave....
[  186.107398] R8188EU: =3D=3D>ips_leave cnts:29
[  186.107410] R8188EU: =3D=3D=3D>  rtw_ips_pwr_up..............
[  186.107420] R8188EU: =3D=3D=3D> ips_netdrv_open.........
[  186.146201] R8188EU: _FWFreeToGo: Checksum report OK! REG_MCUFWDL:0x0003=
0004
[  186.146821] R8188EU: =3D=3D=3D=3D=3D> _8051Reset88E(): 8051 reset succes=
s .
[  186.149463] R8188EU: _FWFreeToGo: Polling FW ready success!!
REG_MCUFWDL:0x000300c6
[  186.321195] R8188EU: =3D=3D> rtl8188e_iol_efuse_patch
[  186.378265] R8188EU: pDM_Odm TxPowerTrackControl =3D 1
[  186.628938] R8188EU: rtl8188eu_hal_init in 520ms
[  186.630246] R8188EU: <=3D=3D=3D  rtw_ips_pwr_up.............. in 520ms
[  186.630290] R8188EU: INFO nolinked power save leave
[  186.630453] R8188EU: =3D=3D> ips_leave.....LED(0x00088282)...
[  187.072202] R8188EU: survey done event(18)
[  188.639034] R8188EU: =3D=3D>rtw_ps_processor .fw_state(8)
[  188.639066] R8188EU: =3D=3D>ips_enter cnts:30
[  188.639074] R8188EU: INFO nolinked power save enter
[  188.639080] R8188EU: =3D=3D=3D> rtw_ips_pwr_down...................
[  188.639576] R8188EU: =3D=3D=3D=3D> rtw_ips_dev_unload...
[  188.668202] R8188EU: usb_read_port_cancel
[  188.672034] R8188EU: usb_read_port_complete() RX Warning!
bDriverStopped(0) OR bSurpriseRemoved(0) bReadPortCancel(1)
[  188.678393] R8188EU: usb_read_port_complete() RX Warning!
bDriverStopped(0) OR bSurpriseRemoved(0) bReadPortCancel(1)
[  188.683166] R8188EU: usb_read_port_complete() RX Warning!
bDriverStopped(0) OR bSurpriseRemoved(0) bReadPortCancel(1)
[  188.687058] R8188EU: usb_read_port_complete() RX Warning!
bDriverStopped(0) OR bSurpriseRemoved(0) bReadPortCancel(1)
[  188.687093] R8188EU: usb_write_port_cancel
[  188.687181] R8188EU: =3D=3D> rtl8188eu_hal_deinit
[  188.687441] R8188EU: bkeepfwalive(0)
[  188.696450] R8188EU: <=3D=3D=3D rtw_ips_pwr_down..................... in=
 56ms
[  192.078690] R8188EU: _rtw_pwr_wakeup call ips_leave....
[  192.078721] R8188EU: =3D=3D>ips_leave cnts:30
[  192.078732] R8188EU: =3D=3D=3D>  rtw_ips_pwr_up..............
[  192.078744] R8188EU: =3D=3D=3D> ips_netdrv_open.........
[  192.116449] R8188EU: _FWFreeToGo: Checksum report OK! REG_MCUFWDL:0x0003=
0004
[  192.117070] R8188EU: =3D=3D=3D=3D=3D> _8051Reset88E(): 8051 reset succes=
s .
[  192.119698] R8188EU: _FWFreeToGo: Polling FW ready success!!
REG_MCUFWDL:0x000300c6
[  192.263584] R8188EU: =3D=3D> rtl8188e_iol_efuse_patch
[  192.316326] R8188EU: pDM_Odm TxPowerTrackControl =3D 1
[  192.575584] R8188EU: rtl8188eu_hal_init in 500ms
[  192.575661] R8188EU: <=3D=3D=3D  rtw_ips_pwr_up.............. in 500ms
[  192.575671] R8188EU: INFO nolinked power save leave
[  192.575832] R8188EU: =3D=3D> ips_leave.....LED(0x00088282)...
[  193.024208] R8188EU: survey done event(18)
[  194.591061] R8188EU: =3D=3D>rtw_ps_processor .fw_state(8)
[  194.591092] R8188EU: =3D=3D>ips_enter cnts:31
[  194.591101] R8188EU: INFO nolinked power save enter
[  194.591107] R8188EU: =3D=3D=3D> rtw_ips_pwr_down...................
[  194.591576] R8188EU: =3D=3D=3D=3D> rtw_ips_dev_unload...
[  194.621204] R8188EU: usb_read_port_cancel
[  194.624702] R8188EU: usb_read_port_complete() RX Warning!
bDriverStopped(0) OR bSurpriseRemoved(0) bReadPortCancel(1)
[  194.628002] R8188EU: usb_read_port_complete() RX Warning!
bDriverStopped(0) OR bSurpriseRemoved(0) bReadPortCancel(1)
[  194.632313] R8188EU: usb_read_port_complete() RX Warning!
bDriverStopped(0) OR bSurpriseRemoved(0) bReadPortCancel(1)
[  194.635058] R8188EU: usb_read_port_complete() RX Warning!
bDriverStopped(0) OR bSurpriseRemoved(0) bReadPortCancel(1)
[  194.635079] R8188EU: usb_write_port_cancel
[  194.635167] R8188EU: =3D=3D> rtl8188eu_hal_deinit
[  194.635446] R8188EU: bkeepfwalive(0)
[  194.652818] R8188EU: <=3D=3D=3D rtw_ips_pwr_down..................... in=
 60ms
[  198.029306] R8188EU: _rtw_pwr_wakeup call ips_leave....
[  198.029337] R8188EU: =3D=3D>ips_leave cnts:31
[  198.029348] R8188EU: =3D=3D=3D>  rtw_ips_pwr_up..............
[  198.029360] R8188EU: =3D=3D=3D> ips_netdrv_open.........
[  198.072950] R8188EU: _FWFreeToGo: Checksum report OK! REG_MCUFWDL:0x0003=
0004
[  198.073570] R8188EU: =3D=3D=3D=3D=3D> _8051Reset88E(): 8051 reset succes=
s .
[  198.076198] R8188EU: _FWFreeToGo: Polling FW ready success!!
REG_MCUFWDL:0x000300c6
[  198.227453] R8188EU: =3D=3D> rtl8188e_iol_efuse_patch
[  198.261456] R8188EU: pDM_Odm TxPowerTrackControl =3D 1
[  198.499585] R8188EU: rtl8188eu_hal_init in 472ms
[  198.499665] R8188EU: <=3D=3D=3D  rtw_ips_pwr_up.............. in 472ms
[  198.499675] R8188EU: INFO nolinked power save leave
[  198.499832] R8188EU: =3D=3D> ips_leave.....LED(0x00088282)...
[  198.946084] R8188EU: survey done event(16)
[  200.511036] R8188EU: =3D=3D>rtw_ps_processor .fw_state(8)
[  200.511070] R8188EU: =3D=3D>ips_enter cnts:32
[  200.511079] R8188EU: INFO nolinked power save enter
[  200.511084] R8188EU: =3D=3D=3D> rtw_ips_pwr_down...................
[  200.511577] R8188EU: =3D=3D=3D=3D> rtw_ips_dev_unload...
[  200.539704] R8188EU: usb_read_port_cancel
[  200.543063] R8188EU: usb_read_port_complete() RX Warning!
bDriverStopped(0) OR bSurpriseRemoved(0) bReadPortCancel(1)
[  200.546309] R8188EU: usb_read_port_complete() RX Warning!
bDriverStopped(0) OR bSurpriseRemoved(0) bReadPortCancel(1)
[  200.549382] R8188EU: usb_read_port_complete() RX Warning!
bDriverStopped(0) OR bSurpriseRemoved(0) bReadPortCancel(1)
[  200.553934] R8188EU: usb_read_port_complete() RX Warning!
bDriverStopped(0) OR bSurpriseRemoved(0) bReadPortCancel(1)
[  200.553972] R8188EU: usb_write_port_cancel
[  200.554069] R8188EU: =3D=3D> rtl8188eu_hal_deinit
[  200.554321] R8188EU: bkeepfwalive(0)
[  200.565946] R8188EU: <=3D=3D=3D rtw_ips_pwr_down..................... in=
 52ms
[  203.953559] R8188EU: _rtw_pwr_wakeup call ips_leave....
[  203.953585] R8188EU: =3D=3D>ips_leave cnts:32
[  203.953594] R8188EU: =3D=3D=3D>  rtw_ips_pwr_up..............
[  203.953606] R8188EU: =3D=3D=3D> ips_netdrv_open.........
[  203.989574] R8188EU: _FWFreeToGo: Checksum report OK! REG_MCUFWDL:0x0003=
0004
[  203.990194] R8188EU: =3D=3D=3D=3D=3D> _8051Reset88E(): 8051 reset succes=
s .
[  203.992822] R8188EU: _FWFreeToGo: Polling FW ready success!!
REG_MCUFWDL:0x000300c6
[  204.157359] R8188EU: =3D=3D> rtl8188e_iol_efuse_patch
[  204.225325] R8188EU: pDM_Odm TxPowerTrackControl =3D 1
[  204.463586] R8188EU: rtl8188eu_hal_init in 512ms
[  204.463656] R8188EU: <=3D=3D=3D  rtw_ips_pwr_up.............. in 512ms
[  204.463666] R8188EU: INFO nolinked power save leave
[  204.463834] R8188EU: =3D=3D> ips_leave.....LED(0x00088282)...
[  204.920962] R8188EU: survey done event(10)
[  206.495033] R8188EU: =3D=3D>rtw_ps_processor .fw_state(8)
[  206.495067] R8188EU: =3D=3D>ips_enter cnts:33
[  206.495076] R8188EU: INFO nolinked power save enter
[  206.495082] R8188EU: =3D=3D=3D> rtw_ips_pwr_down...................
[  206.495577] R8188EU: =3D=3D=3D=3D> rtw_ips_dev_unload...
[  206.519739] R8188EU: usb_read_port_cancel
[  206.523440] R8188EU: usb_read_port_complete() RX Warning!
bDriverStopped(0) OR bSurpriseRemoved(0) bReadPortCancel(1)
[  206.526683] R8188EU: usb_read_port_complete() RX Warning!
bDriverStopped(0) OR bSurpriseRemoved(0) bReadPortCancel(1)
[  206.529932] R8188EU: usb_read_port_complete() RX Warning!
bDriverStopped(0) OR bSurpriseRemoved(0) bReadPortCancel(1)
[  206.532976] R8188EU: usb_read_port_complete() RX Warning!
bDriverStopped(0) OR bSurpriseRemoved(0) bReadPortCancel(1)
[  206.533865] R8188EU: usb_write_port_cancel
[  206.534613] R8188EU: =3D=3D> rtl8188eu_hal_deinit
[  206.534823] R8188EU: bkeepfwalive(0)
[  206.542896] R8188EU: <=3D=3D=3D rtw_ips_pwr_down..................... in=
 44ms
[  209.931192] R8188EU: _rtw_pwr_wakeup call ips_leave....
[  209.931223] R8188EU: =3D=3D>ips_leave cnts:33
[  209.931235] R8188EU: =3D=3D=3D>  rtw_ips_pwr_up..............
[  209.931246] R8188EU: =3D=3D=3D> ips_netdrv_open.........
[  209.969326] R8188EU: _FWFreeToGo: Checksum report OK! REG_MCUFWDL:0x0003=
0004
[  209.969946] R8188EU: =3D=3D=3D=3D=3D> _8051Reset88E(): 8051 reset succes=
s .
[  209.972579] R8188EU: _FWFreeToGo: Polling FW ready success!!
REG_MCUFWDL:0x000300c6
[  210.118328] R8188EU: =3D=3D> rtl8188e_iol_efuse_patch
[  210.169200] R8188EU: pDM_Odm TxPowerTrackControl =3D 1
[  210.414010] R8188EU: rtl8188eu_hal_init in 480ms
[  210.414083] R8188EU: <=3D=3D=3D  rtw_ips_pwr_up.............. in 480ms
[  210.414090] R8188EU: INFO nolinked power save leave
[  210.414202] R8188EU: =3D=3D> ips_leave.....LED(0x00088282)...
[  210.840208] R8188EU: survey done event(19)
[  212.415063] R8188EU: =3D=3D>rtw_ps_processor .fw_state(8)
[  212.415096] R8188EU: =3D=3D>ips_enter cnts:34
[  212.415105] R8188EU: INFO nolinked power save enter
[  212.415111] R8188EU: =3D=3D=3D> rtw_ips_pwr_down...................
[  212.415576] R8188EU: =3D=3D=3D=3D> rtw_ips_dev_unload...
[  212.445724] R8188EU: usb_read_port_cancel
[  212.449417] R8188EU: usb_read_port_complete() RX Warning!
bDriverStopped(0) OR bSurpriseRemoved(0) bReadPortCancel(1)
[  212.453058] R8188EU: usb_read_port_complete() RX Warning!
bDriverStopped(0) OR bSurpriseRemoved(0) bReadPortCancel(1)
[  212.456307] R8188EU: usb_read_port_complete() RX Warning!
bDriverStopped(0) OR bSurpriseRemoved(0) bReadPortCancel(1)
[  212.460161] R8188EU: usb_read_port_complete() RX Warning!
bDriverStopped(0) OR bSurpriseRemoved(0) bReadPortCancel(1)
[  212.461053] R8188EU: usb_write_port_cancel
[  212.461177] R8188EU: =3D=3D> rtl8188eu_hal_deinit
[  212.461446] R8188EU: bkeepfwalive(0)
[  212.469545] R8188EU: <=3D=3D=3D rtw_ips_pwr_down..................... in=
 52ms
[  215.843108] R8188EU: _rtw_pwr_wakeup call ips_leave....
[  215.843138] R8188EU: =3D=3D>ips_leave cnts:34
[  215.843150] R8188EU: =3D=3D=3D>  rtw_ips_pwr_up..............
[  215.843162] R8188EU: =3D=3D=3D> ips_netdrv_open.........
[  215.881325] R8188EU: _FWFreeToGo: Checksum report OK! REG_MCUFWDL:0x0003=
0004
[  215.881946] R8188EU: =3D=3D=3D=3D=3D> _8051Reset88E(): 8051 reset succes=
s .
[  215.884575] R8188EU: _FWFreeToGo: Polling FW ready success!!
REG_MCUFWDL:0x000300c6
[  216.052449] R8188EU: =3D=3D> rtl8188e_iol_efuse_patch
[  216.099326] R8188EU: pDM_Odm TxPowerTrackControl =3D 1
[  216.338837] R8188EU: rtl8188eu_hal_init in 492ms
[  216.338916] R8188EU: <=3D=3D=3D  rtw_ips_pwr_up.............. in 492ms
[  216.338925] R8188EU: INFO nolinked power save leave
[  216.339088] R8188EU: =3D=3D> ips_leave.....LED(0x00088282)...
[  216.788208] R8188EU: survey done event(1c)
[  218.367028] R8188EU: =3D=3D>rtw_ps_processor .fw_state(8)
[  218.367062] R8188EU: =3D=3D>ips_enter cnts:35
[  218.367071] R8188EU: INFO nolinked power save enter
[  218.367077] R8188EU: =3D=3D=3D> rtw_ips_pwr_down...................
[  218.367578] R8188EU: =3D=3D=3D=3D> rtw_ips_dev_unload...
[  218.401824] R8188EU: usb_read_port_cancel
[  218.405504] R8188EU: usb_read_port_complete() RX Warning!
bDriverStopped(0) OR bSurpriseRemoved(0) bReadPortCancel(1)
[  218.409338] R8188EU: usb_read_port_complete() RX Warning!
bDriverStopped(0) OR bSurpriseRemoved(0) bReadPortCancel(1)
[  218.412557] R8188EU: usb_read_port_complete() RX Warning!
bDriverStopped(0) OR bSurpriseRemoved(0) bReadPortCancel(1)
[  218.415806] R8188EU: usb_read_port_complete() RX Warning!
bDriverStopped(0) OR bSurpriseRemoved(0) bReadPortCancel(1)
[  218.416065] R8188EU: usb_write_port_cancel
[  218.418003] R8188EU: =3D=3D> rtl8188eu_hal_deinit
[  218.420832] R8188EU: bkeepfwalive(0)
[  218.432594] R8188EU: <=3D=3D=3D rtw_ips_pwr_down..................... in=
 64ms
[  221.825157] R8188EU: _rtw_pwr_wakeup call ips_leave....
[  221.825188] R8188EU: =3D=3D>ips_leave cnts:35
[  221.825199] R8188EU: =3D=3D=3D>  rtw_ips_pwr_up..............
[  221.825211] R8188EU: =3D=3D=3D> ips_netdrv_open.........
[  221.857202] R8188EU: _FWFreeToGo: Checksum report OK! REG_MCUFWDL:0x0003=
0004
[  221.857822] R8188EU: =3D=3D=3D=3D=3D> _8051Reset88E(): 8051 reset succes=
s .
[  221.860450] R8188EU: _FWFreeToGo: Polling FW ready success!!
REG_MCUFWDL:0x000300c6
[  222.029198] R8188EU: =3D=3D> rtl8188e_iol_efuse_patch
[  222.081575] R8188EU: pDM_Odm TxPowerTrackControl =3D 1
[  222.319585] R8188EU: rtl8188eu_hal_init in 496ms
[  222.319664] R8188EU: <=3D=3D=3D  rtw_ips_pwr_up.............. in 496ms
[  222.319674] R8188EU: INFO nolinked power save leave
[  222.319832] R8188EU: =3D=3D> ips_leave.....LED(0x00088282)...
[  222.744208] R8188EU: survey done event(15)
[  224.351034] R8188EU: =3D=3D>rtw_ps_processor .fw_state(8)
[  224.351066] R8188EU: =3D=3D>ips_enter cnts:36
[  224.351075] R8188EU: INFO nolinked power save enter
[  224.351080] R8188EU: =3D=3D=3D> rtw_ips_pwr_down...................
[  224.351577] R8188EU: =3D=3D=3D=3D> rtw_ips_dev_unload...
[  224.380583] R8188EU: usb_read_port_cancel
[  224.384192] R8188EU: usb_read_port_complete() RX Warning!
bDriverStopped(0) OR bSurpriseRemoved(0) bReadPortCancel(1)
[  224.389454] R8188EU: usb_read_port_complete() RX Warning!
bDriverStopped(0) OR bSurpriseRemoved(0) bReadPortCancel(1)
[  224.393186] R8188EU: usb_read_port_complete() RX Warning!
bDriverStopped(0) OR bSurpriseRemoved(0) bReadPortCancel(1)
[  224.396434] R8188EU: usb_read_port_complete() RX Warning!
bDriverStopped(0) OR bSurpriseRemoved(0) bReadPortCancel(1)
[  224.396456] R8188EU: usb_write_port_cancel
[  224.396545] R8188EU: =3D=3D> rtl8188eu_hal_deinit
[  224.396819] R8188EU: bkeepfwalive(0)
[  224.411197] R8188EU: <=3D=3D=3D rtw_ips_pwr_down..................... in=
 60ms
```


On Sat, Nov 6, 2021 at 5:48 AM Pavel Skripkin <paskripkin@gmail.com> wrote:
>
> On 11/6/21 11:32, Pavel Skripkin wrote:
> > On 11/6/21 00:03, Zameer Manji wrote:
> >> Hello Pavel,
> >>
> >> I will attempt to bisect the issue.
> >>
> >> So far I can confirm it occurs in 5.15-rc1.
> >>
> >> I also forgot to mention that this issue occurs on an arm64 platform
> >> if it matters. Would you be able to test this issue out in an arm64
> >> VM?
> >>
> >>
> >
> > Hi, Zameer!
> >
> > I think, I can build aarch64 kernel and test it in vm.
> >
> > Btw, did you try to enable debug logs? debug=3D9 module argument will t=
urn
> > on all debug logs and maybe there will be some additional information
> > about what actually happened
> >
> >
>
> Test results from aarch64 vm. My qemu configuration is
>
> ```
> qemu-system-aarch64 \
>         -machine virt \
>         -drive file=3D./debian-rootfs-aarch64.img,format=3Draw \
>         -cpu cortex-a57 -machine type=3Dvirt \
>         -nographic \
>         -smp 2 -m 4096 \
>         -kernel arch/arm64/boot/Image \
>         -net user,hostfwd=3Dtcp:127.0.0.1:55555-:22 \
>         -net nic,model=3Dvirtio \
>         -device usb-ehci \
>         -usb -device
> usb-host,hostbus=3D$BUS,hostaddr=3D$DEVICE,guest-reset=3Dfalse,id=3Dtp \
>         -append "root=3D/dev/vda1 rw nosplash"
>
> ```
>
> if something is wrong here, please, let me know, i will retest. I am not
> an expert in arm :)
>
>
>
>
> And test results:
>
> ```
> root@debian-vm-aarch64:~# iwlist wlx28ee5214eeb6 scanning | grep "Channel=
"
>                      Frequency:2.437 GHz (Channel 6)
>                      Frequency:2.412 GHz (Channel 1)
>                      Frequency:2.412 GHz (Channel 1)
>                      Frequency:2.412 GHz (Channel 1)
>                      Frequency:2.412 GHz (Channel 1)
>                      Frequency:2.412 GHz (Channel 1)
>                      Frequency:2.412 GHz (Channel 1)
>                      Frequency:2.412 GHz (Channel 1)
>                      Frequency:2.417 GHz (Channel 2)
>                      Frequency:2.417 GHz (Channel 2)
>                      Frequency:2.427 GHz (Channel 4)
>                      Frequency:2.422 GHz (Channel 3)
>                      Frequency:2.427 GHz (Channel 4)
>                      Frequency:2.427 GHz (Channel 4)
>                      Frequency:2.442 GHz (Channel 7)
>                      Frequency:2.432 GHz (Channel 5)
>                      Frequency:2.437 GHz (Channel 6)
>                      Frequency:2.452 GHz (Channel 9)
>                      Frequency:2.452 GHz (Channel 9)
>                      Frequency:2.462 GHz (Channel 11)
>                      Frequency:2.452 GHz (Channel 9)
>                      Frequency:2.462 GHz (Channel 11)
>                      Frequency:2.457 GHz (Channel 10)
>                      Frequency:2.467 GHz (Channel 12)
>                      Frequency:2.462 GHz (Channel 11)
>                      Frequency:2.462 GHz (Channel 11)
>                      Frequency:2.472 GHz (Channel 13)
>                      Frequency:2.462 GHz (Channel 11)
>                      Frequency:2.472 GHz (Channel 13)
>                      Frequency:2.472 GHz (Channel 13)
>                      Frequency:2.412 GHz (Channel 1)
>                      Frequency:2.422 GHz (Channel 3)
>                      Frequency:2.432 GHz (Channel 5)
>                      Frequency:2.432 GHz (Channel 5)
>                      Frequency:2.432 GHz (Channel 5)
>                      Frequency:2.442 GHz (Channel 7)
> root@debian-vm-aarch64:~# uname -a
> Linux debian-vm-aarch64 5.15.0 #3 SMP PREEMPT Sat Nov 6 12:10:40 MSK
> 2021 aarch64 GNU/Linux
> root@debian-vm-aarch64:~# lsusb
> Bus 001 Device 002: ID 2357:010c TP-Link TL-WN722N v2
> Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
> root@debian-vm-aarch64:~#
>
> ```
>
> I didn't try to connect to my wifi, since your problem occurs even
> before connecting
>
>
> Any ideas about how to reproduce or what have I done wrong? :)
>
>
>
>
>
> With regards,
> Pavel Skripkin



--=20
Zameer Manji
