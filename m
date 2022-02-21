Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AA8C7B
	for <linux-staging@lists.linux.dev>; Mon, 21 Feb 2022 07:33:16 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id p15so30763655ejc.7
        for <linux-staging@lists.linux.dev>; Sun, 20 Feb 2022 23:33:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nBWIzB83ChA6R4uLvAqJmKdkFkztNJhor8Vdyj0pogA=;
        b=ZI+Kz0SbhCsPzeMhpPmG8qaA5tpUtDXsMJyAj9DbKH/Z9O7UuarhQco+1QBVYE/bTi
         7JvzN7tBILLy+YcUFpJQX+SL4RtRnqH124fq48x+Da5+WH6Xgc1IiZY2Jm/G3P8+EQrc
         e8/YgEkbIyWPs9yDHP4sHeql18vlkiRFuFKxAPAED1FNlSxNzuvFff109yY0w/k/o+vf
         wlDDG/Jqz8st07SDeaz3We4gyO9y8pyGw4+2htiYh/1ySsEmhWvhjLnmxE6DY15udxTN
         6w/rNOUQbXQMdy4qmCXy7E0PGHuOm06lbr5DyA58kCTJvDuWmvNSu9M3JbocmoMSWPiF
         WhGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nBWIzB83ChA6R4uLvAqJmKdkFkztNJhor8Vdyj0pogA=;
        b=OPfpB6vZqoMKYqmAcyvVIE6DTKSmDmDpgzU2lOu67rHwKiMHO+nn8yDvH7GTpzvGc3
         EFlrE2XgPvild9PTgL1dP9W2cCJEOAMtrTKkj8TLCJQxs+iRQk8e/YbIwJyVdYsRpxDq
         3Jrkc6tTdTT8rMmgRbavCJBQaP+MlwX/VH3DHjcNXkNV+O8qQnhsy9KnsHG7uRsSC9dA
         1pdUP1isGXYS9+f2XRmqevqUsk5xJsqdzqmnadx/3OnB5JniHtgZIvfrqTG1bqE9qdut
         k2aQ4mJsVV0uvg58fNSz2ecxJalenL4n1K8uAzjk85gj7IlxiKIQDyM6yj0Wiv6zL5w1
         P0lw==
X-Gm-Message-State: AOAM533YQBVWe0hesD37N4zLIcHtO/WyiskahOnXTLggftTvrWo2gjAI
	kkjg1RyHZBWxYYgQ8g9UwG8=
X-Google-Smtp-Source: ABdhPJzy2+WzOcUV/3YBjZdYT9fVpStRUIC1brwW2M3PmY7gn+FOk2CLectYcD3rflRnUaDX5m+sXA==
X-Received: by 2002:a17:906:714c:b0:6cf:4850:52cc with SMTP id z12-20020a170906714c00b006cf485052ccmr14907208ejj.319.1645428795434;
        Sun, 20 Feb 2022 23:33:15 -0800 (PST)
Received: from localhost.localdomain (ip5f5abb8f.dynamic.kabel-deutschland.de. [95.90.187.143])
        by smtp.gmail.com with ESMTPSA id c11sm8673128edx.42.2022.02.20.23.33.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Feb 2022 23:33:15 -0800 (PST)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH v2 0/5] staging: r8188eu: odm cleanups
Date: Mon, 21 Feb 2022 08:33:01 +0100
Message-Id: <20220221073306.16636-1-straube.linux@gmail.com>
X-Mailer: git-send-email 2.35.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This set removes two more functions from the unwanted hal/odm layer.
Tested on x86_64 with Inter-Tech DMG-02.

v2:
Fixed a typo in the commit message of patch 2/5.
unsed -> used

Michael Straube (5):
  staging: r8188eu: remove ODM_CmnInfoHook()
  staging: r8188eu: convert two u8 variables to bool
  staging: r8188eu: remove enum odm_bw
  staging: r8188eu: convert type of pBandWidth in odm_dm_struct
  staging: r8188eu: remove ODM_CmnInfoUpdate()

 drivers/staging/r8188eu/hal/odm.c             | 56 +------------------
 drivers/staging/r8188eu/hal/rtl8188e_dm.c     | 19 ++++---
 drivers/staging/r8188eu/include/odm.h         | 29 +---------
 drivers/staging/r8188eu/include/rtw_mlme.h    |  2 +-
 drivers/staging/r8188eu/include/rtw_pwrctrl.h |  2 +-
 5 files changed, 16 insertions(+), 92 deletions(-)

-- 
2.35.1

