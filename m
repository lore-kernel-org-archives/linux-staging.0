Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 846221DF248
	for <linux-staging@lists.linux.dev>; Thu, 20 Mar 2025 08:16:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742458608; cv=none; b=p+zih8KYqb4XsB29N8u6knwGfT8w/SZSf22LX0/7wvI7Dg0jxK3qmuXHFmIlwfHAIw9JIyBRG4ILM0NrNKqdrYVSQI1qpj4m+jVX3Nzq9WKJMpRiTcC+yMUSOEw0GQo9P9IZQQJiPX2ZmGIX0EXP7aCoNC0v+UZRIdtg6adBeDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742458608; c=relaxed/simple;
	bh=ZaxPu7VnsuF+LQquHXDhEfXNfIE4bjmFe7vB9NQGBcs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BtkREstnbqFZKPY0L4EHit87Drtz/61QJRiO2sy/PZkB9ZHUW8rYf3AV/ip3UpjPpkekfCRIFF3vL/rVtk6goBdlYCArep7wnt10D4KklMafGFz+94wKL3WEj8APpT6ZEwnBjvcemzslsfhkue9lOQBpSC0TiYmN+cid0G78OJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JCMvcsAI; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JCMvcsAI"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3914a5def6bso238745f8f.1
        for <linux-staging@lists.linux.dev>; Thu, 20 Mar 2025 01:16:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742458604; x=1743063404; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LfxEvaLbHn08ch5Af9qE/losOCpYioxFAsYk01h6DAQ=;
        b=JCMvcsAIhNjARubXJf9JALdl3/zOMDkrROM5EAbS/68llHSDGmPB2ost5v8lwD/zFs
         mI38UkdXWeb0kXkXkXjZXtH2KDgLHNcTP3JWeobHIGN7wNAgnLEqR7aZuav3pGlKVLXi
         M26fCYR/iBcBtsmOUYFY+xkZl105v9ScvE/psZ0UJc7U+RtluEzkqbf6uO7INoCQI8X4
         NL84i4ldipcYe9NWtb9gtksH0nDrrUkChj7/tKJl1XQpLWqqdor5YOB7KqCTiEGpqC+X
         bHM46yutAI3AlJbvxpCP0egby/JVTK98IvT0Ehb199XgLJC4RZja0vQARiW/weKnBlfm
         nZ2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742458604; x=1743063404;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LfxEvaLbHn08ch5Af9qE/losOCpYioxFAsYk01h6DAQ=;
        b=Ke4WjsF4qa25je2+VF8Nbrr4trSKIInqWAdYlAWdIMAe019azWrBJo+V2gg5Ap5rH1
         4dzegiu2tGe7Ujoi9/3YNgq8WiOi01WQA0uPvqe8towdOGQymsUgkXmcWJb1mWQ/pnFl
         Qfy2sRKVhxHHE8ZE9u8JUfGU2FSqjVr6wwEKHgglKkiolIkHonhbyl5HNfKi8Gc/1ZcN
         gjjb4K0X5b8dIv9WGL+f+9AQDzDGyUT9jYy1vcu7SPcw1Nlwyw/jN0f+hvoxdOM/4/a0
         HqMOFogSWSDEeJ9F/BRbrVCPScc2TQu7LYQoK9pCGgklM9STReztGCGoihiSIgXLteSR
         SKog==
X-Forwarded-Encrypted: i=1; AJvYcCWOnSWIOWWTWIbadwDjysF/wUJFheyOinYCghr/nu02hmSQ9F8tpUwR2x75Fk0jf8wd21AjWawEIvZozBys@lists.linux.dev
X-Gm-Message-State: AOJu0YxrUQ5fVxvIyOhu9Pz2yOdJeVaJyPZurwM7K2xwXz+MWyM6H65Y
	iYAMkxLc5dbIKBVmSe5GxZtsVjDGc+zJFUo2EsvoKcENDSKZelpb
X-Gm-Gg: ASbGncsXLGX/h71JzO5ommE8Qik/W9pwOaatlQr76vMhJnC2PjeXzXhgZvrwHXBznTp
	8r1+eA4Gw5I+glXGSz26Xz9wCAU5cQZKcsA394ZhNv6AGGo3Yem9Dgj1bjGJSGsiQoGAmxyv8YN
	4wGmr9eOjklqtkJGtH+xU6pQssipfnDvBcfQu+az5OwJfIuxlrZPjcUHKPQQmZZvIFra7eTqYkE
	dmbDjZCNb70TZRqJdfQP8WuQiHGjvqN9BhyJfMzAEGlfRqW2kutrH8sfeMXF9TctapleG2m8n5Q
	F9bp+V8N2smiVxOaARUfSy3Jl3m57fE8xdhXWMV3EIEaSqmaxPiEQotgpIHD
X-Google-Smtp-Source: AGHT+IEnHaiVC24ef3meYMs3KCsnv7gtLUqxu51wjDeR59W8gyJRSgnTuyswcVHJ1xe9X8LX3Q4YXQ==
X-Received: by 2002:a5d:5f96:0:b0:390:f55b:ba94 with SMTP id ffacd0b85a97d-399739c0968mr7136652f8f.13.1742458603480;
        Thu, 20 Mar 2025 01:16:43 -0700 (PDT)
Received: from egonzo (82-64-73-52.subs.proxad.net. [82.64.73.52])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395c7df344dsm23735642f8f.10.2025.03.20.01.16.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Mar 2025 01:16:42 -0700 (PDT)
Date: Thu, 20 Mar 2025 09:16:40 +0100
From: Dave Penkler <dpenkler@gmail.com>
To: Michael Rubin <matchstick@neverthere.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 0/2] Correct CamelCase drivers/staging/gpib
Message-ID: <Z9vO6CyFBNzTpvjO@egonzo>
References: <20250319211827.9854-1-matchstick@neverthere.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250319211827.9854-1-matchstick@neverthere.org>

On Wed, Mar 19, 2025 at 09:18:25PM +0000, Michael Rubin wrote:
> staging: gpib: Correct CamelCase and remove duplicate entries for bus control
> lines.
> 
> Adhere to Linux kernel coding style.
> 
> Reported by checkpatch
> 
> CHECK: Avoid CamelCase
> 
> * Patch 1: "staging: gpib: Correct CamelCase for BUS constants"
>   * Removes duplicate entries and corrcts Bus with BUS
> 
> * Patch 2: "staging: gpib: Correct CamelCase for VALID enums"
>   * Replaces Valid with VALID
> 
> [PATCH v1 01/02] staging: gpib: Correct CamelCase for BUS constants
> [PATCH v1 02/02] staging: gpib: Correct CamelCase for VALID enums
> 
> Michael Rubin (2):
>  .../gpib/agilent_82357a/agilent_82357a.c      | 18 ++++++------
>  drivers/staging/gpib/cb7210/cb7210.c          | 18 ++++++------
>  drivers/staging/gpib/common/iblib.c           |  8 ++---
>  drivers/staging/gpib/eastwood/fluke_gpib.c    | 18 ++++++------
>  drivers/staging/gpib/fmh_gpib/fmh_gpib.c      | 18 ++++++------
>  drivers/staging/gpib/gpio/gpib_bitbang.c      | 18 ++++++------
>  drivers/staging/gpib/hp_82341/hp_82341.c      |  2 +-
>  drivers/staging/gpib/ines/ines_gpib.c         | 18 ++++++------
>  .../gpib/lpvo_usb_gpib/lpvo_usb_gpib.c        | 18 ++++++------
>  drivers/staging/gpib/ni_usb/ni_usb_gpib.c     | 18 ++++++------
>  drivers/staging/gpib/tms9914/tms9914.c        | 18 ++++++------
>  drivers/staging/gpib/tnt4882/tnt4882_gpib.c   | 18 ++++++------
>  drivers/staging/gpib/uapi/gpib_user.h         | 29 ++++++-------------
>  13 files changed, 104 insertions(+), 115 deletions(-)
> 
> -- 
> 2.43.0
> 
I will be releasing a new user part and will make a compat include there.
Acked-By: Dave Penkler <dpenkler@gmail.com>
