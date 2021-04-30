Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA73F2F9C
	for <linux-staging@lists.linux.dev>; Fri, 30 Apr 2021 14:44:54 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id r9so105626476ejj.3
        for <linux-staging@lists.linux.dev>; Fri, 30 Apr 2021 07:44:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HuRDse6cwaQ2xwrTLwG7a4zXuTLnjB8VHStZClnoZTQ=;
        b=mME+Xrfui3GZIh+bM0vb/+gQZyqNAGHU1/KFcSjUW9jeHITPh7SNJYAmq+SU8zuhns
         S4FZz/u2Hue1VNp2eGLbVM8zBvyG0V/hQpXHNLsMMSN1DU4gkAmmAWHfRgBDK2zfXoOv
         PjoM7DFtRy1ri4DnDry8EKwx7/CeFzoLa10Nz36XghtnCU5oFiC/h61v+61gAgjN18JB
         iucU8hFQz3zSzPHgqkwlED6H+D812QnnNlakKF77YU+k5HRB50aDk+qSUHsmK+mUjgp1
         RWJiItUJPLZlMt1gILTccLB1wJ/ukIOtfoczVvWYMzPRtatjF5h10hn6GLUFGEK0HSz1
         EA0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HuRDse6cwaQ2xwrTLwG7a4zXuTLnjB8VHStZClnoZTQ=;
        b=jq4KVau21FRNLyNvj4fF4NWCJ5fYG1xoj28+4qcmSTPoa6Ph465+GlybXy18Z4swN1
         X/HVi1q1jN69XyAhUvZY0cVatUbneWdUcQqcQ943MgIwbQcPY8v/FSNscBEAICqNH1Sf
         r9F6unig47UYCu27JdUNaQqzW/YbJ0s7bK9raYEVUxpk/xNc9tQoQAcpY7bwSrP0GCYt
         nhi0OYUZeuTtuWr+XBVr69k7LdOx3Dy158+ndGEWJqVlTp/OW8mu0CQMGsQFCz8ihCx6
         5r/B29OrR6UJZ9G1upbhOm2Z3exGMuwMQQx0VypATzz8r35088GYaX7gGHvPUQJy01iX
         E6jQ==
X-Gm-Message-State: AOAM530+akE78C/+Zwor0qL8lsowzt3hfzB8PQ5YZUcz3x6i1tqKRNQg
	2483WwsOyRv3Su2p4iXOGhE=
X-Google-Smtp-Source: ABdhPJxtRgU958n754ZFyahbXZclA/OXXAeKpvUhpXdYZvDbio/nawziJu0B8pjmgf9h/r+fnCVrSQ==
X-Received: by 2002:a17:906:14c1:: with SMTP id y1mr4877721ejc.481.1619793893594;
        Fri, 30 Apr 2021 07:44:53 -0700 (PDT)
Received: from agape ([109.52.244.36])
        by smtp.gmail.com with ESMTPSA id c25sm1449679edt.43.2021.04.30.07.44.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Apr 2021 07:44:53 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 26/43] staging: rtl8723bs: remove BTC_PRINT_DATA definitions
Date: Fri, 30 Apr 2021 16:43:56 +0200
Message-Id: <c1c611cc22fdc4bd1de6c8749a91ad77d125519e.1619793406.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1619793405.git.fabioaiuto83@gmail.com>
References: <cover.1619793405.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove unused BTC_PRINT_DATA definitions.

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/hal/HalBtcOutSrc.h | 17 -----------------
 1 file changed, 17 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/HalBtcOutSrc.h b/drivers/staging/rtl8723bs/hal/HalBtcOutSrc.h
index 00705305305b..36636ad62aac 100644
--- a/drivers/staging/rtl8723bs/hal/HalBtcOutSrc.h
+++ b/drivers/staging/rtl8723bs/hal/HalBtcOutSrc.h
@@ -114,25 +114,8 @@ extern u32 		GLBtcDbgType[];
 
 /*  The following is for dbgview print */
 #if DBG
-#define BTC_PRINT_DATA(dbgtype, dbgflag, _TitleString, _HexData, _HexDataLen)\
-{\
-	if (GLBtcDbgType[dbgtype] & dbgflag) {\
-		int __i;\
-		u8 *ptr = (u8 *)_HexData;\
-		DbgPrint(_TitleString);\
-		for (__i = 0; __i < (int)_HexDataLen; __i++) {\
-			DbgPrint("%02X%s", ptr[__i], (((__i + 1) % 4) == 0) ? "  " : " ");\
-			if (((__i + 1) % 16) == 0)\
-				DbgPrint("\n");\
-		} \
-		DbgPrint("\n");\
-	} \
-}
-
 #else
 #define BTC_PRINT_F(dbgtype, dbgflag, printstr)		 no_printk printstr
-#define BTC_PRINT_DATA(dbgtype, dbgflag, _TitleString, _HexData, _HexDataLen) \
-			no_printk("%s %p %zu", _TitleString, _HexData, _HexDataLen)
 #endif
 
 struct btc_board_info {
-- 
2.20.1

