Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8F45309F1B;
	Fri, 14 Nov 2025 10:21:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763115717; cv=none; b=uHzNL28wnrS0EESsbeuLII+sYZFY60qKR+ohpmIKLr5uKy55Oj4f32oSaL45lQRcQxTdqvRZAAuVReKOBdeLBCSM3MiKKQC7Gto1/9aM9mcFhZ5+PfIbKqcn3BgZzreZ56+2FR+dF6pkQdN62fLcLxCwEBtqIb60gRNS76Zr2Pk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763115717; c=relaxed/simple;
	bh=lUcCQqWS+lPrmb7n2dNB0MA4DX5n9QTa8H3o4y8I8EI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AagEImZQJ4oh6w4QIBrNvmgFJ/KDV6lrKLnX1sF9zjTO4zr8ys0l+i748XHrlPDneebVBUcBRjXuECMfx0e0ok+sNCNRlk8LNsgWmkOXjGOSkr+oDLs6btcTgnWqQTxlWYnk1k14Zo9vIyjn/gDwnhiG8ejGieSuXWTkQqckMXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=p5sVdlMR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="p5sVdlMR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26AFEC4CEF1;
	Fri, 14 Nov 2025 10:21:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1763115717;
	bh=lUcCQqWS+lPrmb7n2dNB0MA4DX5n9QTa8H3o4y8I8EI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=p5sVdlMRXKxs/wex4/ioBPAWmFd6TViyZkY8tvQGnyHRUgSXedjIQdgISzBbgjER5
	 Vl6kHvgNJPF1E+drpwhl/QujerOkNjjN0XjYwFUGQKhy3wjGnjZKXVscx2Bzj7R4tb
	 LfJMGn/Dp31nmcI3RsiKJ11zbJLS5JeRtKkI2D/o=
Date: Fri, 14 Nov 2025 05:21:56 -0500
From: Greg KH <gregkh@linuxfoundation.org>
To: Johan Hovold <johan@kernel.org>
Cc: Dave Penkler <dpenkler@gmail.com>, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH V3 0/6] Destage gpib drivers
Message-ID: <2025111431-automatic-quintuple-c07a@gregkh>
References: <20251113104543.5875-1-dpenkler@gmail.com>
 <aRbs_4yzncsoAkB2@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aRbs_4yzncsoAkB2@hovoldconsulting.com>

On Fri, Nov 14, 2025 at 09:49:03AM +0100, Johan Hovold wrote:
> On Thu, Nov 13, 2025 at 11:45:37AM +0100, Dave Penkler wrote:
> > This patch series is for moving the gpib drivers out of the staging area.
> > 
> > As many changes as possible (patches 1-5) are done in the staging area
> > to prepare for the move. Patch 6 does the move and completes the destage.
> > 
> > Patch 1: Remove gpib from Kconfig and Makefile in staging
> > Patch 2: Remove the gpib/uapi directory from include search path
> > Patch 3: In the code change the uapi include file paths to <linux/xxx.h>
> > Patch 4: Remove comment item in TODO file
> > Patch 5: Add SPDX syscall note to uapi gpib headers
> > Patch 6: Complete the destaging of gpib
> >       - Move the common gpib/uapi headers to include/uapi/linux
> >       - Move the gpib tree out of staging
> >       - Delete the word Linux from gpib Kconfig option title
> >       - Add gpib to Kconfig and Makefile in drivers
> >       - Update MAINTAINERS
> > 
> > Dave Penkler (6):
> >   staging: Remove gpib build from staging
> >   staging: gpib: Remove gpib/uapi from search path
> >   staging: gpib: Change file path for uapi headers
> 
> Sorry if it wasn't clear, but I meant that you should squash also these
> three into the patch moving things out of staging.
> 
> >   staging: gpib: Update TODO file
> >   staging: gpib: Fix SPDX license for gpib headers
> >   gpib: Destage gpib
> 
> So in the end you'd only have these three patches.

I agree, that should be the max of what needs to be here.

thanks,

greg k-h
