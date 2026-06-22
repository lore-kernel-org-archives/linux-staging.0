Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79F4B39F166
	for <linux-staging@lists.linux.dev>; Mon, 22 Jun 2026 09:06:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782119169; cv=none; b=Y5ZKDVUmdeqWREnVDmB657CjHnEOZs0rfBsQMch3dwvmSG94v1FM8c11k3wbIq/oI+XYb7C/EQipZiMCBLj0AiCxscrLzg/E9wKvWlYkJc2MUnom2vSzsxiN3xXvuXKSqP12NMl+8nTxHeoVdyXhxwSRN7AU8eXUAYs0Y6QoU5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782119169; c=relaxed/simple;
	bh=nt5nHNDTmRUYsbCNxPLNby+fTZzQ7KQWG3C9lgxxs38=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i/FdTTm8RC5n3PlsJLKtkL6gx+Mi7TFoMID/TtDNDMo22Wckmg2aR/dkRDbGfiG0kwhn8IsMR7veAMTg3zUFNoJqFkOhMhEAnAUwjbEm3jJ6avVkcPuOGf6gHEzor8cnjGteH7fpaZjce/vqEFFRNOEo7renqmXWNJ9+bMljLC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kVPjGq4G; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kVPjGq4G"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-691c5776f35so5661499a12.3
        for <linux-staging@lists.linux.dev>; Mon, 22 Jun 2026 02:06:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782119165; x=1782723965; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rKi0tpNxnV7aF2Y2gDvU0xwj8sSkYkSXh8nfiFV0TdY=;
        b=kVPjGq4GEDumzjkF14ID65cscXGzItN033MzsvEFQG8fQPckz7e80siSHToV+j7h4P
         NAbyLkTqbZjvHEktCn+oNGg7Y2epQW+1a7SBw8gh9lf96RJ7sugEak+nUnLvGZ0CdOnj
         HlBlLk1tEiSa2k5vYARTk1dG2DtPCqnxRhTGi0VptK/SjJylznQqRt1TSYz+Cs8qW5Qw
         kLih2xcXNwRaw/5HZDN72yoQ1DhIolr7eJS4E9wtCJU2Llxs/2HKHrqclJw4xvQzHGk9
         tk0OpJj9uqv/D4DPepMp+sqOSmh3HolLYJWjUwj/bnFibSmrF1yYitdTSef9nrm90Yld
         FiVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782119165; x=1782723965;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rKi0tpNxnV7aF2Y2gDvU0xwj8sSkYkSXh8nfiFV0TdY=;
        b=e1SnIo9jS9I/k5FZ0/QxnTC36jZ5JWYhwTVmPn9CWTMCNwFjTrTyS7E2trE1qj4pbZ
         IeDlkxvB//5MatrryDss1mmed+70lcEzdAQX434zQPapAopSJJAZQ6osnDD2+tIjHufF
         J0iGlHO9mBpBu+Evru66Xq37Sp4FaA33igzR4C82cWOyubGYbRem+k0bKLKJeKNCBd3A
         16IZzJpuFM8EjPv/khIvfYb3oSiGGmXjyp7t1mL0B2idx7tmC1sv4hvGARHHEjo0mD0N
         MfyClYrhMr5m/dA7Qwn/YRttNZpwIvZAHseekxZgsa6VUXL8MN5Q83lVGERncU4kY71U
         O59w==
X-Forwarded-Encrypted: i=1; AFNElJ+KiM1CnIAg7DRk3mwGtnH/yV1POvzVMcNcWnhxtc/P3nZMzQeMZNcyAj73MSsgvVF90SJnuHGvMAYHi7Up@lists.linux.dev
X-Gm-Message-State: AOJu0YyxuTJKvL63puu3DsV8HLB3XM4vdoCEQ9ZIW5Jl4DwKQcHHeRhR
	lbA79wU0YUNjikwDv4wtyOs5W2OfX9wR3mvrYwDbM8r+n+kQ4BA+oGJc
X-Gm-Gg: AfdE7cmEmsruJqNhNU5lBDLkUyCDaEo/SgnZ0F/IULf7Z03s1AOmgNCfRiqMRw8LZ/s
	+dGh16Q5FEWeLYbsczCYlum7ISAEjh5Ky2047iI0VZW36xRc0lsKC2i8nT/oCs+ETnczBrHo+q9
	g0MByT8wVlBJO/kL6Rqk4ixvkDObhzk+vtCEcJEJcGZAqMYbmGdU96WL6YH7Tu2/j0/1shUf3qu
	9AREEro9tczA4w8xyVJPq8KYEF9q9QyY3lFInBZz3zrIuz+9Imi7R1fXAMVzyGzzt2/M7BxzqEk
	qiz+/hfQ1gfckTppJPPxAFW+Piu268HOd5R1xczPSRmjyz7M2xNrI2EzsN2KufJaSeRJWSfrCGf
	wjiOayX83++CczzlKXcHBC3TG6cC687Dpa7F87n+3QqKMWsGb2l7RFH5mFAtzVXzedj0Hsc1KkE
	3DV8Teubz8
X-Received: by 2002:a05:6402:1941:b0:68b:d82b:fc2 with SMTP id 4fb4d7f45d1cf-696e5237c1fmr5954025a12.26.1782119164183;
        Mon, 22 Jun 2026 02:06:04 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-697c1ec13c3sm300017a12.7.2026.06.22.02.06.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 02:06:02 -0700 (PDT)
Date: Mon, 22 Jun 2026 12:05:57 +0300
From: Dan Carpenter <error27@gmail.com>
To: Aditya Chari <adi25charis@gmail.com>
Cc: andy@kernel.org, gregkh@linuxfoundation.org,
	dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: fbtft: fix parenthesis alignment in fb_tinylcd.c
Message-ID: <ajj69VJU6A2AjHDY@stanley.mountain>
References: <20260621062945.42519-1-adi25charis@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260621062945.42519-1-adi25charis@gmail.com>

On Sun, Jun 21, 2026 at 11:59:45AM +0530, Aditya Chari wrote:
> Fix a checkpatch.pl
> CHECK:PARENTHESIS_ALIGNMENT warning by aligning the wrapped
> argument list of write_reg() with the line above it.
> 
> Signed-off-by: Aditya Chari <adi25charis@gmail.com>
> ---
>  drivers/staging/fbtft/fb_tinylcd.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/fbtft/fb_tinylcd.c b/drivers/staging/fbtft/fb_tinylcd.c
> index afa8f1c74..d58b12472 100644
> --- a/drivers/staging/fbtft/fb_tinylcd.c
> +++ b/drivers/staging/fbtft/fb_tinylcd.c
> @@ -38,7 +38,7 @@ static int init_display(struct fbtft_par *par)
>  	write_reg(par, 0xE5, 0x00);
>  	write_reg(par, 0xF0, 0x36, 0xA5, 0x53);
>  	write_reg(par, 0xE0, 0x00, 0x35, 0x33, 0x00, 0x00, 0x00,
> -		       0x00, 0x35, 0x33, 0x00, 0x00, 0x00);
> +		  0x00, 0x35, 0x33, 0x00, 0x00, 0x00);

The original is deliberate.  Just leave it as-is, please.

regards,
dan carpenter

