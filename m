Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35288111A;
	Sun, 19 Mar 2023 11:08:38 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id h8so36451100ede.8;
        Sun, 19 Mar 2023 04:08:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679224116;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KvKtR1SyAlL8ZclsQUDCqvyh4Wf6MUHzliuNE/yYx4s=;
        b=EWqzApqKGHadxWZtuIft3/9k1Z/U4tnCN8u/aqfrNv6utosGaFw523fJ6leRaqEll4
         EQ28CbfFXGQMNlxErCoLR+Qk5RC/HUMST2x7w6ufa6xR/Xo1z0LJM3VfO/JgBUrCEvso
         FTyn+GRt1ath2vas19mi3uVsa9U11EzxEPdR/ZwUw/WaQaV1mELNtTGWjT4q0euhB9i/
         rC36xSR3eVmaTVjGyeUUfk0Aja3WyroUNB+dVS8kdiMfVjFOkL6GqeN1gef7vJO9Dd2E
         qnCkh9xFyemZ1n+yg03sgw0m633doI8TJyS3h1BdE+4u7pnuI4oRPMKDyEIBe3twjMSf
         yU5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679224116;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KvKtR1SyAlL8ZclsQUDCqvyh4Wf6MUHzliuNE/yYx4s=;
        b=NHixiF+HzaELC8o+5EN25wo/uzpCLfC9sXB0i0CI6K2W2qY4ZbznALquY6HrG4VNLi
         cuMQIlbCDtawIWU2kay49aelYxrhiaDjtAOx0hOt6MBI7c/WTnd6cV5JWguTf7DxXOq9
         F+rFZ7mkGuCdJqNFcot3ipjJ4KWNPVnR3jQy9KhWSynq+EUwrN3FBksIz6iajpq8bxF/
         AvXkMEgC4w7XyTecPQrK3wWc3NlGKxECNynUN9jpPNb4UqCOcgfznAeF3KiIuPIiMXJI
         /4Go1+vSd9iA1DC4piqhG/blkvkGSoLe18R/wO+P5dG9ZovtQvJo8iQqWUfMZA1ybY7T
         yMhA==
X-Gm-Message-State: AO0yUKVN5ZqYZwfB4INCykz9DbK1UfHUSvieXQEZFwYXSnSYMp7d+L4d
	E/yz/cBGD/sFERrSGtmdcTA=
X-Google-Smtp-Source: AK7set+M2KsLZ2J+fCSTK7GAzj2ZqhFqHG2PxlB63b1Ee3POlZ7DfjOfSQV70skSwAKtdTXkkftrew==
X-Received: by 2002:a17:906:1991:b0:92e:c4c9:7a43 with SMTP id g17-20020a170906199100b0092ec4c97a43mr5679412ejd.25.1679224116271;
        Sun, 19 Mar 2023 04:08:36 -0700 (PDT)
Received: from alaa-emad.. ([41.42.177.251])
        by smtp.gmail.com with ESMTPSA id m20-20020a170906259400b0092b8c1f41ebsm3122889ejb.24.2023.03.19.04.08.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Mar 2023 04:08:35 -0700 (PDT)
From: Menna Mahmoud <eng.mennamahmoud.mm@gmail.com>
To: gregkh@linuxfoundation.org
Cc: outreachy@lists.linux.dev,
	johan@kernel.org,
	elder@kernel.org,
	greybus-dev@lists.linaro.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	eng.mennamahmoud.mm@gmail.com
Subject: [PATCH] staging: greybus: add blank line after struct
Date: Sun, 19 Mar 2023 13:08:31 +0200
Message-Id: <20230319110831.39931-1-eng.mennamahmoud.mm@gmail.com>
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

