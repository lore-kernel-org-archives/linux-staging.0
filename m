Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC1F972
	for <linux-staging@lists.linux.dev>; Mon, 14 Jun 2021 10:06:20 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id l18-20020a1ced120000b029014c1adff1edso12612662wmh.4
        for <linux-staging@lists.linux.dev>; Mon, 14 Jun 2021 03:06:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZWPfS1j+ZHcYwLa9t4ZB3v5pOc9zAsYC3fSyZAd4gAE=;
        b=GcEj5ddWydc/sAv5he2N/y5bpXlWw5mx0y3eAO9ji5dLRl1Xuz0qKZ7T0mn32RS/nP
         cvcKgIcwBU0wI71qVnfWvGDHNyczVw49QI/ml1dp0agfc/xTpcysI8WoC9gzUyP1evnw
         xEXxjRDbzKGMnaeHFBT13PglA0quivN+A4ZFb1FrpWu4VDhPRIRmMZec+m13MUZHpQFt
         BMcFyZ9YUp+hbc/4iEIfv+lI3MRkvFEbx5NJBYClmiph5dYHq6+qKPPvKnjG+eDbEjUr
         76E++oYvIRT/wV5sVS+Vb/gzEZhcl1M4zuGuEmFdsdbdGGFvOz++IAwhyQJl5caOVOdE
         F/dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZWPfS1j+ZHcYwLa9t4ZB3v5pOc9zAsYC3fSyZAd4gAE=;
        b=OxS+JxYSPdk3V+HZH8RBI4XOMZdKpLi9JMwZK+mDQ0Oj02fMVltmBn455m/ChbuUyS
         4DV5mAqZvZeMeXxS64hXVrArSPLwSv2wrC34skQYANG9iclTVyhPUVeJOfuAJ32uzI7L
         j+DPRu9dvFIoYMB+8iyyHkpZxBOSkdUDOuFZ7AslOfraj0jbJ2yXJXsDgbgYHfKmKUnT
         F+Xom2/ia+H3KnTbt+OUdf8gbgqc1/G2eZ11Ed5SbCdpJAuYleURGh1gRBn7ZSME/rFI
         iUXcMULO8Ryek0gOCg5uAUZ4B1tF3qMRsaygzsVT/wvo1yChAOOrtAzimrnGrD0D4L8c
         sIYA==
X-Gm-Message-State: AOAM530HpEYckkZn6PcYq5WENwyBmbFFZpy2EcKdYj+2DEVMXK3R3ga/
	vRoHS9O4zbXReHugylGJMqlf3Z3d0uw=
X-Google-Smtp-Source: ABdhPJzzcuILbxNELcXrkQEB9Y1VJl9xbp0YX6DYhYIpF2TAv5LsbxGNbfhW6dKyCOgz3kUMhc5CRg==
X-Received: by 2002:a1c:f70d:: with SMTP id v13mr15046481wmh.183.1623665179095;
        Mon, 14 Jun 2021 03:06:19 -0700 (PDT)
Received: from localhost.localdomain (98.red-81-38-58.dynamicip.rima-tde.net. [81.38.58.98])
        by smtp.gmail.com with ESMTPSA id k5sm16476566wrv.85.2021.06.14.03.06.18
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 14 Jun 2021 03:06:18 -0700 (PDT)
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
To: linux-staging@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	neil@brown.name,
	linux-mips@vger.kernel.org,
	tsbogend@alpha.franken.de,
	ilya.lipnitskiy@gmail.com,
	john@phrozen.org
Subject: [PATCH v2 0/3] staging: mt7621-pci: define ralink PCI_IOBASE to avoid manually ranges parsing
Date: Mon, 14 Jun 2021 12:06:14 +0200
Message-Id: <20210614100617.28753-1-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.25.1
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Ralink MIPS platforms do not define PCI_IOBASE. This ends up in
pci generic apis not working with io resources when calls to function
'of_pci_range_to_resource' are performed because internall function
'pci_address_to_pio()' is call and it results in getting 'OF_BAD_ADDR'
as result. If we define PCI_IOBASE pci generic apis properly works for
ralink pci controllers. In this particular case, we can remove all
manually ranges and resource from driver code decresing LOC and being
more standard.

In the future, this is also useful for mips pci drivers which are still
using pci legacy apis. After having PCI_IOBASE defined, only defining 
'pci_address_to_pio' for PCI_LEGACY might be remaining to also make 
work 'pci-rt3883', 'pci-mt7620' among others. Sadly I don't have devices
to test that so I haven't write the code by myself.

Thanks in advance for your time.

Changes in v2:
  - Fix PATCH 1 indentation converting spaces into tabs.

Best regards,
     Sergio Paracuellos

Sergio Paracuellos (3):
  MIPS: ralink: Define PCI_IOBASE
  staging: mt7621-pci: remove 'mt7621_pci_parse_request_of_pci_ranges'
  staging: mt7621-dts: fix pci address for PCI memory range

 arch/mips/include/asm/mach-ralink/spaces.h |  10 +++
 drivers/staging/mt7621-dts/mt7621.dtsi     |   2 +-
 drivers/staging/mt7621-pci/pci-mt7621.c    | 100 ++++++---------------
 3 files changed, 38 insertions(+), 74 deletions(-)
 create mode 100644 arch/mips/include/asm/mach-ralink/spaces.h

-- 
2.25.1

