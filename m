Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBCCB7B;
	Mon, 20 Mar 2023 23:04:55 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id w9so53074064edc.3;
        Mon, 20 Mar 2023 16:04:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679353494;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9X61cCXaE+hzLqtVmFIuVzim5tWEuqEAHzNDNeWntzc=;
        b=MvmeRaVSCe8klsomnf3mJnsEY51ulK1+6uxJnqgvu4urOW6quiwl+MzBMUbeL3GIA9
         MsYN6pjF06/vTEQpcgnF2Rye6U95lEglqN9XFUXB8bpL54p7C0G0ZlqKdAfNsvkBVgXL
         gRApzuxZQ8QtfsL6LO7mOjCRHNfQj7FHvto8lXhcu2UNo+WC9Rb4CGOUlXm9/MNSnR5a
         7FyAdhyz11UGMX7pbBcfnb/nyYbPp+POzxLW2UJTwtGFZaPvC+hMewzEYKKwssLDKGre
         Bv3q0rEwRh9XKY7Lmc192+7QOwV63qm0fMxgxFm4uI6//ciwEXEn+Qsk2vbd0U458P35
         iY1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679353494;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9X61cCXaE+hzLqtVmFIuVzim5tWEuqEAHzNDNeWntzc=;
        b=Lc/yTCkWADYW4xCtzczdlXWQccgg5ckyMwtxngqbO8CIyb5xsHQ9BLtaU5/bVmiiu9
         GUD0tllTpdFQ0zls4wGRYgu6lbRWBnWS3EmCt0iMrSI3/xgW/ox3RhgDVjZGjXWmQU9s
         RPVlAmy8lDD9OFGlQuEn6yqUTk7nxM6qdngw1yJGPUoeMgVqMs16gM1OK92GyBBoECWn
         N+SrqV9UnNyqR7vsWX3VKmrbnsqkEpLj3vLw1pxAPzj61Bao4tiD/JMdxp3IwGVn/5Kx
         VfUZQgaKndzNCHLd5idF87BB1aQ7KQW/No17G/4MlXKpd/R/7C5+egqThY8uB81dTDZW
         MVJQ==
X-Gm-Message-State: AO0yUKVFveFPy8VV80bKql7orfwJA+2tFJ53EAoq0m/gLTPrZUZPEhQU
	zIK3o4SYayvavbKtWMf+rGQ=
X-Google-Smtp-Source: AK7set9bTQei7X1ViKH2Hqjo4mruuNKD5HQQDKBlF8sx8MkbMtWeQObb2XFIfbtGU/26Kmuny5+ksg==
X-Received: by 2002:a17:906:a84:b0:91f:17a5:b359 with SMTP id y4-20020a1709060a8400b0091f17a5b359mr740698ejf.66.1679353494162;
        Mon, 20 Mar 2023 16:04:54 -0700 (PDT)
Received: from alaa-emad.. ([41.42.177.251])
        by smtp.gmail.com with ESMTPSA id v5-20020a17090690c500b0093188e8d478sm4956403ejw.103.2023.03.20.16.04.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Mar 2023 16:04:53 -0700 (PDT)
From: Menna Mahmoud <eng.mennamahmoud.mm@gmail.com>
To: gregkh@linuxfoundation.org
Cc: outreachy@lists.linux.dev,
	johan@kernel.org,
	elder@kernel.org,
	vireshk@kernel.org,
	thierry.reding@gmail.com,
	u.kleine-koenig@pengutronix.de,
	greybus-dev@lists.linaro.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-pwm@vger.kernel.org,
	eng.mennamahmoud.mm@gmail.com,
	Julia Lawall <julia.lawall@inria.fr>
Subject: [PATCH 2/3] staging: greybus: use inline function for macros
Date: Tue, 21 Mar 2023 01:04:33 +0200
Message-Id: <1274302b52ae905dab6f75377d625598facbbdf1.1679352669.git.eng.mennamahmoud.mm@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1679352669.git.eng.mennamahmoud.mm@gmail.com>
References: <cover.1679352669.git.eng.mennamahmoud.mm@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert `to_gbphy_dev` and `to_gbphy_driver` macros into a
static inline function.

it is not great to have macro that use `container_of` macro,
because from looking at the definition one cannot tell what type
it applies to.

One can get the same benefit from an efficiency point of view
by making an inline function.

Suggested-by: Julia Lawall <julia.lawall@inria.fr>
Signed-off-by: Menna Mahmoud <eng.mennamahmoud.mm@gmail.com>
---
 drivers/staging/greybus/gbphy.h | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/greybus/gbphy.h b/drivers/staging/greybus/gbphy.h
index d4a225b76338..03a977056637 100644
--- a/drivers/staging/greybus/gbphy.h
+++ b/drivers/staging/greybus/gbphy.h
@@ -15,7 +15,10 @@ struct gbphy_device {
 	struct list_head list;
 	struct device dev;
 };
-#define to_gbphy_dev(d) container_of(d, struct gbphy_device, dev)
+static inline struct gbphy_device *to_gbphy_dev(const struct device *d)
+{
+	return container_of(d, struct gbphy_device, dev);
+}
 
 static inline void *gb_gbphy_get_data(struct gbphy_device *gdev)
 {
@@ -43,7 +46,10 @@ struct gbphy_driver {
 
 	struct device_driver driver;
 };
-#define to_gbphy_driver(d) container_of(d, struct gbphy_driver, driver)
+static inline struct gbphy_driver *to_gbphy_driver(struct device_driver *d)
+{
+	return container_of(d, struct gbphy_driver, driver);
+}
 
 int gb_gbphy_register_driver(struct gbphy_driver *driver,
 			     struct module *owner, const char *mod_name);
-- 
2.34.1

