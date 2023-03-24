Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 819467E;
	Fri, 24 Mar 2023 07:31:58 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id k2so1083909pll.8;
        Fri, 24 Mar 2023 00:31:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679643118;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BLwbqhkP3x7d9e508XmAAFyMChf+5bvOpcoj8t6arpQ=;
        b=V4OuRY0X0mSGzHnm+klSyWUnsEr8WBD5exIeFu787Enw/u3mEIEtCYmLkDqcMfhhuR
         mtz09DZrMebbCURoMzVJGb7/SuCUmv/7MJz0oCOgyC7z9TvwjkCO3Dnul1fIMC+J/7Dm
         O+jHaVdwMigP7pUOufxcx83PdltzmN9rEb2Ev6cw1AF5QuXUUSADXZP90RmhVERw0cbY
         +0WaRXPpDPiVz0wY3l6xBMglBxFG5Hz1bATZwDeDbJ52U3PAK95QPWNB/OaOKRS6p/tu
         E9eK8q+x0RhijCpTG/xU/5y19bm3A66XK4dxL6PmyXTf5OtMc2NkMoAez3sNr2/lfwG9
         1pqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679643118;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BLwbqhkP3x7d9e508XmAAFyMChf+5bvOpcoj8t6arpQ=;
        b=kOnrL2mtMJNdCNGdQInqiDBLc2Ej4mhSQUxv+uY/3fazOamG58i09lDYIzgVH+5ZPf
         Z4bW/XCdhngpB7ol+RzIUcAdaRBbcqJs2cXejwQN055Sba2P0cI6ws5AHzKtmho7HAza
         F6ZxEkw3z9ZS2rKMVac3ko4kClK45k5PJIkIqapVMw+AKlj2bj7oH9nFT2oNN3YiigO6
         JSIi3ulP9+ayl7XpjZuVI+g1QqoYtUWjJ6qlf6N5OUblhLhKQ3KJpRjmMI8D+Ja72h6A
         WVVgXFiVGOyb0IbCW06zBD5gFCvztJGEDOeX663EwtA/rDud1IEMBZWhm4COP/abZRja
         2laA==
X-Gm-Message-State: AAQBX9cpE1r4UZqDc4p7ExtmSQ3hnYqV4giguxw2qEA2u40TBnndZyHP
	EKtEDj6S9YyJBOldHtT9WI29/rVTdGKoUQ==
X-Google-Smtp-Source: AKy350YV5ki71rAX+GEaClRDCHhl8SLu+UFi2u05G9ndCaFXgdafTTnqC4cipNikC2ZOFxlh9bvTUg==
X-Received: by 2002:a17:902:e812:b0:199:4be8:be48 with SMTP id u18-20020a170902e81200b001994be8be48mr1852380plg.19.1679643117590;
        Fri, 24 Mar 2023 00:31:57 -0700 (PDT)
Received: from ubuntu.localdomain ([59.89.175.90])
        by smtp.gmail.com with ESMTPSA id v12-20020a1709029a0c00b0019a75ea08e5sm13511604plp.33.2023.03.24.00.31.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Mar 2023 00:31:57 -0700 (PDT)
From: Sumitra Sharma <sumitraartsy@gmail.com>
To: outreachy@lists.linux.dev
Cc: johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Sumitra Sharma <sumitraartsy@gmail.com>
Subject: [PATCH v2 1/3] Staging: greybus: Use inline function for macro gpio_chip_to_gb_gpio_controller
Date: Fri, 24 Mar 2023 00:29:54 -0700
Message-Id: <215538f49cca6be05f846704e2ca15cd10144207.1679642024.git.sumitraartsy@gmail.com>
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

Convert 'gpio_chip_to_gb_gpio_controller' from a macro to a static
inline function, to make the relevant types apparent in the
definition and to benefit from the type checking performed by
the compiler at call sites.

Signed-off-by: Sumitra Sharma <sumitraartsy@gmail.com>
---
v2: Change patch subject, noted by Alison Schofield 
<alison.schofield@intel.com>

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

