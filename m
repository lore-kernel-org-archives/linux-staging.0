Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B6EB3C0A
	for <linux-staging@lists.linux.dev>; Wed, 29 Mar 2023 21:21:45 +0000 (UTC)
Received: by mail-oo1-f45.google.com with SMTP id n7-20020a4ae1c7000000b0053b61145406so2669727oot.11
        for <linux-staging@lists.linux.dev>; Wed, 29 Mar 2023 14:21:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680124904;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=37Xl94wcW5o8GgPxt4yvsEyDEY9V4plxLsoIYPVLn9U=;
        b=5m79j5YJyX8onqwHKzwU6hOarMVFVE75hJBJoBKCmJ0MvW7sEq7NpZxha8tfi33ysp
         o2Lk1T9wP2YujB1snQULiDZb2UdM0yDGUOGWbrFW8wJRysotatDMgJUIIjMhqK5tfLPF
         xANYi6RC49F6sz9HeN0kPzh8iJZtNQKJ9JQcw5+UyBWgV9f4cZuffUWYRdZwB4IxLnQO
         zSMAppB4Nga+JpYPoJxJK7DonGmtCwJfJUDLwHbaovHeb8bnIgcQaj4TCMgnxtC4RJUp
         0VDh3NUvsJ98hcQzLGWwa2hsFQ9xBFkdw+H0C/+dAKzQez7Q0eaLfxhIBcwIL08/CL/M
         L+qA==
X-Gm-Message-State: AO0yUKWhyzExnMbA33fGn0XOooXE1/bJRZ8S5qM0P/0VeDEXWFMzu+LG
	M8gtll9xwxXfiutCoVbDAQ==
X-Google-Smtp-Source: AK7set++w7Qvp7fi2DIzI+DP77MwWEUdgIW4IIMfm5HQ31TJqVwIb2TPyVmM9Cf/Vqup9kOVESVp/Q==
X-Received: by 2002:a4a:2ccf:0:b0:52b:bab5:eba2 with SMTP id o198-20020a4a2ccf000000b0052bbab5eba2mr9319519ooo.0.1680124904322;
        Wed, 29 Mar 2023 14:21:44 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id c3-20020aca1c03000000b0038901ece6e9sm4982583oic.12.2023.03.29.14.21.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Mar 2023 14:21:44 -0700 (PDT)
Received: (nullmailer pid 86891 invoked by uid 1000);
	Wed, 29 Mar 2023 21:21:39 -0000
From: Rob Herring <robh@kernel.org>
Date: Wed, 29 Mar 2023 16:20:42 -0500
Subject: [PATCH 1/5] iio: adc: ad7292: Add explicit include for of.h
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230329-acpi-header-cleanup-v1-1-8dc5cd3c610e@kernel.org>
References: <20230329-acpi-header-cleanup-v1-0-8dc5cd3c610e@kernel.org>
In-Reply-To: <20230329-acpi-header-cleanup-v1-0-8dc5cd3c610e@kernel.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, Marcelo Schmitt <marcelo.schmitt1@gmail.com>, Lars-Peter Clausen <lars@metafoo.de>, Michael Hennerich <Michael.Hennerich@analog.com>, Jonathan Cameron <jic23@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Johannes Berg <johannes@sipsolutions.net>, "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Jiri Slaby <jirislaby@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Marc Zyngier <maz@kernel.org>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, linux-serial@vger.kernel.org, linux-tegra@vger.kernel.org, linux-acpi@vger.kernel.org, devicetree@vger.kernel.org
X-Mailer: b4 0.13-dev

With linux/acpi.h no longer implicitly including of.h, add an explicit
include of of.h to fix the following error:

drivers/iio/adc/ad7292.c:307:9: error: implicit declaration of function 'for_each_available_child_of_node'; did you mean 'fwnode_for_each_available_child_node'? [-Werror=implicit-function-declaration]

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

