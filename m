Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B74441373;
	Sun, 19 Mar 2023 11:42:02 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id fd5so36617810edb.7;
        Sun, 19 Mar 2023 04:42:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679226121;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KvKtR1SyAlL8ZclsQUDCqvyh4Wf6MUHzliuNE/yYx4s=;
        b=J+tF2zg0Iwm2XC+tSURltnxNQztJUX8K2WBuYczagLH8I+10V1lWzZ5v61uH41iLz1
         hTz0VBA00NC6qtRR8wAcrvnzUWf8qhVIu6rczb2cXmHUKO/9/Xz+qqabybsloeKJ6PJ3
         mkw06RzTkMj0rSO6xJ975aATHmtkSRNf3I/EiMIzc8ERd6WMYTwwmzEHhXBXr/bbuOPd
         tUK30bE3M16oN0Lql1vYjFiIyeArdecNTrvlaUDLx4TyVSI+5K1jz7GWtUaGySW8PAw1
         tCU3rYSEr0EsaxZPpgmVKhTsL2w3V3XwqwxbOggLZv8uzIMsvj7AUYDJfMsSmFK4nL53
         nqYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679226121;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KvKtR1SyAlL8ZclsQUDCqvyh4Wf6MUHzliuNE/yYx4s=;
        b=qNL60ktplmmuF/HktO2vvJdDF/bC/51k4Eh31Px3Hz9iiEW5Z/U9ba1HbyqWV9DjxU
         FkGxkHV19wWBIDTvbstJxTtcSwpY+YhPNIt1AUCgjMmZYQ4uh8RjkyRbYXXoJcK2oVtN
         w0MVMdTOoI+DH0C3q2qpdql98gSb347L1Q8l54XkzBHRiccoTl8mr1rrDozuagiU7wol
         hbN+YgAuEfij4a/tKOSrIrLIPv93DDu15zvH9iYkVugwJOduWrzkXs0ihDl0D2NoUYaK
         WG54Q96tmMUetHlc+90uGG1wy4IohwGhvy9VfLqZjBwwwvWJNp1kgFxykWX0/CY/LVGY
         /18Q==
X-Gm-Message-State: AO0yUKX7hUuG6YB1bHZO1HbrJ5lZ4Ok5598CbB8Yyx2YeN+cV3DY+mDC
	Ef/Whhkz6ggz9smJmaeXEkA=
X-Google-Smtp-Source: AK7set9gVBgC4A/48cDFSZl0RptXfN5NNcuDRCsURmwXed/2ruJCIN2pBCGb46OVpt06wbLi5JNwBQ==
X-Received: by 2002:a17:907:720a:b0:933:f310:34f7 with SMTP id dr10-20020a170907720a00b00933f31034f7mr1309456ejc.15.1679226120887;
        Sun, 19 Mar 2023 04:42:00 -0700 (PDT)
Received: from alaa-emad.. ([41.42.177.251])
        by smtp.gmail.com with ESMTPSA id b7-20020a1709063f8700b008eddbd46d7esm3180681ejj.31.2023.03.19.04.41.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Mar 2023 04:42:00 -0700 (PDT)
From: Menna Mahmoud <eng.mennamahmoud.mm@gmail.com>
To: gregkh@linuxfoundation.org
Cc: outreachy@lists.linux.dev,
	vireshk@kernel.org,
	johan@kernel.org,
	elder@kernel.org,
	greybus-dev@lists.linaro.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	eng.mennamahmoud.mm@gmail.com
Subject: [PATCH] staging: greybus: add blank line after struct
Date: Sun, 19 Mar 2023 13:41:54 +0200
Message-Id: <20230319114155.42148-1-eng.mennamahmoud.mm@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

add blank line after struct for readability as
reported by checkpatch script

" CHECK: Please use a blank line after function/struct/union/enum
declarations"

Signed-off-by: Menna Mahmoud <eng.mennamahmoud.mm@gmail.com>
---
 drivers/staging/greybus/gbphy.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/staging/greybus/gbphy.h b/drivers/staging/greybus/gbphy.h
index d4a225b76338..1de510499480 100644
--- a/drivers/staging/greybus/gbphy.h
+++ b/drivers/staging/greybus/gbphy.h
@@ -15,6 +15,7 @@ struct gbphy_device {
 	struct list_head list;
 	struct device dev;
 };
+
 #define to_gbphy_dev(d) container_of(d, struct gbphy_device, dev)
 
 static inline void *gb_gbphy_get_data(struct gbphy_device *gdev)
@@ -43,6 +44,7 @@ struct gbphy_driver {
 
 	struct device_driver driver;
 };
+
 #define to_gbphy_driver(d) container_of(d, struct gbphy_driver, driver)
 
 int gb_gbphy_register_driver(struct gbphy_driver *driver,
-- 
2.34.1

