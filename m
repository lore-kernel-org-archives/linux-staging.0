Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 652FC3B8BD0;
	Wed, 18 Mar 2026 15:54:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773849269; cv=none; b=m1TClmzj49Fkmw1DNvSrdlEeAJ+i4O3H4Z0s9jGaV/sVsbGP9c1pchcO0XV6B96ZkLQwUsZdNtva8kndGjzL7UmujEU+53SJ2r9yEKPdXThMSQkSZ9KT8JCQb4SFcM+zcoD/Z2NslWdq6WMJPMeSbPbhbgJ84G3zz0L4C4g4j54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773849269; c=relaxed/simple;
	bh=lOoEbh7sF2+uLAyFdNr+Lz1RjAuJzrT0hgb/jm9UH3o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TpsQ0Rg/6JbHLfKVTHf+eiTYNTJveFnUd4BBGgVS3yVMazlStcuLY7zEWndpNScbbsznkPQ24bwRcKKh6D++kZxnIA6vmpenpvo3hfTQZSi+76cDZBlgnOqZDdSMtKWnkT+pzNMIa4XPIdZ7IkbNtN1F6no0k0gRLRdyxDDz9FI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=A8JvALfS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="A8JvALfS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 589C4C2BC87;
	Wed, 18 Mar 2026 15:54:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1773849268;
	bh=lOoEbh7sF2+uLAyFdNr+Lz1RjAuJzrT0hgb/jm9UH3o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=A8JvALfSs4r881uath/3MubuBryeJCUORVoVNJgJB+oSGBlwEvObbQrfgSYGrFeVe
	 1l3iXdmlnIqZwXk3htrKpJESEAFomBBLCRdY2U3focGhKV51IOEZEywkBj6trfKdV8
	 iuuZkidUF3a8Y3mBbfanR9Q7rfwF7Lx1uYZBfnkM=
Date: Wed, 18 Mar 2026 16:54:19 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Marco Antonio Solis Segura <mshdevv@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: collapse duplicate goto exit
 conditions
Message-ID: <2026031855-spoon-uncrown-4090@gregkh>
References: <20260317135548.239746-1-mshdevv@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260317135548.239746-1-mshdevv@gmail.com>

On Tue, Mar 17, 2026 at 07:55:48AM -0600, Marco Antonio Solis Segura wrote:
> Combine _FAIL and RTW_RX_HANDLED cases into a single conditional,
> removing redundant branches and simplifying control flow.
> No functional changes intended.
> 
> Signed-off-by: Marco Antonio Solis Segura <mshdevv@gmail.com>
> ---
>  drivers/staging/rtl8723bs/core/rtw_recv.c | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_recv.c b/drivers/staging/rtl8723bs/core/rtw_recv.c
> index 337671b1211f..20f5f8760ba0 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_recv.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_recv.c
> @@ -1339,12 +1339,8 @@ static signed int validate_recv_data_frame(struct adapter *adapter, union recv_f
>  
>  	}
>  
> -	if (ret == _FAIL) {
> +	if (ret == _FAIL || ret == RTW_RX_HANDLED)
>  		goto exit;
> -	} else if (ret == RTW_RX_HANDLED) {
> -		goto exit;
> -	}
> -
>  
>  	if (!psta) {
>  		ret = _FAIL;
> -- 
> 2.53.0
> 
> 

Someone sent this _right_ before you did:
	https://lore.kernel.org/r/20260317100723.72476-1-giacomodiclerico@gmail.com

Are you all working on this together?  What project is asking you to
send patches for this driver?

thanks,

greg k-h
