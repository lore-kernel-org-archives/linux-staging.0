Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FDF243B3F7
	for <linux-staging@lists.linux.dev>; Wed, 29 Jul 2026 09:13:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785316397; cv=none; b=TLfPak+WfUItiBDPZmrrANoCqB+X8vonho/QWgoGsBhe9Hy3U4oTG3AlQ5TT+kw64XiqdZ0fF0WwDHTYWVhktQsuEMyNbX/0IV0uDiPYJfzU5C1jMOHwBIOSc6KswjjtEvfF+HL1pPLOXN71L2pdGx7Lz+cHbQnmeJOkDdB10AY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785316397; c=relaxed/simple;
	bh=L2RfJL93QeCcKzSjPyJkw6aMVhNxj4k5RguPWA0Stb8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V/1FOGd/1utTfFdiwe/gHrkAKkHrMCprzgNgxQUWM1ks5/r+EqskSbQ/ScSuC5amRJ8yTN2tghfLMO24a5vUOJnX/G+0Sk6yMOcTmk6caKYxQLYn+/IcCCpCi6bHbF+jgZeTs2tUoD7bF18k1/lXL0X1PkSB0Eegfst3qrYi3qM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=e/IR/S3q; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="e/IR/S3q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A16421F00A3A;
	Wed, 29 Jul 2026 09:13:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1785316396;
	bh=ptWbj2K5wizFNzMoNZcUwqAarNP8jBBtZErUfZEIShA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=e/IR/S3q6LaBNbC6SfUqtqkfatqEqFH0jPz7QmEy66Z4HsMhs82tGNh0WUUxB8o+g
	 FOkaO2ZHKpB+gHiY8SU0fDY1KnWgIOrDLLwVXkfvFYrwxUA9gBrEO6ufVM5A8hf/ev
	 tk432gyDjWaKdZP2TVAycZKfjLO8HU8skRiS9LVA=
Date: Wed, 29 Jul 2026 11:13:02 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Bramwel Barack <bramwelbarack89@gmail.com>
Cc: linux-staging@lists.linux.dev
Subject: Re: [PATCH v2] staging: rtl8723bs: fix line length warnings in
 os_intfs.c
Message-ID: <2026072924-daunting-footing-189d@gregkh>
References: <amm_xjWhiP50C5lG@fedora>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <amm_xjWhiP50C5lG@fedora>

On Wed, Jul 29, 2026 at 11:54:30AM +0300, Bramwel Barack wrote:
> Hi Greg,
> 
> This is a v2 patch addressing your feedback on comment block placement
> and providing the missing commit description text.

As per the documentation, the v2 stuff goes below the --- line, right?

Take a look at the mailing list for hundreds of examples to follow.
This style here will not work well.

> 
> Thanks,
> Bramwel
> 
> ---
> 
> >From 8fb05fdee4c523bcafc5b425851b95e69e22182a Mon Sep 17 00:00:00 2001
> From: Bramwel Barack <bramwelbarack89@gmail.com>
> Date: Wed, 29 Jul 2026 09:33:57 +0300
> Subject: [PATCH v2] staging: rtl8723bs: fix line length warnings in os_intfs.c
> 
> Fix coding style warnings where comment lines exceeded the 100-character limit. Move the split multi-line comment block above the target variable declaration to comply with standard kernel comment formatting.

The irony of a line length warning patch having a line-length issue in
the changelog text itself is quite high :)

Always run checkpatch.pl on your changes before sending them out.
Again, look at the tool 'b4', it has an option to run checkpatch on the
patch before it is sent out.

thanks,

greg k-h
