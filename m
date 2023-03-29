Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16B1A881F
	for <linux-staging@lists.linux.dev>; Wed, 29 Mar 2023 21:21:50 +0000 (UTC)
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-17ebba88c60so17703975fac.3
        for <linux-staging@lists.linux.dev>; Wed, 29 Mar 2023 14:21:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680124909;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D6kdJkdEvlZGQb1vCK3qYJWmWN2WbnFemR8/3BecZeY=;
        b=HlDybgWP9AEArm6xJyMQoPRa8yNcqkV2MuNrLcO9LVRo9MlLd5iolEq8pnsZLHizCJ
         eT6Y7In/j3/I1mpDOaNmNzg5Lrg0uUu+6+EuhQ06JgFwb7sHJFrXaQUINQiAk6yZnd0J
         1Jf75iIi/YIPfeX67lgewqktACWu9rEU5q1JLRY4SefQiJUMEUtzTJBESD5OM+MtyQYx
         cEzCuhFgU73FzpYkSGXJFBUPEL4StYeXpmMeZ/LhzmYYFw/Tmnbpab9D3h0zddB4DaE0
         XZzi3xX3WXkeBSgxujxOya9GBwhselZNkPoMAZJyBwLLjRsLNTizRIZuIDLeHGl9ggXC
         3x2g==
X-Gm-Message-State: AAQBX9cIWhX7aBqONrE00vESdNUV0gb/4MlGT8QbHHRQgp25wOJa6iv1
	rj2k/781x50q1aonvXghdTxBvltZOg==
X-Google-Smtp-Source: AKy350Yz8wBQUIa2vxnrxVjt+nPqC1UmY+M1RkG0ncdyC4Riz1moWMsQ9Ah3S0EOekgAOjxhUNzThA==
X-Received: by 2002:a05:6870:3284:b0:17a:f8b1:8bae with SMTP id q4-20020a056870328400b0017af8b18baemr11963271oac.37.1680124908972;
        Wed, 29 Mar 2023 14:21:48 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id z26-20020a056830129a00b006a1508d348dsm2892795otp.22.2023.03.29.14.21.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Mar 2023 14:21:48 -0700 (PDT)
Received: (nullmailer pid 86895 invoked by uid 1000);
	Wed, 29 Mar 2023 21:21:39 -0000
From: Rob Herring <robh@kernel.org>
Date: Wed, 29 Mar 2023 16:20:44 -0500
Subject: [PATCH 3/5] net: rfkill-gpio: Add explicit include for of.h
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230329-acpi-header-cleanup-v1-3-8dc5cd3c610e@kernel.org>
References: <20230329-acpi-header-cleanup-v1-0-8dc5cd3c610e@kernel.org>
In-Reply-To: <20230329-acpi-header-cleanup-v1-0-8dc5cd3c610e@kernel.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, Marcelo Schmitt <marcelo.schmitt1@gmail.com>, Lars-Peter Clausen <lars@metafoo.de>, Michael Hennerich <Michael.Hennerich@analog.com>, Jonathan Cameron <jic23@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Johannes Berg <johannes@sipsolutions.net>, "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Jiri Slaby <jirislaby@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Marc Zyngier <maz@kernel.org>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, linux-serial@vger.kernel.org, linux-tegra@vger.kernel.org, linux-acpi@vger.kernel.org, devicetree@vger.kernel.org
X-Mailer: b4 0.13-dev

With linux/acpi.h no longer implicitly including of.h, add an explicit
include of of.h to fix the following error:

net/rfkill/rfkill-gpio.c:181:21: error: implicit declaration of function 'of_match_ptr' is invalid in C99 [-Werror,-Wimplicit-function-declaration]

Signed-off-by: Rob Herring <robh@kernel.org>
---
 net/rfkill/rfkill-gpio.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/net/rfkill/rfkill-gpio.c b/net/rfkill/rfkill-gpio.c
index 786dbfdad772..e9d1b2f2ff0a 100644
--- a/net/rfkill/rfkill-gpio.c
+++ b/net/rfkill/rfkill-gpio.c
@@ -8,6 +8,7 @@
 #include <linux/module.h>
 #include <linux/mod_devicetable.h>
 #include <linux/rfkill.h>
+#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/clk.h>
 #include <linux/slab.h>

-- 
2.39.2

