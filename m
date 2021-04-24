Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0893071
	for <linux-staging@lists.linux.dev>; Sat, 24 Apr 2021 09:02:36 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id h4so41637986wrt.12
        for <linux-staging@lists.linux.dev>; Sat, 24 Apr 2021 02:02:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fxqQngAtv5nDQvF1nMweGDryMsbGOYVjl3SPSVnCHbw=;
        b=TxJIrrzHLhaIwt4IBYlFLKup23gyOIgCi7XwRw3EJ24/5waowEk4jj3uOhCLo9Vil0
         xJYpRwlRD22jF3tbj1w7x0cQitsJB4crj4ffYJD5D3M4J85tg5PCusTZFJvoQxetrdfN
         WOvS1NzjKs0hK6La8EASJcqf4xuj2gqrXxBJm/qUjG7JHZExsNnGsuNbYv2bohNNmJFD
         GWNWEEnEiVppaSc0tkBg968dG42NGaH9gNl8dqvUO3RwqShF9e2C38j8N41t3iy9igpY
         gL3+KljjGWiFEwyxce6WAtXnNau1o9P7sTb6dizEQqXr5KEGknoukLGyuZan3+VffIZq
         Vwzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fxqQngAtv5nDQvF1nMweGDryMsbGOYVjl3SPSVnCHbw=;
        b=eeZfGmf1Ipc9XlytnVAfyISUQ2Gfj82m7Oicr+5A/04Uy/S49l84bzH33LDRYE3w8x
         9H6qWggPgFaDAp/qHJD+ohFw06JTk+HwRWxy7C9WXGQ68OFmMq7NcwMxgDKf19NrHBJE
         Z8Cx6FJTiDGhjWp4mq+mrniBLqMCInBDnM3Dt/LtZ/Gl00asfK4TtnsIqiWnhmTG+a29
         B4DpGGKfYW6hlK/OOKuU7S+sPmKfoTc7avBS+SY0z1J1ZD9k81Zl61kwOB1YrbkRDHV6
         yWo3vSq0b9eEzr60b5LFUZs6z69s0ZzocuSD07NdY5DnQh3Yv+iH7mI2VRn0YwNif7xP
         vPvg==
X-Gm-Message-State: AOAM5320hR0vaxr8Qny3RrWR6G0G7pkigeGcxGYnDMrTxo+jOHmib7B0
	uNLKJS949sz7+IGzrNRN4KI=
X-Google-Smtp-Source: ABdhPJzlwYKm8sbkl0TWP5xkYbTWJQRybwyud8u4RxDedpvGe+mgR0V9KweMAQOhzYtWdj/Kz7Cg1Q==
X-Received: by 2002:a05:6000:184c:: with SMTP id c12mr9986779wri.125.1619254955505;
        Sat, 24 Apr 2021 02:02:35 -0700 (PDT)
Received: from agape ([5.171.80.252])
        by smtp.gmail.com with ESMTPSA id l25sm10375457wmi.17.2021.04.24.02.02.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Apr 2021 02:02:35 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: joe@perches.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 00/50] staging: rtl8723bs: remove all remaining debug macros in rtw_debug.h
Date: Sat, 24 Apr 2021 11:01:43 +0200
Message-Id: <cover.1619254603.git.fabioaiuto83@gmail.com>
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
-       DBG_871X_SEL(sel, args);
+       netdev_dbg(padapter->pnetdev, args);
        ...>

unused _DBG_871X_LEVEL macro declaration is removed.

Beautified register dump in core/rtw_debug.c 

Some code cleaning is done and all other private component tracing
macros are removed.

----------------------------------------------
Changes in v2:
	- Added a patch to improve register dump
	- Fix commit message and changelog in patch
	  removing an unneeded include directive

Fabio Aiuto (50):
  staging: rtl8723bs: remove unused log function
  staging: rtl8723bs: replace DBG_871X_SEL log macro with netdev_dbg()
  staging: rtl8723bs: add two functions to improve register dump in
    core/rtw_debug.c
  staging: rtl8723bs: remove DBG_871X_SEL macro declaration
  staging: rtl8723bs: remove unused _DBG_871X_LEVEL macro
  staging: rtl8723bs: remove unused mac_reg_dump() function argument
  staging: rtl8723bs: remove unused bb_reg_dump() function argument
  staging: rtl8723bs: remove unused rf_reg_dump() function argument
  staging: rtl8723bs: remove unused RTW_DBGDUMP macro definition
  staging: rtl8723bs: remove all defs related to _dbgdump macro
  staging: rtl8723bs: remove unused debug variables declarations and
    initialization
  staging: rtl8723bs: remove unneeded header file include
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
 drivers/staging/rtl8723bs/core/rtw_debug.c    |  74 ++++----
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
 24 files changed, 69 insertions(+), 288 deletions(-)

-- 
2.20.1

