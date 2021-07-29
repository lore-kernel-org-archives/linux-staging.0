Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DE1D70
	for <linux-staging@lists.linux.dev>; Thu, 29 Jul 2021 16:48:54 +0000 (UTC)
Received: by mail-ot1-f43.google.com with SMTP id 19-20020a9d08930000b02904b98d90c82cso6521279otf.5
        for <linux-staging@lists.linux.dev>; Thu, 29 Jul 2021 09:48:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=e+nlIS0OotXUJ9Sry+xY7vM+XohvgnCu5oDjaT827zw=;
        b=DTqiD2/M+rINHEf2A2yXfvV36ySMkzlh4jxxDUjuvNP+bIONyedCGus14Qg4FukJ0i
         GrUO5OgQJTy7Wnj8ifQJWbU2Y9PbiIkNV1MY8SgspBqPqAyoUmSaDQk26ux248m56KjN
         3tLEHT8GZdC+pqRNmEzEs5aWmUMDRLrA/thWgtbGYFMhK+4pEC1uUevnAyxYasG8VynN
         +2/oiwVz3VXSMz6krhe2KvYKvObKIjIGM8q0oiMV+ONiU69fchwInOsd77bAQH1uui+i
         uVurjIz/WXbZvtbZFme4BcICQNAkVTywQ+QXPmcWQSrmaF9t4+rdA2M72/VcYibKmM8L
         sxYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=e+nlIS0OotXUJ9Sry+xY7vM+XohvgnCu5oDjaT827zw=;
        b=ThwvYDNiuE586ZfpIQ4kX7TpwZFvp39w1mQHDZBdLN0Io6e+xhwjYVGEMlZnsCYXHi
         tp9IaRksjsR+leg0dH4ufayMEdDzmzxJrb7zJj4YAtzVZbImJqBoZCtjxnxztjAnIkOu
         pfL065mgXv7jEves+4pUxADpVzwrDozfC1yFkpEWx6yrM+jD5ZXO72+sDZfjS4WaFm7B
         KU1Jva6sT7WN8Qy1xyb7Qx9gI+oZNDvENp8bad5Po2sSdZefKUd5IojHR82DH/2n7nsS
         kUmJd2y3oOP1JgoQf9kbkj/GQdfxIqcb3mSHU/pI+keqxJvYixtg2cmqAxTXuL0t/lO5
         fc+Q==
X-Gm-Message-State: AOAM533KIfwirEsmgHjxHKyoCoG8CwA+O5hNJQ0mAARutqKuxSqXi0uJ
	zEgUKCCVc5TJy45HSt9FMmg=
X-Google-Smtp-Source: ABdhPJzqlsdXb3k/mOVygAm/u7FgzzCXyBC5NaFpiHrxn7ui69Ki4EGq33Bdk+ArJR8QDCDw/LcERQ==
X-Received: by 2002:a05:6830:264b:: with SMTP id f11mr4192783otu.8.1627577333696;
        Thu, 29 Jul 2021 09:48:53 -0700 (PDT)
Received: from 2603-8090-2005-39b3-0000-0000-0000-100a.res6.spectrum.com.com (2603-8090-2005-39b3-0000-0000-0000-100a.res6.spectrum.com. [2603:8090:2005:39b3::100a])
        by smtp.gmail.com with ESMTPSA id n202sm694066oig.10.2021.07.29.09.48.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jul 2021 09:48:53 -0700 (PDT)
Sender: Larry Finger <larry.finger@gmail.com>
From: Larry Finger <Larry.Finger@lwfinger.net>
To: gregkh@linuxfoundation.org
Cc: phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Larry Finger <Larry.Finger@lwfinger.net>
Subject: [PATCH v2 0/6] Convert copyright info into SPDX
Date: Thu, 29 Jul 2021 11:48:08 -0500
Message-Id: <20210729164814.32097-1-Larry.Finger@lwfinger.net>
X-Mailer: git-send-email 2.32.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The drivers/net/wireless tree prefers copyright info in the SPDX format.
As this driver may eventually reach that tree, convert the headers now.

For some reason, the SPDX info uses /*...*/ for *.h files, but uses C90 //
for *.c files.

Larry Finger (6):
  staging: r8188eu: Convert header copyright info to SPDX format, part 1
  staging: r8188eu: Convert header copyright info to SPDX format, part 2
  staging: r8188eu: Convert header copyright info to SPDX format, part 3
  staging: r8188eu: Convert header copyright info to SPDX format, part 4
  staging: r8188eu: Convert header copyright info to SPDX format, part 5
  staging: r8188eu: Convert copyright header info to SPDX format, part 6
 v2 - add public mailing list

 drivers/staging/r8188eu/core/rtw_ap.c         | 22 ++-----------
 drivers/staging/r8188eu/core/rtw_br_ext.c     | 22 ++-----------
 drivers/staging/r8188eu/core/rtw_cmd.c        | 22 ++-----------
 drivers/staging/r8188eu/core/rtw_debug.c      | 22 ++-----------
 drivers/staging/r8188eu/core/rtw_efuse.c      | 22 ++-----------
 drivers/staging/r8188eu/core/rtw_ieee80211.c  | 22 ++-----------
 drivers/staging/r8188eu/core/rtw_io.c         | 22 ++-----------
 drivers/staging/r8188eu/core/rtw_ioctl_set.c  | 22 ++-----------
 drivers/staging/r8188eu/core/rtw_iol.c        | 21 ++----------
 drivers/staging/r8188eu/core/rtw_led.c        | 21 ++----------
 drivers/staging/r8188eu/core/rtw_mlme.c       | 22 ++-----------
 drivers/staging/r8188eu/core/rtw_mlme_ext.c   | 22 ++-----------
 drivers/staging/r8188eu/core/rtw_mp.c         | 22 ++-----------
 drivers/staging/r8188eu/core/rtw_mp_ioctl.c   | 22 ++-----------
 drivers/staging/r8188eu/core/rtw_p2p.c        | 22 ++-----------
 drivers/staging/r8188eu/core/rtw_pwrctrl.c    | 22 ++-----------
 drivers/staging/r8188eu/core/rtw_recv.c       | 22 ++-----------
 drivers/staging/r8188eu/core/rtw_rf.c         | 22 ++-----------
 drivers/staging/r8188eu/core/rtw_security.c   | 22 ++-----------
 drivers/staging/r8188eu/core/rtw_sreset.c     | 21 ++----------
 drivers/staging/r8188eu/core/rtw_sta_mgt.c    | 22 ++-----------
 drivers/staging/r8188eu/core/rtw_wlan_util.c  | 22 ++-----------
 drivers/staging/r8188eu/core/rtw_xmit.c       | 22 ++-----------
 drivers/staging/r8188eu/hal/Hal8188EPwrSeq.c  | 21 ++----------
 .../r8188eu/hal/Hal8188ERateAdaptive.c        |  5 ++-
 .../staging/r8188eu/hal/HalHWImg8188E_BB.c    | 21 ++----------
 .../staging/r8188eu/hal/HalHWImg8188E_MAC.c   | 21 ++----------
 .../staging/r8188eu/hal/HalHWImg8188E_RF.c    | 21 ++----------
 drivers/staging/r8188eu/hal/HalPhyRf.c        | 21 ++----------
 drivers/staging/r8188eu/hal/HalPhyRf_8188e.c  | 22 ++-----------
 drivers/staging/r8188eu/hal/HalPwrSeqCmd.c    | 23 ++-----------
 drivers/staging/r8188eu/hal/hal_com.c         | 22 ++-----------
 drivers/staging/r8188eu/hal/hal_intf.c        | 21 ++----------
 drivers/staging/r8188eu/hal/odm.c             | 21 ++----------
 drivers/staging/r8188eu/hal/odm_HWConfig.c    | 23 ++-----------
 drivers/staging/r8188eu/hal/odm_RTL8188E.c    | 21 ++----------
 .../staging/r8188eu/hal/odm_RegConfig8188E.c  | 21 ++----------
 drivers/staging/r8188eu/hal/odm_debug.c       | 23 ++-----------
 drivers/staging/r8188eu/hal/odm_interface.c   | 21 ++----------
 drivers/staging/r8188eu/hal/rtl8188e_cmd.c    | 22 ++-----------
 drivers/staging/r8188eu/hal/rtl8188e_dm.c     | 28 ++--------------
 .../staging/r8188eu/hal/rtl8188e_hal_init.c   | 22 ++-----------
 drivers/staging/r8188eu/hal/rtl8188e_mp.c     | 22 ++-----------
 drivers/staging/r8188eu/hal/rtl8188e_phycfg.c | 22 ++-----------
 drivers/staging/r8188eu/hal/rtl8188e_rf6052.c | 22 ++-----------
 drivers/staging/r8188eu/hal/rtl8188e_rxdesc.c | 22 ++-----------
 drivers/staging/r8188eu/hal/rtl8188e_sreset.c | 22 ++-----------
 drivers/staging/r8188eu/hal/rtl8188e_xmit.c   | 22 ++-----------
 drivers/staging/r8188eu/hal/rtl8188eu_led.c   | 21 ++----------
 drivers/staging/r8188eu/hal/rtl8188eu_recv.c  | 22 ++-----------
 drivers/staging/r8188eu/hal/rtl8188eu_xmit.c  | 22 ++-----------
 drivers/staging/r8188eu/hal/usb_halinit.c     | 22 ++-----------
 drivers/staging/r8188eu/hal/usb_ops_linux.c   | 22 ++-----------
 .../staging/r8188eu/include/Hal8188EPhyCfg.h  | 22 ++-----------
 .../staging/r8188eu/include/Hal8188EPhyReg.h  | 22 ++-----------
 .../staging/r8188eu/include/Hal8188EPwrSeq.h  | 22 ++-----------
 .../r8188eu/include/Hal8188ERateAdaptive.h    |  4 ++-
 drivers/staging/r8188eu/include/Hal8188EReg.h | 31 ++---------------
 .../r8188eu/include/HalHWImg8188E_BB.h        | 21 ++----------
 .../r8188eu/include/HalHWImg8188E_FW.h        | 21 ++----------
 .../r8188eu/include/HalHWImg8188E_MAC.h       | 21 ++----------
 .../r8188eu/include/HalHWImg8188E_RF.h        | 21 ++----------
 drivers/staging/r8188eu/include/HalPhyRf.h    | 25 +++-----------
 .../staging/r8188eu/include/HalPhyRf_8188e.h  | 21 ++----------
 .../staging/r8188eu/include/HalPwrSeqCmd.h    | 22 ++-----------
 drivers/staging/r8188eu/include/HalVerDef.h   | 21 ++----------
 drivers/staging/r8188eu/include/autoconf.h    | 21 ++----------
 drivers/staging/r8188eu/include/basic_types.h | 22 ++-----------
 drivers/staging/r8188eu/include/cmd_osdep.h   | 22 ++-----------
 drivers/staging/r8188eu/include/drv_types.h   | 22 ++-----------
 .../staging/r8188eu/include/drv_types_linux.h | 22 ++-----------
 drivers/staging/r8188eu/include/ethernet.h    | 23 ++-----------
 drivers/staging/r8188eu/include/h2clbk.h      | 21 ++----------
 drivers/staging/r8188eu/include/hal_com.h     | 22 ++-----------
 drivers/staging/r8188eu/include/hal_intf.h    | 22 ++-----------
 drivers/staging/r8188eu/include/ieee80211.h   | 22 ++-----------
 .../staging/r8188eu/include/ieee80211_ext.h   | 22 ++-----------
 drivers/staging/r8188eu/include/if_ether.h    | 21 ++----------
 .../staging/r8188eu/include/ioctl_cfg80211.h  | 22 ++-----------
 drivers/staging/r8188eu/include/ip.h          | 22 ++-----------
 drivers/staging/r8188eu/include/mlme_osdep.h  | 22 ++-----------
 .../staging/r8188eu/include/mp_custom_oid.h   | 22 ++-----------
 drivers/staging/r8188eu/include/nic_spec.h    | 21 ++----------
 drivers/staging/r8188eu/include/odm.h         | 21 ++----------
 .../staging/r8188eu/include/odm_HWConfig.h    | 21 ++----------
 .../staging/r8188eu/include/odm_RTL8188E.h    | 22 ++-----------
 .../r8188eu/include/odm_RegConfig8188E.h      | 22 ++-----------
 .../r8188eu/include/odm_RegDefine11AC.h       | 21 ++----------
 .../r8188eu/include/odm_RegDefine11N.h        | 21 ++----------
 drivers/staging/r8188eu/include/odm_debug.h   | 21 ++----------
 .../staging/r8188eu/include/odm_interface.h   | 21 ++----------
 drivers/staging/r8188eu/include/odm_precomp.h | 21 ++----------
 drivers/staging/r8188eu/include/odm_reg.h     | 33 ++-----------------
 drivers/staging/r8188eu/include/odm_types.h   | 22 ++-----------
 drivers/staging/r8188eu/include/osdep_intf.h  | 21 ++----------
 .../staging/r8188eu/include/osdep_service.h   | 22 ++-----------
 drivers/staging/r8188eu/include/recv_osdep.h  | 22 ++-----------
 .../staging/r8188eu/include/rtl8188e_cmd.h    | 22 ++-----------
 drivers/staging/r8188eu/include/rtl8188e_dm.h | 23 +++----------
 .../staging/r8188eu/include/rtl8188e_hal.h    | 22 ++-----------
 .../staging/r8188eu/include/rtl8188e_led.h    | 22 ++-----------
 .../staging/r8188eu/include/rtl8188e_recv.h   | 22 ++-----------
 drivers/staging/r8188eu/include/rtl8188e_rf.h | 22 ++-----------
 .../staging/r8188eu/include/rtl8188e_spec.h   | 21 ++----------
 .../staging/r8188eu/include/rtl8188e_sreset.h | 22 ++-----------
 .../staging/r8188eu/include/rtl8188e_xmit.h   | 22 ++-----------
 drivers/staging/r8188eu/include/rtw_android.h | 21 ++----------
 drivers/staging/r8188eu/include/rtw_ap.h      | 22 ++-----------
 drivers/staging/r8188eu/include/rtw_br_ext.h  | 22 ++-----------
 drivers/staging/r8188eu/include/rtw_cmd.h     | 22 ++-----------
 drivers/staging/r8188eu/include/rtw_debug.h   | 22 ++-----------
 drivers/staging/r8188eu/include/rtw_eeprom.h  | 22 ++-----------
 drivers/staging/r8188eu/include/rtw_efuse.h   | 22 ++-----------
 drivers/staging/r8188eu/include/rtw_event.h   | 22 ++-----------
 drivers/staging/r8188eu/include/rtw_ht.h      | 22 ++-----------
 drivers/staging/r8188eu/include/rtw_io.h      | 21 ++----------
 drivers/staging/r8188eu/include/rtw_ioctl.h   | 22 ++-----------
 .../staging/r8188eu/include/rtw_ioctl_rtl.h   | 22 ++-----------
 .../staging/r8188eu/include/rtw_ioctl_set.h   | 22 ++-----------
 drivers/staging/r8188eu/include/rtw_iol.h     | 22 ++-----------
 drivers/staging/r8188eu/include/rtw_led.h     | 22 ++-----------
 drivers/staging/r8188eu/include/rtw_mlme.h    | 22 ++-----------
 .../staging/r8188eu/include/rtw_mlme_ext.h    | 22 ++-----------
 drivers/staging/r8188eu/include/rtw_mp.h      | 22 ++-----------
 .../staging/r8188eu/include/rtw_mp_ioctl.h    | 22 ++-----------
 .../r8188eu/include/rtw_mp_phy_regdef.h       | 22 ++-----------
 drivers/staging/r8188eu/include/rtw_p2p.h     | 22 ++-----------
 drivers/staging/r8188eu/include/rtw_pwrctrl.h | 22 ++-----------
 drivers/staging/r8188eu/include/rtw_qos.h     | 22 ++-----------
 drivers/staging/r8188eu/include/rtw_recv.h    | 22 ++-----------
 drivers/staging/r8188eu/include/rtw_rf.h      | 22 ++-----------
 .../staging/r8188eu/include/rtw_security.h    | 22 ++-----------
 drivers/staging/r8188eu/include/rtw_sreset.h  | 22 ++-----------
 drivers/staging/r8188eu/include/rtw_version.h |  1 +
 drivers/staging/r8188eu/include/rtw_xmit.h    | 22 ++-----------
 drivers/staging/r8188eu/include/sta_info.h    | 22 ++-----------
 drivers/staging/r8188eu/include/usb_hal.h     | 22 ++-----------
 drivers/staging/r8188eu/include/usb_ops.h     | 22 ++-----------
 .../staging/r8188eu/include/usb_ops_linux.h   | 22 ++-----------
 drivers/staging/r8188eu/include/usb_osintf.h  | 22 ++-----------
 .../staging/r8188eu/include/usb_vendor_req.h  | 22 ++-----------
 drivers/staging/r8188eu/include/wifi.h        | 22 ++-----------
 drivers/staging/r8188eu/include/wlan_bssdef.h | 22 ++-----------
 drivers/staging/r8188eu/include/xmit_osdep.h  | 22 ++-----------
 drivers/staging/r8188eu/os_dep/ioctl_linux.c  | 22 ++-----------
 drivers/staging/r8188eu/os_dep/mlme_linux.c   | 21 ++----------
 drivers/staging/r8188eu/os_dep/os_intfs.c     | 22 ++-----------
 .../staging/r8188eu/os_dep/osdep_service.c    | 21 ++----------
 drivers/staging/r8188eu/os_dep/recv_linux.c   | 22 ++-----------
 drivers/staging/r8188eu/os_dep/rtw_android.c  | 21 ++----------
 drivers/staging/r8188eu/os_dep/usb_intf.c     | 22 ++-----------
 .../staging/r8188eu/os_dep/usb_ops_linux.c    | 21 ++----------
 drivers/staging/r8188eu/os_dep/xmit_linux.c   | 22 ++-----------
 153 files changed, 417 insertions(+), 2888 deletions(-)

-- 
2.32.0

