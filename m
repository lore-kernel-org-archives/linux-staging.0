Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71C7717F
	for <linux-staging@lists.linux.dev>; Sat,  7 Aug 2021 07:24:14 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id l18so14013169wrv.5
        for <linux-staging@lists.linux.dev>; Sat, 07 Aug 2021 00:24:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kOfa29VAz1NlQekE8P7/3E01ehCcTCDdZpc8rzXu9+8=;
        b=TGhhO0/U6iy8CTCCnuKpidFV3bVAKGjyFHC08l2wtYLPab/r+yk5oD6fGhXCHbLxd2
         K2mn2qSorYg4FB7W+sJa00dDlVJOmNvoXX2o9BtaigdrFSWBPnInrQEPNkC9CWXmxyf5
         eXNYN2U3yR/rtSJwa4swc8BmqYcThmrXA0xaw60tFy3Gm4dqy4Y7nZe7mqLwTowW/ieB
         DDSQwdVNPQvRSMZPIwKUd+Fh4uz+GnBK279vVNfniD6CpE7jBghKmazPZyUtH2nBckTr
         nHoRNxAXvDt6Co/QwN8BChk/ahEMkys+pzqjE0KNphbfblh/lqUDOUocZ3MSd+10wcqr
         VsRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kOfa29VAz1NlQekE8P7/3E01ehCcTCDdZpc8rzXu9+8=;
        b=Ic+QPcr8LC8VmdPMbTBDBrKpMJQa7yZM8HVx1bx3pWmFlwsTXl90xxaMz1+tvZXxrl
         m2aE6tSQJMPHEL1twT5pN6PKgH+KYZZSqV2xnVAoh/EJYHoWfy+zyxb1OgToqI3+4IhX
         4EVHbA+DoUoLev0aal4Kab5JdIQrCd1En5N/ay906TwuEEhLp2HHOd2Vil5U+ld7JMzf
         xs7Way7TAIxMEq0aVE5GKjqMjD4GeEg/g3XXEH+/zeig15uO+qERuKZexbT6jxFccVFg
         WejPHclIOhxgLX7Ak5ZDuk3RYrkk2K6L7j9q8yZ8qWkkmHJ4SVB7xmoNrNi+YArfycbd
         /W0w==
X-Gm-Message-State: AOAM532kE6aqWPjVqDFD9aTdJj0iNcxKKzHXzdsXVA6KkCnCW2U6wfDb
	j6X2fjCW55qcozgK9JCARDs=
X-Google-Smtp-Source: ABdhPJysQAP0lK1qriodegnx5Hj0BurpjgKvd5yHBxHmXA0OugHLV7iTq7mxtI17CdFLqvJKir5NSw==
X-Received: by 2002:adf:f383:: with SMTP id m3mr14107000wro.81.1628321052848;
        Sat, 07 Aug 2021 00:24:12 -0700 (PDT)
Received: from localhost.localdomain (10.red-83-57-27.dynamicip.rima-tde.net. [83.57.27.10])
        by smtp.gmail.com with ESMTPSA id g5sm13915017wmh.31.2021.08.07.00.24.11
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 07 Aug 2021 00:24:12 -0700 (PDT)
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
Subject: [PATCH 1/3] MIPS: ralink: don't define PC_IOBASE but increase IO_SPACE_LIMIT
Date: Sat,  7 Aug 2021 09:24:07 +0200
Message-Id: <20210807072409.9018-2-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210807072409.9018-1-sergio.paracuellos@gmail.com>
References: <20210807072409.9018-1-sergio.paracuellos@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Defining PCI_IOBASE results in pci resource handling working but the
addresses generated for IO accesses are wrong since the ioremap in the pci
core function 'pci_parse_request_of_pci_ranges' tries to remap to a fixed
virtual address (PC_IOBASE) which can't work for KSEG1 addresses. To get
it working this way, we would need to put PCI_IOBASE somewhere into KSEG2
which will result in creating TLB entries for IO addresses, which most of
the time isn't needed on MIPS because of access via KSEG1. So avoid to
define PCI_IOBASE and increase IO_SPACE_LIMIT resource for ralink MIPS
platform instead, to get valid IO addresses for resources from pci core
'pci_address_to_pio' function.

Fixes: 222b27713d7f ("MIPS: ralink: Define PCI_IOBASE)
Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
---
 arch/mips/include/asm/mach-ralink/spaces.h | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/mips/include/asm/mach-ralink/spaces.h b/arch/mips/include/asm/mach-ralink/spaces.h
index 87d085c9ad61..31a3525213cf 100644
--- a/arch/mips/include/asm/mach-ralink/spaces.h
+++ b/arch/mips/include/asm/mach-ralink/spaces.h
@@ -2,9 +2,7 @@
 #ifndef __ASM_MACH_RALINK_SPACES_H_
 #define __ASM_MACH_RALINK_SPACES_H_
 
-#define PCI_IOBASE	_AC(0xa0000000, UL)
-#define PCI_IOSIZE	SZ_16M
-#define IO_SPACE_LIMIT	(PCI_IOSIZE - 1)
+#define IO_SPACE_LIMIT	0x1fffffff
 
 #include <asm/mach-generic/spaces.h>
 #endif
-- 
2.25.1

