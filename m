Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 814013E5574;
	Wed, 18 Mar 2026 15:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773846714; cv=none; b=kfbsYO6OrmEop5q0qjIdti6cwhWrCHseuJ36a6UflP//D9j7rEw524keCVPe5bMwiOxZ725COvCYlWSrpjsFmJdtELcS7Lrf+48DPDLOd1PJyAdvJ3Ab1FnG0B/32b4yeSdzNfWNi2OWVnoQidbGRP67ns+baXMXVo6reUuF9vs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773846714; c=relaxed/simple;
	bh=vMV2f8rN8rE2OWXVFxaL/aoliqsL2kZZqoM3N1R9FmM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OQwBVs2uQb5q6OJiRfyOvvom8ILZwqxwafMyUso4h/T5bR1VAZFUT6+hwCPLOxssnBkKHjDjNrkc0klXxXjy33h+N7+qsGqNXKvM9Qj0W1pBRLb6u0EIl9blPq3z3MJMiORUeQR1kAZn9pbpxx80u7e3uwUQNQ3DSU0cpBjzu+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=hlX+OOmw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="hlX+OOmw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C1E7C2BCAF;
	Wed, 18 Mar 2026 15:11:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1773846713;
	bh=vMV2f8rN8rE2OWXVFxaL/aoliqsL2kZZqoM3N1R9FmM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hlX+OOmw81oRyKgDKZ7m+5t/DYTkxRVrkfyXLmkXcish4a3PBNqBJVZCbjlZTsIDV
	 tDcxinBP85GG4xGmG9VFzvhX4fgVLe26MHuSRB2qzQ7vQfWOfqVtSS3PhFQBTDVX3z
	 8Kou/Uc/CgC7koK7IBWPUcnxaMF3HuKlwwJ+WpsI=
Date: Wed, 18 Mar 2026 16:11:50 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Aadarsh 7001 <aadarshmandal9354@gmail.com>
Cc: Luka Gejak <luka.gejak@linux.dev>, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, straube.linux@gmail.com,
	dan.carpenter@linaro.org, ethantidmore06@gmail.com
Subject: Re: [PATCH] staging: rtl8723bs: fixed the trailing
 whitespaces/commented code
Message-ID: <2026031814-unskilled-scrambler-3372@gregkh>
References: <20260318021005.6346-1-aadarshmandal9354@gmail.com>
 <2A37C741-68A1-47E2-AB3D-833593B5C392@linux.dev>
 <2026031841-turban-sludge-c8c8@gregkh>
 <CANQQrNO0GzqhYLj7DauWAoO=tVCz=86YaSjWWjAf-ER+UKmK6Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANQQrNO0GzqhYLj7DauWAoO=tVCz=86YaSjWWjAf-ER+UKmK6Q@mail.gmail.com>

On Wed, Mar 18, 2026 at 08:36:21PM +0530, Aadarsh 7001 wrote:
> On Wed, Mar 18, 2026 at 5:09 PM Greg KH <gregkh@linuxfoundation.org> wrote:
> 
> > On Wed, Mar 18, 2026 at 07:59:28AM +0100, Luka Gejak wrote:
> > > Hi Aadarsh,
> > >
> > > Thanks for submitting this patch, and good luck with your GSoC
> > application!
> >
> > Wait, what?  Is GSoC doing staging patches for "entrance" into the
> > program?  If so, SOMEONE needs to tell me this, otherwise I will have to
> > treat all of these as an abuse of the community review process and just
> > flat out reject all staging patches until the GSoC application process
> > is over.
> >
> This isn't ok, you all know better than to do this.
> >
> > Who is in charge of the kernel GSoC project this year?
> >
> > greg k-h
> 
> Sorry for the confusion, that wasn't my intention to abuse the community
> > review process. This is my effort to learn and contribute to the kernel.
> > I'll be extra care ful on this. Thank you for clarification.

If you are applying for GSoC, this is not your fault.  I want to know
who the mentors that asked you to send this patch, where is that
documented?

thanks,

greg k-h
