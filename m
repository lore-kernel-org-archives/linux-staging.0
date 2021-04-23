Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ADED71
	for <linux-staging@lists.linux.dev>; Fri, 23 Apr 2021 10:04:21 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id B797961406;
	Fri, 23 Apr 2021 10:04:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1619172260;
	bh=BVmVRBcc+xURxXzibUOmVi3IMUrVVo+kjD/gmHXkM/Y=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=lspdWIBKpBdgkBInC582upbaTMdkKugwS7RXKADoHgS71ydIoNlSleiemQ2085d1o
	 zfGagoPlIVzHExVrqZKunBd15LWeL1U94mMNnV6p1IC+W6kmt9l5WLuEFi6SVihHcf
	 moSTNHCwHfp0JPwOYVFW454lk2Bsr6ZqJGrNRc5VttETp0MsnQjnQt5Jzr+ThPImRF
	 IgBv7qt28QFV5zif5/MPX1qseAZsXFUdUv/KFPAwoxK2zAgOg8E/YWZ6cl9Hesa3fd
	 j49111Sz33N2wirBSHbv3fFq0eefa9jRIQp/2Y7koCkxzr6cBzDH0OQo0jASutKV5j
	 khY02iaAiMzgg==
Message-ID: <3cf39b952c7c7f8c9dcf602e8ec1a34c21c9b255.camel@kernel.org>
Subject: Re: [PATCH 10/10] staging: vchiq_core: drop vchiq_status from
 vchiq_init_state
From: nicolas saenz julienne <nsaenz@kernel.org>
To: Stefan Wahren <stefan.wahren@i2se.com>, Greg Kroah-Hartman
	 <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev
Date: Fri, 23 Apr 2021 12:04:16 +0200
In-Reply-To: <1619122076-31785-11-git-send-email-stefan.wahren@i2se.com>
References: <1619122076-31785-1-git-send-email-stefan.wahren@i2se.com>
	 <1619122076-31785-11-git-send-email-stefan.wahren@i2se.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.0 (3.40.0-1.fc34) 
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

On Thu, 2021-04-22 at 22:07 +0200, Stefan Wahren wrote:
> Replace the custom set of return values with proper Linux error codes for
> vchiq_init_state().
> 
> Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
> ---

Reviewed-by: Nicolas Saenz Julienne <nsaenz@kernel.org>

Thanks,
Nicolas

