Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BDB32C9D
	for <linux-staging@lists.linux.dev>; Fri, 17 Apr 2026 05:31:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776403888; cv=none; b=uDBdkx++k7goszX7Q4x17m2CCd6j7SLM96YWSbJOEecK/QpU0N/OAm7gQqcic0BDYQmZpzf/h/L7moibIouEbH0ygSnL4zKxrYJJxz2/SYKarOPXLlIGO2wWB5v/fpXsQVyrbTZzP+pU7ZIzv2J2Vuc5+2p+jmim24VuacpVoq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776403888; c=relaxed/simple;
	bh=VBthgw/rXhzMzxt0DW8aGzOx9zKnhpte4eoRC/Xt5BY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G9v/H9e8INpmYzdUZFdHYIjtp7KMQXS7ytw+v2EPnH6SCt1OfD9+ldDd2zGr3KEGlyffF0/7mvgYJ7KMqAC20MeVFBcVGbrni+lVV8P8yraD4PU/LOP3meE4XRJAgON4W6IkT7FjwTYswtVDmT3FjtM12b+i5cDI8TpeqMdA8NY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dyq/CxKj; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dyq/CxKj"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-482f454be5bso13130125e9.0
        for <linux-staging@lists.linux.dev>; Thu, 16 Apr 2026 22:31:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776403885; x=1777008685; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=P8zdt2mI8kuppL/SwhLD4Wp0h0xn8IbXpXHR5LOgv/0=;
        b=dyq/CxKj8dcYD7LDDWBr539VDRiMo6ftuYrZaHx6oY14s9/m526NWF9yviSe12lBml
         rty0hqeUK/7db22/JxPG0SQ2ONEkTniHEOXbSzo1HAlaUwzz/2dE1GliNT1nCxHFs4Pr
         lFzjsQUq8Okhn0CXpCq03SmU+wGlrUVl4+Ehk/9rCoVssqBFpA2XHczwXDi3071m+gi+
         v/0Q0eS4ZEqnoCDUorchnb5Hj7KFG6guTGMjQgaAAkm/Rxm3QslqW/zbqDihOmPTU7wb
         MUXaDqPQuh2v98tk8AzF1YYKrhMDIZL7HycPXzS9E0TIZcNgV2W3Oe9B3OaJ2VZTUfkB
         ThHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776403885; x=1777008685;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P8zdt2mI8kuppL/SwhLD4Wp0h0xn8IbXpXHR5LOgv/0=;
        b=WqA6aT1mfVON2EhTFtXpn9PtFeURyGECkErdRBkHAEwnaYzO1m+Be77pXme7vm32Me
         fRHrj4Qct+1kFWWZuFYdZi+t1olk/jfwiR+DfXB46iVfJL/eXY6O/FTly0qjsbEOASO7
         vhbhS8qmqXmLtN7CqOJhqKYp/XJni5/YkrEkkAc/uTY1ajjdepwAzfHCeyebCHunTeb/
         PmJoZ8vJIcmzZFtxFizyoEmJVT/ZPFXFrAhFlI6z4IkKf0MjT8Zy6KRoAfeOcKmQbKwH
         /HuiMVxRRxix/jjHoCjc8y5WNtA4xScJwq6rP0RFQKuvlZl9ve0ORMBewRvtehY3p3Y/
         nLNg==
X-Forwarded-Encrypted: i=1; AFNElJ8rtwNOlptjiAElWpmvKlFVYSzRLmQf/axg4NMi/GOhXwUKxSGbZ9ulZibuG3/tr36O/Om4Ch9p0aH/gxbe@lists.linux.dev
X-Gm-Message-State: AOJu0YxGX0EgeOl9srX4nZ4fR3Q0GEdQZwyqKhnfubo9tOVWwy1xe+sL
	/iIvM8e4cYVFDXvNK4aN+NlqgkCmd2rxqqLV+wwAA/S2z4FQvf4a+tlD
X-Gm-Gg: AeBDieu+fGrsbeVI/BVUZfQHEcthrNAhmVzP2tmQRMd2FCBYpb5ME7eDOj9vqBh4enH
	z2hV4d32NA5TvdSFMy13yFfAn+EasLe27shmbDUZtg6dakh/5tDWqAhPsPYo044WR57wufyCU61
	wgQ9N7fHNbhJUytXuDGnzDVt6ODwrfDTNTc/9ylhUq5M/9NZEV28W1Ldz2RgSjJIek12+9YYWnQ
	KBtEasKFlxIBMR0Ayl8+nUliDuVKeLRRmHSZhigYSFLMab6WbZVZloMDfEmJzo/sAqGPRMJtQu5
	6kJ5tAzDesXVqXSnT8+YFff3NsD4XfvDXqDi43grZ+0mh1Jdnq1aSLiM0BtNnwLZIehRQn6aJqs
	GimXG1qqSMW75TVpdnjK7Hx08SSckcI6V2TmVgnvk7EfwCz5ZwUtJae/w+kTUDOIbRK2KrCDbDc
	BcJxUQu9kJ8aowZHzWVTSejap/ZIyHBnZfC6YuABdd
X-Received: by 2002:a05:600c:4749:b0:488:c6e9:1e0c with SMTP id 5b1f17b1804b1-488fb889385mr13785665e9.5.1776403885540;
        Thu, 16 Apr 2026 22:31:25 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4e4d525sm1499375f8f.31.2026.04.16.22.31.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 22:31:24 -0700 (PDT)
Date: Fri, 17 Apr 2026 08:31:21 +0300
From: Dan Carpenter <error27@gmail.com>
To: Delene Tchio Romuald <delenetchior1@gmail.com>
Cc: gregkh@linuxfoundation.org, luka.gejak@linux.dev, hansg@kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v5 1/5] staging: rtl8723bs: fix heap buffer overflow in
 recvframe_defrag()
Message-ID: <aeHFqf65VfuzkXiE@stanley.mountain>
References: <20260417030110.42991-1-delenetchior1@gmail.com>
 <20260417030110.42991-2-delenetchior1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260417030110.42991-2-delenetchior1@gmail.com>

On Fri, Apr 17, 2026 at 04:01:06AM +0100, Delene Tchio Romuald wrote:
> +		/* Verify the receiving buffer has enough space for the fragment */
> +		if (pnfhdr->len > pfhdr->rx_end - pfhdr->rx_tail)
> +			goto out_err;
>  
> -		/* memcpy */

I wasn't going to mention this, but since you're going to need to
resend anyway...  Yes, this comment is useless but don't delete it
as part of a security fix.  It's unrelated.

regards,
dan carpenter

>  		memcpy(pfhdr->rx_tail, pnfhdr->rx_data, pnfhdr->len);
>  
>  		recvframe_put(prframe, pnfhdr->len);

