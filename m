Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69D4E48A2B8
	for <linux-staging@lists.linux.dev>; Tue, 14 Jul 2026 14:47:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784040427; cv=none; b=MUg9gtIuHA4lW1KIZj6bb5VVrheI5MNq8+Fe/c3pFrpkfAmfNlMPF/Yoh2Ht6IreysHc4OQrubTKIxHxX9FqpjqvcxNNkhcrM5MXuPjvkKWqILn73yO5+1ssl1/O8pFjyZsSdm5Ga33qlDoiajrVuU/JNkTebu/IRHPzLeAcz+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784040427; c=relaxed/simple;
	bh=amzjsuVuOYLtmAs85CfONwycFsfOOuggu8e/W/O3Qg4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UadHcgkRUhLC0+AjAtqw7/illeH23AYNJxzU1f+1dPblP7+6x/uPQC9pAoWSYUUzpOzv1l2aQpV+aPhP1fp/uFC+Dh0yhQ7lPStBlZXT6yzVWqKslu3PBgnwt14wDuukrH3MquG3wOt0NvqvUz7nOtX2DiPpxocBEnzo/HjaYxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dF++EkzB; arc=none smtp.client-ip=209.85.210.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dF++EkzB"
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-7ec49608332so258696a34.3
        for <linux-staging@lists.linux.dev>; Tue, 14 Jul 2026 07:47:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784040423; x=1784645223; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UBozPV9Nwke2ViZ7Pjz16VXhYTkzVAfqm4bdfsxTzUE=;
        b=dF++EkzBF/lnfnwcZKAcNEriLCa7ZcOpQBGkvYP4SnZCL+2VNIDCl6WJGD4XDlbiqI
         eNFFrdyH3uVHkRIBJjDtmGNkNgCG0ooLAA5Fz0InAXO5Nzq+OAeSTeLSQULCKjDQzeql
         jhaYknGlWs4Ppv93q8PNqnmvkR3vLPQLBW9RHkeCOpX4F2ppNSUYrHZ/TXg9MVWQH7S7
         rNHEciEtQOgzw24lWBNVeYkf3v9vPq+Sbnc5BUUVEJ/D8NHzF0a3CSUWy0kD3fOkGh/0
         K4IX6uw42YEWdq6ej6Hb2WeR5HqzfJhjsnVt2gzdHV1bCOH4Tx6RTS1KOz0Ong+NbreD
         G1yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784040423; x=1784645223;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UBozPV9Nwke2ViZ7Pjz16VXhYTkzVAfqm4bdfsxTzUE=;
        b=qpFSbdwyG14pcV8410em/fQvQRfWBg0Zjg8AtmaBEmLRGRX65jWAQ6eCYE99rNVNU8
         jAjHQnB9UWzCUD6JzhyXa0JE/TSQwms0ozpRvXTimHYwZPqRh4isQvZ/o4h2HP8JX1sK
         NUYl23NcXx5zNdqHbVjeugjhlkyBcK/UG6ZrN0EIvFYq8Dz0tmi2LfpzLypVdf/HTf4n
         VX9WLRJNztEzFETGtOuyZjMVEmqk6Roe4VRNNXTYOb2k7QCmyzP6Tr5dj6/h4Wyq/goo
         DR3uK1dblOs2GRGdqjAl4p8VuQXuWofMphVPRDr7XULd+bXl6o/xtHHZ7wQolDN6g9An
         /weg==
X-Forwarded-Encrypted: i=1; AFNElJ+oJQhKrVjVU0J2Li98ka9J9hzRklcIHKa3Woq7Nwcjf4Sv6AF3HRwiBmgR++uwvzor4lB1YAbD4uoIJQYR@lists.linux.dev
X-Gm-Message-State: AOJu0YzoQNuKYd8a4yycCl53Z3ca1CIMPZM2NlQWORXVmsGB2Z1feIcm
	tOgi5I3P8e1TB/r8ZEiDg+kSGKVYdKn8KDDo6ZrPmDKvU2BAaBO1G5EuoebMu434TH0=
X-Gm-Gg: AfdE7ckV0Wu+eG2f7LrazIJfihWV12S+d7fqfXwpkxUlx0mapOfOLNWcnVwY7gTf9uF
	/0JxyuXIgNnYYrXmbanfZ6VjnE7x96V12L6tNzoudIw1sDXU/8PhPmOn9hlU1u9fcWYSgYqhcpA
	bHBlwrpzw+X3iVZEn+tqJKkoeIPF1g0AeJmWEObvtd8qnbca+DFQcz1lw8iOY2+mcsuTtywK/uh
	pYwbrY5w57iFw1oL7mXcHuUuR6TGVH28ZYI2nX92EeMTjz4iGrYdVTvYQ9/RUmds2JeO2E3lK7u
	CFGvyWcGbyr7x8lrD+zlHFtftL1OqjoUNWl8K2aGkZxLh1xPdQymmmXOi2TjYMZfgUjx0TwoOpQ
	g14GIhlVbwDvF791z65OO3KJfkabOfWG1y7xkX11ApOcWlR+EZMVLityPWhI0Ter1Prt0RTUhTB
	YlKuet
X-Received: by 2002:a05:6830:2115:b0:7e6:d8ea:7dd9 with SMTP id 46e09a7af769-7ec4a8da937mr1343967a34.22.1784040423323;
        Tue, 14 Jul 2026 07:47:03 -0700 (PDT)
Received: from localhost ([74.80.182.78])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7ec2229b4bdsm6082730a34.1.2026.07.14.07.47.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 07:47:02 -0700 (PDT)
Date: Tue, 14 Jul 2026 17:46:57 +0300
From: Dan Carpenter <error27@gmail.com>
To: Alfie Varghese <alfievarghese22@gmail.com>
Cc: johan@kernel.org, elder@kernel.org, gregkh@linuxfoundation.org,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, dan.carpenter@linaro.org
Subject: Re: [PATCH v3] staging: greybus: uart: return tty_alloc_driver()
 errors
Message-ID: <alZL4UzGkAKsslYQ@stanley.mountain>
References: <20260714134921.817-1-alfievarghese22@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260714134921.817-1-alfievarghese22@gmail.com>

On Tue, Jul 14, 2026 at 07:19:21PM +0530, Alfie Varghese wrote:
> gb_tty_init() maps any tty_alloc_driver() failure to -ENOMEM.
> tty_alloc_driver() currently always returns -ENOMEM on failure,
> so this does not change behavior in practice. However, returning
> PTR_ERR(gb_tty_driver) is more correct and consistent with kernel
> conventions, preserving any future error codes the function might
> return.
> 
> Signed-off-by: Alfie Varghese <alfievarghese22@gmail.com>
> ---

Thanks!

Reviewed-by: Dan Carpenter <error27@gmail.com>

regards,
dan carpenter

