Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EF6070
	for <linux-staging@lists.linux.dev>; Sat, 27 Mar 2021 14:25:24 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id z2so8380009wrl.5
        for <linux-staging@lists.linux.dev>; Sat, 27 Mar 2021 07:25:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=CHdWroy7tRGJ6z2hFf3CkopkW65s4qPmFApR2G2IO2Y=;
        b=LLL3Hbo2zjnWmH49k8/AER8msWRJP98NPintOVkGdJEECJEj4VhI54ZjgZTz9QyV4m
         kD2054V8zGkFB3sUiywySXOvPCsd1xbKSdaxay8ll9pacgSO0cAMNh6zC2XIDjT43v7p
         WwBMNm+Cm3hMVsj5o6AGzCiDYoEI1tArBVovGLaY8HVOTicBfczLq6UYTPXcOCB6ZVNC
         /pOgvPB66s8kalk72yC+R+qtMOba6B0kotX6d7ix14foroLExlUsw/0ZKp52YhSJErau
         0WnnqvChHJmWoUhf9cim9kXvDQuiIdYDILQtbfxVpRpYS674T/AAHtzihtREb0o4VRTM
         2FwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CHdWroy7tRGJ6z2hFf3CkopkW65s4qPmFApR2G2IO2Y=;
        b=WsF2n3SpEtRjmHjDxfjTi8WSYscja3q2hN6e1asBe2FDHtAifwD1stKbz2jqN1VKWP
         psw4ZfYbwiLjF2FkgmHjVSbA0HPtIeKkVX/5JuW4HyrapYKr+W6um6kJfpaKvHEKQI9o
         Qb2l24L6EbCfz7pqlOpqHixOysuKVJIpZ58jtzr6sEC6jJsxRfn18OaQZn/ngKxABTYl
         5YE1b80I3FNAqvdOYdX1zEkNNcLbf9ljT8HHxhZABpYh6/A0Acyxj2nGeIEPVAiNuYen
         VwmX8sk2kF7FLHwyiWc+xmLyO5rwhpoi1IQFbLGB3EXPhHLb4RlVtim0yJ2r2hPIu82Q
         xNxw==
X-Gm-Message-State: AOAM532Y4hapM29DRXHHGf0YCXrlXFX2Xqv7mQWigtsxa5SmDRsJmfmz
	bUEahomO7nwrfpCE4ZTYQfs=
X-Google-Smtp-Source: ABdhPJxSKRsekNxzCtBSWPzOCPqDzij5Dc+Z7Y9AG0dk3N/etZRq/vrmmIyq3BEaZJaV1CU4Bg5Llg==
X-Received: by 2002:a5d:5487:: with SMTP id h7mr20022211wrv.348.1616855122875;
        Sat, 27 Mar 2021 07:25:22 -0700 (PDT)
Received: from agape ([151.46.211.242])
        by smtp.gmail.com with ESMTPSA id c9sm17634028wml.42.2021.03.27.07.25.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Mar 2021 07:25:22 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: dan.carpenter@oracle.com,
	david.laight@aculab.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Fabio Aiuto <fabioaiuto83@gmail.com>
Subject: [PATCH v2 19/20] staging: rtl8723bs: include macro in a do - while loop in core/rtw_security.c
Date: Sat, 27 Mar 2021 15:24:18 +0100
Message-Id: <0f176b08b7a49d6649ff9d5468bd912e58c1db06.1616854134.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1616854134.git.fabioaiuto83@gmail.com>
References: <cover.1616854134.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fix the following checkpatch warning:

ERROR: Macros with multiple statements should be enclosed
in a do - while loop
2014: FILE: drivers/staging/rtl8723bs/core/rtw_security.c:2014:
+#define ROUND(i, d, s) \

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_security.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_security.c b/drivers/staging/rtl8723bs/core/rtw_security.c
index 0ddd7667a986..8a447e149438 100644
--- a/drivers/staging/rtl8723bs/core/rtw_security.c
+++ b/drivers/staging/rtl8723bs/core/rtw_security.c
@@ -2012,10 +2012,12 @@ static void rijndaelEncrypt(u32 rk[/*44*/], u8 pt[16], u8 ct[16])
 	s3 = GETU32(pt + 12) ^ rk[3];
 
 #define ROUND(i, d, s) \
-d##0 = TE0(s##0) ^ TE1(s##1) ^ TE2(s##2) ^ TE3(s##3) ^ rk[4 * i]; \
-d##1 = TE0(s##1) ^ TE1(s##2) ^ TE2(s##3) ^ TE3(s##0) ^ rk[4 * i + 1]; \
-d##2 = TE0(s##2) ^ TE1(s##3) ^ TE2(s##0) ^ TE3(s##1) ^ rk[4 * i + 2]; \
-d##3 = TE0(s##3) ^ TE1(s##0) ^ TE2(s##1) ^ TE3(s##2) ^ rk[4 * i + 3]
+	do { \
+		d##0 = TE0(s##0) ^ TE1(s##1) ^ TE2(s##2) ^ TE3(s##3) ^ rk[4 * i]; \
+		d##1 = TE0(s##1) ^ TE1(s##2) ^ TE2(s##3) ^ TE3(s##0) ^ rk[4 * i + 1]; \
+		d##2 = TE0(s##2) ^ TE1(s##3) ^ TE2(s##0) ^ TE3(s##1) ^ rk[4 * i + 2]; \
+		d##3 = TE0(s##3) ^ TE1(s##0) ^ TE2(s##1) ^ TE3(s##2) ^ rk[4 * i + 3]; \
+	} while (0)
 
 	/* Nr - 1 full rounds: */
 	r = Nr >> 1;
-- 
2.20.1

