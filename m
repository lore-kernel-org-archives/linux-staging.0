Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09A451BC31;
	Sat, 16 Mar 2024 19:30:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710617443; cv=none; b=WaDduB8LNoFYVeGs2wGlO33e+i0+nq7dJGo0ixdZga+9itowHp9TcDLnmTXaouGreZ9m+IKUNOex9QEMIC86llcT1ijhyNLhjpSzkPK+vFcln1saL3g7lZspvlMbWPgb7pl1C9mqFNk5CnSmo9P2bcjwoXN+S/fZCjgBW1LfYx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710617443; c=relaxed/simple;
	bh=BSEHK1Sy6rIjyfh/7Khy9OlT5iS/EqLByt6/oiQhn/Q=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=h5M3/CPyw7PZW4wOnjHdqp6ZXWpq6R+Nv3waaB6JUAmpUj2rny7XK1SQ3cQZ436rYW13wYuQycUJ0goTSuMrFjZwLfesA6G7X9+XF9Fa9Sj+1HsVAzNcKqYcUXOjv0WTF3ZvRFus1v06r1ws7C3oiJat0g1xKPbIduKAJp6Tb+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mvuL7NVH; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mvuL7NVH"
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2d2509c66daso42458341fa.3;
        Sat, 16 Mar 2024 12:30:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710617440; x=1711222240; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4t44V6NfpJA8Qp8p/9+MXYCWOQ8DozAm5/+Hc31QXJc=;
        b=mvuL7NVH5i2m0Ke3DYsxMNAhOomqAVeyv0HvkiayWdodXSkUY172/gLsDKuwQP1haN
         V7CaD8sTi9/af+PaIi2tbZlNo3kTLtzrCTAJ3w6yOOptTrQ9Yc/zKDe4tibZPIg/nWSB
         4d+t0nw2nqV42mMfMQ4bvSn5evrxWpIJAXlfrim3KEQxOWw1zokFsp+C3VREZksb4uMV
         g43UBykfTPpw+ft61Bkc/9FY4aoEBkKP8ADTi7YglipSpTtVwT/O/QsJE8ObvVFW0WFe
         LyYf+NgpFQAIiJ3AzzBn31E/dsJCpOU9nsCHvNMGI3ny2eDO68IE6Q+8dGDIfhNRdoUE
         Xr6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710617440; x=1711222240;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4t44V6NfpJA8Qp8p/9+MXYCWOQ8DozAm5/+Hc31QXJc=;
        b=mfWot+ahxUiIo12/Zj9BLUs3j++sUS0FO03y9sTZyqxmOvTViCvY54LUDATchQWiDh
         AD5zNQNbAHlQ2Uo1rMLxU5ZUDEE4O8JjFu91FLjcYkSdWzM9oCtOjcOcsFKK78iYKocL
         zxxrk+Ivr9wV3Fdftvt7yhgmaVk4AgL/+hP/beTZXGPoAgdFiFzHTgRk6sVeUmvCD2B5
         PWzEW/KLkfBNxF1niuZd8kxoitNPC3jNieTqCHaa8pL4HiJLdwpQGrGXznIHVYRVMaBu
         hgAd8d8FGG1t5pqsY4u99YQFaqk3cmwcIxeZTzBr0HUXuFUff55f+3xi4wET1KG8eFml
         Rubw==
X-Forwarded-Encrypted: i=1; AJvYcCWEf9GdV2ilW5HdH4K82LXOM1I+5KAJtv7IZtaZ9TCp9xL0uN8H4sIzzHVjNJcdmCLXPYqalEuXGfU0VLKS+0qIAmccNHeqYh6FY02IGefKLwqh94iko8v9pfWtSfspQelFeNzgK93vaw==
X-Gm-Message-State: AOJu0YzbscAjUvIo1sQ1QuIuOwz1SfRwMvs6K6U5VVhoGTm6FrVQA4ED
	0w3SpkTZrhFa0+w4x3W6aF3a1Cn44Qm3+pSZdOjjoCJhiAl1ravJ
X-Google-Smtp-Source: AGHT+IGsbFvbR0iDVHzv1yrPLf9rgp+yzCD+pu1QPlu2GUotvRUkwlaZ+X32CezN6CQTw0IQ5ZpdPw==
X-Received: by 2002:a2e:9396:0:b0:2d3:ffa0:8782 with SMTP id g22-20020a2e9396000000b002d3ffa08782mr5269125ljh.43.1710617439936;
        Sat, 16 Mar 2024 12:30:39 -0700 (PDT)
Received: from ubuntu-focal.zuku.co.ke ([197.237.50.252])
        by smtp.gmail.com with ESMTPSA id bc25-20020a056402205900b0056742460f68sm2927654edb.66.2024.03.16.12.30.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Mar 2024 12:30:39 -0700 (PDT)
From: Dorine Tipo <dorine.a.tipo@gmail.com>
To: gregkh@linuxfoundation.org,
	forest@forestbond.com,
	linux-staging@lists.linux.dev,
	outreachy@lists.linux.dev
Cc: Dorine Tipo <dorine.a.tipo@gmail.com>,
	julia.lawall@inria.fr,
	dan.carpenter@linaro.org
Subject: [PATCH v7] staging: vt6655: Remove unused  declaration of
Date: Sat, 16 Mar 2024 19:30:16 +0000
Message-Id: <20240316193016.1885-1-dorine.a.tipo@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unused function RFbAL7230SelectChannelPostProcess declared in
rf.h but has no associated implementation.

Commit dd2837bdea0e removed the RFbAL7230SelectChannelPostProcess() but
accidentally forgot to delete the declaration in the header file.

Fixes: dd2837bdea0e ("staging: vt6655: Remove unused byRFType in rf.c")
Signed-off-by: Dorine Tipo <dorine.a.tipo@gmail.com>
---
Changes since V1:

V2: - Removed the unintended blank line after removing the dead code
    - Removed "in rf.h" from the subject

V3: - Added in the Description Comment about unintended blank line

V4: - Adjusted complete description according to hint from feedback
    - Rebased patch
V5: - Added a missing closing parenthesis in the fixes tag

V6: - Sent the wrong patch for v5. This version includes the fix in v5

V7: - Made the subjectline more uniques as suggested by
      fabio.maria.de.francesco@linux.intel.com

 drivers/staging/vt6655/rf.h | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/staging/vt6655/rf.h b/drivers/staging/vt6655/rf.h
index 6f842ac00526..8eef100c7ef2 100644
--- a/drivers/staging/vt6655/rf.h
+++ b/drivers/staging/vt6655/rf.h
@@ -68,8 +68,4 @@ bool RFbRawSetPower(struct vnt_private *priv, unsigned char byPwr,
 void RFvRSSITodBm(struct vnt_private *priv, unsigned char byCurrRSSI,
 		  long *pldBm);

-/* {{ RobertYu: 20050104 */
-bool RFbAL7230SelectChannelPostProcess(struct vnt_private *priv, u16 byOldChannel, u16 byNewChannel);
-/* }} RobertYu */
-
 #endif /* __RF_H__ */
--
2.25.1

