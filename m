Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 720FD368
	for <linux-staging@lists.linux.dev>; Sun, 20 Aug 2023 00:45:18 +0000 (UTC)
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-56546b45f30so1634288a12.3
        for <linux-staging@lists.linux.dev>; Sat, 19 Aug 2023 17:45:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1692492317; x=1693097117;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cy9tL7xMtgr5rVitcjMBMNisMnaBX+7pR4GgJ1PYIOU=;
        b=Cw0uIKb0MNYLcqso+FPfo2hQhFNylDxC3nsnf/sjaDv0emXWNXHf0jsY3BAoFYg6lR
         IS1+ng2LYUa+9h8gcCR/cm5TEu+DKSkZhw0PenUcwei2EXOzm7f6RuuA2vaNxTlgvDq4
         tmTyaq7iwIMxryZILjMri62sNAJ5XfVNcxm4HoqiRCIAIY62bGTr55M2gza/8+5Zo54t
         1Tu4HCsH4S6ODwpYiy3AYIjAuu+iRxS3J6yB0Ob1v6qm9lK38hMulF1jppfyjFP1Y2jX
         U3XIwUWypoDp85t7nn5rLvw3qXwzcPMHmrVs0r2iuXR43iYsJBTLTb0eKqzg5uxKJSHs
         zxaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692492317; x=1693097117;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cy9tL7xMtgr5rVitcjMBMNisMnaBX+7pR4GgJ1PYIOU=;
        b=Av3pbC59eaIfDqKNF5CF3fBDFC96SgtZgFiugI2LzAJtJdO4iHXlySjCQ/cgrHPJw0
         njVwbQ5CKrJKSVZXLawWul6GURtWE3meLGlP1T8M2yGKDI7uGlW2kiWi/4ZdF7XBFQIh
         BgS1U1jRzOSeJQZqieE7PqBWHtph6LuQx/+kATK/vzwIsgwgriNMOAGJXYXHQwvJK+PT
         14KieLCQikxvqpQae31HktJeMDsfdAGapKASMdKp9Mu8FR6X8TFfbd7oVtdvuw3SQqQC
         ptXws4eRrOrS9cGnkuMOh9DGLBJ66T548Sl2kyvcTLLDmFlCS6GSm98+JaQ30jAxn+kr
         dUMg==
X-Gm-Message-State: AOJu0YxgPfwtP6TSrR1TxwlNoL1w/RhW71ZSpYI2H0MTHc3kcu8FyuYn
	6JebI3FDnoosxiOljeQrRNIm8w==
X-Google-Smtp-Source: AGHT+IEZw2DwUAps9XfkD4SvOzR2dtbsZ9J8FQkJyKuTjIrU3EP6W4uMuQ0djIi9dcREfcW1Hqy7Tw==
X-Received: by 2002:a17:90a:744b:b0:26d:227c:9068 with SMTP id o11-20020a17090a744b00b0026d227c9068mr2765065pjk.16.1692492317571;
        Sat, 19 Aug 2023 17:45:17 -0700 (PDT)
Received: from basil.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id 25-20020a17090a1a1900b00268b439a0cbsm4004884pjk.23.2023.08.19.17.45.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Aug 2023 17:45:17 -0700 (PDT)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 00/16] Staging: rtl8192e: Rename struct rx_ts_record references
Date: Sat, 19 Aug 2023 17:47:28 -0700
Message-ID: <20230820004744.278022-1-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.41.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The goal of this series is to fix checkpatch warning Avoid CamelCase,
for all references of struct rx_ts_record. In most cases renames the
references to, ts, to make the naming consistent.

The first 8 patches have been sent before, and versioned appropriately.

Thank you in advance to the reviewers,
~ Tree

Tree Davies (16):
  Staging: rtl8192e: Rename variable pRxTs in function rx_ts_delete_ba()
  Staging: rtl8192e: Rename variable pTS in function
    rtllib_rx_ADDBAReq()
  Staging: rtl8192e: Rename variable pRxTs in function rtllib_rx_DELBA()
  Staging: rtl8192e: Rename variable pRxTs in function
    rtllib_ts_init_del_ba()
  Staging: rtl8192e: Rename variable pRxTs in function
    rtllib_rx_ba_inact_timeout()
  Staging: rtl8192e: Rename variable pRxTs in function
    RxPktPendingTimeout()
  Staging: rtl8192e: Rename variable pTS in function ResetRxTsEntry()
  Staging: rtl8192e: Rename variable pRxTS in function TSInitialize()
  Staging: rtl8192e: Rename variable tmp in function GetTs()
  Staging: rtl8192e: Rename variable pRxTS in function RemoveTsEntry()
  Staging: rtl8192e: Rename variable pTS in function prototype
    rtllib_FlushRxTsPendingPkts()
  Staging: rtl8192e: Rename variable pTS in function AddReorderEntry()
  Staging: rtl8192e: Rename variable pTS in function
    rtllib_FlushRxTsPendingPkts()
  Staging: rtl8192e: Rename variable pTS in function
    RxReorderIndicatePacket()
  Staging: rtl8192e: Rename variable pRxTS in function
    rtllib_rx_check_duplicate()
  Staging: rtl8192e: Rename variable pTS in function
    rtllib_rx_InfraAdhoc()

 drivers/staging/rtl8192e/rtl819x_BAProc.c | 36 ++++-----
 drivers/staging/rtl8192e/rtl819x_TSProc.c | 73 +++++++++---------
 drivers/staging/rtl8192e/rtllib.h         |  2 +-
 drivers/staging/rtl8192e/rtllib_rx.c      | 94 +++++++++++------------
 4 files changed, 102 insertions(+), 103 deletions(-)

-- 
2.41.0

