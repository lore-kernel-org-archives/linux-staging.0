Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F1CB3AFAEB;
	Thu, 30 Jul 2026 11:07:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785409629; cv=none; b=l53QTd9nvde+EgjEK66kSBAJyxqpWa+uSceJoMJ0tZ7Yvw6QjRU6nTIQrNRc7ovn1UXEiaX5ZOfJTO+shmb6HayLRMpW4HxPVzNDmchpCTsYVI/rxts0rtlyh+yawFm3b7nrxmT6i+dUJKTPhlLuimeNj8kGJyxQpaaGc1a/EvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785409629; c=relaxed/simple;
	bh=OEAn1Kb99lIMWD7FVXVKoaanodfhaMlQqA0jsPUuNyU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pDaCAi2c5Xl2nq+OH+GrF0XIAWHvhm/2/lqllqufoU/QJswlWDULk213pNDLptgK8axLnuym4MgTYGYmY7qA/iUlX6vo0/HYhFFpKX4/DA1PXBqtyO7lpDJGQTBo1udiTOB9LQxdWqXFUxaJNV0J0FbNchjpJJ580ISp9lLHc/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=kS/04YrA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="kS/04YrA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9AAF61F000E9;
	Thu, 30 Jul 2026 11:07:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1785409628;
	bh=OEAn1Kb99lIMWD7FVXVKoaanodfhaMlQqA0jsPUuNyU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kS/04YrAVO+/rfebekL314e2s71/LVq3lEw1vY9D+QbzJ/kZPsgFtOSC5sJ8jc59y
	 vEo+HDEmcBjjsnSrCbNsERjNMRB793mPt/d7uE77nuxF2heXIeS1QLVK/IGf4dnQVj
	 pmMQTOwsjIw3khWC7w3zWZ5KrXPq+4oup48KoeSg=
Date: Thu, 30 Jul 2026 13:06:54 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: =?utf-8?B?Tmd1eeG7hW4gQ8O0bmc=?= <congnt264@gmail.com>
Cc: Rui Miguel Silva <rmfrfs@gmail.com>, Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: greybus: light: fix leak of cdev->name
Message-ID: <2026073028-impaired-acuteness-e80a@gregkh>
References: <20260726110039.3674948-1-congnt264@gmail.com>
 <2026072842-protract-matcher-99b6@gregkh>
 <CAJpJ=GtHycfZncrux5chZLF-s97DiTjm-Ps_cjopamT0OPwtkw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJpJ=GtHycfZncrux5chZLF-s97DiTjm-Ps_cjopamT0OPwtkw@mail.gmail.com>

A: http://en.wikipedia.org/wiki/Top_post
Q: Were do I find info about this thing called top-posting?
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?
A: Top-posting.
Q: What is the most annoying thing in e-mail?

A: No.
Q: Should I include quotations after my reply?

http://daringfireball.net/2007/07/on_top

On Thu, Jul 30, 2026 at 05:57:15PM +0700, Nguyễn Công wrote:
> Hi Greg,
> I used an LLM-based agent (Claude) to flag allocations that aren't freed
> on error paths, then I verified this one by hand: I traced every place
> cdev->name (from kasprintf()) is freed and found that
> __gb_lights_led_unregister() misses it on the config-failure and flash
> channel teardown paths. No static-analysis tool was used - just the
> agent to surface the candidate plus manual review.

Then please properly document this as required.

thanks,

greg k-h
