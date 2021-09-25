Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFD753FCF
	for <linux-staging@lists.linux.dev>; Sat, 25 Sep 2021 20:32:28 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id d21so38168429wra.12
        for <linux-staging@lists.linux.dev>; Sat, 25 Sep 2021 13:32:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/Wb71HqjEOUF7N4+48DrIALQ2aRBPLW7pWxHbo6fkmE=;
        b=HbiIavrACDoPKKGhz91lnyYOWGe+guXmTlZquxkI+ZWBKrxLN2/KuJ6/036mrWsj+b
         TJul81dnFl8GpexEDl4/rSHBDjMyDYC46nEcQ0xZhv9W8IhKKUvXXqaxVwHyx9r2s5U7
         sGZdEmY1D0uzn5Lcf+F4qcZqIvdN6ZG/sVcpiiQVQ+aER12Z9MM/Je/7Ty/ybpbwp9ty
         ntYHBjzaFVHLGHnZgrAIkCMl+Nx8CmaKp99Q5NqqO7tcpehbZ2vadJJPq0w7Y2QUCw+q
         vetDxGuzNgJoKejT/vGWa2dRDBEF5FcY568KoHosPRa1M9vAowSufNEd0w4TqW85hKf3
         9kkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/Wb71HqjEOUF7N4+48DrIALQ2aRBPLW7pWxHbo6fkmE=;
        b=qFcJF/yEoMgqfTFbZMuP9SdGgDV3PZBGBoJiPyAuD/LJuFABnYJ0W7e5bPjF6Eg2tD
         8YMACQKUtnBhsODRLD8OdFG3A1XVjAPfXkYFYoOLw+X9f9Lf/xicAxXKv80heleqePox
         QMEsTJLJ7QZs4rMGMnVVxrZKs0YHtpRiKPm2Tw4Vf9RcI7V1f+8NBz88+JeXVLcopw9z
         qSGuWwUICD2s5DVXCM7CURt51UeuHl4O3mV2IpjfZJpBdnuLY5K3kKlY9iQg9JxRHV5O
         amrCHi+jiwlX9MxNMAU17WUpE2/XIAr30m86IqGz6CIoNv/htIOfPQBfRbdsP3lkJvco
         PzaQ==
X-Gm-Message-State: AOAM533idFaQF5SJ24XekMeNYlB3DQ+uHIfLWk5ZjatSPDJVJvR1Bn3I
	9M0atwc6GhQdO4JUwQWgWFY=
X-Google-Smtp-Source: ABdhPJzicsFl8kGv0kXGzP2vQVihQ9IDXNPh1hRIUUYF38RKGOcv/+47W7tmg6FpSgAZOb2nJPTX/w==
X-Received: by 2002:a5d:56c4:: with SMTP id m4mr18860182wrw.225.1632601947300;
        Sat, 25 Sep 2021 13:32:27 -0700 (PDT)
Received: from localhost.localdomain (252.red-83-54-181.dynamicip.rima-tde.net. [83.54.181.252])
        by smtp.gmail.com with ESMTPSA id a202sm16703279wmd.15.2021.09.25.13.32.26
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 25 Sep 2021 13:32:26 -0700 (PDT)
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
Subject: [PATCH v3 1/6] Revert "MIPS: ralink: don't define PC_IOBASE but increase IO_SPACE_LIMIT"
Date: Sat, 25 Sep 2021 22:32:19 +0200
Message-Id: <20210925203224.10419-2-sergio.paracuellos@gmail.com>
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

