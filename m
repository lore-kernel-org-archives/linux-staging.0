Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A218F70
	for <linux-staging@lists.linux.dev>; Fri, 26 Mar 2021 09:09:53 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id y124-20020a1c32820000b029010c93864955so4490442wmy.5
        for <linux-staging@lists.linux.dev>; Fri, 26 Mar 2021 02:09:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=C2qjc4Ksn1CALD5m37+MaDZfcs0eyhY3C8ypdEUFsu4=;
        b=XQwFi5PVQfdPE4b05vezd572XYU3ehOGE42j2jMFp6BjWDibY+2dr4mvDug/0IcCck
         /SOomcs8ZU98RrUoGkZ0UqaBniqh46t7AxzCrR1hMpF6D+tR3+B2P6rRjyY3YD0ylhif
         lQlkipHnGWQG+D6mMAEU1E6oRh1CjDeGfp9kQuGL1gwzxQF9ule5rvG5JYCyjFLSnuGx
         DHZYkHmB6zYgU8Yueq7bcM18/zPiFkQ/7EZtBl5pY/vklCH+fHDXGK66dGebFjUNw/UP
         GYnHWhEPTz93xdNiHzG69wSCrHpL59kaRQNJ6BSIEoIqJ7USWM2G7B4z5Bap4NUa4c7z
         qb5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=C2qjc4Ksn1CALD5m37+MaDZfcs0eyhY3C8ypdEUFsu4=;
        b=OX65Jt1Qx2HIiX+PMsrDW22tCAl5xOLuIWehjF8JaGSMf8Uu1kHRN8HwPelV6+qkRn
         vh2KJKZ68u5PQ4q/4WeCpfFcjNQrTXRYGDvhRtQgCWV5uA/Fj+EBCl+pLcffQZ2OeBdh
         KVMKgSXkIhsgDpFDZkpRBZkk1ZRvZgkLqaLMsKQMdmJ1aiTLDHX0GhV2NmLDn0Bwyl9/
         gtSXIoW43DKGC08oHzCOLv8o5SLh+AxKeHS20ZHtcwxH4SXuksFo+EDaiaU0sr/u+VyT
         IgaP1/srsI7OvD/UG/EXo5AVKglId7Y7dMpUOtk3nGHKD2bjFC8efehn4TtgstSPaUl8
         bHgw==
X-Gm-Message-State: AOAM533habBw1gTJXeKeYaL47d2CxymPxpba8vScuLVOFzKE38afC6zh
	f7AqOULoNRjSN2ecW/CGW4k=
X-Google-Smtp-Source: ABdhPJwpBoSopg1c0xkKwFJd+fCkwYykVXkNLKoTo4lBYTy7uBxaTnaCyUmk4Owat0StRQkq6Kb1QA==
X-Received: by 2002:a05:600c:4f94:: with SMTP id n20mr11901852wmq.18.1616749792194;
        Fri, 26 Mar 2021 02:09:52 -0700 (PDT)
Received: from agape ([5.171.81.75])
        by smtp.gmail.com with ESMTPSA id s8sm11392541wrn.97.2021.03.26.02.09.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Mar 2021 02:09:51 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Fabio Aiuto <fabioaiuto83@gmail.com>
Subject: [PATCH 07/15] staging: rtl8723bs: put parentheses on macros with complex values in include/hal_com_reg.h
Date: Fri, 26 Mar 2021 10:09:14 +0100
Message-Id: <8b71e4bc52854aa5c3cd6888fa40c5dbd00fe5fb.1616748885.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1616748885.git.fabioaiuto83@gmail.com>
References: <cover.1616748885.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fix the following checkpatch warnings:

ERROR: Macros with complex values should be enclosed in parentheses
710: FILE: drivers/staging/rtl8723bs/include/hal_com_reg.h:710:
+#define	RATE_ALL_CCK
			RATR_1M | RATR_2M | RATR_55M | RATR_11M
--
ERROR: Macros with complex values should be enclosed in parentheses
711: FILE: drivers/staging/rtl8723bs/include/hal_com_reg.h:711:
+#define	RATE_ALL_OFDM_AG
		RATR_6M | RATR_9M | RATR_12M | RATR_18M | RATR_24M |\
--
ERROR: Macros with complex values should be enclosed in parentheses
713: FILE: drivers/staging/rtl8723bs/include/hal_com_reg.h:713:
+#define	RATE_ALL_OFDM_1SS
		RATR_MCS0 | RATR_MCS1 | RATR_MCS2 | RATR_MCS3 |\
--
ERROR: Macros with complex values should be enclosed in parentheses
715: FILE: drivers/staging/rtl8723bs/include/hal_com_reg.h:715:
+#define	RATE_ALL_OFDM_2SS
		RATR_MCS8 | RATR_MCS9 | RATR_MCS10 | RATR_MCS11 |\

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/include/hal_com_reg.h | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/hal_com_reg.h b/drivers/staging/rtl8723bs/include/hal_com_reg.h
index b555826760d0..b5610dedc23e 100644
--- a/drivers/staging/rtl8723bs/include/hal_com_reg.h
+++ b/drivers/staging/rtl8723bs/include/hal_com_reg.h
@@ -707,13 +707,13 @@ Default: 00b.
 
 
 /*  ALL CCK Rate */
-#define	RATE_ALL_CCK				RATR_1M | RATR_2M | RATR_55M | RATR_11M
-#define	RATE_ALL_OFDM_AG			RATR_6M | RATR_9M | RATR_12M | RATR_18M | RATR_24M |\
-						RATR_36M | RATR_48M | RATR_54M
-#define	RATE_ALL_OFDM_1SS			RATR_MCS0 | RATR_MCS1 | RATR_MCS2 | RATR_MCS3 |\
-						RATR_MCS4 | RATR_MCS5 | RATR_MCS6 | RATR_MCS7
-#define	RATE_ALL_OFDM_2SS			RATR_MCS8 | RATR_MCS9 | RATR_MCS10 | RATR_MCS11 |\
-						RATR_MCS12 | RATR_MCS13 | RATR_MCS14 | RATR_MCS15
+#define	RATE_ALL_CCK				(RATR_1M | RATR_2M | RATR_55M | RATR_11M)
+#define	RATE_ALL_OFDM_AG			(RATR_6M | RATR_9M | RATR_12M | RATR_18M | RATR_24M |\
+						RATR_36M | RATR_48M | RATR_54M)
+#define	RATE_ALL_OFDM_1SS			(RATR_MCS0 | RATR_MCS1 | RATR_MCS2 | RATR_MCS3 |\
+						RATR_MCS4 | RATR_MCS5 | RATR_MCS6 | RATR_MCS7)
+#define	RATE_ALL_OFDM_2SS			(RATR_MCS8 | RATR_MCS9 | RATR_MCS10 | RATR_MCS11 |\
+						RATR_MCS12 | RATR_MCS13 | RATR_MCS14 | RATR_MCS15)
 
 #define RATE_BITMAP_ALL			0xFFFFF
 
-- 
2.20.1

