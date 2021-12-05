Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 608AF2C80
	for <linux-staging@lists.linux.dev>; Sun,  5 Dec 2021 13:59:29 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id x15so32285506edv.1
        for <linux-staging@lists.linux.dev>; Sun, 05 Dec 2021 05:59:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=iAHMngfO41TnEdh6H008A3VfjsmKRpjhz8V7MtD1hQ8=;
        b=bmsi3P7462SlnAHylMaESJzb7zLJVX83KxuxipSeZj6VQyFdJSI3V63GqLz332W9os
         p4HeAd/fAXIHxZsUe5CktO5C29aalM+k+j1tCJ/GshNXBMw5Falgf1lsJNruoHEO0lSS
         mvm/LmBTI023y9rLuj5gpX1J+/xcKxOPVAat91ICNn2+Hv9f2ywDa9RINicUY6ZuQJsP
         HHjP1s+mwkfe0I6c8wFXgA6otEnvo6yti8h+DNRZUo75U/y+lHglzRQzYRGXwCRZCvnh
         b+LYLlqD5ejjk2bkFOHNJ4rKZomzOCjHKKIKe0iwGBhpv3BmlHyY1rk7EJie33Jo27d7
         JHLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=iAHMngfO41TnEdh6H008A3VfjsmKRpjhz8V7MtD1hQ8=;
        b=11a2ArAvafVd61YaRV7Z2kW2yjIUdfkHJ91FDTjCAPKdZrD6khChglK/9Vh4SZFa4n
         Pd2hPkhfN3jc6T2Q6QqvJkJpkKnAoh7yQ1msoMsrWHxBGBgTidoLWHfM+XKYb2jIvxBr
         6McPYyHfjB/gbuDQvB/vs6kkhFYao15c2tn8fmEqxxbsa3IWOwkUMuTEFMlQ/gfMcxMV
         ffaC9ffA8n2hUlOiSBbltcQNr7qRdQen08yz2DxUVelfPl1wFOFYzuZgjfEbLAemY8Hw
         8GxG1Je5Pc9Bu+0mHTRrdnjP84yuHVD3Jzq/y2u9/5VR75wrxhZTaE4rTq/xMl4rjql8
         3BQg==
X-Gm-Message-State: AOAM533N4Q95/N0JbOTDuKlrWmJx1Wm5FQWGdK4BJRSXoTfw+YusUO1g
	/pBn8oY15bjC5djYTJowETw=
X-Google-Smtp-Source: ABdhPJxSDiq5U6GkKkIC5y7VUtBdm5jtRDmLC93mCp0Jj6N9oy1v99DgL/Nz8+xKGpZEuW0NaTrGWQ==
X-Received: by 2002:a05:6402:27c7:: with SMTP id c7mr45856390ede.0.1638712767750;
        Sun, 05 Dec 2021 05:59:27 -0800 (PST)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::5a05])
        by smtp.gmail.com with ESMTPSA id yd20sm5146451ejb.47.2021.12.05.05.59.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Dec 2021 05:59:27 -0800 (PST)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 00/12] staging: r8188eu: misc cleanups
Date: Sun,  5 Dec 2021 14:59:07 +0100
Message-Id: <20211205135919.30460-1-straube.linux@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series consists of various cleanups.

Tested on x86_64 with InterTech DMG-02.

Michael Straube (12):
  staging: r8188eu: remove RF_PATH_{C,D}
  staging: r8188eu: struct odm_mac_status_info is not used
  staging: r8188eu: remove macro PHY_SetRFReg
  staging: r8188eu: remove macro PHY_QueryRFReg
  staging: r8188eu: remove macro PHY_SetBBReg
  staging: r8188eu: remove macro PHY_QueryBBReg
  staging: r8188eu: remove duplicate defines
  staging: r8188eu: bWIFI_Direct is set but never used
  staging: r8188eu: bWIFI_Display is set but never used
  staging: r8188eu: remove unused macro IS_FW_81xxC
  staging: r8188eu: remove macro GET_HAL_DATA
  staging: r8188eu: hal_data_sz is set but never used

 drivers/staging/r8188eu/core/rtw_p2p.c        |  3 -
 drivers/staging/r8188eu/hal/HalPhyRf_8188e.c  | 30 +++----
 drivers/staging/r8188eu/hal/odm.c             | 14 +--
 drivers/staging/r8188eu/hal/odm_interface.c   | 12 +--
 drivers/staging/r8188eu/hal/rtl8188e_cmd.c    | 12 +--
 drivers/staging/r8188eu/hal/rtl8188e_dm.c     | 14 +--
 .../staging/r8188eu/hal/rtl8188e_hal_init.c   | 26 ++----
 drivers/staging/r8188eu/hal/rtl8188e_phycfg.c | 86 +++++++------------
 drivers/staging/r8188eu/hal/rtl8188e_rf6052.c | 38 ++++----
 drivers/staging/r8188eu/hal/rtl8188e_rxdesc.c |  2 +-
 drivers/staging/r8188eu/hal/rtl8188eu_led.c   |  2 +-
 drivers/staging/r8188eu/hal/rtl8188eu_xmit.c  |  4 +-
 drivers/staging/r8188eu/hal/usb_halinit.c     | 63 +++++++-------
 drivers/staging/r8188eu/hal/usb_ops_linux.c   |  4 +-
 .../staging/r8188eu/include/Hal8188EPhyCfg.h  | 16 ----
 drivers/staging/r8188eu/include/drv_types.h   |  3 +-
 drivers/staging/r8188eu/include/hal_intf.h    |  2 -
 drivers/staging/r8188eu/include/odm.h         |  8 --
 drivers/staging/r8188eu/include/rtl8188e_dm.h |  7 +-
 .../staging/r8188eu/include/rtl8188e_hal.h    |  5 +-
 20 files changed, 136 insertions(+), 215 deletions(-)

-- 
2.34.1

