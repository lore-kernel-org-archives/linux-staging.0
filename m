Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E1065F
	for <linux-staging@lists.linux.dev>; Mon, 22 Mar 2021 13:37:11 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id b9so16823857wrt.8
        for <linux-staging@lists.linux.dev>; Mon, 22 Mar 2021 06:37:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=986+rBY9NMvg8AWZ+8JJZIeBkd7kUyvjIDJpIiifLf0=;
        b=UR216jgDaXBsNdJEsNaJP4epLzYIJHaUZg2E4lCZUMe1HnHICN8FkEz7M30RLnJfxC
         JhFTQIH1xOcsDS08Fh3abumCHEV9de8GRJnK3UKcjFEAPFrogzSB0J2xltlPLkvU7Afg
         tm5s5x5WXTjlmvsafsqI/sGmqg2hEc3opl9CL3bFU7OhovgfKc8f6Mlexq82Mda3pnx6
         ypn6q+8NfUwGU1cCex2+11n3O0/UnbFdrDYidABEeO5WXhdV5APf6OB6fZFWf1stsIft
         EfqS5Zg+uCrFRUvr92HrOFFFMXpm7gi5V5B/8oCe6l99nSBC60qht+7B2b0sQ0OPoewU
         NV7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=986+rBY9NMvg8AWZ+8JJZIeBkd7kUyvjIDJpIiifLf0=;
        b=VkP1t0tgeF6o/Mu/aKuQMPJbUNxq9Rsr4IZ5bGpQAsHu8pOqdYmJxnYHBU2FrLpuQu
         M029ZejeOXAt9ScLq4yqY9Qfrafbq2eTqjpEAZRkRJnJmAH6k7b2RI6mtjf/VGbOCqZX
         7hzKvA9+r/ByF3N3nguSE9/RRyIexie4paXmVaJFc8KhXtqfPBM5UQ6zGjTff0tX9ACf
         Z7gT3Jgz+7xm0FF5yQhbSVJUsedwWYLd5IJso07emmiouWDqA496R0VL+wj9tQhPBdNU
         UZoSMAmXfmGD8bhdv0Lp3qe6B+43Oy21c7fNeKLO1mN3gCSn43NnQDswhOt4mfv4zekB
         naEw==
X-Gm-Message-State: AOAM530suPUOBgPN3Q/KBLpL5PKShHtjZpbMZtO9pi4dA4VmushHVxhW
	k+M+ym/S2menN7AMwCdKc7g=
X-Google-Smtp-Source: ABdhPJx38VN2gZJnb4yulSEi2NStgAa6uuHkLc7QvuOBWRxbS2xcQE8gxsXh6BRYmN1NwTWD0a4k2Q==
X-Received: by 2002:a5d:4bce:: with SMTP id l14mr11471454wrt.99.1616420230190;
        Mon, 22 Mar 2021 06:37:10 -0700 (PDT)
Received: from gimli.cesven (93-48-145-141.ip257.fastwebnet.it. [93.48.145.141])
        by smtp.gmail.com with ESMTPSA id d204sm17091770wmc.17.2021.03.22.06.37.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Mar 2021 06:37:09 -0700 (PDT)
From: Marco Cesati <marcocesati@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Larry Finger <Larry.Finger@lwfinger.net>,
	linux-staging@lists.linux.dev,
	Dan Carpenter <dan.carpenter@oracle.com>
Subject: [PATCH 00/19] Staging: rtl8723bs: Remove unreferenced struct's
Date: Mon, 22 Mar 2021 14:36:58 +0100
Message-Id: <20210322133717.17797-1-marcocesati@gmail.com>
X-Mailer: git-send-email 2.30.2
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The staging/rtl8723bs driver includes 83 struct definifions
that are never referenced in the code. This patchset removes all
of them.

[PATCH 01/19] Staging: rtl8723bs: remove useless structs in rtw_mlme.h
[PATCH 02/19] Staging: rtl8723bs: remove useless structs in rtw_cmd.h
[PATCH 03/19] Staging: rtl8723bs: remove useless structs in rtw_recv.h
[PATCH 04/19] Staging: rtl8723bs: remove useless structs in drv_types.h
[PATCH 05/19] Staging: rtl8723bs: remove useless structs in rtw_ioctl_set.h
[PATCH 06/19] Staging: rtl8723bs: remove useless structs in wlan_bssdef.h
[PATCH 07/19] Staging: rtl8723bs: remove useless structs in rtw_mp.h
[PATCH 08/19] Staging: rtl8723bs: remove useless structs in hal_intf.h
[PATCH 09/19] Staging: rtl8723bs: remove useless structs in rtw_event.h
[PATCH 10/19] Staging: rtl8723bs: remove useless structs in rtl8723b_recv.h
[PATCH 11/19] Staging: rtl8723bs: remove useless structs in rtw_security.h
[PATCH 12/19] Staging: rtl8723bs: remove useless structs in rtw_wifi_regd.h
[PATCH 13/19] Staging: rtl8723bs: remove useless structs in rtw_io.h
[PATCH 14/19] Staging: rtl8723bs: remove useless structs in wifi.h
[PATCH 15/19] Staging: rtl8723bs: remove useless structs in hal_phy.h
[PATCH 16/19] Staging: rtl8723bs: remove useless structs in rtw_xmit.h
[PATCH 17/19] Staging: rtl8723bs: remove useless structs in ieee80211.h
[PATCH 18/19] Staging: rtl8723bs: remove useless structs in odm_HWConfig.h
[PATCH 19/19] Staging: rtl8723bs: remove useless structs in odm.h

 drivers/staging/rtl8723bs/hal/odm.h           |  61 -----
 drivers/staging/rtl8723bs/hal/odm_HWConfig.h  |  45 ----
 drivers/staging/rtl8723bs/include/drv_types.h |   9 -
 drivers/staging/rtl8723bs/include/hal_intf.h  |   8 -
 drivers/staging/rtl8723bs/include/hal_phy.h   |  24 --
 drivers/staging/rtl8723bs/include/ieee80211.h |  94 -------
 .../staging/rtl8723bs/include/rtl8723b_recv.h |  44 ----
 drivers/staging/rtl8723bs/include/rtw_cmd.h   | 231 ------------------
 drivers/staging/rtl8723bs/include/rtw_event.h |  11 -
 drivers/staging/rtl8723bs/include/rtw_io.h    | 111 ---------
 .../staging/rtl8723bs/include/rtw_ioctl_set.h |   6 -
 drivers/staging/rtl8723bs/include/rtw_mlme.h  |  38 ---
 drivers/staging/rtl8723bs/include/rtw_mp.h    |  17 --
 drivers/staging/rtl8723bs/include/rtw_recv.h  |   7 -
 .../staging/rtl8723bs/include/rtw_security.h  |   6 -
 .../staging/rtl8723bs/include/rtw_wifi_regd.h |   5 -
 drivers/staging/rtl8723bs/include/rtw_xmit.h  |   5 -
 drivers/staging/rtl8723bs/include/wifi.h      |  15 --
 .../staging/rtl8723bs/include/wlan_bssdef.h   |  26 --
 19 files changed, 763 deletions(-)

-- 
2.30.2

