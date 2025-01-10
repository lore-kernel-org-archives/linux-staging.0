Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E677204C38;
	Fri, 10 Jan 2025 15:02:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736521321; cv=none; b=MImanBABjsYA15PmNrvvAePZcTW/2QAQT9juC7woOdy19RTyzVO3LVbAhApgfceeCnmrkoYiwHnVJPwnAC7n9MpSlUOwDmM0cArOpgn/Gn2xqpHQQd7dfrzmNDvnre7KjAQLqHF8W5LUCL4Pus6nNIs1hzK/D37/Z01YXwEW960=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736521321; c=relaxed/simple;
	bh=BF7+VG4buZbv4iv22gyH3U4XEgovaG1zuBScxKAIs4Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R1IRQdH0WNoJhgPZZl1bC3C2mZLElIW8qdzIl+4Yly/0r84Boq/OnRwWB6w+SustEwFeVkcU3kvAGFc8MSRzGD4j9Re2JOLujBwPika7gncWK6VnpA0itRPy9Li/Tp/9gNRMUvhmHidWeeWL+P1qhV7mUUSSb2mcdSL9XCd46dU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=hcMeaxKj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="hcMeaxKj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83E46C4CED6;
	Fri, 10 Jan 2025 15:02:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1736521321;
	bh=BF7+VG4buZbv4iv22gyH3U4XEgovaG1zuBScxKAIs4Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hcMeaxKj6rz9wpvjDXVIoDpc1zWIgQBqNaym1uL8+f/rzzbES7HAKBcO1PpE/M4Ug
	 F4os8RbjNVHCnqiJuDFTuS4WjJMWm9UZyw4o35sD4VYngMXvO9fJGBTpNpuxfReObr
	 d+73m+5H8GL/33dFPCtDaTC07FbikE8LgP39ZRl8=
Date: Fri, 10 Jan 2025 16:01:57 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Dave Penkler <dpenkler@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	kernel test robot <lkp@intel.com>,
	Dan Carpenter <dan.carpenter@linaro.org>
Subject: Re: [PATCH v2] staging: gpib: Add missing mutex unlock on early
 return in
Message-ID: <2025011026-apply-jacket-e262@gregkh>
References: <20250108174158.23077-1-dpenkler@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250108174158.23077-1-dpenkler@gmail.com>

On Wed, Jan 08, 2025 at 06:41:58PM +0100, Dave Penkler wrote:
> When no matching product id was found in the attach function the driver
> returned without unlocking the agilent_82357a_hotplug_lock mutex.
> 
> Add the unlock call.
> 
> This was detected by smatch:
> smatch warnings:
> drivers/staging/gpib/agilent_82357a/agilent_82357a.c:1381 agilent_82357a_attach() warn: inconsistent returns 'global &agilent_82357a_hotplug_lock'.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Closes: https://lore.kernel.org/r/202412210143.WJhYzXfD-lkp@intel.com/
> Fixes: 4c41fe886a56 ("staging: gpib: Add Agilent/Keysight 82357x USB GPIB driver")
> Signed-off-by: Dave Penkler <dpenkler@gmail.com>
> ---
> v1 -> v2 Add subsystem prefix in subject

You sent 2 patches with identical subject lines, yet they do different
things.  That's not good, can you fix them both up and resend?

thanks,

greg k-h
