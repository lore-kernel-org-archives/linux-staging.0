Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B150C79D2
	for <linux-staging@lists.linux.dev>; Wed,  5 Apr 2023 20:27:21 +0000 (UTC)
Received: by mail-oo1-f50.google.com with SMTP id f7-20020a4ab647000000b0054101f316c7so2441961ooo.13
        for <linux-staging@lists.linux.dev>; Wed, 05 Apr 2023 13:27:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680726441;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZTd63roJHw5mw81KozXO6U7HxEiOyCu7wEaX62Cvsk0=;
        b=EsXbIlqTLxEaL1MaHsZauwTpjercX/uFBbFVk5BZYv0qk5GNCYJyIv3mlw2MX06nIQ
         76JxUgeOshrWVoyT/cTYeDXmQ7ha+QyaCM/nsy6Lq+/A4/vItKQRx6G+vxr8oyZlIaoB
         3IYTGt6bfKfgxOXKPd+gEfA69eJBHWi1+7oe6EnlOKC+ZjUpeHiOJBXJ2egk4ooOvHMw
         UGijg42bm3kXERT/HGiiLXBjfi7V2SGJ+YjFpTWtDHGQ62dhCdlEKisvTBfmnhwNlZP+
         TYYj3TYEtaYfTUt6l+1jiZ9+pKRMgqbqO6JF5SOYZDGVDCqbLERrZFXwUYicjrcV3ksa
         uaGw==
X-Gm-Message-State: AAQBX9dD6NqgpLA5HFxZYieCFYe9nofehbhhs0Jx/UGigehAWMlXKZ66
	EyST+ZcsUfITKUDhFwgcFA==
X-Google-Smtp-Source: AKy350bDkD0JNoIZyIKw2Up57YVo9+K3U0A02eldxdq99WmvxpM4xVMH9LB8cYU9pwfCYpADQ4amIA==
X-Received: by 2002:a4a:2cd4:0:b0:536:584c:eb1f with SMTP id o203-20020a4a2cd4000000b00536584ceb1fmr3187633ooo.2.1680726440668;
        Wed, 05 Apr 2023 13:27:20 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id f1-20020a4ab001000000b0051aa196ac82sm7103369oon.14.2023.04.05.13.27.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Apr 2023 13:27:20 -0700 (PDT)
Received: (nullmailer pid 425890 invoked by uid 1000);
	Wed, 05 Apr 2023 20:27:17 -0000
From: Rob Herring <robh@kernel.org>
Date: Wed, 05 Apr 2023 15:27:20 -0500
Subject: [PATCH v2 06/10] pata: ixp4xx: Add explicit include for of.h
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230329-acpi-header-cleanup-v2-6-c902e581923b@kernel.org>
References: <20230329-acpi-header-cleanup-v2-0-c902e581923b@kernel.org>
In-Reply-To: <20230329-acpi-header-cleanup-v2-0-c902e581923b@kernel.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, Marcelo Schmitt <marcelo.schmitt1@gmail.com>, Lars-Peter Clausen <lars@metafoo.de>, Michael Hennerich <Michael.Hennerich@analog.com>, Jonathan Cameron <jic23@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Johannes Berg <johannes@sipsolutions.net>, "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Jiri Slaby <jirislaby@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Marc Zyngier <maz@kernel.org>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, linux-serial@vger.kernel.org, linux-tegra@vger.kernel.org, linux-acpi@vger.kernel.org, devicetree@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>, Jacob Keller <jacob.e.keller@intel.com>
X-Mailer: b4 0.13-dev

With linux/acpi.h no longer implicitly including of.h, add an explicit
include of of.h to fix the following error:

drivers/ata/pata_ixp4xx_cf.c:258:15: error: implicit declaration of function 'of_property_read_u32_index'; did you mean 'fwnode_property_read_u32_array'? [-Werror=implicit-function-declaration]

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Rob Herring <robh@kernel.org>
---
v2: New patch
---
 drivers/ata/pata_ixp4xx_cf.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/ata/pata_ixp4xx_cf.c b/drivers/ata/pata_ixp4xx_cf.c
index e225913a619d..113087665832 100644
--- a/drivers/ata/pata_ixp4xx_cf.c
+++ b/drivers/ata/pata_ixp4xx_cf.c
@@ -17,6 +17,7 @@
 #include <linux/module.h>
 #include <linux/libata.h>
 #include <linux/irq.h>
+#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 #include <scsi/scsi_host.h>

-- 
2.39.2

