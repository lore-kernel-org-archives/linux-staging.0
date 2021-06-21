Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E259A2FB0
	for <linux-staging@lists.linux.dev>; Mon, 21 Jun 2021 13:50:38 +0000 (UTC)
Received: by mail-pf1-f170.google.com with SMTP id t8so3435444pfe.3
        for <linux-staging@lists.linux.dev>; Mon, 21 Jun 2021 06:50:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=dsT/DFkU4ugOnwiedTB/H/+aCFKE/gHvtAJo8gJ/4xU=;
        b=K3dPJFNfKnJZ9ImpJZQhUeZnOL6fNuVlMCtBJDlCFZ5UoW/3i6WdJeQdLzp11OK2P6
         5xHgQK/vQCIClkykiMXyXqCP3sESForvaOgw/drcxGFmXvrWVfXlclE7wHDoD9lhwqod
         w+0qART18gMaYAiYQ8NQHhVLOmPkhe20a3w0/MhVwqXKigSpR97C1Qfc2mD8YBLt8jPR
         6w7E4FOrt7D1gQ9kEXeBKCw0/Ah+kufyCDyaVkap4RPcE9YJHvYWknRsVIN67rwtDs4X
         kFxnCIiLOlYHOCWLLmgA21LMpHLphQ0zoOI2aECsqUJ3ViF4uXg7b5aMbdjr4arqZxw9
         bclw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dsT/DFkU4ugOnwiedTB/H/+aCFKE/gHvtAJo8gJ/4xU=;
        b=OZhOWRfH8yowTwgbMXRZkc2KC5/SOCmof/2J4fH8Kerr/eCrjakYAzhm1PQ+dd5kAz
         /6eJjKf2rY09ROB8Ndpvp2QX94p4i0nTr6H0iUMPE5gxxo9/njX7hOmQT/bf68Q+elfd
         WjUZ1wXwBye+uTKu6qHProHzw4XuGSOHvE0IW12xpFYB+Etebdk8N35rsgm8IM0jPqlT
         08gwnuStAoTneZ3nB8o+uMvT0uwc3g9DHioTo30RntaR7KZCLib456JIgICS9EyhyKib
         oFKrpDpWf9xNOLzR5pDlNNy2vN4hS6L7GnjsAbnyGRUTyvIIeV1WLMc6r8EPwxHHVJqA
         q/ow==
X-Gm-Message-State: AOAM5318L41xtHFqirQb02o9bUaQMeEjqNKguAa9BASCOFzphOpea0Ke
	aKkh6YhrCWT473z9K3HwM9qAs3FLRr3QUqWI
X-Google-Smtp-Source: ABdhPJw6Tgz/lB1hCgsHP0sq40v5fxcqZ5xkjpB/b36/FOB5gK+DiNaLs7bScNm/q8BVczc7ZhZF2A==
X-Received: by 2002:a62:f947:0:b029:2e9:c502:7939 with SMTP id g7-20020a62f9470000b02902e9c5027939mr19696390pfm.34.1624283438541;
        Mon, 21 Jun 2021 06:50:38 -0700 (PDT)
Received: from localhost ([209.132.188.80])
        by smtp.gmail.com with ESMTPSA id f13sm1147160pfe.149.2021.06.21.06.50.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jun 2021 06:50:38 -0700 (PDT)
From: Coiby Xu <coiby.xu@gmail.com>
To: linux-staging@lists.linux.dev
Cc: netdev@vger.kernel.org,
	Benjamin Poirier <benjamin.poirier@gmail.com>,
	Shung-Hsi Yu <shung-hsi.yu@suse.com>,
	Manish Chopra <manishc@marvell.com>,
	GR-Linux-NIC-Dev@marvell.com (supporter:QLOGIC QLGE 10Gb ETHERNET DRIVER),
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org (open list)
Subject: [RFC 09/19] staging: qlge: remove the TODO item of reorder struct
Date: Mon, 21 Jun 2021 21:48:52 +0800
Message-Id: <20210621134902.83587-10-coiby.xu@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210621134902.83587-1-coiby.xu@gmail.com>
References: <20210621134902.83587-1-coiby.xu@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

struct qlge_cq has one hole, but for the sake of readability (irq is one
of the Misc. handler elements, don't move it from after 'irq' to after
'cnsmr_idx' ), keep it untouched. Then, there is no struct that need
reordering according to pahole.

Signed-off-by: Coiby Xu <coiby.xu@gmail.com>
---
 drivers/staging/qlge/TODO | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/qlge/TODO b/drivers/staging/qlge/TODO
index cc5f8cf7608d..2c4cc586a4bf 100644
--- a/drivers/staging/qlge/TODO
+++ b/drivers/staging/qlge/TODO
@@ -6,7 +6,6 @@
   split cases.
 * the driver has a habit of using runtime checks where compile time checks are
   possible (ex. ql_free_rx_buffers(), ql_alloc_rx_buffers())
-* reorder struct members to avoid holes if it doesn't impact performance
 * avoid legacy/deprecated apis (ex. replace pci_dma_*, replace pci_enable_msi,
   use pci_iomap)
 * some "while" loops could be rewritten with simple "for", ex.
-- 
2.32.0

