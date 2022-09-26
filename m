Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48036441E
	for <linux-staging@lists.linux.dev>; Mon, 26 Sep 2022 17:32:51 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id y8so10010962edc.10
        for <linux-staging@lists.linux.dev>; Mon, 26 Sep 2022 10:32:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=czNq/wdzwKqMnN7AWANCg6E2ckeA0Bn9PlwJV/1m2J8=;
        b=CpoumwMF7v9NlYEo+5acV9Mv7ILoX/7xo3wlW7VFAi4YKf1V2wYukgx26Bu8WAGpDO
         aBMY/VdBnscCGV205g/t0tD1sXt+DLo/WD9PEcLjKsmhIdaoOOv79XMJdOkDLqBaMnty
         /dj5n9umncSUgSDNBLKKLah0xYmoKuy75H6bCmPL2s6m8XNpHRtsmo9m9vBuk9a29qmf
         g19cIeqfpdofmYI5hv+3gbNBwK4iD1i8aCHS0in+th+7gDm8uLetGQo+mkXxI1Szbm1z
         7XQvXCu3J3iLjYpyQDKtcBYdoHr3gNUbBGe4DR5llleI68OGKr8ejpAmwdmBvtoN8wDx
         o6Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=czNq/wdzwKqMnN7AWANCg6E2ckeA0Bn9PlwJV/1m2J8=;
        b=ID96oAwtD8vtunBLLJefB8LaIsCNRF6j2XQQ0qiElvBdnAr6I2SBKJe1VL6q22CmX1
         YzOKrdIzDhYTXIbd3wx187t07kLfMnrwyX1++k9NhDCXEetwvgtN0JmmZFGFRb+g06bO
         plVrXqB7eJtN7NXdpW23xWwiImVqVjwKzm0cNCoOFYm7s1YVe8NFypg6+j7pxql2WAI4
         tscuJ7HYFUG9Cl/PH3H6ihD3YPrUs4ePbxmQC37Ly6zUSV3yPMjLbzJmxTwJ8aamAgs6
         eGbVVYKMEcKzIJ8V+2SQEXOri/FYN2akAw10Ecx+arC8RwgvGVLSxIKnwHnXYtnMeuzI
         fTrg==
X-Gm-Message-State: ACrzQf24so3PqfsSAHlqKb9g4wGzxGCPuAeaKg7hRiHyXLeWSMvxKSEr
	6V951kTMEMQN4uq5ga7K8s4=
X-Google-Smtp-Source: AMsMyM42ylEsTk3jaOh/XaMiGsMugt2TS1DFTNtUpMqmgjgktaic2g4oWINFx6ZfvU1/6cS3cuKqDg==
X-Received: by 2002:aa7:c78d:0:b0:454:fe1d:8eb1 with SMTP id n13-20020aa7c78d000000b00454fe1d8eb1mr23485082eds.59.1664213569566;
        Mon, 26 Sep 2022 10:32:49 -0700 (PDT)
Received: from localhost.localdomain (ip5f5abb59.dynamic.kabel-deutschland.de. [95.90.187.89])
        by smtp.gmail.com with ESMTPSA id y4-20020a1709060a8400b00782667df018sm6554617ejf.54.2022.09.26.10.32.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Sep 2022 10:32:49 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 0/3] staging: r8188eu: remove odm_RegConfig8188E.c
Date: Mon, 26 Sep 2022 19:32:40 +0200
Message-Id: <20220926173243.8767-1-straube.linux@gmail.com>
X-Mailer: git-send-email 2.37.3
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series removes hal/odm_RegConfig8188E.c and its header
odm_RegConfig8188E.h by making the functions defined in that file
static.

Tested on x86_64 with Inter-Tech DMG-02.

Michael Straube (3):
  staging: r8188eu: make odm_ConfigMAC_8188E() static
  staging: r8188eu: make odm_ConfigRF_RadioA_8188E() static
  staging: r8188eu: remove hal/odm_RegConfig8188E.c

 drivers/staging/r8188eu/Makefile              |  1 -
 .../staging/r8188eu/hal/HalHWImg8188E_BB.c    | 50 +++++++++++
 .../staging/r8188eu/hal/HalHWImg8188E_MAC.c   |  5 ++
 .../staging/r8188eu/hal/HalHWImg8188E_RF.c    | 30 +++++++
 .../staging/r8188eu/hal/odm_RegConfig8188E.c  | 89 -------------------
 .../r8188eu/include/odm_RegConfig8188E.h      | 21 -----
 .../staging/r8188eu/include/rtl8188e_hal.h    |  1 -
 7 files changed, 85 insertions(+), 112 deletions(-)
 delete mode 100644 drivers/staging/r8188eu/hal/odm_RegConfig8188E.c
 delete mode 100644 drivers/staging/r8188eu/include/odm_RegConfig8188E.h

-- 
2.37.3

