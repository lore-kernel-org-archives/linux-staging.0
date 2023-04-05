Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E317B79D2
	for <linux-staging@lists.linux.dev>; Wed,  5 Apr 2023 20:27:29 +0000 (UTC)
Received: by mail-oo1-f53.google.com with SMTP id j4-20020a4adf44000000b0053e8b5524abso3128694oou.2
        for <linux-staging@lists.linux.dev>; Wed, 05 Apr 2023 13:27:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680726449;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GAqWU+48WoaNwVsMQUW3yn78CcKWsUQ7YyWgh3fTfc8=;
        b=fmDBFvobX4hRW8UUVtDmKtXmnVgCQGVGkDKArEr8ItJhJ/24DMaCiQldypcr4PL0tA
         2cKosGz5qZKAniblcSJvHOSARhr32nULVRCofpVK/wyQSrmcicU5vY6Sn5rbcwj+zu4t
         014oBzBh7NPCOdzILRO58kaEgjBJcYFXjHOVljgBGu2BdrSjHxZQ2UzlOZhTPllbVTA3
         HeHRDtiwkuqZVc2F82jkS9VNsww3KmZSsld1U0Aqw6YRS/mMxhm24lmuArUQ+LWAUvQ4
         4tZwgLDCssQND5M4wehCZvHbBsXhjlYc9xBlb3hwAGGVsKxw2R730oIsl3Y03HnQr2LP
         tFaA==
X-Gm-Message-State: AAQBX9d1JvAF6u8fLDeNRtDExpywhqDTbeNbH1242hV/AeYBAaApZK2S
	AHCysvtmabyL3WTvwl7i9w==
X-Google-Smtp-Source: AKy350YDcJ1CZzHlV2kqdYr697ExgpShFdyPyAcvheTe5bMbxgbese/Ryv3UqrMfOdlmbR/018pfjA==
X-Received: by 2002:a4a:abca:0:b0:53b:77e0:b7f4 with SMTP id o10-20020a4aabca000000b0053b77e0b7f4mr3417660oon.2.1680726448953;
        Wed, 05 Apr 2023 13:27:28 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id 64-20020a4a0943000000b005315e8ca468sm7021809ooa.17.2023.04.05.13.27.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Apr 2023 13:27:28 -0700 (PDT)
Received: (nullmailer pid 425892 invoked by uid 1000);
	Wed, 05 Apr 2023 20:27:17 -0000
From: Rob Herring <robh@kernel.org>
Date: Wed, 05 Apr 2023 15:27:21 -0500
Subject: [PATCH v2 07/10] virtio-mmio: Add explicit include for of.h
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230329-acpi-header-cleanup-v2-7-c902e581923b@kernel.org>
References: <20230329-acpi-header-cleanup-v2-0-c902e581923b@kernel.org>
In-Reply-To: <20230329-acpi-header-cleanup-v2-0-c902e581923b@kernel.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, Marcelo Schmitt <marcelo.schmitt1@gmail.com>, Lars-Peter Clausen <lars@metafoo.de>, Michael Hennerich <Michael.Hennerich@analog.com>, Jonathan Cameron <jic23@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Johannes Berg <johannes@sipsolutions.net>, "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Jiri Slaby <jirislaby@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Marc Zyngier <maz@kernel.org>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, linux-serial@vger.kernel.org, linux-tegra@vger.kernel.org, linux-acpi@vger.kernel.org, devicetree@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>, Jacob Keller <jacob.e.keller@intel.com>
X-Mailer: b4 0.13-dev

With linux/acpi.h no longer implicitly including of.h, add an explicit
include of of.h to fix the following error:

drivers/virtio/virtio_mmio.c:492:13: error: implicit declaration of function 'of_property_read_bool'; did you mean 'fwnode_property_read_bool'? [-Werror=implicit-function-declaration]

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Rob Herring <robh@kernel.org>
---
v2: New patch
---
 drivers/virtio/virtio_mmio.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/virtio/virtio_mmio.c b/drivers/virtio/virtio_mmio.c
index 3ff746e3f24a..4b5e883055ee 100644
--- a/drivers/virtio/virtio_mmio.c
+++ b/drivers/virtio/virtio_mmio.c
@@ -61,6 +61,7 @@
 #include <linux/io.h>
 #include <linux/list.h>
 #include <linux/module.h>
+#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/pm.h>
 #include <linux/slab.h>

-- 
2.39.2

