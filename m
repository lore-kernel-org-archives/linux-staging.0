Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4253F18800D
	for <linux-staging@lists.linux.dev>; Thu, 12 Sep 2024 04:04:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726113865; cv=none; b=Z4hyl90M/Vualw3lAJAeOzyfHwbF7gi2Rm/EJ3pe3ui1EPuBuUneGrl4OQqRMEfgkK3rczlGGcA34gV9jfDOKIOCkk30E7RDNLzNifo0OU74K3B/ifhQQ6JrF1CLcz2H6/RgFUatF9GwARVv3m9EDwgtCzNeyH6KMxi78NSECnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726113865; c=relaxed/simple;
	bh=p+vypDuDMOvowsiMhk7OveGdNLolZp1WdAqRhn25tPU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=UJX9pRA4OTk38XsTUS2m8IBJkbJAOs2aWVap3iQX/1+1Y8/djNBICobu4tkwZz2lD/6MxLMcbHu5CQfLKL+VcIZLqrDh/ca0ak+vJ+tOGG4a4zfXvRDy1LZLq+bUcgdkLsT8JsVVx1bZ90dmGvTAu6c59OzsdZrtzepp6Grtcjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TCC76khE; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TCC76khE"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2053616fa36so6602205ad.0
        for <linux-staging@lists.linux.dev>; Wed, 11 Sep 2024 21:04:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726113863; x=1726718663; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2zoSbD/XElrdewN0Z48FWs9MJU7wP3FXNvULxVd42pw=;
        b=TCC76khELft4OhIiRmYUKyfuLVNJ3OmmH9m0PhPRUEOJL4Smv+TQeyzC66NkYGrFZA
         mLgoB1annNDUVBHDHjxdBNJbnIbIrGmHTHUhkRHiCxdOXMco9XmeVaJ3kyZTdOKefSvi
         pfFnWd+ixC5KLF3CJ9fgVFJB3toxbvKAcmgwuj+mFoln71hQsmZYZPd7OFfGrN2eizQR
         iJJGe9cLn9w2JlTrdweGo6LiABx6OEDNFd5qUEzkcCyraNoCanH9VK+O5+UnpehaZfdx
         osBQIkmPi8J/d+w9N5WycUKJNThh7AhQxZH3+7BIhbMc5a1R4Rnd4bILXX55CHYb/ahx
         7vog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726113863; x=1726718663;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2zoSbD/XElrdewN0Z48FWs9MJU7wP3FXNvULxVd42pw=;
        b=DwIW3/uO7AunKqme5YFPCJM6nFzKOHlU6F7ZseJv4LCF/VjNJgnslXSHE7UD30usQM
         b1U+QsVwhbQ6leXjwk2t1n50mFyJEzWbMDUS0o2LquJHlxIwvzXo0W7TFDSqEVHlVhnE
         /xrhrrbrjIf6MEneuqDBlYKOzQ6bxnkR0XpcLvLYgBS3mcxnF8K4iesCUxv2vCeQtoLy
         1hgxn9j26X0VS99HqUzfCFwr3YendHX62F1dqfaZtd8vSpjte4g9AVNWZjbQ8VVtWvX8
         WPoM988pp5jvncmx3Zi/V/J55pcxUrVU4fOn3pvybOni2Kcw30j4nIzO7OoOQ1hc9v+d
         075Q==
X-Gm-Message-State: AOJu0YxKadHLFw2iMOr3NI2LtNdrBzVDp178beqFVqmuW+n8z3c7QSFH
	tQrVHtgXUyvByQZdWJkPLhpshaAEkdupCcJ51OiS0z4RRskDyEGruy363BPPduE=
X-Google-Smtp-Source: AGHT+IH/7Gpo8Sq2l3q2Gt7692KhXZvLDIe/Gd1lAKuPM0yfbKM+867cpJQPRyaP0NsS+PPEuahJQw==
X-Received: by 2002:a17:902:d546:b0:205:9112:efea with SMTP id d9443c01a7336-2076e39c879mr21496385ad.35.1726113863229;
        Wed, 11 Sep 2024 21:04:23 -0700 (PDT)
Received: from debian.tail629bbc.ts.net ([2409:40c2:12a7:616d:eca9:534f:4e49:7c41])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7db1fba469fsm768359a12.11.2024.09.11.21.04.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Sep 2024 21:04:23 -0700 (PDT)
From: Sayyad Abid <sayyad.abid16@gmail.com>
To: linux-staging@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	guilherme@puida.xyz,
	philipp.g.hortmann@gmail.com,
	linux-kernel@vger.kernel.org,
	Sayyad Abid <sayyad.abid16@gmail.com>
Subject: [PATCH v2 1/8] staging: rtl8723bs: include: Fix open brace position in rtw_security.h
Date: Thu, 12 Sep 2024 09:34:02 +0530
Message-Id: <20240912040409.3315067-2-sayyad.abid16@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240912040409.3315067-1-sayyad.abid16@gmail.com>
References: <20240912040409.3315067-1-sayyad.abid16@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This change improves code readability and consistency with the rest of
the kernel codebase.

Reported by `checkpatch.pl`:
WARNING: open brace '{' following function definitions or control
statements should be on the next line.

Signed-off-by: Sayyad Abid <sayyad.abid16@gmail.com>
---
 drivers/staging/rtl8723bs/include/rtw_security.h | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/rtw_security.h b/drivers/staging/rtl8723bs/include/rtw_security.h
index c3e47d52687f..953076667b4d 100644
--- a/drivers/staging/rtl8723bs/include/rtw_security.h
+++ b/drivers/staging/rtl8723bs/include/rtw_security.h
@@ -190,8 +190,7 @@ do {\

 #define SET_ICE_IV_LEN(iv_len, icv_len, encrypt)\
 do {\
-	switch (encrypt)\
-	{\
+	switch (encrypt) {\
 		case _WEP40_:\
 		case _WEP104_:\
 			iv_len = 4;\
--
2.39.2

