Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E21B73FCB
	for <linux-staging@lists.linux.dev>; Sat, 25 Sep 2021 20:32:29 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id d6so38129497wrc.11
        for <linux-staging@lists.linux.dev>; Sat, 25 Sep 2021 13:32:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=oY+ehST4wA6FiZDaz59HXjjwDmgVx1fzGmc8GDxtC+8=;
        b=n4M61+uEZFS1EockQ3PZFF5TgXu3qhFC/4VdpqCXW1ywiyuUuMZgPqxTgm7qPJLfGC
         uAy1c0jSgM33eFOZUGAJ+5+xVYqc544jDnlbGzW9a30fBK1NBGA4L+b2v90yA7FhYZM6
         6xZtyVxbfNTY/0B461sTYKXObRg5MFflLuytA+cUi0ppY6n2x3SgVVKaQ8bP4sH2l7x/
         apCcVo/je2+jwWqyd5lmLNpj+RYf64j2jAvOcApJZ8/sQgHemC0vgJbz07nPP1Irpn+u
         PFplbG50nEdZEdQM/A9f6Jap9dXTCoFDizgP3RB56mvdZptLbku14vd7qScoSF5Z6FhI
         DolA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=oY+ehST4wA6FiZDaz59HXjjwDmgVx1fzGmc8GDxtC+8=;
        b=uhCq7J4A7mAkjedL7R8zoR+vAihx0XieYFJzNs+WQPqYhsD8B7nhf/srtmACxkuIed
         9xmLqmNp3ejxYZ5ON6wC25j+SAr3ksuNclpXEHkgOJi0aOPzgx3n+IpDdIH9pRhmfAEU
         UgmTXwZ6lGEyYU+8Wo8kIP0LmbEJ5VNr6948K4nfd2/yg1htwTMQt4bICBK39Va9VG6U
         yOxdqY/IAcaMDQc/xSBV13SIpcmXu6WhA+84LB4W6T6Su3bRR7XM0EcehNvhl51xBuUN
         rsfiIzmDF/+lo3hfnAhJbmyGTw0KQxi9DZ189AAp9nYRkP1Nqe55Bgw7qlYbnXvkEcuF
         iXeA==
X-Gm-Message-State: AOAM531FfyjbexAUvyi7Q5lf3fKkmqtH5qeFvisrz0g8PrBdosP+8CoG
	dejeJ82brAIfGiTGREQP6K0=
X-Google-Smtp-Source: ABdhPJzFetuuD8I1kF2Kxi1e7fnCMBC2vyQnEn9VwPsSUkTNiO5tfoUQ9VfUAozd2orCAEjRt70gFA==
X-Received: by 2002:a7b:c932:: with SMTP id h18mr8228480wml.112.1632601948320;
        Sat, 25 Sep 2021 13:32:28 -0700 (PDT)
Received: from localhost.localdomain (252.red-83-54-181.dynamicip.rima-tde.net. [83.54.181.252])
        by smtp.gmail.com with ESMTPSA id a202sm16703279wmd.15.2021.09.25.13.32.27
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 25 Sep 2021 13:32:28 -0700 (PDT)
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
Subject: [PATCH v3 2/6] Revert "staging: mt7621-pci: set end limit for 'ioport_resource'"
Date: Sat, 25 Sep 2021 22:32:20 +0200
Message-Id: <20210925203224.10419-3-sergio.paracuellos@gmail.com>
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

This reverts commit 50fb34eca2944fd67493717c9fbda125336f1655.

Since IO_SPACE_LIMIT is not really being changed there is no
real need to adjust the ioport_resource end limit.

Acked-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
---
 drivers/staging/mt7621-pci/pci-mt7621.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/mt7621-pci/pci-mt7621.c b/drivers/staging/mt7621-pci/pci-mt7621.c
index 86d9c3d122e2..6acfc94a16e7 100644
--- a/drivers/staging/mt7621-pci/pci-mt7621.c
+++ b/drivers/staging/mt7621-pci/pci-mt7621.c
@@ -526,8 +526,6 @@ static int mt7621_pci_probe(struct platform_device *pdev)
 	if (!dev->of_node)
 		return -ENODEV;
 
-	ioport_resource.end = IO_SPACE_LIMIT;
-
 	bridge = devm_pci_alloc_host_bridge(dev, sizeof(*pcie));
 	if (!bridge)
 		return -ENOMEM;
-- 
2.25.1

