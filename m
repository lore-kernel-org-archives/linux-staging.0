Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA49779C5
	for <linux-staging@lists.linux.dev>; Thu, 29 Dec 2022 16:25:34 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id u9so46216034ejo.0
        for <linux-staging@lists.linux.dev>; Thu, 29 Dec 2022 08:25:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9PoCL0xlGBCqJ9wbeAI7D5ytAkpqEbAMxiagz0hFqcA=;
        b=Rj7VveSd+eEjPteO/mcjJqlcMjyYq2rpoyEYFhjYWmpGFoMOw3krYN41SepGMT2RJ6
         i0p8yp9tln8b0zdoD8plG/eRaD/VM0I4vtcpId89ozGC3Dn7KRQXDmOuVv6zRkw+LDWE
         PqMj83NI/gmPLBGS0Vki/MitUMGIbvhNJdCQqKDywikLa3RCSIIyMO9hgfPmIu4ArTov
         yXafpt6F2egKk1R2+TfEl/idWJehoVkzF8v6RXMTS/H7dUeCWfR1rHRWzxZP/ehtKSPF
         BdiFrm1ul3L2rOZ5528MH2NvQ98j8kF6cVEhNk/N7e96zAa4khCtwfQY3KClEG7LohsQ
         0zKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9PoCL0xlGBCqJ9wbeAI7D5ytAkpqEbAMxiagz0hFqcA=;
        b=RTWtUk+alwZ5lxS5Fq5YjQjg9MAlBsaM7gj1fHL1eoJJu9VMD4YRgsiREVzhtw6e5B
         izOYZ0tFmP6AFohkaZAWrGIkteA/ADmrlSriO0vmqgL9CqOomFNyGYAb4mbHbAeUv9Fj
         xHhSIRMhxGzgeGe3TV2HLpzVhWgj2sLnzeTuHTYuDcA+7L2culi8QgZkIl4Yq22qWB0w
         9z2nVoMlf9eiOlncj8MHFwB6rjKPvAOTWz9wwxgmyZhU4ISHz5PH7/Mg4djTYdHvmtHl
         D0NsvOvFlhpS1DTVSsXeJi2tms2sQTfzaU0kS84ig4geGUOcvG6SaXP3kNMcisw59IF8
         XLxA==
X-Gm-Message-State: AFqh2krm0BHraLTlesJiYksIajIwLrCAF40TBwQbF72GLejrUpRu/qhl
	gTULG/K8bt0G/ycyxvrX1t6saatUIdc=
X-Google-Smtp-Source: AMrXdXuxYXVZQnKkUGs0BuIFiexSiqju4BEwueACbXfb5H47PRFgp4em1oIuCDGNlmx5XQ5Ouqn2Vw==
X-Received: by 2002:a17:907:8a20:b0:7c1:27c:2530 with SMTP id sc32-20020a1709078a2000b007c1027c2530mr7179266ejc.3.1672331133050;
        Thu, 29 Dec 2022 08:25:33 -0800 (PST)
Received: from matrix-ESPRIMO-P710 (p54a07888.dip0.t-ipconnect.de. [84.160.120.136])
        by smtp.gmail.com with ESMTPSA id o11-20020a170906768b00b0077b523d309asm8689342ejm.185.2022.12.29.08.25.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Dec 2022 08:25:32 -0800 (PST)
Date: Thu, 29 Dec 2022 17:25:29 +0100
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 0/7] staging: rtl8192e: Rename variables from r8192_priv
 start with ChannelPlan
Message-ID: <cover.1672330343.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Rename variables to avoid CamelCase which is not accepted by checkpatch.

Philipp Hortmann (7):
  staging: rtl8192e: Rename ChannelPlan, eeprom_ChannelPlan and CckPwEnl
  staging: rtl8192e: Rename TSSI_13dBm, Pwr_Track and NumTotalRFPath
  staging: rtl8192e: Rename CCKPresentAtt...
  staging: rtl8192e: Rename TxPowerLevelCCK...
  staging: rtl8192e: Rename TxPowerLevelOFDM24G...
  staging: rtl8192e: Rename MCSTxPowerL.., LegacyHTTxPowe.. and
    AntennaTx..
  staging: rtl8192e: Rename SetRFPowerSta.., RfReg0Value and
    bTXPowerDa..

 .../rtl8192e/rtl8192e/r8190P_rtl8256.c        |  14 +--
 .../staging/rtl8192e/rtl8192e/r8192E_dev.c    |  78 +++++++-------
 .../staging/rtl8192e/rtl8192e/r8192E_phy.c    | 100 +++++++++---------
 drivers/staging/rtl8192e/rtl8192e/rtl_core.c  |  10 +-
 drivers/staging/rtl8192e/rtl8192e/rtl_core.h  |  42 ++++----
 drivers/staging/rtl8192e/rtl8192e/rtl_dm.c    |  30 +++---
 6 files changed, 137 insertions(+), 137 deletions(-)

-- 
2.39.0

