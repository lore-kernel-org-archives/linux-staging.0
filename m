Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A26B472
	for <linux-staging@lists.linux.dev>; Wed,  5 May 2021 12:17:42 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id l14so1598122wrx.5
        for <linux-staging@lists.linux.dev>; Wed, 05 May 2021 05:17:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=i2xpJvhe/Z+XXTh5yK3wIRRP1/e0erTp5os+Re01shI=;
        b=Ktg+pFvtWM++Y2sNHxdolsEalG4TqDmsQlNUVUZ03c2SUcmMwJBMJ9sI5fad4b99pU
         NZN9Yxw5u8lcl6N8+WyFUcX0VC3KtZjXNIEstgW45FREbQuoCzi8EMF7nhpBQCWRibGs
         vggpcH1J3rzxMJkroipcO9tTBaREsXfi/zn/cLUuSHetVM3y0VmZ+Kr/Ba4OuJK/hb9e
         Gmbibtf4LgSrXwU/bHlZ4KlCiK1hLBKijsFjHUsAb91OmWkBZMEKF0sHCGXV3GTYlGAz
         vy+aRbVT41w07EwFcDN9aMB1QE+CW4+n3vEFIddEY5FyhNUF0ZKKX7ipGbfyk8V00y0c
         b1Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=i2xpJvhe/Z+XXTh5yK3wIRRP1/e0erTp5os+Re01shI=;
        b=LL/46roXSIZdB+UMKNFxwlZOEwJ8pcGkngPu/EBxur5wCALLFulzRjP3cuPk4Hhz8Y
         h4qCt/xb9kAtnyTKPgUrHMR3UaZdJcyjcrRkTtYqp9MghP+AlgeReNAX84FmTYKDGB8n
         Em/ecvjDZRJczIqZMNINDcKlzzdHRiIAca07LcXyac0qYK2quygoyPxXEsA84mOSTqFS
         ZRHybsx77sHvh6RkXmv0KJ4wtNIf8wGJtXNeZm5fXpsHtwN8omeI9ZHd+NTV3HS6Oebm
         zvrZiSG7wwWGl8TABxjpDJpOiXyGPVOc5JGWtMpSyuS0AYIVrPIqej6620ia3/4jNmlF
         uyhg==
X-Gm-Message-State: AOAM530AafjUQwdR6255eQDKBSvMzUKd/YkpU9ZldmwYc9lL0NrQMGal
	w3Ws67z5wtCpd2qKrQgfo0CJjqn7D0amJg==
X-Google-Smtp-Source: ABdhPJwOrFsQ6R8SWTdYRcR9bSYl3qIVUlD/vXpW33m+LQODn3E99T+0W3PikhgxZeo3xkrAoCACTA==
X-Received: by 2002:a5d:408f:: with SMTP id o15mr36671766wrp.89.1620217061021;
        Wed, 05 May 2021 05:17:41 -0700 (PDT)
Received: from localhost.localdomain (231.red-83-51-243.dynamicip.rima-tde.net. [83.51.243.231])
        by smtp.gmail.com with ESMTPSA id p17sm19067896wru.1.2021.05.05.05.17.40
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 05 May 2021 05:17:40 -0700 (PDT)
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
To: linux-staging@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	neil@brown.name,
	ilya.lipnitskiy@gmail.com
Subject: [PATCH 03/10] staging: mt7621-pci: remove some not needed includes
Date: Wed,  5 May 2021 14:17:29 +0200
Message-Id: <20210505121736.6459-4-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210505121736.6459-1-sergio.paracuellos@gmail.com>
References: <20210505121736.6459-1-sergio.paracuellos@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some includes used here are not really necessary for
the code to compile properly. Hence remove them.

Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
---
 drivers/staging/mt7621-pci/pci-mt7621.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/staging/mt7621-pci/pci-mt7621.c b/drivers/staging/mt7621-pci/pci-mt7621.c
index 984e333408a0..1b3d6ba0b85a 100644
--- a/drivers/staging/mt7621-pci/pci-mt7621.c
+++ b/drivers/staging/mt7621-pci/pci-mt7621.c
@@ -19,7 +19,6 @@
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/gpio/consumer.h>
-#include <linux/iopoll.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
@@ -31,10 +30,6 @@
 #include <linux/platform_device.h>
 #include <linux/reset.h>
 #include <linux/sys_soc.h>
-#include <mt7621.h>
-#include <ralink_regs.h>
-
-#include "../../pci/pci.h"
 
 /* MediaTek specific configuration registers */
 #define PCIE_FTS_NUM			0x70c
-- 
2.25.1

