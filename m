Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C67B779D3
	for <linux-staging@lists.linux.dev>; Wed,  5 Apr 2023 20:27:24 +0000 (UTC)
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-17fcc07d6c4so25867274fac.8
        for <linux-staging@lists.linux.dev>; Wed, 05 Apr 2023 13:27:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680726444;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yg1K4foqDaidaPo4/5C6TY3pSXqX5fHqLYuPmpMmEgg=;
        b=YiSj99rCOCsJaUeylOBAp7zN2xt517j+s/yEVbp86+zvuRqF+9p6RTQ4SsZDr7CLhV
         5dE26qMg5cj12zvhT8CTcGF4fg4b2gwK6bVp74e6hrr/mat3Es7kCupr7gG9eEYASY48
         4iF5bKuCEFwURqUxwgIMTqrrInr6ahvJOv0cOnLLUxW3COUPXVtlx/o2y2qb9beDPff6
         v1yB/QKYPmwmlRJXPWaPGenCjBqfJDblw8k10NgweCCX6MRUCPa5d8mZifpTp47emNmc
         3EMB1aTTbV2/97Xu4kGrCwizr90QhHPa8E1VD2NO9tbWkiRpTbBeU7zN9+zh0e0tI4Ro
         IPPQ==
X-Gm-Message-State: AAQBX9etQAqYvhEujoZSpKzr4EHNwJxsjTE3M4NfnHgR8EDxjLXE8emm
	DS12lZecBB8TinTQ4r3jEg==
X-Google-Smtp-Source: AKy350bTANSJNYjcjMqwec2FcT3JaHREFNy2cg8JiUp8B+fT5fTAH8S+FermWNwrA9+XTX/0poqDFg==
X-Received: by 2002:a05:6870:9614:b0:177:9ece:6b32 with SMTP id d20-20020a056870961400b001779ece6b32mr4080421oaq.34.1680726443848;
        Wed, 05 Apr 2023 13:27:23 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id us16-20020a056870df9000b00177b33ce85bsm6324810oab.30.2023.04.05.13.27.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Apr 2023 13:27:23 -0700 (PDT)
Received: (nullmailer pid 425880 invoked by uid 1000);
	Wed, 05 Apr 2023 20:27:17 -0000
From: Rob Herring <robh@kernel.org>
Date: Wed, 05 Apr 2023 15:27:15 -0500
Subject: [PATCH v2 01/10] iio: adc: ad7292: Add explicit include for of.h
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230329-acpi-header-cleanup-v2-1-c902e581923b@kernel.org>
References: <20230329-acpi-header-cleanup-v2-0-c902e581923b@kernel.org>
In-Reply-To: <20230329-acpi-header-cleanup-v2-0-c902e581923b@kernel.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, Marcelo Schmitt <marcelo.schmitt1@gmail.com>, Lars-Peter Clausen <lars@metafoo.de>, Michael Hennerich <Michael.Hennerich@analog.com>, Jonathan Cameron <jic23@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Johannes Berg <johannes@sipsolutions.net>, "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Jiri Slaby <jirislaby@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Marc Zyngier <maz@kernel.org>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, linux-serial@vger.kernel.org, linux-tegra@vger.kernel.org, linux-acpi@vger.kernel.org, devicetree@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>, Jacob Keller <jacob.e.keller@intel.com>, Jonathan Cameron <Jonathan.Cameron@huawei.com>
X-Mailer: b4 0.13-dev

With linux/acpi.h no longer implicitly including of.h, add an explicit
include of of.h to fix the following error:

drivers/iio/adc/ad7292.c:307:9: error: implicit declaration of function 'for_each_available_child_of_node'; did you mean 'fwnode_for_each_available_child_node'? [-Werror=implicit-function-declaration]

Acked-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Acked-by: Marcelo Schmitt <marcelo.schmitt1@gmail.com>
Reviewed-by: Jacob Keller <jacob.e.keller@intel.com>
Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/iio/adc/ad7292.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/iio/adc/ad7292.c b/drivers/iio/adc/ad7292.c
index a2f9fda25ff3..cccacec5db6d 100644
--- a/drivers/iio/adc/ad7292.c
+++ b/drivers/iio/adc/ad7292.c
@@ -8,6 +8,7 @@
 #include <linux/bitfield.h>
 #include <linux/device.h>
 #include <linux/module.h>
+#include <linux/of.h>
 #include <linux/regulator/consumer.h>
 #include <linux/spi/spi.h>
 

-- 
2.39.2

