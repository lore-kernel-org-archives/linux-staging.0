Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADEBB35CB67
	for <linux-staging@lists.linux.dev>; Mon, 23 Mar 2026 10:45:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774262745; cv=none; b=bvxmLshVw0BBicfiZdv2kgERyUySupBNjDh+r0dUiZodcCuRL2AvIvKN2wwFRwWHW3RkqeAuNXhFrKwV2npY9Zvl1yle99KYlGTDV0+c6rCJLDBP4IBGWo0lrdoBzdI1t/ehzXtzEO8AEhHCNA0QPlRasWXEuXdjfLT+nf6effQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774262745; c=relaxed/simple;
	bh=g1MOxl/TTVYsCM2Pj7ihJlp97hd61ZO2439ICvpyrcM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RV1auLx5KUgZlAkcIb9TTBrXaX8W7lf61soV7PKrwJhUCBtsuFwpMjtQMCPpXN2K3RmGKAiBgOpClwJGd55ze4QDeMw0Jq35ybJ/PjK+2Yk4vI2J2/dYCuzSQtejP7/j/OpGAJCt4sMAOr+KJXW+MtJHI4Qi8ZoijU3fgoEk58o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PAWzoj7r; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PAWzoj7r"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-43b4d734678so7228f8f.1
        for <linux-staging@lists.linux.dev>; Mon, 23 Mar 2026 03:45:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774262742; x=1774867542; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=J5KXydxy1QHsjTpxI3z3aa4h8w/M7xBGEChEmtqyJQw=;
        b=PAWzoj7ruMq0naN3AqJ1ZSUMEx/y/J/gNeNo12WrmPVUfMzsYSnk30AGFGv9H9TKxf
         EBLcW7V9f9NDwESHzDtYiYQciP8ZhVqPcjNnH5K21pOnEvwuGzrZffGwEvbGqEiqUYZG
         O6QrLIGXgD2LOm+lOhUVOE5/r4xxQfAj5IL50YQXEIa/V2axjLDj4Ne9UX6Pw/fsoP9H
         5bCEw8iTewWVhclhnPYWGh84rXDcoXPx2qBufb+cysjAuSeGPWGm+jSbV/efIwjebl4Y
         2axR0WIs+Lbxz3IMmY0vrjh64o7BcFMHtlbnVqMRkUT9Fvv0YTRnEZpilgBqZZys2ktd
         Jreg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774262742; x=1774867542;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J5KXydxy1QHsjTpxI3z3aa4h8w/M7xBGEChEmtqyJQw=;
        b=Ou0Z5ZiZcyTuZJcjpApJYSLcVFpUC93us0KuhzoWHTQM2lzD355XwoMlJjMeE0xoQO
         FE1Sj7V7a0iv+DAzn5ycoRZNglfl7wLrudmID94Z4jzelv+n/7TtWu9HUpJxSrOEuvZv
         Fu8izUUgzLMuI4XxmQgtWDGFeRvpl7/MpGHv0rVWn8+bvVrX1k+qh7D1bfYU/f0A/SM0
         09NTXUkVogSUsFWmNjDAqwbRzlkRZm3eXgJT+5NfokFsIARUaos5X47/E5tJk2kAAzkn
         R9N3zfprRkPxplHOwAZZKH7JAkViMmiK+zbZOENt+QdRYbZSejgkJ3JiLaGuWTa58kMw
         k3VQ==
X-Forwarded-Encrypted: i=1; AJvYcCVaqzRj+/nYKeLI5ImEbkqO3JaA4PaOrB6kIVZTb4UbwoqO7SGJNoiIeCVAuYrC/0uXYNGIrZnLtZjvmge4@lists.linux.dev
X-Gm-Message-State: AOJu0YwZv6dDvZg2N/4hv9H09C/Yzoc67smzASLsPHXKiw1rwumIphlO
	PSQjm5abFvjjM4iq3wjtoOZ51guL+2f4igmOPEnjMqcGN/TDd81xAU/1uOM1tQp62AY=
X-Gm-Gg: ATEYQzwwp4LD8J0KXDrf33vJ6vIlD9p3kiCTjWzRxUME7mZq0R8oGLhLgEvSPA/7OAB
	IOYgS9DbHqhx7pn3V6YjcJUVAHbs3YVauSEhOniekPD/kY7How1VyOmOi5Al6uOo9e3HQbq1gIZ
	UqySrwbeA4QuCPKv+j/idMSr42ED3U5PZh09IS0nwOe0ac8Ae1qE6BbGLY2fBhfRDgy/T9x2Yi9
	7sdmhiJZ+/ZV70q2875bnWpaw/pA6eh/aBaWJiQD4eYOhzmysVrxzo6+IkWpES7DFstewIrahO/
	fwxztML+CK9LKi12uUWcAAVEKfLEKb4gN8dI5Ddv4FUMqWM0zgbuAk76kt/4GYza22VYdavpq6p
	m9VyWzcHt40fIYe7lGkkGQzd6TY/OFqk873w/81JhIl7WB+6VlXhfzs+enMfFVauZ/4Y/kwW7Ou
	xCNj1TmADmcuGXDtzbzVyRqrSG5MqW
X-Received: by 2002:a05:6000:400a:b0:439:f5ba:8c2e with SMTP id ffacd0b85a97d-43b6423bc66mr18417619f8f.18.1774262741862;
        Mon, 23 Mar 2026 03:45:41 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b644ae16fsm29665670f8f.8.2026.03.23.03.45.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 03:45:41 -0700 (PDT)
Date: Mon, 23 Mar 2026 13:45:38 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Anushka Badhe <anushkabadhe@gmail.com>
Cc: andy@kernel.org, gregkh@linuxfoundation.org, hansg@kernel.org,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	mchehab@kernel.org, sakari.ailus@linux.intel.com
Subject: Re: [PATCH v2] staging: atomisp: vf_1.0: fix open brace placement
Message-ID: <acEZ0iOXmTB1Rfrs@stanley.mountain>
References: <acENTtTMsD-xca2O@stanley.mountain>
 <20260323102104.44021-1-anushkabadhe@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260323102104.44021-1-anushkabadhe@gmail.com>

On Mon, Mar 23, 2026 at 03:51:04PM +0530, Anushka Badhe wrote:
> Fix open brace placement on function definitions and control statements
> to comply with kernel coding style.
> 
> Signed-off-by: Anushka Badhe <anushkabadhe@gmail.com>
> ---
> Changes in v2:
> - Wrapped commit message at 74 characters
> - Verified patch using checkpatch.pl

Thanks.

Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>

regards,
dan carpenter


