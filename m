Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2271172
	for <linux-staging@lists.linux.dev>; Thu,  1 Jul 2021 09:51:20 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4FB6D60238;
	Thu,  1 Jul 2021 09:51:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1625133079;
	bh=fpuEFrUiU5EVTjFlLK6uC+5uhkFCrLLjAqBmuItpzFY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=F6SOxaiey35zldGTmJos6Vw0zFdMWtV920qP9urq24IvOdyQOEcbWFq/eP+lBth0b
	 R9XnFR9BbOsZ+ib9P9IPSO4Rdc3qe0tzRu213lswhExJ8WzWJk3PiJvTBRUPETmsLE
	 bAvVdKdHZOLZJoEl8QyaQEqTpw82Yy1qit2kAP2E=
Date: Thu, 1 Jul 2021 11:51:17 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, linuxarm@huawei.com,
	mauro.chehab@huawei.com, linux-phy@lists.infradead.org,
	linux-staging@lists.linux.dev, linux-usb@vger.kernel.org,
	Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
	kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: repair reference in USB IP DRIVER FOR
 HISILICON KIRIN 970
Message-ID: <YN2QFcH/DcGeg/0u@kroah.com>
References: <20210701093903.28733-1-lukas.bulwahn@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210701093903.28733-1-lukas.bulwahn@gmail.com>

On Thu, Jul 01, 2021 at 11:39:03AM +0200, Lukas Bulwahn wrote:
> Commit 8de6b7edd493 ("phy: phy-hi3670-usb3: move driver from staging into
> phy") moves phy-hi3670-usb3.c from ./drivers/staging/hikey9xx/ to
> ./drivers/phy/hisilicon/, but the new file entry in MAINTAINERS refers to
> ./drivers/phy/hisilicon/phy-kirin970-usb3.c.
> 
> Hence, ./scripts/get_maintainer.pl --self-test=patterns complains:
> 
>   warning: no file matches  F:  drivers/phy/hisilicon/phy-kirin970-usb3.c
> 
> Repair the file entry by referring to the right location.
> 
> Fixes: 8de6b7edd493 ("phy: phy-hi3670-usb3: move driver from staging into phy")
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> ---
> applies cleanly on next-20210701
> 
> Mauro, please ack.
> Greg, please pick this non-urgent minor fix on top of commit 8de6b7edd493

Thanks, I'll take this after 5.14-rc1 is out.

greg k-h
