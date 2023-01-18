Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E96AE53A7
	for <linux-staging@lists.linux.dev>; Wed, 18 Jan 2023 19:58:36 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id d2so14967862wrp.8
        for <linux-staging@lists.linux.dev>; Wed, 18 Jan 2023 11:58:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/9i/P6wayINNICAhvV/JZZb5FqUILI5LAs0XOioF63Q=;
        b=IOTThF0itOEtNzl4ahK8ePzeU8XRm2NHECau68KYsrRMwjaNFqHjRCJFwBt4/ME+EM
         XFbzS7PoCYe8YGXlbsaTeZCsU/HczFOPP7udGomhwRsUjxAOr/qyxidtWu68Wi+MS/jV
         6zmKIZ2RBw87xeroabirvR1Yfx2oe6osYw0XEufKEcVdZuQdBvz2BhRmTyN2t2D94pQd
         vyjUCV/Zs4DlVmPYxaaObPHB0VQpmRABKEMo9jK8mFKigRciORIUWaQQIHc+aoRRAJb5
         SgMxUhZ8Gfz6ypkwhYbj1t4dwvHf+mJ7shbKRX2bsOF2PKhbujg3msKrxY5bv/NmOVbl
         7kbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/9i/P6wayINNICAhvV/JZZb5FqUILI5LAs0XOioF63Q=;
        b=6WoQUwadwKLuthVB37O77Q0cSeOaB4Vh1/IUOGO1NRzYBnEfyFndECuZzPJ7zhcHsp
         iGZcpMSeVpNe5+RnH7Auj3ECs9XYQCr8H8QjhY2DM8dobazVrwXy/SB/YuNY/wFPWiMH
         xkDkbSFX+G5mkDcXnwkmbzwbPvWMZUYqaGInOvZuBs6xF8WV1rE0yPxkQoEZJN+uafyg
         ksigrapAqRq1LV30eg6zDQFctEHNNhOEPPojrFdcXNlJn0HXTug6t48ld5KT4tFq29Gh
         cgJuXoV/8i9ncDiKuUbHZWbFZV+dOeNcX59OS9aJI8hXzXelK2yrCvSV+r4o9zAGB3M/
         NNaA==
X-Gm-Message-State: AFqh2kryMLvr+pbB5eFIkDPLd+gulCLnUu3jXxT91puKTfhz37ZoHmXt
	8h+rhkuIdnG4zGih7+34esA=
X-Google-Smtp-Source: AMrXdXsyS56wvGROlXOHm7rmw3KF+Avru9KBY2gi55xLLmxZ8vqsDIVAVXZQD/k5KzoXbooS/K8N4Q==
X-Received: by 2002:a05:6000:a0b:b0:2bd:c6ce:7bf8 with SMTP id co11-20020a0560000a0b00b002bdc6ce7bf8mr1557471wrb.5.1674071915131;
        Wed, 18 Jan 2023 11:58:35 -0800 (PST)
Received: from matrix-ESPRIMO-P710 (p57935ca5.dip0.t-ipconnect.de. [87.147.92.165])
        by smtp.gmail.com with ESMTPSA id b11-20020a05600018ab00b002be2279f100sm6006229wri.96.2023.01.18.11.58.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jan 2023 11:58:34 -0800 (PST)
Date: Wed, 18 Jan 2023 20:58:32 +0100
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 0/9] staging: rtl8192e: Rename or remove CamelCase variables
 from r8192_priv
Message-ID: <cover.1674071236.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Rename or remove variables to avoid CamelCase which is not accepted by
checkpatch.

Tested with rtl8192e
Transferred this patch over wlan connection of rtl8192e

Philipp Hortmann (9):
  staging: rtl8192e: Rename LongRetryL.., ShortRetryL.. and
    ReceiveConfig
  staging: rtl8192e: Rename LastRxDescTSF, LoopbackMode and pFirmware
  staging: rtl8192e: Rename PHYRegDef, CurrentChannelBW and CustomerID
  staging: rtl8192e: Remove unused variable SifsTime
  staging: rtl8192e: Remove unused variable framesyncC34
  staging: rtl8192e: Remove unused variable PwrDomainProtect
  staging: rtl8192e: Remove unused variable H2CTxCmdSeq
  staging: rtl8192e: Remove unused variable RF_C_TxPwDiff
  staging: rtl8192e: Remove unused variable DM_Type

 .../rtl8192e/rtl8192e/r8190P_rtl8256.c        |   4 +-
 .../staging/rtl8192e/rtl8192e/r8192E_dev.c    |  70 ++++---
 .../rtl8192e/rtl8192e/r8192E_firmware.c       |   4 +-
 .../staging/rtl8192e/rtl8192e/r8192E_phy.c    | 192 +++++++++---------
 drivers/staging/rtl8192e/rtl8192e/rtl_core.c  |  12 +-
 drivers/staging/rtl8192e/rtl8192e/rtl_core.h  |  26 +--
 drivers/staging/rtl8192e/rtl8192e/rtl_dm.c    |  38 ++--
 drivers/staging/rtl8192e/rtl8192e/rtl_dm.h    |   2 -
 8 files changed, 165 insertions(+), 183 deletions(-)

-- 
2.39.0

