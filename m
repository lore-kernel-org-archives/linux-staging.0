Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94D6678297
	for <linux-staging@lists.linux.dev>; Mon,  5 Aug 2024 13:56:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722866193; cv=none; b=BwznGdFl/95fafZCdTBMsm1PClDtwAFTS9A6Cuf4xFoeRpLRnquc/0esEAhCNwwVzoTS8FhV0I++aljFC5G0GMjQVLHLU88XAfUkz+GU/rgcgC3YRaVHJJV82hTKfTWepGKrorHxa5PJRyz6UxK3nMCUxQys7SDGHUIVCLwGcbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722866193; c=relaxed/simple;
	bh=OljTUfGwA90xVwkaazPlqm/klEykXw3pbmjz7iJfWNc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Gj4bBDZjMf5rIbqYLP9GV67jzFKwKWG4gt/yYtxPlMqvIKR5sVXhRyUJigLl2/VUl5MRXxv6FiXVxdsXMwMTqon0xkc8fgrK6OztyzptZnp1lcTK7664fYlQQltXYGejViMZ8zCj++xjD7C8AS38OYT8w0xVMb/YsBfABVgN/UU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fBHi4PO5; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fBHi4PO5"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1fd69e44596so40367105ad.1
        for <linux-staging@lists.linux.dev>; Mon, 05 Aug 2024 06:56:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722866191; x=1723470991; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XLBfswTvbMFwnT4wTWUCcUwfcddXXu4lc4bwZmWOOv0=;
        b=fBHi4PO53E3wKLpHRROyNKk9a8gMqEqF7cgNCnVQBb2mYAaH6G/Rdf194gFzwp4jcG
         eGqz8cNXFXGlImQsclutE8q63NgIV9cQinXq5QQXtQNQppxzAWiIJ9voR3hWwl1v/E5t
         +xBxaLyrP1qGHFD5AH5JzkEmjvZbOxVWnLYf7xCHkCax5AC3vPMnmtUmNObxEdlpP/Fn
         x+4u0xbUWqr6gtLYfwb0qdOj5fZedAvDxg6Vhmd5eXrKdQ/Y2KfhI4QJeA+zdXNFxeC3
         HLEYgVKFYUyv60ZhwZekwXdFfR0lkh/QqRyRrhEcN2HMzX1ntstQxpfTXP8KHZh7FlRD
         SsEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722866191; x=1723470991;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XLBfswTvbMFwnT4wTWUCcUwfcddXXu4lc4bwZmWOOv0=;
        b=SZ3LOTN7D/rYdfAbCcmqciroaEGAQmp8xxRKfgRjMQJTQ2V6kCevKAblnrImkEdtBo
         UEthrhQUibCsFct+C0k/ltLA7ELMmXwaLoG9/BsqI7fq9B+6m5M1NR0NQv0fOp5mdZEt
         LoFx5caPmjgFUGcIxB3p1/M1YGtEyHK+FV4He4fOZEH6ab7LUf7S06nSNc3RAplgP0yD
         CRdOjnB4Lwo2NTWkh4bdWNCHF6Gx1SlPtdOfP51qmLsgW0mONnpQDJSpK0b/hHv/ncM2
         TAqjCPr8izoWrzUOYiMpHEsb5kUgl7bZTskVMUcwNKj6YNvSZmNfjrImkEOWHJbUzpsC
         eh+g==
X-Gm-Message-State: AOJu0YygMCF/pxsypAZyFFQuK+6TZ1JXY/0kPCNFOuKWuFu4/G8hkEeA
	wNx7OlQ/fArk6a8vCBkaysI4kbvwMF0215VSYKo8lbZ+eklhmo89
X-Google-Smtp-Source: AGHT+IGXmDZ2mlMh05F5BfNwBnZfnSpoMLulldjoltWc1fMBo2dURjbMQarr/2bglm2UDw4FBdLW1g==
X-Received: by 2002:a17:903:246:b0:1f9:ad91:f8d0 with SMTP id d9443c01a7336-1ff5240a35bmr214467345ad.8.1722866190502;
        Mon, 05 Aug 2024 06:56:30 -0700 (PDT)
Received: from VSUS.11svbebsuybebf4lhlhk4eftnc.syx.internal.cloudapp.net ([20.39.190.147])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ff590600e4sm67950535ad.144.2024.08.05.06.56.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Aug 2024 06:56:30 -0700 (PDT)
From: Jiwon Kim <jiwonaid0@gmail.com>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	jiwonaid0@gmail.com
Subject: [PATCH v3] staging: rtl8723bs: Delete unnecessary braces for single statement blocks in xmit_linux.c
Date: Mon,  5 Aug 2024 13:56:23 +0000
Message-ID: <20240805135623.2069-1-jiwonaid0@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Delete braces {} for single statement blocks to shorten code.

Signed-off-by: Jiwon Kim <jiwonaid0@gmail.com>
---
v3: Fix subject
v2: Fix subject and description
---
 drivers/staging/rtl8723bs/os_dep/xmit_linux.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/xmit_linux.c b/drivers/staging/rtl8723bs/os_dep/xmit_linux.c
index 1eeabfffd6d2..e0736707a211 100644
--- a/drivers/staging/rtl8723bs/os_dep/xmit_linux.c
+++ b/drivers/staging/rtl8723bs/os_dep/xmit_linux.c
@@ -144,9 +144,8 @@ static int rtw_mlcst2unicst(struct adapter *padapter, struct sk_buff *skb)
 		psta = list_entry(plist, struct sta_info, asoc_list);
 
 		stainfo_offset = rtw_stainfo_offset(pstapriv, psta);
-		if (stainfo_offset_valid(stainfo_offset)) {
+		if (stainfo_offset_valid(stainfo_offset))
 			chk_alive_list[chk_alive_num++] = stainfo_offset;
-		}
 	}
 	spin_unlock_bh(&pstapriv->asoc_list_lock);
 
-- 
2.43.0

