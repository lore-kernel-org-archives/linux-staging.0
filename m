Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B915E1840;
	Sat, 25 Mar 2023 08:33:17 +0000 (UTC)
Received: by mail-pj1-f43.google.com with SMTP id e15-20020a17090ac20f00b0023d1b009f52so7194002pjt.2;
        Sat, 25 Mar 2023 01:33:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679733197;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i9ruC/xMC7tL0m+Bw7Ok6wqKxtgof/3SmFbXbg58scA=;
        b=o639WNsLIKilsuSbOUQwSfrRBEy0Ll5v6ntkkD2bVaCkuUpwN37cLOeUhsSmI2yWPg
         2oHDK5veQ/gPP4Y6VOOAviErv5ZSsRk9Az81n0plcXMtoUtcAH727Zv2lzW5+8z6dWCd
         IZzlWtDLt/aIg213mx6VZnAHEGyB9FniS0Z5N6XYiQXNamw5/HjamXl1joGd3zIAstgk
         ieHPgx+zOgiTjL+QDQ+3ogDtcgbWlpb/+lYwHN1ln0Q+lT+wCObrY9aQVDSCGReZrFj1
         dim4Xafs5mOQwBH66ZX6FKC4rDEBow9Wwz9bu15AuYjsFHO0YGHb3J87NkpFi5PDOw9s
         7XaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679733197;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i9ruC/xMC7tL0m+Bw7Ok6wqKxtgof/3SmFbXbg58scA=;
        b=Ze9+QSd3pTFpeVbfB1s9tvJAFnPc+Ey54TPatBzzbA0+2/ueuqOIBDoQ7HzGRQbwXK
         ZE6LlHsnCYxADU+wOW9KVvwpHfLsM9KFyNcniUBAOufZSfZiIrrYtIU4OqjAg0ZqmU4T
         KO7LCf4Di9fOh9w8yuaIknlQC+S2X21Swq8SHmUJFUVrYdgDv9jJ0OyOhCmRQTvc0pB0
         hP7236QZ7+vTjUiNnlCDNMtbgkaY2XDcYgEdj20RAEU37k27g7GbV1/krvlwwcULbSPE
         JpaowIbfKsAhmKH94kRy5+rpgh591w+ECdCQMuHOlMxCd5nU4jfL4MITfe/sKq7OGWkr
         j10A==
X-Gm-Message-State: AAQBX9eo4SkcTs5E8K4xjpLT5YsjEdoAPKrQvZgQ799Ny7ngxf5o/c4N
	t37+afKB6Xnsnr7std/9M64qlYUbX72mRSmA
X-Google-Smtp-Source: AKy350ZlnfYWnaB6Q+DvHqgRzooKnDj0lpmUsKqxSDWIpYnsovqRM9QW9zeSWnZKKLZ4RDDGa9YD+A==
X-Received: by 2002:a17:90b:4c86:b0:237:c565:7bc6 with SMTP id my6-20020a17090b4c8600b00237c5657bc6mr5802024pjb.10.1679733196934;
        Sat, 25 Mar 2023 01:33:16 -0700 (PDT)
Received: from ubuntu.localdomain ([117.245.251.101])
        by smtp.gmail.com with ESMTPSA id m33-20020a635821000000b0050927cb606asm14290224pgb.13.2023.03.25.01.33.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Mar 2023 01:33:16 -0700 (PDT)
From: Sumitra Sharma <sumitraartsy@gmail.com>
To: outreachy@lists.linux.dev
Cc: johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Sumitra Sharma <sumitraartsy@gmail.com>
Subject: [PATCH v3 3/3] staging: greybus: Inline pwm_chip_to_gb_pwm_chip()
Date: Sat, 25 Mar 2023 01:31:10 -0700
Message-Id: <f1ef1b643840e74f211264dda0c590f8458618f6.1679732179.git.sumitraartsy@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1679732179.git.sumitraartsy@gmail.com>
References: <cover.1679732179.git.sumitraartsy@gmail.com>
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

