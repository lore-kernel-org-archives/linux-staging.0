Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB3407B;
	Mon, 20 Mar 2023 23:04:57 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id h8so53005262ede.8;
        Mon, 20 Mar 2023 16:04:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679353496;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hHi5+GWz44QI22N2lgNwAXCVNfgTvzls3W9uzDI9R7I=;
        b=KHry5cV/WmYVdWszvx3gMaRricrhKOL/lzXv+ovvM9LdfGIZgyTz5TzaEbBYmrHe+B
         d6QZ6jCGQWNRv0XTqPoMbbR8LQY7UlBHpPrmWOasvI3x8kdub0KpMZN05I14Wkbg49z6
         65WH61JSSg2xleRRoJoySE9nau0xIsxA0xM5siTeJsU7z+U/z1rPNfuoDKuGdzzjD0B0
         SVhXx+xnP29qwhgvzh9eTCpHRwtQeMXlRv/Je+70jYIjN8QWj8znIoxds7MXCJDDRQGz
         838MLVA7qu2ivpJ0P7b8s1YmRxU4C4L7PrhgtaVnnxN3jPAwyljEwdQsLF9miUVyLK52
         pgaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679353496;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hHi5+GWz44QI22N2lgNwAXCVNfgTvzls3W9uzDI9R7I=;
        b=HLfpxcV/L2sjZuohiG3/5B0l7o8tP/r0Aai5g19AXcBGdlR9qSxyvItIO7vdGoZBJs
         4HK42tLptXENdFrfOOedd64wjpfC7MMxQmCfltYCZX6tSrGsiDuLT4JYlVvl9ncFnHD9
         i7q54NhR/Wmj7GKaXWp4gxfBQolK4N0Gp7oufBWTEceRHDhwSGoUoZTFiklO2Mm7Qczc
         AubHqDavr1AaVbxcq4aYGbjM8fj+UV6q+aPwXLJ3zTpKie/dS7LxDf2I+8q/XdVpPnGC
         N2zZmXLqJfAqxOiKuCsMsp/3heXCluP1b0lkMF073NUTo4CfHaOs6kBBEb90rpMh7s+p
         S74g==
X-Gm-Message-State: AO0yUKVj8b9jrN7I8McehHpGP9dNNh+qlD5CDZD28kxkxHhiKDAOcfBB
	3pl/05a/vfTQDRGsSIP8k/A=
X-Google-Smtp-Source: AK7set9oGrCiLwaTVVHNqARv9f/FYWeTuzzJVPjy0U7DAdWmYUUoV1H/27zWIC19MKSsWI6kfTIlNg==
X-Received: by 2002:a17:906:f6d9:b0:930:1391:da7c with SMTP id jo25-20020a170906f6d900b009301391da7cmr637301ejb.60.1679353495859;
        Mon, 20 Mar 2023 16:04:55 -0700 (PDT)
Received: from alaa-emad.. ([41.42.177.251])
        by smtp.gmail.com with ESMTPSA id v5-20020a17090690c500b0093188e8d478sm4956403ejw.103.2023.03.20.16.04.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Mar 2023 16:04:55 -0700 (PDT)
From: Menna Mahmoud <eng.mennamahmoud.mm@gmail.com>
To: gregkh@linuxfoundation.org
Cc: outreachy@lists.linux.dev,
	johan@kernel.org,
	elder@kernel.org,
	vireshk@kernel.org,
	thierry.reding@gmail.com,
	u.kleine-koenig@pengutronix.de,
	greybus-dev@lists.linaro.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-pwm@vger.kernel.org,
	eng.mennamahmoud.mm@gmail.com
Subject: [PATCH 3/3] staging: greybus: remove unnecessary blank line
Date: Tue, 21 Mar 2023 01:04:34 +0200
Message-Id: <f71528cf8bcdc2815ca8a1a1e1ed4e2fd6096d1a.1679352669.git.eng.mennamahmoud.mm@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1679352669.git.eng.mennamahmoud.mm@gmail.com>
References: <cover.1679352669.git.eng.mennamahmoud.mm@gmail.com>
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

