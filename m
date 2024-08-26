Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DF2712CDAE
	for <linux-staging@lists.linux.dev>; Mon, 26 Aug 2024 07:28:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724657311; cv=none; b=knhhoQOllWLzv69acQTdhu+L48a2075QxFCzB52YgxiOLN1789FuAyT4BzDaEfl9VSKTi3T+KUK1BFHG6zFBuW9RKOUctTCOMVyh/12lCRUfHFWTIQPEVQx/0OX7l/xZzX6nPaC+D5BIKLgXYG1tPenqHEKy8BxgOaWohgpMGlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724657311; c=relaxed/simple;
	bh=NEUvsrWIGuopintg+ZF53sc4sJ3/HAHUMMoDA4oKY08=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=idnowKkInusKxGRXcgkZtZtsxR/gfivviOQHH8uwPE1p3d4safJuPuSpAeMYym7jKSoQa60DJ/MWRvVr6rpqnBEm/FmzXHCijuCybgk1x6quHshWtQl/Oxr3b7lj6BYsngGKSSBYTt1EW2AmkUKhPOr8vXngYlxWfse5dtpEy3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LnNWSzOp; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LnNWSzOp"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5c0abaae174so616296a12.1
        for <linux-staging@lists.linux.dev>; Mon, 26 Aug 2024 00:28:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724657308; x=1725262108; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RbGqkUI0s/gjlQAZIm/lK8sn6ESFX+2I3G+WPltBFcQ=;
        b=LnNWSzOpkDGVe8H28vwXTEpXsxr278jPETsW77tgp2TawyUNZ9ePuPg3l/6ttSWEXc
         gPmBdOvbL9FYyoQIyEyBeVLfgzj4Yw4AuNwgYwHOoDbDm6r8LiVxMNnP9UjvRhB/FEF6
         TdNGvIJ0KRtzRSE51wlh5h6bGyt15Dtdab55jBkslynuQBtiyiFw69x2UdGOCgzx4j7L
         skM1LL6Vp3uxIN12Hn4NPavLnIpg17Wn7imZCycs8BKNifGqJ6ebMGa+RUlrhMCQlST9
         GxCkTlFfwuXS9X2xw+n2N6W+iWHUfDlmj3b+XX/YpFTSQtBvBu5hH7uKmjkZuW5ef89o
         mFIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724657308; x=1725262108;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RbGqkUI0s/gjlQAZIm/lK8sn6ESFX+2I3G+WPltBFcQ=;
        b=FuiLrd17jiyLxKeREylTvU4j2UfTq6xXlyVW0CoDLc6ZUhROtiNeuwmsIPyJiaElsD
         BQBW/l+P9MVKTzPzAxDdqZNiFreGSmGjLZbZ6+cm0KdFSEP3ue1nD4tGvh42j/o/6aqR
         g7bDoEo6q8io4+hrHt+S+VUTu7DxQV5ypWjmSZXWIEHPzr/zgo06604rBNcgCi6VliT3
         4jbRKtzUGl+3NtyTD8OYdI1LfYEB5VNBWrbxVu3biHjYFHhCTZ/jPYBJkR0YXzCsP4nA
         kjH7MX6J74+HB38svzICXrQsgnG55G/V9Hxe2kDi7EZYfGavV0SiFbRQIa1bGtnIPqZj
         YztA==
X-Forwarded-Encrypted: i=1; AJvYcCX3xOSwGwSekCPDBP4PL8u3zFSW2ByP6nDJff/Ryga/cv+OwafNxWhuJZJWUzWywVYC8XIytQw/hmGERRn8@lists.linux.dev
X-Gm-Message-State: AOJu0YwY5lgGUBeE/G1o2kbCW0V6t2ToP6tQBOYnHOXgzV9wHZ+zZ7He
	UiI+ROUDBHGfuO6g67CVwg2mndfNW0gxhZ1cur+5zp1TAkhjnCi30T4nywQDB3w=
X-Google-Smtp-Source: AGHT+IHuCNKZOpTwAIQbI3QRJpJxs21gzKfq52+yERHzKxo0FB3Q/CNhhr8mVEpnGGjQd4Ose+mb4g==
X-Received: by 2002:a05:6402:26d4:b0:5be:eb90:183c with SMTP id 4fb4d7f45d1cf-5c08915f4edmr8424931a12.6.1724657307678;
        Mon, 26 Aug 2024 00:28:27 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c044ddbee6sm5565008a12.9.2024.08.26.00.28.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Aug 2024 00:28:27 -0700 (PDT)
Date: Mon, 26 Aug 2024 10:28:21 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Riyan Dhiman <riyandhiman14@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: vme_user: Change slot number type from int to
 u32
Message-ID: <0289149f-3880-4e20-a22b-8540f212f1b0@stanley.mountain>
References: <20240825072955.120884-1-riyandhiman14@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240825072955.120884-1-riyandhiman14@gmail.com>

On Sun, Aug 25, 2024 at 12:59:55PM +0530, Riyan Dhiman wrote:
> Change the type used for VME slot numbers from int to u32 throughout vme
> driver. This modification more accurately represents the nature of slot
> numbers which are always non-negative.
> 
> The changes include
> - Updating variable declarations
> - Modifying function signatures and return types
> 
> This change imporves type safety, prevents potential issues with sign conversion.

How type promotion works is that if we have if (a < b) { we first cast
everything to int.  Then we look at the types of a and b and if one of them has
more than 31 positive bits,  which ever has the most positive bits then we cast
both sides to that.  The danger is that a negative value will be cast to a high
unsigned value.

In a way you could look at it like the unsigned types are what is making the
code more dangerous.  If we didn't have unsigned types, nothing would change the
negatives into unsigned values.  Sure we'd have to always check for negatives,
but you'd just get used to that and do it.  This is how high level languages
like python work.  They don't have any kind of nonsense about if you're
comparing a define and a number -5 and the define is defined as another define
and you have to dig through five different header files and then the define
eventually becomes a sizeof() and so that means -5 is now 18446744073709551611.
In python -5 is just -5.

Of course, there is a place for unsigned types in C but it's so subtle and
complicated to explain.  I think people wish that there was a way to make C
safer when there really isn't.  There is no easy answer like just declare
everything as u32.  It's a false hope.

Here is a blog with more ranting.
https://staticthinking.wordpress.com/2023/07/25/wsign-compare-is-garbage/

regards,
dan carpenter
