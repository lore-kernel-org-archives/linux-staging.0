Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAC813FCF
	for <linux-staging@lists.linux.dev>; Sat, 25 Sep 2021 08:46:48 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id r23so9225846wra.6
        for <linux-staging@lists.linux.dev>; Sat, 25 Sep 2021 01:46:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=17lAPdZ/wrC5MQWHWYujyp8BZtV5RPbk2EUbs/RKr5Y=;
        b=oFNoN7WuFkLkL4Gbhxk9ErtpomJ5l4gZxKbX39MGxDRQspEYedNasXU80Ma+WnQnK9
         pJC36nZcvyPPvvKo4zR5iXzjuwXsYJUUl1oPCcnhhTzHfUrpcYmx0aBH+9AaKEjeeCg6
         BLehZGKfRl24MSHQleIeKVkRxLnxslWpNI9pmO6jwSNyBY3NX5Y0+OucRmvM9GGpTlKd
         JymiB70g2KdAMsgvLqjdabT/h6e0wTiqQynrhbtb6/zjStg0ZnBeZRckHeU841lPNXBA
         m4zH7e4TaxSTNV44nUhWHzyXqzM8PUeOQhG2mGwShkQPbVdHNkHZIzp6xpyXb95PkxiO
         gfMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=17lAPdZ/wrC5MQWHWYujyp8BZtV5RPbk2EUbs/RKr5Y=;
        b=qzxT8A+Fyu5izV7dUlsacrre/q3FnsAqqFYmpotZ4Vg0+7IXlDPDvEW4zgGisIJaOD
         oKHh+8IHkNuOoX6Nnz8X+jh63yxkiOLurkzg4/bU+eDWIygnsaVNUSh59dByhXmTdb1J
         w92r2b5IougVEStkDCenMwUIp6UZeez5shhsGF0Jp71M/Osg7+C7mY8t+zopbJggc8ES
         G+hOKslnSYvrUKtxf8Km1HcLGOxsAXaOcpe85ZcwnpNh1WbZznQHxuB4cWIfObwFlAqV
         M8e1WG2sF53EY2hnq+qtv33bWvBVmGWfuyDpESAdnR8L4RSrKBJwnG4pg3vu7Ow5ClPW
         ETOw==
X-Gm-Message-State: AOAM530v8JpBxjLroQJl6Mo0wlCo5brLgTXxaz8iFCk6B1KZY7GRmyzk
	ilUTIRcM4UbvPXw1z0JtWUA=
X-Google-Smtp-Source: ABdhPJw6v5mraRqYTfIkNChWpvs73b6BY/vyVc7/YjnI1vijps0erveCsIWOw7ofbOwqV8nesCDApg==
X-Received: by 2002:a1c:a713:: with SMTP id q19mr5984719wme.42.1632559607176;
        Sat, 25 Sep 2021 01:46:47 -0700 (PDT)
Received: from localhost.localdomain (252.red-83-54-181.dynamicip.rima-tde.net. [83.54.181.252])
        by smtp.gmail.com with ESMTPSA id y9sm17222997wmj.36.2021.09.25.01.46.46
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 25 Sep 2021 01:46:46 -0700 (PDT)
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
Subject: [PATCH v2 3/6] MIPS: ralink: set PCI_IOBASE to 'mips_io_port_base'
Date: Sat, 25 Sep 2021 10:46:38 +0200
Message-Id: <20210925084642.5642-4-sergio.paracuellos@gmail.com>
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

By default MIPS architecture use function 'set_io_port_base()' to set the
virtual address of the first IO port. This function at the end sets variable
'mips_io_port_base' with the desired address. To align things and allow
to change first IO port location address for PCI, set PCI_IOBASE definition
as 'mips_io_port_base'.

Fixes: 222b27713d7f ("MIPS: ralink: Define PCI_IOBASE")
Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
---
 arch/mips/include/asm/mach-ralink/spaces.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/mips/include/asm/mach-ralink/spaces.h b/arch/mips/include/asm/mach-ralink/spaces.h
index 87d085c9ad61..05d14c21c417 100644
--- a/arch/mips/include/asm/mach-ralink/spaces.h
+++ b/arch/mips/include/asm/mach-ralink/spaces.h
@@ -2,8 +2,8 @@
 #ifndef __ASM_MACH_RALINK_SPACES_H_
 #define __ASM_MACH_RALINK_SPACES_H_
 
-#define PCI_IOBASE	_AC(0xa0000000, UL)
-#define PCI_IOSIZE	SZ_16M
+#define PCI_IOBASE	mips_io_port_base
+#define PCI_IOSIZE	SZ_64K
 #define IO_SPACE_LIMIT	(PCI_IOSIZE - 1)
 
 #include <asm/mach-generic/spaces.h>
-- 
2.25.1

