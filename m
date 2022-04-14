Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E88157B
	for <linux-staging@lists.linux.dev>; Thu, 14 Apr 2022 10:26:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44599C385A5;
	Thu, 14 Apr 2022 10:26:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1649931970;
	bh=ZQjNNGaDE88G+jCAsYeLoetA2Gs7aMcuSn6n5mbSGRQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KAT+o4XQH1FNm9EN+3rrEgo4JjdEeyC31cRmpj6eXF809docckODh6KUgWiqAskHz
	 nuqzEc1O1r2oWJn+8Dv0UdL16IbjOgdzK1Vrfm8nL/AFnTrI6waLreybSzJEFuxoye
	 dwmPIbuKN35WHObLKoGfjgUqyGfKmIMYtdpkzL14=
Date: Thu, 14 Apr 2022 12:26:00 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Colin Ian King <colin.i.king@gmail.com>
Cc: linux-staging@lists.linux.dev, kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8192u: make read-only array EWC11NHTCap
 static const
Message-ID: <Ylf2uDiVLniQiACK@kroah.com>
References: <20220414101838.296944-1-colin.i.king@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220414101838.296944-1-colin.i.king@gmail.com>

On Thu, Apr 14, 2022 at 11:18:38AM +0100, Colin Ian King wrote:
> Don't populate the read-only array EWC11NHTCap on the stack but instead
> make it static const. Also makes the object code a little smaller. Move
> comment to clean up checkpatch warning.
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---
>  drivers/staging/rtl8192u/ieee80211/rtl819x_HTProc.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/rtl8192u/ieee80211/rtl819x_HTProc.c b/drivers/staging/rtl8192u/ieee80211/rtl819x_HTProc.c
> index 358c35d9589c..b4cbe499ba37 100644
> --- a/drivers/staging/rtl8192u/ieee80211/rtl819x_HTProc.c
> +++ b/drivers/staging/rtl8192u/ieee80211/rtl819x_HTProc.c
> @@ -480,7 +480,8 @@ void HTConstructCapabilityElement(struct ieee80211_device *ieee, u8 *posHTCap, u
>  	}
>  	memset(posHTCap, 0, *len);
>  	if (pHT->ePeerHTSpecVer == HT_SPEC_VER_EWC) {
> -		u8	EWC11NHTCap[] = {0x00, 0x90, 0x4c, 0x33};	// For 11n EWC definition, 2007.07.17, by Emily
> +		/* For 11n EWC definition, 2007.07.17, by Emily */

This is not needed anymore, you know this...

Just delete it please.

thanks,

greg k-h
