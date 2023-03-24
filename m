Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 849CE7E;
	Fri, 24 Mar 2023 07:26:55 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id z19so1099763plo.2;
        Fri, 24 Mar 2023 00:26:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679642814;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qOWL7nV1WlBQFqJTXaBmWX6r0g27OV1XFhs05mfe2aI=;
        b=lBy36qf99v/akTnZfqIbBpJAhkBbS4hxyhr2Jne8gCswaxvp2Jp3FENopQ1quN9LoI
         VNuHMsYgqHlORnlmEX5zvB8hUlcw5EI8Jo5JrbapUgAEo7Oq3ti0/E82h0tC8TzSqJ5s
         azjhTEJfus9EQxuW9F6Rf2F5Ev3ZauxqzemQkoefrGtuiPmPtQJmW84WtnIRYXkqFVPj
         0Dii2BOGoEZoreA9YJaOiMY8VFyd40yrv/taVZvEHLLJ7kt35WHW/hqNylXgavwDXuIJ
         BSy+9n59hPfxosCDqWYllWUNRvxdD5iIWjj/KnkorjkQvS2/0Gu1kLM9135Ei678N/38
         vy5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679642814;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qOWL7nV1WlBQFqJTXaBmWX6r0g27OV1XFhs05mfe2aI=;
        b=f9grYs97A7TZglM14kZGKgn37ScWCr57+jN19L6DKcafimN3wLnw9jeMTRhiHL1Shq
         4IdMM0R10UvAlJlXsmoIjkPoWQGKTFVBeK5v0As6g79olWEY/d4K84SsffOXFqcTaKHJ
         au3Sm4/QZYwENod35z3lYcMo91erpLNcMg/UrZtwFLrDcBDc/GUydPL99a02wYjVUVM4
         Bq7BUZqt1zk78tEJ2eeVsO4BL2xI/lQMFTW5hrv1p0QECiU2HWlhMdSYYv7hNCs7ZtOt
         IXNPGkS2bymy5IsgKmHI9OoAyroqcX5MDBiQxUWbk9/oNNgpliNuRu/Od4pccamIzPHT
         wnrQ==
X-Gm-Message-State: AAQBX9ej86uVkgUoJw/Vle5C//oiMsG0qMZzCJvx79PeCOQ/pVaqlKae
	+hHTI8HyLiIbveXRSvIN8ArTin6DGatMYg==
X-Google-Smtp-Source: AKy350aNhUPcRlU0iL4dePfhEGfhG/kuFnHgs06JnlqWlbVOTtQooldC9zpf0rhCQpaxh7fGZUPo8Q==
X-Received: by 2002:a17:90b:1d02:b0:23d:133a:62cc with SMTP id on2-20020a17090b1d0200b0023d133a62ccmr1902114pjb.17.1679642814428;
        Fri, 24 Mar 2023 00:26:54 -0700 (PDT)
Received: from ubuntu.localdomain ([59.89.175.90])
        by smtp.gmail.com with ESMTPSA id b16-20020a17090a991000b002311c4596f6sm2345152pjp.54.2023.03.24.00.26.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Mar 2023 00:26:53 -0700 (PDT)
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
Date: Fri, 24 Mar 2023 00:26:15 -0700
Message-ID: <cover.1679642024.git.sumitraartsy@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID: <20230324072615.S_iDh5HdfniG5hD9Kxa3zTJb5JMyR8rxh8VVK3-SGHY@z>

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

