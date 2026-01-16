Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9D7418872A;
	Fri, 16 Jan 2026 13:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768569262; cv=none; b=Ihf4BXAavJgZuK3ofSsw+6/vA9t5GJkK5FskiXBsD3k2FYIaFLAOqXMVF3eG86GDIh4NbdlwQ5fyfItAWsL5SGEIbP+Vp9ol73KPJ+Z2vOXrYDG8ugQmrs8yp5ve32yT5/Oi6MlU3tPQTHs2jwBJHnUDqlQ+o57ZOlguoB260Hk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768569262; c=relaxed/simple;
	bh=eF/QW/zKwdUz/4V41BgYsfOQpFGtyg5u4aC062wtqpA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lBaJDbNKTjnRhcpV0owpdiG+ro6JKXZOs3JP7vPdBCEefGJJtWEWrEHFooayQEGtEF5qgbgImJ1EVjdYVM1dAVKACHpHPWNfQT5ZAsEsyoSdvs0VPb3ucMDhMtU5Wa5GMpbQW+HH1GP9xpsTvSyxlT25GGq8mho0B1UoundynWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=l8ht1jqU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="l8ht1jqU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CA43C116C6;
	Fri, 16 Jan 2026 13:14:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1768569262;
	bh=eF/QW/zKwdUz/4V41BgYsfOQpFGtyg5u4aC062wtqpA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=l8ht1jqUjlHAuHnk2ZsYHXGUhtPw4Dl3wWdN/YGxLzQ1XbjjxOrwQa8GfI+svXNFX
	 bezPzJfwIad8J13bT4ebfXSGojx7+0fkGYCpRw5LjfPqP02dKR8zHPOJ8B5keTM/Pq
	 SCaz2XpyPth4vWyk4KBUc5tGfS2EwfodJakVUG9A=
Date: Fri, 16 Jan 2026 14:14:20 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Khushal Chitturi <khushalchitturi@gmail.com>
Cc: dan.carpenter@linaro.org, straube.linux@gmail.com, hansg@kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 4/4] staging: rtl8723bs: fix line length and alignment
 issues
Message-ID: <2026011640-smudgy-kleenex-afb1@gregkh>
References: <20260116053052.4198-1-khushalchitturi@gmail.com>
 <20260116053052.4198-5-khushalchitturi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260116053052.4198-5-khushalchitturi@gmail.com>

On Fri, Jan 16, 2026 at 11:00:52AM +0530, Khushal Chitturi wrote:
>  	/*  (1) RTS_Threshold is compared to the MPDU, not MSDU. */
> -	/*  (2) If there are more than one frag in  this MSDU, only the first frag uses protection frame. */
> +	/*  (2) If there are more than one frag in this MSDU,
> +	 *  only the first frag uses protection frame.
> +	 */

Break a sentance on the line length, not the ',' character.

Otherwise, you get odd looking lines like this one:

> @@ -656,7 +672,9 @@ static s32 update_attrib(struct adapter *padapter, struct sk_buff *pkt, struct p
>  	pattrib->pktlen = pktfile.pkt_len;
>  
>  	if (pattrib->ether_type == ETH_P_IP) {
> -		/*  The following is for DHCP and ARP packet, we use cck1M to tx these packets and let LPS awake some time */
> +		/*  The following is for DHCP and ARP packet,
> +		 *  we use cck1M to tx these packets and let LPS awake some time
> +		 */

Thanks,

greg k-h
