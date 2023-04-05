Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3841F79D3
	for <linux-staging@lists.linux.dev>; Wed,  5 Apr 2023 20:27:35 +0000 (UTC)
Received: by mail-oi1-f182.google.com with SMTP id f14so14015626oiw.10
        for <linux-staging@lists.linux.dev>; Wed, 05 Apr 2023 13:27:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680726454;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M3RPX6uXfMIMJJoqXF0tDH6hb5w2/i4ololX+IM3luY=;
        b=j1y5CpuKFZvyWtbkcqhVnX/4ffNqMP+s6yCUd/99GWYP1gKHFHGZcx9rv7wdWwkU17
         Re7TGnGFjqMrHLsJ/7XwievKF/PaqLiYuTpSlvPSirs2ePVaUXuP/MVQp4AIzeqYC1MQ
         1APSjSC2AlG56/in29NoXUGhfyd1Aw11jqRzDFLAqozBWaq3wKoy5K/2lAdk+wyGxGuN
         qNOXJqNKCQKyBpyalXyxTqC3Qaqs9CQ5i2gnKQiWrRlYE1yiRsBvcYuZCLZH9He4UXeW
         JbArFLv6l1U8Id6kk8YC45l6DbftM1B5LjYSrvCoBuLG38P2U4qZyEeTs7pOVEpuOxup
         LN2A==
X-Gm-Message-State: AAQBX9dC2MLo1CLNpp06LnKMJ7RdgfOBQcUfUZsSu+oG1dQJD8aogn4v
	YfU0T2Wi26YKx4U+YEet3Q==
X-Google-Smtp-Source: AKy350bI8AMWkdrGldN0+D8908pDqGR1ET11ahdL00A7ibOfslvb7UH0SkDNaAc8yDfybKU8oRjiXg==
X-Received: by 2002:aca:bf05:0:b0:389:7fcc:75f0 with SMTP id p5-20020acabf05000000b003897fcc75f0mr1690469oif.25.1680726454290;
        Wed, 05 Apr 2023 13:27:34 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id u1-20020a4a9e81000000b0053b909a5229sm7112025ook.4.2023.04.05.13.27.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Apr 2023 13:27:33 -0700 (PDT)
Received: (nullmailer pid 425882 invoked by uid 1000);
	Wed, 05 Apr 2023 20:27:17 -0000
From: Rob Herring <robh@kernel.org>
Date: Wed, 05 Apr 2023 15:27:16 -0500
Subject: [PATCH v2 02/10] staging: iio: resolver: ad2s1210: Add explicit
 include for of.h
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230329-acpi-header-cleanup-v2-2-c902e581923b@kernel.org>
References: <20230329-acpi-header-cleanup-v2-0-c902e581923b@kernel.org>
In-Reply-To: <20230329-acpi-header-cleanup-v2-0-c902e581923b@kernel.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, Marcelo Schmitt <marcelo.schmitt1@gmail.com>, Lars-Peter Clausen <lars@metafoo.de>, Michael Hennerich <Michael.Hennerich@analog.com>, Jonathan Cameron <jic23@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Johannes Berg <johannes@sipsolutions.net>, "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Jiri Slaby <jirislaby@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Marc Zyngier <maz@kernel.org>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, linux-serial@vger.kernel.org, linux-tegra@vger.kernel.org, linux-acpi@vger.kernel.org, devicetree@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>, Jacob Keller <jacob.e.keller@intel.com>, Jonathan Cameron <Jonathan.Cameron@huawei.com>
X-Mailer: b4 0.13-dev

With linux/acpi.h no longer implicitly including of.h, add an explicit
include of of.h to fix the following error:

drivers/staging/iio/resolver/ad2s1210.c:706:21: error: implicit declaration of function 'of_match_ptr' is invalid in C99 [-Werror,-Wimplicit-function-declaration]

Acked-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Reviewed-by: Jacob Keller <jacob.e.keller@intel.com>
Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/staging/iio/resolver/ad2s1210.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/iio/resolver/ad2s1210.c b/drivers/staging/iio/resolver/ad2s1210.c
index e4cf42438487..eb364639fa58 100644
--- a/drivers/staging/iio/resolver/ad2s1210.c
+++ b/drivers/staging/iio/resolver/ad2s1210.c
@@ -7,6 +7,7 @@
 #include <linux/types.h>
 #include <linux/mutex.h>
 #include <linux/device.h>
+#include <linux/of.h>
 #include <linux/spi/spi.h>
 #include <linux/slab.h>
 #include <linux/sysfs.h>

-- 
2.39.2

