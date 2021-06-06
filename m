Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7910170
	for <linux-staging@lists.linux.dev>; Sun,  6 Jun 2021 16:14:04 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id i94so9542921wri.4
        for <linux-staging@lists.linux.dev>; Sun, 06 Jun 2021 09:14:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=MoitULi38CJJXeZlMzfQ2pvR18AZWjF68eD2xzdCDzs=;
        b=ErssDyysZevVSbbHyGCTadMsnQcb8Y3HoqI4uF0b3/07vTNQc5bJK8VOg8ieMKkW75
         aC2ERx6yor1Y4wvhZnU4LerwockkaodfkVjDmou6GElzCX0kJ83Pu5Nos4WLi4ClkDZN
         YOr31yx8GsGYbEJVEh5j4QjB0N6DUYP5D7wo0VA3D31/SNvK91Eodhx6FGj0TErDg0lq
         IVZk+4oVYuR7HQfcIMpSnNfpFXKiQjFu+rGT2uQ0HmUx8zTWhGv8vMePGZBnZ96W++hv
         PqGTiLe/+jfdYPsQOaaxxVfY/snxzVDSfMnNlolJGHyMGTh/ATqVrn4IPo7O96zGmZpP
         UF7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MoitULi38CJJXeZlMzfQ2pvR18AZWjF68eD2xzdCDzs=;
        b=iTV+BRbKQDOs/dy7LxB+R0V3TfART1kvERQ1F8+rNrbVMiEhJ14ODmRXc2iDeWLcg9
         UjuikLORBJl6YoakiFIcQgxULi8hCFZw+kj9+rt9NoRFNqbSEZXvJ0EkwDR7n2WVJfko
         79/0WjbGuVTaecTMeaEj3q8kh5saYbjXJshVlXGC1yfi9kzJMmwOR2Y2FZymFKkmJqwR
         l3oecFCw0nt2pqpSBFLNWayoporKAdeZBw2XAljQmmyqHihsVBNj9qzPQ3oLmkQyvIG6
         B1hUtvokM2kr7cEiL+hdgT/eayre7PF4YMp4vejEnIni8qT1048RxRvT09W1Qv0eluM/
         ZAIg==
X-Gm-Message-State: AOAM532+/pyK0SoNwqLIOMVtDyv2IWh+/byguGOZAxjbApvr8uZ+ddef
	923aDhacLIJNgr2KemV7HOOdM5wImWXYFg==
X-Google-Smtp-Source: ABdhPJxOZx8sAljP7ArAr2XcZLOG+TZ09Idl0YBqwNWki6EhBEDGA7scTECWdnhs4j4M2kcBYVQMfQ==
X-Received: by 2002:adf:a353:: with SMTP id d19mr13563234wrb.363.1622996042874;
        Sun, 06 Jun 2021 09:14:02 -0700 (PDT)
Received: from localhost.localdomain (113.red-88-4-247.dynamicip.rima-tde.net. [88.4.247.113])
        by smtp.gmail.com with ESMTPSA id n9sm11724427wmc.20.2021.06.06.09.14.02
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 06 Jun 2021 09:14:02 -0700 (PDT)
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
To: linux-staging@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	neil@brown.name
Subject: [PATCH v2 2/6] staging: mt7621-pci: remove 'RALINK_PCI_BAR0SETUP_ADDR' definition
Date: Sun,  6 Jun 2021 18:13:54 +0200
Message-Id: <20210606161358.7114-3-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210606161358.7114-1-sergio.paracuellos@gmail.com>
References: <20210606161358.7114-1-sergio.paracuellos@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Instead of define RALINK_PCI_BAR0SETUP_ADDR just use standard
pci defnition for this which is 'PCI_BASE_ADDRESS_0'.

Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
---
 drivers/staging/mt7621-pci/pci-mt7621.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/mt7621-pci/pci-mt7621.c b/drivers/staging/mt7621-pci/pci-mt7621.c
index c14fc48e74fc..b83c338a2e3d 100644
--- a/drivers/staging/mt7621-pci/pci-mt7621.c
+++ b/drivers/staging/mt7621-pci/pci-mt7621.c
@@ -47,7 +47,6 @@
 #define MT7621_PCIE_OFFSET		0x2000
 #define MT7621_NEXT_PORT		0x1000
 
-#define RALINK_PCI_BAR0SETUP_ADDR	0x0010
 #define RALINK_PCI_ID			0x0030
 #define RALINK_PCI_CLASS		0x0034
 #define RALINK_PCI_SUBID		0x0038
@@ -494,7 +493,7 @@ static void mt7621_pcie_enable_port(struct mt7621_pcie_port *port)
 
 	/* map 2G DDR region */
 	pcie_write(pcie, PCIE_BAR_MAP_MAX | PCIE_BAR_ENABLE,
-		   offset + RALINK_PCI_BAR0SETUP_ADDR);
+		   offset + PCI_BASE_ADDRESS_0);
 
 	/* configure class code and revision ID */
 	pcie_write(pcie, PCIE_CLASS_CODE | PCIE_REVISION_ID,
-- 
2.25.1

