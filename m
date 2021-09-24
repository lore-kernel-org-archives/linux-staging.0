Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 229B02FAE
	for <linux-staging@lists.linux.dev>; Fri, 24 Sep 2021 21:11:49 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id d6so31056979wrc.11
        for <linux-staging@lists.linux.dev>; Fri, 24 Sep 2021 14:11:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rUTZvUNb/aRTjaMs08BG0O3uRLaU29RyM+PhYifid0Y=;
        b=pMUpUCMmarp0nIvy/TkK/WPQKudmfB/DVvWODbDkTzappLn5QaaHIheHmc4jfp8SgH
         7tj8S8kb/Q2x3uo1ey8ylSpwqj9VJOAQPAonbA2wA6adYLGY3B9iTnHHuxmxpZ0axNru
         Sb6mYWHYzPW6QQXTDfnwfnEkgmpyVjMUwnroPQ3ek8ofELcoje8ktQzgvL+pAyVKfAOG
         tCirQbmwG61xE8hFnZt88YE4AaGW6b+pL7BrpO6v+itKx9WmCTpxfOyKRLdSz9C1czwb
         oAqxMIexTN/QgGMRAdQGqqPPiNyPpSD7p7HCmHnhubxNL1c5vJx8E0xep9RMcMK7AyXq
         MdYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rUTZvUNb/aRTjaMs08BG0O3uRLaU29RyM+PhYifid0Y=;
        b=ytrp4eczajblADPe4z4xLlWD7jk6cCFGnLK+CmSrck5yA+JCXOW66Eac1hucujrAm1
         cmQkFinXixTQeuq+9CaYt/jANlpoq3j5Z+VDd25nSJoxp1X5jtAJO/fvxAY9KN/Xle0q
         SrBAXygf19HHd9Jg9stu6z1L/Q/Hzd+sWrBNw0j9lIAbTVo21dhqrquxk+rNsuDhrND5
         j780Y629CciFTCwUlshQvvauJWwfvlRaLkD1qAB+tvnM4JsrcbqDHhtq9FPovfO7AF1C
         l4i8GgtIhAf/yjfWI4RA0MTLXqbuxlndhoMjmeylmVvYfyTZZl3akroNBH3AAtRQj0Rc
         t/nw==
X-Gm-Message-State: AOAM532KX+IhjxHqA1XtM7lviFHJa6TWnTtT5SBrN0QHClHBOaOW0wRO
	zA99KOoyCQ794QsrojR2bPc=
X-Google-Smtp-Source: ABdhPJzobyLQ43Z6C9NxnIkf5NvAfYzc3Ak1ecVF83cMaXbnY8A9vPPzsvVBDCRpBlZUJjMdmLT6vw==
X-Received: by 2002:a1c:3b43:: with SMTP id i64mr4023029wma.170.1632517907585;
        Fri, 24 Sep 2021 14:11:47 -0700 (PDT)
Received: from localhost.localdomain (252.red-83-54-181.dynamicip.rima-tde.net. [83.54.181.252])
        by smtp.gmail.com with ESMTPSA id y64sm10344297wmc.38.2021.09.24.14.11.46
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 24 Sep 2021 14:11:47 -0700 (PDT)
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
Subject: [PATCH 5/6] MIPS: implement architecture dependent 'pci_remap_iospace()'
Date: Fri, 24 Sep 2021 23:11:38 +0200
Message-Id: <20210924211139.3477-6-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210924211139.3477-1-sergio.paracuellos@gmail.com>
References: <20210924211139.3477-1-sergio.paracuellos@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

To make PCI IO work we need to properly virtually map IO cpu physical address
and set this virtual address as the address of the first PCI IO port which
is set using function 'set_io_port_base()'.

Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
---
 arch/mips/include/asm/pci.h | 2 ++
 arch/mips/pci/pci-generic.c | 9 +++++++++
 2 files changed, 11 insertions(+)

diff --git a/arch/mips/include/asm/pci.h b/arch/mips/include/asm/pci.h
index 9ffc8192adae..35270984a5f0 100644
--- a/arch/mips/include/asm/pci.h
+++ b/arch/mips/include/asm/pci.h
@@ -20,6 +20,8 @@
 #include <linux/list.h>
 #include <linux/of.h>
 
+#define pci_remap_iospace pci_remap_iospace
+
 #ifdef CONFIG_PCI_DRIVERS_LEGACY
 
 /*
diff --git a/arch/mips/pci/pci-generic.c b/arch/mips/pci/pci-generic.c
index 95b00017886c..877ec9d6a614 100644
--- a/arch/mips/pci/pci-generic.c
+++ b/arch/mips/pci/pci-generic.c
@@ -46,3 +46,12 @@ void pcibios_fixup_bus(struct pci_bus *bus)
 {
 	pci_read_bridge_bases(bus);
 }
+
+int pci_remap_iospace(const struct resource *res, phys_addr_t phys_addr)
+{
+	size_t size = (res->end - res->start) + 1;
+	unsigned long vaddr = (unsigned long)ioremap(phys_addr, size);
+
+	set_io_port_base(vaddr);
+	return 0;
+}
-- 
2.25.1

