Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B5C872
	for <linux-staging@lists.linux.dev>; Wed, 21 Jul 2021 13:37:27 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id gb6so3304382ejc.5
        for <linux-staging@lists.linux.dev>; Wed, 21 Jul 2021 06:37:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NNqnEuB+5OB8TJyJbR1IoAR5/BGotvCxYkvDB2PV0Co=;
        b=rgxF3s/V9nYfNtJgHVsGhWOhJPGQiSt3IWD7yiJHQzTdz1yCY6pV0TFPbtAMWpFANz
         Hesrf1GVTGxm2PJQhUYt3Jrh5sOBRHrfhBtD91CUQ9Sqt5u8t1a93goPIWSGH8/frWnO
         Gdbu40HG1mcet3eJXlZsTOJP5qSoDF0TLzAINRg1Rv/bEkIl5u/G0/5d+vCUhpfaPKb1
         61LbRWmGsg4RYY5QM5l1f+70vxd9NvNEb+S3LcQr32Bi/BhgFJUMCLp3eSAnOyN2lpeR
         UJnUJjPJtfoZ1jWMsukIAe4TDfLCCdhotrc8VumbeG6BUfKEIaoQOJgAAe00aROdgBIQ
         I/TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NNqnEuB+5OB8TJyJbR1IoAR5/BGotvCxYkvDB2PV0Co=;
        b=YYr5cgr8yRwK+0IP5tIwtrXAimyUA9wp4X9Odk8OV5br3BgzfXGy1jUMdEZksFrjQl
         owFnLp54kP6c4hAQGP/VFucBsZdKNDbeO4J3vRA00iQyl7ICQP8ZSrFBUmt7U7znqsYk
         OZLyUSDR0FFRn54QnC21Gud97eUHsbSJFuoJ/Q+bHNdCVcgXl6iShrP/tQ3S1a9kIqBx
         pibc/cZChWn5ZAe0Trkr630p6gQ3dn/V9OAzmYfBgJfBd77Ad1phkoTYIbEJZUJXszAR
         sVsNejfbyLAdxg5pOggdgegRIuFSGcwAFNdKMFDi8+nIGoFcMh1fu2t7uTgQ54qK7UEY
         Kqvw==
X-Gm-Message-State: AOAM533sDNnTgq6SORoGAQZ6gyxyw65hhm215brzL112VcX5Hri5Ef9X
	Gh1xwKT1rY4MKRcjMxRg9Z0=
X-Google-Smtp-Source: ABdhPJy2dcfZymYVJe6H9C+JYQB8LUIfTqWDEKybU6AQuwylVf7huAyl90wYbonbF6M/wxjTVZTnMw==
X-Received: by 2002:a17:906:bc48:: with SMTP id s8mr39318350ejv.453.1626874645461;
        Wed, 21 Jul 2021 06:37:25 -0700 (PDT)
Received: from agape ([5.171.73.45])
        by smtp.gmail.com with ESMTPSA id o23sm8652136edv.22.2021.07.21.06.37.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jul 2021 06:37:25 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: hdegoede@redhat.com,
	Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 00/16] staging: rtl8723bs: remove residual 5 Ghz code and more code cleaning
Date: Wed, 21 Jul 2021 15:37:07 +0200
Message-Id: <cover.1626874164.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patchset removes some residual 5 Ghz dead code,
left undeleted from recent patches intended for
this aim.

Done some code cleaning as well (mainly camel case fixes)

Fabio Aiuto (16):
  staging: rtl8723bs: simplify function selecting channel group
  staging: rtl8723bs: fix camel case inside function
  staging: rtl8723bs: convert function name to snake case
  staging: rtl8723bs: add spaces around operator
  staging: rtl8723bs: remove 5Ghz code blocks
  staging: rtl8723bs: remove commented out condition
  staging: rtl8723bs: fix camel case in struct wlan_bssid_ex
  staging: rtl8723bs: fix camel case in struct ndis_802_11_conf
  staging: rtl8723bs: remove struct ndis_802_11_conf_fh
  staging: rtl8723bs: fix camel case in struct ndis_802_11_ssid
  staging: rtl8723bs: fix camel case in struct wlan_phy_info
  staging: rtl8723bs: fix camel case in struct wlan_bcn_info
  staging: rtl8723bs: fix camel case in IE structures
  staging: rtl8723bs: remove unused struct ndis_802_11_ai_reqfi
  staging: rtl8723bs: remove unused struct ndis_801_11_ai_resfi
  staging: rtl8723bs: fix camel case in struct ndis_802_11_wep

 drivers/staging/rtl8723bs/core/rtw_ap.c       | 124 ++++----
 drivers/staging/rtl8723bs/core/rtw_cmd.c      |  54 ++--
 .../staging/rtl8723bs/core/rtw_ieee80211.c    |  80 ++---
 .../staging/rtl8723bs/core/rtw_ioctl_set.c    |  28 +-
 drivers/staging/rtl8723bs/core/rtw_mlme.c     | 214 +++++++------
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 287 +++++++++---------
 .../staging/rtl8723bs/core/rtw_wlan_util.c    | 102 +++----
 drivers/staging/rtl8723bs/hal/hal_btcoex.c    |   2 +-
 drivers/staging/rtl8723bs/hal/hal_com.c       |   2 +-
 drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c  |  22 +-
 .../staging/rtl8723bs/hal/rtl8723b_hal_init.c |  64 +---
 drivers/staging/rtl8723bs/include/rtw_mlme.h  |   6 +-
 .../staging/rtl8723bs/include/wlan_bssdef.h   |  90 +++---
 .../staging/rtl8723bs/os_dep/ioctl_cfg80211.c |  92 +++---
 .../staging/rtl8723bs/os_dep/ioctl_linux.c    | 190 ++++++------
 drivers/staging/rtl8723bs/os_dep/os_intfs.c   |   4 +-
 16 files changed, 641 insertions(+), 720 deletions(-)

-- 
2.20.1

