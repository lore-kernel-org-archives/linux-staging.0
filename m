Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D69DC3FC3
	for <linux-staging@lists.linux.dev>; Sun, 22 Aug 2021 16:10:08 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id f10so8980186wml.2
        for <linux-staging@lists.linux.dev>; Sun, 22 Aug 2021 09:10:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZKBqCHTxnc7Q0ClnUW6EKDpt275rDtZm2ej5x81lpWg=;
        b=tvOB3/pEsSGuE+ELhD+3z9UC4+qrGSGWNyDO8q/VidQxcyQjhA9VfhQ99IkoPjleV1
         Z8YDFw4SyzuME/ombY54tKs+c1gaT++/RPF6sezMSB0bPooyr9h/aZgx4sTNhP3mJ0pj
         L/HkFwkl27DSZ5SN5zxmHZuu2XUzuDuw98e0n+D5NCNfoNeJwAoLbl0mGk6oa5rHFJkA
         izvSbGReafL0pIiyRgVNowhyBWuVcm2EyVYPMkdJHfaLjjBFyWlyW3n3FNy0rbjwovA1
         8maARhSw25Dxd2zaQ5U8eOilHLxlrLe9cpD/+z/cPqZCzmAJ6Meq2xko7fNKVJO9pqaI
         qmvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZKBqCHTxnc7Q0ClnUW6EKDpt275rDtZm2ej5x81lpWg=;
        b=sVx21ftG1KsGXkqN3zijrdKyl3LjbxjE+5pu391wN872/0lr0VgBZrW1a9DDsZK23B
         bEcKiF9W8fEdYAW0vmtcRKlNAq7/08nnkqSBGAc5urv1fVxbxhYOXzJOBFzMlOQ0rRLO
         iO0pxqxvqbjLKugwQrysiZHn14Qy0hgqVtT9CKEl3SP0fL6JLOmkrwxq1MXyPtO6XvgN
         GsPtzJrgbh+PA3/JQWY/sXOcMrVH/1FyIviQpQWLP/gKgVvH8hLvsAzP1Mof6EYK/4Rw
         ZfaBWfpoLSuFdG9igaxaC+gdgWo+y8gy7BrZd+UA1ivnY4jiVsLrt48K6JIa4Crrn5au
         2enQ==
X-Gm-Message-State: AOAM530+W6mOC5WhtlSnfF01SmyHeY1p4Muao8pUCYAa9M95KdQQAaOB
	M24rltt98CODwU44of3u1EI=
X-Google-Smtp-Source: ABdhPJy28SkPKG4ICKYRDfXpMUHqIXl88FdrF4ezDi+hCW232fgioMBznepHg62FgVhtRsP9GsDAqw==
X-Received: by 2002:a05:600c:1ca9:: with SMTP id k41mr12326317wms.39.1629648607166;
        Sun, 22 Aug 2021 09:10:07 -0700 (PDT)
Received: from localhost.localdomain (10.red-83-57-27.dynamicip.rima-tde.net. [83.57.27.10])
        by smtp.gmail.com with ESMTPSA id y11sm14861976wru.0.2021.08.22.09.10.05
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 22 Aug 2021 09:10:06 -0700 (PDT)
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
Subject: [PATCH v2 0/3] MIPS: ralink: properly handle pci IO resources
Date: Sun, 22 Aug 2021 18:10:02 +0200
Message-Id: <20210822161005.22467-1-sergio.paracuellos@gmail.com>
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
3) Return zero from 'pci_remap_iospace' if PCI_IOBASE is not defined.
3) Set ioport_resource end limit to this new IO_SPACE_LIMIT.

Doing in this way we end up with a properly working PCI IO in ralink SoCs.
These changes metioned above are in the three patches included in this series.

Thanks in advance for your time and comments.

Changes in v2 (only PATCH v2 2/3 afected):
  - Instead of avoid to call 'devm_pci_remap_iospace' fix 'pci_remap_iospace'
    to return zero for PCI_IOBASE not defined architectures.

Bjorn, I don't know if I should add any kind of 'Fixes' tag for this or
what is the way of handle this kind of changes inside the PCI tree. Thanks
in advance for clarification.

Sergio Paracuellos (3):
  MIPS: ralink: don't define PC_IOBASE but increase IO_SPACE_LIMIT
  PCI: fix 'pci_remap_iospace' for architectures with PCI_IOBASE not
    defined
  staging: mt7621-pci: set end limit for 'ioport_resource'

 arch/mips/include/asm/mach-ralink/spaces.h |  4 +---
 drivers/pci/pci.c                          | 12 ++++++------
 drivers/staging/mt7621-pci/pci-mt7621.c    |  2 ++
 3 files changed, 9 insertions(+), 9 deletions(-)

-- 
2.25.1

