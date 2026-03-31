Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DB5F3D8903;
	Tue, 31 Mar 2026 08:43:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774946609; cv=none; b=j98veOfI3kVIZNrtISy1btE9OkF/tipNom9t6Tbv8UKNEKsRok5yeOS3jViq52yVpW/XbIy4Kbx35+z4WgL1Yb8TlLQR3vLJUAVaOCNXd4xm1yKzCbhbxsaow7RuBQ/OFmQ0ZGWyhwRbRW7qwuf7TcEtgVsE44S3Sz+jeE7TX5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774946609; c=relaxed/simple;
	bh=ZFmFE6W4XO0y8cy6VtmuFBz4yusH+qWwH/OlTMWNzZI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OP2FUHDPLNeVQJfwj10Bn/2XLhgrvZVZ2I0lDHG84HWtf7sHRU0ko18fkFApDI6vsFq2XLENEdSY65rayQ/KRIB7dJUc6csIvzBjkPXJFETMEcyjmR2Xkhn+zxPpXmLue7954NXF5yLJLtnwL6H1IV3ObrdhkOk2PJSlIj43nv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=jnU71ok+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="jnU71ok+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDE75C19423;
	Tue, 31 Mar 2026 08:43:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1774946609;
	bh=ZFmFE6W4XO0y8cy6VtmuFBz4yusH+qWwH/OlTMWNzZI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jnU71ok+xANjsa6NEcsUA/ewk2UvxZ9kji1fHqxSdk9/udmrVudNNgPFWJH3JEzP8
	 q7GMC1UU6ady+esNG18b/0Iu1WlD19lfiNr9JL93dhArM7bTdZ2UUpnXrwGHIvFii7
	 4MEb6pQ2QUAsLFP1oqf/v7NYE4p4sKlixj2iF20E=
Date: Tue, 31 Mar 2026 10:43:26 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Linus Probert <linus.probert@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] staging: rtl8723bs: rename global functions
Message-ID: <2026033148-mortuary-giveaway-43aa@gregkh>
References: <20260331053843.108678-1-linus.probert@gmail.com>
 <20260331053843.108678-2-linus.probert@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260331053843.108678-2-linus.probert@gmail.com>

On Tue, Mar 31, 2026 at 07:38:42AM +0200, Linus Probert wrote:
> --- a/drivers/staging/rtl8723bs/include/rtw_efuse.h
> +++ b/drivers/staging/rtl8723bs/include/rtw_efuse.h
> @@ -31,7 +31,7 @@ enum {
>  #define		EFUSE_REPEAT_THRESHOLD_			3
>  
>  /*  */
> -/* 	The following is for BT Efuse definition */
> +/*	The following is for BT Efuse definition */
>  /*  */
>  #define		EFUSE_BT_MAX_MAP_LEN		1024
>  #define		EFUSE_MAX_BANK			4

Why make this coding style change when you are just renaming functions?

And how about one-patch-per-function being renamed?  Make this a patch
series?

thanks,

greg k-h
