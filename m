Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFFC82FB0
	for <linux-staging@lists.linux.dev>; Tue, 17 Aug 2021 17:52:13 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id DF8A660FE6;
	Tue, 17 Aug 2021 17:52:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1629222733;
	bh=/dyoKG0guNp8ZGznN909rqgVncnMmv0kevcZcyZqpnw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FybZAKKSNXJrUo2qyv/k4c36voo0LPcIPlx4QExh10xbxRvtMuTrSIfG6wYty6365
	 rUj6kgUcA2KxCPWWHDAR+3c26SFaMf29Cjzl5XB28KDvP4EH/6lhSoXhcrg73zMtz0
	 y17ny5XONe1d/Lx/2hPyXZM+UBz+Vl2NfX2Rti5Q=
Date: Tue, 17 Aug 2021 19:52:10 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Cai Huoqing <caihuoqing@baidu.com>
Cc: Larry.Finger@lwfinger.net, phil@philpotter.co.uk, martin@kaiser.cx,
	insafonov@gmail.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: r8188eu: Remove LINUX_VERSION_CODE check
Message-ID: <YRv3Stj8q7wf+B8D@kroah.com>
References: <20210817081204.2232-1-caihuoqing@baidu.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210817081204.2232-1-caihuoqing@baidu.com>

On Tue, Aug 17, 2021 at 04:12:04PM +0800, Cai Huoqing wrote:
> no need to check linux version, depending on the latest version
> 
> Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>
> ---
>  drivers/staging/r8188eu/core/rtw_mlme.c      |  5 ----
>  drivers/staging/r8188eu/os_dep/os_intfs.c    | 26 ++------------------
>  drivers/staging/r8188eu/os_dep/rtw_android.c |  6 -----
>  drivers/staging/r8188eu/os_dep/xmit_linux.c  |  6 -----
>  4 files changed, 2 insertions(+), 41 deletions(-)
> 

Does not apply to my tree :(
