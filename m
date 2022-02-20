Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3B3F5CD8
	for <linux-staging@lists.linux.dev>; Sun, 20 Feb 2022 15:49:05 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id bg10so26968267ejb.4
        for <linux-staging@lists.linux.dev>; Sun, 20 Feb 2022 07:49:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PXWkUCOam5DNv4E6wTMBoogFAVwI0cIVhZM2na4fJgA=;
        b=mtImQpHEx86uqnWxdQ0PqfY0vygneLhldx924GSLvq36VlEkuiZ81yXhLqW0/ofFRi
         /0tamkzK9cv26VUmezQ3LlX16A6KXhnn8TPnCY/Ms9fkGI+R7WfEDYJpiiSg3ZquIqj4
         REVrBgPuUTr0OBaQhgkIJNUV1nssa37fj1vtevnqywCUo9REq78tE84jd/SakHVpPvlr
         KtrMtMlt12FRinzcRO9qx0rPiTsCeQTVf6A2UaxwE0Ci4iAD2tnKG7ZqlfgaDZQ3Ho98
         O1SpTCsETD7DbFVdFNBSwqx82brANRDnBYilThNv7FefucN+lRDGuON/31gh5L+gLfJa
         kZbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PXWkUCOam5DNv4E6wTMBoogFAVwI0cIVhZM2na4fJgA=;
        b=PgkHOXDVRr1nieS4FTBQSekyXB9e4R4pQ6xEVQbf+Pml8e+0CxE64Ne1440rlwTRAU
         l9GeYtUDRO8/dk4fVom5r+XsSUOnuGf9ly4UruCxhLHBg50UX71JE4R5FIha1YW2Qvld
         tQaeOrNK09ImLR24PgAAhiG7iQ6Y1TJBq0U6eRvYhG69zgyWz/BaXv94Xy2KeN65CWLm
         9ZbrSTK3lLRAPV17+P994LBn1BFLQX6JQgIBXw/zslqd9wiNZRsuEH6wGXpBhgx31beI
         rC/ErE0unsD345MZRu4IG51hYzCfrtlIPT4WisxkHMupXE84Vjtu5MJGd0UhSwZkoa6w
         mNww==
X-Gm-Message-State: AOAM533rKRMZk/wgFfm3g6XoyAqHolSc9FYckAIsYeceolxulfXPsVVP
	CHw0FZ85qoDJdTjnWNsy+zA=
X-Google-Smtp-Source: ABdhPJw4p4xCogA3E/+PYwGpEybaM8V8Sf/TLR1wh8jgUnG3vMiuCdy6l9yXLJNzA6Hg7MGTkNA89Q==
X-Received: by 2002:a17:906:d41:b0:6ce:78b0:8113 with SMTP id r1-20020a1709060d4100b006ce78b08113mr13281771ejh.357.1645372144149;
        Sun, 20 Feb 2022 07:49:04 -0800 (PST)
Received: from localhost.localdomain (ip5f5abb8f.dynamic.kabel-deutschland.de. [95.90.187.143])
        by smtp.gmail.com with ESMTPSA id ew6sm4178979ejc.217.2022.02.20.07.49.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Feb 2022 07:49:03 -0800 (PST)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 1/3] staging: r8188eu: remove 5 GHz channels from ch_freq_map
Date: Sun, 20 Feb 2022 16:48:45 +0100
Message-Id: <20220220154847.7521-2-straube.linux@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220220154847.7521-1-straube.linux@gmail.com>
References: <20220220154847.7521-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This driver is for chips that operate only in the 2.4 GHz band.
Frequencies for 5 GHz channels can be removed from the ch_freq_map
array.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_rf.c | 16 ----------------
 1 file changed, 16 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_rf.c b/drivers/staging/r8188eu/core/rtw_rf.c
index e704092d31d0..51425971782b 100644
--- a/drivers/staging/r8188eu/core/rtw_rf.c
+++ b/drivers/staging/r8188eu/core/rtw_rf.c
@@ -17,22 +17,6 @@ static struct ch_freq ch_freq_map[] = {
 	{1, 2412}, {2, 2417}, {3, 2422}, {4, 2427}, {5, 2432},
 	{6, 2437}, {7, 2442}, {8, 2447}, {9, 2452}, {10, 2457},
 	{11, 2462}, {12, 2467}, {13, 2472}, {14, 2484},
-	/*  UNII */
-	{36, 5180}, {40, 5200}, {44, 5220}, {48, 5240}, {52, 5260},
-	{56, 5280}, {60, 5300}, {64, 5320}, {149, 5745}, {153, 5765},
-	{157, 5785}, {161, 5805}, {165, 5825}, {167, 5835}, {169, 5845},
-	{171, 5855}, {173, 5865},
-	/* HiperLAN2 */
-	{100, 5500}, {104, 5520}, {108, 5540}, {112, 5560}, {116, 5580},
-	{120, 5600}, {124, 5620}, {128, 5640}, {132, 5660}, {136, 5680},
-	{140, 5700},
-	/* Japan MMAC */
-	{34, 5170}, {38, 5190}, {42, 5210}, {46, 5230},
-	/*  Japan */
-	{184, 4920}, {188, 4940}, {192, 4960}, {196, 4980},
-	{208, 5040},/* Japan, means J08 */
-	{212, 5060},/* Japan, means J12 */
-	{216, 5080},/* Japan, means J16 */
 };
 
 static int ch_freq_map_num = ARRAY_SIZE(ch_freq_map);
-- 
2.35.1

