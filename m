Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CC2828EA
	for <linux-staging@lists.linux.dev>; Sun,  2 Apr 2023 09:51:41 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id t10so106121571edd.12
        for <linux-staging@lists.linux.dev>; Sun, 02 Apr 2023 02:51:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680429099; x=1683021099;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2IDvEqK40hdfeaC/5vcKlzJ8ldccO8ZyOrtbI8/UQso=;
        b=bYGfDEJghpcBi7i4yza2Phq8tCEBxOpVWp2cGMeFpQgVy9Jw8azJbFwW/GVLDkVeiM
         borWGvtXbfTdFgmyENPaFICjo/Bx76xoh+Xx4nkNm8QvzsI8Bho0S2ARYp8h3XnHdpiV
         67OplqowEnZh2w+UvJPZEVBta2ARLiMU1aS/Z3QeB7Y/N72b55D8qrgLHPrIVHh6WjVp
         pGwWw9m0jxFXus57lfO5QNUm5pBaWFdx3p+7zz/0DbFuuE6Ru5TRxSYQO0ptGTs8cZFG
         bRjwXRPtdFmFrCMje8GYPiuMcrhukdmQdh20OdKovDvIApqD3zuzT20i1pwRVgR7fMxY
         91LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680429099; x=1683021099;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2IDvEqK40hdfeaC/5vcKlzJ8ldccO8ZyOrtbI8/UQso=;
        b=gTI8GJkaVMKEoRxI0lJA0LgBH624MZ4nP6SnIxrzYaPZU1LCrEG1bFD6o8y7etsnYV
         C53fL0fb5wpy4YuEzto43dRyCDLQDEY0wLOCa9qQWL0jrvQI/3d/wj1yD2Xu6aeeQ6PP
         kkLw6GdQpzy8q+gZ+PI3qP69WXj/2GBKVrN+E1W6eeaKmvDir03t74C3f0kIjJNubAbu
         bnM3Yt7a5MBCql/ZJZeWqgEd8oMsAvS+9ZrPQsi709U2Y/ETVoSw/kC8pZ1yOebcasVS
         TpWrfzthzoMCms7UqHnhpSUVClEfZ6Qm/bGS772JM6MzYUVguwLuIJjufLF3mXDKoA10
         rEFw==
X-Gm-Message-State: AAQBX9fEjrRTFhD6GDDVZ2Zuulr1yjCACp55aaqIXkTgxmpIv/dBGiv0
	8cMPpnjB+lgWQPOM+EtH9EI=
X-Google-Smtp-Source: AKy350a9MsvkMpzvVI6Nn+Qh5M6t4iuNAkNmgQeVoknnM++Kmh0S2kpecy3A7VgcwD/0rh5GAM24dQ==
X-Received: by 2002:a05:6402:2803:b0:502:e50:3358 with SMTP id h3-20020a056402280300b005020e503358mr12854788ede.3.1680429099044;
        Sun, 02 Apr 2023 02:51:39 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p57935146.dip0.t-ipconnect.de. [87.147.81.70])
        by smtp.gmail.com with ESMTPSA id e27-20020a50d4db000000b004fadc041e13sm3085852edj.42.2023.04.02.02.51.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Apr 2023 02:51:38 -0700 (PDT)
Date: Sun, 2 Apr 2023 11:51:36 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/6] staging: rtl8192e: Remove enum RF_1T2R and useless
 cases for customer_id
Message-ID: <cover.1680427945.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Remove enum RF_1T2R as the code using it has always the same result.
Remove useless cases for customer_id.

Tested with rtl8192e
Transferred this patch over wlan connection of rtl8192e
---
V1->V2: Added first patch to avoid a useage of an uninitialized
        variable RF_Type introduced by later patches.

Philipp Hortmann (6):
  staging: rtl8192e: Remove RF_Type from
    .._dm_tx_update_tssi_weak_signal
  staging: rtl8192e: Remove enum RF_1T2R and RF_Type
  staging: rtl8192e: Remove local variable Value and powerlevelOFDM24G
  staging: rtl8192e: Remove case customer_id = RT_CID_DLINK
  staging: rtl8192e: Remove case customer_id = RT_CID_819x_CAMEO, ..
  staging: rtl8192e: Remove case customer_id = RT_CID_DEFAULT, ..

 .../staging/rtl8192e/rtl8192e/r8192E_dev.c    | 26 -------------------
 drivers/staging/rtl8192e/rtl8192e/r8192E_hw.h |  7 -----
 drivers/staging/rtl8192e/rtl8192e/rtl_core.h  |  5 ----
 drivers/staging/rtl8192e/rtl8192e/rtl_dm.c    | 21 +++++----------
 drivers/staging/rtl8192e/rtllib.h             |  4 ---
 5 files changed, 6 insertions(+), 57 deletions(-)

-- 
2.40.0

