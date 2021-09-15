Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D7E83FC9
	for <linux-staging@lists.linux.dev>; Wed, 15 Sep 2021 20:19:09 +0000 (UTC)
Received: by mail-qk1-f176.google.com with SMTP id bk29so4903328qkb.8
        for <linux-staging@lists.linux.dev>; Wed, 15 Sep 2021 13:19:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=eNeXjhvCGZPX2nOcWVH9hj3paV16QHjNZaxjtD37JKc=;
        b=g3OY89RCjR/ZGNoaOqhwVZXTsShvf+4AgqRiex9BxVvvDDGOxenuubTn8Mm0zFpxlP
         vhjhH6r6IMvoDpkKeOD7854wV7ZjqnRes5liPmP0Z7eREmGwaB6v3dauUdBmRCy74rVg
         uqjYewRfe/6Gg1DF4qqpH3cjb3p3QMpMgZEtMkEGQxvxHgDM8NzcLelILaSg+NAxJitD
         JsfxtuD/hreiPf0fn96PTFzV0kpbqEk9e/xz/evXzHjJiq4S87rqBTUMArzSh1EmTW8G
         1/29JD7LhFCTx6EdMfxsaBd1OSCpY1QNMm5VhxyQetbHlPlR0gm2SaF34N+/ORufHfm5
         Px9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=eNeXjhvCGZPX2nOcWVH9hj3paV16QHjNZaxjtD37JKc=;
        b=c2nE3Y/0EnCRa6k/ta7Cu4j6H+r87r5ZA9E3I4Ixytf5/gSSrXfmNJIYNBJCaP8GpO
         9eGEhVBrVt3RXsSfW0bU1UbYAaaZqtRDr9ceJm6W8Tl/MA4CVUyin0a/copEIQUf40cI
         v4tbODl91m2FiW9er/dJ7p1aqZRPzpinGvgYyKAu/NA4iSsYKRs+2VHJy6d1cscT8+NM
         y6ywBNBa4HOrgTKaHGKUqyyUJZX2BCPc17+jS6zV4noEwU7SHY3VT/IfrMz4w9dsdSey
         T7IJdz0JmwYN3LhI8yfQqM4qOYyqHTkTmUPk6OyYgnIhbAV12+x61T57eNNYXegw+OSn
         xTgA==
X-Gm-Message-State: AOAM532R7uHRRieL6ji/bnuqJ93e8RUlm54vy99s0H9tpj/VQXXZJ7Ej
	reKKX6ssMGijCg/x+5ZpP3lxEj3azaIIAA==
X-Google-Smtp-Source: ABdhPJyanF71gCbC8J2WEmeT+/Yhmt/G/LTPzMgphfSx8n8Wl1RiJa07g2Q3QxjqOURzIhVZPbh41Q==
X-Received: by 2002:a05:620a:129c:: with SMTP id w28mr1754188qki.359.1631737148148;
        Wed, 15 Sep 2021 13:19:08 -0700 (PDT)
Received: from debianG.lan ([181.166.206.110])
        by smtp.gmail.com with ESMTPSA id g8sm752834qkm.25.2021.09.15.13.19.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Sep 2021 13:19:07 -0700 (PDT)
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
Subject: [PATCH 5/7] staging: vchiq_arm: fix quoted strings split across lines
Date: Wed, 15 Sep 2021 17:18:22 -0300
Message-Id: <20210915201824.413202-5-gascoar@gmail.com>
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

Quoted strings should not be split across lines. As put it in
Documentation/process/coding-style.rst: "never break user-visible
strings such as printk messages because that breaks the ability to grep
for them."

Reported by checkpatch.pl

Signed-off-by: Gaston Gonzalez <gascoar@gmail.com>
---
 .../staging/vc04_services/interface/vchiq_arm/vchiq_arm.c    | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
index 778540faaa1c..3225f0738ef9 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
@@ -1613,9 +1613,8 @@ vchiq_dump_service_use_state(struct vchiq_state *state)
 	read_unlock_bh(&arm_state->susp_res_lock);
 
 	if (only_nonzero)
-		vchiq_log_warning(vchiq_susp_log_level, "Too many active "
-			"services (%d).  Only dumping up to first %d services "
-			"with non-zero use-count", active_services, found);
+		vchiq_log_warning(vchiq_susp_log_level, "Too many active services (%d). Only dumping up to first %d services with non-zero use-count",
+				  active_services, found);
 
 	for (i = 0; i < found; i++) {
 		vchiq_log_warning(vchiq_susp_log_level, "----- %c%c%c%c:%d service count %d %s",
-- 
2.33.0

