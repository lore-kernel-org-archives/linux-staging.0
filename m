Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F8F16351
	for <linux-staging@lists.linux.dev>; Tue, 22 Feb 2022 08:28:59 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id vz16so40574848ejb.0
        for <linux-staging@lists.linux.dev>; Tue, 22 Feb 2022 00:28:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=H8Qt+r4eM4DrLuqCbIAtNlNxohCAgIis75bTjKzOeZE=;
        b=krOwPs+UMEImQthUATA625wTEwjSUvuTI8wkMRUv1ltR7DdaxHuV1NViX3I9pN+KQA
         Ysg875Yb2RsOe02fGGFcKdo+Mu4OfkuZWlz+ajY2TYsW6sYyyv0Gm4OUvGhTkK0LKgEU
         IFoLvvqeFfIa0cjeqDyTg5jsfpd/JY6Dqiszn/X/oT75p2T7LGu4+LXLWVLRIK1JbIVw
         MftvvXggpw6yYWL7LEcPe2yHfhd91Ud3zjZ8vHaGvB4N5RJMJcVnOeMVM8GOfdxooabB
         eVGGtr+iaTEq8Jk4YXVmgqvojSOuiESRn1b2Mr4lApexQeSAqV9/Sj7Sm7WIRyBIR5I6
         xUlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=H8Qt+r4eM4DrLuqCbIAtNlNxohCAgIis75bTjKzOeZE=;
        b=ZXDy2bO0UEK/jxKeHn4fb6NHYV1G8NE1R2NAXHiVV5yF96NbCqJXuix6oh2/1Awksp
         el4pk5vFLxS2OHl82VSvphAv3yrgDdKYIayA5eF1ue3czUIKhUjR2w5SKH5AvlS5ky0A
         C85PbnIudA/2HIsJTnRyowPovqlU6SD7C9UuDSEoc1191e7F8DfFXQuikICSiFO2M3Ya
         D0MSgmAadYxUOvqtMwt1q5ALscPB9Pwo+kbur3nGqAkbfdGuK8QX+BArXADjxg7QopLo
         WDr99YLk/WSBmcKMEfO2XISUmS3bsq4SCe7e5iwdpJF30Fa2qNYeSlIrIngaOMf8S4b3
         /gJQ==
X-Gm-Message-State: AOAM530NWeXsbc2OVcTDJxF3RaOPCeIYMaWWcDsJl1qLzHxATAIvH8jZ
	rF+IwnNLbxQBqUFM3Gu2sQ0GqmcCaBk=
X-Google-Smtp-Source: ABdhPJxEojS2irNC3wsBpceWlVvsHXXxGyj4u0/tHBWP6VE9P+OI1+P9j1Be/tZvOLP6UwpZ+Un6xA==
X-Received: by 2002:a17:907:b96:b0:6d0:ae6:d153 with SMTP id ey22-20020a1709070b9600b006d00ae6d153mr17770616ejc.699.1645518537636;
        Tue, 22 Feb 2022 00:28:57 -0800 (PST)
Received: from localhost.localdomain (ip5f5abb8f.dynamic.kabel-deutschland.de. [95.90.187.143])
        by smtp.gmail.com with ESMTPSA id v12sm9831926edr.8.2022.02.22.00.28.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Feb 2022 00:28:57 -0800 (PST)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH v2 1/3] staging: r8188eu: remove 5 GHz channels from ch_freq_map
Date: Tue, 22 Feb 2022 09:28:45 +0100
Message-Id: <20220222082847.6687-2-straube.linux@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220222082847.6687-1-straube.linux@gmail.com>
References: <20220222082847.6687-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

According to the Realtek documentation the chips this driver supports
are 2.4 GHz only chips. Frequencies for 5 GHz channels can be removed
from the ch_freq_map array.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
v2:
Changed the commit message.

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

