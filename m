Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66F5D39CCFE;
	Wed, 19 Aug 2026 13:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787146160; cv=none; b=VDT3z3HBuogtMDMLyLoE0asZWJWdlsXVxvs4ZQ3kXoSoWxczxYFMSTvq6HKLNGwSTVpOURHp9qKS1o9msArTMe3BE7RNmYltTmsxtmfXkIIvpyye+0G+GK/nYvfsY31leuaRQ8evJcJjOUQmrbroWvTyq9eghRCwM0cMIrKD5Hs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787146160; c=relaxed/simple;
	bh=haRWC4psyhMltn/wsNorx3Kjq0OaLhTYQtQUWf8vpuM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AcdqzilNjgdAxMqS1ngRoUo6VoT1YHMcNscH5qy9YcKUwwXIBjFwNVBjItUDGtjt9+Uw0LqSPUDzNsFX7kMlIviD/GP+nAjL9hA1RuuQcvTPjwRefxuqRLbDBJ1zYtVyh2eqpX0q9QKAAvJBS+B/Fnm7nypBdZEOyUbFLfsJDHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=wVRzToOk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="wVRzToOk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 737CC1F00A3A;
	Wed, 19 Aug 2026 13:29:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1787146156;
	bh=HiVMVFLtnvkKMSi3UQoQGAcZOojEZFVZ6fBD5+YTYfk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=wVRzToOkjRIUnEC1HkgAl5wuKoeH7pPeXdi0xJQ3783UE7V6UzkOdEKCq+1mzwj/N
	 S0QBjH7K8lvFwhhXGN/+iPnws3sUrkJBMYhcQoQilLQDjh/PWhjK2nwTdVMQKT24Oj
	 AlnjqjiVjYFLKS1yY9RA96JrX9NWxVD6R7egtkX4=
Date: Wed, 19 Aug 2026 15:29:11 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Runyu Xiao <runyu.xiao@seu.edu.cn>
Cc: Rui Miguel Silva <rmfrfs@gmail.com>, Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Kris Huang <huang_kris@projectara.com>,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: greybus: light: initialize channel lock before
 registration
Message-ID: <2026081944-divisible-trodden-ab4b@gregkh>
References: <20260818142020.1989539-1-runyu.xiao@seu.edu.cn>
 <2026081801-arguable-gosling-c590@gregkh>
 <ANAASQBEK9Ye2X-O4oze*arv.3.1787142765226.Hmail.220255722@seu.edu.cn>
 <2026081928-calzone-managing-4141@gregkh>
 <20260819132108.17767-1-runyu.xiao@seu.edu.cn>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260819132108.17767-1-runyu.xiao@seu.edu.cn>

On Wed, Aug 19, 2026 at 09:21:08PM +0800, Runyu Xiao wrote:
> You're right, and "tested" was the wrong word in my reply.

Sorry, I have no context :(

Remember, some of us get thousands of emails a day.

> The finding here is from code inspection, not from a runtime test. The
> path I checked is:
> 
>   gb_lights_channel_register()
>     -> led_classdev_register()
>        publishes cdev->brightness_set_blocking
>        (= gb_brightness_set()
>           -> __gb_lights_brightness_set()
>           -> __gb_lights_led_brightness_set()
>           -> mutex_lock(&channel->lock))
> 
> but mutex_init(&channel->lock) only runs after
> gb_lights_channel_register() returns, and that is the only place where
> channel->lock is initialized. So the lock is published before it is
> initialized.
> 
> The QEMU module I mentioned does not exercise this driver. It only shows
> that taking an uninitialized mutex triggers the expected
> DEBUG_LOCKS_WARN_ON(lock->magic != lock), so I should not have described
> it as driver testing or as a reproducer for this driver.
> 
> And yes, 6.1.66 was only the kernel version in that local QEMU setup. The
> patch itself was made and compile-checked against current mainline, and
> I'll keep validation against mainline for future submissions.

Just build testing against a many-year-old kernel is a sure way to
ensure that nothing will actually work at all :(

> The initial report came from PatchProof, a static-analysis pipeline I am
> building for lock-API misuse. It flagged this publish-before-init ordering,
> and I then manually verified the call path above. I did use an LLM as an
> assistant during the workflow, but the finding itself was from the checker
> and the patch I sent was based on my manual review of the code.

Please read the archives for why we don't take LLM patches for
drivers/staging/ unless you can test the change on real hardware.

thanks,

greg k-h
