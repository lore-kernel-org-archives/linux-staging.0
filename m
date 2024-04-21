Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 639218F44
	for <linux-staging@lists.linux.dev>; Sun, 21 Apr 2024 08:55:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713689726; cv=none; b=UUyTM8XJwT3JACAxfziU1r3MaRLVlPdEyee0RZ1lTqCcUwNMztYcFTm6D1gKVJ2XRo/BqnBnXsIG4TXuVfsCzUk9ADcB0uvGt+KHiBwjIK5mCYKcpKjFlJJfFUnrse/aHcBDduWWUkb/ebh3VlWKRz4368YInCO5pz5taCCWS7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713689726; c=relaxed/simple;
	bh=tFioUuIFbA7UCBZR/QGn4/+QUyOOUlYj7UafoEQO1/U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=C1po8JN3WXmcbemMeaohgwZXSyItYJOzfKAn91B9VDSA1sA+SsWofb81B51zmdnZLRJwdZH7VaJqnZbs/mffbIqLVcgk8cCKxfHdqFFb7Zt/TnHR/ygFz2Id+23p9k2WwnIbdsixY57ua1lXB8JCtnjMNSki2pavVrPqGAbNTiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=jT0P7u1Z; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="jT0P7u1Z"
Received: from [192.168.1.105] (unknown [103.251.226.10])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0F2CF674;
	Sun, 21 Apr 2024 10:54:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1713689674;
	bh=tFioUuIFbA7UCBZR/QGn4/+QUyOOUlYj7UafoEQO1/U=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=jT0P7u1Z+P16YMTKOA2fr/fLWeJmWoGmhilOThuMX2g2/T7cIX90hJ6YCDkS02Cpt
	 +5IUt1Z5hgLpTiplDbM8z9dQZvREBV9E2bygbU50VNOkXJvOpMqo8MYNH+4jxn9xHi
	 gfvAdwNNFqjHZslEDgoovBla0sMfndoxGOlxbeSs=
Message-ID: <16ca5177-d899-4d09-b601-1b553ce4b791@ideasonboard.com>
Date: Sun, 21 Apr 2024 14:25:20 +0530
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] staging: vchiq_core: Drop unnecessary blank lines
Content-Language: en-US
To: Stefan Wahren <wahrenst@gmx.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org
References: <20240420115351.27713-1-wahrenst@gmx.net>
 <20240420115351.27713-4-wahrenst@gmx.net>
From: Umang Jain <umang.jain@ideasonboard.com>
In-Reply-To: <20240420115351.27713-4-wahrenst@gmx.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Stefan,

Thank you for the patch

On 20/04/24 5:23 pm, Stefan Wahren wrote:
> chechpatch.pl noticed

s/chechpatch.pl/checkpatch.pl
>
> CHECK: Please don't use multiple blank lines
>
> So drop them.
>
> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>

Reviewed-by: Umang Jain <umang.jain@ideasonboard.com>

> ---
>   drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c | 2 --
>   1 file changed, 2 deletions(-)
>
> diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
> index 58451ee08abc..ca32902afe06 100644
> --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
> +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
> @@ -1190,7 +1190,6 @@ queue_message_sync(struct vchiq_state *state, struct vchiq_service *service,
>   	header->size = size;
>   	header->msgid = msgid;
>
> -
>   	svc_fourcc = service ? service->base.fourcc
>   			     : VCHIQ_MAKE_FOURCC('?', '?', '?', '?');
>
> @@ -1616,7 +1615,6 @@ parse_message(struct vchiq_state *state, struct vchiq_header *header)
>   		break;
>   	}
>
> -
>   	svc_fourcc = service ? service->base.fourcc
>   			     : VCHIQ_MAKE_FOURCC('?', '?', '?', '?');
>
> --
> 2.34.1
>

