Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A08333F58DB
	for <linux-staging@lists.linux.dev>; Mon, 18 May 2026 11:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779102985; cv=none; b=T+pmCZz+Hx1yuQmRXZ2XVItx5+hHzxvEGryl4hAQhbCinCw892WCOf9Z5jsOVM08d7Zwy6uPO55CyduOiXuXITJnWJi+iYGrhBOQcBgmalcEKz96VKh98+CMPESnfJKWK+2JhhXcBfQKHOEjFmMmEdLiKlweqYbkhUva3kSJEcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779102985; c=relaxed/simple;
	bh=lznWXQXwljfcL1ljm9pyBIU0QjQj/G8PEERiULK/RI4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LddjiIxOxyNz5kJR871e+wz5K27AxOs82umzuJbsMF64ikEPHtguO4vIHAYMCzJ3EgAZLfhKOnzys1xjmLMhnUJYzWVg1ScyuSEYuV511LVmAErZKVy5vlgLOpHOGAnahGuGLACULc6yOgXBOfVvLEkGR9SYikTa1OSoZ6undwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KLALYVdN; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KLALYVdN"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-4526a8170ceso863371f8f.2
        for <linux-staging@lists.linux.dev>; Mon, 18 May 2026 04:16:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779102969; x=1779707769; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1VuiTJ2Do6sofD4sW/aQoKQNv2aEr4uIOFC5YQydhd0=;
        b=KLALYVdNcIX1BgYKDPaOj9I8FYwmXoq6G5Ll5KfAF2xGRUHXr5VYboeRbq3NvUlDN8
         YFDD8Wx8jh8dIx+d6Q0kUruES9+5mo8IcooimbjMAeDgDqb7jSVKWmvrV7flJKsVATWr
         QBeSU4wwxdPgCo8RJEd5wZ3yLU83V9Sa6tFrG+1aPkugwxjg3WiKF8zTbSxj6DXbic0L
         nVhzfpZGAMPFvsCfdKss32kEPIoU9mqI9Z23W1FrLQ9AJ//61PQ1y0J4liM7WP69HwY+
         PN+E7lUcpVhEY52p7yVwHJXsAikKbGL4wOY29RAQIVX0lxKN03jOyQpmiwSMkiN/z8uT
         zFZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779102969; x=1779707769;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1VuiTJ2Do6sofD4sW/aQoKQNv2aEr4uIOFC5YQydhd0=;
        b=fE/iRPx6fM/wHseGcV43WjfOwPeP1rT9Ck4PwRaL2klXnBn1eoubnPSKjGLccSxF/t
         IxaMCGgoO7TQaEJDhEPhSlfCaNpZnDkPWR80TL5wDYudp6PDU42ZJihJAMhtl/17HAim
         28MUgqPQa96iog+5/K+k3AitT6zEvvTRe4ICWFwdSzFtheSRpiGkjYB0SEITGPhFSAMX
         ezxGHfs9V3Id6lVIea81h148zAOUknT6WpGlsGShjNr2bvf152/QlUF9FUBMhygjhzi1
         jZD9TF+JvnL91iN93++sILC2u862KXPgIwbdbxcTjc1+EYX6FmgtTkfromSneAD+asxg
         cXVg==
X-Forwarded-Encrypted: i=1; AFNElJ/iikMOaC6tY9AZ2VuZuZ9UQDX24xJ7LU1fT6K/g7o66a42Lfluhh2UHbe6En0XD2048mgoCQojlTqQS+U6@lists.linux.dev
X-Gm-Message-State: AOJu0Yy6hOl8O8qrPSM4zmNJNt3XXU6adJxy+tCWgAr6abUN6BJEzJ24
	mB50OepgoIDiiKe9ZMc5muU/FE9rq14c1ttwMZ6VF3BzJPoZ+lBnNY5o
X-Gm-Gg: Acq92OHMne4NZr0yAbQJRTDLubIdmDYsZDgaDmCippVEZ06zbI3I460t/KB7goI9xhu
	QNHtNRaFwqyplePwM9X5Np1rPzhhpMsS/pANv3kl8S/+HXdPQQTr1CcNZUYlez5n8qj1W8D6Amk
	/8cF8CosCVSD6hx23D0oF0PA9KNaF4iN/M0L817NMNPzR+lZOASZLGVZN7qoUCowQAcnsgnUe+Y
	XB9JCDAD+vImHdrZ7wVokgFp6J9IsT6wuzJEAg6VNbxg4qVU7Leu98b+HIAyea8NdqfTM1UAEPb
	DqbOZLgjELkU332pENVDGkVqgZhIpVZ1Mjzd9mP3YksRnmSzrl47cKhXiA6qqKVuN46A/csYWS9
	IVNu5ou7jqolbEcAKRaf6MUfp9OPZk6IwwpvThwCQAiTi/fbwh9laVk3Ktw45HhEpV0pMz4NP9s
	6/7X4Xg/rcr4+DKMpcq6T8hqtiVAJe573/hwtcAPx/
X-Received: by 2002:a05:6000:61e:b0:456:b23d:e57 with SMTP id ffacd0b85a97d-45e5c3480bamr22086631f8f.0.1779102969191;
        Mon, 18 May 2026 04:16:09 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da0a19a0csm34746035f8f.20.2026.05.18.04.16.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 04:16:08 -0700 (PDT)
Date: Mon, 18 May 2026 14:16:05 +0300
From: Dan Carpenter <error27@gmail.com>
To: Artur Ugnivenko <artur.ugnivenko@gmx.de>
Cc: ahmet@sezginduran.net, gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH v3 2/4] staging: rtl8723bs: fix inconsistent braces in
 hal/sdio_halinit.c
Message-ID: <agr09UHduXJKU_bB@stanley.mountain>
References: <agqlgeaakrF1wNIu@stanley.mountain>
 <20260518111207.23143-1-artur.ugnivenko@gmx.de>
 <20260518111207.23143-3-artur.ugnivenko@gmx.de>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260518111207.23143-3-artur.ugnivenko@gmx.de>

On Mon, May 18, 2026 at 01:12:05PM +0200, Artur Ugnivenko wrote:
> Fix checkpatch warnings on inconsistent braces around if/else statements in hal/sdio_halinit.c
> 

Could you pleae run your patches through checkpatch.pl.

regards,
dan carpenter

