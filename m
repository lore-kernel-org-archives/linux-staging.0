Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9D7B72
	for <linux-staging@lists.linux.dev>; Wed,  5 May 2021 12:17:43 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id n205so1313146wmf.1
        for <linux-staging@lists.linux.dev>; Wed, 05 May 2021 05:17:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=x8StihhasIcYGsDElZDuPRVB9VAfrBlXEHGxAUrNnf8=;
        b=tD/cUP0enepDjd0XPyXXEE1JiuQ6o64Rrv6E08JCWIxL7AWTh0hy+9JfyOo9nNp8JN
         l9D611yTrUhKf5i44N7tNmRew8+WH5oJoaI3d8rvkAhZsy1LdW0Zg/BLHXG5bZWNcINa
         EFgIcN0dPfWIDD9GiMoOnMmHE9W+RIVqksyMbQbHpTRdLMJasoKq3+tgHdEUBoDGK6QL
         jVH6kTo960mtZ08o8YGxWJJovZnXXAqEbON9jdWaP5GWPpKiPh8h4I5bb4vPTZgDYzDH
         MDbc6CKlTGHWlHO79kAbyeisHBv2rR99OW6iauaAerzUnB/tnqQhStFcfXiXgaqJ55o1
         XiqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=x8StihhasIcYGsDElZDuPRVB9VAfrBlXEHGxAUrNnf8=;
        b=uE44YK0dKazqjqan31Ab2ykK+MpVAxeaEZAb1tHZVn+r+yROzbl+e8vFY6EUcHoTgH
         fpvxDRIfYZ73ie7bDZpX/XExKWgAuwIzl9oxtG7eRopCWjB+CgNY9mU2L364IcM2lim4
         j+P0fHum6CdFy8MCBMyVFEVXdaP/fgEyLxouFM6uo/VHckHXAlhj3eD1lnV8cGXiBFAG
         PPqMR+VVHYYsVq/+xzv2H8GttaqWCK7A3/NCGbi9mfWBBwAGDtIjZH2AOVcpvn9QNx7K
         q5goc+hKjBngsyHa/UvvrWYjXAWRtLtnYanIQ186LaIWNnUAGamqI7r/lOUSWpfVhsx0
         G5ZA==
X-Gm-Message-State: AOAM531KmYxMZHRneRA5wPye3+aAuFVIvuSKOeDyWlooD5mZdv3MdeS6
	Dfz+QYMInLcA/bljUr2ME2uXAHn8lWtf5A==
X-Google-Smtp-Source: ABdhPJxP9or67F5jTTcJkKbve4vBvcmD9nDaFciDbHrEu9+8peLrOrUNpgCWJEUrqfsuyFU90ecpvg==
X-Received: by 2002:a05:600c:2e42:: with SMTP id q2mr33166951wmf.64.1620217062300;
        Wed, 05 May 2021 05:17:42 -0700 (PDT)
Received: from localhost.localdomain (231.red-83-51-243.dynamicip.rima-tde.net. [83.51.243.231])
        by smtp.gmail.com with ESMTPSA id p17sm19067896wru.1.2021.05.05.05.17.41
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 05 May 2021 05:17:41 -0700 (PDT)
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
To: linux-staging@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	neil@brown.name,
	ilya.lipnitskiy@gmail.com
Subject: [PATCH 04/10] staging: mt7621-pci: group io resource assignments all together
Date: Wed,  5 May 2021 14:17:30 +0200
Message-Id: <20210505121736.6459-5-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210505121736.6459-1-sergio.paracuellos@gmail.com>
References: <20210505121736.6459-1-sergio.paracuellos@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

To improve a bit readabily group all the IO resource related
assignments together.

Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
---
 drivers/staging/mt7621-pci/pci-mt7621.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/mt7621-pci/pci-mt7621.c b/drivers/staging/mt7621-pci/pci-mt7621.c
index 1b3d6ba0b85a..296f50fb3571 100644
--- a/drivers/staging/mt7621-pci/pci-mt7621.c
+++ b/drivers/staging/mt7621-pci/pci-mt7621.c
@@ -284,17 +284,17 @@ static int mt7621_pci_parse_request_of_pci_ranges(struct pci_host_bridge *host)
 	 * well for MIPS platforms that don't define PCI_IOBASE, so set the IO
 	 * resource manually instead.
 	 */
-	pcie->io.name = node->full_name;
-	pcie->io.parent = pcie->io.child = pcie->io.sibling = NULL;
 	for_each_of_pci_range(&parser, &range) {
 		switch (range.flags & IORESOURCE_TYPE_BITS) {
 		case IORESOURCE_IO:
 			pcie->io_map_base =
 				(unsigned long)ioremap(range.cpu_addr,
 						       range.size);
+			pcie->io.name = node->full_name;
 			pcie->io.flags = range.flags;
 			pcie->io.start = range.cpu_addr;
 			pcie->io.end = range.cpu_addr + range.size - 1;
+			pcie->io.parent = pcie->io.child = pcie->io.sibling = NULL;
 			set_io_port_base(pcie->io_map_base);
 			break;
 		}
-- 
2.25.1

