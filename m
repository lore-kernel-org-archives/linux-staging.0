Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFB8D3644C3;
	Mon, 27 Apr 2026 03:50:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777261823; cv=none; b=WuJMYHCMDxIhtHmMThh+ygLZ+dXpXKNBKNtN4Rr+nxv5sAxYIwOK1jTmuJfpbn4FBLYpx6JN/YoWhqzVpz9TusiEO3yfzUm+Rnix+z1EVxKKV+cMjUsEZOFvOcrMxPeXHwBHj+pUsyPd1uimGblBWDeXFFZfA7B3fh1FQ27GTvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777261823; c=relaxed/simple;
	bh=4eOA7pASLsksDUJSm3CgnPKWmGkDQuCWRqf1JJH6tKs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FLaMJbeAqQRXDytiFx9kzCuEbrBdJdXFDrheNE4KWrcHASLMFmbeNBLVVItETW7eFuGbnKjnywSvdW+bKmwBzmCOCeJSaSjNUL3tv481WVHZc6Bysdo6hUgM1Cm92OldyYi2TmCnHDvHRdg6sYtVq58JHxoYr+6dn52er7Xgx+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=ilzk020f; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ilzk020f"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85832C19425;
	Mon, 27 Apr 2026 03:50:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1777261823;
	bh=4eOA7pASLsksDUJSm3CgnPKWmGkDQuCWRqf1JJH6tKs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ilzk020fupl362To5VbZT6eBqlUAEMTBqM+yCZh5By44IWxMK/50A3PXYqS0MG+xr
	 YskY0Emybpw6XK7mG5PLgntrHEfA7xSfF28dvjnfmxHD4iLSA5pCrCwKRnvevM8XhM
	 UiOvN3UABx/mYb51UU555UJ5BvCjFM7xZ9Fv7RgY=
Date: Sun, 26 Apr 2026 20:56:33 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Eric Wu <kunjinkao.jp@gmail.com>
Cc: Yoelvis Oliveros <yoelvisoliveros@gmail.com>, Len Bao <len.bao@gmx.us>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: octeon: remove typedefs from octeon-stubs.h
Message-ID: <2026042610-winner-affecting-a263@gregkh>
References: <20260426031100.97996-1-kunjinkao.jp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260426031100.97996-1-kunjinkao.jp@gmail.com>

On Sun, Apr 26, 2026 at 11:11:00AM +0800, Eric Wu wrote:
> The Linux kernel coding style discourages the use of typedefs for
> enums and structs. checkpatch reports seven "do not add new typedefs"
> warnings on drivers/staging/octeon/octeon-stubs.h.
> 
> Drop the typedef wrappers in octeon-stubs.h and convert the affected
> users in ethernet.c and octeon-ethernet.h to use the underlying
> 'enum cvmx_*' / 'struct cvmx_*' tags directly.
> 
> No functional change. Compile-tested with CONFIG_COMPILE_TEST=y and
> CONFIG_OCTEON_ETHERNET=m on x86_64; both default and W=1 builds are
> clean.

As was stated to others attempting to do this, this should be a patch
series, with one patch per enum changed, right?

thanks,

greg k-h
