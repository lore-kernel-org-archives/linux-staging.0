Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA2CF7C;
	Sun, 19 Mar 2023 20:49:46 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id b20so6563406edd.1;
        Sun, 19 Mar 2023 13:49:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679258985;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=L5CLt5l4TCz1CmnxOdt+WgUKYgrA3LVqAot+WuRXqlA=;
        b=HTciBLqcsxjQsKrrZaKrQBKJb05epJEzu/YvZe7+r1jdosOareVKQQRXiSteVVTGVL
         5ttb0pAiDAH/EjxTKEgTdoIADo5HUncf+YAIy5+L6xfw6Pf42lQZHYRqBUYXigVyD38p
         qfFtGR2NrCH+U7UJMlKUFlnVZmCoc4IPkWIoChJHwrwBQaIHVoTTejZevp4hQQN2/pfb
         f/wRDsetcWyFgfTTseaG4G2794tTGmLl953N+ey0uqCjuKwR7Ci13ywEKOr0yBUepLHq
         dmflQ2e5vcDebYxsDBUveVkl5DjN87Td5RjuCRU+ek9H1gLvG/ekC24mnMHOW6PcdX38
         22GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679258985;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L5CLt5l4TCz1CmnxOdt+WgUKYgrA3LVqAot+WuRXqlA=;
        b=QQlywmJZIQW6xS+h7jGIraO8tqy1kzgsyL1Om1iFjMc4GZfBgxG+Sx7Z4/5KtJB9wT
         iwx9QB5rp1Q5cGA9AWqFGeRS+TAUwG3HB5W0Qp+Su8IkPAqxyUdgXVJZ/UUocT5ZCzI2
         5QzEpJrJL/P3kVYOqMKDwRC0wX4kLOPNqm/FRNGFDW1GzfhnMyzltF3gNh8a7u6MI4DX
         w5pp9tpj3ezI1NPkgmYSCpfYErShqOACPUtoLRNS9sr8kUjUYNQ8qIEzZZF++xAv4fho
         5jqsNVQVceoyPgITRbg6UMoiZcBXI0kPrIgPFyzHbSd5FYNVP/XMla5A/5BO9JhLAVd8
         hFeQ==
X-Gm-Message-State: AO0yUKWb5T/04tfAOLvyylIvcf1QQrJqzuUSPsRYUVS+ZBSzy8x/Niih
	UrYMSH5RazhOhO0hjiqGOcyrIny8fyQ=
X-Google-Smtp-Source: AK7set+hOHTt0i9nlpUrmYUdJsFFLqBmF7VGZ3UHdlitwTFKimwuNTjzvOGv6RkYHNWLm3T5+3EzFg==
X-Received: by 2002:a05:6402:4ca:b0:4ad:738b:6706 with SMTP id n10-20020a05640204ca00b004ad738b6706mr10982836edw.2.1679258984926;
        Sun, 19 Mar 2023 13:49:44 -0700 (PDT)
Received: from alaa-emad.. ([41.42.177.251])
        by smtp.gmail.com with ESMTPSA id v6-20020a50d086000000b004fb00831851sm3882901edd.66.2023.03.19.13.49.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Mar 2023 13:49:44 -0700 (PDT)
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
Date: Sun, 19 Mar 2023 22:49:35 +0200
Message-Id: <20230319204935.259217-1-eng.mennamahmoud.mm@gmail.com>
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

it is not great to have macro that use `container_of` macro,
because from looking at the definition one cannot tell what type
it applies to.

One can get the same benefit from an efficiency point of view
by making an inline function.

Suggested-by: Julia Lawall <julia.lawall@inria.fr>
Signed-off-by: Menna Mahmoud <eng.mennamahmoud.mm@gmail.com>
---
changes in v2:
	remove newlines added in previous patch.
---
 drivers/staging/greybus/gbphy.h | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/greybus/gbphy.h b/drivers/staging/greybus/gbphy.h
index 1de510499480..03a977056637 100644
--- a/drivers/staging/greybus/gbphy.h
+++ b/drivers/staging/greybus/gbphy.h
@@ -15,8 +15,10 @@ struct gbphy_device {
 	struct list_head list;
 	struct device dev;
 };
-
-#define to_gbphy_dev(d) container_of(d, struct gbphy_device, dev)
+static inline struct gbphy_device *to_gbphy_dev(const struct device *d)
+{
+	return container_of(d, struct gbphy_device, dev);
+}
 
 static inline void *gb_gbphy_get_data(struct gbphy_device *gdev)
 {
@@ -44,8 +46,10 @@ struct gbphy_driver {
 
 	struct device_driver driver;
 };
-
-#define to_gbphy_driver(d) container_of(d, struct gbphy_driver, driver)
+static inline struct gbphy_driver *to_gbphy_driver(struct device_driver *d)
+{
+	return container_of(d, struct gbphy_driver, driver);
+}
 
 int gb_gbphy_register_driver(struct gbphy_driver *driver,
 			     struct module *owner, const char *mod_name);
-- 
2.34.1

