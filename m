Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 077D8210EC
	for <linux-staging@lists.linux.dev>; Wed, 17 Jul 2024 08:46:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721205963; cv=none; b=IcvIW0f8ixXeu9WsBMaCRuv4VK5IlGr10h1YPJGa3In07fPfzyjcN3El0Agp/9XwoRCUOOJygoWUi/o6IWSFh9w/QQK28kyor5dsxezQt5oCX2wtxvDXzkFgEc74h5Xfdg5J305cMTFoLkRJmAPs3RlSfLHE4Rrx+w+QkcMbLMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721205963; c=relaxed/simple;
	bh=CStO0mAdtwSErjeQnIFlbAPVyqbaLcPPt6Dyz9jjnBc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u8M9/NGNepivKt65g510v/byRwb1dGy9PhWcszezE7gjuJKIni+nltlW75Yil6FXjKUliO1kuC9/X95jtfT/iTHr8DR5Av0B3t7I0AzZmQSZFEvv2q+YFKHGmmpz+3HaIZpYZH7jpAAofvs56l1luGgHAyo6iy69zbLrsGrVXj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=EySruW8V; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="EySruW8V"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29322C32782;
	Wed, 17 Jul 2024 08:46:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1721205962;
	bh=CStO0mAdtwSErjeQnIFlbAPVyqbaLcPPt6Dyz9jjnBc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EySruW8VpxdzuTjivdsB2C6ch2FDE/+amFGWGARBRPx+XmbtOou93BSqt3OtdgvBO
	 DUlaepuTq6YuBGBzBbL91ivornqAPoaHHysUkxBMtP55LVHcV7bLKI7YqZimsJlohR
	 cAIQMhdIs6Xe/aRlUzIZne0KE/N6DyQ+EXyq6KRs=
Date: Wed, 17 Jul 2024 10:45:59 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Juan =?iso-8859-1?Q?Jos=E9?= Arboleda <soyjuanarbol@gmail.com>
Cc: pure.logic@nexus-software.ie, johan@kernel.org,
	linux-staging@lists.linux.dev, trivial@kernel.org,
	greybus-dev@lists.linaro.org
Subject: Re: [PATCH] staging: greybus: Enclose multi-statement macro in
 do-while loop
Message-ID: <2024071723-nurture-magical-7817@gregkh>
References: <ZpdrmuzGgYDJ-Bb0@fedora>
 <2024071739-mollusk-uneaten-8dec@gregkh>
 <ZpeAsakTE0ZL90kt@fedora>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZpeAsakTE0ZL90kt@fedora>

On Wed, Jul 17, 2024 at 03:28:33AM -0500, Juan José Arboleda wrote:
> On Wed, Jul 17, 2024 at 09:50:52AM +0200, Greg KH wrote:
> > On Wed, Jul 17, 2024 at 01:58:34AM -0500, Juan José Arboleda wrote:
> > > The macro `gb_loopback_stats_attrs` in the Greybus loopback driver
> > > contains multiple statements, which should be enclosed in a do-while
> > > loop to ensure proper execution and adhere to coding standards.
> > > 
> > > This patch modifies the `gb_loopback_stats_attrs` macro to enclose
> > > its statements in a do-while loop, addressing the style error flagged
> > > by checkpatch.pl.
> > > 
> > > Signed-off-by: Juan José Arboleda <soyjuanarbol@gmail.com>
> > > ---
> > >  drivers/staging/greybus/loopback.c | 8 +++++---
> > >  1 file changed, 5 insertions(+), 3 deletions(-)
> > > 
> > > diff --git a/drivers/staging/greybus/loopback.c b/drivers/staging/greybus/loopback.c
> > > index 4313d3bbc23a..a97de86c67a5 100644
> > > --- a/drivers/staging/greybus/loopback.c
> > > +++ b/drivers/staging/greybus/loopback.c
> > > @@ -163,9 +163,11 @@ static ssize_t name##_avg_show(struct device *dev,		\
> > >  static DEVICE_ATTR_RO(name##_avg)
> > >  
> > >  #define gb_loopback_stats_attrs(field)				\
> > > -	gb_loopback_ro_stats_attr(field, min, u);		\
> > > -	gb_loopback_ro_stats_attr(field, max, u);		\
> > > -	gb_loopback_ro_avg_attr(field)
> > > +	do {							\
> > > +		gb_loopback_ro_stats_attr(field, min, u);	\
> > > +		gb_loopback_ro_stats_attr(field, max, u);	\
> > > +		gb_loopback_ro_avg_attr(field);			\
> > > +	} while (0)
> > >  
> > >  #define gb_loopback_attr(field, type)					\
> > >  static ssize_t field##_show(struct device *dev,				\
> > 
> > Are you sure you test-built this change?
> > 
> > thanks,
> > 
> > greg k-h
> 
> Yes! I build and clean and build and clean and build again, everything seems
> fine from the compiler side and posttest task as well. Everything seems ok.

You did not actually build this file that you modified :(

Always test-build your changes.

thanks,

greg k-h
