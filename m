Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EE663A255D
	for <linux-staging@lists.linux.dev>; Tue, 31 Mar 2026 19:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774986007; cv=none; b=qTPketIySYT/feHEE1p3vMrOuoS2eo2wmUFmdaCBW/nNkGKsnWAGUQRa3xB5gPEa/s/WXX9u5Fg6EOr6zRWgF/FDvH41Y32BTpTMW9+NQnfMpZ9RnNTWXB20sxuAyV8ha1wNFlQ6qBFoaqV2ZmEvObL5TFNFVyFo1/BGRk7Q43k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774986007; c=relaxed/simple;
	bh=iQ2YYgdfhInoExshAxj84drfFa9zOehQ1IoOyF24GAc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PmuJlPYkuUvWxecxwse4L5rz5IaNN6bepMsjx2yaCfniLOjaUShFdMBEnWLd0fJWvPSpSAx4eAq18vR9UkQlEpFN3jwokIVz7m/GgE9BTjx+ep/aiZIAIvkbMZjd+VfiwVd9Skk0MoHtwtLwuBuVfw9RyIXme396GPwsQUUXzns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ULR9yXkE; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ULR9yXkE"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-48558d6ef83so61354475e9.3
        for <linux-staging@lists.linux.dev>; Tue, 31 Mar 2026 12:40:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774986005; x=1775590805; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/Jc/eyAMJuaSt5fDb/LxuewpxfIwRH0DpO/1NNUx9xk=;
        b=ULR9yXkExIoCnFRf2h6eoH07aHZlHWvNxHU2ZfAC3Tpg/lLbxsXfy0J1H9kWTmXuJ+
         FLaRbMDhkr1mxcNt8tIi1eS1FF9JyPOY4PIz+5YODUyXrEw6ktjUWS0GHa2nryM2NS4t
         cMYLQ3TFIr9UsK17E4/fWy06CZm6SOPGohsJCLt/ib049+c52eCWO+F4SygbMVjKxkPT
         bQN9UGqQpF04tEOtrvzFwWftqIGMbYrmUdXB7py07w0fXVjtYm+zlDTBEIBcZ27CPkY4
         240E1lb96F/QSJn31+hhzbiBT7R30R9RDc310O8M088PqYXXSbKJyTqCwOPLkhjhUKbR
         9DZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774986005; x=1775590805;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/Jc/eyAMJuaSt5fDb/LxuewpxfIwRH0DpO/1NNUx9xk=;
        b=HmJpoPIb3cLhMESYIA8Z8e79oMHmQI5XIkEYqB+Pk8I3XdCr6sv2D7KslLnf7wKpIk
         UzB2Qydlht6+/hq8D+1GQw9jBUoRhmweYxc/eMRZyQvlU0bJb+gZGtUwnLfUXOBeZB0c
         YtS/qNFQ2ktCt1YasfJxv21GhPqmpoV5DCaax3vg1PguYCLtvfix6gyxgWKokMXMaX4L
         Hg7ddUmmR6EOgY6LxkxwzakZ7jC3iJIgUWLAcszT9T6iBFNEVcD0dStbPxXaEB7L+FIn
         cZipZWyeUSGoeWw+StMNHRCP/F6IHM9diRuCtUOJn3wYlhdZaJUdJ0asZ/FwekME2x9X
         IY1w==
X-Forwarded-Encrypted: i=1; AJvYcCV7oKWyOD6YtrloQyw0gZZZs20ONmRarqtYpYHR5b+Yv2Teb5oNTh0x/L7JuABKPuuP4ZJuNDcc37zJGSzB@lists.linux.dev
X-Gm-Message-State: AOJu0Ywc+vo2CEqyeJAdsWsoI7okYffzp9MFsDXGbC8OXeEF4mjLY4n9
	EXL8syfMePW4wnRiwn4FoY3AksRhkQ4XFGQRmKrP6ekgyl3CjLEQMm8B
X-Gm-Gg: ATEYQzxLLbZR8rpbM8t+b+jHXb2A1zsO5AqUDxcO4Y4m2QZtXKn4TiMuEVKv6RB4s0E
	W9JWp69tRSPxiejW6iMaz0s+UutUJ81X09UB+EDtDB7kLHdlh3FwRmqyiLSJQnmyKUl9U0KzIVc
	lvZPyFK3GToRa0gq+8+JhwgPv6sN2D5GBp9dCkmpI2fXu3hg9/nFR54r/fQil4Lk2nMWQXNCo70
	LH8hF4j1fFc0YCxr0Zqgbz+KEAKwGhXz4Afzb58uW+a2ldjSPXxw3bCCRSaPisTIEbshFGYrv21
	4VcrKI6NZjpo8iZzsSY+uwYatnFooc0GI0dpUIPjf2I0ugkvqDTaBze/mtXhtaCR6cFOpjXM6+W
	HVnIpIeEEDq8Bk4cNGxSfOLGmYHbmkx+19/gQNRVTq6lP/N0feFJMSk9L+DD8jJIHHZdvBzbHTc
	svVarZ7pLJxt3rsEplt7o=
X-Received: by 2002:a05:600c:444e:b0:485:35ee:f836 with SMTP id 5b1f17b1804b1-48883569e3dmr10276925e9.2.1774986004433;
        Tue, 31 Mar 2026 12:40:04 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf2471ee2sm29745701f8f.29.2026.03.31.12.40.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 12:40:03 -0700 (PDT)
Date: Tue, 31 Mar 2026 22:40:00 +0300
From: Dan Carpenter <error27@gmail.com>
To: grondon@gmail.com
Cc: gregkh@linuxfoundation.org, christian.gromm@microchip.com,
	parthiban.veerasooran@microchip.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/5] staging: most: dim2: replace BUG_ON() in
 service_done_flag()
Message-ID: <acwjEHyEYg0V3OyC@stanley.mountain>
References: <acuoL4DRi0pmsQY1@stanley.mountain>
 <20260331164429.47314-1-grondon@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260331164429.47314-1-grondon@gmail.com>

On Tue, Mar 31, 2026 at 05:44:29PM +0100, grondon@gmail.com wrote:
> From: Gabriel Rondon <grondon@gmail.com>
> 
> On Tue, 31 Mar 2026 13:55:43 +0300, Dan Carpenter wrote:
> > hdm_ch can't be NULL.  It's a pointer to the middle of a struct plus
> > an offset.
> 
> You're right, the NULL check is unnecessary here. Will send a fix
> removing the !hdm_ch check and keeping only !hdm_ch->is_initialized.

Check them all, right?  Maybe the others are similar?

regards,
dan carpenter

