Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C96A3FC7
	for <linux-staging@lists.linux.dev>; Sat, 25 Sep 2021 08:46:52 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id u18so34623051wrg.5
        for <linux-staging@lists.linux.dev>; Sat, 25 Sep 2021 01:46:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=iEHoU21DH841tx0qtRTz5FbDxLZko2mQ4Z33po9e6hg=;
        b=PIJxllT69paC9PSPnGweRS7+dl4W6XwBhxX3NJEfjhKXs2OgetHWGsVMM+/xlYnpkJ
         yE067R/ulXFWu0+Nb22zbtRi8id5cEPSI4UwX4hUP/vr8+fIKm0RSc1dshmlkRiEEO4e
         a8Ev6kbxZ7iEMMiCbQvYroehkiSsHhWWckVb729l7AVvPOvm2uRGq7JtMYujgGJyM8xw
         0JeGRmnCEqhmtxTCWUhlCgG3Qp4q4kP9jJT2zWwu/jNuV22dva3L3R04ETxhI8U4+Tzr
         jurnDvW9kIcg4JM/zHGJQKU+WHZQcULwW9HWmexNR7JaaNFn+8vixbUKHUTkeYPeLUL1
         7gVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=iEHoU21DH841tx0qtRTz5FbDxLZko2mQ4Z33po9e6hg=;
        b=TXCna4ZaJa2yk1cVvn6w51Dzw6qLXXLu4CIcQhf1rDNRD0ZtQ5NKHjKWzm2GTvC3mn
         x1D3J3VS5+Jig063EtvdSlPAep61S6Bi6n7dV/IglsaM246uryhGro/PRWhNdLL9UBLN
         GcrDT+jQ0mDA7xgwx8di3MBhbk9Jt0ytiMDc7kK9+62EkQTTs5kTsSiF6FApI1WavRSq
         iJozUxxgAxr6wNM4ZUdkW4ivqNNJJiQulq8HOSH09aZGlE+t47XmRfs4Ppl6HQ7i0Cmh
         79pX7YQiRqy468DuV5FE2BRITX6EpIHENbFV6zyE1M4m0YJSxp4nz1JWjU1pKnjX+N9a
         Td2Q==
X-Gm-Message-State: AOAM5323R5GbmK41VWHp2miswsaGei8dw0vqGZ/sWiHtxWy9c7KKcxG2
	wPMwJLS1oT5+8nO3A9idWNQ=
X-Google-Smtp-Source: ABdhPJwbFGgQ4QqaYZwkc1R+U45nYpniQk1gbE3hEL7mfMPfDk8HqaaEUp/5WE47sL6izCrEYT8uVg==
X-Received: by 2002:adf:eec3:: with SMTP id a3mr16448514wrp.276.1632559610460;
        Sat, 25 Sep 2021 01:46:50 -0700 (PDT)
Received: from localhost.localdomain (252.red-83-54-181.dynamicip.rima-tde.net. [83.54.181.252])
        by smtp.gmail.com with ESMTPSA id y9sm17222997wmj.36.2021.09.25.01.46.49
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 25 Sep 2021 01:46:50 -0700 (PDT)
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
Subject: [PATCH v2 6/6] staging: mt7621-pci: properly adjust base address for the IO window
Date: Sat, 25 Sep 2021 10:46:41 +0200
Message-Id: <20210925084642.5642-7-sergio.paracuellos@gmail.com>
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

The value to adjust in the bridge register RALINK_PCI_IOBASE must take into
account the raw value from DT, not only the translated linux port number.
As long as io_offset is zero, the two are the same, but if you were to use
multiple host bridge in the system, or pick a different bus address in DT,
you can have a nonzero io_offset. At this means to take into account the
bus address which is used to calculate this offset, substracting it from
the IO resource start address.

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

