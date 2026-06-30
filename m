Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F73E31E82A
	for <linux-staging@lists.linux.dev>; Tue, 30 Jun 2026 12:17:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782821830; cv=none; b=jLgF4+EmDFtTZywN7cEunjoJKKN/h8kN+JUxxm8bEfl1ULQkpSTp00ljT/sLE6MkFewLyMCpTv4OVmXvUSN7UezQ479tTO9Pi6xkoqxBhS+KmdtlShGngzrEmYnT5f7sHJLzylz2648yFhGWgxj2bLEtO5CHwXfO7h7FsN3802c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782821830; c=relaxed/simple;
	bh=lpi8HmkVrz15YDKFvi6HG2jYJWtkJK/wF8kEEXrXboY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KAqZd36CWCfbpsynwh8keyIl28U/8xjpEuaEY+TUlpl8m5xV0ykLuva4W1SKrSYnJdHHiZ1vEbrbwgc8EyAdBpINiC1LP6OulehbA4bN2WJqY2ZNBdyZtSCeCVR3WkrSIH7iOsfiDZQHsLlK5GGUrx5KwrkgB/9woCQGcp13Oeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g+3aIKTx; arc=none smtp.client-ip=209.85.167.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g+3aIKTx"
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-48751bd4abeso1930248b6e.0
        for <linux-staging@lists.linux.dev>; Tue, 30 Jun 2026 05:17:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782821828; x=1783426628; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7cHes77q8EhrtBA+B/LAION1oySZSYHvNSe2t5fjkq4=;
        b=g+3aIKTxQsS5rqsAywm1gfTcn7LpbuRfESBfNyy8afTiB/5px6qAYldofut9q27qDH
         t+5BdehnDayDm4Wf27+N+KKZfkvGVr5oKt0VmZ8TKkCN8Df0d1TGCDjtz2iuVY4+3SxY
         FHbJIw+9MmpwqDgYYCHw6VkziI5dlQoMt6D20mcyAZ/2OySI1/ri7GlHWZQY1NMxP1qd
         /mCR3k2bk/PwRpJYfJ95qkltg/jF9vMqO3VHfP9a7/+YQgHN+TqZCi1375Qb1ioy18tX
         OmwQ/Ii27eSSQCPg2BzS0g9onM7hVnfJIg8jzvQ4sEUVUNuHsCSv4VJlNEh2iedW7tbE
         N4Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782821828; x=1783426628;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7cHes77q8EhrtBA+B/LAION1oySZSYHvNSe2t5fjkq4=;
        b=lEzs+/CBask5t4m/Fk/NkdGCzsgWF/lnEiy4hyHG44sfODhsDua7DghLzigWSQW658
         W2/FxJBty7xvux2VZmt7/8UkIC1qI4Tq2rLDFmGteu5+BubQxve+OMwW+dZZWG5rW0zM
         yf7IR0Oa89be82fSdNKzFvbnVc6hFzJ8eJufQ6tffW1/zVdZ/Fj1UovBEsH2ic8PVwV5
         SHk7kFie4QKlBDHceJiL92psMgD7i4hUjM+m7BgE7iYgc1tAsul6sIQHgRbHx3xwo1cn
         fNzZpBuqpif++X+QfOvXenl+zaFLfIS4v9ds4GFH8+7siVaxUoyclCVs8aXYMbqedalT
         06iw==
X-Forwarded-Encrypted: i=1; AFNElJ+pZ7OLoOoKdFKFcJRgxHYqfqG+gm7BtZb6vY/4ob1iVEnGS26l9ZMJ2kSNGFkICERtztt2VymyMuqhoyAO@lists.linux.dev
X-Gm-Message-State: AOJu0YxJnfyJQGaqpqgBsoTy64hQBFAYsxlqoyjql4zrwSfbtqb1KopI
	VOGzoNBeOV7ARIfbs64KCNa8po9OR0W8sfixloVQ3D5QJM1/nIbFFhx4
X-Gm-Gg: AfdE7clHlv/W4nLtEEetHbf1HJ9Hi25+UEOvGoE0B5J30zRiEM91JfIa8VDsDZuTG6R
	452dLLE4n6wVo/ueekm2zLJeRz+40SNd9nPgw4e0XRxgNBARhtrhXmgUBthl2bUWh5fdUkFvuDF
	39KU3MkzBJyxiJPn1W6HoSpTqy8+BcjVeazT9D57qe/JcP22ZmyMDijEUUDMF4KS+166LKNzpz/
	jsocOILCgM9ZNmp6z8+tVUB0wTZYEzCiGT6b5vlY47/e8Ke2HeQWC0w1IrfAAYhML75nMHjr2Ug
	+viNmacckyWM2Td1//J9AWbqRwitl2SLwWPuCoUrasUTUTvnP2vd5L8Q7sWUrUKwNofEpkVj4Aa
	LCAprIxuU6sy3kpHtW7CyvaGYFoXXzfpU3AJeMzQ3TNcBYcPgnZbk2s9dZ5whiEHVQs8do7efTa
	67yOhSP66yRfI1pSM+
X-Received: by 2002:a05:6808:5296:b0:489:9724:1992 with SMTP id 5614622812f47-495eb006ee1mr2617762b6e.30.1782821828069;
        Tue, 30 Jun 2026 05:17:08 -0700 (PDT)
Received: from localhost ([74.80.182.100])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4935545dad9sm8287677b6e.16.2026.06.30.05.17.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 05:17:06 -0700 (PDT)
Date: Tue, 30 Jun 2026 15:16:59 +0300
From: Dan Carpenter <error27@gmail.com>
To: adi25charis@gmail.com
Cc: vaibhav.sr@gmail.com, mgreer@animalcreek.com, johan@kernel.org,
	elder@kernel.org, gregkh@linuxfoundation.org,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: greybus: audio: split topology get into size
 and data calls
Message-ID: <akOzu5aBoPgNvuoo@stanley.mountain>
References: <20260629144941.33818-1-adi25charis@gmail.com>
 <akOy6ORYkzHxodYU@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <akOy6ORYkzHxodYU@stanley.mountain>

On Tue, Jun 30, 2026 at 03:13:28PM +0300, Dan Carpenter wrote:
> On Mon, Jun 29, 2026 at 08:19:41PM +0530, adi25charis@gmail.com wrote:
> > +	topology = kzalloc(size, GFP_KERNEL);
> > +	if (!topology) {
> > +		ret = -ENOMEM;
> >  		goto disable_connection;
> >  	}
> >  
> > +	ret = gb_audio_gb_get_topology(gbmodule->mgmt_connection, topology, size);
> 
> It's unfortunate that we don't save the size anywhere.  This code
> relies on trusting the firmware for its security.  It would be better
> to move away from that.
> 

(just ignore this comment.  It's just random thoughts, not related to
your patch.  Someone took some steps to try make this code less trusting
recently).

regards,
dan carpenter

