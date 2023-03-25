Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E72371840;
	Sat, 25 Mar 2023 08:24:38 +0000 (UTC)
Received: by mail-pf1-f173.google.com with SMTP id fb38so2640238pfb.7;
        Sat, 25 Mar 2023 01:24:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679732678;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OjcZplfqBfGxkesm/SQ2YHNMoUVOYWANADhv4EwbVKw=;
        b=iF1D1M7zPujubqAFaRoDsv44WF0fxsPh+P1yv7HPgWO600k7bQcVwJItb47E8USlzk
         pYfsPnJnn3d6sP7fi1fCK0iq6Yc9kQ3G4ypBs1DFbbEi5636oGrpjAlOqks8pTPvTYLE
         cwm3g/Z3XR8D4Feg/FzDiLb2vbZJuAs46S7RNgEyLopWutdgZN4lglRLg6GNkedsMfAR
         P7DYXcUlJTvoKnqlR28y3wH2OvWMHXidjielmmScmUrE8hFPEaH/myZ/2VH8/Aac3rHA
         wzWJBceIfhB7aMPBDqHz1kerasDENE59y8fbjamk6mxhe/41eeHSbjLcrDhSWRSVUtss
         AHqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679732678;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OjcZplfqBfGxkesm/SQ2YHNMoUVOYWANADhv4EwbVKw=;
        b=RODnTPqNDawcvbjYRlUvvPwgFrzFSVts6ToWkh4WlUV8MXzkv9hzaw6ITDHZUUAFAi
         DGoGoPirQzeo6wpYRXmfJqaWFMwP5cphf9rs9fT+CFCsMkSYIzh+Wulg1UoGATpv9hxm
         /BZve1rTPqexVBLcZnmq143KUXesEq4IiyVENF2N/cJgUHV2ucJC+9gPxSJUCGKr0hny
         1rmfSP47WI+cukbkvZlKj9YRSIL75ZmWyJMDbPZt7M5K3XIhJb9BeNxmKlp+FLk/enk7
         YT32jabJRxFKFBcq0rM27woGcvYWWU3Jm9J/wSgAklySjuBS1b+ImY7HQjWmL9zLwYo/
         03QQ==
X-Gm-Message-State: AAQBX9cJEaVDhg9D9mBVPR9TcPfglpoh4wcEA++RdjCQMJ0ncZUW7i5O
	iLwWySS6oj54mZ0s/aezOxxbEjVB8mtws+hm
X-Google-Smtp-Source: AKy350ZItOW1IWkO8vnKb6jMklJtdNUq0/uX+sYlMWXFYhAR5g+UBO/yaUHVPBtBrs8nlxqvT3t/ZQ==
X-Received: by 2002:aa7:954a:0:b0:625:cb74:9e01 with SMTP id w10-20020aa7954a000000b00625cb749e01mr5601184pfq.25.1679732678056;
        Sat, 25 Mar 2023 01:24:38 -0700 (PDT)
Received: from ubuntu.localdomain ([117.245.251.101])
        by smtp.gmail.com with ESMTPSA id b5-20020aa78105000000b005938f5b7231sm15035875pfi.201.2023.03.25.01.24.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Mar 2023 01:24:37 -0700 (PDT)
From: Sumitra Sharma <sumitraartsy@gmail.com>
To: outreachy@lists.linux.dev
Cc: johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Sumitra Sharma <sumitraartsy@gmail.com>
Subject: [PATCH v3 1/3] staging: greybus: Inline gpio_chip_to_gb_gpio_controller()
Date: Sat, 25 Mar 2023 01:23:33 -0700
Message-Id: <3fc5d84a99574ac4a76d26427ac544de375adeb4.1679732179.git.sumitraartsy@gmail.com>
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

