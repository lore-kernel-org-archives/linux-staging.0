Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3E8A2CAB
	for <linux-staging@lists.linux.dev>; Sun,  5 Dec 2021 13:59:37 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id r25so31853156edq.7
        for <linux-staging@lists.linux.dev>; Sun, 05 Dec 2021 05:59:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wbc5BjprOLrYjULn10Q4JIxpSgq7iMFV0qoy8K2cU4w=;
        b=PKSssRcZs64czEbOVxfix++TMNmx9h9de/ERbPZ1iwXrndb299Ts5kapaJRt3hLYfY
         VGyC04XcKN2CDLYjfXAePji0eOBwq7+3EgcrQr4sYgu3w99UQO+2bugbtAWscJwBrNqn
         uoXcSVwTLkuXNPtQXZGccn39RyFHBg7Rj3TG+HYVLj2Tvy4uSTimEeQyy+9fS4IbnEq8
         kifyWJRD4gzdsWTfpvlqSQegHsl1l4wJqmNz6DOtURlBbD03UbXeWSdtmwtTJZLH3Uk1
         UtYYIbad15uhMRcdhA4RB49qjeJ17TXWhRIV68isHXLR0Afu6E9qma/dcQU7+UaUhvTw
         w8Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wbc5BjprOLrYjULn10Q4JIxpSgq7iMFV0qoy8K2cU4w=;
        b=ivn7upHVD1sohlTyBTqhLv4flcrGAauYAVGFdKxwslu2jO/k2ao9y9JzHXBn6n4Y4N
         yJ1tFOtElhPV2WcoB9lCOfYPclluRfI7Y+NwkalUk33yEFf40dDVjCZ/IS5xm46/WE58
         Xc7GqMzckIK5QLPIXQBa42QeW72PX0BpTVqU4vsdFi6DAwrzB0ZzqXPLbxG4MkZ/xF+M
         HT/URn7czBf77Wo9loxoH6VFDkCPFBQUl4x/Q7m94LePKxWCjjShQ3ogbC8P0dI9iMC1
         N7u9KPUu5EHx6UViNfPATyixGnTUt+o269cj/4W50P71NLzDc+tilrX5V1G4cKV/itBW
         gdig==
X-Gm-Message-State: AOAM531/j9czKmH4dpKfuUXO8JnsMZNPEd4T5jkt4xCtEERR7PAW0rmx
	SURjY12ewDGsCKv4/0DPezi8zw0Bpmo=
X-Google-Smtp-Source: ABdhPJxlgd7Q0GOE5gLSTyvsF9vXU4jeu5dryDMh+pYReyiJUIGrt6lHSqtD6QkD+XF0i0ZSRL7KSg==
X-Received: by 2002:a50:f189:: with SMTP id x9mr45300168edl.95.1638712776147;
        Sun, 05 Dec 2021 05:59:36 -0800 (PST)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::5a05])
        by smtp.gmail.com with ESMTPSA id yd20sm5146451ejb.47.2021.12.05.05.59.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Dec 2021 05:59:35 -0800 (PST)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 12/12] staging: r8188eu: hal_data_sz is set but never used
Date: Sun,  5 Dec 2021 14:59:19 +0100
Message-Id: <20211205135919.30460-13-straube.linux@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211205135919.30460-1-straube.linux@gmail.com>
References: <20211205135919.30460-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

hal_data_sz in struct adapter is set but never used. Remove it.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/hal/usb_halinit.c   | 1 -
 drivers/staging/r8188eu/include/drv_types.h | 1 -
 2 files changed, 2 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/usb_halinit.c b/drivers/staging/r8188eu/hal/usb_halinit.c
index 641aaf299109..da966538596f 100644
--- a/drivers/staging/r8188eu/hal/usb_halinit.c
+++ b/drivers/staging/r8188eu/hal/usb_halinit.c
@@ -1969,5 +1969,4 @@ void rtl8188eu_alloc_haldata(struct adapter *adapt)
 	adapt->HalData = kzalloc(sizeof(struct hal_data_8188e), GFP_KERNEL);
 	if (!adapt->HalData)
 		DBG_88E("cant not alloc memory for HAL DATA\n");
-	adapt->hal_data_sz = sizeof(struct hal_data_8188e);
 }
diff --git a/drivers/staging/r8188eu/include/drv_types.h b/drivers/staging/r8188eu/include/drv_types.h
index c0854e9401b8..ff98ad90a65b 100644
--- a/drivers/staging/r8188eu/include/drv_types.h
+++ b/drivers/staging/r8188eu/include/drv_types.h
@@ -206,7 +206,6 @@ struct adapter {
 	struct wifidirect_info	wdinfo;
 
 	struct hal_data_8188e *HalData;
-	u32 hal_data_sz;
 
 	s32	bDriverStopped;
 	s32	bSurpriseRemoved;
-- 
2.34.1

