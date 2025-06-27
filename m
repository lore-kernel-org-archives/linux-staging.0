Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7E071C6BE
	for <linux-staging@lists.linux.dev>; Fri, 27 Jun 2025 20:15:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751055332; cv=none; b=Ty8gzjXSHxw7PjUxJlXqrrl3VFPFhL6r16FDehRw/TlJcAFs6HYUcHcdVPUfd3yJLeLyW7gsy5jH8SdukRw9bz9sPHnxC8mYKe7ez4KDnC9V902KxZizXD6R6CWV/g8W1fezDIINvvuUgyYUHoeBgw3TNCz6/9Gml9OCQbFpFJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751055332; c=relaxed/simple;
	bh=fhJzl/BU8BwWcrvqa0wNq4MSNWvssLce9yTWXyJlRKw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K4BBe5uODBH9F0iAHEGP0PjGOM6N3fNpgY4s/a5En9I1QwlGhU6Al81UgP+QdYpzNDxieechuAgYSE9IaIeswZfW20uqBySRj59XR2/8esZsilnCkmFrgBVnfV4KrUuTh86mo7YGxfTE+on1FohiTmd1rVhgsAj20KieXzAwHg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AXiWznb2; arc=none smtp.client-ip=209.85.167.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AXiWznb2"
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-40af40aeef6so833191b6e.3
        for <linux-staging@lists.linux.dev>; Fri, 27 Jun 2025 13:15:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751055330; x=1751660130; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kEIb/b8zfSQ8Wgz/gF2ijAZBGf1xUf7mBAxLOW/TZ2A=;
        b=AXiWznb2gvv6y8xWzas5DywFk1t4zoWLUSgLdqWmuG4JoLyyEWctR7cPCmNHUNCYKo
         BBLir7ua8ki6lTT0W5NWIoR1HSqKbT+mFjGizjdmS0uQBdyCnc9glspx9XXnb75Mk03o
         jgjBMZ6xgMmA7YI0rtaPehuCJc2PT/XxC+b28kaNA80XHPXODnA6Is7lVbX9mOgEGTV1
         d34lQ3NJvXdRAlaWNZ3Ei5yhNhZs2nRcQY3ICLB+ZZMU+kKxy62PUvDGUXUCHY2c4ybT
         rH/Vw1g7X0tfKxddIv/D0Ty26sUO3l+vHbigMKzk96YLSnfaoZcYHAoCoteS79ffLdK6
         SIsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751055330; x=1751660130;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kEIb/b8zfSQ8Wgz/gF2ijAZBGf1xUf7mBAxLOW/TZ2A=;
        b=RZVWFyv2exyjRK/KFdTYB2wL0Ojug/itf/gssja0IN23ToqkDajYVDIWyabYI7tUz+
         Obhxbcvz0YLZ+Xl4nsoMEe4RtZyY6tNZqwSG6KIhgY/oZyV3w0xRohzSlsLjfLN2gO2+
         59TmJ8wt984yVNiJHtUMOds2oVx/v7pyc/W9TJylHfBTs3kuGS3AyKBSBRb/s4Qh7oje
         RwZbTBN52K5pGGLPgaIvp1JT4Ds0vWezTPIgzCX+zoMhxtGmYyxeM3IjdnVfplhiH9z4
         MDX+xGFGfkITJmlnuRnBi0XViPInuneKBlLf3ASQSVhqE8BqKHAlOWE6u2UI7vWLuUnW
         gJ0Q==
X-Forwarded-Encrypted: i=1; AJvYcCXXt/66xVNsaV24rj3+qCzZiDSaUMnHzYN3sAI9A6Jq52KQVxCvYFXB8i6WuwjjRRvwLi9COiUS47QQj63t@lists.linux.dev
X-Gm-Message-State: AOJu0YxR1Mp7TIhLBAd8oaFraQOqAjzE8pqFx2nALsWRBygaM2A0TRqf
	TZw3avOu1VtylsU6eb+huTt+QzY2r/3ruCe9ZIayeLfysGU+A43XnyL+pr51O3gYX+k=
X-Gm-Gg: ASbGncsYsI+0SvzMfjTN4rtGKf/jCg8V0rIakjXCH5VMr7L/Vz70koEVUW/j4fo4LX9
	jihZse8vjQpdbbvRKAEtcPf2W9huMYrz66HMRjJvGRhUjhdtZejPFP98sEeauVQFcbafhEk+PWd
	PSGX4cFXxkZwLz52Dx6L6wQgMBVkucJcoPHd23HgjxTefw3uC+BwSWJhJeQ5RDoV78d/7AVrozR
	fK1tmlkEoPouiBrxUYoFE6LpfU9I/XhAvPlfdjVV1bBdYR3jVDLX0Am8tYb4saNe391NqvJ650S
	RabzsRVJ8HOFfDKw/biC325DUU0CB3f8FK6bfIKBI6pGx96Hge0Lax32nJ45uU2XYL5YJw==
X-Google-Smtp-Source: AGHT+IELqMvmlnygIS4B9arBKFzvmzktHr65gCsThSoqSAND4qXrdXRwMi9SILSeCCyt72INteDqqA==
X-Received: by 2002:a05:6870:3118:b0:2d5:2955:aa6c with SMTP id 586e51a60fabf-2efed72bbd1mr2960606fac.31.1751055329792;
        Fri, 27 Jun 2025 13:15:29 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:f3a4:7b11:3bf4:5d7b])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-611b85c79e6sm335864eaf.38.2025.06.27.13.15.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 13:15:29 -0700 (PDT)
Date: Fri, 27 Jun 2025 23:15:27 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Abdalla Ahmad <Abdalla.Ahmad@sesame.org.jo>
Cc: Dave Penkler <dpenkler@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michael Rubin <matchstick@neverthere.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Paul =?iso-8859-1?Q?Retourn=E9?= <paul.retourne@orange.fr>,
	"open list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drivers: staging: gpib: minor fixes for some C macros.
Message-ID: <2cf34cff-717b-41b7-96ba-2041028bc0f0@suswa.mountain>
References: <20250627193613.552193-1-abdalla.ahmad@sesame.org.jo>
 <4edd380e-6314-4fa0-8051-ac55144e061d@suswa.mountain>
 <AM9PR08MB61145157B28A55649F155F2AA145A@AM9PR08MB6114.eurprd08.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <AM9PR08MB61145157B28A55649F155F2AA145A@AM9PR08MB6114.eurprd08.prod.outlook.com>

On Fri, Jun 27, 2025 at 07:53:21PM +0000, Abdalla Ahmad wrote:
> Hi
> 
> > This breaks the build.
> Sorry but how is this breaking the build? Putting checkpatch.pl aside, intuitively it makes sense to wrap long macros in parenthesis to avoid compile time errors and runtime bugs...
> 

Take a look at how the LINVAL define is used and then try building
the gpib_bitbang.o file.

$ make drivers/staging/gpib/gpio/gpib_bitbang.o 2>&1 | head -n 30
  CALL    scripts/checksyscalls.sh
  DESCEND objtool
  INSTALL libsubcmd_headers
  CC      drivers/staging/gpib/gpio/gpib_bitbang.o
In file included from ./include/linux/printk.h:616,
                 from ./include/asm-generic/bug.h:28,
                 from ./arch/x86/include/asm/bug.h:103,
                 from ./arch/x86/include/asm/alternative.h:9,
                 from ./arch/x86/include/asm/atomic.h:7,
                 from ./include/linux/atomic.h:7,
                 from ./drivers/staging/gpib/include/gpib_types.h:12,
                 from ./drivers/staging/gpib/include/gpibP.h:12,
                 from drivers/staging/gpib/gpio/gpib_bitbang.c:56:
drivers/staging/gpib/gpio/gpib_bitbang.c: In function ‘bb_read’:
<command-line>: warning: format ‘%d’ expects a matching ‘int’ argument [-Wformat=]
./include/linux/dynamic_debug.h:224:29: note: in definition of macro ‘__dynamic_func_call_cls’
  224 |                 func(&id, ##__VA_ARGS__);                       \
      |                             ^~~~~~~~~~~
./include/linux/dynamic_debug.h:250:9: note: in expansion of macro ‘_dynamic_func_call_cls’
  250 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
      |         ^~~~~~~~~~~~~~~~~~~~~~
./include/linux/dynamic_debug.h:273:9: note: in expansion of macro ‘_dynamic_func_call’
  273 |         _dynamic_func_call(fmt, __dynamic_dev_dbg,              \
      |         ^~~~~~~~~~~~~~~~~~
./include/linux/dev_printk.h:165:9: note: in expansion of macro ‘dynamic_dev_dbg’
  165 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
      |         ^~~~~~~~~~~~~~~
drivers/staging/gpib/gpio/gpib_bitbang.c:28:21: note: in expansion of macro ‘KBUILD_MODNAME’
   28 | #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
      |                     ^~~~~~~~~~~~~~

regards,
dan carpenter

