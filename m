Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 214BF2C80
	for <linux-staging@lists.linux.dev>; Tue,  5 Oct 2021 14:07:09 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 421FA6115B;
	Tue,  5 Oct 2021 14:07:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1633442828;
	bh=cnL/sf+hUo4gm74iG3lE21vurF1Az8bAampwQ7TaiAc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hhvWtXGKLs/EcIil4Qn1gria7uNWcxsINfw0mkwTdbaeLFIdI7kHGp/ZuY+UMZG7l
	 TKTCwk17ziUxoS7W6ULVtfbtH4Bs3pxlc+CrDShWqjpmleZ48sZdWrqjbFUF3xfF4C
	 LWE+Ph7lAO/Zc4QP+OlmfUNR0KT/n03HPGO8SOUI=
Date: Tue, 5 Oct 2021 16:07:06 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
Cc: Lee Jones <lee.jones@linaro.org>, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Christian Gromm <christian.gromm@microchip.com>
Subject: Re: [PATCH] staging: most: dim2: fix device registration
Message-ID: <YVxcCpuz9C6XpEex@kroah.com>
References: <20210929205619.2800-1-nikita.yoush@cogentembedded.com>
 <YVwofSvwGTv3kHjh@kroah.com>
 <d309b4cf-12f5-5f49-fcbe-3141dff9e73f@cogentembedded.com>
 <YVxX1f6sgYjTVYt7@kroah.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YVxX1f6sgYjTVYt7@kroah.com>

On Tue, Oct 05, 2021 at 03:49:09PM +0200, Greg Kroah-Hartman wrote:
> On Tue, Oct 05, 2021 at 04:33:02PM +0300, Nikita Yushchenko wrote:
> > > > Commit 723de0f9171e ("staging: most: remove device from interface
> > > > structure") moved registration of driver-provided struct device to
> > > > the most subsystem, but did not properly update dim2 driver to
> > > > work with that change.
> > > > 
> > > > After most subsystem passes driver's dev to register_device(), it
> > > > becomes refcounted, and can be only deallocated in the release method.
> > > > Provide that by:
> > > > - not using devres to allocate the device,
> > > > - moving shutdown actions from _remove() to the device release method,
> > > > - not calling shutdown actions in _probe() after the device becomes
> > > >    refcounted.
> > > 
> > > Should this be 3 patches?
> > 
> > But these three items are deeply interconnected, and fix the issue together.
> > Must not manually free device structure passed to register_device(), thus
> > must not allocate via devres (because otherwise, devres will free it). Once
> > not using devres for it, must deallocate it somehow else, thus must rework
> > the release paths.
> 
> Ok, but that was obvious.

That was *not* obvious.
