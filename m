Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A2B03FC7
	for <linux-staging@lists.linux.dev>; Sat, 25 Sep 2021 08:46:45 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id t28so21172458wra.7
        for <linux-staging@lists.linux.dev>; Sat, 25 Sep 2021 01:46:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WfsTMGHRrVf67vgTGBQhuwZeMW0at7d6zz5QK8rpDxQ=;
        b=YaahUOtT9d8Z01wD8o7worryVp3NECKpBGQr6+E2XfsFqBfNl+g3e2gvmrvy6f2yA8
         QwKKYQdTZDUQ9kPaDPOY8584K+mC5g2yNk6Wx8KXusrP1RVBy53MEd+cnjM+zXl/EhNY
         LK+d+VDsaK1ZPz60oPjuaFTXG4Rrlkn3sZrTmzqe0REWJLxZBXlAkuLUrWmMF3j5fIlp
         QX0SwmOU5s6iZlqtEr1j0SprwdbXGrIuVIx4SsIZeAnLrjeYmFS/ZGeM+/DfvgVitOAO
         ObwcvNiqn7k4BHA12a2GLKcl0yhbyWZyd/3GQUkyD3LAOX0Ebj0KTPCG6kyZbquAmas6
         vmRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WfsTMGHRrVf67vgTGBQhuwZeMW0at7d6zz5QK8rpDxQ=;
        b=jvbw3pEEDZ9gq75Mw8B2OlMZt+Sm/XuIqXw6PRyhY2Y8gZXPcmsDRDqK4k3iQy3yZB
         6xboMbxa5YxcE4lgg9awqORwrfAY6lZHJ8MpYmIFrEVeBSIMBqesKJxMs6ExCaVKjEfw
         THq3cAGaGAW09zVQi9jCO1tb2dDVTIo48rmLufIU5xP/kWKZsqOvKFl3oR8ejMyJi+wm
         SctuVk56fcG37010w4abaslOfRnk0qj77/t8q3E2flNd8hQlJoANDZYOntso3PSa5TF7
         CZ3LRAsxXfNXOrVkO1EDPbwbRdKiwOfZPjWhdWCpPBxjvLEqOyY9tWgxw3Ai9f6J+KbW
         jbsQ==
X-Gm-Message-State: AOAM533LS7kGowaGKkG0G1DX7toHHByitpK11rz3YaNLASJ7xzyYd0hA
	q2EtpGgdLT95qsBT3sT6DmU=
X-Google-Smtp-Source: ABdhPJzzb+nvb8QPKJpqZ19mMuQgB2PySLYWJB2N5b4RhftKrh81iqyr6P4NmgvtVuxpGEloAg5AkQ==
X-Received: by 2002:a1c:417:: with SMTP id 23mr4806498wme.161.1632559603850;
        Sat, 25 Sep 2021 01:46:43 -0700 (PDT)
Received: from localhost.localdomain (252.red-83-54-181.dynamicip.rima-tde.net. [83.54.181.252])
        by smtp.gmail.com with ESMTPSA id y9sm17222997wmj.36.2021.09.25.01.46.42
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 25 Sep 2021 01:46:43 -0700 (PDT)
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
Subject: [PATCH v2 0/6] MIPS: ralink: fix PCI IO resources
Date: Sat, 25 Sep 2021 10:46:35 +0200
Message-Id: <20210925084642.5642-1-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

MIPs ralink need a special tratement regarding the way it handles PCI IO                                                           |6   
resources. On MIPS I/O ports are memory mapped, so we access them using normal                                                     |  1 
load/store instructions. MIPS 'plat_mem_setup()' function does a call to                                                           |  2 Sergio Paracuellos (6): 
'set_io_port_base(KSEG1)'. There, variable 'mips_io_port_base'                                                                     |  3   Revert "MIPS: ralink: don't define PC_IOBASE but increase
is set then using this address which is a virtual address to which all                                                             |  4     IO_SPACE_LIMIT"
ports are being mapped. Ralink I/O space has a mapping of bus address                                                              |  5   Revert "staging: mt7621-pci: set end limit for 'ioport_resource'"
equal to the window into the mmio space, with an offset of IO start range                                                          |  6   MIPS: ralink: set PCI_IOBASE to 'mips_io_port_base'
cpu address. This means that to have this working we need:                                                                         |  7   PCI: Allow architecture-specific pci_remap_iospace()
- linux port numbers in the range 0-0xffff.                                                                                        |  8   MIPS: implement architecture-specific 'pci_remap_iospace()'
- pci port numbers in the range 0-0xffff.                                                                                          |  9   staging: mt7621-pci: properly adjust base address for the IO window
- io_offset being zero.                                                                                                            | 10  

These means at the end to have bus address 0 mapped to IO range cpu address.                                                       | 12  arch/mips/include/asm/pci.h                | 2 ++
We need a way of properly set 'mips_io_port_base' with a virtually mapped                                                          | 13  arch/mips/pci/pci-generic.c                | 9 +++++++++
value of the IO cpu address.                                                                                                       | 14  drivers/pci/pci.c                          | 2 ++

This series do the following approach:                                                                                             | 16  5 files changed, 17 insertions(+), 4 deletions(-)
1) Revert two bad commit from a previous attempt of make this work [0].                                                            | 17 
2) Set PCI_IOBASE to mips 'mips_io_port_base'.                                                                                     | 18 -- 
3) Allow architecture dependent 'pci_remap_iospace'.                                                                               | 19 2.25.1
4) Implement 'pci_remap_iospace' for MIPS.                                                                                         | 20 
5) Be sure IOBASE address for IO window is set with correct value.                                                                 |~                                                                                                                                      

More context about this series appoach in this mail thread [1].                                                                    |~                                                                                                                                      

Patches related with reverts are from this merge cycle so they are only
added to the staging git tree. So to have all stuff together I'd like to
get everybody Ack's to get all of this series through staging tree if
possible :).

Thanks in advance for your time.                                                                                                   |~                                                                                                                                      

Changes in v2:
- re-do commit messages for PCI patch as Bjorn pointed out in previous series.
- Add Bjorn's Acked-by for PCI subsystem patch.
- Re-do commit message of MIPS 'pci_remap_iospace()' patch to align with changes
in the PCI patch (s/architecture dependent/architecture-specific/)
- Add Fixes-by tag for MIPS set PCI_IOBASE patch.

[0]: https://www.spinics.net/lists/kernel/msg4051474.html                                                                          |~                                                                                                                                      
[1]: https://lkml.org/lkml/2021/9/22/6

Sergio Paracuellos (6):
  Revert "MIPS: ralink: don't define PC_IOBASE but increase
    IO_SPACE_LIMIT"
  Revert "staging: mt7621-pci: set end limit for 'ioport_resource'"
  MIPS: ralink: set PCI_IOBASE to 'mips_io_port_base'
  PCI: Allow architecture-specific pci_remap_iospace()
  MIPS: implement architecture-specific 'pci_remap_iospace()'
  staging: mt7621-pci: properly adjust base address for the IO window

 arch/mips/include/asm/mach-ralink/spaces.h | 4 +++-
 arch/mips/include/asm/pci.h                | 2 ++
 arch/mips/pci/pci-generic.c                | 9 +++++++++
 drivers/pci/pci.c                          | 2 ++
 drivers/staging/mt7621-pci/pci-mt7621.c    | 4 +---
 5 files changed, 17 insertions(+), 4 deletions(-)

-- 
2.25.1

