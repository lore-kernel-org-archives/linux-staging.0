Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5EA93750C4;
	Sat, 18 Apr 2026 08:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776499560; cv=none; b=HwOkuRnViUmKH86SS/4L64EeSU4pqStw1xSEca5PcMOFEUe4ivRa+Lewrz3UGWStE7aWRKGpBZ+wh0z77F0b+gG/YN8j5L4Do622SKkioJGVbGyBHxi+6Tc1SBwm+5jcrpS6V60BykuzzXLVMqaSmeQWC8nDYLEVQuqk7eaCFz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776499560; c=relaxed/simple;
	bh=33FDdczpYpOwsdIedjTtnb9bvn+YktdWpVxRqcdiVC8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tygpJXPtI1JuviWRkgXtkiwjy0/+HcpNu07XPNOFwisUOQGLZc2t/TP+CCq5FR4z6PLDBSfzHOLuZvIEk0wHra7UqLjvrMwk5u9OprtN79Ol2S1I9mR8D8OpjXdOuUNaZXBH6WF3SeRY6+yqJcSycLyoMBI1V3b9yCy7/w3cxtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=MYYk+t9m; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="MYYk+t9m"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DBE4C19424;
	Sat, 18 Apr 2026 08:06:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1776499560;
	bh=33FDdczpYpOwsdIedjTtnb9bvn+YktdWpVxRqcdiVC8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MYYk+t9mitSB6KQjwabsoTqP9voCpmW1s11Z7dLMft58VVveB8OvMkqzMogRGo7f8
	 fNCESC6LRSwtAUFIKtomGttXOJ2N/eUqE2Qcm66AcZsKDcFNk/yx65q2hevjZzTnu0
	 YUuqke64FJtDRP1c4Xk0uFDS3ZvdHlV6SjC2lyNg=
Date: Sat, 18 Apr 2026 10:05:28 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Luka Gejak <luka.gejak@linux.dev>
Cc: osdevhari@gmail.com, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: rtl8723bs: remove trailing whitespace in
 rtw_xmit.c
Message-ID: <2026041807-whoopee-imperfect-4bd2@gregkh>
References: <CA+TGEkHXoCfY0RhmKFnfLrnPO+dKwKXAnGu84RNsNcE0=MaGAQ@mail.gmail.com>
 <6C4D65F4-8955-4B96-87A3-3FB25F5743EE@linux.dev>
 <2026041841-prowling-reflex-a7b5@gregkh>
 <B1014BF9-FA55-48C3-B6C1-A6FDF4E399BC@linux.dev>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <B1014BF9-FA55-48C3-B6C1-A6FDF4E399BC@linux.dev>

On Sat, Apr 18, 2026 at 09:37:40AM +0200, Luka Gejak wrote:
> On April 18, 2026 9:24:01 AM GMT+02:00, Greg KH <gregkh@linuxfoundation.org> wrote:
> >On Sat, Apr 18, 2026 at 09:10:47AM +0200, Luka Gejak wrote:
> >> Hi Osdevhari,
> >> Let's start from the top of the email. Firstly attachments are not 
> >> allowed, only plaintext. Secondly Signed-off-by tag must use your real
> >> name(Firstname Lastname <email>. Thirdly, you should setup git 
> >> send-email and use it to send patches. Now let's take a look at actual
> >> code:
> >
> >Again, Luka, please take a break from reviews.  I would recommend
> >getting some more experience in the developer workflow before doing
> >this, as it can be a bit confusing for new developers coming in to see
> >stuff like this.
> >
> >And again, please do not use AI for reviews, we have that already, and
> >there is a big reason I do not let it loose on the staging list because
> >it is not yet ready for it.
> >
> >thanks,
> >
> >greg k-h
> 
> Please check my response to your other email and feel free to plug my 
> responses into ai detector if that will prove it is not ai(I tested it
> returned human).

"ai detectors" are worth the value that you paid for them (i.e.
nothing...)

thanks,

greg k-h
