Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1210653AD;
	Mon, 21 Aug 2023 12:44:00 +0000 (UTC)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-68a3de5f231so621487b3a.0;
        Mon, 21 Aug 2023 05:44:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692621840; x=1693226640;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mDOcyp7eDilYpxFe5Q1bO3kEe7vayX0PPFX25s4ksUM=;
        b=GTvWXJ+L/cYlHcXSI3x/PA3hA3cF3ft0F7in0VsVJqSvoWrANU7LoIJhLlb4sjMPn1
         UFK5rO1Fg2XEeTc4Ey464JHDyfKHrziA1VicQtCuVclZsO9AhsophDjXKAGd0pdI9EJW
         hwqs81Cn2uJpXYctzBZ6aJ8FyetvQRAeTm/zX8kb2UaBFx9MBNFOK4T4WgmQbaa1aVoN
         Y7ehGtjR76HZumfAeB9xR/8MNLmxzC66BMWKoDcqKfYkV6peQq4BDiISAXjLAsKDmnKm
         R53Zkhv75jJljGHKwT0zMeelQAerfCBJ+ptPjixklKn4UijQBOesILG9/L9WrKjvyc/B
         wf8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692621840; x=1693226640;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mDOcyp7eDilYpxFe5Q1bO3kEe7vayX0PPFX25s4ksUM=;
        b=NOZ44vCw+W5n1OTMRII7Y4A1dre2to0Xy5Etp20ZW+xZc2d4hqG7AVkn4thVReavtm
         852pZ+mmczcEVkidWO6uPY7OugmXet7mW7bb+BFOINbVmEbD81w/YoZO1ttZEuVmlJWL
         R9Pd/6hzWG60Vy8WJJyvSONgr2rNKVOCM9zwcRWuLIaHyIS+N6SCxQXKnsmEwhTglcGw
         +CjoIbtb+TLUJ2qtbARLbFswfFIrXo3HGt3iuTGzJbsHV5CUzYFpkYhfgFGjEyAyYBw2
         vzEbNWk2QOhiKXRveU2A9iz2UUguCYgc0ITkJGtU57UsrzV1lILMSC05n/Vk0r5UKdoC
         ++5Q==
X-Gm-Message-State: AOJu0Yx61jIZyu3ovFt1IHFw/jBJSXctYpS0AbkmN/NB6mDY2Plopnn+
	n3joBqoWylZsR9lV/M/Gw2I=
X-Google-Smtp-Source: AGHT+IGTsRcU2Kc+glTJ9NmWfOcf+p4pz82g7fyC6W2t/qHl8rmdDa+/doODgp8x1oiGLeWgPTjEGg==
X-Received: by 2002:a05:6a21:9999:b0:13c:988c:e885 with SMTP id ve25-20020a056a21999900b0013c988ce885mr5425645pzb.56.1692621840090;
        Mon, 21 Aug 2023 05:44:00 -0700 (PDT)
Received: from ubuntu.myguest.virtualbox.org ([122.162.51.13])
        by smtp.gmail.com with ESMTPSA id m4-20020a170902768400b001b04c2023e3sm6939514pll.218.2023.08.21.05.43.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Aug 2023 05:43:59 -0700 (PDT)
Date: Mon, 21 Aug 2023 18:13:54 +0530
From: Pavan Bobba <opensource206@gmail.com>
To: Forest Bond <forest@alittletooquiet.net>,
	Michael Straube <straube.linux@gmail.com>,
	Philipp Hortmann <philipp.g.hortmann@gmail.com>,
	outreachy@lists.linux.dev
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v3] staging: vt6655: replace camel case by snake case
Message-ID: <ZONcClwtt40vTHla@ubuntu.myguest.virtualbox.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Replace array name of camel case by snake case. Issue found
by checkpatch

Signed-off-by: Pavan Bobba <opensource206@gmail.com>
---
 v1 -> v2: 1. array name renamed from byVT3253B0_RFMD to by_vt3253b0_rfmd
           2. typo in the subject line "small case" corrected with the
              proper word "snake case"
 v2 -> v3: word "by_" dropped from array name "by_vt3253b0_rfmd"
           and became ""vt3253b0_rfmd

Signed-off-by: Pavan Bobba <opensource206@gmail.com>
---
 drivers/staging/vt6655/baseband.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/vt6655/baseband.c b/drivers/staging/vt6655/baseband.c
index 0e135af8316b..696d4dd03aa2 100644
--- a/drivers/staging/vt6655/baseband.c
+++ b/drivers/staging/vt6655/baseband.c
@@ -499,7 +499,7 @@ static const unsigned char by_vt3253_init_tab_rfmd[CB_VT3253_INIT_FOR_RFMD][2] =
 };
 
 #define CB_VT3253B0_INIT_FOR_RFMD 256
-static const unsigned char byVT3253B0_RFMD[CB_VT3253B0_INIT_FOR_RFMD][2] = {
+static const unsigned char vt3253b0_rfmd[CB_VT3253B0_INIT_FOR_RFMD][2] = {
 	{0x00, 0x31},
 	{0x01, 0x00},
 	{0x02, 0x00},
@@ -2005,8 +2005,8 @@ bool bb_vt3253_init(struct vnt_private *priv)
 		} else {
 			for (ii = 0; ii < CB_VT3253B0_INIT_FOR_RFMD; ii++)
 				result &= bb_write_embedded(priv,
-					byVT3253B0_RFMD[ii][0],
-					byVT3253B0_RFMD[ii][1]);
+					vt3253b0_rfmd[ii][0],
+					vt3253b0_rfmd[ii][1]);
 
 			for (ii = 0; ii < CB_VT3253B0_AGC_FOR_RFMD2959; ii++)
 				result &= bb_write_embedded(priv,
-- 
2.34.1

