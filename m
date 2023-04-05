Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D841D79D2
	for <linux-staging@lists.linux.dev>; Wed,  5 Apr 2023 20:27:31 +0000 (UTC)
Received: by mail-ot1-f41.google.com with SMTP id a30-20020a9d3e1e000000b006a13f728172so16495738otd.3
        for <linux-staging@lists.linux.dev>; Wed, 05 Apr 2023 13:27:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680726451;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JEWSD1fDMkPcJVVJWl/niMBCZ1+LVTX0zVxuNNm1m3A=;
        b=0lZTFb3Lvf4pypVOLZzmHUticgW3Z2ui5tip2H2fPVRYEn022cCUdVTO6OyyU/An+b
         1w3CwXk9ujVQSOD9q0/AnbIm05EIIi8IOW7gBakikBlq+TBovcO0VVwSMMC+5dD+i5VX
         13L4Uv7x9vfgRWaQUYyC2J9auUJb/A18vMa/F4iQ3wGK8akFnyLP3xOaZ9Dd/+yxfeQB
         MjUFKk2ubpKFtoYrINEbUG+XKidq/mRdhrXLPw2GKfOwnNU15xEDHdAkId2KDIYUxlhN
         xmHK9naTe3jbQLYRMDaMserUlM/ANNCwIKvxgZsdPX4FGSLMw/xc0dHDVjTibOeMxrUx
         yx4g==
X-Gm-Message-State: AAQBX9cUWTxzzUhw8SCORWWiZlTxqQ0OyPUL1YfM6Djm5jK9bdv7eOYf
	VPQMCLUir6WnrzQhojzzmw==
X-Google-Smtp-Source: AKy350ZaKRbNw5BVz8JUbstjxm9/rqgC8dw7YeQcDPRMSjLceOYL23HZjUhfc7B3LKhXZbj89AVs5g==
X-Received: by 2002:a9d:1b4d:0:b0:6a1:6a4b:bbb3 with SMTP id l71-20020a9d1b4d000000b006a16a4bbbb3mr1662878otl.14.1680726450887;
        Wed, 05 Apr 2023 13:27:30 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id x9-20020a05683000c900b006a30260ccfdsm5958075oto.11.2023.04.05.13.27.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Apr 2023 13:27:30 -0700 (PDT)
Received: (nullmailer pid 425884 invoked by uid 1000);
	Wed, 05 Apr 2023 20:27:17 -0000
From: Rob Herring <robh@kernel.org>
Date: Wed, 05 Apr 2023 15:27:17 -0500
Subject: [PATCH v2 03/10] net: rfkill-gpio: Add explicit include for of.h
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230329-acpi-header-cleanup-v2-3-c902e581923b@kernel.org>
References: <20230329-acpi-header-cleanup-v2-0-c902e581923b@kernel.org>
In-Reply-To: <20230329-acpi-header-cleanup-v2-0-c902e581923b@kernel.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, Marcelo Schmitt <marcelo.schmitt1@gmail.com>, Lars-Peter Clausen <lars@metafoo.de>, Michael Hennerich <Michael.Hennerich@analog.com>, Jonathan Cameron <jic23@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Johannes Berg <johannes@sipsolutions.net>, "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Jiri Slaby <jirislaby@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Marc Zyngier <maz@kernel.org>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, linux-serial@vger.kernel.org, linux-tegra@vger.kernel.org, linux-acpi@vger.kernel.org, devicetree@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>, Jacob Keller <jacob.e.keller@intel.com>
X-Mailer: b4 0.13-dev

With linux/acpi.h no longer implicitly including of.h, add an explicit
include of of.h to fix the following error:

net/rfkill/rfkill-gpio.c:181:21: error: implicit declaration of function 'of_match_ptr' is invalid in C99 [-Werror,-Wimplicit-function-declaration]

Acked-by: Johannes Berg <johannes@sipsolutions.net>
Reviewed-by: Jacob Keller <jacob.e.keller@intel.com>
Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
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

