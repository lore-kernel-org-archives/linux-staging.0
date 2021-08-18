Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CF976D17
	for <linux-staging@lists.linux.dev>; Wed, 18 Aug 2021 23:42:56 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id w21-20020a7bc1150000b02902e69ba66ce6so2891818wmi.1
        for <linux-staging@lists.linux.dev>; Wed, 18 Aug 2021 16:42:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=AeNW5DL4/3VbSlgVXKYBeMDXXKxQSxKIYvKsB82ru7I=;
        b=N8zNZEkhwZR8dq8CbaOVy2PGnejQZWfiehnBvT+o2+VaOeITtXV3hTTwW7fjm36CAP
         VI/iayXUI2gHwTca4QNAFw+gdwZNZVHrgS3bh1eFz2M3SMFyBrH1Ju1BoQkrsmw1iW42
         yd/+lwMeF9gZlO3UacU+1iaWL6gBT4lhoKZT7kLloAbuTQUNtLaOG2jXHbfyomtk4gbL
         sRBqRXsE1NLv0A1tnXcZytdVmzraGBiv+fzBvhD2yGICt1cuTzDII4iPgFYKPaO1khsN
         JogHSACTOZlR8pv2H6ndrpBGWfAJoviBCbqPgDTz19UGzi0l7SBjd9w+7yC60rYMeFi3
         AwSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=AeNW5DL4/3VbSlgVXKYBeMDXXKxQSxKIYvKsB82ru7I=;
        b=LYsefj2AwaRLVnOsQd/5LiSA0a95/E+xQS3JfE3yjMTLwxv+sx8C2e3xtwYohtDBYs
         f+UH6V0t8i6jMPiukUwrzHWFvn4z7H7MjfdTKtajroSrYCTIVlmULNBdspLgMdkIVtfR
         nWQOpK4PxN8aM4JeCMbB1rU2lZ3IBZYu7PbK0nk3bM2DOq9/TI/7wlxB8bxoMeypaUyR
         j+QziUFyoHS2ahL4oLxDAYLB1AMG3KUJ5KDcpfn82I/nKe0UNRJOuMiwMqbB5idm/frp
         qCI8SZ0S1W9x+M6Lbnr9B6r8DuvW6fHsUgyukhDAEJgC1/32RZa+EokO7lw5auBcf9EV
         oEew==
X-Gm-Message-State: AOAM5300RjjH+HDSPkn9hDyyg4UiEFG5xXbfOu98Puhmr+cCEwHPak5g
	w1bMEgovryiKUzR1k2dL2NAoyw==
X-Google-Smtp-Source: ABdhPJznmV2FO3EfZOhEB6HIY/INZZuAsl/nxk8pr2DChtIFysgnaqSPxtJaQNlb/hwkzzeVu0UkkA==
X-Received: by 2002:a1c:7506:: with SMTP id o6mr11217330wmc.112.1629330174665;
        Wed, 18 Aug 2021 16:42:54 -0700 (PDT)
Received: from localhost.localdomain (3.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.6.1.f.d.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:df16::3])
        by smtp.gmail.com with ESMTPSA id z8sm1194926wrt.77.2021.08.18.16.42.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Aug 2021 16:42:54 -0700 (PDT)
From: Phillip Potter <phil@philpotter.co.uk>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	martin@kaiser.cx,
	straube.linux@gmail.com,
	Larry.Finger@lwfinger.net
Subject: [PATCH 0/6] staging: r8188eu: HAL related cleanups
Date: Thu, 19 Aug 2021 00:42:47 +0100
Message-Id: <20210818234253.208271-1-phil@philpotter.co.uk>
X-Mailer: git-send-email 2.31.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series provides cleanups related to the driver's HAL layer, by
removing certain code which is no longer necessary.

Phillip Potter (6):
  staging: r8188eu: remove _dbg_dump_tx_info function
  staging: r8188eu: remove unused function dump_txrpt_ccx_88e
  staging: r8188eu: remove txrpt_ccx_sw_88e and txrpt_ccx_qtime_88e
    macros
  staging: r8188eu: remove empty function rtl8188eu_free_xmit_priv
  staging: r8188eu: remove function rtw_hal_free_xmit_priv
  staging: r8188eu: remove free_xmit_priv field from struct hal_ops

 drivers/staging/r8188eu/core/rtw_xmit.c       |  2 -
 drivers/staging/r8188eu/hal/hal_intf.c        |  6 ---
 drivers/staging/r8188eu/hal/rtl8188e_xmit.c   | 53 -------------------
 drivers/staging/r8188eu/hal/rtl8188eu_xmit.c  |  5 --
 drivers/staging/r8188eu/hal/usb_halinit.c     |  1 -
 drivers/staging/r8188eu/include/hal_intf.h    |  2 -
 .../staging/r8188eu/include/rtl8188e_xmit.h   |  9 ----
 7 files changed, 78 deletions(-)

-- 
2.31.1

