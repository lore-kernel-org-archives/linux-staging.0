Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 373552C96
	for <linux-staging@lists.linux.dev>; Fri,  5 Nov 2021 09:56:06 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7416461244;
	Fri,  5 Nov 2021 09:56:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1636106165;
	bh=vYVIFCjyGM1T92odk6fVMveGQPoVPPHO2UMvis+BhqQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WnKU4zDjOY9eHuBn1uGEe4YbxX3ttSQuYhs29hf+JkwuYQ0bDJ2D+L3KhMY5l0jAv
	 2kK6i+Qgv+K0UgedKUiF8iK3lr00k+H50vM8c9ScMvMUnCBfJ1R1YeICmz32qA/3n0
	 lc158M0WZwopXu3Xv8qPBewvbkl/nvZZQ7qvKTTI=
Date: Fri, 5 Nov 2021 10:56:03 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Saurav Girepunje <saurav.girepunje@gmail.com>
Cc: Larry.Finger@lwfinger.net, phil@philpotter.co.uk,
	straube.linux@gmail.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, saurav.girepunje@hotmail.com
Subject: Re: [PATCH] staging: r8188eu: core: remove the unused variable
 pAdapter
Message-ID: <YYT/s7TABtElQTnC@kroah.com>
References: <YYNSAqGgDPhV1IE1@Sauravs-MacBook-Air.local>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YYNSAqGgDPhV1IE1@Sauravs-MacBook-Air.local>

On Thu, Nov 04, 2021 at 08:52:42AM +0530, Saurav Girepunje wrote:
> Remove the unused variable pAdapter from Efuse_Write1ByteToFakeContent
> This variable is not used in the function.
> 
> Signed-off-by: Saurav Girepunje <saurav.girepunje@gmail.com>
> ---
>  drivers/staging/r8188eu/core/rtw_efuse.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/staging/r8188eu/core/rtw_efuse.c b/drivers/staging/r8188eu/core/rtw_efuse.c
> index 03c8431b2ed3..39c77f6b06ef 100644
> --- a/drivers/staging/r8188eu/core/rtw_efuse.c
> +++ b/drivers/staging/r8188eu/core/rtw_efuse.c
> @@ -40,10 +40,7 @@ static bool Efuse_Read1ByteFromFakeContent(u16 Offset, u8 *Value)
>  }
> 
>  static bool
> -Efuse_Write1ByteToFakeContent(
> -			struct adapter *pAdapter,
> -			u16 Offset,
> -			u8 Value)
> +Efuse_Write1ByteToFakeContent(u16 Offset, u8 Value)s

You can do this same thing in drivers/staging/rtl8723bs/core/rtw_efuse.c
if you want to.

thanks,

greg k-h
