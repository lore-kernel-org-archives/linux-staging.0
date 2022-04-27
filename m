Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10B6B3D60
	for <linux-staging@lists.linux.dev>; Wed, 27 Apr 2022 17:41:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 686BFC385A7;
	Wed, 27 Apr 2022 17:41:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1651081278;
	bh=nZSNSF+EWjIbhu9mtLR2T19R0sO636SM+f1bzIV2TZ0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=1yoiB1220cO3mszBl9ZNbJnqCtL6s0i/3VTGdTnrUMl0/CnU4MB8TV3lqsOivsXD8
	 /zDcvSqGl71guk6gLBHMP+F684nI3l6ZW6Tjp400CzNZcAldKuCTUHCRkoHcskbLfc
	 /aobxvBkmS/QZhVNm5DCviHV9+JSAdMzERozyngo=
Date: Wed, 27 Apr 2022 19:41:15 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: davem@davemloft.net, pabeni@redhat.com, netdev@vger.kernel.org,
	steve.glendinning@shawell.net, david.kershner@unisys.com,
	liujunqi@pku.edu.cn, sparmaintainer@unisys.com,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH net-next 02/14] eth: remove NAPI_WEIGHT defines
Message-ID: <YmmAOx4z9mZS0pkK@kroah.com>
References: <20220427154111.529975-1-kuba@kernel.org>
 <20220427154111.529975-3-kuba@kernel.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220427154111.529975-3-kuba@kernel.org>

On Wed, Apr 27, 2022 at 08:40:59AM -0700, Jakub Kicinski wrote:
> Defining local versions of NAPI_POLL_WEIGHT with the same
> values in the drivers just makes refactoring harder.
> 
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>
> ---
> CC: steve.glendinning@shawell.net
> CC: david.kershner@unisys.com
> CC: gregkh@linuxfoundation.org
> CC: liujunqi@pku.edu.cn
> CC: sparmaintainer@unisys.com
> CC: linux-staging@lists.linux.dev
> ---
>  drivers/net/ethernet/smsc/smsc9420.c            | 2 +-
>  drivers/net/ethernet/smsc/smsc9420.h            | 1 -
>  drivers/staging/unisys/visornic/visornic_main.c | 4 ++--

This file is gone in my tree and in linux-next, so no need to worry
about it anymore.

thanks,

greg k-h
