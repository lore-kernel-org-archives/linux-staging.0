Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6997320A;
	Thu, 23 Mar 2023 09:04:49 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id o2so14291513plg.4;
        Thu, 23 Mar 2023 02:04:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679562289;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i9ruC/xMC7tL0m+Bw7Ok6wqKxtgof/3SmFbXbg58scA=;
        b=VovKeNVYIntxSqSwNWdqBNoEkgHtZj1u9gRBjoOhUTw4PVGblIMga680+V+hAKcuu1
         9K53BgtPNgXP/RlEwIzsDqktSDJ2DYi1xD8BQ9MhFUeTZojlldhjBlqncCA7Lu5k3BrR
         1P5jKkrFeVpSxlwCTyCF2J5GHSzvdOIUN/J9oABTuTuITbiWrc2FWzi7JYmJNBcs46U+
         h/QQ+0qOQ9snZEY+MwqAynbRxoUHUKiBHe65wgenOlSKRBmztMNouKK8Vp6lqrrLcKPR
         Y6FjIRHpvs4T+BX03DM/Ah8ybGbzDZqDH+c9d+SdFIwF2lcN4HHvAEP8wgCNds7exe1P
         eqcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679562289;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i9ruC/xMC7tL0m+Bw7Ok6wqKxtgof/3SmFbXbg58scA=;
        b=5hq0huB4+BRbsFfs3t/10H6l0jVZIMPtDkWmeUx5qqT1WyXmV9BNVkESSmB3gsv9Ys
         sI1Dj0xNteAM+QVB89udYwJ9JdqwiDSAl4LdEZcUGyGaRSO/ReeSGHvs3xRLri3hGQCJ
         AAG/3AWpBCS3/McBpnmLpyOXf8WD5gzhxcLVfeqNwrQp6DY3H0JXy9W8W0o19+HGxpi9
         jDsTitRJAPhCPyI2TcfHirp+qt5Y5W/1anRszWeGVIoYpSI2wf+6VCKa8REolit77RbB
         zM0BO4/zqvSq89lsX/l9aprzY3aj48rPQrfxPV8ZbhJg6Gk6a9vYH7+giV9JX0pPZ+TA
         qAIA==
X-Gm-Message-State: AO0yUKWlqkxp2xfaxcp8oaUqCWMjV4AGJoN2nVdGD/h3oWJ5QVpPjJdF
	D358hGP8jtsLatjjAO1l0ufUuI3DIiXYrw==
X-Google-Smtp-Source: AK7set9t/l3/U0AE9cUZeRhxD7T95vWcwj6YWiY0Q1zLdKmBzXfwVrm3upUYzVgfarO+slDO2qVrvw==
X-Received: by 2002:a05:6a20:66aa:b0:d0:212d:ead0 with SMTP id o42-20020a056a2066aa00b000d0212dead0mr2342077pzh.26.1679562288804;
        Thu, 23 Mar 2023 02:04:48 -0700 (PDT)
Received: from ubuntu.localdomain ([117.207.139.205])
        by smtp.gmail.com with ESMTPSA id q8-20020a656848000000b005034a57b963sm11277116pgt.58.2023.03.23.02.04.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Mar 2023 02:04:48 -0700 (PDT)
From: Sumitra Sharma <sumitraartsy@gmail.com>
To: outreachy@lists.linux.dev
Cc: johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Sumitra Sharma <sumitraartsy@gmail.com>
Subject: [PATCH 3/3] Staging: greybus: Convert macro struct pwm_chip_to_gb_pwm_chip to an inline function
Date: Thu, 23 Mar 2023 02:03:41 -0700
Message-Id: <fa02078208917ce81ad3fb6d453e8487a5ba7505.1679558269.git.sumitraartsy@gmail.com>
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

Convert 'pwm_chip_to_gb_pwm_chip' from a macro to a static
inline function, to make the relevant types apparent in the
definition and to benefit from the type checking performed by
the compiler at call sites.

Signed-off-by: Sumitra Sharma <sumitraartsy@gmail.com>
---
 drivers/staging/greybus/pwm.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/greybus/pwm.c b/drivers/staging/greybus/pwm.c
index 3fda172239d2..88da1d796f13 100644
--- a/drivers/staging/greybus/pwm.c
+++ b/drivers/staging/greybus/pwm.c
@@ -21,9 +21,11 @@ struct gb_pwm_chip {
 	struct pwm_chip		chip;
 	struct pwm_chip		*pwm;
 };
-#define pwm_chip_to_gb_pwm_chip(chip) \
-	container_of(chip, struct gb_pwm_chip, chip)
 
+static inline struct gb_pwm_chip *pwm_chip_to_gb_pwm_chip(struct pwm_chip *chip)
+{
+	return container_of(chip, struct gb_pwm_chip, chip);
+}
 
 static int gb_pwm_count_operation(struct gb_pwm_chip *pwmc)
 {
-- 
2.25.1

