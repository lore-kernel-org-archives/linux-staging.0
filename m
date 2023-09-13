Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0773C10F5
	for <linux-staging@lists.linux.dev>; Wed, 13 Sep 2023 08:33:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5E02C433C7;
	Wed, 13 Sep 2023 08:33:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1694594007;
	bh=rPnckKz1MYdU330yUqXYFeZi3oxOU3A8T8nVPMp+cqw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jWV5kJiwtYCiyIJS3ly/pdMPInls1PpYW5bXT0tN2eCNBjowv/OPFIh/qTocAyw/s
	 M2uVSJULIW8QuLRmYMGYjdh0voDo5WygtEXbR6WrSF3bvtyq86LpADxXvDhaM1bd7s
	 2nJnbcd8wkvgTi6pIWIS9HREEwQ0k8iynw5tHqGo=
Date: Wed, 13 Sep 2023 10:33:24 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Jonathan Bergh <bergh.jonathan@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] staging: vme_user: Fix block comments where '*' on
 each line should be aligned
Message-ID: <2023091339-mountain-asleep-9439@gregkh>
References: <20230909184818.699987-1-bergh.jonathan@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230909184818.699987-1-bergh.jonathan@gmail.com>

On Sat, Sep 09, 2023 at 08:48:18PM +0200, Jonathan Bergh wrote:
> Fixed checkpatch warnings where lines with '*' in block comments should
> be aligned and were not as well as incorrect tab spacings at the start of
> comment lines.
> 
> Signed-off-by: Jonathan Bergh <bergh.jonathan@gmail.com>
> ---
>  drivers/staging/vme_user/vme_tsi148.h | 140 +++++++++++++-------------
>  1 file changed, 70 insertions(+), 70 deletions(-)
> 
> diff --git a/drivers/staging/vme_user/vme_tsi148.h b/drivers/staging/vme_user/vme_tsi148.h
> index dbdf5dabaf90..9748b7897527 100644
> --- a/drivers/staging/vme_user/vme_tsi148.h
> +++ b/drivers/staging/vme_user/vme_tsi148.h
> @@ -251,28 +251,28 @@ static const int TSI148_LCSR_VIACK[8] = { 0, TSI148_LCSR_VIACK1,
>   */
>  #define TSI148_LCSR_VMEFL	0x250
>  
> -	/*
> -	 * VME exception.
> -	 * offset  260
> +/*
> + * VME exception.
> + * offset  0x260

This change is not documented :(

Also I have two 2/2 patches, yet they are both different :(

Please fix this up and send a whole new series, properly versioned,
as-is, I have no idea what to do here.

thanks,

greg k-h
