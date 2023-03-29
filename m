Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C87A7881F
	for <linux-staging@lists.linux.dev>; Wed, 29 Mar 2023 21:21:43 +0000 (UTC)
Received: by mail-ot1-f49.google.com with SMTP id r17-20020a05683002f100b006a131458abfso6393637ote.2
        for <linux-staging@lists.linux.dev>; Wed, 29 Mar 2023 14:21:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680124903;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kTc/gK9GmP1rEeyJeskNOO/tBqpZ4qwY5m/PbyMALU8=;
        b=Z6lic+Sly2gQyOyYk/wOUzNDxBYtM0LhfqZZDzEsP/Roey8gNeXBRzdmn/9d4T0IP6
         MZsDOXjdxCFaHdzwalo8QXKLctfLv5dwJa9dm4u/CQzz+Gt87jgs+08SBvDjz5+LlabE
         hYRNlk9ZgyXf+qiLDJ21+8CMxfqSI3nltuWlKli8qM94Lc6RW4I5njYGiR9dpmMiKsVq
         +WvttX/cHkOWsQZeazc/nLLo97b97WtqlkP6zoxahL7oOTL1F3HQtx54yQxGRqDOLJoN
         0l238ukR/MELBwDkys/JXo2bKXeDhz1TTFZrkZ+VnMFbSwKfNpA0ijcmZQZhpZSLligv
         yzWQ==
X-Gm-Message-State: AO0yUKXFk2AUZZuCkik4bOvQfza96CJ26E80wjceH7uGPTC9PfzgX7ln
	GlQq2udaEBKDY6MJK0GkvQ==
X-Google-Smtp-Source: AK7set+ImQpMRKobWrA54g0Rd55UmfWERJrl2wg/MsdZOQM+xtCfqAdTFVRvw6llUMom53yDtU8M2w==
X-Received: by 2002:a05:6830:1bed:b0:69f:8fe4:38b9 with SMTP id k13-20020a0568301bed00b0069f8fe438b9mr10389551otb.21.1680124902837;
        Wed, 29 Mar 2023 14:21:42 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id t16-20020a0568301e3000b0069f9209c84dsm9588548otr.60.2023.03.29.14.21.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Mar 2023 14:21:42 -0700 (PDT)
Received: (nullmailer pid 86897 invoked by uid 1000);
	Wed, 29 Mar 2023 21:21:39 -0000
From: Rob Herring <robh@kernel.org>
Date: Wed, 29 Mar 2023 16:20:45 -0500
Subject: [PATCH 4/5] serial: 8250_tegra: Add explicit include for of.h
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230329-acpi-header-cleanup-v1-4-8dc5cd3c610e@kernel.org>
References: <20230329-acpi-header-cleanup-v1-0-8dc5cd3c610e@kernel.org>
In-Reply-To: <20230329-acpi-header-cleanup-v1-0-8dc5cd3c610e@kernel.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, Marcelo Schmitt <marcelo.schmitt1@gmail.com>, Lars-Peter Clausen <lars@metafoo.de>, Michael Hennerich <Michael.Hennerich@analog.com>, Jonathan Cameron <jic23@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Johannes Berg <johannes@sipsolutions.net>, "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Jiri Slaby <jirislaby@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Marc Zyngier <maz@kernel.org>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, linux-serial@vger.kernel.org, linux-tegra@vger.kernel.org, linux-acpi@vger.kernel.org, devicetree@vger.kernel.org
X-Mailer: b4 0.13-dev

With linux/acpi.h no longer implicitly including of.h, add an explicit
include of of.h to fix the following error:

drivers/tty/serial/8250/8250_tegra.c:68:15: error: implicit declaration of function 'of_alias_get_id' [-Werror=implicit-function-declaration]

Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/tty/serial/8250/8250_tegra.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/tty/serial/8250/8250_tegra.c b/drivers/tty/serial/8250/8250_tegra.c
index e7cddeec9d8e..2509e7f74ccf 100644
--- a/drivers/tty/serial/8250/8250_tegra.c
+++ b/drivers/tty/serial/8250/8250_tegra.c
@@ -11,6 +11,7 @@
 #include <linux/delay.h>
 #include <linux/io.h>
 #include <linux/module.h>
+#include <linux/of.h>
 #include <linux/reset.h>
 #include <linux/slab.h>
 

-- 
2.39.2

