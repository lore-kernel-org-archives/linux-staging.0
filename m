Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E577C3CD8D3
	for <linux-staging@lists.linux.dev>; Thu,  2 Apr 2026 12:50:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775134260; cv=none; b=nOkXmUhFJK+H8bS2gWl1jP3A4+hU6qeE6JmVoB1LCGNtCQlSObGtDPSHvW5oqOudAq9h3ButHv+Vu4vFFp6ymLCd8tBmhJfOvYpmoTdOOmIUc3XkrYJGmJX6xZARuTNWmKH3MSLIiXjv23ltRj5C4rGo3OO1+Wxo1qLfY2Evwuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775134260; c=relaxed/simple;
	bh=LVzd5c1yaEflvoMwJBZ9ORCT/m+zQEYn9cRCtoBlebQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XVEWnhGXWljjiy//zeE4cZVtboxRbPEfYV7XGUrmgQT2fIlp+7SfQjzQrRYljnTNu16VQISKQGUlx2KhJdfIUoCbOdTid7qJfMMQ5MakrdKHixOy0yFp2Y/MdPVF9zCvQ4BFrcmYig1UOrdiXO/YmzSvaQkwaUiDnrgu9muYQTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ggBB+24P; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ggBB+24P"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-486b96760easo9202525e9.2
        for <linux-staging@lists.linux.dev>; Thu, 02 Apr 2026 05:50:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775134251; x=1775739051; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nG3vW7Z/w/H1UAzXVzRtl5F/iCy7NCe80W3XYhEGbDc=;
        b=ggBB+24PKSqdWTqkyFb3FAP0v7ykWnzadz3rvkh+RTJRzXkG40p91d0okYJXMCYZNI
         hsYY4iWKlbqbMZzsdth5ftq7GRcApJS/xkHxZL/V0TvPGgs913Ap9YVlPcbr6LSdOJlj
         8QO9fKosmgWZlXOMAL16zu/yDOFPrTtCgGnQHW2vUEPSYR3gIxADmwHzZd08nOzBxGFQ
         lBdNR6iLepCoI1XHvvMx9KzQV1IsnrXiOzRvZc3xoDhPEIyH/I2yrRwNPec0UREHJHus
         V+bJ5l8ITbgZxCYSOfiJFzY723N8cI1QEFI+CSPkajta1VMAx5D4zSSqWW8/vpew52wb
         Dscw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775134251; x=1775739051;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nG3vW7Z/w/H1UAzXVzRtl5F/iCy7NCe80W3XYhEGbDc=;
        b=EVZypNdz4S+UTrOGpg7sFlXIZPnjVrtzqGz6GnQ5t9dIBHbs2Yho7PyPjdWMvRKK23
         gZioNDSXYYeJG8nqnO4sJRQSJJSF6tkVlTXD3i7mVRI86/DcFu64DOpANz/YmbGXZoLg
         VZ9OOcUT3geeLqbehcmdTQpRYYP7AO0YekM9TS2Dm+2ZYn7NPTc1FpC52gkn+49qvSgd
         k9sV+UPSKooqAgQVKzluMYdOQQkrQCvKkIt8c8nXn+dDP4tDSAxgxVRBXbrB+aSQHbxJ
         Lh+VP0WId+4YFsXvn+JJfKV70lYs9xUL/yaG5Io6el2X3GPG016Cbi32eqx9qCB/Rla1
         iN8g==
X-Forwarded-Encrypted: i=1; AJvYcCXv1+hNkEmaNb8R4JzvRV9F/k9s4IkQnXAADMmpfa4jzZayDHKj35ONWEXL6Z9BKH8fvGIJjaZ7QmjG5Jv/@lists.linux.dev
X-Gm-Message-State: AOJu0Yx0qIuYHlssApjYykY+35gQQO9oiQ6aZMYH8UZMrapUGTkRe2Qu
	bVfCv8tUlisRXgANAonU15Ip5lH/dfegzTEsmEyq96W5Flb812JElELi
X-Gm-Gg: ATEYQzwPake8P7VYdZ/JOeEla4j8byfRtHGifJxP3wPmyfJGzrA+ZeWwE5j5RRTR00E
	I/jauVVKz4d/Xam2Y/b0RXqqc/LEwg/HYs5Y36y+EeLI9S3hRCiiZ7srwWb9cbnB1iF/kYAJYOg
	5qbksZFpwTgX4AMBmpjNbzARNuIw+7Pi9t07CeV1VGVRUy1OkUvv+YgAGCplvZxalt6YEYQw+3l
	52aMJQkfsy3ZPILK18OUJlSK5UyuP/KyB9W1tTE5LX0XdXWj96MaohZKWsPhbyY6LWM/z8M1CaM
	d2pN4+3pZUB+P9ABiflNUOTJAg0c+fS+J7xZSFuEGBb1Trk8sFcQ5twkAYkHs1jjQBr0GgfkvXz
	i1SZ3tohiskZRBBbghvOWdySmlLQopT4x6gJF/7u+TFeI26GBT0wiP8MRndiLnhbUcAScRHoLSb
	CPH5ZIT0nzqT6EO9Flvqo=
X-Received: by 2002:a05:600c:310d:b0:487:18c:7acf with SMTP id 5b1f17b1804b1-48883599311mr124397225e9.25.1775134251036;
        Thu, 02 Apr 2026 05:50:51 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887e9630ddsm179643375e9.13.2026.04.02.05.50.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 05:50:50 -0700 (PDT)
Date: Thu, 2 Apr 2026 15:50:46 +0300
From: Dan Carpenter <error27@gmail.com>
To: Sudarshan Srinivasan <ss22.kern.dev@gmail.com>
Cc: mchehab@kernel.org, gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] staging: media: av7110: coding style fixes: too many
 tabs
Message-ID: <ac5mJodg9Y4InQwr@stanley.mountain>
References: <20260401191743.26951-1-ss22.kern.dev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260401191743.26951-1-ss22.kern.dev@gmail.com>

On Thu, Apr 02, 2026 at 12:47:42AM +0530, Sudarshan Srinivasan wrote:
> Fix warning reported by checkpatch.pl
> "WARNING: Too many leading tabs - consider code refactoring"
> 
> Signed-off-by: Sudarshan Srinivasan <ss22.kern.dev@gmail.com>
> ---
> v4:
>   - Added the missing check for  "feed->ts_type"
>   - Removed initialization of 'ret'
>   - handle_ts_memory_fe() accepts only "feed", "demux" and "av7110" extracted thereafter
>   - demux->playing assigned to int, instead of bool to maintain original style

LGTM.  Thanks!

Reviewed-by: Dan Carpenter <error27@gmail.com>

regards,
dan carpenter

