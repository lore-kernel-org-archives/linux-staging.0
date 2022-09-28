Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A03D23AF
	for <linux-staging@lists.linux.dev>; Wed, 28 Sep 2022 14:43:35 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id a41so17569409edf.4
        for <linux-staging@lists.linux.dev>; Wed, 28 Sep 2022 07:43:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=0lhK/WaZJzrDqynmGvujL92U6EgO6Nfy2zvJKi36w5Y=;
        b=fbayTju5FA5DQvGsDzzqxhRJteJ3rRkcj3W90jN14f4PhRDx5P/83VFH+L5ySVuJFD
         +286u0/Jfhpu24X0qVBFKRuefWL/qFBlEZhux//r86j0k0B21MOhrrv4onZTOnl1nig5
         jNXbeCRMGd7Gn7Ib/CA6u+ZkbV8CWY5WAK1k5bmBtINP8rMIDk0kdnaCaBpyT6yV9inK
         /r3e7hMh4eFOlvcHpwrRbJTrs9PM0+JB81I+irS38vQ9gHjvAAxdrGDVfFxXrCX0/fzy
         CKOWqDnTCc7QxE2L4ugierl0+R2vH7o858DZAYhIvJqK9uUypSsvAKj5MNn7VcPje/EB
         J+sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=0lhK/WaZJzrDqynmGvujL92U6EgO6Nfy2zvJKi36w5Y=;
        b=MPfo4B2plHiOiraSF6yaci+z134o2diHj26aif59gpiNvrtaQSn6+PwDAcRjn0R81K
         Sha+7qx/ROoE3xY7j5qkSD/5jEF3g4f0OV7CQeUoqlP4yFLrHYYu0Z+yMn0VGssmG59X
         ZoZvcsywKT/haQ22RXdIJIaIeCE8DfepuwrmvoTDB+ATIr9uIzhz6LM1c2ZnLvEKKiOU
         6/LS57OneARVtVDCZppfB8SVbmg5lyAwdVtIx6b7ojo16wCx1JkwsiMe2V8mlNzXpD5o
         Qso84dMDFl1Trkyt48GZ/70AYdonGKb8BE3nivHqgSPQvhhIJ7yE/tAZ68PGTkZiYphC
         5eIw==
X-Gm-Message-State: ACrzQf0gBR8zhkvI9FuNTyp5DsJ22uYIAtdVr8oPBeSd+poRNdawuUQh
	NfY/1PByajdTBT2cfkD9Luo=
X-Google-Smtp-Source: AMsMyM4viEe/fXeonKu7Ri1nrO1nR6wJAOKyOC+mHAy6lwNfECGEd4OgSWAtj6qg1UOpBzBmtJC9Gg==
X-Received: by 2002:a05:6402:ea0:b0:454:38bf:aa3d with SMTP id h32-20020a0564020ea000b0045438bfaa3dmr34263353eda.291.1664376213443;
        Wed, 28 Sep 2022 07:43:33 -0700 (PDT)
Received: from localhost.localdomain (ip5f5abb59.dynamic.kabel-deutschland.de. [95.90.187.89])
        by smtp.gmail.com with ESMTPSA id u9-20020a50eac9000000b00456c6b4b777sm3456973edp.69.2022.09.28.07.43.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Sep 2022 07:43:32 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 0/4] staging: r8188eu: remove enum HAL_STATUS
Date: Wed, 28 Sep 2022 16:43:19 +0200
Message-Id: <20220928144323.13164-1-straube.linux@gmail.com>
X-Mailer: git-send-email 2.37.3
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series converts four functions from return type 'enum HAL_STATUS'
to 'int' and finally removes enum HAL_STATUS.

Tested on x86_64 with Inter-Tech DMG-02.

Michael Straube (4):
  staging: r8188eu: convert ODM_ReadAndConfig_MAC_REG_8188E() to int
  staging: r8188eu: convert ODM_ReadAndConfig_RadioA_1T_8188E() to int
  staging: r8188eu: convert ODM_ReadAndConfig_PHY_REG_1T_8188E() to int
  staging: r8188eu: convert ODM_ReadAndConfig_AGC_TAB_1T_8188E() to int

 drivers/staging/r8188eu/hal/HalHWImg8188E_BB.c | 18 ++++++++----------
 .../staging/r8188eu/hal/HalHWImg8188E_MAC.c    |  9 ++++-----
 drivers/staging/r8188eu/hal/HalHWImg8188E_RF.c |  9 ++++-----
 drivers/staging/r8188eu/hal/rtl8188e_phycfg.c  |  6 +++---
 drivers/staging/r8188eu/hal/rtl8188e_rf6052.c  |  2 +-
 .../staging/r8188eu/include/HalHWImg8188E_BB.h |  4 ++--
 .../r8188eu/include/HalHWImg8188E_MAC.h        |  3 +--
 .../staging/r8188eu/include/HalHWImg8188E_RF.h |  2 +-
 drivers/staging/r8188eu/include/odm_types.h    |  5 -----
 9 files changed, 24 insertions(+), 34 deletions(-)

-- 
2.37.3

