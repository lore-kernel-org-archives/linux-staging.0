Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB00E2FAE
	for <linux-staging@lists.linux.dev>; Fri, 24 Sep 2021 21:11:44 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id d6so31056511wrc.11
        for <linux-staging@lists.linux.dev>; Fri, 24 Sep 2021 14:11:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/Wb71HqjEOUF7N4+48DrIALQ2aRBPLW7pWxHbo6fkmE=;
        b=BusIi8Wf3opfOwB9LOvTJkb0RBGN9c/AZMXhKEu4/Zd/WTaN08+/I75PzRUBOSkaoW
         e0EI+VltJpRJs0yUoDiq2JYVEUQGNuMf0SFb38p2kayOyEtoK/eCwcDrP5gRqU2UnCDl
         UUVFQLK9insrtEsq/sFDGKJjYrE2zMrGGiakhDn8H79RsS0YQOQgMA3Chl1Syecv+7cM
         B/2iF+pqUOMGWWOIZO1cQTKjC8VxOSJruJ+7+jwKVIafQcIOhL+P39juIlH1LgkcWJj9
         m+15mdSxhi5pDVGUh8eaYX1H4CnUuCfIvbMnomiLuN/cNbltXvHIOxe/T4da0YYuEi0K
         d/og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/Wb71HqjEOUF7N4+48DrIALQ2aRBPLW7pWxHbo6fkmE=;
        b=xNG5Hlk/ljPNArdywLm2zfdQRljVKLBh2p/pmiHCGxl7bWSROXsjiN7scd7XIOpNru
         hkNhpjul6j157MKV2qoWo1KB8lliX6wphinKJ4oYy/oJJuQXIfYyxl/UFgXheBwITLoE
         2qZ3lpMK1Z7GxhBnu4ltfp6gf8ZlppHi5yZiitazrf79LwjVqDmXAfIfP9lbSfhC2qLx
         ox/thziG3IQFaCZ0btQbWK9EHLogE86zh/XnqiPG9W7Iq8w/Z9/+fGPmc9gT790ng+7J
         QcpGDCxYN4HxwBffNMwBG0jl6bRg2/Min++fAEQC3Ewl4t1HjfO+4BjccmmhlCxu0E3R
         igPg==
X-Gm-Message-State: AOAM531X3/ZQeOiuZZq+o1pZReFuSDJQoi4IdIkPIZhNc7lh6VfJ/JRG
	b2/JQFz1VMu8WEyXQC00/d8=
X-Google-Smtp-Source: ABdhPJwPb2VG2AAM5DJqJrFmCevyaxdyzhF4Xp4YRXzrfAKWASEzuLIa1qyzO7+829+r7vINf5tQXQ==
X-Received: by 2002:adf:ecc9:: with SMTP id s9mr14287341wro.2.1632517903364;
        Fri, 24 Sep 2021 14:11:43 -0700 (PDT)
Received: from localhost.localdomain (252.red-83-54-181.dynamicip.rima-tde.net. [83.54.181.252])
        by smtp.gmail.com with ESMTPSA id y64sm10344297wmc.38.2021.09.24.14.11.42
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 24 Sep 2021 14:11:43 -0700 (PDT)
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
Subject: [PATCH 1/6] Revert "MIPS: ralink: don't define PC_IOBASE but increase IO_SPACE_LIMIT"
Date: Fri, 24 Sep 2021 23:11:34 +0200
Message-Id: <20210924211139.3477-2-sergio.paracuellos@gmail.com>
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

This reverts commit 159697474db41732ef3b6c2e8d9395f09d1f659e.

There is no real need to increase IO_SPACE_LIMIT if PCI_IOBASE
is properly set to 'mips_io_port_base'. Hence revert this commit
first before doing anything else.

Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
---
 arch/mips/include/asm/mach-ralink/spaces.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/mips/include/asm/mach-ralink/spaces.h b/arch/mips/include/asm/mach-ralink/spaces.h
index 31a3525213cf..87d085c9ad61 100644
--- a/arch/mips/include/asm/mach-ralink/spaces.h
+++ b/arch/mips/include/asm/mach-ralink/spaces.h
@@ -2,7 +2,9 @@
 #ifndef __ASM_MACH_RALINK_SPACES_H_
 #define __ASM_MACH_RALINK_SPACES_H_
 
-#define IO_SPACE_LIMIT	0x1fffffff
+#define PCI_IOBASE	_AC(0xa0000000, UL)
+#define PCI_IOSIZE	SZ_16M
+#define IO_SPACE_LIMIT	(PCI_IOSIZE - 1)
 
 #include <asm/mach-generic/spaces.h>
 #endif
-- 
2.25.1

