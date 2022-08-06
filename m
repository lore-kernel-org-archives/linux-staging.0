Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48CE910F8
	for <linux-staging@lists.linux.dev>; Sat,  6 Aug 2022 06:09:49 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id z20so3780304edb.9
        for <linux-staging@lists.linux.dev>; Fri, 05 Aug 2022 23:09:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5I+v5QzSk+bZ7pDEdk0V2aAobL+DUNvbn5oomeG6tvY=;
        b=HeQCo2ZfyOw4W49h46NkhEu6w+zLcUJVhq/30mHdViNiPMyxecNFQaRnNTeFn8H5zz
         ghd8/ZUrSpmwkW7DlPlRp6bXNrJFJNp0udcmU/MernpCLbyMUNCznjdME/WoGKW3lWLA
         9lrZJwnaGRnC420kqt9fyWMeRqBhIkgsF1fkoiNkh+7xJWXSWJv2pWAhnJcZ2255eUK0
         ra/c8jB0vht7yqYEubTjwyzQtMEQDI/GSfol8XKg/t4ka42dTAZVT2Uah8l0DD9J2g3a
         KleAZf5kZ1TYnPqjZ7g5lj7+eaRiIfUXa+nHqTh6l8ck4kdk2XQHPAC8HATAh7ZLNxvi
         Bncg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5I+v5QzSk+bZ7pDEdk0V2aAobL+DUNvbn5oomeG6tvY=;
        b=BsXYAyZ0jtKXXXo9oyzovN2aJPUrnpcUxXa0JBWFqMOUEXqVY8gwD2IeCXAQBASDmv
         ySx3YdQAB6rI38uPhoHkUki3EhwYfDgrmlJRJYNMuxJglvIU8bV7CHZAsWhgmE4bcMSu
         s+CTRewPr0136tf9ulv/se4bfbd7GolL+PvczzpVNfXY9Bov6odq9aotLRaFy7wPay/w
         9LpUvA6h6qHskCz7SntYLKH56bOmkajIZMBQE4XXYwwY8M1OtBM7kJqrKc6X0YNXagTW
         v9/n52COSH2XvWFAGfjx/ZS7gJ+/xZG/FvkQAdI9tUjSfkEg/hZ+WTOY4hb4N8UV5Rdf
         UHBg==
X-Gm-Message-State: ACgBeo0QLeVLCURRNAtmtIjc8Mumqfp3Myst2kIS/bkucQlAOeWHQvzB
	g9sjvdd9OLFIajMYZwugp88=
X-Google-Smtp-Source: AA6agR4X086kYSluvhH2r9JDQeydIYZWbBtoDvzYITewnsvHTsK+lv4A0M56P6j4odwzeMx6og0f/Q==
X-Received: by 2002:aa7:d712:0:b0:43d:3651:7217 with SMTP id t18-20020aa7d712000000b0043d36517217mr9328225edq.79.1659766187590;
        Fri, 05 Aug 2022 23:09:47 -0700 (PDT)
Received: from localhost.localdomain (ip5f5abba5.dynamic.kabel-deutschland.de. [95.90.187.165])
        by smtp.gmail.com with ESMTPSA id p10-20020a05640243ca00b0043a7293a03dsm1002357edc.7.2022.08.05.23.09.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Aug 2022 23:09:47 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 3/3] staging: r8188eu: clean up comment for phy_calculate_bit_shift()
Date: Sat,  6 Aug 2022 08:09:29 +0200
Message-Id: <20220806060929.11022-4-straube.linux@gmail.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220806060929.11022-1-straube.linux@gmail.com>
References: <20220806060929.11022-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Clean up the comment for function phy_calculate_bit_shift().

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/hal/rtl8188e_phycfg.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/rtl8188e_phycfg.c b/drivers/staging/r8188eu/hal/rtl8188e_phycfg.c
index e9e24efabd76..a435ec65d4b1 100644
--- a/drivers/staging/r8188eu/hal/rtl8188e_phycfg.c
+++ b/drivers/staging/r8188eu/hal/rtl8188e_phycfg.c
@@ -12,17 +12,7 @@
 /*  1. BB register R/W API */
 /*  */
 
-/**
-* Function:	phy_CalculateBitShift
-*
-* OverView:	Get shifted position of the BitMask
-*
-* Input:
-*			u32		BitMask,
-*
-* Output:	none
-* Return:		u32		Return the shift bit bit position of the mask
-*/
+/* Get shifted position of the bit mask */
 static u32 phy_calculate_bit_shift(u32 bitmask)
 {
 	u32 i = ffs(bitmask);
-- 
2.37.1

