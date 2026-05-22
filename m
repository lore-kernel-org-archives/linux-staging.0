Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B41528150F
	for <linux-staging@lists.linux.dev>; Fri, 22 May 2026 06:23:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779431004; cv=none; b=W/IHySy46BUcF7dbXsfq53UWnCCg8XakrZhz8kTPfnAUjsd0uo/nYDbDPHkCr2ZQLF+dracO4TlouQ8oLTz9yGtJTb1aEwLG4ZEebC374XJupFlMOqJoGKS6M2Ts1UuZW4ato3JhaNwPYqYMg6s+4nYHV7EwYUL0Vhs4hkkyb54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779431004; c=relaxed/simple;
	bh=m69iIyBKpGQqhdFrCmUDUAPJ4Mcm0YDqnyEQIyf8Uxk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dPkR66bMZuyh3+a32MKGQjcyMlacSyc/8u6GkpXf5eKwob0AHZmhlzjmCGWyjQQBsk2TNNWfer+Ezs1cmUw3WnxzHi8H+nApPN/OjHu/a69Riliy3wFmaMbtOuwK+cPDMOB3HOzDbfA0CNDvqjJIC3WnSFOBC1oSVZVFcfZgYgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=YpMadd5M; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="YpMadd5M"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DC651F000E9;
	Fri, 22 May 2026 06:23:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1779431002;
	bh=FD/JElbczbVXHCfGKWz4ljTLXpxlbABTTnnDPVoXvLI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YpMadd5Mvq1mCL2NkseEcXVeKVAQy8Z5FlNitFmwb2ib6Vdlp7t4dxsHbdUjAehfm
	 wRNT8juerban9FFKGiAiGDq6P/dgC/0/xXPZYPVNievUDspILsNn6ot+Ryqp82oelc
	 hpNplNenySxv2xRcpyvf2nyZdP3kmlWkWxe811Yw=
Date: Fri, 22 May 2026 08:22:34 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Jinyuan Guo <guojy.bj@gmail.com>
Cc: linux-staging@lists.linux.dev
Subject: Re: [PATCH 1/2] staging: sm750fb: rename CamelCase variable pvReg
 and drop prefix
Message-ID: <2026052214-handlebar-exploring-33f7@gregkh>
References: <20260511174124.5345-1-guojy.bj@gmail.com>
 <20260511174124.5345-2-guojy.bj@gmail.com>
 <2026052129-sudoku-stimulate-756d@gregkh>
 <CAGRbmwj0=ybZSyV+xPzHo3T=5b+cpCvyt0du=4dhw_Tuv_6n0g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGRbmwj0=ybZSyV+xPzHo3T=5b+cpCvyt0du=4dhw_Tuv_6n0g@mail.gmail.com>

On Thu, May 21, 2026 at 11:14:45PM -0700, Jinyuan Guo wrote:
> On Thu, May 21, 2026 at 2:11 AM Greg KH <gregkh@linuxfoundation.org> wrote:
> >
> > On Mon, May 11, 2026 at 10:41:23AM -0700, Jennifer Guo wrote:
> > > Renames the CamelCase variable 'pvReg' in struct sm750_dev to 'vreg'.
> > > Dropping the pointer prefix 'p'.
> >
> > Why are you keeping the prefix "v"?
> >
> > Please don't keep the "hungarian" notation at all.
> 
> Thanks for the feedback!
> 
> Based on reading the surrounding code in the header - specifically
> vidmem_size and vidreg_size - I assumed the 'v' stood for video
> (and not void) and should thus be kept.
> 
> One related note, I have another committed patch: f50b4602fea6
> (staging: sm750fb: rename CamelCase variable and drop prefix)
> where I renamed 'pvMem' to 'vmem', so depending on what the conclusion
> here is, should I then also update 'vmem' ?

You probably should fix that up too, sorry for missing that.

thanks,

greg k-h
