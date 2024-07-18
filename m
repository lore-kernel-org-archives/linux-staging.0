Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 795DB27462
	for <linux-staging@lists.linux.dev>; Thu, 18 Jul 2024 04:35:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721277310; cv=none; b=kRXfyPflDiD5Coe2gmXV8627a7uZ5wy/bJc6Oy/KmZFh6uqG/KvuvCyD/xbBManlHBA3uAFUs3xE5Bi5mYo8/7UYPy+bNF5135UNDkK8WukIHFb84MRY1ngxhlEiLsjzJ3+YE1ke/WgdhC4j6pG+E7SiRLmANl5lyhDUsCqZNYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721277310; c=relaxed/simple;
	bh=+EJ4ixSUyy459vNaFAELty0ievLu6B+c02XoqnGn0ck=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=COMINwFbgGOc5CDgXf7mGt7hU6+Xqn6WGUs2aeZK6urIe2nsnSMZbdah3qFSDBE1EETG/FrVbHCGlV/RDnATYLGtGhQP6U7cFuPIwCKRaN6YGFiSytq+Gwq6gaxFaI/2he506SCFTLfLl14i1DczQXA2q+KQ9yqkhdTacBDX8eg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=LEx7Srw9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="LEx7Srw9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDBE6C116B1;
	Thu, 18 Jul 2024 04:35:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1721277309;
	bh=+EJ4ixSUyy459vNaFAELty0ievLu6B+c02XoqnGn0ck=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LEx7Srw9oyS8oNa0DeQILSJGudA4Q9HBjqx902NqSKldrqLYUVWdAxO9b+F9Kxo6g
	 CdQJAcFr4wAXEXpP6DBAX2WZJBoO0LxeDup7sxPzpt+k4YkUiQW4HumRBO7wT5At0+
	 NXgVugfF+adj5TAfKV4zwVN6fIHEUZcRArh2P6oY=
Date: Thu, 18 Jul 2024 06:35:06 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Juan =?iso-8859-1?Q?Jos=E9?= Arboleda <soyjuanarbol@gmail.com>
Cc: greybus-dev@lists.linaro.org, johan@kernel.org,
	linux-staging@lists.linux.dev, pure.logic@nexus-software.ie,
	trivial@kernel.org
Subject: Re: [PATCH v2] staging: greybus: break multi statement macro into
 multiple lines
Message-ID: <2024071822-silver-sandblast-754f@gregkh>
References: <2024071723-nurture-magical-7817@gregkh>
 <20240718033207.333591-1-soyjuanarbol@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240718033207.333591-1-soyjuanarbol@gmail.com>

On Wed, Jul 17, 2024 at 10:32:07PM -0500, Juan José Arboleda wrote:
> The macro `gb_loopback_stats_attrs` in the Greybus loopback driver
> contains multiple statements, which should be enclosed in a do-while
> loop to ensure proper execution and adhere to coding standards.
> 
> The latter is not possible as the macro expansion will create invalid C
> syntax. Theres is not such thing like inner function definition inside a
> global scope do-while in C.
> 
> This patch nukes the `gb_loopback_stats_attrs` macro to enclose,
> addressing the style error flagged by checkpatch.pl.

The style error here is just wrong, the original code is fine.
Remember, checkpatch provides hints, it isn't always correct, and many
times, like this one, it's completely incorrect.

> 
> Signed-off-by: Juan José Arboleda <soyjuanarbol@gmail.com>
> ---
> Notes:
> 
> This new version uses a bit different approach so the commit message
> will be a bit different as well.
> 
> P.S: Thanks for being that patience and apologies for that false
> positive of building the non-included driver. Now it is tested-built.
> 
>  drivers/staging/greybus/loopback.c | 29 +++++++++++++++++++----------
>  1 file changed, 19 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/staging/greybus/loopback.c b/drivers/staging/greybus/loopback.c
> index 4313d3bbc23a..88d86b084f28 100644
> --- a/drivers/staging/greybus/loopback.c
> +++ b/drivers/staging/greybus/loopback.c
> @@ -162,11 +162,6 @@ static ssize_t name##_avg_show(struct device *dev,		\
>  }									\
>  static DEVICE_ATTR_RO(name##_avg)
>  
> -#define gb_loopback_stats_attrs(field)				\
> -	gb_loopback_ro_stats_attr(field, min, u);		\
> -	gb_loopback_ro_stats_attr(field, max, u);		\
> -	gb_loopback_ro_avg_attr(field)
> -
>  #define gb_loopback_attr(field, type)					\
>  static ssize_t field##_show(struct device *dev,				\
>  			    struct device_attribute *attr,		\
> @@ -268,15 +263,29 @@ static void gb_loopback_check_attr(struct gb_loopback *gb)
>  }
>  
>  /* Time to send and receive one message */
> -gb_loopback_stats_attrs(latency);
> +gb_loopback_ro_stats_attr(latency, min, u);
> +gb_loopback_ro_stats_attr(latency, max, u);
> +gb_loopback_ro_avg_attr(latency);

Unrolling the macro like this does fix the warning, but at the expense
of more code size and manual work.  We write code first for us to
understand, and second for the compiler.  The original code is just
fine, no need for a change at all.

sorry,

greg k-h
