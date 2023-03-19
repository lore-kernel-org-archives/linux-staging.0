Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAF571C39;
	Sun, 19 Mar 2023 20:13:37 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id w9so39386055edc.3;
        Sun, 19 Mar 2023 13:13:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679256816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hgnQ+h5zd1AueyynbINK8XAtTpd+QQVfh8Mi4U0c3Fo=;
        b=ZliHulYrzEg7jMD7jC/tO8w/HGO57r9H3GDrGhhnO/uCQ9/YKgngMPBLGTxBp817vA
         qHPN1g9gNFzEpQasqLqSmcc5I63MkWEtEE1JIc7p9BI45DNDLFXGn7Owssp5Sx5xTrW1
         EYxbyfUdvyifu/v9Fbp2AaONaWffg2GUHBmo0Irpjy+oXoCyWL0beQbdkvAyPJH1QQlY
         f/+pTmoMm544mnN9GfYM3WMIl2qpOMtRR26rxWqnf4lmRkB4haGAm717IIojkW7Y0ynQ
         IKCko+W+o/u6xTHwjezZAF+tmwbUvzaPnRc6Y+n3gsH9YTdGEGWvzyH5AwzJ2KtGqtki
         QIHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679256816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hgnQ+h5zd1AueyynbINK8XAtTpd+QQVfh8Mi4U0c3Fo=;
        b=0DpxEDPOHsOUZ9+YH0SpB0vdAxZa4c0Nweyj+4To1XLrftw1f9rQwv4ueA2dXADcg6
         g5t2jJ7RPtAy6Fizg+RGGQeVSkQywP2m1jWKQjg1xW70zjfAhgRBfyGYB05PDc2hC/SX
         MolVMvRscnIizT7DE12XU1ERnzPTRoFlcOdttgPIkRMg5Ppo3g62eeJxv5VZe62gmFpY
         2T8iUZjzZ97TUYp9hSfJcZrkh9DSQ1XYoEJ1yDovOmriTWMhpNS16BdKrfkzBeKJsX1+
         9qU5NSNSKue87G1nVbBAbMf5eSoRd8wiXANRm6LEebnbkd0cjTW68HPZ8QeWX3A8Jc+C
         retQ==
X-Gm-Message-State: AO0yUKVAGtLwgaNk7A39BJW1o9YZaxaxZUL+/5knVTbl9jJxbnXcsrC3
	kbPOfRwsz/ut3Dpud+jmCik=
X-Google-Smtp-Source: AK7set+ODMQXplVES5UGk7JyY6zEtWt49I9FbAbBtYNQcQF3NOBn8tHA0lQmBHVOZkDBvYPTghdH/Q==
X-Received: by 2002:aa7:cb4f:0:b0:4fb:1b0d:9f84 with SMTP id w15-20020aa7cb4f000000b004fb1b0d9f84mr10307130edt.6.1679256815931;
        Sun, 19 Mar 2023 13:13:35 -0700 (PDT)
Received: from alaa-emad.. ([41.42.177.251])
        by smtp.gmail.com with ESMTPSA id g22-20020a170906199600b008b1797b77b2sm3511654ejd.221.2023.03.19.13.13.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Mar 2023 13:13:35 -0700 (PDT)
From: Menna Mahmoud <eng.mennamahmoud.mm@gmail.com>
To: gregkh@linuxfoundation.org
Cc: outreachy@lists.linux.dev,
	johan@kernel.org,
	elder@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	eng.mennamahmoud.mm@gmail.com,
	Julia Lawall <julia.lawall@inria.fr>
Subject: [PATCH] staging: greybus: use inline function for macros
Date: Sun, 19 Mar 2023 22:13:24 +0200
Message-Id: <20230319201324.253874-1-eng.mennamahmoud.mm@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert `to_gbphy_dev` and `to_gbphy_driver` macros into a
static inline functions.

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
index 1de510499480..42c4e3fe307c 100644
--- a/drivers/staging/greybus/gbphy.h
+++ b/drivers/staging/greybus/gbphy.h
@@ -16,7 +16,10 @@ struct gbphy_device {
 	struct device dev;
 };
 
-#define to_gbphy_dev(d) container_of(d, struct gbphy_device, dev)
+static inline struct gbphy_device *to_gbphy_dev(const struct device *d)
+{
+	return container_of(d, struct gbphy_device, dev);
+}
 
 static inline void *gb_gbphy_get_data(struct gbphy_device *gdev)
 {
@@ -45,7 +48,10 @@ struct gbphy_driver {
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

