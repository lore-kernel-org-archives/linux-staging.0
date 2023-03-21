Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58DC233F0;
	Tue, 21 Mar 2023 18:35:03 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id ek18so63451553edb.6;
        Tue, 21 Mar 2023 11:35:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679423701;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Z0AYUnT0/KW1zTFkWuQVJ616wax7LB1pNkItFnW63oA=;
        b=Y5PVDuLgSexCXggBndd5IVvHrqQ8Ii0KndS1uA5hsJVRdGEFLk09/RXu7Y8rwPZ1UX
         +FhFNqSr6iXQ1SiE7ha2gn81WcqYJMC4jLGHusTE00npGJpnvGPgEEsQHh21KSS0bEE9
         sj6Y7r0V122u0fJOUEXAlRYXUb7v3Tq7GcsYWJ5Kfx4gkpSZIELP+kqg9Tu9Oiy0cJtc
         On0UdAWYvCsuRwX6FNwj+3TVPZGtfD1Awj/POZsPHyoGEz+H4jw8guwbf59loBv4ZKlT
         xYhD63sCyESWu6lYA1h8tyb9d8tvn6IKqrolfDqoeH88D/wjMYjAWiP/7YJqKhOhVeMe
         KPmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679423701;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z0AYUnT0/KW1zTFkWuQVJ616wax7LB1pNkItFnW63oA=;
        b=RdgZXg9xnVwb2MQyvXfALsjagLW/LD/No8rcFAbPUJnDYlW7xzyPEP/JFdJAOXjYmp
         erGmY/jQ4+oHbfxLkumkn3B6kgRwEAOzITjUTo0gmKSz2qT+tr8wnsmDS3e8SYJMndts
         kJgE0B4yqbJHgz4PWEccA1l2UPVPgDdLkNPnKhRVBXy58wROPFJOUZy8uhsNe4xIgENF
         cZ579ezaUJ0P9uneFRnKwGs8VnJkI1maEzehotMYKP2lIdWfo099LG10V4/fTZG47uv9
         pxw2WoozdZf257W3yA+H2kcaQ053f0usQ/u2hLlgmW5UdAnFKUWMaonh4uiUWrr1h+O5
         DCKQ==
X-Gm-Message-State: AO0yUKVdPFlY2MwuKHJ8Qn5y5+dsC16n6/wEVNP73SMRv35Ys3KZDtcE
	bM56VPlG7FcVDhamcUrVFKU=
X-Google-Smtp-Source: AK7set9x7EzaUpWev+yfVdYQZs4/VetrJQSk64rd89ldBRD4zNng7APaNzY9p+fBZRaaVopAjd3KAA==
X-Received: by 2002:a17:906:344d:b0:932:83fa:d2fe with SMTP id d13-20020a170906344d00b0093283fad2femr3913646ejb.12.1679423701474;
        Tue, 21 Mar 2023 11:35:01 -0700 (PDT)
Received: from alaa-emad.. ([41.42.177.251])
        by smtp.gmail.com with ESMTPSA id bm7-20020a170906c04700b0093332993b1bsm4670919ejb.137.2023.03.21.11.34.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Mar 2023 11:35:00 -0700 (PDT)
From: Menna Mahmoud <eng.mennamahmoud.mm@gmail.com>
To: gregkh@linuxfoundation.org
Cc: outreachy@lists.linux.dev,
	johan@kernel.org,
	elder@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	eng.mennamahmoud.mm@gmail.com,
	Julia Lawall <julia.lawall@inria.fr>
Subject: [PATCH v2] staging: greybus: use inline function for macros
Date: Tue, 21 Mar 2023 20:34:56 +0200
Message-Id: <20230321183456.10385-1-eng.mennamahmoud.mm@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert `to_gbphy_dev` and `to_gbphy_driver` macros into a
static inline function.

It is not great to have macros that use the `container_of` macro,
because from looking at the definition one cannot tell what type
it applies to.

One can get the same benefit from an efficiency point of view
by making an inline function.

Suggested-by: Julia Lawall <julia.lawall@inria.fr>
Signed-off-by: Menna Mahmoud <eng.mennamahmoud.mm@gmail.com>
---
changes in v2:
	-send patch as a single patch.
	-edit the name of struct object.
	-edit commit message.
---
 drivers/staging/greybus/gbphy.h | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/greybus/gbphy.h b/drivers/staging/greybus/gbphy.h
index d4a225b76338..e7ba232bada1 100644
--- a/drivers/staging/greybus/gbphy.h
+++ b/drivers/staging/greybus/gbphy.h
@@ -15,7 +15,10 @@ struct gbphy_device {
 	struct list_head list;
 	struct device dev;
 };
-#define to_gbphy_dev(d) container_of(d, struct gbphy_device, dev)
+static inline struct gbphy_device *to_gbphy_dev(const struct device *_dev)
+{
+	return container_of(_dev, struct gbphy_device, dev);
+}
 
 static inline void *gb_gbphy_get_data(struct gbphy_device *gdev)
 {
@@ -43,7 +46,10 @@ struct gbphy_driver {
 
 	struct device_driver driver;
 };
-#define to_gbphy_driver(d) container_of(d, struct gbphy_driver, driver)
+static inline struct gbphy_driver *to_gbphy_driver(struct device_driver *drv)
+{
+	return container_of(drv, struct gbphy_driver, driver);
+}
 
 int gb_gbphy_register_driver(struct gbphy_driver *driver,
 			     struct module *owner, const char *mod_name);
-- 
2.34.1

