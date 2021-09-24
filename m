Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 038D53FCC
	for <linux-staging@lists.linux.dev>; Fri, 24 Sep 2021 21:11:45 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id t28so17789382wra.7
        for <linux-staging@lists.linux.dev>; Fri, 24 Sep 2021 14:11:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=OyR/G6OXJUzzgXbsVp3sTRgTYQYfQEC/z3g1X2aYcVs=;
        b=U+vJPGAxYG540bH5jV7NX7OpXK5kcakRlMMMOAE88V+10eHOaRVf9WET7nVoo4BCYK
         U6x2xqgSI7d9lu5+DIm7LeT10jAf+s2DcYJtd9mzkTQS0pXH0xrMZJAI1OcdvMYAGK3v
         DHir/VhLYLnPTF8ElRQz8n33B+jzEHp6lnCw7O7F3k4ccHbBu+VXEW6j1iCpu0NdBVUc
         2aDtdnXNYBJwqDfV5XX2gCayCJEAAydMoC5B86qyUp9LbZGXA7UzskL8F8785InymAtq
         eYMKYrhrFNra/0yzqhjWLkN4QnWuPxWrRhCtRa4k0N7DNjwKdBRnlIapwIQ8NJaF1AFI
         8u7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OyR/G6OXJUzzgXbsVp3sTRgTYQYfQEC/z3g1X2aYcVs=;
        b=U1XhQPCuMsFObzJ28u2G3L3HeTnIPubIflZRvc9UlyIVxOit9CD9qYZFyVV53xcHF0
         2nHx/PVCkEDzUfd/znK73PdyEDCgIkELxNyzZytNjvyYlwC2BE96qntVnGablF2SAYqf
         yWZUOLFK5KhIPaToBlwe9tAn+DdnKX6X9p9guc+iIVEAblTe7IexH9OViqLPHLTqU0+G
         F4UtH7EbYcWyc+2xTz5BOOQPZY00pJqTalhTGEltQZ+9SgKG7hm+GYC4bZ8tSd+7+4qW
         MaHdNUS1S1iEdpdhMrsucxP/CeYI92R2/s3X5PvFdHgkb+jTDnWsuN3mCOsfwLRhKBq2
         EG+Q==
X-Gm-Message-State: AOAM532FCaXQUwCvAsp9DNExL8IyxmtrdFxh6EcTNSl4tIvABwF4mstK
	hP3AAVCAqP2oPla6+00dUpg=
X-Google-Smtp-Source: ABdhPJxsqQ7CQbB882G/Opgnfqeh4McKw5bFQkjiLaO0XftIVxWdCOu2Mr1R7/kvq0H+w2yIRZ9W0A==
X-Received: by 2002:a5d:64ca:: with SMTP id f10mr13408326wri.93.1632517904436;
        Fri, 24 Sep 2021 14:11:44 -0700 (PDT)
Received: from localhost.localdomain (252.red-83-54-181.dynamicip.rima-tde.net. [83.54.181.252])
        by smtp.gmail.com with ESMTPSA id y64sm10344297wmc.38.2021.09.24.14.11.43
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 24 Sep 2021 14:11:44 -0700 (PDT)
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
Subject: [PATCH 2/6] Revert "staging: mt7621-pci: set end limit for 'ioport_resource'"
Date: Fri, 24 Sep 2021 23:11:35 +0200
Message-Id: <20210924211139.3477-3-sergio.paracuellos@gmail.com>
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

This reverts commit 50fb34eca2944fd67493717c9fbda125336f1655.

Since IO_SPACE_LIMIT is not really being changed there is no
real need to adjust the ioport_resource end limit.

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

