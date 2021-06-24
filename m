Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7426829D6
	for <linux-staging@lists.linux.dev>; Thu, 24 Jun 2021 14:27:20 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id AA9516024A;
	Thu, 24 Jun 2021 14:27:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1624544840;
	bh=/W7GGtFuHznE/k7ogBLCPm6Nks6yk9xFc5/56IqkYuI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ew3Cd6sRv4GTber3Mwcl4FY/kn++KMhFdnWMjvGeRwF3Zg/e62KkqObHKHYxz3jxR
	 GbQtjl67gpqsf4MDjWDK/iy8SjQ2a5p/14jNBAbei8L+eUEZtro02p2WdUl9va9u88
	 +IEzNp43tUARi8d4yXhRqj/Wx47IAm638mAEwNQ0=
Date: Thu, 24 Jun 2021 16:27:18 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: linuxarm@huawei.com, mauro.chehab@huawei.com,
	Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org, linux-staging@lists.linux.dev,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH v7 0/8] Move Hisilicon 6421v600 SPMI and USB drivers out
 of staging
Message-ID: <YNSWRlCjJ6WlrM/6@kroah.com>
References: <cover.1624542940.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1624542940.git.mchehab+huawei@kernel.org>

On Thu, Jun 24, 2021 at 04:01:29PM +0200, Mauro Carvalho Chehab wrote:
> Hi Greg,
> 
> Those are the remaining patches that are needed for the USB to work
> with Hikey970.
> 
> This series address the comments made on v5. Sorry for taking so long to
> return back on this. Got sidetracked by other unrelated stuff.

I took the first 2 patches in here.

thanks,

greg k-h
