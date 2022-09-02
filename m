Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F938110D
	for <linux-staging@lists.linux.dev>; Fri,  2 Sep 2022 09:52:35 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id nc14so2793309ejc.4
        for <linux-staging@lists.linux.dev>; Fri, 02 Sep 2022 02:52:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=FMEGVSOQkvEokkzg/zVey43XHPk5Q3zfHXWM53CUdaY=;
        b=f+PjAC+0e5lCK6fRQQe0Q09f7Jkj6BMsEz0Z/kmCqNNPtLl0eEPV/I+1Ole9ylTHyC
         M92keJqqZsTRqm9IbQifbptNbcNzANGRrole8CMNwt02MEYYrduJQFkUmIaTPfblavLk
         8mIgHgxyL0dHE2W9YhqYeMdypgvXEtKEK8/vvh9zof7E4S9m/xmeao46xexZ4mP0knGM
         WivaDVeMb205BeaVnBkWP1LwRoDdhq5YRxyV6RyERgAIaMH8645W9+zE6Vpdxa4O5zq4
         tI6sSJsM7dsmgtPHqCyeYYOgkbumJHKFtXMHEL1NbUZhtE/JC9EzzHyugt1ztD7hlUDj
         Vaxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=FMEGVSOQkvEokkzg/zVey43XHPk5Q3zfHXWM53CUdaY=;
        b=QUcAwJMUpNqt3IRmr+PWlOcqhERVprCC90fBg/XUE3osPxd0T4Pat9JBnO2L3JUIDr
         FotpS8Xyj0v4Gj2ZYDpD/I2I7J7LAfHkDMyk3uMCh5Geh07QDjh6oxdma6snUx2ClCMD
         hUekjX+y5cBdAysIwvyUvr4B8IvuJm+zzKn5f9blynLsxWtv9FlXs8hiM5G2PM4O2npz
         ZwvbyGxelizZ0sRp0vVwXZiMiCUWuYu26ft6IuesVtrL9qe/zDNE1wnHXbmb9vcTCZ0N
         80sxR4NrGBAvxnaWVnoSTfRR96C35S028jnn4h5gNk1mw/YzcNyLK9wDwgDaKZCgYoPB
         c7jA==
X-Gm-Message-State: ACgBeo3VonKapUwQV8es7R2IFcELDOURfRcR2QgRyGFkILV5mh1YWCoL
	5wmfyHG/a27Rb7QTpqlaSIbxvVsv0aE=
X-Google-Smtp-Source: AA6agR6h9SKqWA8ZtgnUx9yY1cfILzhCU0Iv0fn3rtUUhswC7N2X4v2tOJryQAu3SsMuPfyzCEcIRg==
X-Received: by 2002:a17:907:7b92:b0:72b:67fb:8985 with SMTP id ne18-20020a1709077b9200b0072b67fb8985mr25319525ejc.569.1662112353712;
        Fri, 02 Sep 2022 02:52:33 -0700 (PDT)
Received: from localhost.localdomain (ip-217-105-46-83.ip.prioritytelecom.net. [217.105.46.83])
        by smtp.gmail.com with ESMTPSA id h6-20020a170906828600b0073d6234ceebsm959601ejx.160.2022.09.02.02.52.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Sep 2022 02:52:33 -0700 (PDT)
From: Nam Cao <namcaov@gmail.com>
To: Larry.Finger@lwfinger.net,
	gregkh@linuxfoundation.org,
	hdegoede@redhat.com
Cc: namcaov@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH 00/10] staging: rtl8723bs: delete some dead code
Date: Fri,  2 Sep 2022 11:51:50 +0200
Message-Id: <cover.1662111798.git.namcaov@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Delete some unused functions and files.

Nam Cao (10):
  staging: rtl8723bs: delete rtw_setdatarate_cmd
  staging: rtl8723bs: delete function rtw_set_chplan_cmd
  staging: rtl8723bs: remove rtw_change_ifname
  staging: rtl8723bs: delete rtw_odm.c and rtw_odm.h
  staging: rtl8723bs: remove odm_PauseDIG
  staging: rtl8723bs: remove GetHexValueFromString
  staging: rtl8723bs: remove hal_btcoex_SetManualControl
  staging: rtl8723bs: remove rtw_hal_is_disable_sw_channel_plan
  staging: rtl8723bs: remove IsHexDigit
  staging: rtl8723bs: remove rtw_is_wps_ie

 drivers/staging/rtl8723bs/Makefile            |   1 -
 drivers/staging/rtl8723bs/core/rtw_cmd.c      |  84 -------------
 .../staging/rtl8723bs/core/rtw_ieee80211.c    |  17 ---
 drivers/staging/rtl8723bs/core/rtw_odm.c      | 116 ------------------
 drivers/staging/rtl8723bs/hal/hal_btcoex.c    |   5 -
 drivers/staging/rtl8723bs/hal/hal_com.c       |  64 ----------
 drivers/staging/rtl8723bs/hal/hal_intf.c      |   5 -
 drivers/staging/rtl8723bs/hal/odm_DIG.c       |  57 ---------
 drivers/staging/rtl8723bs/hal/odm_DIG.h       |   2 -
 drivers/staging/rtl8723bs/include/drv_types.h |   3 -
 .../staging/rtl8723bs/include/hal_btcoex.h    |   1 -
 drivers/staging/rtl8723bs/include/hal_com.h   |   4 -
 drivers/staging/rtl8723bs/include/hal_intf.h  |   2 -
 drivers/staging/rtl8723bs/include/ieee80211.h |   1 -
 drivers/staging/rtl8723bs/include/rtw_cmd.h   |   3 -
 drivers/staging/rtl8723bs/include/rtw_odm.h   |  24 ----
 .../staging/rtl8723bs/os_dep/osdep_service.c  |  50 --------
 17 files changed, 439 deletions(-)
 delete mode 100644 drivers/staging/rtl8723bs/core/rtw_odm.c
 delete mode 100644 drivers/staging/rtl8723bs/include/rtw_odm.h

-- 
2.25.1

