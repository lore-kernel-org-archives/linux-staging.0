Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42474368946;
	Fri, 22 May 2026 05:08:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779426483; cv=none; b=PPEE2szeko324NhlE4SWdSYZbMxgfPsxTmYo0XltOU9Hvdo5L36AK/h22wd4s/KveWBx7FyiLDujhHWuRx02KDnyA/A640JQUv3RCVwfyn3JYofoFvEjwk5Ik/VjpKxAsTFBJncluuFsNKf1LH5mhIaGSxcr30f0sd5z0/lNFB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779426483; c=relaxed/simple;
	bh=sjJU2QpHsfhqskQ4sbVH7eDyzK5+2S/nSxFPUJZotu4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rvCCW0SXXSdTgd5H5wZZIxjNxB9XCZBMXwLBvafhG2NC9NY/LJ4xMMSkb1QIRZlUP0F+GhUTQ6pREGL05lvueCtaBBH2PXs/cB9hYFfTtL/okZC3rJj7k/Lvk5vILPSORc7zL+5nN579gqbJrIOQojHx5jvrDWXIA3lfggB/56M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=TjMjszYn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="TjMjszYn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 073921F000E9;
	Fri, 22 May 2026 05:07:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1779426479;
	bh=+9T+MJetygSRoKxcfVda2WKPfjsua3gdfJ1IwORPY94=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=TjMjszYnq3O1YYgH4/5iqmGqbYxgjAwsGmYWkHKGywsPvHh+zb35LyDeHSOcxjPnO
	 7ddvspYGzgn0waT8YmwbO5OKE4dRKWDwBrYxLMuBoW+b6UuCVscBOxwAGCONGSo14F
	 VQSx0hsTHGZdKAgP+4oTX7tdzQjHqPaRhs0KNl18=
Date: Fri, 22 May 2026 07:07:10 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: "Alexander A. Klimov" <grandmaster@al2klimov.de>
Cc: Vaibhav Agarwal <vaibhav.sr@gmail.com>,
	Mark Greer <mgreer@animalcreek.com>,
	Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
	Elise Lennion <elise.lennion@gmail.com>,
	"moderated list:GREYBUS SUBSYSTEM" <greybus-dev@lists.linaro.org>,
	"open list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] staging: greybus: audio: expect 0 from kstrtoint(), not 1
Message-ID: <2026052249-shrank-trophy-14ff@gregkh>
References: <20260520180401.539215-1-grandmaster@al2klimov.de>
 <20260520180401.539215-3-grandmaster@al2klimov.de>
 <2026052158-willing-dreadful-857b@gregkh>
 <9caaf426-1912-43e0-949f-fb7bb6bbd1cc@al2klimov.de>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9caaf426-1912-43e0-949f-fb7bb6bbd1cc@al2klimov.de>

On Thu, May 21, 2026 at 08:42:06PM +0200, Alexander A. Klimov wrote:
> 
> 
> On 5/21/26 10:38, Greg Kroah-Hartman wrote:
> > On Wed, May 20, 2026 at 08:03:59PM +0200, Alexander A. Klimov wrote:
> > > kstrtoint() returns "0 on success, -ERANGE on overflow
> > > and -EINVAL on parsing error". In contrast,
> > > manager_sysfs_remove_store() and manager_sysfs_dump_store()
> > > checked for 1 which always failed the operation. I fixed this.
> > > 
> > > Fixes: f9a21a3f4919 ("staging: greybus: audio_manager_sysfs: Replace sscanf with kstrto* to single variable conversion.")
> > > Signed-off-by: Alexander A. Klimov <grandmaster@al2klimov.de>
> > > ---
> > >   drivers/staging/greybus/audio_manager_sysfs.c | 4 ++--
> > >   1 file changed, 2 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/drivers/staging/greybus/audio_manager_sysfs.c b/drivers/staging/greybus/audio_manager_sysfs.c
> > > index fcd518f9540c..581791d566e3 100644
> > > --- a/drivers/staging/greybus/audio_manager_sysfs.c
> > > +++ b/drivers/staging/greybus/audio_manager_sysfs.c
> > > @@ -44,7 +44,7 @@ static ssize_t manager_sysfs_remove_store(struct kobject *kobj,
> > >   	int num = kstrtoint(buf, 10, &id);
> > > -	if (num != 1)
> > > +	if (num != 0)
> > 
> > Doesn't checkpatch now complain about this?
> No.
> 
> $ curl -fsSL https://lkml.org/lkml/diff/2026/5/20/2139/1 | scripts/checkpatch.pl

Please use lore.kernel.org, not lkml.

Also, when using b4 to apply this, it sucked in a bunch of other random
patches for you, please make new threads for everything you send.

> ERROR: Missing Signed-off-by: line(s)

Why is that showing up?

> total: 1 errors, 0 warnings, 0 checks, 16 lines checked
> 
> NOTE: For some of the reported defects, checkpatch may be able to
>       mechanically convert to the typical style using --fix or --fix-inplace.

What about trying --strict?

Anyway, think about rewriting the check for "== 0" now, that is not
normal kernel style.

thanks,

greg k-h
