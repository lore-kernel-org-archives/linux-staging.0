Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB70E6D0E
	for <linux-staging@lists.linux.dev>; Wed,  7 Apr 2021 08:20:16 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id E0D2461363;
	Wed,  7 Apr 2021 08:20:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1617783616;
	bh=RIQQZ/8OzyrqcVeWTPhjOoZF88p41cOlDYgQorJvWh0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nSFcHHCumsdCEBMoybYS1wxglvtYG8f+/SgA1uBtK0d1UmLZxCYMCwrGHq6U0YPuD
	 OnQG6+sQ9IDUh46edCwkdF9aDA07VEKNRmz0kjTxWaxBLK5NeCAT0qe59jTBB62vNB
	 iAI+Ec2e2X9Uri8tHyeEPlaWTT/ZEJDRjS/R01Hs=
Date: Wed, 7 Apr 2021 10:20:14 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: remove unused variable
Message-ID: <YG1rPiYTjo2zkiJp@kroah.com>
References: <1617765499-65626-1-git-send-email-jiapeng.chong@linux.alibaba.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1617765499-65626-1-git-send-email-jiapeng.chong@linux.alibaba.com>

On Wed, Apr 07, 2021 at 11:18:19AM +0800, Jiapeng Chong wrote:
> Fix the following gcc warning:
> 
> drivers/staging/rtl8723bs/core/rtw_ieee80211.c:657:15: warning: variable
> ‘sec_idx’ set but not used [-Wunused-but-set-variable].
> 
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
> ---
>  drivers/staging/rtl8723bs/core/rtw_ieee80211.c | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)

This does not apply to my tree anymore, please update your branch and
rebase and resend.

thanks,

greg k-h
