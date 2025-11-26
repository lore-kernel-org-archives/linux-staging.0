Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05CF426D4F9;
	Wed, 26 Nov 2025 13:26:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764163610; cv=none; b=mfHdpi9CmuaC00bUQrG4KQ83NcQf9sKHSr3lmAJkAHsegkQhqPzA8aSTFwnnM29X5aTqLmza14xWMhtD3+CXX44Ctcrm11ulUnRXggCqc1iEyHxt6JxRe/8bDg4/e3x+PTkB5mTGLamyyQvCK0k12A8McsQw1iFEM3cPrT1waKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764163610; c=relaxed/simple;
	bh=6BO0B+JLBzL9xJKu1XJdmL50YZtZlsHQtT3qa8thsRk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DN3TeKMAoiptyj8B10XXgnX8EFR1q+665PKagpwYZCZNBKABF63D5XCxW3eBm2GQnS0p5TLFdVWqsNXqFkcoxmT26Dq5rpqZED51Pj6kjxpl/v92iX5TCk/GwpRpYUFND4BOO/qQJc1y8BQMwS+3LOqvIL0j6/pFi9d8TyUg1Ss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=sbeF3flM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="sbeF3flM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3892BC113D0;
	Wed, 26 Nov 2025 13:26:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1764163609;
	bh=6BO0B+JLBzL9xJKu1XJdmL50YZtZlsHQtT3qa8thsRk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sbeF3flMCGE3OxUXbxhD5JKYf/nHCqXyyGNU93s9lScaYJ3Ox9VfOaQpX9ZqLNNq2
	 ZuNTc7eN94Fdj1+lpWl+GYHkMN7VJCMLe3anHpYO7xchoAqCBINnNbNzOt3gYemuY+
	 ALBfga5sUzaSyYEp17Jb9YYC63GxRAqRp+9aiOaU=
Date: Wed, 26 Nov 2025 14:26:47 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Haotian Zhang <vulab@iscas.ac.cn>
Cc: dpenkler@gmail.com, matchstick@neverthere.org,
	niharchaithanya@gmail.com, paul.retourne@orange.fr,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: gpib: ines: Check the return value of ioremap()
Message-ID: <2025112622-absently-remarry-3b51@gregkh>
References: <20251126013618.1052-1-vulab@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251126013618.1052-1-vulab@iscas.ac.cn>

On Wed, Nov 26, 2025 at 09:36:18AM +0800, Haotian Zhang wrote:
> The function ioremap() in ines_gpib_config() can fail and return NULL,
> which is dereferenced without checking, leading to a NULL pointer
> dereference.
> 
> Add a check for the return value of ioremap() and return -ENOMEM on
> failure.
> 
> Fixes: bb1bd92fa0f2 ("staging: gpib: Add ines GPIB driver")
> Signed-off-by: Haotian Zhang <vulab@iscas.ac.cn>
> ---
>  drivers/staging/gpib/ines/ines_gpib.c | 5 +++++

This file has now moved :(

And do you have this hardware to test this with?  If so, a lot more
cleanup can be done in this function.

thanks,

greg k-h
