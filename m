Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BAD671
	for <linux-staging@lists.linux.dev>; Mon, 21 Jun 2021 13:50:48 +0000 (UTC)
Received: by mail-pj1-f53.google.com with SMTP id 13-20020a17090a08cdb029016eed209ca4so23532pjn.1
        for <linux-staging@lists.linux.dev>; Mon, 21 Jun 2021 06:50:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0mYZSPKTpWCjYpalvYE2jEBITq0KmYxfwhSJMx4IyFU=;
        b=KSxiYOtMd5eVo3XoXGvB1wIDNFa3/+K+/9GQn5OWFCgdWXTIBzoE0frECCZdB3bFSN
         E6J+B3SI9PzgePBducLKDMtsQ5fdbuE7+6MBBQ99b/Xe0zpG+NolavSk/5+M7E6P6D+7
         ek1dk1xjf7kF3EEHtrVtoWK8/m4Zg2ccPJZgQl1P/0hIyYPbMBqHLis9oq//I+XgR0DZ
         57x2LPLwpnncFY4bQ2oRAefVerf4EgqO0ybIv/NeTiotSyLn1HI1SQ9reUaQqP9ulahu
         W0egIP/HhUgSY46/YsdqKRS3gfCG/Ak9s319H73GOxZ4+vHrd9exdjsTlMN6AmWgQD7h
         h0cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0mYZSPKTpWCjYpalvYE2jEBITq0KmYxfwhSJMx4IyFU=;
        b=B2DKkiWr7fqc8I+7y7q9IZyH2Vb53BBtFItJsWImw109I2q1ML2bS6/zNzfhddzWZC
         8LJyBqrZRm3zVX01V/WqPhrq3E4UwiEcoQ8sarD4kmB1Gs3R2FSNtmbT7DDpaeJ3JKOI
         riMeTvB5LEjf2xdSv1goXfpMOT9zCMzpvUDflB2ibcw91Lt7yHAYdx7+6LPtnsMhLaZs
         BY1DBwzd/+iN0DzbxoMagiZmE6rsXofRVL4rKg8ISkm+/VYvMplyWTTqhA6Hgl+vaOXy
         E+oIN57TpyD2W6VHL7YuQqAIRwOTu6251iVkB9CUOsYufJAVnkLJzNaHmcegO80iZg7W
         qq1A==
X-Gm-Message-State: AOAM532kL93SZ3G6Fj3MGvAG8GrJfDaEm48Cz7PmTDcbn+D8IJTDDzNB
	gK8ojhiAYJwv3W8myLhBhF0l5cXiSFbDNxaq
X-Google-Smtp-Source: ABdhPJzmjRCxXPd5Y2US1enITpczMMJEqXsf/QB7GL1eAze9xbXlZQi4mbwKC2CG8TOcHP0sU9oDsg==
X-Received: by 2002:a17:902:14b:b029:119:ef6b:8039 with SMTP id 69-20020a170902014bb0290119ef6b8039mr17948896plb.84.1624283447704;
        Mon, 21 Jun 2021 06:50:47 -0700 (PDT)
Received: from localhost ([209.132.188.80])
        by smtp.gmail.com with ESMTPSA id b20sm16914967pgm.30.2021.06.21.06.50.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jun 2021 06:50:47 -0700 (PDT)
From: Coiby Xu <coiby.xu@gmail.com>
To: linux-staging@lists.linux.dev
Cc: netdev@vger.kernel.org,
	Benjamin Poirier <benjamin.poirier@gmail.com>,
	Shung-Hsi Yu <shung-hsi.yu@suse.com>,
	Manish Chopra <manishc@marvell.com>,
	GR-Linux-NIC-Dev@marvell.com (supporter:QLOGIC QLGE 10Gb ETHERNET DRIVER),
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org (open list)
Subject: [RFC 10/19] staging: qlge: remove the TODO item of avoid legacy/deprecated apis
Date: Mon, 21 Jun 2021 21:48:53 +0800
Message-Id: <20210621134902.83587-11-coiby.xu@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210621134902.83587-1-coiby.xu@gmail.com>
References: <20210621134902.83587-1-coiby.xu@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following commits have finished the job,
- commit e955a071b9b3e6b634b7ceda64025bfbd6529dcc  ("staging: qlge:
  replace deprecated apis pci_dma_*")
- commit 50b483a1457abd6fe27117f0507297e107ef42b2 ("qlge: Use
  pci_enable_msix_range() instead of pci_enable_msix()")

Signed-off-by: Coiby Xu <coiby.xu@gmail.com>
---
 drivers/staging/qlge/TODO | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/qlge/TODO b/drivers/staging/qlge/TODO
index 2c4cc586a4bf..8bb6779a5bb4 100644
--- a/drivers/staging/qlge/TODO
+++ b/drivers/staging/qlge/TODO
@@ -6,8 +6,6 @@
   split cases.
 * the driver has a habit of using runtime checks where compile time checks are
   possible (ex. ql_free_rx_buffers(), ql_alloc_rx_buffers())
-* avoid legacy/deprecated apis (ex. replace pci_dma_*, replace pci_enable_msi,
-  use pci_iomap)
 * some "while" loops could be rewritten with simple "for", ex.
   ql_wait_reg_rdy(), ql_start_rx_ring())
 * remove duplicate and useless comments
-- 
2.32.0

