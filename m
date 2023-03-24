Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FDE07E;
	Fri, 24 Mar 2023 07:21:25 +0000 (UTC)
Received: by mail-pj1-f53.google.com with SMTP id fy10-20020a17090b020a00b0023b4bcf0727so800455pjb.0;
        Fri, 24 Mar 2023 00:21:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679642484;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qOWL7nV1WlBQFqJTXaBmWX6r0g27OV1XFhs05mfe2aI=;
        b=olwZ2Ki+GEmXv8N44rzlIT2zwtZrcHbqmSfDZrbXOE8skrN/XFMRPXRh9BxqAVJvq9
         1h59VhF08YneFvX2/UjLzW4bZ7/UXKkuXAelK8CWyQB03bWYJVm0indIiCeivCqWiIVE
         o+OnA12bz4QBpDXQGGUwrBH05ESQoZx/s7vzQxklJnkFiNdNGCr1h3neQDr0Wu0ETgc2
         PE72AAVHb7QW7fiOdDKL6TeyoQTUu8ItQM9D8FJWEgPRHiMsfl+BJtHzPk589PplTlCD
         F+e588GFFMmS6wLKgeMHAsaf849OTPjNgVpt/segz0OhGb4iGQ5x4kZz4M3pJDHlMQKT
         Vm1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679642484;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qOWL7nV1WlBQFqJTXaBmWX6r0g27OV1XFhs05mfe2aI=;
        b=ollizClG/b9KcSWlupcvqRdPOTt4sqhagho7GiKt5LzIzfiGtojU1wgRVf9XmC17J3
         yKyIKqtdfp+awNUpnJuVKhdVKCiJbprOJUpWjyCrH3/EbNmnZyFIwPUp5kzRyEb16br9
         U0uNU0NL1WXvGGa5EmZupw7b1sbcpz4h+MoTmygFWxVE+JmVpUeifxFngEQ+UeTEZx0y
         1741G1JZZvoMIStFaj/tH4239Jjq0pGhnSqeMDOWlSBrjUwE9Z+wMaM64aYRUQR2YBpe
         3GyK2KHF3wUVvFJsSTPuhk+vcwJaFRzO9RcFEv6bz5PKDgAwNs/QJCv/ZfO4+5nVpO7P
         N1YQ==
X-Gm-Message-State: AAQBX9c7YVAGOMKZNeKcJPeET7vA+4/wlwBfbsDaPO7hMXxzPxXL6DaJ
	cp/hW4M5UGDXvgHZWiTog3IMp6yIZPFvIA==
X-Google-Smtp-Source: AKy350a0aAAwD586M+JBEnfHYwX+wsWJNpNqvuQFJGvV3/eCeLmSCS1tVDK+PQPJ/zSPsgvlzLYLow==
X-Received: by 2002:a17:90b:1c88:b0:233:f354:e7df with SMTP id oo8-20020a17090b1c8800b00233f354e7dfmr1835231pjb.18.1679642484576;
        Fri, 24 Mar 2023 00:21:24 -0700 (PDT)
Received: from ubuntu.localdomain ([59.89.175.90])
        by smtp.gmail.com with ESMTPSA id o10-20020a17090ab88a00b0023cfa3f7c9fsm2362372pjr.10.2023.03.24.00.21.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Mar 2023 00:21:24 -0700 (PDT)
From: Sumitra Sharma <sumitraartsy@gmail.com>
To: outreachy@lists.linux.dev
Cc: johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Sumitra Sharma <sumitraartsy@gmail.com>
Subject: [PATCH v2 0/3] Staging: greybus: Use inline functions
Date: Fri, 24 Mar 2023 00:20:30 -0700
Message-Id: <cover.1679642024.git.sumitraartsy@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert macros to a static inline function, to make the relevant 
types apparent in the definition and to benefit from the type 
checking performed by the compiler at call sites.

CHanges in v2: Change patch subjects, noted by Alison Schofield 
<alison.schofield@intel.com>

Sumitra Sharma (3):
  Staging: greybus: Use inline function for macro
    gpio_chip_to_gb_gpio_controller
  Staging: greybus: Use inline function for gb_audio_manager_module
  Staging: greybus: Use inline function for pwm_chip_to_gb_pwm_chip

 drivers/staging/greybus/audio_manager_module.c | 7 +++++--
 drivers/staging/greybus/gpio.c                 | 7 +++++--
 drivers/staging/greybus/pwm.c                  | 6 ++++--
 3 files changed, 14 insertions(+), 6 deletions(-)

-- 
2.25.1

