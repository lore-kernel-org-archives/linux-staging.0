Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F35363FCF
	for <linux-staging@lists.linux.dev>; Sat, 25 Sep 2021 20:32:30 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id g16so38314979wrb.3
        for <linux-staging@lists.linux.dev>; Sat, 25 Sep 2021 13:32:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=uSEYmLllNjJftf9n5AprTfaaSYD64ry9qHpFZHlSP5E=;
        b=mK9eDOopE4EeNRjuJv79Vfu0yg1xqvz1s1EEyvjCOHsg5UuI90jlrsxHA0ICR0xRZi
         Advw48cgO/XZjkSf/CP1jzDIAi5R+VgbDKMoQjGnAZOq+UDSP1itc/QHbNeC/npV/fyX
         y4QSZJuf7xRmpFiLoO1Il5dAyyrjE3I0eN5JEYbSA8eVMvRVzzbYsVJzcclDtNhO+uGi
         EvqhX5msauPSAJ/yTRpXc2yx2Ecosw1GMTsGpJeC3vx3Tw5mkC0zO1sTlpkcGdRd2mXX
         pA3CRybJs0ZbWCDrNPBtj3sTSYW1eTUqPSbkQ+ZstrYYIPmlrsDp5LaBrtJa22CfnjG6
         Ab+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uSEYmLllNjJftf9n5AprTfaaSYD64ry9qHpFZHlSP5E=;
        b=Q9gKXmBz9S6IZq3KLOo9oQNamslwjocd6neMfVOjkoE+E2Ql8UitTUpjNkdi/IVwdV
         RAJOy+9MTEIufTpIB2kdUWF4Id8ceX07LRh1jF8HolOUO/ZMCralqnsrR56Wvi0ijlZA
         fjUHjIuuW3YeoarF7Fzn97lR16dpq7ttrX+OrCHmyMbBZYw72aNyLDhuNw30J6bjA+/a
         Orsew7vo5TfCQmkEsTPs0PliujPN2Dws+mqs34gR+i7BkxMK1/xOy/Q0EVX4zAcXGas1
         QQ6PMDEfldfsgt7AXNb0BuifprpkWLj6l3y0+8gioMnTKmtnfD03/LysWtG2lRQpm9pb
         DZGQ==
X-Gm-Message-State: AOAM533SO6tFp3q3Kzog/ZTfaLEFwjM+VteCjgqbHCdfUCm4WVaDM97A
	lf1725PFk0MozASUsD5gv0I=
X-Google-Smtp-Source: ABdhPJw1wJuIcSQdsCcNqDifiu5l3xy9TQ+mGAYLfv7U7/t0+L1QAKHkglr6WgQuix7pkZUZy2pmnA==
X-Received: by 2002:a5d:4388:: with SMTP id i8mr18259416wrq.340.1632601949390;
        Sat, 25 Sep 2021 13:32:29 -0700 (PDT)
Received: from localhost.localdomain (252.red-83-54-181.dynamicip.rima-tde.net. [83.54.181.252])
        by smtp.gmail.com with ESMTPSA id a202sm16703279wmd.15.2021.09.25.13.32.28
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 25 Sep 2021 13:32:29 -0700 (PDT)
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
Subject: [PATCH v3 3/6] MIPS: ralink: set PCI_IOBASE to 'mips_io_port_base'
Date: Sat, 25 Sep 2021 22:32:21 +0200
Message-Id: <20210925203224.10419-4-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210925203224.10419-1-sergio.paracuellos@gmail.com>
References: <20210925203224.10419-1-sergio.paracuellos@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

By default MIPS architecture use function 'set_io_port_base()' to set the
virtual address of the first IO port. This function at the end sets variable
'mips_io_port_base' with the desired address. To align things and allow
to change first IO port location address for PCI, set PCI_IOBASE definition
as 'mips_io_port_base'.

Fixes: 222b27713d7f ("MIPS: ralink: Define PCI_IOBASE")
Acked-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
---
 arch/mips/include/asm/mach-ralink/spaces.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/mips/include/asm/mach-ralink/spaces.h b/arch/mips/include/asm/mach-ralink/spaces.h
index 87d085c9ad61..05d14c21c417 100644
--- a/arch/mips/include/asm/mach-ralink/spaces.h
+++ b/arch/mips/include/asm/mach-ralink/spaces.h
@@ -2,8 +2,8 @@
 #ifndef __ASM_MACH_RALINK_SPACES_H_
 #define __ASM_MACH_RALINK_SPACES_H_
 
-#define PCI_IOBASE	_AC(0xa0000000, UL)
-#define PCI_IOSIZE	SZ_16M
+#define PCI_IOBASE	mips_io_port_base
+#define PCI_IOSIZE	SZ_64K
 #define IO_SPACE_LIMIT	(PCI_IOSIZE - 1)
 
 #include <asm/mach-generic/spaces.h>
-- 
2.25.1

