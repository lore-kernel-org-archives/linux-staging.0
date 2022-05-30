Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F81817E8
	for <linux-staging@lists.linux.dev>; Mon, 30 May 2022 08:14:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D40B8C385B8;
	Mon, 30 May 2022 08:14:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1653898471;
	bh=8VgPejTLh/Va14hE2dsYxkbnUTnqDKlPzUmj0S1440c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aLlhtZamTkQ4LVZ26x6gszSywyBIqSGBxF4kvlBceOgl5LQscE6Y3GcIY9ChHW6Jv
	 pMzki5cSmz0HLx7Ik/BKV3rnJC8MYWB9rQC3hAIdRrHFEsYV3cGKc1z9QnsUvsd5tC
	 U1iJSOQLzOR4iUlLumEYWjGNCC4Vc5xRVD+uinz8=
Date: Mon, 30 May 2022 10:14:28 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Haowen Bai <baihaowen@meizu.com>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Florian Schilhabel <florian.c.schilhabel@googlemail.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8712: Fix pointer dereferenced before
 checking
Message-ID: <YpR85JgzGsTzYm3W@kroah.com>
References: <1653897933-25931-1-git-send-email-baihaowen@meizu.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1653897933-25931-1-git-send-email-baihaowen@meizu.com>

On Mon, May 30, 2022 at 04:05:32PM +0800, Haowen Bai wrote:
> The padapter->recvpriv.signal_qual_data is dereferencing before null
> checking, so move it after checking.
> 
> Signed-off-by: Haowen Bai <baihaowen@meizu.com>
> ---
>  drivers/staging/rtl8712/rtl8712_recv.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/rtl8712/rtl8712_recv.c b/drivers/staging/rtl8712/rtl8712_recv.c
> index 7f1fdd058551..8ed94b259dbe 100644
> --- a/drivers/staging/rtl8712/rtl8712_recv.c
> +++ b/drivers/staging/rtl8712/rtl8712_recv.c
> @@ -863,10 +863,12 @@ static void process_link_qual(struct _adapter *padapter,
>  {
>  	u32	last_evm = 0, tmpVal;
>  	struct rx_pkt_attrib *pattrib;
> -	struct smooth_rssi_data *sqd = &padapter->recvpriv.signal_qual_data;
> +	struct smooth_rssi_data *sqd;
>  
>  	if (!prframe || !padapter)
>  		return;
> +
> +	sqd = &padapter->recvpriv.signal_qual_data;

How can padapter ever be NULL in this codepath?

thanks,

greg k-h
