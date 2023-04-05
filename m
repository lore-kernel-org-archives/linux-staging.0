Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35D0C749A
	for <linux-staging@lists.linux.dev>; Wed,  5 Apr 2023 20:27:23 +0000 (UTC)
Received: by mail-oo1-f46.google.com with SMTP id c17-20020a4aa4d1000000b005418821052aso67840oom.6
        for <linux-staging@lists.linux.dev>; Wed, 05 Apr 2023 13:27:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680726442;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JngcAWKJpT67v6W9zBVTC6410UY98dd8Phb7Pw/m5bk=;
        b=rSlx4cWnJVutWRI4cHolIxtZ38Gq/I+0Dg3TwPmUuVxSaNjKTPLqr3hGd+KeEfmK4r
         mSo9298Ghg9MBlHtYiuchyIX3wqdIQn9XTrW/fXxNwLyREOTYRBraEToRlFbBZMihI4Z
         hkeJ/ng8O1OfNzG0C5s7sqRN5CPlr3lsuHxOR9uxdOvDAOEey9QA+43y2FIRUQZ4lkDS
         +pacia4TnT9Gqlz12/kjTJ7RXumjwAisViYL1mo7HNReLuDs8QeOFMHcmAiT0nMaho4o
         Af7W9dRLB95jQIZUec1jwIzM3XM44S/NOjosDqPhnJe8F8XzkYYzfXrX01Fwtm9kXlGh
         gxcg==
X-Gm-Message-State: AAQBX9d4XZj4TGO2NvvRRQyO6d3Y1h1pMPfkIPi77xI4kaBRgYLDHIBD
	73OvpBwYrH8rObitmyg9LA==
X-Google-Smtp-Source: AKy350bxPH3JtSAHtsmH6xOdwm/kCdOsqgg6Vx/HDHP8eFzkwoqWktAvfdJhC4LlACzT9ZpLP9IJfQ==
X-Received: by 2002:a4a:3708:0:b0:541:3ce:43fe with SMTP id r8-20020a4a3708000000b0054103ce43femr3682373oor.6.1680726442233;
        Wed, 05 Apr 2023 13:27:22 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id y2-20020a4ad642000000b0051134f333d3sm7145560oos.16.2023.04.05.13.27.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Apr 2023 13:27:21 -0700 (PDT)
Received: (nullmailer pid 425888 invoked by uid 1000);
	Wed, 05 Apr 2023 20:27:17 -0000
From: Rob Herring <robh@kernel.org>
Date: Wed, 05 Apr 2023 15:27:19 -0500
Subject: [PATCH v2 05/10] ata: pata_macio: Add explicit include of
 irqdomain.h
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230329-acpi-header-cleanup-v2-5-c902e581923b@kernel.org>
References: <20230329-acpi-header-cleanup-v2-0-c902e581923b@kernel.org>
In-Reply-To: <20230329-acpi-header-cleanup-v2-0-c902e581923b@kernel.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, Marcelo Schmitt <marcelo.schmitt1@gmail.com>, Lars-Peter Clausen <lars@metafoo.de>, Michael Hennerich <Michael.Hennerich@analog.com>, Jonathan Cameron <jic23@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Johannes Berg <johannes@sipsolutions.net>, "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Jiri Slaby <jirislaby@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Marc Zyngier <maz@kernel.org>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, linux-serial@vger.kernel.org, linux-tegra@vger.kernel.org, linux-acpi@vger.kernel.org, devicetree@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>, Jacob Keller <jacob.e.keller@intel.com>
X-Mailer: b4 0.13-dev

With linux/acpi.h no longer including irqdomain.h, add an explicit
include of irqdomain.h to fix the following error:

drivers/ata/pata_macio.c:1172:23: error: implicit declaration of function 'irq_create_mapping' [-Werror=implicit-function-declaration]

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Rob Herring <robh@kernel.org>
---
v2: New patch
---
 drivers/ata/pata_macio.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/ata/pata_macio.c b/drivers/ata/pata_macio.c
index 9ccaac9e2bc3..335e339a7ada 100644
--- a/drivers/ata/pata_macio.c
+++ b/drivers/ata/pata_macio.c
@@ -21,6 +21,7 @@
 #include <linux/adb.h>
 #include <linux/pmu.h>
 #include <linux/scatterlist.h>
+#include <linux/irqdomain.h>
 #include <linux/of.h>
 #include <linux/gfp.h>
 #include <linux/pci.h>

-- 
2.39.2

