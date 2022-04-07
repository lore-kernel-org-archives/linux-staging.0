Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDEB72564
	for <linux-staging@lists.linux.dev>; Thu,  7 Apr 2022 12:57:50 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id b15so6316832edn.4
        for <linux-staging@lists.linux.dev>; Thu, 07 Apr 2022 05:57:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=I2kKuQm9mBVMxGG2tuqK5kvCq3TE0hPoH+duL8WuPFE=;
        b=fREgNyiTU+JgehQuQun/naOApONGw77/dtDLqvcR2nsBwPsXkPL44tiLSGRkpl+g8U
         nVQTq7mUgmzMGC/FV0TUy5+XsuUIic2y79YJ3KLnA3Em+Ry3mvg/3dnASZsGwi+l0Qu4
         qSLof8irjPFEG26f7yW11EVSQbayAVC2oEn2O/FClJkObCqo0Wi0RijRzPW7+XMuflRV
         1fW49RE7eO3DPVOZjhFo7LrpiegCKlzb79Z70GdlOJLdHXN1U9vfedInRfsvZr0lRCeG
         rgFjDQzge0XSGnifixG7ZxtlqFxKrUHEcr1kQoC1A2gQFYIU18lK2k7UDpqPsOSfS08v
         N66w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=I2kKuQm9mBVMxGG2tuqK5kvCq3TE0hPoH+duL8WuPFE=;
        b=c077Eb8dUn9E0pIUcuf/tBLKZN/DJe7NGu8qUkY8CveetKU+qUihBC0/4Je4FlfAln
         waW63xvD8ICWDwt0KIBcFjMHJsxapuNdawWTV35ZH8PxLA+FaUi6XgSJYmLQi1d3a8Rp
         3lRrEBGHPuS9j9y6Qw6ZlkG5ut1VT1z9LNUgtdBtYYUjzJhRWqcNVRibjQVyOVWFSTDM
         nGhReIt1moXOYOc8Lp1GllTxjqbNvq/948dC2HH+G7vcqoP//0RolxUU5pw2PuVU+xyD
         Sru4eSDXwMB7owfj6ycJqTqjqrzaqzsR6ylsy+HmdDHqnm0fFWcKLTEhIbwJjqHrUiL7
         7drA==
X-Gm-Message-State: AOAM5324miX6z0WxAqaFrJDdpMGGkbxbmMqNdW2PQKIEEyymb8g3rlsb
	D1Z7ea8esjmwoo0srx7kRtI=
X-Google-Smtp-Source: ABdhPJzipgYuM30uDF84FFOslfVMcPdQ8T/8aZ0+xYG7Wk5AyEfieXrgPeFqOSRCjuOFlA74RwPVJA==
X-Received: by 2002:a05:6402:4247:b0:419:3990:3db6 with SMTP id g7-20020a056402424700b0041939903db6mr13837423edb.193.1649336269266;
        Thu, 07 Apr 2022 05:57:49 -0700 (PDT)
Received: from localhost.localdomain (ip5f5abb55.dynamic.kabel-deutschland.de. [95.90.187.85])
        by smtp.gmail.com with ESMTPSA id n13-20020a170906724d00b006cedd6d7e24sm7676764ejk.119.2022.04.07.05.57.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Apr 2022 05:57:48 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH v3 2/5] staging: r8188eu: use round_up() instead of _RND4()
Date: Thu,  7 Apr 2022 14:57:39 +0200
Message-Id: <20220407125742.7814-3-straube.linux@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220407125742.7814-1-straube.linux@gmail.com>
References: <20220407125742.7814-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use in-kernel round_up() instead of custom _RND4().

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
v3: no changes
v2: no changes

 drivers/staging/r8188eu/core/rtw_cmd.c          | 2 +-
 drivers/staging/r8188eu/include/osdep_service.h | 8 --------
 2 files changed, 1 insertion(+), 9 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_cmd.c b/drivers/staging/r8188eu/core/rtw_cmd.c
index 9b53b92c6795..ed092faafb0f 100644
--- a/drivers/staging/r8188eu/core/rtw_cmd.c
+++ b/drivers/staging/r8188eu/core/rtw_cmd.c
@@ -264,7 +264,7 @@ int rtw_cmd_thread(void *context)
 			goto post_process;
 		}
 
-		pcmd->cmdsz = _RND4((pcmd->cmdsz));/* _RND4 */
+		pcmd->cmdsz = round_up(pcmd->cmdsz, 4);
 
 		memcpy(pcmdbuf, pcmd->parmbuf, pcmd->cmdsz);
 
diff --git a/drivers/staging/r8188eu/include/osdep_service.h b/drivers/staging/r8188eu/include/osdep_service.h
index 56e5cbfec1f1..388c22751d09 100644
--- a/drivers/staging/r8188eu/include/osdep_service.h
+++ b/drivers/staging/r8188eu/include/osdep_service.h
@@ -96,14 +96,6 @@ static inline void flush_signals_thread(void)
 
 #define _RND(sz, r) ((((sz)+((r)-1))/(r))*(r))
 
-static inline u32 _RND4(u32 sz)
-{
-	u32	val;
-
-	val = ((sz >> 2) + ((sz & 3) ? 1: 0)) << 2;
-	return val;
-}
-
 static inline u32 _RND8(u32 sz)
 {
 	u32	val;
-- 
2.35.1

