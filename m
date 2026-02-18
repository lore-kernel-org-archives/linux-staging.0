Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F5032F49F6
	for <linux-staging@lists.linux.dev>; Wed, 18 Feb 2026 08:43:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771404199; cv=none; b=m445JJLF8h6Qh2/BMGUoMTb2XT7WkVAUbYmB67yajFUf/jmCtOVdgSbEx+C1EiSrW8qXmFfY5i/mxs4RAGz5fCbQ7q9qlencB1sp6/FkT18sgW8ST1OXPH64d+ailVvlXzmCPFmMm6dLJ0GerqBGUo9IdA+oLQLlnzQvZjUkxP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771404199; c=relaxed/simple;
	bh=DVaQHOXQ0YyAm8/6a0B5wa/l9BCBKGMZPrZtTyDkD+U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=a3KI5Xp22vxmybGTuuNul7evDp99wAde5arB/vfGSzJpcJsYBBJceT91q6gHNXuMsUc530dULuzG6LjfQPXZ0BJbmVuDODVlF7q2bZzWIJzw5DELXzdP8JnEOTwXHJVDPmnMGbDar6i6i7im0e25pUD+tSIUg27tTa0NEED+oVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GzBTfS1H; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GzBTfS1H"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4836cd6e0d4so7856475e9.3
        for <linux-staging@lists.linux.dev>; Wed, 18 Feb 2026 00:43:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771404196; x=1772008996; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=slMntYeV5cK3UM8eA2ylzH6CLfz0SQ+hiIqJlmzD7AA=;
        b=GzBTfS1Hl81EzHxPG3dPCR9FlzT305xw/ybkLvB35nSJ6NBNBuTnJaVP/jaWTmcsQH
         ww87yxzsx0iDZeaXizWLQ2qmrz4OzbhxGPkrNVS+1SWRDRqUJihRl1WiEJ+pbOjuFJyP
         5qMP4R+pKvlQE/tYVzdb8/G45YJDAagot9R1rQm5pb05PZOdtjxYWlz/QG0vQkJqGrdk
         oAjthVsd58wLQczgyJJEuKwkBsj6RNLHqUj27gHxzUid0fs+m5C6x+JZ6kKY6KZ8mab7
         In7pT7V0icEU7PxaFOzuTQZLbFZAtkQgOVpb2dvuwxJST9abYeF6MSDIkPcMn4y3ywCs
         0Ecg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771404196; x=1772008996;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=slMntYeV5cK3UM8eA2ylzH6CLfz0SQ+hiIqJlmzD7AA=;
        b=JGu+DfVTsFF0z+EIj/oWK+qyCqO3WRox1Raick4TfZWWu3AxSq1HTMPzw8w8jBo54q
         AwG09v7ijNBSV0i7JkwjXhytkkN7noxpkI1T85eUb7UwAxCxKshffKD37UDjUxt17WA0
         lWiNoCNhJz0aIAlKgpMlBne0KZtRth2Z1zn1KM91zriccHc6reZRdM9jO73N/Aky0bFm
         AXSsQ8Fn+h7xQ0xZaTboKG05i9Zcg4lkPbzli3y5khB2fZ/H7yOD79WnTo3R9DZy9qbi
         K5IF+Z94ZS8/IAjkun6KHNS4ZfjS4a1wjmrRvgRAhfKbiIxmvVv6fMqEy85ReXyXPQdz
         NBzQ==
X-Forwarded-Encrypted: i=1; AJvYcCVEWYRpr/0w6pKyS6JuGkx536NSnIOHd5Q8AuQeqQqtelYSaZ85xHHqxo9uE4lOKKQzGzFa0hGn8HwVIuV6@lists.linux.dev
X-Gm-Message-State: AOJu0Yy4W1HEHivo64a/tP7+4XEq/6vWJZIngEpHUqxbO3Mtw/kIsiHM
	uZIW+2fDJJJ3X3uJN01kbMC9g0YTuC+XlKbtTKQkaVBBa1A2e0VzjQ2q5PIsdTvH
X-Gm-Gg: AZuq6aLl2LF8/JOTSP5o1mnNLrIg0hbeMctOD5Q2UDlBa1H8qyXRIJo0zOCvNkn2Olv
	C5OCCiDv3JsavQ/tTeO5YiMM1/ye+Wm9NOWGWOwP+ab+/AcjxqMuCLac4iyJQZ7pPah0o9jsRTt
	HoMhxdZb4HGCxuq8902QxNP0XncNNEocwG+KNXXq+6iyHDQgQiundsEifgD/9KL1epiUnkqG20l
	P8WTuyANPi3MtxtInhDOG7DHGQ2dqgdJkUWDv58kmcH0r7PertWrdLPvS/VRsKJo18SG5W907sC
	B42KUfGB7O0dFytIHObYFrhm8yyKcyqqgBF25r4Ot2KazVkR7b85uSKiE/0qwgbo8svZCr1txwt
	4QUGbDyCUUzZ3FBthci12TclJGUrMIA/HLlYI/QE6LwpBit4pUPTkyCmnIc6ZjnvBmkChlUGpEG
	mh0t8lGnSm6uVe2CpRN5fVQfPykX5/oTIZZFFOZi22RWtzTeDT/4nJyiwNEem0t8rDC9X+GsBjp
	AeLspt5aaMPoZJQrfoP6wmSk6kLVqqPCml5ZGZqFiKc/3T2ZalV
X-Received: by 2002:a05:600c:870b:b0:46f:ab96:58e9 with SMTP id 5b1f17b1804b1-48370dd9a11mr154745445e9.0.1771404196310;
        Wed, 18 Feb 2026 00:43:16 -0800 (PST)
Received: from fedora ([149.3.87.76])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4834d5d78cfsm831169035e9.1.2026.02.18.00.43.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Feb 2026 00:43:15 -0800 (PST)
From: Giorgi Tchankvetadze <giorgitchankvetadze1997@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev
Cc: linux-kernel@vger.kernel.org,
	Giorgi Tchankvetadze <giorgitchankvetadze1997@gmail.com>
Subject: [PATCH] staging: rtl8723bs: Fix typo in comment
Date: Wed, 18 Feb 2026 12:42:33 +0400
Message-ID: <20260218084232.92299-2-giorgitchankvetadze1997@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Changed "Enalbe" to "Enable"

Signed-off-by: Giorgi Tchankvetadze <giorgitchankvetadze1997@gmail.com>
---
 drivers/staging/rtl8723bs/hal/sdio_ops.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/hal/sdio_ops.c b/drivers/staging/rtl8723bs/hal/sdio_ops.c
index c9cb20c61a2b..d653d5df7d35 100644
--- a/drivers/staging/rtl8723bs/hal/sdio_ops.c
+++ b/drivers/staging/rtl8723bs/hal/sdio_ops.c
@@ -720,7 +720,7 @@ void InitSysInterrupt8723BSdio(struct adapter *adapter)
 
 /*  */
 /*	Description: */
-/*		Enalbe SDIO Host Interrupt Mask configuration on SDIO local domain. */
+/*		Enable SDIO Host Interrupt Mask configuration on SDIO local domain. */
 /*  */
 /*	Assumption: */
 /*		1. Using SDIO Local register ONLY for configuration. */
-- 
2.52.0

