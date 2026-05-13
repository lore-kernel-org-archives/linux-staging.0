Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AA69239E75
	for <linux-staging@lists.linux.dev>; Wed, 13 May 2026 07:00:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778655626; cv=none; b=HTKXiBCSXQb1BNoq7y8cCZZ8aDUqW6emQelt2TebA+fxZigOe590AOpC+j7oDXG95QYrr3uvhBdUvej/lCC08F/O1wlNfGCVQeE4tqfE5FKXAspOelt7B0pwaQpWCal8RWD7k+xYlop1s3LQxUYSe8SSKA6LpCuPIY3N7/09wKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778655626; c=relaxed/simple;
	bh=MFN9/QoNknbsqvcPfXG8PDiKo1RlCEzFG6pJYopYdkM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YtBWH8gEOOYAgCEFMvibIkl3MsrVUtz8HNHTpO5dxlURshzgiaAtxFGYQteSuKx8TlOFC0G+fb0yjir+1i4miXzEAexOxRIgFsPSYWuENqZ5nP1E7O2KJgXZgTqAnee7AywcBX4k/kUM6H/LahFuN+Fl8mWLzfaTO8WzN6aZUI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k5N3mnux; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k5N3mnux"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-449de065cb3so5769675f8f.2
        for <linux-staging@lists.linux.dev>; Wed, 13 May 2026 00:00:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778655624; x=1779260424; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KWUn8+SjlDuoSwuw8nKOZYEXk7UtcnUYxUiUlW/Jo5w=;
        b=k5N3mnuxbQCav0GA/jr3xxltuINfxBMpDkoDi/dkWfVC5xfQgRcvQjRkfIU/M8lHK/
         AI2z4aUDhTYHycvhh3gCrQtfh76+51HJAF0nWkwgIEkdoEq3/FWr+yMpAervS+tiA7yU
         69QAdWcLSXFNbTJH4WE/XsbZks+h7ffUyIfVhCJEJsy8uJEnYDNFky9fYS1eMp7gh6gs
         Q9HBT3M9KPDB/4EOs5ljf2Zll8mrQx+AnoUZ+Dhw86t7wt1ee+SUg57J6he5QUvuCkLE
         4F3+WAEkPDxFGkItZGTEq0FhyqWZrmN8Vq9eTY6lI0MGWA4gNvt4OLLQebTNJYHBKtCe
         3UqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778655624; x=1779260424;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KWUn8+SjlDuoSwuw8nKOZYEXk7UtcnUYxUiUlW/Jo5w=;
        b=FPFnRjXm1W3a8tIWFUbF8z/GdDaeeiBBrql0tH36hzAYagud8Tl/RKwNrzbR7kdTON
         unfQv/wrCcJtK+VMx6r4DiPHOpmgtRW579lM9FwKcbkLX6Zn1vWmB5qB13a6+nHHIFoV
         McgHWyYHTktYfpivivGsBKXZQpO6px8lTFDoGbfQ0J1VsR5wPA2uiZenUgWbsbun0rqB
         xS1/tKaWmRaOU6VCxbWvCoVOKHL5OxD9z9fE7SLdiqtT70yAWz4Ptcc/jNWQFdDN0yox
         uQYJR76lLU5kjDIhQNGi1IcWT3g6oGX403tmlGX4p01gZQEyuNcS1wxGmROqaQOAn+Ha
         47eQ==
X-Forwarded-Encrypted: i=1; AFNElJ8MfQttTWMM1PWbij2b+qRxnGTBh+01WcYw4wlEN3S8ruKMOYBQsnT4hFrP7HQY8SvVgOuuhAaxotV0+UYO@lists.linux.dev
X-Gm-Message-State: AOJu0Yz8QGvetuAwTFKOnmmqvPvYg3N6DdHs32iW34Hh4IoNiRpw2MCL
	lR0mnnlw+mEE8oXrsjqC8Njn0HQ6T44My+jFUiB+fP+d26CKNO9vdJ1S
X-Gm-Gg: Acq92OFiqzdMfDuEhUx9E5IXpA6+PpeZZu4ll6y0w977YUxSlp6rZ0uDtZ8xAbcT75p
	XLLzX2U1Otlg9KvLdHMZuFprThXr1/0s2GzwD8zOQk70vdenay0FdAZKDd8Iv4I7KA8vpJgf01g
	WY1SYlVj4/g1MW9yObTkMleQYjc5TVHYoitmVeV/t3NvJjoFHyydb2aDyCVLvGH4O9J/EfgAiNn
	eiCV3AkCkiZczez45GOM6Z4kU89/Xi7cEVFq+jtWWmWrlhWlYCUHCmEMEWTj4SjJjLKBW8cZMb3
	uAaqC67hXMhiLpYKJUxbg5zLXt+BnkGQ/A2rpaeRJ61PuvCjyawr/u9GX1qMS1BJuVVIZTV144N
	npfs/KjSmKVoiUtxEF7rbKQtB4c+5MyremVVXbIcveNZeIoITHpB3RkwcrCYxvish8uV3myAQkm
	aTkPdYNUclvXMnnZgNJeahm9P8VKH7uQ==
X-Received: by 2002:a05:6000:2586:b0:452:c246:ab79 with SMTP id ffacd0b85a97d-45c79586435mr2329827f8f.14.1778655623487;
        Wed, 13 May 2026 00:00:23 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-454913049ecsm37112411f8f.19.2026.05.13.00.00.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 00:00:21 -0700 (PDT)
Date: Wed, 13 May 2026 10:00:18 +0300
From: Dan Carpenter <error27@gmail.com>
To: Tomasz Unger <tomasz.unger@yahoo.pl>
Cc: Andy Shevchenko <andy@kernel.org>, Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH v3] staging: media: atomisp: remove stale "Generated
 code" comments
Message-ID: <agQhgsgYJfizeLuk@stanley.mountain>
References: <20260512-atomisp-remove-generated-comment-v3-1-97930e4e1ca8.ref@yahoo.pl>
 <20260512-atomisp-remove-generated-comment-v3-1-97930e4e1ca8@yahoo.pl>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260512-atomisp-remove-generated-comment-v3-1-97930e4e1ca8@yahoo.pl>

On Tue, May 12, 2026 at 08:10:52PM +0200, Tomasz Unger wrote:
> Remove the "Generated code: do not edit or commmit." comments and
> the resulting double blank lines from five files. This code is coupled
> with legacy firmware and will never be re-generated, so the comment
> is misleading and should be dropped entirely rather than having its
> typo fixed.
> 
> Suggested-by: Dan Carpenter <error27@gmail.com>

I didn't really suggest it.  I just pointed out that you need to
delete the blank line following it so the right way to do this would
be to put a little note under the ---


> Signed-off-by: Tomasz Unger <tomasz.unger@yahoo.pl>
> ---
  ^^^
cut off line, here.

v3: remove trailing blank lines (as noted by Dan Carpenter)

Although I'm also happy to boost my tag count so I don't really mind
being credited either.

regards,
dan carpenter

