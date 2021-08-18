Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 557822F80
	for <linux-staging@lists.linux.dev>; Wed, 18 Aug 2021 05:41:48 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2ED7E61029;
	Wed, 18 Aug 2021 05:41:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1629265307;
	bh=TtyVd4dGq0qYP7TYqua7W6a9MO+ANKhVkBaH3kwEP1s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=K6nBYXoCyMfpwWbjpV0bS+bMhf/TzHMK+Dy0lyvu/7LebcuCC0bTv1LaZFvKHARRF
	 PBRgHqDy2JcW0/EugrMhSHYwTWSaCtcUvMQ25yUaj50lbU63qCx9JsyzSInvSvkuqX
	 vTbPE8BEn6OiEfBN0kOPgqVrA62nuUzrsyReMdGs=
Date: Wed, 18 Aug 2021 07:41:43 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Cai Huoqing <caihuoqing@baidu.com>
Cc: straube.linux@gmail.com, dan.carpenter@oracle.com,
	yangyingliang@huawei.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: r8188eu: Remove unused including
 <linux/version.h>
Message-ID: <YRydlwA9kNvI1rvp@kroah.com>
References: <20210818022321.2395-1-caihuoqing@baidu.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210818022321.2395-1-caihuoqing@baidu.com>

On Wed, Aug 18, 2021 at 10:23:21AM +0800, Cai Huoqing wrote:
> Remove including <linux/version.h> that don't need it
> based on staging-next

No need for this line in here, describing what tree this was made
against.  Please, if you need to say stuff like this, put it below the
--- line.

Can you please fix up and resend?

thanks,

greg k-h
