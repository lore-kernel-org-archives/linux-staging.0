Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 521BF881F
	for <linux-staging@lists.linux.dev>; Wed, 29 Mar 2023 21:21:48 +0000 (UTC)
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-17ac5ee3f9cso17681043fac.12
        for <linux-staging@lists.linux.dev>; Wed, 29 Mar 2023 14:21:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680124907;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IXNpMlIrMI4hrwmIfNojDL6fBE+dcZw7V7KtUFtbAVU=;
        b=TJ+TAkkTwSjMWZ2JVA53yV8hfyUGCM5bNZG4Ud5WJ6o3whDraynfVxaHSUDM5nVJOu
         vAQ7b/WHbcCKQj5WE5s2ZD4vfNYYCVG2qy2veZ3KRlNgnTNTGIK6sjrhyf8KSEKfpXG6
         e4taf5HLecf6vPjxsw1IHUdsllMzWE6ImY5NLb/d7/ROW9pqWEcZNDxnk1P8SXnYA7YM
         VsxvJWdpeUeuvC251jiO/gOe44roVAByc+uE58or2AybxuVyRC4ar3QElENaxPMaGer4
         jPL7rBdNlgkeAaP1SRdO+12OFRLNO/HTMGyHOhhFqXW9h3a6Sz+zSQR7EH1VB/kJ008M
         6v0g==
X-Gm-Message-State: AO0yUKVYWz8afY7VALiXFGG/fJ1gEHpYz4pjklBBjX/gPyrhY/e59vL8
	ztSgga2g5DN5AklDcQjUyQ==
X-Google-Smtp-Source: AKy350aTCWxV4oo/omjSqtMSrN/g7rN22T8lJIZrRhsZAbjj9smwXQX9C4/AOBFxX+S5/Qg9cm2ANg==
X-Received: by 2002:a05:6870:1693:b0:172:7fc0:9188 with SMTP id j19-20020a056870169300b001727fc09188mr11799906oae.35.1680124907393;
        Wed, 29 Mar 2023 14:21:47 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id k29-20020a05687022dd00b0017e7052ed84sm8402484oaf.41.2023.03.29.14.21.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Mar 2023 14:21:46 -0700 (PDT)
Received: (nullmailer pid 86893 invoked by uid 1000);
	Wed, 29 Mar 2023 21:21:39 -0000
From: Rob Herring <robh@kernel.org>
Date: Wed, 29 Mar 2023 16:20:43 -0500
Subject: [PATCH 2/5] staging: iio: resolver: ad2s1210: Add explicit include
 for of.h
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230329-acpi-header-cleanup-v1-2-8dc5cd3c610e@kernel.org>
References: <20230329-acpi-header-cleanup-v1-0-8dc5cd3c610e@kernel.org>
In-Reply-To: <20230329-acpi-header-cleanup-v1-0-8dc5cd3c610e@kernel.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, Marcelo Schmitt <marcelo.schmitt1@gmail.com>, Lars-Peter Clausen <lars@metafoo.de>, Michael Hennerich <Michael.Hennerich@analog.com>, Jonathan Cameron <jic23@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Johannes Berg <johannes@sipsolutions.net>, "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Jiri Slaby <jirislaby@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Marc Zyngier <maz@kernel.org>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, linux-serial@vger.kernel.org, linux-tegra@vger.kernel.org, linux-acpi@vger.kernel.org, devicetree@vger.kernel.org
X-Mailer: b4 0.13-dev

With linux/acpi.h no longer implicitly including of.h, add an explicit
include of of.h to fix the following error:

drivers/staging/iio/resolver/ad2s1210.c:706:21: error: implicit declaration of function 'of_match_ptr' is invalid in C99 [-Werror,-Wimplicit-function-declaration]

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

