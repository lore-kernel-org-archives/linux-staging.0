Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29D833FC8
	for <linux-staging@lists.linux.dev>; Fri, 24 Sep 2021 21:11:50 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id t8so31340902wri.1
        for <linux-staging@lists.linux.dev>; Fri, 24 Sep 2021 14:11:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=iEHoU21DH841tx0qtRTz5FbDxLZko2mQ4Z33po9e6hg=;
        b=ajfY7Ymmr+7cnGhJOtrjT2wVcAV/rxDc7B6NaEreAvLHCKzEacArwdGGhIes3F+dnH
         754KCqC0DrJT4Guxwjfq02g08n5JTWpJhxggEebDGVe4iAJEWjBOKlTrwOnDoES05n1s
         gi1tikCyks6F3pFbBEIqjzccnHxiruwRzYma9kwvIup0ywxIdtp2quLZwk+LOC4umEOm
         SymSBx4WkYfbtbEfxyFHPvXb6wbWLlExxXEmIoZcwc8rZqUGz468JTdlL9hBX0JTlrQc
         4ppqYtW2JKAPOpazd9Zhkcdy946u4ZpSArcYgW/WA42qqI1K3O/QFTayYuSRleMmNGOK
         reUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=iEHoU21DH841tx0qtRTz5FbDxLZko2mQ4Z33po9e6hg=;
        b=UeVdh7oAnB+rcMMAewP1B3GefKZD56nHM4Cui+kyZSmoAc+ZU4scybojeVgvhdr8eA
         bYmtJM3h49IeFRXHo65MFzGLFHk5OEmM9N3Tv7L+HSToVbrWq3PYoHPESHRDYUvrh862
         xFZyw00gg/FVoxSftzLfD8eur82wmkrArpA0UVnXSaY80XW8MbdBPqFWIfE+yaqzPz/b
         14x7vz7/mshRt59t+hc3yKbZwa2beFXenBYr2pbXg184HIGbzUMylEFh1USEKy2Hy9j8
         4F6vzBHrPjo378VY41beRK6okH/9snMwUH0taABTKObsp84/bmzpW/cIByyag9qWvS/W
         Jang==
X-Gm-Message-State: AOAM532bvld5d1yLNJeRSpOy8kQ0GEYE/+0+KhUQoXWLh2XjD8neChQm
	YWlYkSu8M6o7tzzmC4u0COA=
X-Google-Smtp-Source: ABdhPJxlUEJPYCJsNzawytHIOiH/45imW9bnZmTk3fyUFhDaECmpAeFTIfch/BNrkh6Bn7sAykByHg==
X-Received: by 2002:adf:a549:: with SMTP id j9mr2799424wrb.353.1632517908646;
        Fri, 24 Sep 2021 14:11:48 -0700 (PDT)
Received: from localhost.localdomain (252.red-83-54-181.dynamicip.rima-tde.net. [83.54.181.252])
        by smtp.gmail.com with ESMTPSA id y64sm10344297wmc.38.2021.09.24.14.11.47
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 24 Sep 2021 14:11:48 -0700 (PDT)
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
Subject: [PATCH 6/6] staging: mt7621-pci: properly adjust base address for the IO window
Date: Fri, 24 Sep 2021 23:11:39 +0200
Message-Id: <20210924211139.3477-7-sergio.paracuellos@gmail.com>
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

