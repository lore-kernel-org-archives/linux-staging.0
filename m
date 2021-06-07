Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E484C2F80
	for <linux-staging@lists.linux.dev>; Mon,  7 Jun 2021 12:01:56 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id f2so17254370wri.11
        for <linux-staging@lists.linux.dev>; Mon, 07 Jun 2021 05:01:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fM9vtPrvB8TNHVvBU7M9JIppp/yWFyf/Jr3bFA9d7pg=;
        b=e0uvKeoeMJlVDnv+omT+aOHDOu0Z16uj4CKIgkGOn2VtQyKZTu75yl7FMEsnCR0fQA
         UrijpUIoFBiHp7Jq7OQU/RluHI41lYzIAnYdxu3cqSty+UeqTv8dur/eb1Rn0isl2BL3
         cQsovvzEbvj1N0XP1jbA4MPOaJ0k0PhbDOpswSO0smRz8NVYkGU/0zODy/lh7CO/bjX7
         KApkEIzvqWbtrF1QZ6xagCyoxBBgJPc0me9vIZzjungvWCbdVhQ1iWCstUhykP1buYf0
         qcob++9mq2P5KbXpTG9ZjUy8M7kcaH5/MC7O/6AEssUKCXjq2ytC8H/hNRsMMMhyMRVy
         LiuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fM9vtPrvB8TNHVvBU7M9JIppp/yWFyf/Jr3bFA9d7pg=;
        b=LpeEnJDoUwaO6tkYEzYMfgiqvCzS9TkPnwGr7TGC3o6Xxz9miyii5H59Kcmm1i4fAK
         cGvf1uyHKa110VXJTbTSYUID1b/SGaHveOfiFnzwB8mcdTi9uceKWv7ALccy4599cJYQ
         NYo/vThsUFZJJlRiA+CnROMW6jvnt2zYtvezHRevjT68Ckvrxg1KsGgpDRX4s45glZsV
         jPIJwgHekmzS7xN2JwfAhmS9vBSyP2T3jdam+Lp9uhCX6KoCAekXJJ5hydVPQcPCv0uH
         QdrZGDaK1epu7ZPGRPeG22apfBShq9LMZWJzd11fkFs4pNb6T/kih7rIfQMoNggYytKG
         x2YQ==
X-Gm-Message-State: AOAM530UQR9HFi0omNr08mH+PIVH3XUhnEUsdKnRJr4wo1Dyq3bqS4NA
	2/D9h4Vid4+sCw8fwqx/WsDAehjvb5kK5w==
X-Google-Smtp-Source: ABdhPJwChy+y3LPsxk/Oy0cuSIkyCKxA6HzbQxm3TcHdBIYF3r93idoTLUM/ZyFQHBej6i/DF4iFYQ==
X-Received: by 2002:a5d:648e:: with SMTP id o14mr16237234wri.27.1623067315214;
        Mon, 07 Jun 2021 05:01:55 -0700 (PDT)
Received: from localhost.localdomain (113.red-88-4-247.dynamicip.rima-tde.net. [88.4.247.113])
        by smtp.gmail.com with ESMTPSA id r4sm7595408wmq.37.2021.06.07.05.01.54
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 07 Jun 2021 05:01:54 -0700 (PDT)
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
To: linux-staging@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	neil@brown.name,
	dan.carpenter@oracle.com
Subject: [PATCH v3 0/6] staging: mt7621-pci: some required changes after first review
Date: Mon,  7 Jun 2021 14:01:47 +0200
Message-Id: <20210607120153.24989-1-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.25.1
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

Some things must be updated before get this a new attempt to get this
mainlined:
    - Device tree bindings need to move som stuff into child root nodes. 
    - Use relaxed version of readl and writel.
    - Other minor stuff.

After this is merged in staging tree, I will move with 'git mv' this
driver into 'drivers/pci/controller' as I've been suggested to do by
Bjorn.

Thanks in advance for your time.

Best regards,
    Sergio Paracuellos

Changes in v3:
    - PATCH 5: Add missings 'reset_control_put()' calls in error
      and remove paths. 

Changes in v2:
    - Add PATCH 6/6 making use of 'pcie_port_write'.

Sergio Paracuellos (6):
  staging: mt7621-pci: make cleaner 'mt7621_pcie_enable_ports'
  staging: mt7621-pci: remove 'RALINK_PCI_BAR0SETUP_ADDR' definition
  staging: mt7621-pci: use {readl|writel}_relaxed instead of
    readl/writel
  staging: mt7621-dts: move some properties into root port child nodes
  staging: mt7621-pci: parse some dt properties from root port child
    nodes
  staging: mt7621-pci: make use of 'pcie_port_write'

 drivers/staging/mt7621-dts/mt7621.dtsi  |  21 ++---
 drivers/staging/mt7621-pci/pci-mt7621.c | 100 ++++++++++++++----------
 2 files changed, 69 insertions(+), 52 deletions(-)

-- 
2.25.1

