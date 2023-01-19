Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72C3933FB
	for <linux-staging@lists.linux.dev>; Thu, 19 Jan 2023 09:34:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A385FC433D2;
	Thu, 19 Jan 2023 09:34:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1674120859;
	bh=cTYhWhuoAArfN8ATkC/1fHyyuIoz5/V7W6EqeQ81PU4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NXyrMIIwdo9UdtGF5a0iaSMpO6tagJ8WWBUxVwSHRBIjLSGvE+Oavb4ePMGPwdqxB
	 5nYP7pEBMNjs2Qar0Vj1npXLCKlZN+J8YCwSVyaEs5rCKIjSE1fvQq3KQoQiqku4vV
	 zPJT33Koo7thoNF72zmUER2bBTs/gT/U09Zq0DYw=
Date: Thu, 19 Jan 2023 10:34:16 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Umang Jain <umang.jain@ideasonboard.com>
Cc: linux-staging@lists.linux.dev, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Stefan Wahren <stefan.wahren@i2se.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Adrien Thierry <athierry@redhat.com>,
	Dan Carpenter <error27@gmail.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [RFC PATCH 0/4] Drop custom logging
Message-ID: <Y8kOmFWG/korDc5Y@kroah.com>
References: <20230118115810.21979-1-umang.jain@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230118115810.21979-1-umang.jain@ideasonboard.com>

On Wed, Jan 18, 2023 at 05:28:06PM +0530, Umang Jain wrote:
> Drop custom logging from the vchiq interface.
> Mostly of them are replaced with dev_dbg and friends
> and/or pr_info and friends. 

Everything should be dev_*() calls, there should never be a pr_* call in
a driver.

> The debugfs log levels (in 4/4) are mapped to kernel
> logs levels (coming from include/linux/kern_levels.h)
> Would like some thoughts on it as I am not sure (hence
> marking this is RFC)

Do not have any "custom" debugging controls in a driver, they are not
special and should follow the whole rest of the kernel.  Just remove
them all and rely on the existing dev_*() calls instead please.

thanks,

greg k-h
