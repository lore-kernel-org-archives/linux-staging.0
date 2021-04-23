Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFCAA70
	for <linux-staging@lists.linux.dev>; Fri, 23 Apr 2021 14:58:43 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id p10-20020a1c544a0000b02901387e17700fso1397042wmi.2
        for <linux-staging@lists.linux.dev>; Fri, 23 Apr 2021 07:58:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Cgl8/i7gQs6yxgkvwobatiYWLGXODMXAcvLmSXV9bcg=;
        b=KIDPzoPzCXnEjke2W6kmWSqnfFGqG72dl8OncSLk5AODjpqcyieaAn7POj7SWXTW3G
         em/lCuQ9LCaEZ5NW+Cmw96VHE21Bx6oO+dCpPHKzzUZvv5b4n2jAjIx7A2n3M7tCBPlK
         DV5dcrXIAcbsg/VGvmJu13BuW8lTZtrNgHQQYpsLtj2e+569jBYMbO4UbSHhGhid76Rf
         VX3T6kHvbXH8yK3H7AVNcbQ5nTYWfcMkZf9n+2k3PQ3iNovlUrSwswZpWsO9dyag82Kp
         mv3xTsDskYu9Fj+QY7k1MN/2ca1PG9CrDeudONxukdNx5rEcyqxLtQodLZCxShLTh2Kx
         ykcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Cgl8/i7gQs6yxgkvwobatiYWLGXODMXAcvLmSXV9bcg=;
        b=YbuLYjb20tNwqRCEPJpKoLaGW2r39WT3jkdfY7aBn2L0d6yHmkszbzdsMPvP5oE/+Z
         FnywTxPDSfzCkDwhCkt1YSpy5x3LKjqVs6CNS2e1aTIIR2XJvrG/KbG7sfrzeI8LeRsc
         E55N2SbsZkfF9SFeAB3IgtVMQrjJ9AcMrz43XtG5+k7H5yI5QvweIltjNjWnQjBxxGzq
         EdOV4RmVolBQeH1h/S+o17nO6xqtIJN8SkUYLSATUdqkrBl3kwfGtOMUduIUcxhqISsT
         iEFirAQ4SrULYB3WH0hzcr7hE5wyg9UKgvtObFS43L62UdpKTbHnR0ELKeZlFX+6zYi4
         BrFQ==
X-Gm-Message-State: AOAM5316fFqPYf8XELYQbFmRXTF8Tk6Ecqoa6r8nxAnUM2yi2Uh6407q
	vapHIf3ZLJZsVRzBip/Ur24=
X-Google-Smtp-Source: ABdhPJwcuVzhib37Sdj2Gl65PK5C/Cg5T9Io2Y2K3huCMlHvhCt4Mujt/pN/fqc6YyUlJHVgX3+Fgw==
X-Received: by 2002:a1c:e3c3:: with SMTP id a186mr5847197wmh.81.1619189922359;
        Fri, 23 Apr 2021 07:58:42 -0700 (PDT)
Received: from agape ([5.171.72.99])
        by smtp.gmail.com with ESMTPSA id y125sm8076731wmy.34.2021.04.23.07.58.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Apr 2021 07:58:42 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 00/49] staging: rtl8723bs: remove all remaining debug macros in rtw_debug.h
Date: Fri, 23 Apr 2021 16:57:51 +0200
Message-Id: <cover.1619189489.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patchset removes all remaining debug macros in rtw_debug.h

DBG_871X_SEL macro is replaced with netdev_dbg() for it does
a raw printk call which is not best recommended for a driver.

@@
expression sel;
expression list args;
identifier padapter;
identifier func;
@@

func(..., struct adapter *padapter, ...) {
	<...
-	DBG_871X_SEL(sel, args);
+	netdev_dbg(padapter->pnetdev, args);
	...>

unused _DBG_871X_LEVEL macro declaration is removed.

Some code cleaning is done and all other private component tracing
macros are removed.

Fabio Aiuto (49):
  staging: rtl8723bs: remove unused log function
  staging: rtl8723bs: replace DBG_871X_SEL log macro with netdev_dbg()
  staging: rtl8723bs: remove DBG_871X_SEL macro declaration
  staging: rtl8723bs: remove unused _DBG_871X_LEVEL macro
  staging: rtl8723bs: remove unused mac_reg_dump() function argument
  staging: rtl8723bs: remove unused bb_reg_dump() function argument
  staging: rtl8723bs: remove unused rf_reg_dump() function argument
  staging: rtl8723bs: remove unused RTW_DBGDUMP macro definition
  staging: rtl8723bs: remove all defs related to _dbgdump macro
  staging: rtl8723bs: remove unused debug variables declarations and
    initialization
  staging: rtl8723bs: remove unneeded header file
  staging: rtl8723bs: remove unused debug macro definitions
  staging: rtl8723bs: remove debug macros related to core/rtw_xmit.c
    tracing
  staging: rtl8723bs: remove debug macros related to os_dep/xmit_linux.c
    tracing
  staging: rtl8723bs: remove debug macros related to core/rtw_recv.c
    tracing
  staging: rtl8723bs: remove debug macros related to os_dep/recv_linux.c
    tracing
  staging: rtl8723bs: remove debug macros related to core/rtw_mlme.c
    tracing
  staging: rtl8723bs: remove debug macros related to os_dep/mlme_linux.c
    tracing
  staging: rtl8723bs: move static array definition from header to .c
    file
  staging: rtl8723bs: remove debug macros related to core/rtw_mlme_ext.c
    tracing
  staging: rtl8723bs: remove debug macros related to core/rtw_sta_mgt.c
    tracing
  staging: rtl8723bs: remove debug macros related to core/rtw_cmd.c
    tracing
  staging: rtl8723bs: remove obsolete debug macro definitions
  staging: rtl8723bs: remove debug macros related to core/rtw_io.c
    tracing
  staging: rtl8723bs: remove obsolete _IO_OSDEP_C_ debug macro
    definition
  staging: rtl8723bs: remove debug macros related to os_dep/os_intfs.c
    tracing
  staging: rtl8723bs: remove debug macros related to core/rtw_security.c
    tracing
  staging: rtl8723bs: remove debug macros related to core/rtw_eeprom.c
    tracing
  staging: rtl8723bs: remove debug macros related to hal/hal_intf.c
    tracing
  staging: rtl8723bs: remove debug macros related to hal/sdio_halinit.c
    tracing
  staging: rtl8723bs: remove unused debug macros tied to
    _RTL871X_IOCTL_C_ definition
  staging: rtl8723bs: remove unused debug macros tied to
    _RTL871X_IOCTL_SET_C_ definition
  staging: rtl8723bs: remove unused debug macros tied to
    _RTL871X_IOCTL_QUERY_C_ definition
  staging: rtl8723bs: remove unused debug macros tied to
    _RTL871X_PWRCTRL_C_ definition
  staging: rtl8723bs: remove unused macros tied to core/rtw_pwrctrl.c
    debug
  staging: rtl8723bs: remove unused macros tied to os_dep/sdio_intf.c
    debug
  staging: rtl8723bs: remove unused debug macros tied to _HCI_OPS_C_
    definition
  staging: rtl8723bs: remove unused debug macros tied to hal/sdio_ops.c
    debug
  staging: rtl8723bs: remove unused debug macros tied to
    os_dep/osdep_service.c debug
  staging: rtl8723bs: remove unused _module_mp_ def
  staging: rtl8723bs: remove unused macros tied to _HCI_OPS_OS_C_
    definition
  staging: rtl8723bs: remove unused macros tied to
    _RTL871X_IOCTL_LINUX_C definition
  staging: rtl8723bs: remove unused macros tied to _RTL8712_CMD_C_
    definition
  staging: rtl8723bs: remove commented out macro definition
  staging: rtl8723bs: remove unused debug macro definitions
  staging: rtl8723bs: remove unused macros tied to core/rtw_efuse.c
    debug
  staging: rtl8723bs: remove unsed debug macros tied to no particular
    code debug
  staging: rtl8723bs: remove last unused debug macros
  staging: rtl8723bs: macro DRIVER_PREFIX expands to lowercase driver
    name

 drivers/staging/rtl8723bs/core/rtw_cmd.c      |   2 -
 drivers/staging/rtl8723bs/core/rtw_debug.c    |  39 ++--
 drivers/staging/rtl8723bs/core/rtw_eeprom.c   |   2 -
 drivers/staging/rtl8723bs/core/rtw_efuse.c    |   2 -
 drivers/staging/rtl8723bs/core/rtw_io.c       |   2 -
 drivers/staging/rtl8723bs/core/rtw_mlme.c     |   2 -
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c |  32 +++-
 drivers/staging/rtl8723bs/core/rtw_pwrctrl.c  |   2 -
 drivers/staging/rtl8723bs/core/rtw_recv.c     |   2 -
 drivers/staging/rtl8723bs/core/rtw_security.c |   2 -
 drivers/staging/rtl8723bs/core/rtw_sta_mgt.c  |   2 -
 drivers/staging/rtl8723bs/core/rtw_xmit.c     |   2 -
 drivers/staging/rtl8723bs/hal/hal_intf.c      |   3 -
 drivers/staging/rtl8723bs/hal/sdio_halinit.c  |   2 -
 drivers/staging/rtl8723bs/hal/sdio_ops.c      |   2 -
 drivers/staging/rtl8723bs/include/rtw_debug.h | 170 +-----------------
 .../staging/rtl8723bs/include/rtw_mlme_ext.h  |  32 ----
 .../staging/rtl8723bs/os_dep/ioctl_linux.c    |   6 +-
 drivers/staging/rtl8723bs/os_dep/mlme_linux.c |   4 -
 drivers/staging/rtl8723bs/os_dep/os_intfs.c   |   2 -
 .../staging/rtl8723bs/os_dep/osdep_service.c  |   4 -
 drivers/staging/rtl8723bs/os_dep/recv_linux.c |   2 -
 drivers/staging/rtl8723bs/os_dep/sdio_intf.c  |   2 -
 drivers/staging/rtl8723bs/os_dep/xmit_linux.c |   2 -
 24 files changed, 48 insertions(+), 274 deletions(-)

-- 
2.20.1

