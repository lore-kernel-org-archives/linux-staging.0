Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDCC72D8378;
	Tue, 28 Jul 2026 07:32:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785223972; cv=none; b=hDAFCgWdCRNHWWd/NT28ygcInYSCFO1vxmIj98cS4RfT9aLrygUBTYel6FIZyiko9wT57dVayuAHg3myySAGlkEPsfRsz844nQLuhD+7OWcjzpgYxn2DKp/cnZVRYhCeMzxITuZavT8L9eKKy9zzRcsK/cgG3PgR65lNVWlPgtg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785223972; c=relaxed/simple;
	bh=OaWRfLh/3NijDMGmlpyTk51cHXTneQnjgSMomaEh0vQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eKHE6sRNKCAczhB/H8gkTTU2qwelardS5r58wvL0dj1ShjCCFZUzO7+DEGnWn4LK+0Y0t2t+70uw8iyEOy5Dwz8Bv2x+iUKP2q76enk1Q7jmLk3xD0F0U/LIfr3aYzkxxc47nBlhBoLGOC/bFFhVmUs/qf0WMB5a77h/ZE2eVSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=FDanqumI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="FDanqumI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E50301F000E9;
	Tue, 28 Jul 2026 07:32:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1785223971;
	bh=Zl0oA8BeuDw9wRNAl5RE4G8Vxk10xisdBgdH2tJNcHw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FDanqumIYFyX2v5LSsIFUoGwjhrEgEz86Q4I6BFudI2lBEO7mMYAfh8qcgXXA4Pfy
	 oZgvIjovNPBmxoOUCm2qGEGxC+ct5nzRoCFj8/c8dWedKkJvxQTFQlOaQg7lXAF3HI
	 OfyT5shg/t08A2ArYJNJLd6GJXt3GW4uKLaPEPdc=
Date: Tue, 28 Jul 2026 09:32:38 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: =?utf-8?B?4KSv4KS2IOCkquCljeCksOCkpOCkvuCkqiDgpJXgpYHgpLLgpLbgpY3gpLA=?=
	=?utf-8?B?4KWH4KS34KWN4KSg?= <pratapyashkulshrestha@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: fix space before tab in
 HalPhyRf_8723B.c
Message-ID: <2026072830-old-paprika-309e@gregkh>
References: <20260713162020.2478175-1-pratapyashkulshrestha@gmail.com>
 <2026071727-jingling-bacteria-51ca@gregkh>
 <CAKCYvoMf+-fPo1yj7VEYfgwHpOxRCYAGELwW7V8ODOwy+9OviA@mail.gmail.com>
 <CAKCYvoN=vM5gsGofBh_+CivXKqBJgV=4PqUkOwXB5SAkoMjJiA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKCYvoN=vM5gsGofBh_+CivXKqBJgV=4PqUkOwXB5SAkoMjJiA@mail.gmail.com>

On Tue, Jul 21, 2026 at 09:48:16PM +0530, यश प्रताप कुलश्रेष्ठ wrote:
> Hey Greg,
> 
> Looking closer, these are commented-out function calls, not explanatory comments
> that look like leftover debug code rather than documentation.
> Would you like me to send a v2 that removes these dead lines
> entirely, rather than just fixing their whitespace?

Yes please.
