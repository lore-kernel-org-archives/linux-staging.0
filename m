Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 146BA2076BA
	for <linux-staging@lists.linux.dev>; Wed, 16 Oct 2024 12:30:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729081821; cv=none; b=Ox+AsPrYfsqIU9MpV0KbwfXcZSYrblbERn4+mWKrsV6DRxC9LZA4mLbw9le+5t40VhuC6c5Zb43SDeYSZhwJuKS0+bEL7z9H7l8nrHIfDLde1tbwlKkYz31FIQMYWoPOo++DfbBGK8UWBiRPx5GhwVaD+DYmm2qcuFAfJVeavZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729081821; c=relaxed/simple;
	bh=xqrWpVglX1Xz7CdMcIQaK8GGhpQAdl4DQPVpVb5cipc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XlXOTELnh1rl4bMDXyTyXGcYYUyj4LcPZXo8bvRL4R4c+S4H8gcLpr8b4/iDvOpBpi1q3H9SSO2bhrxcH139D7TIeaKQbprJ6zRIqo/ASnPCJt7FQ0KRpSP2mwmtCK6K6cZt2rlUiayan/lt4VyoY4ARJKe0DsCsLltAHvsEzIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=R4pFbJHM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="R4pFbJHM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3ED7BC4CEC5;
	Wed, 16 Oct 2024 12:30:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1729081820;
	bh=xqrWpVglX1Xz7CdMcIQaK8GGhpQAdl4DQPVpVb5cipc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=R4pFbJHMccHDeLQMr+ZrVg7OJV1vanme9WBDiVdNPPTIXcMFmxkX1207AmHHbhppQ
	 agGgTwfUgvIx+kP78VRQojKahVxArObHEELObOvZeqD3gfOwxZjFZpbRgaZgJCWRSg
	 nuzc21Tm2Zs616G8CWjVvrzGppVT1pzQ8iCpKhtY=
Date: Wed, 16 Oct 2024 14:30:17 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Aymen Khalfa <a.khalfa.1012@gmail.com>
Cc: hdegoede@redhat.com, Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH] drivers: staging: rtl8723bs: Replace msleep() with
 usleep_range().
Message-ID: <2024101646-quartet-deeply-b941@gregkh>
References: <20241016111210.2469193-1-a.khalfa.1012@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241016111210.2469193-1-a.khalfa.1012@gmail.com>

On Wed, Oct 16, 2024 at 01:12:10PM +0200, Aymen Khalfa wrote:
> -Fix checkpatch.pl warning by replacing msleep() with usleep_range() as
> recommended in the documentation.

Here's a link fixing checkpatch to not give bad advice like this:
	https://lore.kernel.org/r/20241014-devel-anna-maria-b4-timers-flseep-v3-16-dc8b907cb62f@linutronix.de
so that will be changed soon so that people don't keep trying to "fix
up" this driver that is not broken...

thanks,

greg k-h
