Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AC143DFC83;
	Mon,  4 May 2026 14:57:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777906645; cv=none; b=Xc4H4BdwHK9TQlkU4KaklwLpKcg0qmu2BpLOgUoFIX8uW8Tnr/D/cXKC3ND3F7g+ad8zE9PSUWlhmQMA0PlCfW+V2Gxw2A6KFndX4ir4GMzdDsue2ifiPFFIzA+5m1hpxulQ15OLd+Hju62VNCmwLzEU4YrYMO0ReHu9zgpVDq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777906645; c=relaxed/simple;
	bh=GTf8ppWhFHlR0KTLGmLR9WjigovCUKaZP7MMd4v/DPA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u/tvI0rAX8KE8Stfx+4kaeTWMLmcC5jy6z87vdXMCWXOnnpam4dlle5y0BCrGbtjf9KKHojFBzKhsRr0GH0i7hL9CldfjrqG7ovnszWZOLS/xwq0fNZnZNsS1/PYilKG8i8mNhccloaTsemiKKGwErRb04vBnrgclIJxvOz4als=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=2L96WSxc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="2L96WSxc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5028C2BCC4;
	Mon,  4 May 2026 14:57:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1777906645;
	bh=GTf8ppWhFHlR0KTLGmLR9WjigovCUKaZP7MMd4v/DPA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=2L96WSxcPFsce6dtpSF5NPExeb6cYNiOxZlM1+zI15cXJTrU30xWmg+1FTGBLYd7U
	 UAQ5bNVbvxibGclVKB3kXOKUajoxK7ORjxaMYbMsFlF/mZiuKe5eGXMQ+vxbOe8WUX
	 jyis7lEXaSoqNJar27esV+p0X/Gt0FN3WG1ABP+8=
Date: Mon, 4 May 2026 16:48:20 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Shyam Sunder Reddy Padira <shyamsunderreddypadira@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: hal: add blank line after declaration
Message-ID: <2026050413-blatancy-twisted-705b@gregkh>
References: <20260427183456.6160-1-shyamsunderreddypadira@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260427183456.6160-1-shyamsunderreddypadira@gmail.com>

On Tue, Apr 28, 2026 at 12:04:56AM +0530, Shyam Sunder Reddy Padira wrote:
> Add missing  blank line after variable declarations to comply with
> kernel coding style.
> 
> Signed-off-by: Shyam Sunder Reddy Padira <shyamsunderreddypadira@gmail.com>
> ---
>  drivers/staging/rtl8723bs/hal/rtl8723b_phycfg.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_phycfg.c b/drivers/staging/rtl8723bs/hal/rtl8723b_phycfg.c
> index 6d5e531505f9..7fac1c2ba8e0 100644
> --- a/drivers/staging/rtl8723bs/hal/rtl8723b_phycfg.c
> +++ b/drivers/staging/rtl8723bs/hal/rtl8723b_phycfg.c
> @@ -575,6 +575,7 @@ static void phy_SetRegBW_8723B(
>  )
>  {
>  	u16 RegRfMod_BW, u2tmp = 0;
> +
>  	RegRfMod_BW = rtw_read16(Adapter, REG_TRXPTCL_CTL_8723B);
>  
>  	switch (CurrentBW) {
> -- 
> 2.43.0
> 
> 

Does not apply to my tree :(
