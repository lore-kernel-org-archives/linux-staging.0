Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DCB23FCF
	for <linux-staging@lists.linux.dev>; Sat, 25 Sep 2021 20:32:33 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id d6so38129743wrc.11
        for <linux-staging@lists.linux.dev>; Sat, 25 Sep 2021 13:32:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yKlbIEgqwR0qKF8U+1Jmv4I3Uips5CrTskAfz926Lgw=;
        b=X4MuI7BDwuEfS0kx+aSaMc/Oso11hkeMpr296AAfzuYHNay+DEGMlnw58azTBbTdOx
         D0eIX133N+i//NgM4wovM29cPWfQWSiYXzPfFjo6XLs2GGeESmQRKBl/LQT0AdG6yCvx
         VuL/ij3eJUsQIRoJqKi9OZaF9RkPfjeWniW38Uypp2ZoVnhYpyEyZTnHZp1MMV28N2jM
         zqH2Q8Ejfp85vpppMvnQHcv/xuQwuNIAEoI5p8q7YAKCqwAVzgI3Hq4TIzAy/7QdKpkh
         CoLyJieFkhioAT4oPsFejj5+O2IYoCIKf8IoclO1nL7rFQyUHj/cWQqdSJvvBX//ITnt
         4hWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yKlbIEgqwR0qKF8U+1Jmv4I3Uips5CrTskAfz926Lgw=;
        b=41pfqrfnEHqN63vebqByz4UbJeX15mAIFNWtXM+IjDPBpdPHanqAMByyvoZruUoID7
         EUlZLcrLRVb8WQILVKONZgdelztQh2QgBP+Z9nXlqWuLdmxDnBRxVaDYLGVM7JLH56fi
         60WL2Cvm8VsNI6u+Nh3HWdavgLWi8bQvjt7SmvsK6AzGClDSu/Y/xLNJ0FOes5VKJqOU
         +lVWrrnvHgXvuE0JRqe2YJznYv1836LIu7T7Max0raBGnKOnU+K0zxxDZl618JnypDCw
         ylIY8GQ2LDQHq+SNIhkchLhJuW72UOVU0JsSW8GtBzXyqW5ePdzwlLLlrhMuFkeSAOrX
         7CLw==
X-Gm-Message-State: AOAM533SThauDrLCWG9BtP7QFs8eL50C7WMOKbypBlVyuz0neuG2H3oi
	WzWV/vC6B4McxZwvrNElmCI=
X-Google-Smtp-Source: ABdhPJyB5EAGRY414d65WgCtR2DA5/RQmVAZJ8drxqTB2g4Nnh94SBqW29tqzshSJ+0sTHFz9SbFdw==
X-Received: by 2002:adf:9bdb:: with SMTP id e27mr18382224wrc.162.1632601951732;
        Sat, 25 Sep 2021 13:32:31 -0700 (PDT)
Received: from localhost.localdomain (252.red-83-54-181.dynamicip.rima-tde.net. [83.54.181.252])
        by smtp.gmail.com with ESMTPSA id a202sm16703279wmd.15.2021.09.25.13.32.30
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 25 Sep 2021 13:32:31 -0700 (PDT)
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
Subject: [PATCH v3 5/6] MIPS: implement architecture-specific 'pci_remap_iospace()'
Date: Sat, 25 Sep 2021 22:32:23 +0200
Message-Id: <20210925203224.10419-6-sergio.paracuellos@gmail.com>
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

To make PCI IO work we need to properly virtually map IO cpu physical address
and set this virtual address as the address of the first PCI IO port which
is set using function 'set_io_port_base()'.

Acked-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
---
 arch/mips/include/asm/pci.h |  2 ++
 arch/mips/pci/pci-generic.c | 14 ++++++++++++++
 2 files changed, 16 insertions(+)

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
index 95b00017886c..18eb8a453a86 100644
--- a/arch/mips/pci/pci-generic.c
+++ b/arch/mips/pci/pci-generic.c
@@ -46,3 +46,17 @@ void pcibios_fixup_bus(struct pci_bus *bus)
 {
 	pci_read_bridge_bases(bus);
 }
+
+int pci_remap_iospace(const struct resource *res, phys_addr_t phys_addr)
+{
+	unsigned long vaddr;
+
+	if (res->start != 0) {
+		WARN_ONCE(1, "resource start address is not zero\n");
+		return -ENODEV;
+	}
+
+	vaddr = (unsigned long)ioremap(phys_addr, resource_size(res));
+	set_io_port_base(vaddr);
+	return 0;
+}
-- 
2.25.1

