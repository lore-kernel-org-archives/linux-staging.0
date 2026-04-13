Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 202F83A3E70
	for <linux-staging@lists.linux.dev>; Mon, 13 Apr 2026 08:05:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776067512; cv=none; b=rRPkGxRQ1ZB7WcZW7QN6JvWXr5J9sO11HQfG6u5lz868wm67BTPB8Wcn3ARnvVR6ggzUbuaxPxK9uhw3c8vsfZRmTtl46r/mCxij+e/uiSr0xV/L+5xo/LvhZA6azhdwOwvwojKfRdol+qIW8L/a17kzV2p1H3X74M9kgbco0a0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776067512; c=relaxed/simple;
	bh=cdFk9qYNkWRkyL4yx5fX1+zERqhUHhUkyMOAmjOBvQM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CxLCMtvEJPhePYT7I+Igw4GVQ27iv+aFLip1LsCX6TBsJh2NJMtpQyJUZy49Xg5Vf21jfVw1rldNTjy7hrFcIGQMAZpC6Vn4ey62OS5nbRtnYbYSLmPYkk4ScfEin+9ZVz4fHU+ZjAiFLg6kntvZp1Cl1oM+iiOmdF3ayzvekok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=o6AKKyDG; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o6AKKyDG"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-488aa77a06eso69844795e9.0
        for <linux-staging@lists.linux.dev>; Mon, 13 Apr 2026 01:05:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776067509; x=1776672309; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bgVAXUp4ABfEYNGLPdeyADY9E6Zgs1iS/q+7Ud1//rk=;
        b=o6AKKyDGe7tkheoaWT00s+0cDde99XFc9j1bJsVzjvvikbnnkEdVkjU+KO60s8iNIX
         lwJRGjoIjuSF0HHMt9TRSOfSZEkYGsbXppSjibrpYcndIb7Rt2ajSbWD3G9DMExfNfLn
         IDAYHcJEjylMhSnk4eIAUL59vD3WtyPTNFtz6krYyOYwvf/5TKT+E5O4ZNzfZ45o7Mdh
         9qIZxrgJgWo+476qSXiHKCAskvDke3rgDDhxxeNLJYQUSzziqPsHeXVzgftwoULw47ZK
         5IvWHT+hTRErWIMzr7MzRTRSpoQm7yM7ZwxkFRv2xQf5eulFkci4xpMFP9fOyZAsawlt
         Jqqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776067509; x=1776672309;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bgVAXUp4ABfEYNGLPdeyADY9E6Zgs1iS/q+7Ud1//rk=;
        b=d4kv6qmezp518KsWzfZ0FRP41dtlxQ00QZWtKOE4CwG4ES0mubNDlJ5ixDf58Qkw/J
         WMzCbypGb/dHv1vVU5P4DMQQ5tOGgm7hEXXQY/2jIBNfUbq7m0mz2BthGkRXtnVL75zS
         iGX9CO5VHp1xgeKMa10FyJAxHtZfhmOXy1SjcVGOxvvHeX+qXdtd3vXpk1vxxZiAPOaR
         w4kmDJpqKuWNuSaroupUJ3QNiyxqzsHYtf1sFkNjefr9SNL3V5tIuS+btu0IWP2ozYLa
         VhffTI9oEcerRTlcXDocJY8LdqbLC4chi9sbHCWQH5Uy0UMFWu2nsgthLl2HlSkwzwSV
         CPUA==
X-Forwarded-Encrypted: i=1; AFNElJ9SyD/sI7pJ9vklVanysDFG2TEzG6nHOiolYZ9Rgf4vXdc1uGhbq7LRkdCXVKCP0i+C5wbIP6OcQZ5JeVri@lists.linux.dev
X-Gm-Message-State: AOJu0YyuQcdKQF/JesdwfvtliGtlDJ2JS30aoS3zbymxOoncsP3DAVh2
	up3uH1H4Trng511Vv0iDZxYvw6T14Hk9I9VCRY2FjezmTyIiy9vCDmyu
X-Gm-Gg: AeBDievr7kwBf8oWB0X96r5dASofJlUGIfMyjGsPUhKMRrndbWpX5+VSOyJZC/17Rsy
	VqYQTg3MoOeAXucBWDh7Ajjc2C+dOovVCk+u5Ymi70dQ8TRb3dyLe0fd/lpFSHpljRXGZ/kV9EE
	GuCsplltinIwWGR2nVQ1/sQ8ivDzLAEgvDrmuKcexRBxhXEDyplU4N1qSMTplO6PL0wngpH+3pB
	523V/VB2g/SQiNGLMpN+UAKaqVrAsHyfjgMC1FR+ea39BiOdQBsXpDzArglaaCE2SPouxm2fjbO
	S1ggL0aWNNTe38BC1KNTCznTpFMxpZQWl+NsYzq2yh6twF+K2BAmz1uZmaY8kE87uXYeblWoO7o
	iUtl0kJF1kwLNWIrEqmiQrqWNR0LC7jR0oxlgo2bqEL4y///NlmYA43MTr1VYzdxNAKEdIMCgum
	+G0wbwzK40n+8u5ycpZTktzHYE7QSVCw==
X-Received: by 2002:a05:600c:4f83:b0:488:7ff5:2c67 with SMTP id 5b1f17b1804b1-488d67f0aa2mr148620055e9.12.1776067508380;
        Mon, 13 Apr 2026 01:05:08 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d63e46713sm31856761f8f.21.2026.04.13.01.05.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 01:05:07 -0700 (PDT)
Date: Mon, 13 Apr 2026 11:05:04 +0300
From: Dan Carpenter <error27@gmail.com>
To: Hungyu Lin <dennylin0707@gmail.com>
Cc: thierry.reding@gmail.com, jonathanh@nvidia.com, skomatineni@nvidia.com,
	luca.ceresoli@bootlin.com, mchehab@kernel.org,
	gregkh@linuxfoundation.org, linux-media@vger.kernel.org,
	linux-tegra@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: tegra-video: tegra210: remove redundant NULL
 check in dequeue_buf_done
Message-ID: <adyjsMVQ0QMr5DUe@stanley.mountain>
References: <20260412172416.33052-1-dennylin0707@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260412172416.33052-1-dennylin0707@gmail.com>

On Sun, Apr 12, 2026 at 05:24:16PM +0000, Hungyu Lin wrote:
> list_first_entry() does not returns NULL when the list is known to be
> non-empty. The NULL check before list_del_init() is therefore
> redundant.
> 
> Remove the unnecessary check.
> 
> Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
> ---

Thanks!

Reviewed-by: Dan Carpenter <error27@gmail.com>

regards,
dan carpenter

