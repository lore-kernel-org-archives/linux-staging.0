Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B19228D8F1;
	Mon,  9 Mar 2026 17:02:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773075730; cv=none; b=tJSYBQaXNpun+L3B67XlC11O1Pf/EmjjfMynIKxfKoeoE1Hu3NcExfx+xAiiuUQwK5/bJXTWo9fTjkezQLGGqU2t/a8Oj+1msQYnVd8ysPYf9dLjQglIILYCKSEKLSAcZkK+Fero1axGBXbNBVHEYNOC9+ldwGRFYF4fyDgC13Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773075730; c=relaxed/simple;
	bh=tnjyYPNxgmZab4qqz29vOF902Q8ShG+Y2cVMR3QtI68=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OcAzHfoOcd0Qxqc9DarpX9ouJONCZv2OfDtPTVCsZCaBt/v46Gl7EHtU0KYzCCoid23DIP3B2L4EMMRFOLQ3OSRWBaojTXaiR7tIOezW862ZNNQh29dgLxurhUbHfrxxgi1Rhi1sl6VX/yaI6FPv5Fn7eCS+khGNxCkL2VrRts0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=BaFBoS6I; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="BaFBoS6I"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB7FDC19423;
	Mon,  9 Mar 2026 17:02:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1773075730;
	bh=tnjyYPNxgmZab4qqz29vOF902Q8ShG+Y2cVMR3QtI68=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BaFBoS6II6cFbY0VVqF5jNDQB9prb3k2uuUCoD+OPHNjYgU/IAgiQ/6ItwzSfbH8P
	 fmOfKbKs1842QIPB+EfavkB0XRo6w2UzdDDshf04g8XbD150T/UntkMYLYy2LMEGb4
	 peC0lGETaQJmCo8PJwnOoe3bY55dp/cOryYLjtyY=
Date: Mon, 9 Mar 2026 18:02:07 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Josh Law <hlcj1234567@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	Josh Law <objecting@objecting.org>
Subject: Re: [PATCH] staging: axis-fifo: remove redundant goto end
Message-ID: <2026030928-smartly-spinster-ae05@gregkh>
References: <20260301005019.2510157-1-objecting@objecting.org>
 <2026030908-destitute-rely-9997@gregkh>
 <532d31d1-0c06-4c8a-af80-86b6fdf07225@gmail.com>
 <67b71192-97e8-40f6-9b88-666526ccd16e@gmail.com>
 <2026030952-petroleum-osmosis-50df@gregkh>
 <356a52f4-84d0-4872-b713-9833f07e1a8e@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <356a52f4-84d0-4872-b713-9833f07e1a8e@gmail.com>

On Mon, Mar 09, 2026 at 04:59:58PM +0000, Josh Law wrote:
> 9 Mar 2026 16:57:19 Greg Kroah-Hartman <gregkh@linuxfoundation.org>:
> 
> > On Mon, Mar 09, 2026 at 04:14:47PM +0000, Josh Law wrote:
> >> 9 Mar 2026 16:12:17 Josh Law <hlcj1234567@gmail.com>:
> >>
> >>> 9 Mar 2026 16:09:27 Greg Kroah-Hartman <gregkh@linuxfoundation.org>:
> >>>
> >>>> On Sun, Mar 01, 2026 at 12:50:19AM +0000, Josh Law wrote:
> >>>>> Signed-off-by: Josh Law <objecting@objecting.org>
> >>>>
> >>>> No changelog and your From: line does not match your signed-off-by:
> >>>> line, as others have pointed out :(
> >>>>
> >>>> thanks,
> >>>>
> >>>> greg k-h
> >>>
> >>> I think I made V2s.
> >>
> >> Oh and also I made 10 V2 patches, come on.. atleast ONE is useful for you
> >
> > I have processed all pending staging patches now.
> >
> > thanks,
> >
> > greg k-h
> 
> You've NAKed all 10 of my patches....?

You have had review comments on all patches sent that I can see, did I
miss any?

thanks,

greg k-h
