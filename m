Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92560177
	for <linux-staging@lists.linux.dev>; Sat,  7 Aug 2021 07:24:13 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id b13so14000541wrs.3
        for <linux-staging@lists.linux.dev>; Sat, 07 Aug 2021 00:24:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CQVJ6KEPO6Kfj45v+UGoU1H5V0Gd/eW+GBrXqKNDa18=;
        b=LYXtASnhY5Svew1rm6hnVMOdhvXIjK6Btf5g9t36t5ycGc3KyqXQ0OBOAeE0BeroEW
         1iE7ZkrqAjSV5YOsFm6/451P1VkK/rOlBXnIPhR8sEP1IP6CF3byCZkLpOrPycMlmJHi
         /WTH8jyZeev2yZptxDVh2Rnm9Ydv0gztIDJluzLudiYUU9SaW/IffKE+U67WbdV0w1Qf
         BA3iOQucjyPaQKdWY4PLHrzV1ZdDtgjTvBLaNXDtWP8WOanvi1hvu/5cCMjS3uexCY4K
         BfuqLoR7C01mgCYD0xmep3Uff+ZWd8jivhZ7LUdpaMF/eoD7aOIj8vn2jYvIsvaW8BEk
         Nz0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CQVJ6KEPO6Kfj45v+UGoU1H5V0Gd/eW+GBrXqKNDa18=;
        b=bLOsQuftG17Tay7CckOPa/xKU5nILFsC4zMvts8K3n7/19TIUkA+k01sndWgtp777i
         p2iZN9eB53xW23xQLaBhFB+xb1a0pH0k8KlDXL9n3mXNU6NvZB1+UJh6ZVEzu4MlHr89
         Hy+8HnRTSdDsxmKMu4P+AC3OHilfg0xqQDdIgNafwHp/eE7qzVcRh9rvGTLaTCIu/53E
         aT2ZX1qAlzXS6bjZXGyYvGF6jUpzXw8ig4UPsJr0XY7AOMYqMzgw0TPKWSgI+vsffN38
         SJNnKD46AQEPqeBdVvjxkyBMBU/NsJjavriBKjNOqGM2gRvCi3sxOnPDqo/4PGVUJLNb
         5BbA==
X-Gm-Message-State: AOAM532lkk/aeiYlGo3TMjJYReQNrZsFS78XziBraK0DhZUOvG7Ji8nA
	XkVXiPnKJ4DWQMP51E9LzqQ=
X-Google-Smtp-Source: ABdhPJxHBi4V+FnzSBoHfZHtjZpZvj30+5Q8R+YX5ZFipXeCCrS3SP5u20r2buzgvuKbwfhsfAzWjQ==
X-Received: by 2002:a5d:6c63:: with SMTP id r3mr14499705wrz.405.1628321051861;
        Sat, 07 Aug 2021 00:24:11 -0700 (PDT)
Received: from localhost.localdomain (10.red-83-57-27.dynamicip.rima-tde.net. [83.57.27.10])
        by smtp.gmail.com with ESMTPSA id g5sm13915017wmh.31.2021.08.07.00.24.10
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 07 Aug 2021 00:24:11 -0700 (PDT)
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
To: tsbogend@alpha.franken.de
Cc: bhelgaas@google.com,
	matthias.bgg@gmail.com,
	gregkh@linuxfoundation.org,
	linux-mips@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-staging@lists.linux.dev,
	neil@brown.name,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] MIPS: ralink: properly handle pci IO resources
Date: Sat,  7 Aug 2021 09:24:06 +0200
Message-Id: <20210807072409.9018-1-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi all,

Defining PCI_IOBASE for MIPS ralink platform results in resource handling working
but the addresses generated for IO access being wrong, because the iomap tries to
ioremap it to a fixed virtual address (PCI_IOBASE), which can't work for KSEG1 
addresses. To get it working this way, we would need to put PCI_IOBASE somewhere
into KSEG2, which will create TLB entries for IO addresses, which most of the
time isn't needed on MIPS because of access via KSEG1. Instead of doing that and
taking into account that we need to get a valid IO address from 'pci_address_to_pio'
and ralink platforms have IO addresses higher than 0xffff, the following approach
will be preferred to get expected working behaviour from PCI core APIs and pci 
drivers working together:
 
1) Avoid to define PCI_IOBASE.
2) Set IO_SPACE_LIMIT to 0x1fffffff which is a valid range for this SoCs.
3) Avoid to ioremap IO resource if PCI_IOBASE is not defined. 
3) Set ioport_resource end limit to this new IO_SPACE_LIMIT.

Doing in this way we end up with a properly working PCI IO in ralink SoCs.
These changes metioned above are in the three patches included in this series.

Thanks in advance for your time and comments.

Best regards,
    Sergio Paracuellos

Sergio Paracuellos (3):
  MIPS: ralink: don't define PC_IOBASE but increase IO_SPACE_LIMIT
  PCI: of: avoid 'devm_pci_remap_iospace' if PCI_IOBASE is not defined
  staging: mt7621-pci: set end limit for 'ioport_resource'

 arch/mips/include/asm/mach-ralink/spaces.h | 4 +---
 drivers/pci/of.c                           | 2 ++
 drivers/staging/mt7621-pci/pci-mt7621.c    | 2 ++
 3 files changed, 5 insertions(+), 3 deletions(-)

-- 
2.25.1

