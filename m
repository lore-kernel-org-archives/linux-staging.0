Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60D2A72
	for <linux-staging@lists.linux.dev>; Mon, 12 Apr 2021 16:45:38 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3106161042;
	Mon, 12 Apr 2021 16:45:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1618245937;
	bh=YzJfpRRwHIL/702AQ7JNIjM04wJ0QxXSj4/2WU2D0Yo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=enPn3PDHLhw/lDt7On0cAtqD72stzBnSJQiVTR3LsgOEClrvOanEN1Jmulh2WTFbG
	 wGkuIFFO8I+ciIUm9snU3Hep1VV4mXl2dutwDy3U8fabfo7K0CtbwmbKpdbak5rMrD
	 1yETrg+Y4byb5Ye69LdOhq9IO5kUFQR4Z4EEOcTE=
Date: Mon, 12 Apr 2021 18:45:35 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Bryan Brattlof <hello@bryanbrattlof.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Larry Finger <Larry.Finger@lwfinger.net>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH v2] staging: rtl8723bs: remove unnecessary adapter
Message-ID: <YHR5L2aSZ4hNNmT0@kroah.com>
References: <20210412163650.42467-1-hello@bryanbrattlof.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210412163650.42467-1-hello@bryanbrattlof.com>

On Mon, Apr 12, 2021 at 04:43:56PM +0000, Bryan Brattlof wrote:
> The if2 adapter is defined in rtw_dvr_init() and in the dvobj_priv
> structure but never used anywhere in the driver. This will remove all
> definitions of if2
> 
> Signed-off-by: Bryan Brattlof <hello@bryanbrattlof.com>
> ---
>  drivers/staging/rtl8723bs/include/drv_types.h |  1 -
>  drivers/staging/rtl8723bs/os_dep/sdio_intf.c  | 10 ++++------
>  2 files changed, 4 insertions(+), 7 deletions(-)

What changed from v1?  That goes below the --- line.

v3?
