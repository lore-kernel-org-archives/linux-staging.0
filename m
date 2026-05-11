Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com [209.85.217.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D1283D3D00
	for <linux-staging@lists.linux.dev>; Mon, 11 May 2026 09:04:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778490243; cv=none; b=XiNleL4/f6/J4qpIeaNSB8QE5AUM9YrmZDANRCWN0RJL7TkNK8Vd5xEu/3Fa1gunbbhVJO/d6gQ7VS6umXkaDEuU9jp2FlJlbXLbdK1WyTCdNTs+pLBW82NL77j2MeuNVK6Z+EgcAIHTS88HDwJv4A+zeDl3IqHjfXSxTpPjPjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778490243; c=relaxed/simple;
	bh=ty9oy5ihYXusyNprfyGWtEXnOvkltVtTxGJF75y8Oes=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bXSQ/IdCRkRd+G1PEPf0HK/sxHP7d6num2Vj9EFbCKteugeRpjn7P9Svx2PVbTnk9rTqcBhqe4sz2WKeg7kSXT+W5y1vIqi3J9hjm8zMiz78XepZH56LXATss7vWODUW4c7/J9XlVANb3unBnwfZA0FjvEE+H5/wOcJMr9r9cZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pTVGjH/n; arc=none smtp.client-ip=209.85.217.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pTVGjH/n"
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-6312bdd281eso2729343137.0
        for <linux-staging@lists.linux.dev>; Mon, 11 May 2026 02:04:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778490241; x=1779095041; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=b8NX79b1FP2yBieMjGm4+iVwK7eOws6LsGl0tkIYZAY=;
        b=pTVGjH/nT77EEW25CxXoaVXgpGq8s91n2hmmKg7q1CDOF5ATZt/NMQutlSidkFmTHv
         oQD2fLfT+zARMSzv1Riy3iMXBEYY066+UngylE2Y7UsNiLTvY/lQ+I/yid9rT4dguLzO
         jZOPhMe+lCLVjbp6LG9SWOKCHSKQmzDjT1xD4aGrf+jibtHOcjDM6F/Nvw6AHL2mhU34
         N4vTFj5yofL4XW+e3Xeem/UpIMUhVSLuoUqZBzRRLT0Hky6DwxQJiSMnrFGS6Fnih4Wl
         k027zLArCryb6bUgncCNCKkomtL2T9JNkSv77OwiKk8In6Ae8hPtoESxUKF9m97yxa+e
         HVIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778490241; x=1779095041;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b8NX79b1FP2yBieMjGm4+iVwK7eOws6LsGl0tkIYZAY=;
        b=kDmnv7FROnzKIUO2XRQXffwHsl46VFnY0UvE6KUHIy+hBYYNFdDMi1aJE4Sgg0HObR
         XWFlQJyFF4rNnGcKzdANbyUBH4J+702kLJ1icu/OhRb968QkxiLJy7+EbrxQjfNaOUKe
         ffPhzHDGw5fNpPOmm+kM+t1QuBUkwEx0dwkCGYtiLvoYQDUO+jlzSl5XerQD7YGUZ/Hz
         Di73HmRNVGIIDe6rDzOyLQs9mxM8rCt4CQ+N8n7BpgexilAUZE3jLmo8ritHC0ImKHJS
         RMHlyvdKWs7oAcE5wpRFUOThh2gV33yVBOfHRB5qe0pKpplKjmssQGodlacEQ0KDPFIz
         kPNA==
X-Forwarded-Encrypted: i=1; AFNElJ+EuDeL71zvvle/Wuwen2mr8eZ+inPxz0R8vopfgbYoIF/PwfoVu4IcEwG6BKwLTiJc0dNjbVscmZmXnRpZ@lists.linux.dev
X-Gm-Message-State: AOJu0YxS0I9XKRAHReL7qxMBwK158Y67UaILy3o8hMvoZyZugpTuJcNT
	Lwkt1HrsXZxCneVCE9tAxmkqvl9/H9AelQa1CM1l6ogZD9HeV30EM7vC
X-Gm-Gg: Acq92OEOdMfUgsT0fg478dyo/BBHzDx+RHceZXT7DNKUugR33xOCjMnOx3OOlgqTgKL
	6dOPjLo5bjVqb4CrsL3iqDJVdptRq/jENvNqvnB9eM4t3px/NVkqSZFDS0+NmEd6jI3wP009G2/
	K2P5y19xUgoaIBAfgfhWoK+6GcUBnkvHMYtfQbiAZ6O9ZaW/twZTZc2KvHZvaKeiZT4Kg6AgDYW
	Tjquqql9+kBQumQ0e8qRPkbTrOikTuewwMwGJ7DG67OZH5tyyeWBlD/s6ViVZ2rPoa8iFLf0Icu
	Ltsr0Z0XsZifxMRGx7B9buu+OimtreBdtdPxnyTpnePeeZsxOXCrWQOqb6cFoucVV07LoGBdOWT
	e9YZkg9ypeUy4OnC44+MOZA9LkUv+/j3wvP/wyl4hexFURa9YD6Q0JnWVy+cFRb2WeXo7FN4r0G
	xssUObQc/dlUzEBxXcVQ==
X-Received: by 2002:a05:6102:32cd:b0:634:248f:bc04 with SMTP id ada2fe7eead31-634248fbd82mr1018882137.10.1778490241212;
        Mon, 11 May 2026 02:04:01 -0700 (PDT)
Received: from localhost ([185.141.119.51])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-95f21b50443sm5171533241.8.2026.05.11.02.03.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 02:03:59 -0700 (PDT)
Date: Mon, 11 May 2026 12:03:53 +0300
From: Dan Carpenter <error27@gmail.com>
To: Nikolay Kulikov <nikolayof23@gmail.com>
Cc: Andrei Khomenkov <khomenkov@mailbox.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH 8/9] staging: rtl8723bs: remove commented out code in
 rtw_mlme_ext.c
Message-ID: <agGbearJiYajq7rv@stanley.mountain>
References: <20260510134315.64295-1-khomenkov@mailbox.org>
 <20260510134315.64295-9-khomenkov@mailbox.org>
 <agFV6Bpe_HyxC4qG@archlinux>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <agFV6Bpe_HyxC4qG@archlinux>

On Mon, May 11, 2026 at 07:07:04AM +0300, Nikolay Kulikov wrote:
> On Sun, May 10, 2026 at 04:43:14PM +0300, Andrei Khomenkov wrote:
> > Remove commented out code in the site_survey function as it is not used.
> 				   ^^^^^^^^^^^
> It is better to indicate function names with brackets: site_survey().
> 

I feel like we can go mad with these sorts of review comments.  I spent
five minute reviewing all these patches and now I have to review them
all again because of this really minor thing?

My trick for minor review comments, is that I try to find a real bug
and I tie the minor thing to a major comment.  "Sorry, you forgot to
add clean up on error and also you forgot a comma in your commit
message".

There a lot of minor stuff that I end up ignoring...

regards,
dan carpenter

