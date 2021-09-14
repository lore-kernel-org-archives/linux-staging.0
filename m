Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F0F53FC3
	for <linux-staging@lists.linux.dev>; Tue, 14 Sep 2021 21:37:08 +0000 (UTC)
Received: by mail-qk1-f175.google.com with SMTP id b64so1223939qkg.0
        for <linux-staging@lists.linux.dev>; Tue, 14 Sep 2021 14:37:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QfLyoS/knpvzT0Bix+STgO/jKm0Ji7ZOPiwk0Sv8GjI=;
        b=f/1jHaZ/OdNGv/KlwhLXDys+VoYt45/YWHBclxzfIsx86kQOlrnyks7/zeN/m5VETJ
         THXTNgDk4mSFQ0ZfbP4zy/FsPKGwlDSN6rUGqaKnfoyodPwYK4TnGxesV/gzPuI8qFno
         iaLoquJEsKqfcUGFbjJna21//JyDGlnrHusyhLAKEPSxx1DnnjszFoMaLBYzOt63cUHM
         e0nqD2MD/YTgIESAWFczg5ProwoCKPeia1MuoBKa1inBY0p3iKs7W9CNI/96eHVv761X
         0in2oaPcHFPEY5Xxtp9iiNc/SqDE9/ghMoYlgCsCWsyx4zqn7J0ZRTH/GH3hDiM8vSL2
         cl0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QfLyoS/knpvzT0Bix+STgO/jKm0Ji7ZOPiwk0Sv8GjI=;
        b=g/ARrHsuRECWsj154B2j+4Qfdxj6dCH2n9AxplNs5CqOtNkCjr1P8Js1ShbGWaywNA
         cjFfUojcFNWnoLATmXP36V5eAhqIoFDywx9RNWrgG0p1A8X+BN+GLVywffzgyfg7F1gh
         ASf3AwYVho94ZMKsD102rSr+88jqKsImGhiZNDjX/+g64gXtTmJu+oBUJndzl/OeAFyW
         qL6YpnefGBLPFWKopwFJDGeo/2c8+SvPz2HTqGesTS9UUT3dmG6xzPVUti+yoM3YNEuA
         +DgggtjqBD/KnClvU4JiyzMrvy1QpmWtU0Pc7rFlV7YbakYAsZziaJ4GtziDktIrhTbb
         fKOA==
X-Gm-Message-State: AOAM532np/4in3UcKpWPg3IDATpSeab3Wfa9Iq/x/tPcjBHY3KO5hqjg
	BrBMNgc4ZycNNa+uLLzBs2RXxGnXnlmrUQ==
X-Google-Smtp-Source: ABdhPJxNi2vbW83hYA3Zi/244geUsgsiYd4i4UGRDtj5nMracZU/FsbqE9W9oZeSvanWxkMVCJF/Rg==
X-Received: by 2002:a05:620a:290d:: with SMTP id m13mr7009333qkp.426.1631655427875;
        Tue, 14 Sep 2021 14:37:07 -0700 (PDT)
Received: from localhost.localdomain ([191.84.239.65])
        by smtp.gmail.com with ESMTPSA id o7sm6716611qtw.87.2021.09.14.14.37.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Sep 2021 14:37:07 -0700 (PDT)
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
Subject: [PATCH 5/8] staging: vchiq_arm: cleanup blank lines
Date: Tue, 14 Sep 2021 18:35:34 -0300
Message-Id: <20210914213532.396654-5-gascoar@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210914213532.396654-1-gascoar@gmail.com>
References: <20210914213532.396654-1-gascoar@gmail.com>
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
---
 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
index bb4035f2de65..ffacf1c7212b 100644
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

