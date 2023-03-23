Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 413EB320A;
	Thu, 23 Mar 2023 09:04:30 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id w4so13620869plg.9;
        Thu, 23 Mar 2023 02:04:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679562269;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HkAGxiMm0D6sZZHk+W+42sbwTh2uKjw/ysosEWY5e6A=;
        b=LIkMDCo6uE7KtCBkAYpv7U6sC6jQgySdx8sLRUp+8pMXXhPbM43mYGNBF63R+WRXoU
         ukIJ1GGYQ4ykj/OhCzf75lefRjFVnxS5gcTa6UaiyxSZlhgjA31yxQWEbDj/r3BY9/g+
         S6xy4Pgq97Q94R3Fsk15pA6dDpcbmKcg6g+oj/N+0Mle22mvizygKS2m6D4JoPbb3bmf
         bwZJVGXUk4tBt7cPTHn1u202TOgXst67Eg8w3X2DTXrjM3MRjCQzZhPDWUi0ybGKC0OG
         /rnV6SubfPMNzVf87Cw9WwnzOkVvP3CMk//Pvjy9oa5YVrx8p4WGSPT8Zsc5f3lNNeIr
         Dulg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679562269;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HkAGxiMm0D6sZZHk+W+42sbwTh2uKjw/ysosEWY5e6A=;
        b=I8g0aoLPIqCpJqktVn7uDlJLgLtlPpfdER2E/zTe5wgsIlnKqOq6ksLiewWhMnI+f7
         5MedafTOrOlyPZhb1Zc94q3hryul78mdpmCiKhwqND+aEY7cF0nXUadV9cGbmXvT4eh+
         5Y7ks7OSPm5o+FnkQA5pTuAYpkWDAfVov3jWXdv7oi17vhYF+5TB/urbl+34ttV1BiC+
         IZRj2cSBWlWJQ3uLA4WNe1wTnFRD6vvCQNSLFOfs99FzlAJeQcTsN4rk/Y4N21Yaddlf
         TSKQeL1E/gbXH/Q1wuN/WQlmOEUUIy+YYjci+A3gk3+cOacMfxubZYgnkhoBnPXIhsfI
         Xygg==
X-Gm-Message-State: AO0yUKW4pWH4/GJY/w6bM+hl8XBVaTN6f0zqDnBDnUV4K80gVAVKgcYc
	X3KSKMlrZZ/tpiedWkmho5aHz+EvYmUixg==
X-Google-Smtp-Source: AK7set8I4cmzf3Zmp2eBlUvhQR6WjHK9/2UFO2PkOCoRYTGxgHw7Kr8EnoEKqizYtcXg8exBT1xv3A==
X-Received: by 2002:a17:902:fa43:b0:1a1:a5df:764 with SMTP id lb3-20020a170902fa4300b001a1a5df0764mr5230531plb.7.1679562269354;
        Thu, 23 Mar 2023 02:04:29 -0700 (PDT)
Received: from ubuntu.localdomain ([117.207.139.205])
        by smtp.gmail.com with ESMTPSA id q8-20020a656848000000b005034a57b963sm11277116pgt.58.2023.03.23.02.04.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Mar 2023 02:04:28 -0700 (PDT)
From: Sumitra Sharma <sumitraartsy@gmail.com>
To: outreachy@lists.linux.dev
Cc: johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Sumitra Sharma <sumitraartsy@gmail.com>
Subject: [PATCH 2/3] Staging: greybus: Convert macro struct gb_audio_manager_module to an inline function
Date: Thu, 23 Mar 2023 02:03:40 -0700
Message-Id: <2a1752d909a33f2a8e93bd60043aaa5a659c98e4.1679558269.git.sumitraartsy@gmail.com>
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

Convert 'struct gb_audio_manager_module' from a macro to a static
inline function, to make the relevant types apparent in the
definition and to benefit from the type checking performed by
the compiler at call sites.

Signed-off-by: Sumitra Sharma <sumitraartsy@gmail.com>
---
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

