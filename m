Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DEA13DE44C;
	Mon,  4 May 2026 14:56:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777906593; cv=none; b=ThSW3qXfC11YJUBHIz0yYD6y/JbIzCUu7QVK/0lTpoUmINtmaV6Hq7CP3hCEs6PO/dvEIfQHoxn9gLn4Wl7K8zZDKNtvDA7ftYRqtoiR7UsWVT5HhruUe5EeCdW9mGQa8QKdf81acRO9928AB9Bv/nzJTdUuNsFQ7+9IZlYx5vg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777906593; c=relaxed/simple;
	bh=15aLjGkCbpugF1uEUrR4LpZ+meDAtHejyTtKptSgyRg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F4GJ7SWPlv/hw6pdtUAJGOkLOkGtxTyvP7dx+IgJkUUJy7rV4PENuBvAzCTwh8gFPqrhfCqR0Ve2lYWxfp2BWr5yrJ8lKxXc8ATemI5xKBhEU4D68OXknC75jVUoafxK4haOedmqn/gXDBEOLy50AA/cDfsa7pgRVM8EXnXIhEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=0SNTu1aa; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="0SNTu1aa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C336C2BCB8;
	Mon,  4 May 2026 14:56:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1777906590;
	bh=15aLjGkCbpugF1uEUrR4LpZ+meDAtHejyTtKptSgyRg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=0SNTu1aaJqAvrTtb1sbqX+MjfSutMFWWamQAP2sG79scngmx/Ykpc4KaqCTiG2LxD
	 wAC8Fr3QfEZPI4hpLjNsuaNPl2E6fKZu+RZ6AET1sm4R25uJmmBtLWf5irz2FGIcSz
	 lav13yYGRgensoWtA5QlG6sHox7x+oSYaE87MFks=
Date: Mon, 4 May 2026 16:22:27 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Linus Probert <linus.probert@gmail.com>
Cc: Luka Gejak <luka.gejak@linux.dev>, Dan Carpenter <error27@gmail.com>,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH 0/8] staging: rtl8723bs: remove warnings in rtw_btcoex.h
Message-ID: <2026050421-wrench-driver-de6d@gregkh>
References: <12186A7D-522A-4900-9E4A-E2B575930A72@linux.dev>
 <2097F9CE-F003-4BE1-AEF5-0B30294973FB@linux.dev>
 <177745958799.1254637.4289009650997698120.b4-reply@b4>
 <FD718F1D-8156-4E27-BEE7-23E66D045A2E@linux.dev>
 <afH0RlRIDQdC08dV@stanley.mountain>
 <5103B748-E9AE-4164-B81F-CB24326F3F7D@linux.dev>
 <177746706634.1273374.11369919005007087628.b4-reply@b4>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <177746706634.1273374.11369919005007087628.b4-reply@b4>

On Wed, Apr 29, 2026 at 02:51:06PM +0200, Linus Probert wrote:
> On 2026-04-29 14:18:55+02:00, Luka Gejak wrote:
> > On April 29, 2026 2:06:30 PM GMT+02:00, Dan Carpenter <error27@gmail.com> wrote:
> > 
> > >On Wed, Apr 29, 2026 at 01:34:41PM +0200, Luka Gejak wrote:
> > >
> > >Greg has said in the past he prefers them all as separate changes the
> > >way this patchset does it.  He recently asked somone to split up a
> > >typedef patch into one typedef per patch.
> > >
> > >regards,
> > >dan carpenter
> > 
> > Thanks for that information Dan, I wasn't awear of that.
> > Best regards,
> > Luka Gejak
> 
> Thanks, then I did understand your suggestion correctly. Just wasn't
> sure. As Dan stated I've learnt that Greg prefers one commit per function
> for these cases.

Yes, this is great, thanks!

greg k-h
