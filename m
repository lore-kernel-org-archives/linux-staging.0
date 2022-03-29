Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88055258C
	for <linux-staging@lists.linux.dev>; Tue, 29 Mar 2022 20:21:50 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id j15so37382628eje.9
        for <linux-staging@lists.linux.dev>; Tue, 29 Mar 2022 13:21:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aGUeIhIlqrmJCyD9+oOrQ5s+iflJJ+7myFcwnSduBIw=;
        b=WyRgy3/lZ7Tbr5Of7/54vktujTA+sfTmiUJeTZJW4Uyts1els4oPKF959+mUVN7kQF
         /lEOzK/TsuSN7zc50KyiogIqbH5ACGh6cpYwJLR11F2J2c0qo2XHn3e0VQohVbhPjcBL
         wFa5LaIOP7wZt82CF9GbcT06Boch12lgoHrebNdzcvszdcYbPbEQD3JPTolo160wa9iW
         s9Ju+bEA4UjEAW75PRyFuqroodrZ/XBuihyYXiZeLcr+n9ZZ4MugN0xQdpZ1yjZt6C3K
         iw6C0jzhxbvOp9HXz85Ylf7qxCLC+IzkmUQSIKgZHSpiRPRrpFC31yFtaNYronzjGvl5
         nXsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aGUeIhIlqrmJCyD9+oOrQ5s+iflJJ+7myFcwnSduBIw=;
        b=B6qFGLEKBd5ofesTPgVTIYSyzC6h0SFo6+6z4eTAwcicaXcDgx6PQ0AbZw/cKrnB9g
         cRqEH9wt40rfFvNeQsy57xsyEilZxBXTC55jcepGS5IHI9eJ/TBANjBTxnbZ1h7pB/xK
         4m0zFh4I5l2DSfd8yBDQXOxsiX2WfAW+b+18apcE8+BFmASeAcBPy4e7412345dnBRNY
         staxxbT0jWbwkCehMpGc3ZuzFoOyL4Ecq7cW1lFqKzkL6+Nv0/BUDLpGhYgYVRRLAnZT
         4GFMZIVciCqi6+WnuLIyQ/Yo7Tb6Vo/2oOiLLyEC+5iAuT0J+vztoD7nnvbJGNPLV8xc
         Li7w==
X-Gm-Message-State: AOAM532nGUPJisRhm2LryReswue6qZZLRkitWRo33Zr9gpEWGGT/7hnZ
	/kVz0r0n8+9PLT4W/E5jBwY=
X-Google-Smtp-Source: ABdhPJz8hHXvUVF6ar0Kwk8uUKvrtkO9Fjp9PKjI1G7G9bP1nLt1iFX5qjdllXRPV71/khuszy3eFQ==
X-Received: by 2002:a17:907:6ea4:b0:6e1:260e:a232 with SMTP id sh36-20020a1709076ea400b006e1260ea232mr10819255ejc.15.1648585308803;
        Tue, 29 Mar 2022 13:21:48 -0700 (PDT)
Received: from localhost.localdomain (ip5f5abb55.dynamic.kabel-deutschland.de. [95.90.187.85])
        by smtp.gmail.com with ESMTPSA id ss12-20020a170907038c00b006e0ec9e806dsm3938111ejb.136.2022.03.29.13.21.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Mar 2022 13:21:48 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH v2 0/8] staging: r8188eu: SetHwReg8188EU() cleanups
Date: Tue, 29 Mar 2022 22:21:33 +0200
Message-Id: <20220329202141.7028-1-straube.linux@gmail.com>
X-Mailer: git-send-email 2.35.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series removes some cases from the function SetHwReg8188EU()
and moves the functionality to the callers. This is part of the
ongoing effort to get rid of the unwanted hal layer.

Tested on x86_64 with Inter-Tech DMG-02.

v2:
Moved some code into functions.
The series is based on todays staging-testing.

Michael Straube (8):
  staging: r8188eu: remove HW_VAR_RESP_SIFS from SetHwReg8188EU()
  staging: r8188eu: remove HW_VAR_MLME_DISCONNECT from SetHwReg8188EU()
  staging: r8188eu: rename some macros to upper case
  staging: r8188eu: remove HW_VAR_ACM_CTRL from SetHwReg8188EU()
  staging: r8188eu: remove HW_VAR_RXDMA_AGG_PG_TH from SetHwReg8188EU()
  staging: r8188eu: simplify if-else statement
  staging: r8188eu: remove HW_VAR_TX_RPT_MAX_MACID from SetHwReg8188EU()
  staging: r8188eu: remove HW_VAR_BCN_VALID from SetHwReg8188EU()

 drivers/staging/r8188eu/core/rtw_mlme.c       | 36 ++++++-----
 drivers/staging/r8188eu/core/rtw_mlme_ext.c   | 31 +++++++--
 drivers/staging/r8188eu/core/rtw_wlan_util.c  | 38 +++++++++--
 drivers/staging/r8188eu/hal/rtl8188e_cmd.c    |  5 +-
 drivers/staging/r8188eu/hal/usb_halinit.c     | 63 -------------------
 drivers/staging/r8188eu/include/hal_intf.h    |  5 --
 .../staging/r8188eu/include/rtl8188e_spec.h   | 10 +--
 drivers/staging/r8188eu/include/rtw_mlme.h    |  1 +
 .../staging/r8188eu/include/rtw_mlme_ext.h    |  1 +
 9 files changed, 87 insertions(+), 103 deletions(-)

-- 
2.35.1

