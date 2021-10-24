Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CA232CA0
	for <linux-staging@lists.linux.dev>; Sun, 24 Oct 2021 21:25:51 +0000 (UTC)
Received: by mail-vk1-f175.google.com with SMTP id 20so1627637vkc.8
        for <linux-staging@lists.linux.dev>; Sun, 24 Oct 2021 14:25:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7gFBvsyo02xfQlMrkGMRUgpYnVFylPr5PKSD1wmXbLg=;
        b=Btk6kwxqQBLlK2Kl1khbLgAVTUIw/lZRbLWOD2RLGd7WdFpR+i3lWlMwVbIT73D6pE
         +ffDRnhLxgOkp8fMksTJJYdzx/4C4UjdjZMIocEWKVNQbjhPPkvh96UKo9HO3pqfO5JA
         fLNXcazO86z9Mo3Riwxc71eZBfmo73bRBKKma7/15l/5SSV3O+EOc7Lrcj+j1Y9eKAKU
         4eiW3YN98a8pezB8OlbMaiKS/Dz0ooL3PPvXq6ek+uaL97wszk+kgDcOyWmzkl7B/EcH
         HKdzHlIdo6DK2JdAZeqmv1KZNUqpRLIg2zPk2UiuwZF8iK9rV8LjsS8jZG6ccY5LtE7m
         lyCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7gFBvsyo02xfQlMrkGMRUgpYnVFylPr5PKSD1wmXbLg=;
        b=edkGV6aDjhOdN5FSfbl/XdnnmC+8bwUB/lyP1exMpKhPZyQUplkZtrVZufh7XZXG7y
         20QBKc+lhUBzOuzJyltyC1o+lWrb3mrQkpUqnJQt696HTz/RdjCoafCoHGP/4dRPdO6m
         OLxapRvRSccWbmQEIq/0slvcYRev1CQ3M9Pv9rjPP3v22IikL3b2W+zOmzeeGxXyLIVm
         ZVfyx0Rs8y7oUIR3YWeo2jf0tpN78NZpkypUhp+mG3H3n6GeWn6t+oM3hlIPaqEc1rhE
         EzZ5JCRR+JnzOrRmGK4Rihqg39K/9QcAoU1hzSpvCCi3XVTe0LkSHfVOLY5wOLeTdeje
         OV7g==
X-Gm-Message-State: AOAM530dBmH+VM+jwXDtnVgKOeU6sptl8HGHk7d62YOILlmGoipngFUz
	N8siProsVym3BvOYiGf9B2Q2IRGvG7RXnA==
X-Google-Smtp-Source: ABdhPJz0+9rGWIupGWw1BBWoq7paoigHka6FgVu6a5eE9CkFAsLrbRIM0DXSjLR2QI+XyOQjQzWFCQ==
X-Received: by 2002:a1f:7d0a:: with SMTP id y10mr1004095vkc.12.1635110749736;
        Sun, 24 Oct 2021 14:25:49 -0700 (PDT)
Received: from localhost.localdomain ([191.83.215.63])
        by smtp.gmail.com with ESMTPSA id 45sm8847869uaq.8.2021.10.24.14.25.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Oct 2021 14:25:49 -0700 (PDT)
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
Subject: [PATCH v2 3/8] staging: vchiq_core.h: fix CamelCase in function declaration
Date: Sun, 24 Oct 2021 18:25:19 -0300
Message-Id: <20211024212524.370078-4-gascoar@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211024212524.370078-1-gascoar@gmail.com>
References: <20211024212524.370078-1-gascoar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Renaming function declaration to avoid CamelCase use.

As this was already fixed in the function definition in commit
801b1aa002d3 ("staging: vc04_services: fix CamelCase"), the current
change make the names of the variables in the function definition and
declartion match.

Reported by checkpatch.pl

Signed-off-by: Gaston Gonzalez <gascoar@gmail.com>
---
 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
index 893b07698268..383c3bcf787e 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
@@ -622,7 +622,7 @@ extern void
 vchiq_set_conn_state(struct vchiq_state *state, enum vchiq_connstate newstate);
 
 extern void
-vchiq_log_dump_mem(const char *label, uint32_t addr, const void *voidMem, size_t numBytes);
+vchiq_log_dump_mem(const char *label, uint32_t addr, const void *void_mem, size_t num_bytes);
 
 extern enum vchiq_status vchiq_remove_service(unsigned int service);
 
-- 
2.33.1

