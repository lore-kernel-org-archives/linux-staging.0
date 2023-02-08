Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 174B7386
	for <linux-staging@lists.linux.dev>; Wed,  8 Feb 2023 12:31:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26B51C433D2;
	Wed,  8 Feb 2023 12:31:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1675859481;
	bh=Tb3++ufYdLByX152q1sqsAfFlS7LFPTgvHN6jET/kg4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=M/KKNJjcQvcBwYAbTmZBT0TWHLxnnRpCL6Rw2sECaV1OaYpwT+Mn/t0DBkocCHiSF
	 7eKpQYoHt2a+2ClJy3XhJ/eY7MfnQHU0AM0nreOhsmi/cmRI/+uuSzAkxTQSitOLyl
	 c72AWBYybuiYOz4gCPJQ329CP8o2/fvcPDlpqGTY=
Date: Wed, 8 Feb 2023 13:31:18 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Philipp Hortmann <philipp.g.hortmann@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 02/10] staging: rtl8192e: Calculate definition of
 MSR_LINK_MASK
Message-ID: <Y+OWFsZD3m+VsnYS@kroah.com>
References: <cover.1675792435.git.philipp.g.hortmann@gmail.com>
 <8c8a126a83683bae69d0fd20a93bdea8f810f6d0.1675792435.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8c8a126a83683bae69d0fd20a93bdea8f810f6d0.1675792435.git.philipp.g.hortmann@gmail.com>

On Tue, Feb 07, 2023 at 07:16:22PM +0100, Philipp Hortmann wrote:
> Calculate definition of MSR_LINK_MASK ((1<<0)|(1<<1)) = 3. Equation is not
> accepted by checkpatch because of missing spaces.
> 
> Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
> ---
>  drivers/staging/rtl8192e/rtl8192e/r8192E_hw.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_hw.h b/drivers/staging/rtl8192e/rtl8192e/r8192E_hw.h
> index 1546bb575293..20a35c9caee8 100644
> --- a/drivers/staging/rtl8192e/rtl8192e/r8192E_hw.h
> +++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_hw.h
> @@ -170,7 +170,7 @@ enum _RTL8192PCI_HW {
>  #define	BW_OPMODE_20MHZ			BIT2
>  	IC_VERRSION		= 0x301,
>  	MSR			= 0x303,
> -#define MSR_LINK_MASK      ((1<<0)|(1<<1))
> +#define MSR_LINK_MASK      3

This is a bit field, it should be:
	#define MSR_LINK_MASK	(BIT(1) | BIT(0))
right?

thanks,

greg k-h
