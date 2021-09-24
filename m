Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 141BD3FC8
	for <linux-staging@lists.linux.dev>; Fri, 24 Sep 2021 21:11:48 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id t8so31340768wri.1
        for <linux-staging@lists.linux.dev>; Fri, 24 Sep 2021 14:11:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=I3qu/bakw/8LhQIXjaOEPV5SVnN+1i5mwJzI+2iO/oc=;
        b=XfmVM23a3TZXWTkk8M3V4KnzK7ODNPfeDEzYIrtlcC4fAb5l2Kd3kaOYpjqmcy6Y9A
         h5L295fq+DCQxENcW/PpuACnlSFNi7Y7EvKL35atOfZnC3hMZmWym7Xy5O656ZY2Yr6W
         n19/dOLk6H4BahbETJSPfTYf/mubMDW6nu/nOVqUMkeH+pP9/T2QWlE0CgTS8E1DG8vZ
         PydsndU15zlsBcDGmd9m2NeT2mq3VpF+BqoCsdWvPBFE4RsJ1NUr/ScbLUOvLuXcekBA
         vnF9R9hBxl8lSgXGOLKqSjBz6sKu5nKUlRXcmPAU1zS0juXIUCKiuT11Iyrgzj50JQ4J
         VTEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=I3qu/bakw/8LhQIXjaOEPV5SVnN+1i5mwJzI+2iO/oc=;
        b=J+P+ow/SSIS9V2gQTkZsI70ps15CD/WZJRU0HrHMJFhjk6pMaST+nTIcn+kMk1xs95
         5WFElyt4aRr+qqpDFytX6e8bWjKSAzMXXuYY/zBj2pv0fo7+X+yVbslPskBeeqzjjMdG
         Mx9vP98KXuhLBASJ+wtnvZGa0NxameKEQ+0N++Aeeq471pfVOzfqWMUP4Wf6KP5V7MY2
         JdyMrLDclZgiM8OeVjUo4VYKv9zSLDP+f1DW5QsvsLLDsAk1rg0EnkKkoVKnqI+Aojyc
         xn7aEKNFhrWlGpC799QTCvf2iNg3nDu3rqvS3StRW6s+3ESScYRTGCkhIarnyqXKmXkJ
         NniA==
X-Gm-Message-State: AOAM533DCDJgaHj3L8/xd7blOaID0Ed4iw0v3TdXvgmqx1p7WP894tA5
	rp3BM4vx5gW+BjtFghFvHlo=
X-Google-Smtp-Source: ABdhPJyyg9AbUZb+fEXLr9Lk4DY8+qYFpCQ1iqu6RBGl04PJnjfBWVpkdf90r95BHZlh8KVQMwlk7w==
X-Received: by 2002:adf:ed92:: with SMTP id c18mr13918812wro.86.1632517906559;
        Fri, 24 Sep 2021 14:11:46 -0700 (PDT)
Received: from localhost.localdomain (252.red-83-54-181.dynamicip.rima-tde.net. [83.54.181.252])
        by smtp.gmail.com with ESMTPSA id y64sm10344297wmc.38.2021.09.24.14.11.45
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 24 Sep 2021 14:11:46 -0700 (PDT)
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
Subject: [PATCH 4/6] PCI: allow architecture specific implementation of pci_remap_iospace()
Date: Fri, 24 Sep 2021 23:11:37 +0200
Message-Id: <20210924211139.3477-5-sergio.paracuellos@gmail.com>
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

pci_remap_iospace() was originally meant as an architecture specific helper,
but it moved into generic code after all architectures had the same requirements.
MIPS has different requirements so it should not be shared. The way for doing
this will be using a macro 'pci_remap_iospace' defined for those architectures
that need a special treatement. Hence, put core api function inside preprocesor
conditional code for 'pci_remap_iospace' definition.

Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
---
 drivers/pci/pci.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
index ce2ab62b64cf..0ec57bb01a88 100644
--- a/drivers/pci/pci.c
+++ b/drivers/pci/pci.c
@@ -4123,6 +4123,7 @@ unsigned long __weak pci_address_to_pio(phys_addr_t address)
  * architectures that have memory mapped IO functions defined (and the
  * PCI_IOBASE value defined) should call this function.
  */
+#ifndef pci_remap_iospace
 int pci_remap_iospace(const struct resource *res, phys_addr_t phys_addr)
 {
 #if defined(PCI_IOBASE) && defined(CONFIG_MMU)
@@ -4146,6 +4147,7 @@ int pci_remap_iospace(const struct resource *res, phys_addr_t phys_addr)
 #endif
 }
 EXPORT_SYMBOL(pci_remap_iospace);
+#endif
 
 /**
  * pci_unmap_iospace - Unmap the memory mapped I/O space
-- 
2.25.1

