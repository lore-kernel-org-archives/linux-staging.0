Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 584233DDAF4;
	Tue, 28 Jul 2026 07:29:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785223767; cv=none; b=KwaV89D8yJrCCAITfn5a8c1x6LaIcnpWdJIqzpNrEQzH6q8hCIh38SAoYFmFZuN8r8XqpC5oDDZ0Va3FvUiluq3x2lWq/QOd0rLTiWRm909mWv2EslQTc9Li0H+4Ute3jWTExq9c61cWl7sBfoZCfyJ9drQG4mDxIRIlCzKsEUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785223767; c=relaxed/simple;
	bh=D5UVOkiCu+KtiJswZXGOzxv4BI1W9lTOvcNAUtmiQDE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tJmP0x8f6ue0eMMcwq0RoHb2BHe18AKpcLtN9QLT9/l6IUPsLcS9zPLrDojNXY8AYcUj/1xK+b3qgiLvb913j8NhTJIMFYvwNAyHmht4zEK/bjGpO4mx8uN2i3F2a0FCkXpPfl2YZswRdU5YRREQ56eJldkDxEEK9eFESo1cJRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=R32MNUtY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="R32MNUtY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 480151F000E9;
	Tue, 28 Jul 2026 07:29:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1785223765;
	bh=oKnUHCs9ceYoT0tJ6NUUnKhFCgsTExGi400pcm808dU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=R32MNUtYc5J24jsflLCzvJvZl4YUx6gqFgdhkeXZMTHi4Wy/QCnjw2Tg3n23xela3
	 n5L6L07Du4RgRiz6LYR6nO52r8QSYoVjTprtS5RTZM+SAggnOXjuhBj6hfTwEyiRJC
	 PjrKlD3kqRsRZ8CbChed6FcF3MLTARZlrd6MZips=
Date: Tue, 28 Jul 2026 09:28:58 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Dalvin-Ehinoma Noah Aiguobas <fliegbert2@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] staging: rtl8723bs: Renaming variables with type
 prefix
Message-ID: <2026072832-rehydrate-pulp-540b@gregkh>
References: <20260719115451.4401-1-fliegbert2@gmail.com>
 <20260719115451.4401-4-fliegbert2@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260719115451.4401-4-fliegbert2@gmail.com>

On Sun, Jul 19, 2026 at 11:54:51AM +0000, Dalvin-Ehinoma Noah Aiguobas wrote:
> Renaming deprecated variable names which use prefixes as type
> indicators to conform to the styleguide and for improved readability.
> 
> Signed-off-by: Dalvin-Ehinoma Noah Aiguobas <fliegbert2@gmail.com>
> ---
>  drivers/staging/rtl8723bs/core/rtw_mlme.c | 152 +++++++++++-----------
>  1 file changed, 76 insertions(+), 76 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
> index 114deeecc80f..7e3be8cbc829 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
> @@ -675,52 +675,52 @@ void rtw_survey_event_callback(struct adapter *adapter, u8 *pbuf)
>  	spin_unlock_bh(&pmlmepriv->lock);
>  }
>  
> -void rtw_surveydone_event_callback(struct adapter *adapter, u8 *pbuf)
> +void rtw_surveydone_event_callback(struct adapter *adapter, u8 *buf)
>  {
> -	struct mlme_priv *pmlmepriv = &adapter->mlmepriv;
> +	struct mlme_priv *mlme_priv = &adapter->mlmepriv;

As you are changing all of the variables, this patch is hard to read and
verify that this is correct.  Please only do one variable name at a
time.

thanks,

greg k-h
