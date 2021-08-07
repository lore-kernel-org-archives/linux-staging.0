Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 423BA2F80
	for <linux-staging@lists.linux.dev>; Sat,  7 Aug 2021 07:24:16 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id b13so14000658wrs.3
        for <linux-staging@lists.linux.dev>; Sat, 07 Aug 2021 00:24:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=R7ftxM96YAq/VWL5+bWMfsnR3bh1EBHc546zzPpFbiU=;
        b=sZLLxwEWV9J5yunhWg5//rALHj1gZZePQ7WsHujX4g9G03lxTND/mt4PkF5sMPYH+Q
         hrgWKrSW1DcTIfVsl9klcZlPu6SEvoffobF9yNgm6Irnj44wOP42jOqSb5bPnac+BZnN
         IRjOIDOKn71LkpnDNl0UW224yDmIxUMxp6xzQ2027jrwrKGbknmOXkMmXHM1qDQ5e6f6
         Rhc/XiJO1j6Ftsx+WQU6RG9WcVRJZ9xnPcOW09YrDiKXmYjDr/Z6QswQVVjs1k2Vhs4n
         ttQMkVrb1tTGHBJENXW4N1QwKjQ0uRedyOxjyFohwu5uoxsFKLQ/rTIpceY8vFlM/ch+
         pi/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=R7ftxM96YAq/VWL5+bWMfsnR3bh1EBHc546zzPpFbiU=;
        b=e2htng+WUFrPTYBTANWyvB/wk7ySDkjuNxYmncSgx/NSIT6LIIkbAp2UfUAFTSbnq7
         MFaHkvC0rXIxwhlb7poJP59l3vAzorcfUSrjaBcLETwU4ioSvX+/NVmwCWygOT9XCnmL
         sYG8O3n56JkGl/4QJHsqyOmRe0xpJBYen0lZL76kQ4Psyh47Lm75NVAL13jZqWr23x8C
         WIBrQ1KR/hWqyAErRCDPOlcsjp+55Hpb8CgSrqCRM6/j4KvaC8U5soK+eMugGSLY733l
         gqszzwSRwhtnMOqrXd5cxNOA+LPRc9G7p4IZtDcq4sfWgKSoUp6AoDJx/Key3oEBLFRC
         CVLQ==
X-Gm-Message-State: AOAM531PQIfHkrgDPojYzWYZ5y5aMWUmfwu70CZJ6AnzUC2PJ2HK6klr
	GmFuBXT9OB64947ulYMvorQ=
X-Google-Smtp-Source: ABdhPJwNGEq+ZFP/ntg1NMH8/P4Ab2bebvv/2QrPdAwubsH8gqoIAFfnziwWMZ31+U5xcL5/IR4Xtw==
X-Received: by 2002:a5d:5147:: with SMTP id u7mr14634265wrt.181.1628321054751;
        Sat, 07 Aug 2021 00:24:14 -0700 (PDT)
Received: from localhost.localdomain (10.red-83-57-27.dynamicip.rima-tde.net. [83.57.27.10])
        by smtp.gmail.com with ESMTPSA id g5sm13915017wmh.31.2021.08.07.00.24.13
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 07 Aug 2021 00:24:14 -0700 (PDT)
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
To: tsbogend@alpha.franken.de
Cc: bhelgaas@google.com,
	matthias.bgg@gmail.com,
	gregkh@linuxfoundation.org,
	linux-mips@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-staging@lists.linux.dev,
	neil@brown.name,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] staging: mt7621-pci: set end limit for 'ioport_resource'
Date: Sat,  7 Aug 2021 09:24:09 +0200
Message-Id: <20210807072409.9018-4-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210807072409.9018-1-sergio.paracuellos@gmail.com>
References: <20210807072409.9018-1-sergio.paracuellos@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We have increase IO_SPACE_LIMIT for ralink platform to get PCI IO resources
properly handled using PCI core APIs. To align those changes with driver
code we have to set 'ioport_resource' end limit to IO_SPACE_LIMIT to avoid
errors.

Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
---
 drivers/staging/mt7621-pci/pci-mt7621.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/staging/mt7621-pci/pci-mt7621.c b/drivers/staging/mt7621-pci/pci-mt7621.c
index 691030e1a5ed..6301397c3987 100644
--- a/drivers/staging/mt7621-pci/pci-mt7621.c
+++ b/drivers/staging/mt7621-pci/pci-mt7621.c
@@ -522,6 +522,8 @@ static int mt7621_pci_probe(struct platform_device *pdev)
 	if (!dev->of_node)
 		return -ENODEV;
 
+	ioport_resource.end = IO_SPACE_LIMIT;
+
 	bridge = devm_pci_alloc_host_bridge(dev, sizeof(*pcie));
 	if (!bridge)
 		return -ENOMEM;
-- 
2.25.1

