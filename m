Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72565170A14
	for <linux-staging@lists.linux.dev>; Tue, 10 Sep 2024 05:57:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725947869; cv=none; b=ZcruO1s/PfD5OwuggPLXF9Eq+w7R1MeIwWswzcB6/KNa1ixWE6Jls51yqTUnWOo/JUk/bqVN3/SSgz9eJHUHiQK4ptue3bo4KP8b20yHoSL2kKAJgGwPClwZrgrKK9vOifnyzCTcUxxFVeN5H+w1J47kU5HlERARpOa8I3nnEJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725947869; c=relaxed/simple;
	bh=mDWCdtQECaft6UyFnxKuWLNVPoT/Ykv8dg63XdEYIJE=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SUwcoqP6DefThwgtbP6sS2UwS37vEYT+dQqjAgFm/GOgJ1C6bBEt/t3c1bdNGRvjyAlAOAF7CghQZExpKSgEdTrFvtNIv8KbGpasYFJq8qQU0Zt3xqasql1OGFLJjj4Vf7kzoxyXCz1JPvSXPWy8x/bblPzYi9fNGdXiATPGBYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xhb0JkNB; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xhb0JkNB"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5c241feb80dso11733351a12.0
        for <linux-staging@lists.linux.dev>; Mon, 09 Sep 2024 22:57:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725947866; x=1726552666; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AXNNB2F38kuYNsFyFx8FeC4ii8KpvQhpKnyoK0gzIHI=;
        b=Xhb0JkNBwCcblBVOosTQKLU8y13VEdb8OcYQJaVREPfWAxURLlAil5ap97BhBww+ow
         bEFDEaTpvsVRmhyC0gtQEl4SbpXHLGUFRIJYjgdwKcroc0uSwXGI+2pLMlOW3tAlTD5P
         vbGWmpXMIAUZ83qHbzf2Zw0z2OJ40r4qobuvG3hm13zN0RKXN2K18yP3eXVaaF+eBdB7
         Zsf7FM3yPDHU4auJLCe0bI9q9Hg82PcrYkurSlP2ekLyyzwqM2X3sA16kecxz9PeJOAy
         N2ORWo2hbF9cCDT4evL1LUQ1KzrScqi9ZCrMi14n07nfxVKx76X76pf7sO3qGb9MYQTF
         oxIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725947866; x=1726552666;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AXNNB2F38kuYNsFyFx8FeC4ii8KpvQhpKnyoK0gzIHI=;
        b=RPhr55EMb/ikAsnbUGs0fDQ1c5njqqSXn6DbtNmzxnbtH3JXmlHF5WhkbXSYD95x+5
         fZhmJWBElYZLxZU4Wftp/7uHG9lI9wofJRus1bGHakaJOAyB86IcIksx2GHNe4NFF+br
         ieUGhKq9so6uCPG3/02JUFcnXIg+yZOx9M/SiBWpYhOlxXowgeOHbLefz12hMJrzLvHB
         DYevhNa1NJeNGoeWGj86YwwdE5pYOJtZArWh8QkBRJubH3foEbOu6SyFFws1TlCxrGrf
         bqtBV22QDJPnkPzqjdgBYD1/WFB4EPMs30UwFG1h6p7NUeb82rU2xSpVMLpAR5UDICj3
         unGg==
X-Forwarded-Encrypted: i=1; AJvYcCV/OGRzbTvElJWgaoLDg74ujEyJ/7nZ7WGbHOQFYpQlQ0sxGDlCHDoCsqNHu22k7job4yiU6BlsOqKph98n@lists.linux.dev
X-Gm-Message-State: AOJu0YzpenoMwDHnL6eAIw3a2Dsihl59lmdqPUmQcoglyka0iXIWMlFS
	XvRND9YrZT9nWD3jUF5A7P0YROL99KFAxbcn1GDlLcWuBUeFNGCk
X-Google-Smtp-Source: AGHT+IFjODiZQZPml95Fz/+7rGWL/M0myDq5g3Q/4aNYVNWclwKIcU5MTnt6zT482xFtV267nvCdVA==
X-Received: by 2002:a05:6402:448e:b0:5c2:4cbe:ac21 with SMTP id 4fb4d7f45d1cf-5c4015dd1f5mr2226407a12.5.1725947865658;
        Mon, 09 Sep 2024 22:57:45 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p200300c78f2a8598b80c2d4e9a813f29.dip0.t-ipconnect.de. [2003:c7:8f2a:8598:b80c:2d4e:9a81:3f29])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c3ebd46909sm3979316a12.25.2024.09.09.22.57.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Sep 2024 22:57:45 -0700 (PDT)
Date: Tue, 10 Sep 2024 07:57:44 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 08/11] staging: rtl8723bs: Remove unused function dump_4_regs
Message-ID: <583ba389a269a11f4c2497ae5152ad8299d88455.1725826273.git.philipp.g.hortmann@gmail.com>
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

Remove unused function dump_4_regs.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_debug.c | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_debug.c b/drivers/staging/rtl8723bs/core/rtw_debug.c
index bfce632e037e..fb6cc1d18bba 100644
--- a/drivers/staging/rtl8723bs/core/rtw_debug.c
+++ b/drivers/staging/rtl8723bs/core/rtw_debug.c
@@ -10,15 +10,3 @@
 #include <hal_btcoex.h>
 
 #include <rtw_version.h>
-
-static void dump_4_regs(struct adapter *adapter, int offset)
-{
-	u32 reg[4];
-	int i;
-
-	for (i = 0; i < 4; i++)
-		reg[i] = rtw_read32(adapter, offset + i);
-
-	netdev_dbg(adapter->pnetdev, "0x%03x 0x%08x 0x%08x 0x%08x 0x%08x\n",
-		   i, reg[0], reg[1], reg[2], reg[3]);
-}
-- 
2.46.0

