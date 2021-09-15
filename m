Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD8243FFF
	for <linux-staging@lists.linux.dev>; Wed, 15 Sep 2021 20:19:03 +0000 (UTC)
Received: by mail-qt1-f170.google.com with SMTP id 2so3581482qtw.1
        for <linux-staging@lists.linux.dev>; Wed, 15 Sep 2021 13:19:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mKpje/Y92jR84VIMNNbzSjTlUCixt6FDWJQ+8cv/w1Q=;
        b=gSiuigEIwU1wjsEmm18oxIpET62h6EDABgcWUonBTQvBUPtHtnzv45eDDfKkXVBjIc
         ZeaZVNJw9hoKhK/oZX0yy/P3HOTruOIYv5f//lDBEiDNEagMYy1P19902oEvqR3ur3lP
         NziIAcie8NFs/skCe2cnkvn2pLxQnYH0auim7siVOOmzmZAPaclDVYrmGutjYQnWoi6v
         vSHo8AjaVpRZ+veCE/fv803jVCAWc7o/918wFZBuOqhFL0XI4J2vu5cQHgDM/s0jgnPK
         SC3zYj8SoNM/2FeFex7oigyxTxaYlj7aXVJfAQ2VpLzZx0ungRDBl6nhF19eRVpuOS7S
         xL2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mKpje/Y92jR84VIMNNbzSjTlUCixt6FDWJQ+8cv/w1Q=;
        b=7QJecQv5M/OjT1Uf7Q1h0jGp8w1PrtASjbNa62A1+iNYk/XEOe7LKXM0hCvDAIi6XV
         DBs5RjBiAKBQxfn9Z+VjX69WiMhEzuJbN/dEXMUWdyczoFjol2dhNEt1FCZzXEcSfK11
         qNpqm6bXjJyPPm3BeQgvF6eQ/8i/hKrBCGlEmjW+wBLtN6x3SlrsaAiblh0xBb9RgdMV
         Vbv8b1z8CZcyPNpdJFjeUrZQ/eWDBYBreP7lPsYUg1s53UjgyBE+S+RIyDoa2+NspmsD
         9lIWLhuCZcaww1d8KbfdxrzS2LkyfNXmKze9DLRU1gbLk/HU2gAIW0i2jv3p4RPNYkkS
         RoEQ==
X-Gm-Message-State: AOAM531+u+kFRKe17OjkgSnYuZ2KNe+zCZhpg0iLMPISXJbIQppv5fuz
	5c/2GXoVAydLv4HDVWJlkQB8TO7yuRa+og==
X-Google-Smtp-Source: ABdhPJzH6iLvJ6Y6ofAT6FP6w2noAViWq+EhkXChEKeGsyWBbsMwf4pHBh+lNzuex90XiKgeFTU1ag==
X-Received: by 2002:ac8:5194:: with SMTP id c20mr1751717qtn.68.1631737142661;
        Wed, 15 Sep 2021 13:19:02 -0700 (PDT)
Received: from debianG.lan ([181.166.206.110])
        by smtp.gmail.com with ESMTPSA id g8sm752834qkm.25.2021.09.15.13.19.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Sep 2021 13:19:02 -0700 (PDT)
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
Subject: [PATCH 3/7] staging: vchiq_arm: clarify multiplication expressions
Date: Wed, 15 Sep 2021 17:18:20 -0300
Message-Id: <20210915201824.413202-3-gascoar@gmail.com>
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

Add spaces around '*' in multiplication expressions to enhance
readability.

Reported by checkpatch.pl

Signed-off-by: Gaston Gonzalez <gascoar@gmail.com>
---
 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
index e8b84b2b1ac3..9464a4777ff6 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
@@ -466,8 +466,8 @@ int vchiq_platform_init(struct platform_device *pdev, struct vchiq_state *state)
 
 	g_free_fragments = g_fragments_base;
 	for (i = 0; i < (MAX_FRAGMENTS - 1); i++) {
-		*(char **)&g_fragments_base[i*g_fragments_size] =
-			&g_fragments_base[(i + 1)*g_fragments_size];
+		*(char **)&g_fragments_base[i * g_fragments_size] =
+			&g_fragments_base[(i + 1) * g_fragments_size];
 	}
 	*(char **)&g_fragments_base[i * g_fragments_size] = NULL;
 	sema_init(&g_free_fragments_sema, MAX_FRAGMENTS);
-- 
2.33.0

