Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1B4A38F947
	for <linux-staging@lists.linux.dev>; Sun, 18 Oct 2026 03:32:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792294363; cv=none; b=tHunJ5sQWqAV1ZQAko1RKdfyxZgoYprSlMFWHW6n+fDkdqiLVRtqaMkpnEdnLVJs9QTNyoo/L41FaHOFkW9e3ghwEJThKfdiZjCdoMMg8bBwX3Xn5eTR3eWij/Y6CrO1RzuhXWVuKqn+6XHvArbsg3HjqUPREHbeemImZtlHids=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792294363; c=relaxed/simple;
	bh=UvTEXTqw1lVFneCi4baLXWwmAJ0n7GhdLElXFhLHYX8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RG+0+zhh+Yh9PLGQZJFz2wfACmh7u/GczIYZmN1Y4OA60G7H7RwTb97HfbeC9H4DT0Tr+7+6wV4EZS9Gcmg+IqvMU3V40mrNMlvIJDOizKwvdfyer1izj5pi7NB0aaOAFzCn8UBAuGJ4DdPGMLcXdlqCvp1wnDSE1x6YmweDwxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WBGddG5Q; arc=none smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WBGddG5Q"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso2159326eec.0
        for <linux-staging@lists.linux.dev>; Sat, 17 Oct 2026 20:32:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792294362; x=1792899162; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=O9jsrD/kdtezFUO00VsW4JeI4Jo/i5FLlkQ/PljGjWE=;
        b=WBGddG5Q7aYphGlhtXP4TjJZ/HB6mqYO+LY4Ea0zWpVXFF3wR42i35KwLI8bRfH+jy
         9/uCsQ5PBWHa6Tf83hQq+vuBcFNoj5o21uSkisnL6YAzI1Xs7jHAsDg4ofDt659PcQ4g
         Ds8XkDIismJlWVSBoAodkDEINkd4gEFSolu27l3H0YsMRu0OGYoywYGKne6LSM/215PF
         sfkn/dFS27hQA9UAo6uXtTQiaGlcBynInJlQJAj/zOcwnjUjJpg1jYrO5Sdnr+s4svlv
         dZOBGV9c5HEEYFIZ+zYmQhoL6UZQ7q/+U/Cwoeg/m0KW27xbrH3fLTyQqlSIOB9y4BjB
         IcNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792294362; x=1792899162;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O9jsrD/kdtezFUO00VsW4JeI4Jo/i5FLlkQ/PljGjWE=;
        b=dEotDC9jKxRQaP/3cETwBJkvqmQvlYDaS1c/8OniluoHdRRRtnrCgufZKXaBabUVum
         aWhH1KWmC/a4sBKRwxxwP6RMKDdFltL0kOU80VpRBZyJVmtXrl3OCjZUrCat2Hnu9enP
         oIObWiJQ3KJwNEW9ajGafeVxwv0RqLhPSZ50rK0e6Ecrgq0DwfnkSMj0+7anxP104IJt
         ftFi+McOGwjscQczXzmvoEjXaw81ZRmw1NWv7SlQzavaqGEmvTkSs9C6JDkLALFcJ76p
         szMqX0japg6JdTThPF8Gfk/lmIHY5Q1vS5uXbfaghIPEt8UMDdSCPFHnXe/DN6lP0lLK
         Crrw==
X-Gm-Message-State: AFq9FYK+ArVPbvCtOE34sBTaqPRzAzZHvlhgCQ3tnripCA8wiIrt/mq4
	GB2ZEQ97BYx4gxFJrPYAzWLvrT7g6DgjgBVB0S4cTUF1K72apIa7erGU
X-Gm-Gg: AYBFou0w7I0WfRjIBcTeIv9/38yg7Zy5pcmB0kpKDhP3oKbrNK5Yw4Dp9xobupaEsIj
	HgdQUz7Pe+NRPr4zkzR/vnM3ocK8LO/LpnIx/q6+FQFMmJAXkMo3L3yrl6YTgrTCT3pE3RtrCXl
	Va3aXt03KMIOG7BLrD+TtoaFoCHLULRofoxTDLjYi9X9mzijNEutn+MGrqUZz4MFIr7z841PQVi
	jVdMj9NwICd633zaA+2Di0H76r/8Yn30f3erWwBJzV74/3nMSpp2hInNedyQLoJLgUSx+SfHIcu
	zVYQnNW5R+MxIhhQQbgoCAO6OsS1CYg3qszq4v8ICanCLJXY8E71c04FTS6ZBIJZfLbb3vYYm5N
	V3UmTCpz7a1mxU4cNsa1NhgbvR1CWlcnIOkG4VxDSPeBi0LVTVgCji74Z33CkxoSIX1pjawC+UV
	C1sN3hwTtZZIlINux1bkA+uqXC6EquE2npimimCLlsEfqgVjV1PAkEBmIy5NC0Ts+GM+pYfRyii
	MW+FeWFJOXgz3p3bAZYUe0=
X-Received: by 2002:a05:7300:ff4a:b0:351:f762:a10c with SMTP id 5a478bee46e88-3619b20edd9mr5915279eec.0.1792294361434;
        Sat, 17 Oct 2026 20:32:41 -0700 (PDT)
Received: from NithishVelan.localdomain ([152.57.87.120])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3607bc950f9sm22261572eec.0.2026.10.17.20.32.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 20:32:41 -0700 (PDT)
From: Nithishvelan M <mnithishvelan@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jennifer Guo <guojy.bj@gmail.com>,
	Nithishvelan M <mnithishvelan@gmail.com>
Subject: [PATCH v1] staging: rtl8723bs: remove empty if branch in halbtc8723b1ant_RunSwCoexistMechanism
Date: Sun, 18 Oct 2026 03:31:43 +0000
Message-ID: <20261018033144.865-1-mnithishvelan@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In halbtc8723b1ant_RunSwCoexistMechanism(), the if branch checking
halbtc8723b1ant_IsCommonAction() is empty, leaving the assignment to
preAlgorithm in the else branch. This triggers a checkpatch warning
about unnecessary braces for single-statement blocks.

Invert the condition and eliminate the empty if branch and braces,
simplifying the logic and resolving the checkpatch warning.

Signed-off-by: Nithishvelan M <mnithishvelan@gmail.com>
---
 drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c b/drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c
index 0613beaa37..dfe921033f 100644
--- a/drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c
+++ b/drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c
@@ -1903,11 +1903,8 @@ static void halbtc8723b1ant_RunSwCoexistMechanism(struct btc_coexist *pBtCoexist
 	algorithm = halbtc8723b1ant_ActionAlgorithm(pBtCoexist);
 	pCoexDm->curAlgorithm = algorithm;
 
-	if (halbtc8723b1ant_IsCommonAction(pBtCoexist)) {
-
-	} else {
+	if (!halbtc8723b1ant_IsCommonAction(pBtCoexist))
 		pCoexDm->preAlgorithm = pCoexDm->curAlgorithm;
-	}
 }
 
 static void halbtc8723b1ant_RunCoexistMechanism(struct btc_coexist *pBtCoexist)
-- 
2.53.0

