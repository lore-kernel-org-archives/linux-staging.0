Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADE763A4F59
	for <linux-staging@lists.linux.dev>; Fri, 22 May 2026 05:49:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779428983; cv=none; b=BuJIOG3V7obtdqf6VxAECroOPujXC58jSi2mx90xfLi4k6SV9BhaCP1iMEHov0NHU59B3zWlHTgQlnFabCdmXsXwPK59Q4vNReWwEn031fFQ4OTCndPUVpcp7cNwAy24qBVwIXqTinrBIlVI0Ob0jF6rs9B2WRXpV4s5/H7tYx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779428983; c=relaxed/simple;
	bh=z1tX1iMyFpcdaPOk5hdbTsr5d1cn2yP505I4SiLMWzE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n7CcqnG26363qdoaG9ko+X6Yj40PgjAQDu8l5qq+xABJzmGkcXuNEwj+F4IX6B4FkU+cyteMVNZ192xqcuMv4Sg7Yw5/5Mmng74Etim6JEJKv3+tLN4q432SV1dDsP0t0wzyPtv+ksDGOs+a8z1gDa3ZlSQQ69vhJESqK/vgPLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HrJlx9tK; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HrJlx9tK"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-48ff4f8ef0dso74037795e9.3
        for <linux-staging@lists.linux.dev>; Thu, 21 May 2026 22:49:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779428980; x=1780033780; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7HhubsJGAdfca5NZ0I/ZtJFmFGZaBjI8keu9ij2IFCE=;
        b=HrJlx9tKW15ZJHfI3/4nuqZwDXi36DHfEXeDVEqeyMwGDZoUURlzeHJNFEP8Oz8jjZ
         n/0oaucuwZIu+NHSqk+sH1uVfwIFl7oEjs2ZHYxnnzffnzKyVHB7EALcpVQpx6cbvBRE
         yuYaprfFp34Sf9TK/50gb5JBeJwHFwN2aCNvyMrfwGqk9B3VY6weOr2jCJyI8xlfUCUT
         I6QePYifYpO3r0opx0v/ekp5v9/xI59sqPHz392WPeKieKcDNfJo+w7fHmITWuS6GJOp
         S68k5PAaZ9w3e83x/dR3Gk0phKWKXwjZpY3RO1mWNW6/9EZpijIe0X6Wydv3HCRjfjuD
         UVuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779428980; x=1780033780;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7HhubsJGAdfca5NZ0I/ZtJFmFGZaBjI8keu9ij2IFCE=;
        b=tN+l6WwUVgXslwjVCyfAig7xBGWstUQOJpIn99eLG6JABcpYXACKwJsh1qKPz0bIU8
         1GoXgb14UE1nfu+Rc+L5r5pPNT6w4fZVSQjoKQjQKzLmmkHCUnCxUc4SZqp1YcKXxlNm
         Zxn7dzWvN6K4P8aFuGkfhXamumVjSbzJaF5otJdj8P4bc8vpAKS8yfWtgmCLATc5ftz9
         mlNfdE/9SVL2e71mJmOqordkCAe5hl+3Zw1KG8b7sIZHs0w7jvg47leehYPb0BpcnNDa
         xf6nHu4TFF+Y3dM40OgGYy2V+5BBtMu8n/2AGbo+a58ZeSoz4xqgtwzRfNEjx370eG8z
         k0Gg==
X-Forwarded-Encrypted: i=1; AFNElJ/loVcpswke3Q30crmCsBLaIj/Yd7+vWq/yeBZSGrbDwRYdfiC3Tjsw448CUz200EJuY9/c4pA1BFZ9x8Po@lists.linux.dev
X-Gm-Message-State: AOJu0YwaPJJGCCd65kJs1VHw9QONqmSrhqURmKYwVbzTThzEuFkary5G
	cxr9phqYgRMQmh4Z5/u9O6GdzzvQel7YE/y2j51bWBy3f/5HxzF2vhC9
X-Gm-Gg: Acq92OGR3z6j/9ippkwpk3DjiLhI5AsYNRADUkWfo5izwjlENLbsq671N8JzismxqRo
	lBxGmI4O6xgYEhe2X3EMsna34FprgJHMVWmiWcLiWXUjWdAmafoHnEO85iMN3FGNxzNGOYAK9X/
	4t69wOmm/v4vupt5v/DcC7tnPLd9BQuvvx+lJdRSHRdLgpThV6BLDYbNM+kutS30GQ3AyI/VZUV
	y1nTXVDWZuIKxVHuQw70hr4wKIanuUEMVTSgn487P+fAsfBt4D0SRe3uJvLgOclElTKmMrSqWM/
	sBT9Uo0tKT4tq7hQqdHbjgVeU7l2NrO/jEOcsj+UVC/mVzp7d9aCWc1w+CCPRA5daD+ELGq0xVB
	G9HU/qEzQuEuL+x6AVc0x0pAqjP+VtOgmsJrKIUQzyK3A1ks+ldY9pFc6WSjq/ykhDB2B0O0lBR
	a8dSZONass4hR4R16LwaN6OXFYc396Ihnwug==
X-Received: by 2002:a05:600c:46cb:b0:489:1c1f:35f1 with SMTP id 5b1f17b1804b1-49042482762mr23361615e9.4.1779428980002;
        Thu, 21 May 2026 22:49:40 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eb6d5caeesm1380659f8f.29.2026.05.21.22.49.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 22:49:39 -0700 (PDT)
Date: Fri, 22 May 2026 08:49:36 +0300
From: Dan Carpenter <error27@gmail.com>
To: Michail Tatas <michail.tatas@gmail.com>
Cc: sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com,
	gregkh@linuxfoundation.org, linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Staging: sm750fb: Change camelCase to snake_case
Message-ID: <ag_ucCZEOnZuJOCz@stanley.mountain>
References: <ag-XlRifxjqXF-Zx@michalis-linux>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ag-XlRifxjqXF-Zx@michalis-linux>

On Fri, May 22, 2026 at 02:39:01AM +0300, Michail Tatas wrote:
> Change variable names from camelCase to snake_case
> as per the Linux Kernel standards.
> 
> These changes remove 9 CHECK messages from checkpatch.pl
> regarding sm750.c, sm750.h and sm750_hw.c
> 
> Tested changes by building the module sm750fb/

Don't put this kind of meta comment in the commit message.  Put it
under the --- cur off line.

Please wait a day between resends.

I don't think you're working against the correct staging-next
tree.

regards,
dan carpenter

