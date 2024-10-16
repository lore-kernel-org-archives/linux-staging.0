Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D614E522A
	for <linux-staging@lists.linux.dev>; Wed, 16 Oct 2024 12:49:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729083000; cv=none; b=Di7CuVsZASaZHjeU+X80ZXdlrgWB9lWwu/rueZOaE9298/JjdwcQRRml0FJ3IPAeEs+WoTbDS+nLlJPKiPVZkl6zm5yLj6LfXQYxYn71HFj2LcGjy/RTWzPG4T7GTLVO5Q7cMf/6pOXrlVAjYeBjXQzOLkYVxWdKweZjTXDV47Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729083000; c=relaxed/simple;
	bh=8KrfVMzR4HZBq0r4O4lrXKs1N36xXxex/E+Tj+FkITo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qi1VSx04AGtPz0RinOOH0lZwDX+a1lszUZ7ZuMlAx/7ofVHSTv4XgshAIfPOTgC68ukBO830KyxpFbUx7+5yMaKHYOx+objN+/u38OI2nqFTXk5JnG30w/ac/DVj7sySZWN1hVMGUWLpmUK04t7HSpDzN7puOBmXkrDEVCMTd3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kxfmx+//; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kxfmx+//"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-431481433bdso13953815e9.3
        for <linux-staging@lists.linux.dev>; Wed, 16 Oct 2024 05:49:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729082997; x=1729687797; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iwGHiTybTT+PY14T21Xo2nguWPMWnszXygk/5cD3oEE=;
        b=kxfmx+//6LyIUDsyVDRU83zM++YG4bIPP2FQli++4yPiHtzReM/bQ2riX58dLURwVC
         5J369KGML8pAGDnkKxtR0OglLRivRSZSR5gE8x2Ol2IXBYpkLtPFMsxpmcgNUcnP9N8V
         SFlIEU0lcmlXHSqeVGu7OYJbrH6FpQFyBOToaXKV53lRCwT0q02q/vJzAH3w7Nc1sEl8
         s7KzJSKk1RYd/fTN6oeAqh3QhHTI0gzrvh8Sw0JgHk+OBwsHVIT+yB1k368jMntbDS+O
         FQEN7wInl3WcYlMk108P98uTBz36exBN0itMOhYLxKQQOe5EPeuoME7fHDS5oTP85M5z
         eWoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729082997; x=1729687797;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iwGHiTybTT+PY14T21Xo2nguWPMWnszXygk/5cD3oEE=;
        b=Zu0GrPeS13gpN44/DdWRLeMGKq+wuSivMeosBi1G/2M5RSKhIpFvOf0QNWPOSZOoaF
         aprm9gIta8xaq1OG874T+j6zIa3KO9Bvgcr2sqfbBsW47kPKn/YAPWd8C8OcD51hKe0i
         c6Wm6SlGbCyXI1MoyFaMeKh4caoaxMVfOrGYQarQi3tsoQn/uRqtNkeQkR44xphFBPcP
         /ioDij/TMWfepozvjlh7LJxx+FzZciSLpSDhY1ef2co2A0MTHaelbyvgeKzm+BOneOM8
         kqyZp17Wf3AY7lZ3MwSgKuMF35trA9ckXhTHYUzEHGlXuK43duzs6C3gQaxHJDV6lOz6
         W8VA==
X-Forwarded-Encrypted: i=1; AJvYcCVOKJB+cxgL2/CmT8f87K+6CO9Z1yUTgGHtRy0erV+j/f8J6qIKEl7PZFYLdDAhiyynaWzSIf5RGERWS38A@lists.linux.dev
X-Gm-Message-State: AOJu0YyR+fkWlcJypCsEb/+ABv7rQGDsMHvDzu/xTIhK7ukaGCIjXISO
	gj1PzjHtQlgqm8GKqEj3HfuDQfhsDJ2ifsuQEWEekdVQPubhxd5k
X-Google-Smtp-Source: AGHT+IHzm2MWkhXUwz3Xjr6o0izVZW34IIcoET6JDNtClQdSpXzYxggMPJL9h9aaLUN26dpvqgK3uw==
X-Received: by 2002:a05:600c:5117:b0:42c:b9c7:f54b with SMTP id 5b1f17b1804b1-4311dee59aamr182203335e9.16.1729082996762;
        Wed, 16 Oct 2024 05:49:56 -0700 (PDT)
Received: from egonzo (82-64-73-52.subs.proxad.net. [82.64.73.52])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4313f6c5524sm48257745e9.44.2024.10.16.05.49.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Oct 2024 05:49:56 -0700 (PDT)
Date: Wed, 16 Oct 2024 14:49:54 +0200
From: Dave Penkler <dpenkler@gmail.com>
To: Rohit Chavan <roheetchavan@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: gpib: Replace kmalloc/memset with kzalloc.
Message-ID: <Zw-2cszB8TisYXU3@egonzo>
References: <20241016103406.1618448-1-roheetchavan@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241016103406.1618448-1-roheetchavan@gmail.com>

On Wed, Oct 16, 2024 at 04:04:06PM +0530, Rohit Chavan wrote:
> This patch replaces kmalloc + memset with kzalloc in the GPIB driver.
> 
> Signed-off-by: Rohit Chavan <roheetchavan@gmail.com>
> ---
> Changes since v1:
>  - Merge similar patches in single one
>  - Make commit message concise
> ---
>  drivers/staging/gpib/agilent_82350b/agilent_82350b.c | 3 +--
>  drivers/staging/gpib/cb7210/cb7210.c                 | 3 +--
>  drivers/staging/gpib/gpio/gpib_bitbang.c             | 3 +--
>  drivers/staging/gpib/hp_82335/hp82335.c              | 3 +--
>  drivers/staging/gpib/hp_82341/hp_82341.c             | 3 +--
>  drivers/staging/gpib/ines/ines_gpib.c                | 3 +--
>  drivers/staging/gpib/tnt4882/mite.c                  | 4 +---
>  drivers/staging/gpib/tnt4882/tnt4882_gpib.c          | 3 +--
>  8 files changed, 8 insertions(+), 17 deletions(-)
> 
Reviewed-by: Dave Penkler <dpenkler@gmail.com>
