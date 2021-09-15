Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DEEE3FC9
	for <linux-staging@lists.linux.dev>; Wed, 15 Sep 2021 20:29:39 +0000 (UTC)
Received: by mail-ot1-f50.google.com with SMTP id k12-20020a056830150c00b0051abe7f680bso5336771otp.1
        for <linux-staging@lists.linux.dev>; Wed, 15 Sep 2021 13:29:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+SQzu4YMziYEtKQGqS+FmHBlALDwBAUY8mKyC0ZwRh0=;
        b=GCaKcF+sDRDg86ia81S0byZn6XvSifOGsOIbToWouHeQu75qaXYYF313+PPxe83GnK
         mdN3k8re0i04xTLd//ynX4UL+lIsjxwf0NwxUtUDcUh2+v9izikUtzMh+hED1+RY/WbL
         Ib6U5yUL+aPc+5W7/KfAiSzFAlMKFgTss+rNwNvbP8z4ttqj5Qf1s4BCSg/3b85bsCd1
         TjVQAt+h7TaN1At9htUDRfdoJfw9rTQ4MTfZDqkzoLqfJ/xtaOTciI+oBehGKnWeJOf/
         xat69Jf1qFQu4vsTlAIYrMDLMobcW16U5rwz8G/Imh94JSLm2/qklUr/ur7XCcsSLFnZ
         w8tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+SQzu4YMziYEtKQGqS+FmHBlALDwBAUY8mKyC0ZwRh0=;
        b=08m8n81LbqDntNvW52FmtC+8wot6eYa1HcwfatYXslhz7V+lXUNVDgMMwvZLjqP8gP
         H+STKF+MKPndjUQAb6485DD1Onr5uPL1fa4TIkJRceR365Na3VLsriSXUakRKjBFdYpf
         XFaLryBBL17QJnsWCcuBvhDFEar4KMoUETdtlf8HFLRx6dIXqau1woxOQO8Z8z9EKJpz
         Dr9yOpVVNiis6DhDdZXoxvgVdFu4LCXyHXmKQ3yy00wRflOPNpTTXeGzoyD/04fUNyWZ
         iPiE3tMYzF2axeJEzXfd+ZooLdAsaNyD4BNLwaS3oIH9Oe7MuQYTxNGS6oqopD/iVBjH
         VaoQ==
X-Gm-Message-State: AOAM530IBHQnrXId9iLGavJRiNBTfqr6qI8Biwkum6G0gtaFstpld6eM
	SsGED5OL5mYKOvLmaeahg7or6TK3+PMakQ==
X-Google-Smtp-Source: ABdhPJxF4D8XOaygWU9C8hsLFFcTyw76Vhli+KyZdU2svSswjdlBe7eJvZ2PRduSuxjesKGSwIRwdQ==
X-Received: by 2002:a9d:7b48:: with SMTP id f8mr1705757oto.296.1631737778060;
        Wed, 15 Sep 2021 13:29:38 -0700 (PDT)
Received: from debianG.lan ([181.166.206.110])
        by smtp.gmail.com with ESMTPSA id l4sm247584oth.4.2021.09.15.13.29.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Sep 2021 13:29:37 -0700 (PDT)
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
Subject: [PATCH 3/3] staging: vchiq: cleanup code alignment issues
Date: Wed, 15 Sep 2021 17:29:16 -0300
Message-Id: <20210915202916.413914-3-gascoar@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210915202916.413914-1-gascoar@gmail.com>
References: <20210915202916.413914-1-gascoar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix code alignment issues.

Reported by checkpatch.pl

Signed-off-by: Gaston Gonzalez <gascoar@gmail.com>
---
 .../vc04_services/interface/vchiq_arm/vchiq_connected.c       | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_connected.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_connected.c
index 1802fd5e4888..bdb0ab617d8b 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_connected.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_connected.c
@@ -40,8 +40,8 @@ void vchiq_add_connected_callback(void (*callback)(void))
 	} else {
 		if (g_num_deferred_callbacks >= MAX_CALLBACKS) {
 			vchiq_log_error(vchiq_core_log_level,
-				"There already %d callback registered - please increase MAX_CALLBACKS",
-				g_num_deferred_callbacks);
+					"There already %d callback registered - please increase MAX_CALLBACKS",
+					g_num_deferred_callbacks);
 		} else {
 			g_deferred_callback[g_num_deferred_callbacks] =
 				callback;
-- 
2.33.0

