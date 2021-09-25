Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA5A22F80
	for <linux-staging@lists.linux.dev>; Sat, 25 Sep 2021 08:46:49 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id d21so34468254wra.12
        for <linux-staging@lists.linux.dev>; Sat, 25 Sep 2021 01:46:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7J/eKw85aOccYjSVMNGJibIwRKQiWh9ftrBZOBFy2g8=;
        b=TH1lvqPI5Wu0X6zAw/ADa05wm4/08lgsLaffdzbJD/hVw7xIE7cKD84HUkuVFkkP0J
         YtIAqQGpexosa0d323h5/PEE9czxilaHrtemk0pbCLfuO4OpT2/69uwxraez8axJMz0O
         TRil2Eqc57lk4TbjpxBy0UOvE3q/sI4DlTKzO+ZVnmXrTijSGDJ0a43K50HmjgD+CKPp
         s2kR8FfMdNMxa8VjyX4gSHitjKP/6+MRwdKZgczblrXNRWsLb3io7DNWkcqNCeeVe7PU
         c2sHVYKaFu8UtjBsFplFg3EUpeD8m0H3xvano+Ch41gjUoS/IvTZbsnPmXAHdl8C/lkI
         oWNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7J/eKw85aOccYjSVMNGJibIwRKQiWh9ftrBZOBFy2g8=;
        b=vsINQGAVyuJw4v5i0UtIGLBRy4TgdzT1RUytqMWF5sJzfyskk5zM1CLjQMxpCxE6Uj
         1h8BljwkDlNACaio1Oj6IQwn2TwAHezzvEK9OFreszzTifdZUCkG2Eb1FZxEDU9wa/FU
         vk5qnKr8ChV2dWHd2yFDPll7Mx9YqZGhAK8lcVnsNAji0Q9aLYrnj8bHbdXIyVM2nlmc
         gt3AnxpiJ8GRem8nMiXPNlhN3bKCg6eorMJQ/DT0XXaisUqbOYurq3H7BxYAa4dsd8pc
         5d38/Xp2/mxc/6f/d4a3i33QTZFWHy1Yqn1bBbp4QEJHa3Y2UWheqJsnDPTZ/j2cSD71
         fy7g==
X-Gm-Message-State: AOAM533EYWdZ7ZoaBeHkNrJWlymRtRNWfd5IKjjSrK64Crr+N1uPLncT
	QhByo/U5YzdZawe6yGyg090=
X-Google-Smtp-Source: ABdhPJwuVOqIQBjcBSCQWuS1vJce4ZX/Ly4UDRWJE94+zyyFnornpcUREkh3OAOu2o63wgKNseoM/w==
X-Received: by 2002:a05:6000:184e:: with SMTP id c14mr15982534wri.242.1632559608227;
        Sat, 25 Sep 2021 01:46:48 -0700 (PDT)
Received: from localhost.localdomain (252.red-83-54-181.dynamicip.rima-tde.net. [83.54.181.252])
        by smtp.gmail.com with ESMTPSA id y9sm17222997wmj.36.2021.09.25.01.46.47
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 25 Sep 2021 01:46:47 -0700 (PDT)
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
Subject: [PATCH v2 4/6] PCI: Allow architecture-specific pci_remap_iospace()
Date: Sat, 25 Sep 2021 10:46:39 +0200
Message-Id: <20210925084642.5642-5-sergio.paracuellos@gmail.com>
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

pci_remap_iospace() was originally meant as an architecture specific helper
but it moved into generic code after all architectures had the same
requirements. MIPS has different requirements so it should not be shared.

The way for doing this will be using a macro 'pci_remap_iospace' defined
for those architectures that need a special treatment. Hence, put core API
function inside preprocesor conditional code for 'pci_remap_iospace'
definition.

Acked-by: Bjorn Helgaas <bhelgaas@google.com>
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

