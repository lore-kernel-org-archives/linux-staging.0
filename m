Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8D461110
	for <linux-staging@lists.linux.dev>; Sat, 21 Oct 2023 09:05:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="GziCnu4o"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8EB9C433C8;
	Sat, 21 Oct 2023 09:05:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1697879141;
	bh=UUPHbRL9hzVZTQ/GEAG/vZWDDvjseJWneH2KZDRKhUY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GziCnu4ok7S8zjJ7FYHD1tcAAk4WYU9lNVfWW9FsR66Qfdrhu8GZQJ8X5QvY7N2kC
	 eYVYyzmWWRsgE2P2oXHQQ+Zg5Yml+n3p+7QGrR/VHo0/gBWxikWZn/0P2V17De2K+Y
	 zlWAOvqCs7RyQ7tiVfVfGLqpdQNlc06MFEFa8YgU=
Date: Sat, 21 Oct 2023 11:05:38 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Jonathan Bergh <bergh.jonathan@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: octeon: Fix warnings due to introduction of new
 typedefs
Message-ID: <2023102108-trend-unfeeling-9b15@gregkh>
References: <20231021081409.67570-1-bergh.jonathan@gmail.com>
 <2023102111-sneak-abreast-8061@gregkh>
 <ZTOS6eaygOA6nRKD@HP-ENVY-Notebook>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZTOS6eaygOA6nRKD@HP-ENVY-Notebook>

On Sat, Oct 21, 2023 at 10:59:21AM +0200, Jonathan Bergh wrote:
> On Sat, Oct 21, 2023 at 10:32:29AM +0200, Greg KH wrote:
> 
> Hi
> 
> >  This looks like a new version of a previously submitted patch, but you
> >  did not list below the --- line any changes from the previous version.
> 
> This patch is a *new* patch which replaced a previous *series* of patches
> so it was considered a *new* standalone patch, rather than a new version 
> of the original series. 

Not really, it's a version 2 as you are doing the same thing.

> > - Your patch did many different things all at once, making it difficult
> >   to review.  All Linux kernel patches need to only do one thing at a
> >   time.  If you need to do multiple things (such as clean up all coding
> >   style issues in a file/driver), do it in a sequence of patches, each
> >   one doing only one thing.
> 
> This patch only addresses removal of typedefs from the declarations 
> and fixes up the implmentations that relied on those typedefs. The previous
> advice was to not make breaking changes across patches, so this patch 
> represents code changes which are as atomic as possible in a single patch
> without breaking the build. It does not mix formatting / other changes
> with the code change. 

Please fix up one typedef at a time.

thanks,

greg k-h
