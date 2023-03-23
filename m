Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F222320A;
	Thu, 23 Mar 2023 09:04:08 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id ix20so21702753plb.3;
        Thu, 23 Mar 2023 02:04:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679562247;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OjcZplfqBfGxkesm/SQ2YHNMoUVOYWANADhv4EwbVKw=;
        b=hoFy1YlM+Ou4lh0YKLuMnMSIdbLbE14MqBS1SC7KjUNh2kF/qIvdI94Q/6Pf6fQYgD
         SLOV7FX4N/holaDTDjRHZYO5HjilL5W6VQ/vdCtKhXubLcAQBRhJvxnItxYn4W3Eoqkn
         qGZdnJtgtBoUwyYEJUkd/ZhRZ16fPJiij1SSdyQrqqoAWQ5/R8L774dQwWWPYDjV444G
         8sUCpfgwE2HbjBA/hwPluQ53d9VYOftWc/jM7PE8763T7HywEa+7U8M+nzXd2hsKbyWq
         eYeA5Z65UH7hAE1wRhvXz2D9i6gGDFXwp+uXSIZ3X4415fvat6tbxl4r5ewZEaIsLvZW
         ga5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679562247;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OjcZplfqBfGxkesm/SQ2YHNMoUVOYWANADhv4EwbVKw=;
        b=rrccxdYa1sKxEb8M1MoLJ/Zv6SjOVjKHTq6HhgfBjU42jDqIqc/JhiPuOOlQeo+eVY
         N8raWOd7mGRzgRDpoXjr2OWMeMzP+k2IGqFR8U6uG9fYTLTVQzB0Apdlkt0PtgHUjxKv
         qEOk+oU/PCR2Vgw0WvDS1WHXMZCQs71EoWr0iQAooxa2au6VzeN30q9GJB+wD7YD4TkT
         6bph5X7rAnK1LiKoQuTvjVaYhCItq5cEkrkWhIlPYQdeaEQPmlkJbQdxeOnvd9TOGmZv
         q8DN/QDgHlWa7p/fkPsp/or6aKrBeIogpnMLfQp9a5B1hMfvicewsAmQ5NhLKOzPSXD2
         LHRA==
X-Gm-Message-State: AO0yUKXsbV2Opk7wqBQuTrk8EiTCtX232yzsS2gLF0MsqxI2s919ZrNm
	gidfoNw63y6NvyB5D12po11AbYHk9BDOuQ==
X-Google-Smtp-Source: AK7set/oTTiOrApmUymSuNVVr+CSlC/dlZSzh452dlK3gzZb5t+MSmqd5fk4C8IAizbPWqksg3qEQQ==
X-Received: by 2002:a17:903:247:b0:19a:9880:175f with SMTP id j7-20020a170903024700b0019a9880175fmr6518482plh.51.1679562247398;
        Thu, 23 Mar 2023 02:04:07 -0700 (PDT)
Received: from ubuntu.localdomain ([117.207.139.205])
        by smtp.gmail.com with ESMTPSA id q8-20020a656848000000b005034a57b963sm11277116pgt.58.2023.03.23.02.04.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Mar 2023 02:04:06 -0700 (PDT)
From: Sumitra Sharma <sumitraartsy@gmail.com>
To: outreachy@lists.linux.dev
Cc: johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Sumitra Sharma <sumitraartsy@gmail.com>
Subject: [PATCH 1/3] Staging: greybus: Convert macro gpio_chip_to_gb_gpio_controller to an inline function
Date: Thu, 23 Mar 2023 02:03:34 -0700
Message-Id: <92e39b9957a1863d13fc5ce9e346e99c68550fa3.1679558269.git.sumitraartsy@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1679558269.git.sumitraartsy@gmail.com>
References: <cover.1679558269.git.sumitraartsy@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert 'gpio_chip_to_gb_gpio_controller' from a macro to a static
inline function, to make the relevant types apparent in the
definition and to benefit from the type checking performed by
the compiler at call sites.

Signed-off-by: Sumitra Sharma <sumitraartsy@gmail.com>
---
 drivers/staging/greybus/gpio.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/greybus/gpio.c b/drivers/staging/greybus/gpio.c
index d729b922a750..2a115a8fc263 100644
--- a/drivers/staging/greybus/gpio.c
+++ b/drivers/staging/greybus/gpio.c
@@ -41,8 +41,11 @@ struct gb_gpio_controller {
 	struct irq_chip		irqc;
 	struct mutex		irq_lock;
 };
-#define gpio_chip_to_gb_gpio_controller(chip) \
-	container_of(chip, struct gb_gpio_controller, chip)
+
+static inline struct gb_gpio_controller *gpio_chip_to_gb_gpio_controller(struct gpio_chip *chip)
+{
+	return container_of(chip, struct gb_gpio_controller, chip);
+}
 
 static struct gpio_chip *irq_data_to_gpio_chip(struct irq_data *d)
 {
-- 
2.25.1

