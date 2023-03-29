Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2C118821
	for <linux-staging@lists.linux.dev>; Wed, 29 Mar 2023 21:21:46 +0000 (UTC)
Received: by mail-oi1-f177.google.com with SMTP id r84so11419101oih.11
        for <linux-staging@lists.linux.dev>; Wed, 29 Mar 2023 14:21:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680124906;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ztuu6Fsug8mRxKnYsfiismCx0sBKyfeU96HhnyE0Bjs=;
        b=MEd53tvqjXPA5inporvOsCitInDN5DZXVTxIwkOwi7HTILzcjYlHu9dZWcityzuOm7
         n76VqVYiiQU9fOX0PkBzLXnIPqnaXr9wFA+thkKCH9hnpwysBAg5JjZDdJ7kHMhwRCvy
         eagZ0lGwLw++YcwrRsw1nyUpgfjDxmiu94MWYZmhT4vNDlwkPMDpl4Y8VKsnv7HQB8ws
         w7MUfikCIj6A9cTTJVUZuFT9vUt+6kZ8YKr7gqmUsx3E+90qTQUJTDK1f0WF6isj++j5
         e22laF2sGQ2mqYK3skTjI0JSfFeasFA6+xJ+ajosAgbzk3Uy1aiy4FfIWsUfDp8/++T5
         z4EA==
X-Gm-Message-State: AO0yUKUxCWso/Sjaox4wYfUAhfVWbrncP9JxgcmluOBp7yFMmHS2ACed
	BS0VUble87b4uRzVSX8ifA==
X-Google-Smtp-Source: AK7set8ebntw2ESdGB7l5PdDO6NsIvCSiIc8J8/t/ipIkwSdCjkA74SknOyxYwAjPu2eirZsztFa4A==
X-Received: by 2002:a05:6808:7cf:b0:35e:d787:ec7f with SMTP id f15-20020a05680807cf00b0035ed787ec7fmr8881054oij.50.1680124905841;
        Wed, 29 Mar 2023 14:21:45 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id r184-20020a4a4ec1000000b005251e3f92ecsm14394555ooa.47.2023.03.29.14.21.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Mar 2023 14:21:45 -0700 (PDT)
Received: (nullmailer pid 86899 invoked by uid 1000);
	Wed, 29 Mar 2023 21:21:39 -0000
From: Rob Herring <robh@kernel.org>
Date: Wed, 29 Mar 2023 16:20:46 -0500
Subject: [PATCH 5/5] ACPI: Replace irqdomain.h include with struct
 declarations
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230329-acpi-header-cleanup-v1-5-8dc5cd3c610e@kernel.org>
References: <20230329-acpi-header-cleanup-v1-0-8dc5cd3c610e@kernel.org>
In-Reply-To: <20230329-acpi-header-cleanup-v1-0-8dc5cd3c610e@kernel.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, Marcelo Schmitt <marcelo.schmitt1@gmail.com>, Lars-Peter Clausen <lars@metafoo.de>, Michael Hennerich <Michael.Hennerich@analog.com>, Jonathan Cameron <jic23@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Johannes Berg <johannes@sipsolutions.net>, "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Jiri Slaby <jirislaby@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Marc Zyngier <maz@kernel.org>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, linux-serial@vger.kernel.org, linux-tegra@vger.kernel.org, linux-acpi@vger.kernel.org, devicetree@vger.kernel.org
X-Mailer: b4 0.13-dev

linux/acpi.h includes irqdomain.h which includes of.h. Break the include
chain by replacing the irqdomain include with forward declarations for
struct irq_domain and irq_domain_ops which is sufficient for acpi.h.

Cc: Marc Zyngier <maz@kernel.org>
Signed-off-by: Rob Herring <robh@kernel.org>
---
 include/linux/acpi.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/include/linux/acpi.h b/include/linux/acpi.h
index efff750f326d..169c17c0b0dc 100644
--- a/include/linux/acpi.h
+++ b/include/linux/acpi.h
@@ -10,12 +10,14 @@
 
 #include <linux/errno.h>
 #include <linux/ioport.h>	/* for struct resource */
-#include <linux/irqdomain.h>
 #include <linux/resource_ext.h>
 #include <linux/device.h>
 #include <linux/property.h>
 #include <linux/uuid.h>
 
+struct irq_domain;
+struct irq_domain_ops;
+
 #ifndef _LINUX
 #define _LINUX
 #endif

-- 
2.39.2

