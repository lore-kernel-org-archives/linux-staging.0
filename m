Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD42438F98
	for <linux-staging@lists.linux.dev>; Fri,  6 Oct 2023 19:05:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FZgIyAZP"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-9ae3d7eb7e0so92085166b.0
        for <linux-staging@lists.linux.dev>; Fri, 06 Oct 2023 12:05:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696619141; x=1697223941; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=50wAwYPZKotuW/XLuJMHGzTqySgRqtpp7TbieAYYB4c=;
        b=FZgIyAZPqXhreHKDv1QoQfE5cx7Ngt4FsTeCiYvgwTkVF4TdlAEJFwm2y+WvVP2hZO
         c0GlOWrbhpxJfv1yc2pwLLjt+xMz5FgYECd+Yi6TI45OKZe7bkYs/V/E3SGd/XsE79M9
         wrvMAKlJtGHd2OCRAzvgdK5HKmsTTpwSULXbsazfGqXMmt1CnJpoc3pVOfQ35n0GFI9I
         ddD0hlGr3d7fdfy7Qlo9IZsFBRDFI/PFB+HJ2Ha/Gq0h4YfMn4oF39/SfR8gLVFYIIin
         fdwMYSaIZlCxKH3EjUwTFLJAV06vBr1ZMXuUZy8iEMH7Lgh6eqIlv8sAAgCKv9X3SenG
         DMMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696619141; x=1697223941;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=50wAwYPZKotuW/XLuJMHGzTqySgRqtpp7TbieAYYB4c=;
        b=DIPPfdRpW/FyOsFgvXtTspcxNe7UqIvpFMS20ERLOULQh3rAmatSNOvYCRWi5/ei/S
         cBuS4/7D0b0DYbyXD3AKfLhFXA0KILLWiO/EjmS1vmklXnIFm8zxHHStdBbdptg8xO3+
         UTuEHtuOlQQemdfEUmBXrvSddUNFe7Z8ipfVOaHfuTGjfW3OmURQypl9IKxG8Cmd9ES/
         YpWgrGHU9iMAvzZGddbhWOm1pgwhCNOtXHgDw959ZUEVjLxax7zaEIYq5WQXyOJmoNJ1
         Kq9UuRQaLhX1NrJQ9XPee3TarHRFfTPIRr6CoJokGldh5neCAGufcfC9Q2V+m+uQ4KpP
         JIqg==
X-Gm-Message-State: AOJu0YyUZaXdLXFZVh8MFfPi+2ZSkZYH0iF8FKb+RAtFRpbrUMlI67t5
	/pf6wy5PZHwKcFxakOcruCY=
X-Google-Smtp-Source: AGHT+IEqE6zbj595QGffuxcQqPzMt5FYCve+/vlKmTRiKuQuL1v51WpzYFImS1wF/JMhli3D8sGv+Q==
X-Received: by 2002:a17:906:24e:b0:9a5:9f3c:961f with SMTP id 14-20020a170906024e00b009a59f3c961fmr7849157ejl.3.1696619140986;
        Fri, 06 Oct 2023 12:05:40 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p579356c7.dip0.t-ipconnect.de. [87.147.86.199])
        by smtp.gmail.com with ESMTPSA id cd16-20020a170906b35000b00991faf3810esm3345530ejb.146.2023.10.06.12.05.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Oct 2023 12:05:40 -0700 (PDT)
Date: Fri, 6 Oct 2023 21:05:39 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 10/10] staging: rtl8192e: Remove unused file rtllib_debug.h
Message-ID: <b7b61bd068e8090b954e3c025bc724d9e85fc568.1696548527.git.philipp.g.hortmann@gmail.com>
References: <cover.1696548527.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1696548527.git.philipp.g.hortmann@gmail.com>

Remove #define DRV_NAME "rtllib_92e" as it is already set. Remove enum
RTL_DEBUG as it is unused. Remove #include <linux/bits.h> as it is unused.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtllib.h       |  1 -
 drivers/staging/rtl8192e/rtllib_debug.h | 47 -------------------------
 2 files changed, 48 deletions(-)
 delete mode 100644 drivers/staging/rtl8192e/rtllib_debug.h

diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index 2f968c3c0229..b12a39ecdd9d 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -31,7 +31,6 @@
 #include <linux/delay.h>
 #include <linux/wireless.h>
 
-#include "rtllib_debug.h"
 #include "rtl819x_HT.h"
 #include "rtl819x_BA.h"
 #include "rtl819x_TS.h"
diff --git a/drivers/staging/rtl8192e/rtllib_debug.h b/drivers/staging/rtl8192e/rtllib_debug.h
deleted file mode 100644
index 06adfebd7c89..000000000000
--- a/drivers/staging/rtl8192e/rtllib_debug.h
+++ /dev/null
@@ -1,47 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/*
- * Copyright(c) 2008 - 2010 Realtek Corporation. All rights reserved.
- *
- * Contact Information: wlanfae <wlanfae@realtek.com>
- */
-#ifndef _RTL_DEBUG_H
-#define _RTL_DEBUG_H
-
-#include <linux/bits.h>
-
-/* Allow files to override DRV_NAME */
-#ifndef DRV_NAME
-#define DRV_NAME "rtllib_92e"
-#endif
-
-/* These are the defines for rt_global_debug_component */
-enum RTL_DEBUG {
-	COMP_TRACE		= BIT(0),
-	COMP_DBG		= BIT(1),
-	COMP_INIT		= BIT(2),
-	COMP_RECV		= BIT(3),
-	COMP_POWER		= BIT(6),
-	COMP_SWBW		= BIT(8),
-	COMP_SEC		= BIT(9),
-	COMP_LPS		= BIT(10),
-	COMP_QOS		= BIT(11),
-	COMP_RATE		= BIT(12),
-	COMP_RXDESC		= BIT(13),
-	COMP_PHY		= BIT(14),
-	COMP_DIG		= BIT(15),
-	COMP_TXAGC		= BIT(16),
-	COMP_HALDM		= BIT(17),
-	COMP_POWER_TRACKING	= BIT(18),
-	COMP_CH			= BIT(19),
-	COMP_RF			= BIT(20),
-	COMP_FIRMWARE		= BIT(21),
-	COMP_RESET		= BIT(23),
-	COMP_CMDPKT		= BIT(24),
-	COMP_SCAN		= BIT(25),
-	COMP_PS			= BIT(26),
-	COMP_DOWN		= BIT(27),
-	COMP_INTR		= BIT(28),
-	COMP_ERR		= BIT(31)
-};
-
-#endif
-- 
2.42.0

