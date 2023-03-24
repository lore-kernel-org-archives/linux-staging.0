Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A220E7E;
	Fri, 24 Mar 2023 07:33:18 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id o11so1115569ple.1;
        Fri, 24 Mar 2023 00:33:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679643198;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iFqGuLOjRab6Iw0/SrS988UhB5baV+MAIu0DYUhVDv8=;
        b=TbYYunfAKu2D1sw2lxqSPDFgQq4QxB+C6KjrzoaYoQYJvFSh0LNCsqjKiCCBwW8BrP
         rk4reQW4vq5tKm4rrPB80RQvjxvUG/AaHRLKhgsHpM7L1cV/MZw/iroBWlF4F6VYXt9t
         6a7u+Tk3RzBMl3L82gu3xu/B9ieFWV5IwnkU7rnS3FEalfbAiVwxZMP0k1sT6cWn+7cm
         cy9NzMtALZfOnXCmtCfiE+qxHRMfF0DsmmOG8YrZcLrkS5tzTZcmXzd4LWfmnwxpzmsa
         BMBl0cZkLNcPFz12Cc03ppXMt2WRhC1bLEW4pGj/FMc7OwKYL4cnTqvT3ZA8ZHNr52Fm
         MxHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679643198;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iFqGuLOjRab6Iw0/SrS988UhB5baV+MAIu0DYUhVDv8=;
        b=iQr/dms64GSmCelJWMdYN2iZpdORDX2g43pe+Eznw5HfOprjLOwC317YOc9/rSyAA2
         ynuISP5o5tKcRq1/C81JQb9l6M/Y8fstjewww0rIVpRLfJhQYbJj2YW4yJmWyUD2r5w0
         BMaI7cK/851hVekEiG2m/+klIaFiX/ULcOu2bX27LuqT90Td2wkQ3RAr34dKVcPk60l4
         8fpe8eGZThjKdtZq/CUByJ6JGB5lwujV5cMwJ/DjfAm5cmbyFPXyywPk0oH22t9IdzMb
         F76UTEulzcwdRlAabb2H2xuXkCHUglSRqK0CuIr0wr4wvwJYCry2ZEUFSSaWTfGof8LZ
         OrGA==
X-Gm-Message-State: AAQBX9dRHdMFLCZt+Hnn0iVAwvqxHwJD5agS1VVuyrIaQdcXt3YlLsIo
	6STJqOsomxADAoC9HTiGI70WtDRGw5CmvA==
X-Google-Smtp-Source: AKy350ZmLpoEtnDFhblQhO36/Gw2rsyoAihKSYf9RxCSZz16qfqGjrCblTnYSoqo8UcH1lMfy5MJkA==
X-Received: by 2002:a17:902:e84d:b0:1a1:b528:9bea with SMTP id t13-20020a170902e84d00b001a1b5289beamr2028314plg.50.1679643197759;
        Fri, 24 Mar 2023 00:33:17 -0700 (PDT)
Received: from ubuntu.localdomain ([59.89.175.90])
        by smtp.gmail.com with ESMTPSA id v12-20020a1709029a0c00b0019a75ea08e5sm13511604plp.33.2023.03.24.00.33.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Mar 2023 00:33:17 -0700 (PDT)
From: Sumitra Sharma <sumitraartsy@gmail.com>
To: outreachy@lists.linux.dev
Cc: johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Sumitra Sharma <sumitraartsy@gmail.com>
Subject: [PATCH v2 2/3] Staging: greybus: Use inline function for gb_audio_manager_module
Date: Fri, 24 Mar 2023 00:30:00 -0700
Message-Id: <f200046cde9d205904f3050718a3936ed813974f.1679642024.git.sumitraartsy@gmail.com>
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

Convert 'gb_audio_manager_module' from a macro to a static
inline function, to make the relevant types apparent in the
definition and to benefit from the type checking performed by
the compiler at call sites.

Signed-off-by: Sumitra Sharma <sumitraartsy@gmail.com>
---
v2: Change patch subject, noted by Alison Schofield 
<alison.schofield@intel.com>

 drivers/staging/greybus/audio_manager_module.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/greybus/audio_manager_module.c b/drivers/staging/greybus/audio_manager_module.c
index 81b4ba607a0e..5f9dcbdbc191 100644
--- a/drivers/staging/greybus/audio_manager_module.c
+++ b/drivers/staging/greybus/audio_manager_module.c
@@ -12,8 +12,11 @@
 
 #define to_gb_audio_module_attr(x)	\
 		container_of(x, struct gb_audio_manager_module_attribute, attr)
-#define to_gb_audio_module(x)		\
-		container_of(x, struct gb_audio_manager_module, kobj)
+
+static inline struct gb_audio_manager_module *to_gb_audio_module(struct kobject *kobj)
+{
+	return container_of(kobj, struct gb_audio_manager_module, kobj);
+}
 
 struct gb_audio_manager_module_attribute {
 	struct attribute attr;
-- 
2.25.1

