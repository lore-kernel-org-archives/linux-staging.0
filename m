Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4BA65674E;
	Sun, 22 Dec 2024 06:08:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734847737; cv=none; b=kgb+yPTeYfpsntcN3b0aqggzY5KDPn+RNYikI42RhGfcpubRaYLzwaPbUxN1U15dX/f73HFA3JfX7Qr9w/M/CL5jPeuDi3MasL1k8xwt0fgGbcZVtpV0RTx7D67teNETdQQejiJKPuzS82FMw6KHokzWOKVyPI9FWUB6Oke0C88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734847737; c=relaxed/simple;
	bh=X3D/Bui+angFFjzQSMnB5MnUi5zgw9PbsOwLt/HeCIo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MzkvQdE/dPjYvBCGOGvxsbLw+X14Yoz/XXwWk1CtKSWE9CKnmxXo7gh17/xMOmbjCJmTukzY5M81bUqdZS/414R5+qnkQKyk2pSmAVYU+11cgzWkd476J0QV3yNP1452xtw0ewFoicjUJ4woeOnf0zZynI0TjW5AUmf8L5VrTfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=W5js750f; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="W5js750f"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE1BDC4CECD;
	Sun, 22 Dec 2024 06:08:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1734847736;
	bh=X3D/Bui+angFFjzQSMnB5MnUi5zgw9PbsOwLt/HeCIo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=W5js750fnABCLcdpASpxFOeP5Tcwm09gMce3OrG2fZO/CLgEYxYLXiQ8tEmK+V7FP
	 jkvgaCFJkScTp6ru2SwSFrZmW6ki5bk/oEBPDUK7UInl9SmWlizUMHI1Yiw1ydzpdW
	 vxNqjs3J60AV2Uc6OY2LZP8drsNDUFHPbYlwe5Wk=
Date: Sun, 22 Dec 2024 07:08:53 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Nihar Chaithanya <niharchaithanya@gmail.com>
Cc: dpenkler@gmail.com, roheetchavan@gmail.com, arnd@arndb.de,
	dan.carpenter@linaro.org, kees@ijzerbout.nl,
	m.omerfarukbulut@gmail.com, skhan@linuxfoundation.org,
	everestkc@everestkc.com.np, dominik.karol.piatkowski@protonmail.com,
	nathan@kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] staging: gpib: Add error handling
Message-ID: <2024122223-rebate-germless-c725@gregkh>
References: <20241221214822.163667-1-niharchaithanya@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241221214822.163667-1-niharchaithanya@gmail.com>

On Sun, Dec 22, 2024 at 03:18:24AM +0530, Nihar Chaithanya wrote:
> The function gpib_register_driver() can fail when kmalloc()
> fails but it does not return an error code.
> The function pcmcia_register_driver() returns an error code but
> most of the times is not handled in gpib.
> 
> Modify gpid_register_driver() to return appropriate error code
> and also handle the error code returned by pcmcia_register_driver()
> incase it fails. When any of these functions fail unwind and
> unregister the driver to avoid semi-registered system.
> 
> This issue was reported by Coverity Scan.
> Report:
> CID 1635894: (#1 of 1): 'Constant' variable guards dead code (DEADCODE)
> dead_error_line: Execution cannot reach this statement: return -1;.
> 
> Signed-off-by: Nihar Chaithanya <niharchaithanya@gmail.com>
> ---
> v2 --> v3 : Modified the gpib_register_driver() to return error code,
>             added error handling to all the places that the
>             gpib_register_driver() is called.

You are doing a lot of different things all at once here.  Please break
this up into a patch series, only doing one "logical" thing per change
please.

thanks,

greg k-h
