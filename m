Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA17C72
	for <linux-staging@lists.linux.dev>; Sat,  1 May 2021 12:23:15 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 83BB361409;
	Sat,  1 May 2021 12:23:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1619871795;
	bh=IsCKUsoaFkNF0OuX9NN16ruS+Rs+wIjJ1sC465dv+ss=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VrUvaZIIpBrfM8muwRro4KSxyB0Mzsqk01yyP6fxljWk+3gydENOCBECUqia5mQ5z
	 PeImyO+f4Kw4I8A8+ye3FWfwyC+x00NkBXCFj/8kzuQx1UHYtriIwDtR0SVy32So4h
	 bnRXLZi8T4FRwUZQqCbOOZnZO4iu3f7vsGkt4/Go=
Date: Sat, 1 May 2021 14:23:12 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Ashish Kalra <eashishkalra@gmail.com>
Cc: Ivan Safonov <insafonov@gmail.com>,
	Abheek Dhawan <adawesomeguy222@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Waiman Long <longman@redhat.com>,
	Pritthijit Nath <pritthijit.nath@icloud.com>,
	Allen Pais <apais@linux.microsoft.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: wlan-ng: silence incorrect type in argument
 1 (different address spaces)
Message-ID: <YI1IMG8tCvvRMq3i@kroah.com>
References: <YI098DQNtK3i2Fge@ashish-NUC8i5BEH>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YI098DQNtK3i2Fge@ashish-NUC8i5BEH>

On Sat, May 01, 2021 at 05:09:28PM +0530, Ashish Kalra wrote:
> Currently p80211knetdev_do_ioctl use type casting to req->data to prevent sparse warning while calling memdup_user, instead of type casting it here, its better to change data type for data inside p80211ioctl_req to include __user.

Please properly line-wrap your changelog comments.

Can you fix it up and resend it as v3?

thanks,

greg k-h
