Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DE7C379;
	Sat, 25 Mar 2023 08:32:49 +0000 (UTC)
Received: by mail-pf1-f175.google.com with SMTP id cu12so2625668pfb.13;
        Sat, 25 Mar 2023 01:32:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679733168;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rZRk78dM+sIDcTF06PFu8cSmlnVuUZmfpf5YGgQ/R64=;
        b=HgZotS7CNv8U8GKTbwzwaX9ktzODi2OfWdl7CnvyiyiZBIvcGFPB9aZYPtM0+NxAAa
         65o2MsIyYii9yQz7c1Y0VQw4HafGwYxCOXn3N2E1jWpfTZVOE+sc1l0Sj8Gp9ZlkHFjD
         eeEsi1WzsA3Pnd/lId0u2m0rA3PgHJlJS5mrIe5pdUUbGLXKtRVgmdsVyAXysNf3LdbV
         0FpEbGccM8JNzG6oz9cjdByjZikUo0673yJI4A4uvJa8PpIUbmi9LjniUCHq5x7KLqCX
         vY3Veu32Gm/HvmjeYEeRkMpmP15EimNKRqj4SuUQaipnZRxKCASMxkQzffLByQeOf0T1
         vwZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679733168;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rZRk78dM+sIDcTF06PFu8cSmlnVuUZmfpf5YGgQ/R64=;
        b=1c3sfkHlKzL0qdRqQDMb5ZUZT2pF4O2SB3AC07H6WfQ7Aew7nyWWjQvId9JQT5tdT5
         UPaGuXLj+byKadgL4ztr6pa+K7r6pxMJpedKa1PVvD0sVpHXb2RFD8MRFD1IbPDZjBV4
         nTMvl5ysKtgGLjsRf0vn5Gg8ileIR4r1WW71eJozpQpBwloCw8x5rujcxgaLk/7VyqQt
         y+pPJk0CoWjOh06XKTE+bBkih4lFtnWJ8Q1y3trfLcztTRPOVndD8yJfItQ5zMGAUQAD
         cHIZc3OdXb5j8iU1uMa2ikOClaSal59w7BfmY9mzGpOLpXEb25Yk89y0fOjE0tuC5cSa
         UKjQ==
X-Gm-Message-State: AAQBX9eXzzTq2Qe71+qPxvjXZv4LAx5uN8w5zQwALdzMONYbHN4/EJVB
	/e58hqTuAlsVYif8i4qZZo1mw/xKyKsWTjPj
X-Google-Smtp-Source: AKy350bTu6uj1pG9dejrYD50lwhf789Tv6IN/ryzCGZ3bDUe0DQDTLTZqN5rKPJ53FnBKsaiGEkevw==
X-Received: by 2002:a62:5e81:0:b0:627:fd49:9ab with SMTP id s123-20020a625e81000000b00627fd4909abmr5191177pfb.28.1679733168222;
        Sat, 25 Mar 2023 01:32:48 -0700 (PDT)
Received: from ubuntu.localdomain ([117.245.251.101])
        by smtp.gmail.com with ESMTPSA id m33-20020a635821000000b0050927cb606asm14290224pgb.13.2023.03.25.01.32.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Mar 2023 01:32:47 -0700 (PDT)
From: Sumitra Sharma <sumitraartsy@gmail.com>
To: outreachy@lists.linux.dev
Cc: johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Sumitra Sharma <sumitraartsy@gmail.com>
Subject: [PATCH v3 2/3] staging: greybus: Inline gb_audio_manager_module()
Date: Sat, 25 Mar 2023 01:31:06 -0700
Message-Id: <7470bf9d9a57e8bf27e55bd5e3791c5e0ee31385.1679732179.git.sumitraartsy@gmail.com>
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

Convert 'gb_audio_manager_module' from a macro to a static
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

