Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E45933FC7
	for <linux-staging@lists.linux.dev>; Sat, 25 Sep 2021 08:46:50 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id i23so34655467wrb.2
        for <linux-staging@lists.linux.dev>; Sat, 25 Sep 2021 01:46:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rUTZvUNb/aRTjaMs08BG0O3uRLaU29RyM+PhYifid0Y=;
        b=hoVQ6nm7yhZuUAmxNlI1q/YX8dH0BGqO1HRvmeFsLAnpscnORT96SbHyxvVMPXhxTn
         PDIEfftEwmYgZ6w5oxkLINNBZlWmkfy83T5LZwODQa7yDJFvNa4Mf1NGJFtxe+RXLJ7v
         28gqRJt9fo5EVXP70a9TPoW3PJ86eNIE8hc/Y8mPhRu3O3rDwu2ESBMPeqoaaQ+psYuN
         1PAUyYm6EDDSfG2999aZy3zRYyZaKmU+hGmue7KQqA3Aw7el7Psi6PmSqSGGBRPeHAkX
         98QEZjhngfD29uHbEPTr9Eo6QZzgBW42R7Ree/cXzh0DK9y1tFZwzunTSCB3ZUZ6dWM8
         7Zbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rUTZvUNb/aRTjaMs08BG0O3uRLaU29RyM+PhYifid0Y=;
        b=agIRXGM6xZeItEnwy581/cd0bo2/p60pvUQpFe6JOoM80QSQD2CKlj/w5RBTxQNksB
         3LsSeQEytIM/rTBohChW1wOvImK//c6lFeDylyy2ndUOcZ9+xVy3R9Rjx5eKSqn4s3FX
         p9LqaILsZvgwbrbtLRO5xOgqpc5sGvH7oArLsYoC66IlAFcE2sqFSDUWZLirD5J1UbIP
         A9wdfildJGmrt3l9aya7zAiUo4E06HzTpMLnrkzj6s95RpFvgWq6eZcSfMnFh3kVWl5O
         qsk3pf6VSKxTHhmzibPxDuxrBKqaIS1ZPIeNSQQvu/zrOdpUoCI2vbi7bDeVexJQFSa2
         27fg==
X-Gm-Message-State: AOAM5333jAjdxjwZA1VUqJufmzS69MwwulbXiLeBKZ92Z+rs83XMzVej
	jdyeZnt4HW+VWXZ71auTt08=
X-Google-Smtp-Source: ABdhPJy/2JiHVCtpZqyGPxj+FixQ15sAVbATyh0UqzskjKHeIwWnt2HxbRbTu3kiitLIgVHeBoRS3w==
X-Received: by 2002:a1c:ed13:: with SMTP id l19mr6086272wmh.48.1632559609342;
        Sat, 25 Sep 2021 01:46:49 -0700 (PDT)
Received: from localhost.localdomain (252.red-83-54-181.dynamicip.rima-tde.net. [83.54.181.252])
        by smtp.gmail.com with ESMTPSA id y9sm17222997wmj.36.2021.09.25.01.46.48
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 25 Sep 2021 01:46:49 -0700 (PDT)
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
Subject: [PATCH v2 5/6] MIPS: implement architecture-specific 'pci_remap_iospace()'
Date: Sat, 25 Sep 2021 10:46:40 +0200
Message-Id: <20210925084642.5642-6-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210925084642.5642-1-sergio.paracuellos@gmail.com>
References: <20210925084642.5642-1-sergio.paracuellos@gmail.com>
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

