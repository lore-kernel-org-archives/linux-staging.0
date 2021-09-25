Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56EDC3FCB
	for <linux-staging@lists.linux.dev>; Sat, 25 Sep 2021 20:32:34 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id w17so38173493wrv.10
        for <linux-staging@lists.linux.dev>; Sat, 25 Sep 2021 13:32:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YGJlwr2TgrXRfWneKRDsk4/Af6P1h7wSgc5Vc8J2024=;
        b=PFdJIClUviW3KXuNKJE+H6ls1LLMZD8ZnRUiIzhy/EGpa5nuJfcuygtInTm9TxRddx
         L/MN531XpjR64tFqU//TTmtzWx/AyzNYOQ8b/gA8//7KK+NiJqxz0HLCe2jerIkKhQ3l
         BKHTYwb7LxJCaxyYtO5gRD2+22dP4UJ41Oc4xBNxtf+zpu0FaPAcMqqyuISDIUzlKLWO
         C12rvZtUdByHjKXSqv5Rb6rULeUdOxTK555+QZeBjUC5T76LexM6mg1T5p6wMatzpH6l
         mtcQFqO+ghZ2q2QvdgQkY7CWblLcnoZXENDN7LUZMqb18ZsPKYHKEVLjqzU7NaHG0P8K
         UBSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YGJlwr2TgrXRfWneKRDsk4/Af6P1h7wSgc5Vc8J2024=;
        b=ZdlZjCC+mX1VVsXKsZYZPOEg97CgnhSl8HnDlOQQkrmTw+AOefWr4oTwTB3gg+Grpu
         gB/es/X5OqC0Aw2/Xgjve6BIwK5hHdEn2gmQhVyjg7YX2BwiRHAOuHgc1eHILZer2Eel
         3df+oHjKxtDloQcrdCwQWeOzR27thjZSwnmTJmdZJWL4qlh0BHjVontYvO6+2ZekpF/g
         1TX+p3GN2oShCCGu2UmfeypaB9STG90OhlTWcFqKmKozGYX+kpSzSIlvC8mpOM9Zdbhh
         Cg9soCFYQacQco1XmqVKzLQclNBzvkEBeXPN/V1qby1K1mDWqqK9cqt7t8XYOvr4zl4w
         kppw==
X-Gm-Message-State: AOAM533RFt4e0mnYAwvmpo25SlABFBO9zFTeATyBEfnhSnR929Kex9pE
	L1Nrjv7B8TJF12n4qTKUWfs=
X-Google-Smtp-Source: ABdhPJwIeSjsdRl4hxHnhQhhjCG31SKIMxpVNFgDBVktB0VGtnJwUeufSCGaKYc4FjlkTA8pYynJ/w==
X-Received: by 2002:a5d:6450:: with SMTP id d16mr18209600wrw.40.1632601952804;
        Sat, 25 Sep 2021 13:32:32 -0700 (PDT)
Received: from localhost.localdomain (252.red-83-54-181.dynamicip.rima-tde.net. [83.54.181.252])
        by smtp.gmail.com with ESMTPSA id a202sm16703279wmd.15.2021.09.25.13.32.31
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 25 Sep 2021 13:32:32 -0700 (PDT)
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
Subject: [PATCH v3 6/6] staging: mt7621-pci: properly adjust base address for the IO window
Date: Sat, 25 Sep 2021 22:32:24 +0200
Message-Id: <20210925203224.10419-7-sergio.paracuellos@gmail.com>
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

The value to adjust in the bridge register RALINK_PCI_IOBASE must take into
account the raw value from DT, not only the translated linux port number.
As long as io_offset is zero, the two are the same, but if you were to use
multiple host bridge in the system, or pick a different bus address in DT,
you can have a nonzero io_offset. At this means to take into account the
bus address which is used to calculate this offset, substracting it from
the IO resource start address.

Acked-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
---
 drivers/staging/mt7621-pci/pci-mt7621.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/mt7621-pci/pci-mt7621.c b/drivers/staging/mt7621-pci/pci-mt7621.c
index 6acfc94a16e7..503cb1fca2e0 100644
--- a/drivers/staging/mt7621-pci/pci-mt7621.c
+++ b/drivers/staging/mt7621-pci/pci-mt7621.c
@@ -482,7 +482,7 @@ static int mt7621_pcie_enable_ports(struct pci_host_bridge *host)
 
 	/* Setup MEMWIN and IOWIN */
 	pcie_write(pcie, 0xffffffff, RALINK_PCI_MEMBASE);
-	pcie_write(pcie, entry->res->start, RALINK_PCI_IOBASE);
+	pcie_write(pcie, entry->res->start - entry->offset, RALINK_PCI_IOBASE);
 
 	list_for_each_entry(port, &pcie->ports, list) {
 		if (port->enabled) {
-- 
2.25.1

