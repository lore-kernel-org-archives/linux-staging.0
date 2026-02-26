Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2DD3307491
	for <linux-staging@lists.linux.dev>; Thu, 26 Feb 2026 13:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772111027; cv=none; b=FnZCKlNnIMao2n6j+4/xg518njUat7ySwFSLcWrj7u6T14ZQc2f/J0qkZcSRiDPwWheVUdgn7tBtkyIvR3ymx6PvcSXwQgGBjb6nMNdhAqc2vUTUWAxj3mh1UI8XivrHkU6S3Ri+hcmDX/AEiafvFUX6KAc6kZMd0sIJu7fyxn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772111027; c=relaxed/simple;
	bh=CljBitToiiCsHEC8o0VoSQk0Hgcy8MtRTvJbXd0B90o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=p+lUDoDmv793M+i4PhDEuWG/ybkjDmDC0LBn2K+NeyomRlQFcJo7R76yXrkth1o1demE1B1yalRykMvelRGWC8IIWcwiNgJd8Qgei5mncOjB8Y+qUi5kCcqT++3bRXKI7UKCldJbX6CLgNhMmNBIA2wbYU1TULBYXODm5JB1+mE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TSp6I9sI; arc=none smtp.client-ip=209.85.128.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TSp6I9sI"
Received: by mail-wm1-f66.google.com with SMTP id 5b1f17b1804b1-48371bb515eso11372685e9.1
        for <linux-staging@lists.linux.dev>; Thu, 26 Feb 2026 05:03:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772111024; x=1772715824; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=P+k9slBbXIMT8raqXAmbjQVMB6j8pAmCCht+k7ff844=;
        b=TSp6I9sIKeXwWrhA7CPgl4B6CwQd7Zjv2G5j3vDcM975avnTaCKMXbHRNJm5qMg1Zs
         NaG66tdG28YojIiO53fotrhdwIlHFl/8qLFdAqx3+6vWGKhgcxzIeM1nsJNMBKoWJ9C6
         gnW9coklePiISmqHyinLRjM5Y2DsrpKS5/ywEYCGR4N+A5PyhJMclwYI24AVIpEBiqKe
         onBUXRlIOKOtepLPMitNNcgg33/CVfZi/orDTKEUQNVGpc+GQcwl3DFTf72HiM9Z3Nwr
         To8WTMFp8BX97Oa16mPgOgjjeJPKGXM+qNOC9pLchLSQYv7U3cYnJ9y9evTo3mIXs4Fw
         BuSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772111024; x=1772715824;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P+k9slBbXIMT8raqXAmbjQVMB6j8pAmCCht+k7ff844=;
        b=NLT16xdqrO2bgcP+cKHThZIp+CmvEe07LucW/FbkEtjhw5zRIAJsn5XLZXdnTZyIEc
         rkTmHOUogag6SBYdq0BLSLrM15imG7Ei2LqPxKo016cGifsVk2hHKAIs7Jq5E2DWusrZ
         W3Ru/UmNTqrJ8izGn29GNcq2JBUk4uP7JlNM0mPhJKA307Gus8u6yEcjcjSIi9QBR+Hv
         Y1MsCYKlV+lnnhdlzB2PCLuCf5Dt768mHUlu9ooQObIsf8kKjTzr8w9J3sByqzl008fA
         tiDWdq1bFBYxMUtWHMX2LPLGvngWVbsOLU+Sk4oZKE0kOoF6xmPL8AFS+C+DkGjT4rkj
         +cEw==
X-Gm-Message-State: AOJu0Yy8NYok48UVrSYDIlHBDw3g32iVTj1X80FOfwjwTYdLA196YuDz
	jUjNxFjsZ6Hf6enJ6XNJSr2+CJmYCd2FVwjGY+qKdXaQfuz7SKFUxetZ
X-Gm-Gg: ATEYQzwETcBXLpPHRpOCJjLHT5Eges7SGufBcZlI0++9HAVPkg7TH4DBENVHXspjerK
	wj4UVz8yE+nh4Q5E+TIZIU1pyynaWSdNToQYe4+ueSveKy3rhn3jJMKSORNVAHyvUOee/2OHLyV
	C12199wZMsoOP2iRTKMUvMuBz/C96Q78zU3+nhH3aU+P9oHkdF9iyOXgKFQk1nXPMLZUCoizwuu
	gEIbogY4ZkBSujtMIzStP//Sac4/XorKeFD0K+zyLEU52DkBV6bjoV+gkF6dvR4yt/KNKPvkYaw
	Fs85We/O7MpkiN09hUnFdLE3zzEvyUAMA1oeO2qJjUoRmZWu0LHzP63Oa5K9lpxU/tAaYTpD6A8
	ro8BpclDt0O8ufHYav+hQ7Jx2xmYZr1mzcvwgXdlJFZet6uLMpo/3f3cqAXh3QMaS2MamAl5d7p
	zV0g7Wm2cWJr+jOUDl4PBOWjGtyhxndgL+c4G1et0e
X-Received: by 2002:a05:600c:3e8e:b0:47d:18b0:bb9a with SMTP id 5b1f17b1804b1-483c3df7207mr32452085e9.33.1772111024311;
        Thu, 26 Feb 2026 05:03:44 -0800 (PST)
Received: from DESKTOP-BTQF5RC.localdomain ([85.110.79.247])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bfccb9f9sm36679485e9.23.2026.02.26.05.03.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 05:03:43 -0800 (PST)
From: =?UTF-8?q?Bera=20Y=C3=BCzl=C3=BC?= <b9788213@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Bera=20Y=C3=BCzl=C3=BC?= <b9788213@gmail.com>
Subject: [PATCH v2] staging: rtl8723bs: refactor halbtc8723b1ant_CoexTableWithType() to remove duplication
Date: Thu, 26 Feb 2026 16:02:53 +0300
Message-ID: <20260226130253.2145-1-b9788213@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Replace the verbose switch-case block with a constant 2D array lookup.
This makes the function much more concise and easier to read without
changing the underlying behavior.

Signed-off-by: Bera Yüzlü <b9788213@gmail.com>
---
V2: Removed '-1 < type' control
V2: Wrapped line correctly
V1 link: https://lore.kernel.org/linux-staging/aYiMi-X5r4aUEC32@BERA.localdomain/
 .../staging/rtl8723bs/hal/HalBtc8723b1Ant.c   | 58 +++++--------------
 1 file changed, 14 insertions(+), 44 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c b/drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c
index 1af101ba9..b3e34f97c 100644
--- a/drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c
+++ b/drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c
@@ -684,52 +684,22 @@ static void halbtc8723b1ant_CoexTableWithType(
 	struct btc_coexist *pBtCoexist, bool bForceExec, u8 type
 )
 {
+	static const u32 table[8][2] = {
+		{0x55555555, 0x55555555},
+		{0x55555555, 0x5a5a5a5a},
+		{0x5a5a5a5a, 0x5a5a5a5a},
+		{0xaaaa5555, 0xaaaa5a5a},
+		{0x55555555, 0xaaaa5a5a},
+		{0x5a5a5a5a, 0xaaaa5a5a},
+		{0x55555555, 0xaaaaaaaa},
+		{0xaaaaaaaa, 0xaaaaaaaa}
+	};
+
 	pCoexSta->nCoexTableType = type;
 
-	switch (type) {
-	case 0:
-		halbtc8723b1ant_CoexTable(
-			pBtCoexist, bForceExec, 0x55555555, 0x55555555, 0xffffff, 0x3
-		);
-		break;
-	case 1:
-		halbtc8723b1ant_CoexTable(
-			pBtCoexist, bForceExec, 0x55555555, 0x5a5a5a5a, 0xffffff, 0x3
-		);
-		break;
-	case 2:
-		halbtc8723b1ant_CoexTable(
-			pBtCoexist, bForceExec, 0x5a5a5a5a, 0x5a5a5a5a, 0xffffff, 0x3
-		);
-		break;
-	case 3:
-		halbtc8723b1ant_CoexTable(
-			pBtCoexist, bForceExec, 0xaaaa5555, 0xaaaa5a5a, 0xffffff, 0x3
-		);
-		break;
-	case 4:
-		halbtc8723b1ant_CoexTable(
-			pBtCoexist, bForceExec, 0x55555555, 0xaaaa5a5a, 0xffffff, 0x3
-		);
-		break;
-	case 5:
-		halbtc8723b1ant_CoexTable(
-			pBtCoexist, bForceExec, 0x5a5a5a5a, 0xaaaa5a5a, 0xffffff, 0x3
-		);
-		break;
-	case 6:
-		halbtc8723b1ant_CoexTable(
-			pBtCoexist, bForceExec, 0x55555555, 0xaaaaaaaa, 0xffffff, 0x3
-		);
-		break;
-	case 7:
-		halbtc8723b1ant_CoexTable(
-			pBtCoexist, bForceExec, 0xaaaaaaaa, 0xaaaaaaaa, 0xffffff, 0x3
-		);
-		break;
-	default:
-		break;
-	}
+	if (type < 8)
+		halbtc8723b1ant_CoexTable(pBtCoexist, bForceExec, table[type][0],
+					  table[type][1], 0xffffff, 0x3);
 }
 
 static void halbtc8723b1ant_SetFwIgnoreWlanAct(
-- 
2.43.0

