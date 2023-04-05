Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1776F79D3
	for <linux-staging@lists.linux.dev>; Wed,  5 Apr 2023 20:27:33 +0000 (UTC)
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-17fcc07d6c4so25867753fac.8
        for <linux-staging@lists.linux.dev>; Wed, 05 Apr 2023 13:27:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680726452;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6TsRE4TQ/f8Cdh7WoRAUoCQ/ygs9RmxZbH2hBLQ+0B0=;
        b=JwWgLlWLNnnRUPvl+08wsgajmrr3NAuIt+3Kk99I/3tx9U9W7QITMIAX6jpHLSSdrN
         oNLyNi0ZMlvqXARc7hGqN60Kky8OJG4M0rsMyng52LEqobPkyr+tb0bnUJfk0CgnGQqC
         FEup9nvBHFYcmV4FwTG6eesxa5AP8QpIlw7qML9rBEePjtdKMTrL+0MLzM5bQHBTcyNO
         f6yewu/VWKVwlQlcd3m6EgB/1/W0qUaGGdSkWfh1QbmmZk4bR6mJcZp4SxTMlj3c2NOJ
         5JEdy8Rxh5PWKyM88vAD4IT/5j027rFQZU4kzbB6jdTOYrmVzs+uqpU4SVAmwdsq0SD1
         cQGA==
X-Gm-Message-State: AAQBX9ceFFtZyMJnk0NNS2CUZ/Ps2oM63M3YPLitne1PdagMd1Hx/m87
	e6qcS+4fqup+9mvu1CLcGQ==
X-Google-Smtp-Source: AKy350YpAV4Ot9iJZkIzmYiWr5uOjLPTxFWn3uKDFPsohB5jBkFe6vSXLe2T2ZW1wyGq+/LUiLg3xw==
X-Received: by 2002:a05:6870:d389:b0:17a:c2be:33c with SMTP id k9-20020a056870d38900b0017ac2be033cmr4333581oag.4.1680726452615;
        Wed, 05 Apr 2023 13:27:32 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id yx16-20020a056871251000b001762d1bf6a9sm6184930oab.45.2023.04.05.13.27.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Apr 2023 13:27:32 -0700 (PDT)
Received: (nullmailer pid 425896 invoked by uid 1000);
	Wed, 05 Apr 2023 20:27:17 -0000
From: Rob Herring <robh@kernel.org>
Date: Wed, 05 Apr 2023 15:27:23 -0500
Subject: [PATCH v2 09/10] fpga: lattice-sysconfig-spi: Add explicit include
 for of.h
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230329-acpi-header-cleanup-v2-9-c902e581923b@kernel.org>
References: <20230329-acpi-header-cleanup-v2-0-c902e581923b@kernel.org>
In-Reply-To: <20230329-acpi-header-cleanup-v2-0-c902e581923b@kernel.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, Marcelo Schmitt <marcelo.schmitt1@gmail.com>, Lars-Peter Clausen <lars@metafoo.de>, Michael Hennerich <Michael.Hennerich@analog.com>, Jonathan Cameron <jic23@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Johannes Berg <johannes@sipsolutions.net>, "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Jiri Slaby <jirislaby@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Marc Zyngier <maz@kernel.org>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, linux-serial@vger.kernel.org, linux-tegra@vger.kernel.org, linux-acpi@vger.kernel.org, devicetree@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>, Jacob Keller <jacob.e.keller@intel.com>
X-Mailer: b4 0.13-dev

With linux/acpi.h (in spi/spi.h) no longer implicitly including of.h,
add an explicit include of of.h to fix the following errors:

drivers/fpga/lattice-sysconfig-spi.c:146:35: error: implicit declaration of function 'of_match_ptr' [-Werror=implicit-function-declaration]

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Rob Herring <robh@kernel.org>
---
v2: New patch
---
 drivers/fpga/lattice-sysconfig-spi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/fpga/lattice-sysconfig-spi.c b/drivers/fpga/lattice-sysconfig-spi.c
index 2702b26b7f55..44691cfcf50a 100644
--- a/drivers/fpga/lattice-sysconfig-spi.c
+++ b/drivers/fpga/lattice-sysconfig-spi.c
@@ -3,6 +3,7 @@
  * Lattice FPGA programming over slave SPI sysCONFIG interface.
  */
 
+#include <linux/of.h>
 #include <linux/spi/spi.h>
 
 #include "lattice-sysconfig.h"

-- 
2.39.2

