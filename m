Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1CB71EEF9
	for <linux-staging@lists.linux.dev>; Sun, 15 Dec 2024 23:23:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734305040; cv=none; b=YPcYpT/2nKq29QkxxuCq/yEJt0rvdB66cwUxfFlLWYb4Ded+M1N/cBCbapZ6BBvH+WQ/rLZbdyAQRfYYvzHvSriWUu/Yp4K6DeWGSrsvyW8YmqaYRiNhJmymOJu+VC4KOz/oA7tp2A5b8s/0NJORSGqBeWQACvmHsff0vSiyIlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734305040; c=relaxed/simple;
	bh=h0FYrYATPQdlmulxPGcmaER2U5+TMtyT0/7oQz10eZM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CQDe4taBadSqWcuo+2eP0p5K44X6aH+az0tx53iplbsmhI1WmI/WWwEQNTXhWR0cTw9z19QG/C9e/6mfvixrqEJCdw5eDtAqxXchFpa+ogLWLPRxdVRf8V0nj3SRpnTg69PyrwXixgQW2/smmWYfzUbynneeVwQMYQyGSlh0IQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gQMt10AN; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gQMt10AN"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2166360285dso29244085ad.1
        for <linux-staging@lists.linux.dev>; Sun, 15 Dec 2024 15:23:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734305038; x=1734909838; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nWWZuxEzXqbDg7/DsXgrSxhRT6PifOagMeAUD/7eOt0=;
        b=gQMt10ANX94NcdqmzkML7HYSjxzAWUPk8tzEXifpC9AOrI517UcypUi89aGz3V+I60
         DsWDeGO+5+lrwszU+NaG3uHz1Xha8WVMXyooo8nVkejFODERFgkgPt3Twzbbvfwmne0G
         w1FaUDDhBy6BTmv2eJ5O3Brw60FWCJP9NpjnlZAtuEuIBJpo5+Ey/WSEOFpvXa9Ly8rp
         8vUerjAuK8jZbH+KSuSDF8GoLYNqiTCxDSWEoFTT+9wGYvMGwHqIJo2Pw3OjOfjygcUd
         /LKlrGUsjrKB85UdcdRTquHAJjrfHT7SPACCfGyJPF1/SWj1j8BLSUW4XxAIg/LQ9GQb
         ah2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734305038; x=1734909838;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nWWZuxEzXqbDg7/DsXgrSxhRT6PifOagMeAUD/7eOt0=;
        b=T00bd2+nWrZvLX8i8yfQbc6GWhNi5cHxOa9psv5x5JmSHSP5dDxcmRmBn4VZlhcf3G
         2EylNUb1jC2FUfAwAFXd8I08uYT2NjFIEh2JHUeOHJ8IJUldL5+ysbem+8mhWeyy0w8e
         IWDWtndKkgvHx0nf+L56/ynL9kRgRIcFfgL0IC1WLZ1SYfNySJS6sWL6CIRfiPQp+uvi
         pEgiT7kw19IKPXY8kr5XbWjhvq/s8rxXcpvbF5JehWHi8sGHS0yUowfY+Yn7EWu5o22n
         k5LSGBN0by5io0YzaOxbpbcKPaTWCKrH8qGNym51OXLM8q5fW44jo2Owjlq49AY5h67M
         K73g==
X-Forwarded-Encrypted: i=1; AJvYcCUie3Bpvmp6m0FyVS4huhh9fq/rRzb1GqffG14k44gQ33f7Z+ygxrgfkVZzcgTQO0fsCWeQ3mutWumDroWa@lists.linux.dev
X-Gm-Message-State: AOJu0Yxbz+bLZS88m3Za9U6AV6rNBtJyRFDuIxxXw+FMAD36tYFasFgf
	x0EsoCokK7+x8u2ntcYq2loTaZR0VuowVfwafgKqfS5m5kbDclNO
X-Gm-Gg: ASbGncs1idGWJJoNhlnv9Nzm819Zy8K1H9eZ4Ns44tU4XA9/WXc3XVUAAIiWv+QgLbB
	YG9y36snXjAzDvPXMxV7+3hkzPwVOOVvzPrI5jKhRe8AzplBlHPAsyNDJrIScUVxo8KUvPJlOqu
	ee6Xe2qqsXlgzjBWcK+2BcninpJMjBYafsIXzAi4MYrbvDWOOZaTfCYyZaeySpvr381l2k6wUOp
	6UiwqAI6ZxRh2beZLwEqP3t+hoWY3HFXfpyppdKqKAcxalJRFy5zbGLBX5hOaWsTkKRYg==
X-Google-Smtp-Source: AGHT+IHcFri9lc9NhsBUklSUjNqdUKX6evC5mOSz6ro40NIxE+FHD8rBUZNEsndpRhsnA81fnoOyqA==
X-Received: by 2002:a17:903:1c6:b0:215:b18d:ef with SMTP id d9443c01a7336-218929e8849mr147905365ad.25.1734305037965;
        Sun, 15 Dec 2024 15:23:57 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-218a1e65461sm31001025ad.238.2024.12.15.15.23.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Dec 2024 15:23:57 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 15 Dec 2024 15:23:55 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Dave Penkler <dpenkler@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, sfr@canb.auug.org.au
Subject: Re: [PATCH] staging: gpib: Workaround for ppc build failure
Message-ID: <b6102c6b-693f-4237-8c0c-83c5936aab3c@roeck-us.net>
References: <20241204134736.6660-1-dpenkler@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241204134736.6660-1-dpenkler@gmail.com>

On Wed, Dec 04, 2024 at 02:47:36PM +0100, Dave Penkler wrote:
> Make GPIB_FMH depend on !PPC
> 
> Reported_by: Stephen Rothwell <sfr@canb.auug.org.au>
> Link: https://lore.kernel.org/all/20241015165538.634707e5@canb.auug.org.au/
> 
> Signed-off-by: Dave Penkler <dpenkler@gmail.com>

This patch just exposes other build failures, for example
i386:allyesconfig or x86_64:allyesconfig.

Error log:
x86_64-linux-ld: vmlinux.o: in function `fmh_gpib_t1_delay':
fmh_gpib.c:(.text+0xfd49dbd): undefined reference to `nec7210_t1_delay'

There are many more missing functions. FWIW, I don't know how this is
supposed to work in the first place, since pretty much all gpib Makefiles
say

obj-m += <object file>

meaning they won't be built with allyesconfig. fmh_gpib is the only
exception with

obj-$(CONFIG_GPIB_FMH) += fmh_gpib.o

which means it _will_ be built with allyesconfig. So it is not surprising
that it fails to link allyesconfig builds. Actually, it will fail all builds
with CONFIG_GPIB_FMH=y.

Guenter
