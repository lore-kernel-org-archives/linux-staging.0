Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9A66421253;
	Wed, 12 Aug 2026 23:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786578714; cv=none; b=EWmQg/m+t9W11RF5NkGicBR6rQ2CPuIeYQZpXtYJeC+1PaQKp3kKNnyRh4B2eu9byh32/QuvbLX0PCRDYfxNRHR4PQ8YsA5GPWZmD9siRaq/7JqGQZqOQk/QNYY0E+s/fPi4rmQSQOMQG0skHkEqPSgy4yGS5wzm5C7V7Mrps6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786578714; c=relaxed/simple;
	bh=nCM9dDw55tZovPKAfmpKo+YH/4qHO9l8u6828ydOBfM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uQGJ1vmfkIGXGgdqiswoXyp6W1C8l5lpo572HPsCb6fF3mPILuguBytRKxG7Mp1eTQ9bqdKXpDeHVARpQQhn6iISvZEhItAbNmWRklcItgmY5L1+qLWQ/xTojVOdBMrN3rC3gWgJjK3Je2UzEBj5ISYpbYUCLHhmBG2F4ogoojs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=s0evZBBj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="s0evZBBj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00F231F000E9;
	Wed, 12 Aug 2026 23:51:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1786578712;
	bh=UFhg16Nx5Oz/xGWvDX5HVQlK1QjV09kkKVXi1b9YYPQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=s0evZBBjAMBduMcLWfCA+S1TrGCaDs13zooWh4JzrbsCZe7zCGxc0D7iyJory889V
	 kPa+qKySU8zMiQ9x8I+PCXDYOkLEP1wLeJBWjgjzN2CfBhaFK1x6rDpfGYwKXDl+vi
	 /INWKb0Mby0eYSBSy8iHb6gWb0ILJp35JL4jRxZA=
Date: Thu, 13 Aug 2026 08:50:19 +0900
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Batu Ada Tutkun <batuadatutkun@gmail.com>
Cc: Bryan O'Donoghue <pure.logic@nexus-software.ie>,
	Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: greybus: loopback: remove unused includes
Message-ID: <2026081355-unroll-spilt-6725@gregkh>
References: <20260812180354.1968-1-batuadatutkun@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260812180354.1968-1-batuadatutkun@gmail.com>

On Wed, Aug 12, 2026 at 09:03:54PM +0300, Batu Ada Tutkun wrote:
> linux/random.h, linux/sizes.h, linux/cdev.h, linux/fs.h, and
> linux/workqueue.h are not used anywhere in this file; none of their
> symbols appear in the source, and none are needed transitively either
> (debugfs helpers come from linux/debugfs.h, the async worker uses
> kthread_run()/kthread_stop() rather than the workqueue API).
> 
> Verified by removing the five includes and rebuilding
> drivers/staging/greybus out-of-tree with W=1: no new warnings or
> errors, and checkpatch.pl reports the same warning/check count before
> and after.
> 
> Assisted-by: Claude:claude-sonnet-4-6
> Signed-off-by: Batu Ada Tutkun <batuadatutkun@gmail.com>
> ---
>  drivers/staging/greybus/loopback.c | 5 -----
>  1 file changed, 5 deletions(-)

Please read:
	https://lore.kernel.org/all/2026080354-skater-urgent-31b2@gregkh


