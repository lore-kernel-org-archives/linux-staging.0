Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1D8A3FD6
	for <linux-staging@lists.linux.dev>; Sat, 25 Sep 2021 08:46:47 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id t18so34642108wrb.0
        for <linux-staging@lists.linux.dev>; Sat, 25 Sep 2021 01:46:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=OyR/G6OXJUzzgXbsVp3sTRgTYQYfQEC/z3g1X2aYcVs=;
        b=Ve5h4llJBbg+a9UGjsfI2LkC6Tty/m1yswQbTIaTUjASf3eUBFomFWIv3s1iqUj1zD
         ks+oXPxs6vEk3iRog76+HBY29NElVilHQzVnA2+ecBRG/ODxFiDcT/LCUySr5YInBpfc
         07MIIIXjHMPcuVM95jcPa9tVXJncbQe/mrU0uCLsyNMElvf0VIm37LmLNxAaFl3KqKs8
         JYbl9IzgvhHzJho1rYgCh7CMm452s2dUwju59OMASmmCi/owxBnlUdmjnZff5kJcmCoL
         i09EvltS53cK58I8lXQDfcNiiJwP/QqiB8iHqgUZWUtGUWJVw33ikXCudmh6YEZNG5tx
         CsvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OyR/G6OXJUzzgXbsVp3sTRgTYQYfQEC/z3g1X2aYcVs=;
        b=QHSes5FUaTuyuAPiy3uCzt0mF1mYUbnTQTg6uGERy7FL7R6fOLzYJ678GUf4KBeZGw
         CiaOtnJsYGsatNAPaT00zeGGWuP3sz4Ncvqfv62DErD+i7EGxRF4LFk/jXrdZdaxCrKF
         oytJ2zqOmO1oRLSMUsBwdc8xq4TvZtH6nMCeOzh4Weq4yAxid3T4/xuYqQbqNrvhtqGZ
         5tFIOVW7URaJRtDfX9wOfOz46TFwOysv5FqNNodxeKH/qP5bSsdu+1Pg0OmBC8sxR8zV
         PGfNiq9atOkdoT57xdDu3fIcUFYJuSr2Ob73JBjBpsMwIHgXWBl7+q/8FMe4tkvw3fei
         1SAg==
X-Gm-Message-State: AOAM530Pq77T14u+YiKXDcuxxt+p7XHAJ6u2B6PGvUWd0Oy/tI5exRJI
	erGvF0SnEgDWrhkC6XcxLic=
X-Google-Smtp-Source: ABdhPJxrdMP9CEP1wL+ipHaMl9NqnnbgtNcHgIxgUCsjqPj7hjtBA5Xxk78r6uj30mhTf8XuyDbchg==
X-Received: by 2002:a5d:64a7:: with SMTP id m7mr16103528wrp.171.1632559606127;
        Sat, 25 Sep 2021 01:46:46 -0700 (PDT)
Received: from localhost.localdomain (252.red-83-54-181.dynamicip.rima-tde.net. [83.54.181.252])
        by smtp.gmail.com with ESMTPSA id y9sm17222997wmj.36.2021.09.25.01.46.45
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 25 Sep 2021 01:46:45 -0700 (PDT)
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
Subject: [PATCH v2 2/6] Revert "staging: mt7621-pci: set end limit for 'ioport_resource'"
Date: Sat, 25 Sep 2021 10:46:37 +0200
Message-Id: <20210925084642.5642-3-sergio.paracuellos@gmail.com>
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

