Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D997B7E;
	Fri, 24 Mar 2023 07:34:20 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id iw3so1096991plb.6;
        Fri, 24 Mar 2023 00:34:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679643260;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TCuUQNVkkfD2ZPnOF587mW3XsARVZtximMlGLvwHOxo=;
        b=oVpq6RhJr2s0S9DQD3buIKYI1LGRwDwGLmm55a4+Dc6subYya2Oywblx+ebe3Wj/Bs
         nSHIQ39bpdx9GsJvW6iq9hTjHO/rHdV8ZlQpAhJ3eKl2yHT583D/1skJVMDKYwHF27Gx
         rzA60odIMXvYC/efcBdh5eUdDm5h3B7C+kzP5AMQx6hBmVkYLw+vPR5X0WPFjop1Md3p
         cvRPWxZgjF0GKVWX4UQ2Os4vAoZga7Ri9LhqEM+QCfXnXNZV/F9OQcMbISWy3W+rlQGK
         rT1HJGQCzfWxFsYcUlz8uTpQmAOxW/OH1cdWoYIBCWv9O0NVQp36Q6lZV2otYTCejxMd
         nieA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679643260;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TCuUQNVkkfD2ZPnOF587mW3XsARVZtximMlGLvwHOxo=;
        b=CLHbkj4efHGT1a2OLNnmOTV5d3n/BZjc37epONV8quAC424H26c5HAWONOZ2FIMfkQ
         KMykugDVYaxNVIy1zfROEiaW5H7Ty13+Rou5PjZ3bDJs5LnEiahAfqd8VuINDbf/TTje
         e4iWMC4ye2D0BbU2Z7RFcNasjCpskjS0TXpE8abgDD/zhuccCAjKsbp0i8JmgD+A15pk
         i3oU8nrGyu6tD7pP9wFJJnl0sed1uzPAUBWQBPgx3ftvyl/vB93Q+/53q78Bca9P6p9z
         K5GhAHPu4Sj2Y0kZtG/i4Qkcdvi2m0ne7NYPDhGtAWAjVd+9TfahzN9nIdHNsls9SwMH
         5Kog==
X-Gm-Message-State: AAQBX9eh31XJUkqVpnH4U/rhnOO6JVG93r43Q6EVBHvOfxIIffgEzYRq
	0W7o9WuGRUldm7XDAFBzw3hk/G3MHuR5rw==
X-Google-Smtp-Source: AKy350Y/HHioS9DnMn2ppRJJ2qm9D8YHrwBl/5qZydmOURfSPB4rXN6nY4wARgBZ8PsqDCngFlx4gA==
X-Received: by 2002:a17:903:124d:b0:19f:3aff:dcfd with SMTP id u13-20020a170903124d00b0019f3affdcfdmr8704345plh.6.1679643260081;
        Fri, 24 Mar 2023 00:34:20 -0700 (PDT)
Received: from ubuntu.localdomain ([59.89.175.90])
        by smtp.gmail.com with ESMTPSA id v12-20020a1709029a0c00b0019a75ea08e5sm13511604plp.33.2023.03.24.00.34.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Mar 2023 00:34:19 -0700 (PDT)
From: Sumitra Sharma <sumitraartsy@gmail.com>
To: outreachy@lists.linux.dev
Cc: johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Sumitra Sharma <sumitraartsy@gmail.com>
Subject: [PATCH v2 3/3] Staging: greybus: Use inline function for pwm_chip_to_gb_pwm_chip
Date: Fri, 24 Mar 2023 00:30:03 -0700
Message-Id: <a7d0f315478af0596d1b6b97b8722a753dd39666.1679642024.git.sumitraartsy@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1679642024.git.sumitraartsy@gmail.com>
References: <cover.1679642024.git.sumitraartsy@gmail.com>
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
v2: Change patch subject, noted by Alison Schofield 
<alison.schofield@intel.com>

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

