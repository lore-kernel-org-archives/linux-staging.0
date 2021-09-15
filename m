Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84CA12FB2
	for <linux-staging@lists.linux.dev>; Wed, 15 Sep 2021 20:19:06 +0000 (UTC)
Received: by mail-qk1-f172.google.com with SMTP id b64so5002987qkg.0
        for <linux-staging@lists.linux.dev>; Wed, 15 Sep 2021 13:19:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=b700IZOvcmDVrq+0HZ+RP1WwJQWxcExsUcbv+nvnXKY=;
        b=qvHmIw3rsiOmJNvQnovoM0eSxf60ZOF3NN7bXJBhMKTXA5AZMTxHsB2LVjXld7utC9
         AhyY9FxPd9Ug9poqLYuFD9UxFZjFqBjtuUMxAF5Vixoq9VZKDOolaWEKJDTjvDw0wEG9
         zGLALbltQ63z8cHWnCD86kXsj++MFG7cuHNBOm+KC17g2fvCp3fdaL0bnWJPqpTkJeyc
         dz9BNi1qdEblD43b4H5QgQ3ugJD7U9aBdczHMi79wgNg+5W5ugDf8isf8QjsLz/cUV9k
         ODxCDfYCxEBQqQWumFCo5xWpd0ghL4ANHajmOQIu8/GkCROwbw7auSVvqsWwDJ8b+S0A
         Wisg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=b700IZOvcmDVrq+0HZ+RP1WwJQWxcExsUcbv+nvnXKY=;
        b=GakVWcVTunfByxvM0SizOmVO0a79rp+2AudJgT/uqCwsFO2F7bnZuyKV2K97Pm8ere
         jlt0PC8BeRDm+36WlFks9huIPJ8XHlK7K/aL8Ho43p4RwDlegvCJ+b/KXxkts7F3xGh3
         zAuC3dEq/jp1pTUVxg86l00XLmTuZVjBLb8gRYXe9zP2YmiWPECyZRV44km0e5OazWIQ
         zQO44sN38EtDbnceFYUYjnu7xrgQuaMZGkpDDp4EkCry7xSDsUY2eTJELx3Miepv2/XP
         /QJqJlfOeNGQOM6jjwKVVu85390APcAw5LXGVP7Wp/8/J9XsfzCi01f+R2ybMWG967iB
         n/Ag==
X-Gm-Message-State: AOAM530zPTbFewHrqLoeP8I/wzuthFWWDb0rHKM6phc71YPmcVgA3O6+
	0wqAFp3Pz9Ni/igaj0COCGXr/B0KCNfKag==
X-Google-Smtp-Source: ABdhPJzmRHxWO920nngdRsWvz7XJcu2fOsLeeXM1AJ5dnkZrzjyb14Hm86NHvlwr1RDYeC+Xu1I+uw==
X-Received: by 2002:a05:620a:bc5:: with SMTP id s5mr1771242qki.47.1631737145479;
        Wed, 15 Sep 2021 13:19:05 -0700 (PDT)
Received: from debianG.lan ([181.166.206.110])
        by smtp.gmail.com with ESMTPSA id g8sm752834qkm.25.2021.09.15.13.19.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Sep 2021 13:19:05 -0700 (PDT)
From: Gaston Gonzalez <gascoar@gmail.com>
To: linux-staging@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	nsaenz@kernel.org,
	stefan.wahren@i2se.com,
	arnd@arndb.de,
	dan.carpenter@oracle.com,
	ojaswin98@gmail.com,
	amarjargal16@gmail.com,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	bcm-kernel-feedback-list@broadcom.com,
	linux-kernel@vger.kernel.org,
	gascoar@gmail.com
Subject: [PATCH 4/7] staging: vchiq_arm: cleanup blank lines
Date: Wed, 15 Sep 2021 17:18:21 -0300
Message-Id: <20210915201824.413202-4-gascoar@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210915201824.413202-1-gascoar@gmail.com>
References: <20210915201824.413202-1-gascoar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unnecessary blank lines after open braces and before close
braces.

Reported by checkpatch.pl

Signed-off-by: Gaston Gonzalez <gascoar@gmail.com>
---
 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
index 9464a4777ff6..778540faaa1c 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
@@ -1218,7 +1218,6 @@ int vchiq_dump_platform_service_state(void *dump_context,
 struct vchiq_state *
 vchiq_get_state(void)
 {
-
 	if (!g_state.remote)
 		pr_err("%s: g_state.remote == NULL\n", __func__);
 	else if (g_state.remote->initialised != 1)
@@ -1339,7 +1338,6 @@ vchiq_arm_init_state(struct vchiq_state *state,
 
 		arm_state->state = state;
 		arm_state->first_connect = 0;
-
 	}
 }
 
-- 
2.33.0

