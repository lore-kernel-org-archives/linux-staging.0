Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 483ADBA29
	for <linux-staging@lists.linux.dev>; Thu, 23 Mar 2023 16:59:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1679590780;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=+upkbu9j0REGb3XQPl52CEvrtu/lB3040Vqf6c3jPBI=;
	b=US3CWVKbR+Byn116xU3qt1rQF1f4lne9p0BU6RdneXa7pw3HfeJ9D9Qq/iBs7WfAyh4P6n
	YJbOxVVM/FQwchwlKic++n8rK1v0mDt+PO+YNYzvSKzbw6qksF8QfP2j4ZyL4URN4mzErQ
	nLkAHskI6ky7r3t93TOL1IL63vyBj+w=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-433-8OPMao_xO9239F_4l7sT3A-1; Thu, 23 Mar 2023 12:59:39 -0400
X-MC-Unique: 8OPMao_xO9239F_4l7sT3A-1
Received: by mail-qt1-f197.google.com with SMTP id r4-20020ac867c4000000b003bfefb6dd58so13314747qtp.2
        for <linux-staging@lists.linux.dev>; Thu, 23 Mar 2023 09:59:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679590778;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+upkbu9j0REGb3XQPl52CEvrtu/lB3040Vqf6c3jPBI=;
        b=h4oNMapPmOHVy0m4CYfaBMB1I0ie77FYutRyWou/W4uEQXwsEy5YqkawDKw/HUEB0y
         7oPV5ElVVAFtnyLN/cg50Yr5XZLNmtKk7BbuKyE5ALdoxZYN0bBbnYgou++k67XiiFc/
         MSAD2Ckt8DR3p37G9iQtvKNtBRhhnoluqLMwaYPZEWvPr8rSfyV0RVOtbDue2pzS2Aiw
         GSsqiG7xLwdjxXFgYzsMzhhc+oWTqVsgJ1IYxcA/n947uVcGHGKKEY1PEF09JK77HFdE
         LIXZkNPSi0sq35O26tXUjkZJ3KvTmow/xD6qBim7OGaw+gRwKpQTfxmejwUwE/vkWZhW
         9XWg==
X-Gm-Message-State: AO0yUKUfvGxsQtZ2KbnsS1cC+URtL/78+f/A1pOcQawLvdG0e7KoeW4O
	wgzvRiqIZgjzfrmFhriVuBMnPJqLWJlTuJKSS+waXY7rnRGzHIx/9vtvBoPVJJ+xBSg7mEYGKCS
	Rsnc6N+5oai90jFG9LwDOjqKNAA==
X-Received: by 2002:ac8:5fcf:0:b0:3d8:519a:91c9 with SMTP id k15-20020ac85fcf000000b003d8519a91c9mr11318278qta.8.1679590777755;
        Thu, 23 Mar 2023 09:59:37 -0700 (PDT)
X-Google-Smtp-Source: AK7set8bCx/r2ljWME1lt8mzPqwTkV08BThI3LuMi5lnq3IRAqduegWWqYlgrB2h30Ce/+PHxdWpgQ==
X-Received: by 2002:ac8:5fcf:0:b0:3d8:519a:91c9 with SMTP id k15-20020ac85fcf000000b003d8519a91c9mr11318256qta.8.1679590777497;
        Thu, 23 Mar 2023 09:59:37 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com (nat-pool-bos-t.redhat.com. [66.187.233.206])
        by smtp.gmail.com with ESMTPSA id i4-20020a378604000000b0073b3316bbd0sm13538309qkd.29.2023.03.23.09.59.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Mar 2023 09:59:37 -0700 (PDT)
From: Tom Rix <trix@redhat.com>
To: gregkh@linuxfoundation.org,
	nathan@kernel.org,
	ndesaulniers@google.com,
	error27@gmail.com,
	colin.i.king@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Tom Rix <trix@redhat.com>
Subject: [PATCH] staging: rtl8192u: remove unused ieee80211_SignalStrengthTranslate function
Date: Thu, 23 Mar 2023 12:59:31 -0400
Message-Id: <20230323165931.2634587-1-trix@redhat.com>
X-Mailer: git-send-email 2.27.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

clang with W=1 reports
drivers/staging/rtl8192u/ieee80211/ieee80211_rx.c:1961:18: error: unused
  function 'ieee80211_SignalStrengthTranslate' [-Werror,-Wunused-function]
static inline u8 ieee80211_SignalStrengthTranslate(
                 ^
This function is not used so remove it.
It may have been used in the past but that has been commented out.
Also remove the comment.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 .../staging/rtl8192u/ieee80211/ieee80211_rx.c | 38 -------------------
 1 file changed, 38 deletions(-)

diff --git a/drivers/staging/rtl8192u/ieee80211/ieee80211_rx.c b/drivers/staging/rtl8192u/ieee80211/ieee80211_rx.c
index 5c73e3f8541a..ca09367005e1 100644
--- a/drivers/staging/rtl8192u/ieee80211/ieee80211_rx.c
+++ b/drivers/staging/rtl8192u/ieee80211/ieee80211_rx.c
@@ -1958,43 +1958,6 @@ int ieee80211_parse_info_param(struct ieee80211_device *ieee,
 	return 0;
 }
 
-static inline u8 ieee80211_SignalStrengthTranslate(
-	u8  CurrSS
-	)
-{
-	u8 RetSS;
-
-	// Step 1. Scale mapping.
-	if (CurrSS >= 71 && CurrSS <= 100) {
-		RetSS = 90 + ((CurrSS - 70) / 3);
-	} else if (CurrSS >= 41 && CurrSS <= 70) {
-		RetSS = 78 + ((CurrSS - 40) / 3);
-	} else if (CurrSS >= 31 && CurrSS <= 40) {
-		RetSS = 66 + (CurrSS - 30);
-	} else if (CurrSS >= 21 && CurrSS <= 30) {
-		RetSS = 54 + (CurrSS - 20);
-	} else if (CurrSS >= 5 && CurrSS <= 20) {
-		RetSS = 42 + (((CurrSS - 5) * 2) / 3);
-	} else if (CurrSS == 4) {
-		RetSS = 36;
-	} else if (CurrSS == 3) {
-		RetSS = 27;
-	} else if (CurrSS == 2) {
-		RetSS = 18;
-	} else if (CurrSS == 1) {
-		RetSS = 9;
-	} else {
-		RetSS = CurrSS;
-	}
-	//RT_TRACE(COMP_DBG, DBG_LOUD, ("##### After Mapping:  LastSS: %d, CurrSS: %d, RetSS: %d\n", LastSS, CurrSS, RetSS));
-
-	// Step 2. Smoothing.
-
-	//RT_TRACE(COMP_DBG, DBG_LOUD, ("$$$$$ After Smoothing:  LastSS: %d, CurrSS: %d, RetSS: %d\n", LastSS, CurrSS, RetSS));
-
-	return RetSS;
-}
-
 /* 0-100 index */
 static long ieee80211_translate_todbm(u8 signal_strength_index)
 {
@@ -2095,7 +2058,6 @@ static inline int ieee80211_network_init(
 		network->flags |= NETWORK_EMPTY_ESSID;
 
 	stats->signal = 30 + (stats->SignalStrength * 70) / 100;
-	//stats->signal = ieee80211_SignalStrengthTranslate(stats->signal);
 	stats->noise = ieee80211_translate_todbm((u8)(100 - stats->signal)) - 25;
 
 	memcpy(&network->stats, stats, sizeof(network->stats));
-- 
2.27.0

