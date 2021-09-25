Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94D0D2F80
	for <linux-staging@lists.linux.dev>; Sat, 25 Sep 2021 08:46:46 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id t28so21172515wra.7
        for <linux-staging@lists.linux.dev>; Sat, 25 Sep 2021 01:46:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/Wb71HqjEOUF7N4+48DrIALQ2aRBPLW7pWxHbo6fkmE=;
        b=Qb6/ebapboRHy2oxDc5q5VKXIVMIzbT8rHvoiG93lXdmxmyV273iAip7+DFT0TVWM5
         ThMCV4WQlTJfLBbPiCfXIXrJA+e96NvGpyT95pOLeR3cszXHWgK2d8/As056yObw/s6M
         hBjmb5+F0HSPxeHaF0FLKZPtLGQozqNac0tueZCGYo7UOMd3hYdqcE6RuDodhjH/GXPj
         yrP3re6Inavf+6pMuFQroemIGz8qiVLjKUDfqEPscF1uaWd2S0EoRyMplFmIPrxwEwj/
         qnTWTlTcLcoAyrZFOJI1TGPOB1aOisEOkqccb1yPx/J3qng3JIS/vMOoJDNWnxHHfYVt
         4/NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/Wb71HqjEOUF7N4+48DrIALQ2aRBPLW7pWxHbo6fkmE=;
        b=dkGcwHYbuHSWuxrU6tgFeve8seaDEnI5e1FkYwDOat5KBJ6BsjlW3VSPAwyyOFNYmT
         +w2cpLiyZI2dgDqNhqT4fvWUoHC7m4tR3fvZSq/mP9xCQnwtGxa9uTrLZyKDznm/PjZy
         cdYYq5q3crNg06eHAgQCAOtyt97hArPkdB+vNnsaXuDdQ7z9wip2hfuynvU0iXqSnR99
         zYB2oEEE1r9CXHT1NSekdm1m4+bb1Y5v5LlQbJcTPmhIWumjvMhmZ9/yLdeJSN/9jJky
         /o8LoJbtl3juCl78z7qob4wXBsegBzw9JnMrL/ld2D6mwlJJRtwHdSdPX7/yCutgDHht
         ZkfA==
X-Gm-Message-State: AOAM533Agtzmy8Z4/6kZYQeXBTcZ7sI0JYha+0mJL+bnrmiqleS35lxt
	vf/K+BQtttUnNaS7kOwwoL0=
X-Google-Smtp-Source: ABdhPJyHw1n6sTAwD4+nW7+bDwyTqs/z8xs5p4MbTYREbctn6X5pxMdGperx/5q5l/rxf4lfJ0zo1A==
X-Received: by 2002:a05:600c:17d1:: with SMTP id y17mr6282479wmo.135.1632559605031;
        Sat, 25 Sep 2021 01:46:45 -0700 (PDT)
Received: from localhost.localdomain (252.red-83-54-181.dynamicip.rima-tde.net. [83.54.181.252])
        by smtp.gmail.com with ESMTPSA id y9sm17222997wmj.36.2021.09.25.01.46.43
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 25 Sep 2021 01:46:44 -0700 (PDT)
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
Subject: [PATCH v2 1/6] Revert "MIPS: ralink: don't define PC_IOBASE but increase IO_SPACE_LIMIT"
Date: Sat, 25 Sep 2021 10:46:36 +0200
Message-Id: <20210925084642.5642-2-sergio.paracuellos@gmail.com>
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

