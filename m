Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2229638F98
	for <linux-staging@lists.linux.dev>; Fri,  6 Oct 2023 19:05:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q+3HztFv"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-523029050d0so848693a12.0
        for <linux-staging@lists.linux.dev>; Fri, 06 Oct 2023 12:05:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696619135; x=1697223935; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PddiH55x+W9MXtYbdET9UUNCdNqM/zZgQg6IQuIHC9o=;
        b=Q+3HztFvQhluz1IYbShhgTLjZbTjx1rviSZZg3ZPmeMXw5SQI4Qnhnaj39e/Kj7dF7
         369JJWERsGT1SavvTLZVec9N2/PVSCjYTIZgVqpvF2NJ41AEl6SrshXAt8FF2X2l4pUt
         KxWoxUuKK5RaSDrtAb+YnSGuakt/gZWqMgKYWy3ePgfXMElliqtHHxqHa5X7T/Z8Cyh/
         sJdgbFd1Z4lObBCMEFkm9XncUBOT5/u/WeLMbUR0Jt2v7jL+cM86uhJmtnE9LA9DOAue
         8xoQq0o18E+zhOqxUbXNkczY0wcrNvgkEgMRJgcLFEpDdy0tKfAdwhVioqJaoSoqUsqo
         ESeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696619135; x=1697223935;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PddiH55x+W9MXtYbdET9UUNCdNqM/zZgQg6IQuIHC9o=;
        b=Q/ua3k6W+Zjjdr6iLLThuOll3VTqaAxCQMq6hRcV9rKa5hCcuP2fXCBXzP9e1qxxz0
         I/GOcVVCEBD8sh85fUOAHGxOXS4bIjhWxaqEA4+kPufAbKQbBBxqnYGK5NH+Mr10o2lc
         +E47MVL3gCuI2J7hPzE4LYVl61IZ0bNtga4aO1vpQmYn6vtZbfH+ODKfpqWLKb1kXswp
         WyW8S5ccwFAx5YYfDCIQoYkuVc0lavg5CjsmG31iKme59ZVfwvVfXZ8FOKdYyqGf3reg
         oKOHNuyi0fHvn545/zKKf5f7DKyVAVAEVZ7SGIwcP7jNf4opa6Lx568C/aynQ47VS/ZY
         1h3A==
X-Gm-Message-State: AOJu0YxNGBNIJIvnXMXpM0sn8/JoDHYSFKwyN8vj4oFeccF4KRKm2daF
	+KotWeu2dzwZv9JYwEwdqFA9F/cIOq0=
X-Google-Smtp-Source: AGHT+IE2VILWoBXLlNlCUEQmPGaZVpyEYdfY/rkrsyVHLJ2oREeSk84ug6GcPexj47mIt+w5VC3Nmg==
X-Received: by 2002:a05:6402:40c2:b0:523:37cf:6f37 with SMTP id z2-20020a05640240c200b0052337cf6f37mr7470007edb.4.1696619135304;
        Fri, 06 Oct 2023 12:05:35 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p579356c7.dip0.t-ipconnect.de. [87.147.86.199])
        by smtp.gmail.com with ESMTPSA id g18-20020a056402181200b0053782c81c69sm2933456edy.96.2023.10.06.12.05.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Oct 2023 12:05:35 -0700 (PDT)
Date: Fri, 6 Oct 2023 21:05:33 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 09/10] staging: rtl8192e: Remove unused variable
 rt_global_debug_component
Message-ID: <082272e20dc0659e7700f7756a6bf1a8b71c411e.1696548527.git.philipp.g.hortmann@gmail.com>
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

Remove unused variable rt_global_debug_component.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtllib_debug.h  | 2 --
 drivers/staging/rtl8192e/rtllib_module.c | 3 ---
 2 files changed, 5 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtllib_debug.h b/drivers/staging/rtl8192e/rtllib_debug.h
index f6b23defe225..06adfebd7c89 100644
--- a/drivers/staging/rtl8192e/rtllib_debug.h
+++ b/drivers/staging/rtl8192e/rtllib_debug.h
@@ -14,8 +14,6 @@
 #define DRV_NAME "rtllib_92e"
 #endif
 
-extern u32 rt_global_debug_component;
-
 /* These are the defines for rt_global_debug_component */
 enum RTL_DEBUG {
 	COMP_TRACE		= BIT(0),
diff --git a/drivers/staging/rtl8192e/rtllib_module.c b/drivers/staging/rtl8192e/rtllib_module.c
index 195d8aa88138..f280c9e94958 100644
--- a/drivers/staging/rtl8192e/rtllib_module.c
+++ b/drivers/staging/rtl8192e/rtllib_module.c
@@ -34,9 +34,6 @@
 #include <net/arp.h>
 #include "rtllib.h"
 
-u32 rt_global_debug_component = COMP_ERR;
-EXPORT_SYMBOL(rt_global_debug_component);
-
 static inline int rtllib_networks_allocate(struct rtllib_device *ieee)
 {
 	if (ieee->networks)
-- 
2.42.0

