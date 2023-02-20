Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FB83EC8
	for <linux-staging@lists.linux.dev>; Mon, 20 Feb 2023 06:49:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 822BAC433EF;
	Mon, 20 Feb 2023 06:49:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1676875762;
	bh=sVELIR1aCeRiEfB3+3CY4D+1Y+UQ3y/Aa5WRDygQsx4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EFKqAYWJLEUGMOpsAt7vJc2qCG7PEkaSrv2kWSdHdqh12+mTpQ6euVTBEYA0OHuSc
	 25jSHvnFzo+o2a9mFKs142Qztdgttg/Zd1adDxCL+KVCRoT99Iw6LqX4tjrpU/Kd9n
	 l/hBe/Z1TIyPq3+XGaB38Y5iiR+u6lTPgu+OSV2U=
Date: Mon, 20 Feb 2023 07:49:19 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Shibo Li <zzutcyha@163.com>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Florian Schilhabel <florian.c.schilhabel@googlemail.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8712: Fix Sparse warning in rtl871x_xmit.c
Message-ID: <Y/MX76sdTPoEuYi4@kroah.com>
References: <20230220060823.11472-1-zzutcyha@163.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230220060823.11472-1-zzutcyha@163.com>

On Mon, Feb 20, 2023 at 06:08:23AM +0000, Shibo Li wrote:
> This patch fixes the following warning in rtl871x_xmit.c:
> 
> WARNING: Possible repeated word: 'very'
> + * Must be very very cautious...

Sorry but this text is correct.

thanks,

greg k-h
