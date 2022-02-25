Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DBDF1FBD
	for <linux-staging@lists.linux.dev>; Fri, 25 Feb 2022 10:32:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 769D0C340E7;
	Fri, 25 Feb 2022 10:32:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1645785159;
	bh=WQQt1uu312A8XAs+LoP4SDfB91oIAFo5DwTin5tMleA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uBW9Hi9JccIwTAKePyO2/690IAkx8JAzL/Kla+OIpGoBi4ZJaBhfVXQleOJNl5a8X
	 3xA1o4aNphQibsgBjgX8+znJ3GqA8dLvYVSxUz3BdQZ2cQsIh6BfD0TE9bO5ZG3gHx
	 QS9gLSoTdlth+Tm1H1aGGiLWvacrQ3F7QYRN/Jrc=
Date: Fri, 25 Feb 2022 11:32:31 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Song Chen <chensong_2000@189.cn>
Cc: johan@kernel.org, elder@kernel.org, thierry.reding@gmail.com,
	u.kleine-koenig@pengutronix.de, lee.jones@linaro.org,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org,
	elder@ieee.org
Subject: Re: [PATCH v3] staging: greybus: introduce pwm_ops::apply
Message-ID: <YhiwP/qt+yHLHztR@kroah.com>
References: <1645780561-18481-1-git-send-email-chensong_2000@189.cn>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1645780561-18481-1-git-send-email-chensong_2000@189.cn>

On Fri, Feb 25, 2022 at 05:16:01PM +0800, Song Chen wrote:
> Introduce apply in pwm_ops to replace legacy operations,
> like enable, disable, config and set_polarity.

Why?  You are saying what you are doing here, but nothing about why this
is needed, or what it will help with, or what it will fix.

You need to explain why a change is needed.

thanks,

greg k-h
