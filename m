Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3078414D432
	for <linux-staging@lists.linux.dev>; Sun,  8 Sep 2024 10:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725790285; cv=none; b=XDf0Jdhu5B0s1O8GMWWvVUytlJ0WHmFbe/zF0MTan8ukJeomuoz4DAl7eAkvX/wPHwQAwKeVcwDz8PQL57GxM7LG7G7DwVKyHzKANsKM8ssl7iChMtHevNAVsqX089B71GGVbjYNC4rkQfjQYx4VezHaCVCHN/gjSaFWx0+ZBLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725790285; c=relaxed/simple;
	bh=zugrtpy8HQKGTLbItF3tOpzCTunCd2sbjwm26rME4/s=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=b9lyvZSb6DTKXIzU6Te6d/XlbI0pktuOnP0el5e5brNchQ8cXGkf1BQIsgpb/V/sfVh/D5hgXCq6mXWMv4ghNYWqVvWWYm4ShRcki6zwdardrhGc5xjVu0DiK7WnCqQyUBZQDDOPRXdEx3aJpYs4HLE34P2CE8UfEGbjku51ZNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mRfq7NYF; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mRfq7NYF"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-2d8815ef6d2so2519427a91.0
        for <linux-staging@lists.linux.dev>; Sun, 08 Sep 2024 03:11:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725790283; x=1726395083; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JDj+76Ht7YTSwIwMsPXIYloIAdd0jmxLruLjjnwxVx8=;
        b=mRfq7NYFsbFs25pb0+Mh5DbaLTKr9LbHevvJxozxhneQfj/RgEQNWC+aUlUc/lsvyW
         xWhzhPR5xogZAbXgtNfwGXs8+psMH/PYnkFWAcrrqxzU8c9/GOxHybKxliJkd92HLdZe
         sl1Ju9G1PLESrOLmWd13cUreIfFbzm/+uGqP4ZlfWJfbhbOVHS+wEqHWIkBiOApkgsdW
         KD6crozw6P0bj3Jal18+S5ExYk2gl9kH1/5MXgf397fQ/2JJ3TX+b800U0S9dXutRff2
         bmcprlWkDXCQoJfNkeH0zT2mEG37qE9D35ZJC5kodj7kCJ22w0zodp6jYWYgZmflbDLp
         Royg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725790283; x=1726395083;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JDj+76Ht7YTSwIwMsPXIYloIAdd0jmxLruLjjnwxVx8=;
        b=bKz3rwoqiilm3pRU3lKc0B3V3lFKuYMudY+43M3VRwEGUZjxsO9gaADsxt1aI1XVe2
         zxd6ezgqktpHcoP/TdQvepoqQ7qmrh6EFBeOL0U+Zk2DALemWw/xGIdxIJd0FoeztulC
         xHTkezyfXkHD9eackcQpLXuELI4j/09KPuc/TKwv3lOcNLtITL1rACyykds07ixBBV6c
         uI+zKwQhX7bYWBXAs+3fFpiLaY/ftK0PQCixopK3BgJTXgBHyHWHOJ7jRScgznLlNM2L
         36p6z4NoHtNf52Ejx5tQq8KoKReaQJUtDJZ3WD7QqTlkg2AJtedbY1DCfqQS9apV8el1
         lhjA==
X-Gm-Message-State: AOJu0YwngmPl01t7NX1RqSflk/BJcYwxFBcpjRJ/8UMvhFhJz5pIrolL
	S+jmr5nmKts4jjGH0c23q4f3vMm0C5ZkVkSwZr/W/FTXHfGBEnRgJQx4eKhjGh8=
X-Google-Smtp-Source: AGHT+IGKCIA36df33OrsbYoi/vzgzHn1MjleAmwl+5CsQe9Y4r+q1uNWB8a7fUIRoanrYZyTH8PcwQ==
X-Received: by 2002:a17:90b:4c48:b0:2d8:8d34:5b8 with SMTP id 98e67ed59e1d1-2dafcf1b325mr5511414a91.10.1725790282926;
        Sun, 08 Sep 2024 03:11:22 -0700 (PDT)
Received: from debian.tail629bbc.ts.net ([103.57.172.39])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2dadc0782dfsm4589379a91.34.2024.09.08.03.11.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Sep 2024 03:11:22 -0700 (PDT)
From: Sayyad Abid <sayyad.abid16@gmail.com>
To: linux-staging@lists.linux.dev
Cc: philipp.g.hortmann@gmail.com,
	gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	sayyad.abid16@gmail.com
Subject: [PATCH 1/6] staging: rtl8723bs: fix use of tab wherever possible
Date: Sun,  8 Sep 2024 15:41:05 +0530
Message-Id: <20240908101110.1028931-2-sayyad.abid16@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240908101110.1028931-1-sayyad.abid16@gmail.com>
References: <20240908101110.1028931-1-sayyad.abid16@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch fixes the coding style issue by fixing the use of space
instead of tabs on line.

Signed-off-by: Sayyad Abid <sayyad.abid16@gmail.com>

---
 drivers/staging/rtl8723bs/include/rtw_security.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/rtw_security.h b/drivers/staging/rtl8723bs/include/rtw_security.h
index 98afbd3054a4..487d69460cec 100644
--- a/drivers/staging/rtl8723bs/include/rtw_security.h
+++ b/drivers/staging/rtl8723bs/include/rtw_security.h
@@ -75,8 +75,8 @@ struct {
 };
 
 union Keytype {
-        u8   skey[16];
-        u32    lkey[4];
+	u8   skey[16];
+	u32    lkey[4];
 };
 
 
-- 
2.39.2

