Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9F8F4534AE
	for <linux-staging@lists.linux.dev>; Thu, 15 Oct 2026 19:57:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792094230; cv=none; b=L4+ZoqVxGoRxPmlz5Wy5v6VWQRnfB9sfDP2wzYZu1rJOBAarwUFyhDV81ILSECdELzl+ASm5qTw1JkiwwnRvxhbNqlVra5H3vlQisGmilZGoQo3WgxZOgrVXAAUgFiYnNZboiJcLDyWvJBor7uhD0H/BgOTqwmK9VSDa28bbTXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792094230; c=relaxed/simple;
	bh=W+WQcbkuYlf7iZbcxCz0t5n2JDNxk3p3Ac8rA0qdxo4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jMjChj2VdBCxs7oSMLOUurwc7dLlZ3I6m0QgGl5gqXOkk3VM7Y5HT0Y0wPmCRQIJbiGSDSqU1Hr2fBSVrrEcu77xaKolf7GC4yKw47Hka01NQVMcdog6sgY3OI6xeYA0iXAKAgBbmOO+Tf9etZKDt5v/vnDtj09N8VoZLKzLISs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IV9Ncna1; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IV9Ncna1"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48b001cd92bso499727f8f.2
        for <linux-staging@lists.linux.dev>; Thu, 15 Oct 2026 12:57:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792094227; x=1792699027; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JdoamN/QCC00RvjhRgyruFfNMjWo34XWF83HIj4FenE=;
        b=IV9Ncna1iVgpQ6ZIVGbDRnAyeL6OHFVt3Ac3z2bX/+xv9r3MvOZt2ykcvUWxGeGL7n
         B7u8RnTm2+rGFbgx/goaH4oHEhflOeELSfGxB6xFhVHHRjQSBFw3jCPG5LMuLhDEWdzh
         44O3Hfpj8U3K35fPooHr25YmSiVZ5ngQ+MD9IPC07Dbn1KLWuEtR3imL6AyiJ0FA72l5
         8gUOaOBH6hNmYeILI0MvpU0Z6SdiEVCuH6rqg5CYcsYTw2KqE6SWh857TbNqIzIl4TgJ
         3q2e1LXdvY7SKi0G9pm0tW9j2qQWzAxZ0v0/CS3EuherzRHLaErBjbfCuQhV76HNHHNW
         PbUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792094227; x=1792699027;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JdoamN/QCC00RvjhRgyruFfNMjWo34XWF83HIj4FenE=;
        b=hncn4d5iMZEyHMczAA3p3PHg8Ct5xYiTTh8JO8nyYL29Gsv999gBKOqNyIT0NzSqdU
         neoMGPdbC/7mXjekE/qKCO3fT+Wtcg4RD1fQ296y0Oazuaol6sRq+IpQrJfgTzCIb5Al
         X2HrnzI1dp93Remnfr6q4g+P51cu1++C8Bne0jGR2OHgtKR4cP5VluMjHoncESVgWeWA
         sNoy/K0vhwJysEqGMzaefU7gOfNvp5zz609HFvZthCMeHBr9z5WNnWu+abz0NWhMNzOz
         9n27jQFYEayVq9DdvhC4lQ2bZacl0E7WKKAmgmxAItp89ludoKfGb7dDNl7lMxtrKfrK
         D37g==
X-Forwarded-Encrypted: i=1; AKwUvBzmuvcQ/HhWMo6QfvtpengfwxNqZ+MobTl/z88tSCUV7zFBfAfa5/sDKvsb2k7JPUQfpruIj+pVXVC2Lnyo@lists.linux.dev
X-Gm-Message-State: AFq9FYL0m+XL/0BjyTGqdLyd80rjaw0hRFbQwWIrKb1Z9pv4zQ2nMutx
	zZ44wtwMmLpaV2yHGm/QW+KOgsbXUSzVSBK8Xtu1TLzT37BQFTRpZezn
X-Gm-Gg: AYBFou0qkvq/Uzi/1miZ2Yg9Jqc/36zO8YGFBluij1gNpl8K4X3pxHhe4KZkHB3JX0/
	evDa56sKGkB6HXGs95Wc3rO4sdt9iNl6zJPAFc06eJlUWwNLG5WlxjLPlXCEhi3auIEcNNooKJ9
	NiCqGnuewo65pjV59oDaoSYRYQI4o90t3RjMkE1wSBiEhHLrULbVnnzjxF8oJ02LJooUwn0YTIv
	bZu3C+JqouGs2GcqmwH+DxFid3FNBMfpaqo/luf8L6bRcGUANwxi6ItvwUauO5uM9Rz/13lM7nk
	XKGEkCG3FvtXjqCVHqu2xFWorD2sgjF8vyYqbcQQLE+shpsLcIH+n/nFRS1S5FVAXSn9il+xS88
	cv+nmxdBXyNV5TH8SwAUmgxXvFOIJJmkmIvJBMRB3I0pyKg0mk01gbS1Nc548Sz04rifaaRVDPB
	SeOKs1uFH8LYLF8+Ukh5dlk/TrM3jKsrO/nR8EAOjjB4RcEcwoJYVL3JssD5PUaOArpFE=
X-Received: by 2002:a5d:6402:0:b0:48c:7f18:c85e with SMTP id ffacd0b85a97d-48dbace9c60mr29174300f8f.45.1792094226897;
        Thu, 15 Oct 2026 12:57:06 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4f8cfesm200478f8f.37.2026.10.15.12.57.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 12:57:05 -0700 (PDT)
Date: Thu, 15 Oct 2026 22:57:01 +0300
From: Dan Carpenter <error27@gmail.com>
To: Julia Lawall <julia.lawall@inria.fr>
Cc: Alex Elder <elder@ieee.org>, pavankumaryalagada@gmail.com,
	johan@kernel.org, gregkh@linuxfoundation.org, vireshk@kernel.org,
	elder@kernel.org, greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev
Subject: Re: [PATCH v4] staging: greybus: replace PTR_ERR() with %pe in error
 messages
Message-ID: <atEwDf4RuTWtaSoW@stanley.mountain>
References: <20261015082238.65187-1-pavankumaryalagada@gmail.com>
 <99cd529b-dffd-4315-b9be-9b0029973497@ieee.org>
 <cc868527-c13c-4e9b-aa7a-d2553f93d92@inria.fr>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cc868527-c13c-4e9b-aa7a-d2553f93d92@inria.fr>

On Thu, Oct 15, 2026 at 02:10:53PM -0400, Julia Lawall wrote:
> 
> 
> On Thu, 15 Oct 2026, Alex Elder wrote:
> 
> > On 10/15/26 3:22 AM, pavankumaryalagada@gmail.com wrote:
> > > From: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>
> > >
> > > Use %pe to print error pointers directly and display their
> > > error names.
> > >
> > > Keep PTR_ERR() calls when the numeric error value is needed
> > > for returning the error code.
> > >
> > > Signed-off-by: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>
> >
> > In a few places you are *adding* the error value where it was
> > missing (which I think is an improvement).  I assume that the
> > return values in this case are negative errnos.
> >
> > It would have been worth mentioning this other type of change
> > in the patch description too.  But it's not worth doing a new
> > version for that.  I trust you found all the spots, and fixed
> > them this way.  This looks good to me.
> 
> This Coccinelle semantic patch finds over 3000 opportunities for this
> change in the kernel as a whole.  Outside the context of outreachy, I
> wonder if people would be happy to see such changes, since the %pe code
> seems much more informative.
> 

I like %pe but it's not universally popular.  I've seen people NAK
these patches because it looks weird in their subsystem and I'm
wondering how many error messages their code prints?  Surely, any
error message would stand out is weird and undesirable?

regards,
dan carpenter

