Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F33EA254841;
	Sat,  7 Feb 2026 13:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770471632; cv=none; b=j14mrtMhw4SRiwh2JktgtnpEbnA9kSqoq8ptj+vmKM9w1IJMJzvv/7tizOCyJLf3woijOGbGhO51z6FM6SSAjkxkjhZT4B9oU9xhYYa4Qjuc0ElM+WFW88Kz4S63skPk6QNMWzkxktzmK2ErXJznz4MPwePm+4JYjT9KnYrJG/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770471632; c=relaxed/simple;
	bh=cb20KMwd+VBZ7PXWISHxfaaBm7gHfek/TURLJfYzd1Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SYcfqkJEv2+I0SoktG4j82GzgKVJ1eI5AUHSHFYiEr50SpRjis7XPU84m3Z79XNuzEH7ZeaiUYSP3nHIu9GcQwbLGMNnKFyjcSTif6cw/KYbcmx75DHQ/AhEuvzzmjx2EQRJVh0nwaWIVLWKbiWwvUNPF2twgHHP6qYmJakAQJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=phPRifdt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="phPRifdt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E2F4C116D0;
	Sat,  7 Feb 2026 13:40:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1770471631;
	bh=cb20KMwd+VBZ7PXWISHxfaaBm7gHfek/TURLJfYzd1Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=phPRifdt36eWYB28fnzfh1OA8NJPrMVovy3oW4L+HgOjbeTuvMEu5+AvVhdyQXF1I
	 OehgpJ933HXUgtOOoCKxiI//04nMN/8lwFHAf+u3tz1Q7NF5N1jH8D9f9S3mvzkScd
	 v3M39KMQ/a7orqEDrB/JKImt9uKPgFSexpdBTU3c=
Date: Sat, 7 Feb 2026 14:40:27 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Haroen Tmimi <tmimiharoen@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: rtl8723bs: constify _action_public_str in
 rtw_ieee80211.c
Message-ID: <2026020752-extortion-coleslaw-9687@gregkh>
References: <20260205120909.161336-1-tmimiharoen@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260205120909.161336-1-tmimiharoen@gmail.com>

On Thu, Feb 05, 2026 at 01:09:09PM +0100, Haroen Tmimi wrote:
> Make the _action_public_str array "static const char * const".
> 
> This ensures the array entries are read-only, preventing accidental
> modification of the pointers.
> 
> Signed-off-by: Haroen Tmimi <tmimiharoen@gmail.com>
> ---
>  drivers/staging/rtl8723bs/core/rtw_ieee80211.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_ieee80211.c b/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
> index 92b12a13d27c..febc14de6bc0 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
> @@ -1139,7 +1139,7 @@ int rtw_action_frame_parse(const u8 *frame, u32 frame_len, u8 *category, u8 *act
>  	return true;
>  }
>  
> -static const char *_action_public_str[] = {
> +static const char * const _action_public_str[] = {
>  	"ACT_PUB_BSSCOEXIST",
>  	"ACT_PUB_DSE_ENABLE",
>  	"ACT_PUB_DSE_DEENABLE",
> -- 
> 2.53.0
> 
> 

Someone already sent this same change before you did, sorry.

Why all of the same fixes for the same driver are happening at once?
Did a class just happen that encouraged people to make these types of
changes to the driver?

thanks,

greg k-h
