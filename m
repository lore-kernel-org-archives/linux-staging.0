Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CADE717B50F
	for <linux-staging@lists.linux.dev>; Tue, 10 Sep 2024 05:58:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725947889; cv=none; b=RcsJxcpuue+mPtfonO89zb4NfLFK+ru1AvQkq0BVmewReCCbxiB3P21SPJpbsglH1kFBDKZLOgLHduCLmWPwHYmwPmP4bG+yxXYGX8Io6acD8E2Zb5lyChSF8GnMQoCk8VCdGhTF0xNX4KyNrLiuvpFmhQFsUrhZUcjrOCKRVk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725947889; c=relaxed/simple;
	bh=XbUDZ8IUfkfJObJ2330aHQhyoCJXctwLXkp6mrx3Vhc=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i08kBCkWKHYdyE2vGDS5oppADoNX4ON4iDiHVRysr1t0ndrDQ4DBFnB0G7GKR0TraETxyNMVoeNzPT1aWEFAP2rdUO7guAznb+NumQF5FuQ5JHPCvk5bL06EUrq+vqidygg3ZoKwN+LUHqsJZHbSRyGZ/UCT+bCnoN4YbHDN+Q0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fCABPA6H; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fCABPA6H"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5c3d209db94so5578433a12.3
        for <linux-staging@lists.linux.dev>; Mon, 09 Sep 2024 22:58:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725947886; x=1726552686; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gymUfn5xiGysGwdz/oGmzYjODxt8QZ59eag7p59pDaQ=;
        b=fCABPA6HQQfm6BjJMlFIW9APgSnevTldbThStxfNkbs211SzqtNaMuoB1QuGtYlgxt
         42rprIw8dCFb061esIa819UyNGzbbXX3NXSOc5nhsiZ98Fk7OfzvRQCfp1LIR1gPNmG4
         tEWT7oDLnl2OmWHozIFNlfUw2wb+qvjWRYHL+KNZRTgdEnW4NCnmw/7wnCGba2YeG3ib
         0olbrAevCnhejc88Puzz7a7025X/TIirBf9/BIcLDAnDLUsyTCoT4yudYOsc2XDel8ea
         Oy3ok4SvGa87uZUBhEEOl/0E5uF2IKxNvpIOoWie5FPg8EFwfEJkCoclbWAIPme79nim
         ICHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725947886; x=1726552686;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gymUfn5xiGysGwdz/oGmzYjODxt8QZ59eag7p59pDaQ=;
        b=Xu8wQzl1GQRkiXr2gECO7eUu6gBJuvm7kOz0AOHTy8LMjJLP+kzTgszwlaQG5hnkN/
         y/gF1xcZmHAWbycHYHF8x3LshICdbTJDH4qA2RTia3zIjyfS2X2C4yDiD4jhgkUEk3I8
         03jQ/Hzke0utoDFaMXtuEIa+ScYxOjn77vcLxx14WtqR40BMxqRHuGaLUrlNzJhjDVvX
         5aY84As54s/X+IjV832ur8HR82UXjgXGXPDuJB5PaTdezyAuvHm1+voTEi6uCOq64kim
         Ujuh6unYQrOnA5wzHyjsp0qvUhrC2prupmzmdiGRFJzOe8EKEiWUbKTC26FQeP+qF7yA
         o0Lg==
X-Forwarded-Encrypted: i=1; AJvYcCU8/7mk3rdTaTz/5VwjoqYSAhnO35sNGPjn/XChQUYkYXQBOZYq8ppW75FG7+eoAae0CesdcqH/heclcfqc@lists.linux.dev
X-Gm-Message-State: AOJu0Yw1AnvHWz8mzqjnyCtZIynNICyIcOXhAjoC1RfalSL+kedBovmQ
	iiVmg7x2o1f9XYvtOI+/es4VjSqnhuo6OSGB0H2BCJEU9ttcZZoJcjtHkxEl
X-Google-Smtp-Source: AGHT+IFwh6iTk9qx3mUae71uO243EOgHfbIaTK31+auI1yyebCID3qhRzK8HuXwMTLz8FNnuofuIKQ==
X-Received: by 2002:a17:907:72c7:b0:a7a:a0c2:8be9 with SMTP id a640c23a62f3a-a8d1bfcb437mr1355333766b.18.1725947886117;
        Mon, 09 Sep 2024 22:58:06 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p200300c78f2a8598b80c2d4e9a813f29.dip0.t-ipconnect.de. [2003:c7:8f2a:8598:b80c:2d4e:9a81:3f29])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8d2583f73asm431679466b.7.2024.09.09.22.58.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Sep 2024 22:58:05 -0700 (PDT)
Date: Tue, 10 Sep 2024 07:58:04 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 11/11] staging: rtl8723bs: Remove unused file rtw_rf.c
Message-ID: <2a31866e3e6f65e90d612f7473501066f6bc5937.1725826273.git.philipp.g.hortmann@gmail.com>
References: <cover.1725826273.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1725826273.git.philipp.g.hortmann@gmail.com>

Remove unused file rtw_rf.c

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8723bs/Makefile      | 1 -
 drivers/staging/rtl8723bs/core/rtw_rf.c | 9 ---------
 2 files changed, 10 deletions(-)
 delete mode 100644 drivers/staging/rtl8723bs/core/rtw_rf.c

diff --git a/drivers/staging/rtl8723bs/Makefile b/drivers/staging/rtl8723bs/Makefile
index dbe6ed3b9f0c..ba200ee669f3 100644
--- a/drivers/staging/rtl8723bs/Makefile
+++ b/drivers/staging/rtl8723bs/Makefile
@@ -11,7 +11,6 @@ r8723bs-y = \
 		core/rtw_mlme_ext.o \
 		core/rtw_pwrctrl.o \
 		core/rtw_recv.o \
-		core/rtw_rf.o \
 		core/rtw_security.o \
 		core/rtw_sta_mgt.o \
 		core/rtw_wlan_util.o \
diff --git a/drivers/staging/rtl8723bs/core/rtw_rf.c b/drivers/staging/rtl8723bs/core/rtw_rf.c
deleted file mode 100644
index 2aca45de298e..000000000000
--- a/drivers/staging/rtl8723bs/core/rtw_rf.c
+++ /dev/null
@@ -1,9 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-/******************************************************************************
- *
- * Copyright(c) 2007 - 2011 Realtek Corporation. All rights reserved.
- *
- ******************************************************************************/
-
-#include <drv_types.h>
-#include <linux/kernel.h>
-- 
2.46.0

