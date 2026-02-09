Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com [209.85.214.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72A0730FF26
	for <linux-staging@lists.linux.dev>; Mon,  9 Feb 2026 23:52:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770681144; cv=none; b=J7bMXZrokozXLvCft4xQ3YAhospbLssJjq5FDWQWYi0IUuwqi3474X7kKZV4l3mWfhmvxiQ7QRg/5lsN6a4oEMREFnzfIyM+7irjMjmOKvsMRAG0Q77NsU/Btqjt+UkmHacPEJXTzbrfxPp66WIyjDkjPV18tIpjf2SVlWSgCL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770681144; c=relaxed/simple;
	bh=i7/JBASeHXM/cjI1waN21y6SIWDoM6hDKessSLPjiLg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gFLNxOoOIceeDwjCZtUsjH9wLb0rF+WLVbrKDcM+9rZ5wQyx92pLU/vD3jw7RZKzMGthwWG/LK33r8DXPQMjUVTSNoLbh9bRTilIdV7WoST5HDwYxVjO5Yw4B11X5Te8DHWN5RCZ4mee4Tu1avNPZmFAdQV8+bWBYVqCW6D6LO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MQdFsbRu; arc=none smtp.client-ip=209.85.214.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MQdFsbRu"
Received: by mail-pl1-f194.google.com with SMTP id d9443c01a7336-2a871c8b171so1252555ad.3
        for <linux-staging@lists.linux.dev>; Mon, 09 Feb 2026 15:52:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770681143; x=1771285943; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iyrI5LfPT28faT0T8IssVn66RCCqnrxefCozcBVyhK8=;
        b=MQdFsbRuHIS6AA/E9TDcH06YlMFhg3rk2uWb5PKwEHESvSXmfwtH2q/Mm1qh+H0pxY
         Jzko153CoM/1Sy7Pv67j2SnuzsV0uJuEKv9E+KCwucfadYX9CXpGX/CpVVuAAu9c0JRs
         vggQapeWuwSFBHqvMnAM4GO5Dt/25K98KEUuivbn0Yqd2L3WCdLLn2emtHvO9JPaYB+2
         8BB5aP4goCOlEI53HSVya2uIwBiOeHH68UgeZFqzLMF/xiEW/vFBg/7C1pR7h3ngct2w
         157mZ3qrxLYDVHYmKurvjpDpfO+Wjgnvz+yK8MslEA7FjRBnIpxxBuz4javmmBmLVi+s
         Dbyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770681143; x=1771285943;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iyrI5LfPT28faT0T8IssVn66RCCqnrxefCozcBVyhK8=;
        b=vgyL5wASXFaGofyzxNiAqwzWRZgGM/V/cT0pG0txw9+ULVXtGg9NMogyxoPyVj+uCG
         fF3rK0Nbf7Q84DAYUsQTp42BRx8WfcvIsqEnAQKx3TO2qxnMzgHPzkexWnYaKkYZwLkr
         s5G3EN4Y+0KAIvldyDNsv+V2SVlTx84USN1GpJldtxCAdszX4jKFqqeYhckyKBcrcGhN
         xPfcRb65Jtle9/dIZKQZ5LGquaATDSyU3VLMMp2Z+sY1IlNd+1C6MsbFw98n+Rgjm7do
         Q0mGO0ue38v/nFW1Tise1wV+J1vJTj/Ew5iaU9dJhud1HUyp0Ej2Z0WUDwipymGGNxVt
         T++w==
X-Gm-Message-State: AOJu0YxFd61LrKCalu17PcUITCYcspWZpIqERXKoSrCBZysaX+NOdpH6
	pibZXon8Z+nu1wF8RLfmEfuG1dtHQVOnbAM4GjJ5ufcN/PVYzxmfE0Of
X-Gm-Gg: AZuq6aJPq0UN6hUQ5Ij968ZkaLQ/kRjv9iIo8QpFZvS7lrfK0NZxz8CemOFK68A1Pkm
	Yww903PFVkP+vJP2jo2LusHo8f5cCILdn4bcfnYjttjutc/IpmJmNXNx394/nB47p6ZbBeg8T77
	egclNKKUiHMxOSwwvHiZwxSdQ3a1Va1ojDE3CRPzN2a99UThy7G3jvLckUQwVriUZKTlY74CbWk
	/36pks8kC2SEONOrPuWSQW2Hg1t/+rXzaYtyaxYrzETCnCjZlXeixxj2agRCCCheyXqe/u1r97q
	9p426RpGtdYCaU8riL9JZRhePqvNoJ0ooxYIjtT4cH9FbTfOemBaKHJy8cDi2tJaP2+znNExQSU
	WnHIJjYxZE6M5gTjvPu77L8MFR1hPmkYD6dN3fph5uyBOfd/qY3Jplro/rYx8s3pzLPcX4jIqu+
	1Rx1uMr5D8f0fPYhIsyzIYzEuarbB7g9dSvHtKfBsX0HZk
X-Received: by 2002:a17:903:2f08:b0:2a0:9fc8:a98b with SMTP id d9443c01a7336-2a95181196fmr124672285ad.40.1770681142797;
        Mon, 09 Feb 2026 15:52:22 -0800 (PST)
Received: from Horstaufmental ([159.192.34.193])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c6dcb64499fsm11581843a12.31.2026.02.09.15.52.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 15:52:22 -0800 (PST)
From: Siwanan Bungtong <horstaufmental@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Siwanan Bungtong <horstaufmental@gmail.com>
Subject: [PATCH 5/7] staging: rtl8723bs: rtw_security: remove unnecessary void * casts
Date: Tue, 10 Feb 2026 06:51:31 +0700
Message-ID: <20260209235133.1292161-6-horstaufmental@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260209235133.1292161-1-horstaufmental@gmail.com>
References: <20260209235133.1292161-1-horstaufmental@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove redundant (void *) casts when calling memcpy/memset and
other helpers. These casts are unnecessary since C implicitly
converts to void * and they only add noise.

No functional change.

Signed-off-by: Siwanan Bungtong <horstaufmental@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_security.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_security.c b/drivers/staging/rtl8723bs/core/rtw_security.c
index 2f941ffbd465..c2860dad2576 100644
--- a/drivers/staging/rtl8723bs/core/rtw_security.c
+++ b/drivers/staging/rtl8723bs/core/rtw_security.c
@@ -1113,7 +1113,7 @@ static signed int aes_decipher(u8 *key, uint	hdrlen,
 
 	/* start to calculate the mic */
 	if ((hdrlen + plen + 8) <= MAX_MSG_SIZE)
-		memcpy((void *)message, pframe, (hdrlen + plen + 8)); /* 8 is for ext iv len */
+		memcpy(message, pframe, (hdrlen + plen + 8)); /* 8 is for ext iv len */
 
 	pn_vector[0] = pframe[hdrlen];
 	pn_vector[1] = pframe[hdrlen + 1];
-- 
2.52.0

