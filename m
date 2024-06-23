Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 630511836EA
	for <linux-staging@lists.linux.dev>; Sun, 23 Jun 2024 17:57:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719165436; cv=none; b=tmdV+RSfYYps8Fzx3EJj9qxS38OIeC28Uq3V9Sj0RMP4HoIkKru9jTcdOWzbIN2X3Ou1Sy0JAmfHEaW5crNF7RRMek6IEQRCD/BvSK3+iGTKebpBVxXDhfYcF+2RAYFhE3nccAgOEhEAQBnRD8kO95V2l75SkEyliy/FcMZGMGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719165436; c=relaxed/simple;
	bh=Oqf2/LX2KvmZtP/r86VKLs2nphv9h8emvJrnjD6FL+w=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G3e8IUjvS/1gn7B7H5ELN/+BkeNAAFqwdTi8rb03lAPTNuUxlzbgWVZRBECm6ONB2g8BV1Dy4SzfgpK1EnGVFAcHwSx4FIfIxa7+4/XLL1WV8J+e1imazwJbysw7kzeM8Okv9ohyyA+Tm+bY4PAdYqhkz8vP0pQdRbmxBjnq3hs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A4Fdoa9t; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A4Fdoa9t"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-57cc310bca3so493162a12.0
        for <linux-staging@lists.linux.dev>; Sun, 23 Jun 2024 10:57:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719165434; x=1719770234; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uBnm7LvNgBYrwkaanaOkw1aUgSe3s7OTZa0lQuB6rvY=;
        b=A4Fdoa9txTbMlpPp3kPKaLjFRPfHxphv7mvBLWF6Ipi8TU3BGEYUTVvsE2bqAoIXb2
         KSitWSghIuBJYSso+or1wtQSQv4RWbQc+Sk9/jmbf/04qNu+0RhZJ9QCS5nxsq4LX10S
         TYdnevAQeyhROSRsKxcX7Lmh4c0rYTwtSOYMuzK1rHh3qi5lP1ZVkUIPpdusS02SxiZf
         wkdPASqkAL8oCP5Ygi2lZTyRnB5iIwUAVSsfeP6VpewKX1USIyt6IWZNEEVdwMwPrVeJ
         bhE72F/tZx8rRSodxEVgHbpUamlj0eTO+kM1Ebs4SKnJglMIJoYMz8caVD0cxwcgDLkP
         44cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719165434; x=1719770234;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uBnm7LvNgBYrwkaanaOkw1aUgSe3s7OTZa0lQuB6rvY=;
        b=EFOE5B3P/PUz9zRpw2fOo5wg4U8SHfhi7JuKRMR4tHJnFUQCBWKVq+7Yo1+iHUGgcb
         gZkloEZ49scyjyuIGT/nzIu7wv9LKIvyv0WwmLLrfEXacxlxWO8T12cxl1usmCIU1wqC
         /1JuKMroL6LADpcu0NfP9hX2ULrfs4UF4nsbNHQIl9NX7ELRfVVC7dBaR24LGrIIhJH6
         3HWTZgKK5CFFtRG0T/LARB8de1qs+rOInAmJ6NH8tlh2TTGR3J56ECC/zD61Z70/rzir
         vUzx7/upDEaao9Pqw8ZvOqpux4eBTQeb4GT0fiGSSmovzFRxGkevktXFzNcIVi8qsjyM
         dTvA==
X-Forwarded-Encrypted: i=1; AJvYcCUr5htfL0ucLnf1Wew0mpt3q1zy5+KGL2OvRLYOTe9hGhEAnexsAsHNZau4dXxRy2uk0XFmg8inEq/tPD88xTMQ8nwUa02McSPkOef+9Q==
X-Gm-Message-State: AOJu0Yzw8ISzN4hP6eHsSlsMXCvpgc8AY3ZlX20tVH/ydiADoNHKTYj2
	2jobc+i885Hlr+mMHgFI3l4o0Jps34feeng0v2J0ibxbaeGBHtRr
X-Google-Smtp-Source: AGHT+IFxrn9qTyBBQfpSZhcWaD2ZhACotZf6ckydRfDUWHKnU7piVXIWC/5Ll42iH0w3xAop+af6ZQ==
X-Received: by 2002:a50:cc8e:0:b0:578:6959:9d36 with SMTP id 4fb4d7f45d1cf-57d4396a17emr2282888a12.0.1719165433815;
        Sun, 23 Jun 2024 10:57:13 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p57935a9b.dip0.t-ipconnect.de. [87.147.90.155])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57d303da378sm3684703a12.18.2024.06.23.10.57.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Jun 2024 10:57:13 -0700 (PDT)
Date: Sun, 23 Jun 2024 19:57:12 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 04/14] staging: rtl8723bs: Remove empty file sdio_osintf.h
Message-ID: <1536950be4d4e4fc4757e10070ffc38c0158f808.1719155208.git.philipp.g.hortmann@gmail.com>
References: <cover.1719155208.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1719155208.git.philipp.g.hortmann@gmail.com>

Remove empty file sdio_osintf.h.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8723bs/include/drv_types.h   |  1 -
 drivers/staging/rtl8723bs/include/sdio_osintf.h | 10 ----------
 2 files changed, 11 deletions(-)
 delete mode 100644 drivers/staging/rtl8723bs/include/sdio_osintf.h

diff --git a/drivers/staging/rtl8723bs/include/drv_types.h b/drivers/staging/rtl8723bs/include/drv_types.h
index ea6bb44c5e1d..9e6ca1dec525 100644
--- a/drivers/staging/rtl8723bs/include/drv_types.h
+++ b/drivers/staging/rtl8723bs/include/drv_types.h
@@ -490,7 +490,6 @@ static inline u8 *myid(struct eeprom_priv *peepriv)
 }
 
 /*  HCI Related header file */
-#include <sdio_osintf.h>
 #include <sdio_ops.h>
 #include <sdio_hal.h>
 
diff --git a/drivers/staging/rtl8723bs/include/sdio_osintf.h b/drivers/staging/rtl8723bs/include/sdio_osintf.h
deleted file mode 100644
index 198cf3889a27..000000000000
--- a/drivers/staging/rtl8723bs/include/sdio_osintf.h
+++ /dev/null
@@ -1,10 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/******************************************************************************
- *
- * Copyright(c) 2007 - 2011 Realtek Corporation. All rights reserved.
- *
- ******************************************************************************/
-#ifndef __SDIO_OSINTF_H__
-#define __SDIO_OSINTF_H__
-
-#endif
-- 
2.45.2

