Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53D0E1366
	for <linux-staging@lists.linux.dev>; Sat,  2 Apr 2022 09:23:39 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id bq8so10397829ejb.10
        for <linux-staging@lists.linux.dev>; Sat, 02 Apr 2022 02:23:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mLZblWMyil7t1ZX+pjvViUNPmDK+vScCeSU9xeanNc8=;
        b=ZlAMIWQvcNRF5oB5p2KFoxXtjroRWGI4xfve/37L+F063goIFXsakhExgGCPFK31Yt
         qP9zH75Js9XsyQeNbA5y6XoL5SqQWl+JAY5v5sydUbB0dcRMyNXZs18oQu9+xI8t0FzN
         sp2+gEbdh+xV0S/LZvDyXBACx/czBUm0Zvc+S4x9qK1/6ZF5V4ZrXzesGOBsbatXH64D
         lpWBYBhU6bhs5pI46OKLXSi0CWVm1Jn6nCgreAVYcsyafsIzWe8YgT1XMDAeVXiPxyso
         k7dJNnoVacpnJVUl2bcLZWR/fAiGjNfCnC5VERXGROrZh5Sr3Vta7lN1f1uhaMB2YIm2
         TDow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mLZblWMyil7t1ZX+pjvViUNPmDK+vScCeSU9xeanNc8=;
        b=GGr2WvixtKr0iakcP7tx3bt+kOM1m9rgZIjfPxeHuiOu8r3a6kwLu53yvO2SvCWyDQ
         OdiWUxNdcvPYaj6aVfZns/yuE13s8n6550BktbWIEEvgLrq8AEshP4xVb0wLa2mjwD7a
         1XmnYZLr3ZoG+9EFBSmTE/OVvIUMZK/1XROYvd2oDQFuxBRykYDXHXuPhyOZlN09AOCD
         Uymoi69/o/BstuchwezFduBpL4VEfhHLBZ5pd1Hnt+xDz+qgJ8mPMuTk1V6LeJfoHGmt
         wKTopKs1iAKz6r/0jVuKuPoZw4P1JepS9LhrmP1hrhIaEbUNl+wI5DqtmJkMNb2ixfNb
         i26A==
X-Gm-Message-State: AOAM531H3KUxlT2+q17pFC3FR96bFJnSAMNaXwmTz5shshPcLSpk8xiF
	6NXS6tb/+gSdxca4IjOCgj8=
X-Google-Smtp-Source: ABdhPJxC9qWY1b48PBnzxoAvVl4Xsv1SZLdQua9JI16v9sVSthsndtg/A+FV1gmZoihbvGwX5yyR7w==
X-Received: by 2002:a17:907:1606:b0:6df:f528:4033 with SMTP id hb6-20020a170907160600b006dff5284033mr3101153ejc.433.1648891417628;
        Sat, 02 Apr 2022 02:23:37 -0700 (PDT)
Received: from localhost.localdomain (ip5f5abb55.dynamic.kabel-deutschland.de. [95.90.187.85])
        by smtp.gmail.com with ESMTPSA id jv19-20020a170907769300b006e095c047d6sm1897679ejc.109.2022.04.02.02.23.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Apr 2022 02:23:37 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 0/7] staging: r8188eu: more SetHwReg8188EU() cleanups
Date: Sat,  2 Apr 2022 11:23:25 +0200
Message-Id: <20220402092332.6627-1-straube.linux@gmail.com>
X-Mailer: git-send-email 2.35.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is the next round of cleanups for the SetHwReg8188EU() function.
The goal is to remove the function completely someday since it is
just an unwanted layer of abstraction.

Tested on x86_64 with Inter-Tech DMG-02.

Michael Straube (7):
  staging: r8188eu: remove HW_VAR_BSSID from SetHwReg8188EU()
  staging: r8188eu: remove HW_VAR_ACK_PREAMBLE from SetHwReg8188EU()
  staging: r8188eu: remove HW_VAR_AMPDU_MIN_SPACE from SetHwReg8188EU()
  staging: r8188eu: remove HW_VAR_ANTENNA_DIVERSITY_SELECT from
    SetHwReg8188EU()
  staging: r8188eu: remove HW_VAR_RPT_TIMER_SETTING from
    SetHwReg8188EU()
  staging: r8188eu: remove HW_VAR_H2C_FW_JOINBSSRPT from
    SetHwReg8188EU()
  staging: r8188eu: remove HW_VAR_H2C_FW_P2P_PS_OFFLOAD from
    SetHwReg8188EU()

 drivers/staging/r8188eu/core/rtw_cmd.c       | 17 +++-
 drivers/staging/r8188eu/core/rtw_mlme_ext.c  | 18 +++--
 drivers/staging/r8188eu/core/rtw_p2p.c       |  6 +-
 drivers/staging/r8188eu/core/rtw_wlan_util.c | 51 ++++++++++--
 drivers/staging/r8188eu/hal/usb_halinit.c    | 85 --------------------
 drivers/staging/r8188eu/include/hal_intf.h   |  7 --
 6 files changed, 74 insertions(+), 110 deletions(-)

-- 
2.35.1

