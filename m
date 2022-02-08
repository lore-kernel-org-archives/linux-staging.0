Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 557F12F26
	for <linux-staging@lists.linux.dev>; Tue,  8 Feb 2022 09:46:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86753C004E1;
	Tue,  8 Feb 2022 09:46:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1644313608;
	bh=8UbAjj/H6avAWOylioig6EnD0MGcFmQgIPkZQYteBMI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NL4mPYiCgOPwGpLfECYMdrXx3UnBrMG1x8wFtDUHy63Yp9jTV2gbwD65NwdCBr+LQ
	 yDQuC8cCfuCJtkdD1Dehs3YIBY8/jAa4RrVpIyyA/S3OQf3zj1e8gjf86MmYGwHXtu
	 gn/ibnf871eQ+VlCXDQLN1HXJ1z5Fhb5yxcdFvDU=
Date: Tue, 8 Feb 2022 10:46:45 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Tong Zhang <ztong0001@gmail.com>
Cc: Tom Rix <trix@redhat.com>, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev, insop.song@gainspeed.com,
	devel@driverdev.osuosl.org, dan.carpenter@oracle.com
Subject: Re: [PATCH] staging: drop fpgaboot driver
Message-ID: <YgI8BQlUa671AvkY@kroah.com>
References: <Yf025dphJw2rUVR5@kroah.com>
 <20220204190847.3809405-1-ztong0001@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220204190847.3809405-1-ztong0001@gmail.com>

On Fri, Feb 04, 2022 at 11:08:35AM -0800, Tong Zhang wrote:
> The gs_fpgaboot driver is totally broken since 2014 and no one even
> noticed the driver is not probing. Given the quality of the driver
> and its current state it makes sense to drop it.
> 
> Signed-off-by: Tong Zhang <ztong0001@gmail.com>

Thanks, now dropped!

