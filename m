Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C12F617E2
	for <linux-staging@lists.linux.dev>; Thu, 16 Feb 2023 04:52:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C97EDC433EF;
	Thu, 16 Feb 2023 04:52:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1676523169;
	bh=qVVzcCSbDY1tKnyjoCCz1adpsr2TzUeHRx6BetLpm4w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aKA46E1fjlBaA+Ill9G5FzhZor7ggG0zYVfiSe0At4ia6HyJQ8GBFD12RoOI9zcXv
	 IQ+82Hb7p8oXeM7PTcgkbyJAbhKJYda1YmId86XrVMsn+pRauEwDrw/Ffd1QpKGwbd
	 JSuFPvPICAverN+B8U5akrYEeFD5KU7u5fU4UU1U=
Date: Thu, 16 Feb 2023 05:52:45 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Jesper Juhl <jesperjuhl76@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
	Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	linux-media@vger.kernel.org
Subject: Re: [Paatch] [staging][atomisp] Remove unneeded version.h include
 pointed out by 'make versioncheck'
Message-ID: <Y+22naE0azHHF0nY@kroah.com>
References: <4b9f2443-3360-bdb0-c4d4-7687db333d0a@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4b9f2443-3360-bdb0-c4d4-7687db333d0a@gmail.com>

On Thu, Feb 16, 2023 at 01:57:45AM +0100, Jesper Juhl wrote:
> > From d0b9a59ac1bc69523b5cc8b2bab0b0e0b4bd0ab6 Mon Sep 17 00:00:00 2001
> From: Jesper Juhl <jesperjuhl76@gmail.com>
> Date: Mon, 13 Feb 2023 02:52:24 +0100
> Subject: [PATCH 05/12] [staging][atomisp] Remove unneeded version.h include
>  pointed out by 'make versioncheck'

Why is this in the body of your email?

> 
> Signed-off-by: Jesper Juhl <jesperjuhl76@gmail.com>

We can not take patches without any changelog text, sorry.

thanks,

greg k-h
