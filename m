Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CB07E4DB;
	Sun, 19 Mar 2023 15:29:24 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id ek18so37849450edb.6;
        Sun, 19 Mar 2023 08:29:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679239762;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hHi5+GWz44QI22N2lgNwAXCVNfgTvzls3W9uzDI9R7I=;
        b=A1K3LhmqfNVSEcgbGX/WGPLi+QBohjU8Z5DHP0patvexQ8cftYKkbJ0n6EBImk5HW6
         UG3Od9lWQz+pdUobR1WT79K1Vth47r61AMt5plC/fO7k98OkymeUkG/FFpi3yruiXLLe
         ek6/f+cxrtMdNf5pnqpcJsWYFXATIQYRAncu/xu52HpXK9FuAAQXTfnHVp1sVshk39/y
         SPzLTA2qgsb1aGWZcI4ESPkW/aT5UpUj3upvbNV4IbukUgevuZXKWukaWhAtA1KxT2sx
         +a4++/3MBnpA0HcQAhqoI8jBEeOWvRnAORLhu2VmIvl2V6VnzNEL2TjKv5Djdq5OfNfZ
         HQcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679239762;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hHi5+GWz44QI22N2lgNwAXCVNfgTvzls3W9uzDI9R7I=;
        b=YGKr8QJ2KZc2kXzG9oSIPeF9aorewo4HNVo8eGZp+5cGCbvgveb6GYruG+q/wrsgvE
         /zltYDDQhllQgHdzOtmINU8pquzF36aY8Zw7u/2DwQMtRvSE5mmshhqayLRX1fsV8qYi
         QAZM6FjkXUrtAwDgdUG2Jax7S1LaHLwzWKY6sEVXMR319GEEHZ9t/RZ/L/YoRUoN3XbQ
         g2Z6rgZ8Y5fXPTaAeyeSYm9M3pegENXHt6CEwGsJRCh0QZyRJA8aAMgQYnwlFHU2iCNW
         IffvBq7NxigIXBGUOd3TCnMIQxFind7vkgQ56FueN7kymcTtMnfHYZ+OsbFYYtCflmtC
         l39w==
X-Gm-Message-State: AO0yUKXvcLBlqE9kpfxeIRrd9XJlOfqNDHUa08oPRUUmkLpwntCIsEyx
	5wsQIJIkuQ7WGV08Y1wwU6w/qhNKLb4=
X-Google-Smtp-Source: AK7set/E0e+CI78tJzcFXyh5kyZx43f/wgftRrGinMc5pR7pChEra9ob+MPRBBpdNINOjJ8OqOz06g==
X-Received: by 2002:a17:906:8415:b0:930:3916:df19 with SMTP id n21-20020a170906841500b009303916df19mr5737952ejx.5.1679239762248;
        Sun, 19 Mar 2023 08:29:22 -0700 (PDT)
Received: from alaa-emad.. ([41.42.177.251])
        by smtp.gmail.com with ESMTPSA id ia9-20020a170907a06900b00932b3e2c015sm2425429ejc.51.2023.03.19.08.29.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Mar 2023 08:29:21 -0700 (PDT)
From: Menna Mahmoud <eng.mennamahmoud.mm@gmail.com>
To: gregkh@linuxfoundation.org
Cc: outreachy@lists.linux.dev,
	johan@kernel.org,
	elder@kernel.org,
	thierry.reding@gmail.com,
	u.kleine-koenig@pengutronix.de,
	greybus-dev@lists.linaro.org,
	linux-pwm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	eng.mennamahmoud.mm@gmail.com
Subject: [PATCH] staging: greybus: remove unnecessary blank line
Date: Sun, 19 Mar 2023 17:29:09 +0200
Message-Id: <20230319152909.163598-1-eng.mennamahmoud.mm@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unnecessary blank line before struct as reported
by checkpatch:

" CHECK: Please don't use multiple blank lines "

Signed-off-by: Menna Mahmoud <eng.mennamahmoud.mm@gmail.com>
---
 drivers/staging/greybus/pwm.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/greybus/pwm.c b/drivers/staging/greybus/pwm.c
index 3fda172239d2..26d39e08c3b6 100644
--- a/drivers/staging/greybus/pwm.c
+++ b/drivers/staging/greybus/pwm.c
@@ -24,7 +24,6 @@ struct gb_pwm_chip {
 #define pwm_chip_to_gb_pwm_chip(chip) \
 	container_of(chip, struct gb_pwm_chip, chip)
 
-
 static int gb_pwm_count_operation(struct gb_pwm_chip *pwmc)
 {
 	struct gb_pwm_count_response response;
-- 
2.34.1

