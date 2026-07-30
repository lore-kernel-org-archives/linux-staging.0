Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 257843F6C26;
	Thu, 30 Jul 2026 09:25:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785403521; cv=none; b=LtW6myJOO8g+2kYU+FDYBT5DS5xbX012GklOOa1PYG3lByWerSrRntUgeCCQtdv/ZxwWmSUIAh4jURF6Mx8oIrE9pYa7kcAoHW6uadV0DDR/srb2cAKuNbRbPRSWA94eoBgVDQqvADZH7pjKXP66MEdNB6mzwfXeiNjY3CbhNtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785403521; c=relaxed/simple;
	bh=VmDksVAXnlhE0p7j/7XrkSKd/xHZW0bWn4uCGDoh4QE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mAz28OnVGjulx0unZ4XGLebhYLBhMnB5PaLb2TFLtmOraM8CYWZTgbACaiRqkEKCxHuQK3F7rENKFR8gUc4ssv1ty9wzDqrf1GgFO+OyGjnCzF3YVP99phm7zUlc0OEmhnbaxQ7CEI5Ej7IO3HKdyNk1pkPsYUxg1hXITGvZ38U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=zvktdhp+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="zvktdhp+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 202631F000E9;
	Thu, 30 Jul 2026 09:25:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1785403519;
	bh=MKB7VheIQHxfGFW98cOr+zsu+ca64Gjdi4nSPLHdu7M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=zvktdhp+696+weXCcMv10aUbr3d8ZuR50Dc03CPugvu+TbCABbixCw6foHIkzGvum
	 SO1ZhM1iX26npOl8nNTZi6SrSj2qsCsIP2VQO0xbRXIAQYeHEgVfKisImdAG0HgxKf
	 IfayVfcUOq1ukzI/9g3ad9DankVDSdOLmLOB6/hc=
Date: Thu, 30 Jul 2026 11:25:05 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Mohit Mishra <mishraloopmohit@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: fix underflow logic in swing index
 calculations
Message-ID: <2026073032-skiing-thrift-0094@gregkh>
References: <20260729172707.13333-1-mishraloopmohit@gmail.com>
 <2026073034-pebbly-ladder-c95e@gregkh>
 <CAP5HdgqeAs7Cx+i72qTbh4NauCzCi_EbjbOvJm9KyC7u3c7dTA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAP5HdgqeAs7Cx+i72qTbh4NauCzCi_EbjbOvJm9KyC7u3c7dTA@mail.gmail.com>

On Thu, Jul 30, 2026 at 02:20:04PM +0530, Mohit Mishra wrote:
> On Thu, Jul 30, 2026 at 1:10 PM Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> wrote:
> >
> > How was this issue found?
> 
> I was going through drivers/staging/rtl8723bs looking for type-safety
> issues after noticing a similar pattern in another staging driver.
> I traced the swing index variables and noticed they're declared u8 but
> calculated from Absolute_OFDMSwingIdx, which is s8 and can be negative.
> I used an AI coding assistant to help organize the search and
> cross-check the branch logic, but verified the underflow behavior, the
> downstream truncation safety, and the TODO alignment myself by reading
> the actual code and running checkpatch/build checks locally.
> 
> I don't have the hardware to confirm this in practice, which is why I
> noted it as compile-tested only.

You have to document when you use a LLM, please do so here in the
correct way.

thanks,

greg k-h
