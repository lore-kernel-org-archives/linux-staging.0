Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AF6D5F
	for <linux-staging@lists.linux.dev>; Wed, 24 Mar 2021 18:38:40 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id 12so13439570wmf.5
        for <linux-staging@lists.linux.dev>; Wed, 24 Mar 2021 11:38:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=k5Lq5qI3gUtQ2Fw+kXZcrqjVLg4m7vbE/f00iRpNQ/s=;
        b=RloFIBuNYHHigzeSjQTp6l1LibrDaMmAUEXZDOK+G+nxktefIVqghLEa2dnMU/8BGg
         aKmLeDMrEJw0ZLeuViB2Dyofac1J9w14EPkBtgvOzk1Pz5TgDVi+velMC6/mLgLxySk7
         J52durxiH7X4FcupKjez86uBP+6B/jHrD3vISsnmP/gmRPGxXJEBP62d/TIyhmV5LmOC
         dYbiC/UOli9r/glL06fKqSbDxgI4204QZVdg/eDFm4PhsfxuaP5VKxL0gCf1m1V7dJzB
         VIrFnAxNahkg0OXEPKONSb6gX86XX5bmrsHEzu0yuEQdJvd12X6fv4jOvoXFEtbioGRQ
         imIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=k5Lq5qI3gUtQ2Fw+kXZcrqjVLg4m7vbE/f00iRpNQ/s=;
        b=uOmU+V69q95W84y+bja7Gfjn3YqbpjIbcAlS0wOaoFGW4ZhbNJpi6Hj1rBClhki0LJ
         WOPQN4k5tMG0UFVf9B9SUnoKTXT6DrXzaOeFoSjxF2/gzUT1FKmsSCtWIrUEVIxORixf
         Ii3SiM0dMLMuLQpm6+86Z5ye9kPk02WsuS4ohxTWq9rr2lJW59ckTyFMZx3/mmwNx8fm
         Qcurj0PhwsLaEfZ2w+oM54Ggi+jfc4MdlXdDuX9+H9PD4P0ebG9fZ8vk5U4pHfZx+GJ0
         +elj9MsNwKiUwmF7movaFla2XS/a5RXgSRgzzaG29WqpTk43HXTw/mgUUUfd7CagInbI
         SsDQ==
X-Gm-Message-State: AOAM532Ca38Elkh7u5HSqnELUvw12/UNGsUfJi0DSFz/eRf1XFzQKNEi
	kSlPMyNPDZVHkDwGjJQVKi0=
X-Google-Smtp-Source: ABdhPJwQzNRoFEqB8sKy6ZmFkCxyTNSVg/NVxOVpjdTcktbYYRiqB85dF8oX4YIhqSucivlpqtudRA==
X-Received: by 2002:a05:600c:2204:: with SMTP id z4mr4381921wml.31.1616611118514;
        Wed, 24 Mar 2021 11:38:38 -0700 (PDT)
Received: from gimli.home (93-48-145-141.ip257.fastwebnet.it. [93.48.145.141])
        by smtp.gmail.com with ESMTPSA id z2sm4358040wrm.0.2021.03.24.11.38.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Mar 2021 11:38:38 -0700 (PDT)
From: Marco Cesati <marcocesati@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Larry Finger <Larry.Finger@lwfinger.net>,
	linux-staging@lists.linux.dev
Subject: [PATCH 00/21] Staging: rtl8723bs: remove unreferenced enum definitions
Date: Wed, 24 Mar 2021 19:38:26 +0100
Message-Id: <20210324183847.5595-1-marcocesati@gmail.com>
X-Mailer: git-send-email 2.30.2
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The staging/rtl8723bs driver includes 57 enum definitions that are not
referenced elsewhere in the code. This patchset removes these
unnecessary definitions.

This patchset replaces the patchset sent with the message "[PATCH 00/33]
Staging: rtl8723bs: remove unnecessary enum names and definitions",
which also included 82 changes from named enums to anonymous enums.

[PATCH 01/21] Staging: rtl8723bs: remove enums in rtw_mlme.h
[PATCH 02/21] Staging: rtl8723bs: remove enums in hal_com.h
[PATCH 03/21] Staging: rtl8723bs: remove enums in drv_types.h
[PATCH 04/21] Staging: rtl8723bs: remove enums in wlan_bssdef.h
[PATCH 05/21] Staging: rtl8723bs: remove enums in rtw_mp.h
[PATCH 06/21] Staging: rtl8723bs: remove enums in osdep_service.h
[PATCH 07/21] Staging: rtl8723bs: remove enums in hal_intf.h
[PATCH 08/21] Staging: rtl8723bs: remove enums in hal_com_h2c.h
[PATCH 09/21] Staging: rtl8723bs: remove enums in rtw_wifi_regd.h
[PATCH 10/21] Staging: rtl8723bs: remove enums in wifi.h
[PATCH 11/21] Staging: rtl8723bs: remove enums in hal_phy.h
[PATCH 12/21] Staging: rtl8723bs: remove enums in rtw_mlme_ext.h
[PATCH 13/21] Staging: rtl8723bs: remove enums in rtw_xmit.h
[PATCH 14/21] Staging: rtl8723bs: remove enums in rtw_rf.h
[PATCH 15/21] Staging: rtl8723bs: remove enums in ieee80211.h
[PATCH 16/21] Staging: rtl8723bs: remove enums in odm_interface.h
[PATCH 17/21] Staging: rtl8723bs: remove enums in HalBtcOutSrc.h
[PATCH 18/21] Staging: rtl8723bs: remove enums in odm_types.h
[PATCH 19/21] Staging: rtl8723bs: remove enums in odm_DIG.h
[PATCH 20/21] Staging: rtl8723bs: remove enums in HalPhyRf.h
[PATCH 21/21] Staging: rtl8723bs: remove enums in odm.h

 drivers/staging/rtl8723bs/hal/HalBtcOutSrc.h  |  34 -----
 drivers/staging/rtl8723bs/hal/HalPhyRf.h      |   5 -
 drivers/staging/rtl8723bs/hal/odm.h           | 117 ------------------
 drivers/staging/rtl8723bs/hal/odm_DIG.h       |  16 ---
 drivers/staging/rtl8723bs/hal/odm_interface.h |   8 --
 drivers/staging/rtl8723bs/hal/odm_types.h     |  41 ------
 drivers/staging/rtl8723bs/include/drv_types.h |  15 ---
 drivers/staging/rtl8723bs/include/hal_com.h   |   4 -
 .../staging/rtl8723bs/include/hal_com_h2c.h   |  60 ---------
 drivers/staging/rtl8723bs/include/hal_intf.h  |  22 ----
 drivers/staging/rtl8723bs/include/hal_phy.h   |  42 -------
 drivers/staging/rtl8723bs/include/ieee80211.h |  81 ------------
 .../staging/rtl8723bs/include/osdep_service.h |  23 ----
 drivers/staging/rtl8723bs/include/rtw_mlme.h  |  12 --
 .../staging/rtl8723bs/include/rtw_mlme_ext.h  |  12 --
 drivers/staging/rtl8723bs/include/rtw_mp.h    |  98 ---------------
 drivers/staging/rtl8723bs/include/rtw_rf.h    |  24 ----
 .../staging/rtl8723bs/include/rtw_wifi_regd.h |   7 --
 drivers/staging/rtl8723bs/include/rtw_xmit.h  |   7 --
 drivers/staging/rtl8723bs/include/wifi.h      |  24 ----
 .../staging/rtl8723bs/include/wlan_bssdef.h   |   5 -
 21 files changed, 657 deletions(-)

-- 
2.30.2

