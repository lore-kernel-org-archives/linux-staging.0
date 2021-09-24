Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC79E29CA
	for <linux-staging@lists.linux.dev>; Fri, 24 Sep 2021 21:11:43 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id i23so31280949wrb.2
        for <linux-staging@lists.linux.dev>; Fri, 24 Sep 2021 14:11:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/LLfpywbKszP2bCFo/hCnkAX4fqyNlZuYUmbLGHF/uY=;
        b=Kl/3viQTKa7cB9cfk0k8J+xyePO6VyQJNN5FQhmDd98cp/FbqGQGnsp982mN2LmFFb
         eu2o8l0iSlrMmxE5b6kKeTIGIsWZE9fdhjRpb4v/HXCJyu2JJlHNWIX9eJ5fQpmuih6f
         uNk6J3P4AEB4BNWK5V7vPP48UPybkdRjk8+TR6WotVkGQvCiOjKDLox8QugUjqnQFDpr
         tbdatdL1QSkJgajlve4kPS8LxSI1F0QSSkNXTXXMMXdIKdLntBc9Re9sMPegpLcmY7vj
         D/QbhqxOTFlw0QTRndbjLjF8u/27HVbLXvePrV5Rehcnc43R96Chc5LHcfJlSI1Bcqdw
         WObw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/LLfpywbKszP2bCFo/hCnkAX4fqyNlZuYUmbLGHF/uY=;
        b=Xq3u/l7qbDAnFn9fHX8nr/4H12AM8zyc/J59+Uh/v8S0+GUWRYOzUlUf8dofOYwMYi
         wbXIpFrxXSmosGxT3AwBxlVP0n1BdeBwLPuhHBixVjB+XBIw2o8gbpyE/J6MYuY9GLwx
         yGsOBfnZtLZ7qrG/oP9lF9wuhR/CP/36mq+dMHIYXfzr6vtGc7O/a4KoFUzHt2rQvk2E
         O2Gw/ow+Qcysp9L+f8gHHu9CltvgNILh1Vu83dGYURwh9OAbyMZr/TldpMntUOocvze2
         XEW9WekMyJFDUsq5ZIt+QKFdfD+qHMRw1hOEglU3qSOTmmyXjJsKwTAireaCI2Cp5pDC
         OhwQ==
X-Gm-Message-State: AOAM5318Sq09la6EH8G1NdyxmOsogOFVRec1b9ufc7XfVcmV/mOmkttQ
	4mupK4R/WOVfxTuS4a7XXUI=
X-Google-Smtp-Source: ABdhPJxCVgnetbW0vJj42lLyrGreyKFsu1pv5Tum17phoNjsmDG53hZzPea/6tEicjZrmENDUwsHeQ==
X-Received: by 2002:adf:e5c2:: with SMTP id a2mr13446809wrn.251.1632517902294;
        Fri, 24 Sep 2021 14:11:42 -0700 (PDT)
Received: from localhost.localdomain (252.red-83-54-181.dynamicip.rima-tde.net. [83.54.181.252])
        by smtp.gmail.com with ESMTPSA id y64sm10344297wmc.38.2021.09.24.14.11.41
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 24 Sep 2021 14:11:41 -0700 (PDT)
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
To: tsbogend@alpha.franken.de
Cc: robh@kernel.org,
	arnd@arndb.de,
	catalin.marinas@arm.com,
	Liviu.Dudau@arm.com,
	bhelgaas@google.com,
	matthias.bgg@gmail.com,
	gregkh@linuxfoundation.org,
	linux-mips@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-staging@lists.linux.dev,
	neil@brown.name,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/6] MIPS: ralink: fix PCI IO resources
Date: Fri, 24 Sep 2021 23:11:33 +0200
Message-Id: <20210924211139.3477-1-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

MIPs ralink need a special tratement regarding the way it handles PCI IO
resources. On MIPS I/O ports are memory mapped, so we access them using normal
load/store instructions. MIPS 'plat_mem_setup()' function does a call to
'set_io_port_base(KSEG1)'. There, variable 'mips_io_port_base'
is set then using this address which is a virtual address to which all
ports are being mapped. Ralink I/O space has a mapping of bus address
equal to the window into the mmio space, with an offset of IO start range
cpu address. This means that to have this working we need:
- linux port numbers in the range 0-0xffff.
- pci port numbers in the range 0-0xffff.
- io_offset being zero.

These means at the end to have bus address 0 mapped to IO range cpu address.
We need a way of properly set 'mips_io_port_base' with a virtually mapped
value of the IO cpu address.

This series do the following approach:
1) Revert two bad commit from a previous attempt of make this work [0].
2) Set PCI_IOBASE to mips 'mips_io_port_base'.
3) Allow architecture dependent 'pci_remap_iospace'.
4) Implement 'pci_remap_iospace' for MIPS.
5) Be sure IOBASE address for IO window is set with correct value.

More context about this series appoach in this mail thread [1].

Thanks in advance for your time.

[0]: https://www.spinics.net/lists/kernel/msg4051474.html
[1]: https://lkml.org/lkml/2021/9/22/6

Sergio Paracuellos (6):
  Revert "MIPS: ralink: don't define PC_IOBASE but increase
    IO_SPACE_LIMIT"
  Revert "staging: mt7621-pci: set end limit for 'ioport_resource'"
  MIPS: ralink: set PCI_IOBASE to 'mips_io_port_base'
  PCI: allow architecture specific implementation of pci_remap_iospace()
  MIPS: implement architecture dependent 'pci_remap_iospace()'
  staging: mt7621-pci: properly adjust base address for the IO window

 arch/mips/include/asm/mach-ralink/spaces.h | 4 +++-
 arch/mips/include/asm/pci.h                | 2 ++
 arch/mips/pci/pci-generic.c                | 9 +++++++++
 drivers/pci/pci.c                          | 2 ++
 drivers/staging/mt7621-pci/pci-mt7621.c    | 4 +---
 5 files changed, 17 insertions(+), 4 deletions(-)

-- 
2.25.1

