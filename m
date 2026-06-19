Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CACE9281525;
	Fri, 19 Jun 2026 04:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781843922; cv=none; b=VYzNwE4gPt2q8JyhZtcmn1n9lCnAph0ILMcqPQJLe6eOvd4KthgWOihrv0Phvx4Z8tCqgAQjoICYlDYCMmpsv2tLlTE/+8REQFIvIDFxDIjK1zkG28tyiLekrM6Z0sq9kYdt2d3aF7MVvzibIPeewBZdXTPzPCiWsnRt2HNO2ks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781843922; c=relaxed/simple;
	bh=6S4VnOhORROp/XkBmIneq7a6v+m+1pXdqKYd6Vh0yBE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q54rHnyKth2I1xo/49Z8r/9KaziN9BbZMxc9etF0wIYKh6e8LffwWQSKPq6JTSMhgv9aphJZ3Gg5jWm4SK33aVxsbyCBFY05LZNNUyHF4I5G+MtC1c91dWR6FapVpoQM4JQ/utrLbXW9Pl3vMLQhP4JV3+qo47DvDHmMM+sual8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=jiP29UFR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="jiP29UFR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 019501F000E9;
	Fri, 19 Jun 2026 04:38:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1781843921;
	bh=zCFQ+eDfHboVvZeFT2xZ8r0MnvPiiPD1gM/pDQCSrRs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=jiP29UFR7GTsNluNwzmx2Bb7onwHPvUYc7/KBcQ7T2TYrWmpU68aoi35u0WRgeNn2
	 mNvjkQflA1kbJc15PvVAG7gyMdkW4jMzq8qMnhnDHygpqJmAwnGFtL52vFQXyCMLyR
	 v7E1E+SOzhsTf1O1jvd5fv6dt7xlS8F1USe3imBE=
Date: Fri, 19 Jun 2026 06:37:35 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Maoyi Xie <maoyixie.tju@gmail.com>
Cc: Vaibhav Agarwal <vaibhav.sr@gmail.com>,
	Mark Greer <mgreer@animalcreek.com>,
	Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: staging: greybus: audio: possible out of bounds read in the
 topology parser
Message-ID: <2026061910-supply-jersey-bb24@gregkh>
References: <178183657058.3862365.12892304946786698397@maoyixie.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <178183657058.3862365.12892304946786698397@maoyixie.com>

On Fri, Jun 19, 2026 at 10:36:10AM +0800, Maoyi Xie wrote:
> Hi all,
> 
> I think the Greybus audio topology parser in
> drivers/staging/greybus/audio_topology.c can read past the topology blob
> when a module reports inconsistent counts.

The kernel trusts the hardware, and the drivers have never been reviewed
or audited for if the hardware does not report the correct data.  I'm
sure there are lots of code paths that are buggy if the hardware starts
to do odd things.  If this is a threat model you worry about, and wish
to address, wonderful, there should be lots of code to change :)

But for now, Linux assumes that the hardware is trustworthy once a
driver is bound to a device.

thanks,

greg k-h
