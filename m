Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FDEA1FCA
	for <linux-staging@lists.linux.dev>; Sat, 21 Oct 2023 09:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="EyS5G5Xk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51A86C433C7;
	Sat, 21 Oct 2023 09:59:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1697882359;
	bh=wWc6rIlaxv84go1O69XljTR9y8Dp7PH3NzWmbHaSc28=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EyS5G5XkJVgDPijceBEcmuOW9Sp+1+fiLlgDB1vQS9JkQgcKivVlPzjfDiuZh94RB
	 nFuhDLcATWm3Wat5vFPa44mmBENjYPgvwFQWwlTWlq4cUh/VyjqhdfVR5KAipi05Yy
	 4aT7+lEe+JHixyU7kfHENZrQn5MCl+nNxGoWfGPs=
Date: Sat, 21 Oct 2023 11:59:17 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Umang Jain <umang.jain@ideasonboard.com>
Cc: linux-staging@lists.linux.dev, linux-rpi-kernel@lists.infradead.org,
	linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Stefan Wahren <stefan.wahren@i2se.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Dan Carpenter <error27@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v1 1/4] staging: vc04: Convert vchiq_log_error() to use
 dynamic debug
Message-ID: <2023102128-bacteria-improper-66f5@gregkh>
References: <20231019082147.384723-1-umang.jain@ideasonboard.com>
 <20231019082147.384723-2-umang.jain@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231019082147.384723-2-umang.jain@ideasonboard.com>

On Thu, Oct 19, 2023 at 01:51:44PM +0530, Umang Jain wrote:
> Move vchiq_log_error() custom logging wrapper based on printk,
> to use dynamic debug. To categorise, enum vchiq_log_category
> has been introduced, which will become the part of the error
> string format that will be logged to dynamic debug (for grep).
> 
> All the vchiq_log_error() calls are adjusted to use the
> dynamic debug wrapper. vchiq_loud_error_*() has been removed
> as a part of this patch and replaced with dev_err (so that
> they directly end up in kernel log, even if dynamic debug
> isn't enabled), which serves the purpose.
> 
> For cases where struct device pointer `dev` is not available,
> NULL can be passed to vchiq_log_error() to log to dynamic debug
> using pr_debug().

Ick, no, no need for that.  Please don't have yet-another-logging-macro
for this subsystem, use the "real" ones, in the code, so that we don't
have to context-switch every time we come across one of these calls.

So use dev_*() for real, where all of these have device pointers.  And
where they do not, use pr_*() so it stands out in bad ways so that those
places can then be fixed up to use the proper logging macros as well
(i.e. pass the device pointer into those functions in later patches.)

Same for the other patches in this series, let's make this simpler, not
more complex please.

thanks,

greg k-h
