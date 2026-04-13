Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8323A36A01E
	for <linux-staging@lists.linux.dev>; Mon, 13 Apr 2026 10:40:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776076801; cv=none; b=MCrdAF9i1A0hz6o+xyfl063U3ujr58QKuy0pbWuUfgRP36+7mA/UU6f90UJuLTg18AwUBVDpQT0tjwRyZ1hsQW8X0DS3gE5IjzVGzVV200kABpVD4o9exa+lTKdyRao8zkS0Dv6Xr3qcqexPJxU7N3lgWK2P5pOw+T7EwoT73Vg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776076801; c=relaxed/simple;
	bh=QNf9fYuRbV6pofyWiCvhwQ8+2qT1V/f57gWB0ktbdBE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LLMRJlst8DXP2V/yLaW8PGhvNFnGP4sALR8EK3l0yBETMpo4OuXr4OHCPj4wK9UQcj6eqFqQnTska3p8mWV/BHz567nJxq80Kn9QdyHujuQg9uznvKNf5y9IhXG0Uh/gMzQDHC+UrNBhJ9kBYeUAGGbt6KybeCRbvGHX37ISKXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GE+d9W9i; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GE+d9W9i"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-488a8ca4aadso49910875e9.3
        for <linux-staging@lists.linux.dev>; Mon, 13 Apr 2026 03:40:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776076799; x=1776681599; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=M3Qpde+l3zSHqtGuk+YhxsSmgAud6Ug9oUZZ4dBVL5c=;
        b=GE+d9W9ikIB0dCYQ7iV4nIEAEdIgbBHtKCNgLlXRqbOVt29X6x9W2KUqILDFcQLz3t
         OQ/gnhbWPiMr1oMyZbjpiz6yBlOdlvrMw1ysnr9cxoxOXJD7JxDY5fKKnjAgrEV7l+dh
         ZlBTOWbkDm9eOgwAuUCLCEXndGJwPO8/nmJp7gglhUtihGlpk8I/TA/MEaMzMaHOBWZX
         //fVo3yLQ1Aydxau3N6U4agg7p+QGs0DKRdKaCALrolxcJr+or7+U9GjK2Db2iX+oprp
         sAGnljWrE+dAL1ZjNc6pq7PnIdKdFyiLm0iSv8jR3gx8w/nLhuQq4ny2JxzkY4WnpsMu
         7Z7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776076799; x=1776681599;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M3Qpde+l3zSHqtGuk+YhxsSmgAud6Ug9oUZZ4dBVL5c=;
        b=nwiJSdnjJbG2U2fc7q1Etw0nt6AZytQ+NBCB2wpMlXqi7Wrz3igIDWfY7lB1zNa5De
         Sd9JaG+AJB505zX1tvhKHXLKA8AAJFYTpd6tU94EnrY3dLGNOpq+IU0TjLCm1nDbvvi+
         gNjZArxR0cMQ4i0mazN+P6keyboIiZupImDouDgTPyGnbMUyFXZud3VJfdibjPxvnZo4
         jQ+qxQ0wV4VACVgKS2za09/kgVH968noNYqPkdyyWs2rUqKxErNCWDr+3nAZwov6k+1D
         X4fzJ1G6JCd/LbKx371hOOOyyVvRtYZ6xv1iIlvrs7ClBhioAFisQ1w//jJDVn7y2wlG
         8zpA==
X-Forwarded-Encrypted: i=1; AFNElJ/EstzXehEeYoUWzAahCFefR+qYWlgclVDsYJFdsiN3CwhKaQwlZzZJx31fQIEbi1TqggbHOjFiQlBBlAx/@lists.linux.dev
X-Gm-Message-State: AOJu0YxgKqj9h3nBrU5uckA7T/Y24/uewgnvsO24F6CW3kDGQ7WSx3mq
	hXins8c04il//NkXk6DA1XTM1Nvt8HUzTu+TUUegoRQYtOVBmLK0/iLt
X-Gm-Gg: AeBDieuZxPqdIRabxv42lyMrmDxWOGRAhyzW+Ym/8OIKQtAdkPr8+5C3hwaYVGnWjYJ
	la1TLglGpTj9i8fNnmu6F8MEFJU/5cnZr4Qop7R6t6aXHAoOyUW2gEUEam4Medi3yewZQGVkq+6
	cCbNo/ZF00NZsz7k7hTZ6jXmCLe0b0wjpIQqyXiLqWsupkURQtKXjB+s2rXgq7j/gJdIbqhI6fh
	pmjrYke3H4VgzTVEAlmYMVkkv4X6sQUdmL67T1bZVdiUHRFN87Z/83YqVc3J7zxdlJBq5hWGLgi
	zes99MLtU0ntQhNVqG9IIbAqmSgoZEsCsmYr8dFeA/pXVcZIZ8gvZ7u7ynOmUQnWeJUsieupRdQ
	/7FtX8zdYf2Pi/RpVx+ogzWEedO6wpzVRhiDnhlUhSZCIFMJ8fAckhl+nQ2W3ciHxP/DNuUF3Qr
	/T0O5yi2XX+o96shiMKpY=
X-Received: by 2002:a05:600c:8594:b0:485:46fd:7887 with SMTP id 5b1f17b1804b1-488d67f9a73mr119380225e9.13.1776076798374;
        Mon, 13 Apr 2026 03:39:58 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d58bb830sm295312985e9.7.2026.04.13.03.39.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 03:39:57 -0700 (PDT)
Date: Mon, 13 Apr 2026 13:39:54 +0300
From: Dan Carpenter <error27@gmail.com>
To: Alexandru Hossu <hossu.alexandru@gmail.com>
Cc: linux-tegra@vger.kernel.org, marvin24@gmx.de,
	gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/5] staging: nvec: fix pm_power_off teardown in
 tegra_nvec_remove()
Message-ID: <adzH-qGdFttuP7uq@stanley.mountain>
References: <20260412205057.386856-4-hossu.alexandru@gmail.com>
 <69dcbf4a.050a0220.1d6d81.c4df@mx.google.com>
 <adzEgwPBTTFVKBdS@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <adzEgwPBTTFVKBdS@stanley.mountain>

I haven't looked at if you can actually power off a system while an rmmod
is in progress...  I feel like a real old grandpa when I say things like,
"Back in my day you weren't supposed to call rmmod on a production
system, the rmmod feature was only for debugging."

But the bigger picture is that linux power off is a mess.  There are a
dozen different ways to power off a system.  Here we have a driver
which just takes over the power off process by assigning a function
pointer.  Shouldn't we instead have a list of ways to shut down the
system and have a standard way to pick which is the correct one?

Instead of worrying too much about this one driver it would be better
focus on the larger picture.

regards,
dan carpenter

