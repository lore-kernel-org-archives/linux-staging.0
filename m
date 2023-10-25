Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3045D210E2
	for <linux-staging@lists.linux.dev>; Wed, 25 Oct 2023 11:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="hjFI1AgS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B696C433C8;
	Wed, 25 Oct 2023 11:01:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1698231701;
	bh=1YD3YCRTlBaAan1td1ghKoOBV0EAf0BRMMakToRGbDw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hjFI1AgSt44fevaGYMn9mN2I1fFdqCdoSlutapOY7iIpP/BbCv8GmsDTtR7zoV3Dh
	 Sno92lOhbsArxe3JVyLszriR3G2W/lqyqo8OTu2j/H9sgR7WnfP7soKfAktzz48A8E
	 PkxyvvRgyhiEr/iruERyKuZYEMaPfe6pBV2oMX9o=
Date: Wed, 25 Oct 2023 13:01:39 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Umang Jain <umang.jain@ideasonboard.com>
Cc: linux-staging@lists.linux.dev, linux-rpi-kernel@lists.infradead.org,
	linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Stefan Wahren <stefan.wahren@i2se.com>,
	Dan Carpenter <error27@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Phil Elwell <phil@raspberrypi.com>
Subject: Re: [PATCH v2 0/8] staging: vc04: Drop custom logging based on printk
Message-ID: <2023102528-anemia-cacti-9622@gregkh>
References: <20231024114428.443528-1-umang.jain@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231024114428.443528-1-umang.jain@ideasonboard.com>

On Tue, Oct 24, 2023 at 07:44:20AM -0400, Umang Jain wrote:
> Hello,
> 
> This series address the discussion on [1], i.e. removing the printk
> based logging mechanism and migrate it use dynamic debug.
> 
> Patch 1/8 and 2/8 are prep-up patch to pass struct device pointers
> so that we can use dev_dbg() in those functions. 
> 
> Patch 3/8 targets migration of vchiq_log_error() to use dynamic debug
> Patch 4/8 targets migration of vchiq_log_warning() to use dynamic debug
> Patch 5/8 targets rename of vchiq_log_info() to vchiq_log_debug() and
> migration to use dynamic debug.
> Patch 6/8 targets mirgration of vchiq_log_trace to use dynamic debug.
> 
> Patch 7/8 drops a unused macro.
> Patch 8/8 is log levels remnants cleanup along with debugfs entries.
> 
> Changes in v2:
> - Address feedback from v1, added 1/8, 2/8 as new patches
>   Hence, Remove pr_*() based logging in few cases
> - Cleanup debugfs log entries (8/8) and update TODO list
> - Fixed bugs where NULL deference was happening due to unitialised
>   pointers.

Much better, thanks!

But I don't think you're done here, why not just use "real" dev_dbg()
and the like calls instead of your wrapper #defines?  What is that
helping with?  You now have full debug information so the additional
field should not be needed anymore, right?

I'll take this for now, as any future changes can come on top of this.

thanks,

greg k-h
