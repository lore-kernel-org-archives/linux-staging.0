Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06AE73209
	for <linux-staging@lists.linux.dev>; Sun,  6 Nov 2022 17:05:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76D7EC433D6;
	Sun,  6 Nov 2022 17:05:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667754309;
	bh=bo9UiN0uF95hKgvEmTSOyPSCOtDhnoUrHoiV9xWj5sE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TEseAInRMLjFV8vMzRajPHRywHzl1U/yDCizwH2SkWD7IFc1wpHqFlAlt9OvFCkca
	 tsWkMtcQLfoIjou/FPk1IuSjfuZiPG9gqstdwDM4K+Ur1Gbk8P4mTL5GwZQtPf5h6h
	 oBn0bsBOYy+9li0oMM+t7HQnjA/tj/v/aE4Kib5uXGMWo0G0aK0RKcyoPdLWEWiGNw
	 p05YWa3sSzvT7WDTf0MUdADE0D6PuupebjO/4YAZpipO5DXWtKld7mehCI4lvu2V6B
	 //vzrVmTVoeqgvlAPhgPEAd+jEFoUqHkIfNuWKTh6qtP9PVybKmWIEiaN6thMVWem1
	 CnF05X6H64urw==
Date: Sun, 6 Nov 2022 12:05:08 -0500
From: Sasha Levin <sashal@kernel.org>
To: Hans de Goede <hdegoede@redhat.com>
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	gregkh@linuxfoundation.org, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH AUTOSEL 6.0 15/34] media: atomisp-ov2680: Fix
 ov2680_set_fmt()
Message-ID: <Y2fpRNxez+odikgL@sashalap>
References: <20221101112726.799368-1-sashal@kernel.org>
 <20221101112726.799368-15-sashal@kernel.org>
 <48a28601-a3eb-8735-6a15-34436dcbd73e@redhat.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <48a28601-a3eb-8735-6a15-34436dcbd73e@redhat.com>

On Tue, Nov 01, 2022 at 02:27:53PM +0100, Hans de Goede wrote:
>Hi Sasha,
>
>I have no specific objections against the backporting of this
>and other atomisp related patches.
>
>But in general the atomisp driver is not yet in a state where
>it is ready to be used by normal users. Progress is being made
>but atm I don't really expect normal users to have it enabled /
>in active use.
>
>As such I'm also not sure if there is much value in backporting
>atomisp changes to the stable series.
>
>I don't know if you have a way to opt out certain drivers /
>file-paths from stable series backporting, but if you do
>you may want to consider opting out everything under:
>
>drivers/staging/media/atomisp/
>
>As said above I don't think doing the backports offers
>much (if any) value to end users and I assume it does take
>you some time, so opting this path out might be better.
>
>Also given the fragile state of atomisp support atm
>it is hard to say for me if partially backporting some of
>the changes won't break the driver.

I'll blacklist drivers/staging/media/atomisp/, thank you!

-- 
Thanks,
Sasha
