Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEC4B3D72;
	Wed, 25 Oct 2023 08:36:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="bFfrL/Hy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12873C433C8;
	Wed, 25 Oct 2023 08:36:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1698222962;
	bh=si9OwoiRDCrwmlLRHF1A0I4dheXTblVO8M+4OLnZXWI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bFfrL/Hy7oEcDcin0G97ftXv0NhJH9lS5X7Bu3+9JEY0SzOfRWXEi+Xu8t92uLQW+
	 m2o5veK1P1kZiZeOSYpkOI7wyvzFqpUaD33d2ty0lvFx6K5wS84kvtN3CfkWt3qPTL
	 zxde4OubbuKgg0GCB5m5CIMX4KZVqhWUq1DeGbZc=
Date: Wed, 25 Oct 2023 10:35:59 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Calvince Otieno <calvncce@gmail.com>
Cc: gustavo@embeddedor.com, outreachy@lists.linux.dev,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.or,
	Julia Lawall <julia.lawall@inria.fr>, Deepak <dvarma04@hotmail.com>
Subject: Re: [PATCH] staging: wlan-ng: prism2mgmt.c: rewrite flexible array
 member
Message-ID: <2023102502-decipher-startle-5115@gregkh>
References: <ZTjRWkqXeoS74E52@lab-ubuntu>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZTjRWkqXeoS74E52@lab-ubuntu>

On Wed, Oct 25, 2023 at 11:27:06AM +0300, Calvince Otieno wrote:
> Declaring zero-length arrays is allowed in GNU C as an extension.
> Although the size of a zero-length array is zero, an array member of
> this kind may increase the size of the enclosing type as a result of
> tail padding. The offset of a zero-length array member from the beginning
> of the enclosing structure is the same as the offset of an array with one
> or more elements of the same type. The alignment of a zero-length array is
> the same as the alignment of its elements.
> 
> Declaring zero-length arrays in other contexts, including as interior
> members of structure objects or as non-member objects, is discouraged.
> Accessing elements of zero-length arrays declared in such contexts is
> undefined and may be diagnosed.
> 
> There are some instances of code in which the sizeof operator is being
> incorrectly/erroneously applied to zero-length arrays and the result
> is zero. Such instances may be hiding some bugs.
> 
> This issue was found with the help of Coccinelle.
> 
> [1] https://gcc.gnu.org/onlinedocs/gcc/Zero-Length.html
> 
> Signed-off-by: Calvince Otieno <calvncce@gmail.com>
> ---
>  drivers/staging/wlan-ng/p80211metastruct.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/wlan-ng/p80211metastruct.h b/drivers/staging/wlan-ng/p80211metastruct.h
> index a52217c9b953..c8b73c867391 100644
> --- a/drivers/staging/wlan-ng/p80211metastruct.h
> +++ b/drivers/staging/wlan-ng/p80211metastruct.h
> @@ -71,7 +71,6 @@ struct p80211msg_dot11req_scan_results {
>  	struct p80211item_uint32 signal;
>  	struct p80211item_uint32 noise;
>  	struct p80211item_pstr6 bssid;
> -	u8 pad_3C[1];

But this is not a flexible or 0 length array at all.  Why change this?

And are you sure you are allowed to change this?  Did you verify where
this structure is being used and how it is being used and why this
padding field is in here?

And how was this tested?

thanks,

greg k-h
