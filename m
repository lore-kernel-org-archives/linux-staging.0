Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A67E76D0E
	for <linux-staging@lists.linux.dev>; Mon, 14 Jun 2021 10:06:21 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id m18so13886486wrv.2
        for <linux-staging@lists.linux.dev>; Mon, 14 Jun 2021 03:06:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=N0fsKa0m+ct2TNQQ9Pb5MMJ8S0hfbem4WCcQmEP55Aw=;
        b=alZqxe/iNgMwZ4sWImtm00CDmdvzVwc0Fe2Ol7kiL2X2JKrhnquF+MUcRTvC/sjvwW
         aug8+vpOmTsktZH4AOE0DWwMMAMUsNXAPgxON3hjkOlsFpZyT10qeWvpZOrB79rkC5Tr
         7Hx3FekROUivbEnrigJ7s0+7bXFfZsOLlT6c9+Pp9MpNVZV+VHq95YLZM/gAoNlqqHnE
         LlszW+ORwsdXV6Mhfrcmx+R9OyYXuNHtTQuabohzy9k1epJznKP50fnWPZbssZRA7wyL
         +7ym7O7R9TDSyVguePFoiw5uziIkNiUIWxOtwgz9WWr8JiSUoXIdB5mkKOtDGCQcaI9j
         TMdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=N0fsKa0m+ct2TNQQ9Pb5MMJ8S0hfbem4WCcQmEP55Aw=;
        b=eYFN3w5wZLhNfS+zIIOn8tupvrV8A+3ePvXH/Hn+XMv8BYgrT8TAh180sKvXrcN0YR
         PMqE2MwfdJjblcBUwBA6ZVY/A1rU/kFvuZjciLxNs8VPFD2Hw3rVEoyiQUFaOVUeCSMj
         c8m++YAIC/tyl6Sna5M+NP06P5JLlZWwLDU+I5sHFLC8aGp8DUwxMkeFeVMePIQn7Wh+
         CUG32G4SnnXGVhV4fLfvxTr9PcXrPgORO4PtYqXxFoAXSBLIGxeG35L7DqOrvG7WxpZf
         gLYMhHGatAvI+S1eF5ghueL6sufOfvwDw3zuRqDd+GUP/yPn6/e4T3q/j1/5Z4/PyM37
         cHOg==
X-Gm-Message-State: AOAM533UP/JC2QDjOgEpWNIyXZVkIUQ14sMyhvG8r1353z3yXkRXOv6R
	OoUm5ioT2HKpHlA58iniM2ZFvQt7hgs=
X-Google-Smtp-Source: ABdhPJzF4cE/D7foVs4lkEe8wDLIxb9sDkQiX242rhjvHu3/KfrF25c7Jc6fMYsZzwriWltz1gRwaA==
X-Received: by 2002:a5d:4538:: with SMTP id j24mr17707142wra.391.1623665179977;
        Mon, 14 Jun 2021 03:06:19 -0700 (PDT)
Received: from localhost.localdomain (98.red-81-38-58.dynamicip.rima-tde.net. [81.38.58.98])
        by smtp.gmail.com with ESMTPSA id k5sm16476566wrv.85.2021.06.14.03.06.19
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 14 Jun 2021 03:06:19 -0700 (PDT)
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
To: linux-staging@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	neil@brown.name,
	linux-mips@vger.kernel.org,
	tsbogend@alpha.franken.de,
	ilya.lipnitskiy@gmail.com,
	john@phrozen.org
Subject: [PATCH v2 1/3] MIPS: ralink: Define PCI_IOBASE
Date: Mon, 14 Jun 2021 12:06:15 +0200
Message-Id: <20210614100617.28753-2-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210614100617.28753-1-sergio.paracuellos@gmail.com>
References: <20210614100617.28753-1-sergio.paracuellos@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

PCI_IOBASE is used to create VM maps for PCI I/O ports, it is
required by generic PCI drivers to make memory mapped I/O range
work. Hence define it for ralink architectures to be able to
avoid parsing manually IO ranges in PCI generic driver code.
Function 'plat_mem_setup' for ralink is using 'set_io_port_base'
call using '0xa0000000' as address, so use the same address in
the definition to align things.

Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
---
 arch/mips/include/asm/mach-ralink/spaces.h | 10 ++++++++++
 1 file changed, 10 insertions(+)
 create mode 100644 arch/mips/include/asm/mach-ralink/spaces.h

diff --git a/arch/mips/include/asm/mach-ralink/spaces.h b/arch/mips/include/asm/mach-ralink/spaces.h
new file mode 100644
index 000000000000..87d085c9ad61
--- /dev/null
+++ b/arch/mips/include/asm/mach-ralink/spaces.h
@@ -0,0 +1,10 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __ASM_MACH_RALINK_SPACES_H_
+#define __ASM_MACH_RALINK_SPACES_H_
+
+#define PCI_IOBASE	_AC(0xa0000000, UL)
+#define PCI_IOSIZE	SZ_16M
+#define IO_SPACE_LIMIT	(PCI_IOSIZE - 1)
+
+#include <asm/mach-generic/spaces.h>
+#endif
-- 
2.25.1

