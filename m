Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD38B157E82
	for <linux-staging@lists.linux.dev>; Wed, 28 Aug 2024 18:48:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724870926; cv=none; b=UI1kp/IZSbHyJGk/LGfq7dARIGnXN6k2fz1Mwsph05Pa0uZu+xNE7juqk+J3kZ/neFnsnRKvwmqwptbFV2g05OHHBGvrYAi7o+Xh2KLu2NG38xxTH05lvZDeL6dMowp24Ku5hOofj6s//g8/8R/omtp4eVvroH6q5XEPIXM8Lh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724870926; c=relaxed/simple;
	bh=HfCYTyNwdb960/65HKXK1EAtTw5j0DpXyGeouZxsvdA=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=SrIgUQIzcmxiUL6cepWq2YcG4trG76sBFDD6vfMJgibKHsW8fEARPtaCqIjfCEWxMUwQ0mcBxLtGVvxmqN0mEARXxC5yZDNJh7moJZj0/z84vEZ2PcdcaxnlENsEo3lMvRFHJuE3UFzzuCCyJCbc4pa5Yz5qzHue65lVcjfEfrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nPxUJQEw; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nPxUJQEw"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a8696e9bd24so777031266b.0
        for <linux-staging@lists.linux.dev>; Wed, 28 Aug 2024 11:48:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724870923; x=1725475723; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Y4TuKTqviBGFP4ZDF4tveGym+O+ci2sBrO3pKcTbinI=;
        b=nPxUJQEwOwhgNePw5OSz7pkISzo7lpXh3jZ8G532yPnGeH6Le8/RZvdJHnwUrdSYue
         ymwic0aNb1LRdCRdQOZv45UfEl3RwfoWTThEhLJuW7F+fQ5zG2pUBMDaEjnQf3yQ666c
         UwlRaEIPC2KMB806Gzjd6RlrDJWEMRGH2FClG33ZUhAscfTBmV0DsQK9UECUXw3DXUrv
         Q5J8Rd3b/CQZNqPiuWw5pXJXJgyOnJ/XHai0k7n3ci3+0hnIxeLkdyrfegfEabZ36czN
         b3UUck3q9VZ1yoy3iBxtoLilP88TAUtDxiLBCdjN3D9mSv1PF1+K3IX2Un4lAW7zGEV5
         Qu/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724870923; x=1725475723;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Y4TuKTqviBGFP4ZDF4tveGym+O+ci2sBrO3pKcTbinI=;
        b=q5A0EQB2mqSzRqmB3tuLy/dbrqgG/Ux+3strZn2UccNBPB7yJJ84edgcK844ieohPb
         kXhAoVs4THimOo49g8XkpDGrxTvc3Sl3y+MyPLg/QtVhmDe5vqj6TLP+G5tCXZVl+Dmh
         m2Y5vCf/L7g+LwJiDLuAH8JLxNSK+NMK3FAePLi7qQ0Ar/ZFH0nzVfWhfKKUllSiUToF
         3pUh+ERfQyNLXx1LPMw+NjbrkizyFy+JfPT3DrvrAOrAMMcqOjP1kBfbcT4P98GJkroy
         A/Xe4/mauMDuD7FKq82tA48ir20LpI9KRUogwQDJz8EF57e2AxN4TCJUh0X1QE68LaRe
         9qyQ==
X-Forwarded-Encrypted: i=1; AJvYcCVCDszti3el1zkrmgNuGuYEs40Z5ty4XOI9GF3fsCZ81hJ7iz3GrnI/5RJmzmgNQtpeGlAs/w36NqyiDxeU@lists.linux.dev
X-Gm-Message-State: AOJu0YyZ8vhNRTq7hnWFmsw2um2TgMsp+emz8GvvFBAQUeLulOaDyMxN
	k1ccdoDhztJ/a7j507j1kNPykRMay5JUIeEnw4JznGCJ4oJ7PcAY
X-Google-Smtp-Source: AGHT+IHXgURMRyqoUm9rXVpjQa5L4iWj1GJFbNm9sxmB/L4X4vYfdMRudEJqs1hy89hYWUPWSGMZ0g==
X-Received: by 2002:a17:907:9729:b0:a7a:a0c2:8be9 with SMTP id a640c23a62f3a-a897f84d369mr31594966b.18.1724870922886;
        Wed, 28 Aug 2024 11:48:42 -0700 (PDT)
Received: from ?IPV6:2003:c7:8f2a:8553:4dd4:7649:c4c2:f4e3? (p200300c78f2a85534dd47649c4c2f4e3.dip0.t-ipconnect.de. [2003:c7:8f2a:8553:4dd4:7649:c4c2:f4e3])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a86e594d041sm273783966b.213.2024.08.28.11.48.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Aug 2024 11:48:42 -0700 (PDT)
Message-ID: <9c1ab010-1436-4c54-9fa5-418472a9427f@gmail.com>
Date: Wed, 28 Aug 2024 20:48:42 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] staging: rtl8712: Align parenthesis in usb_ops_linux.c
To: Dorine Tipo <dorine.a.tipo@gmail.com>,
 Florian Schilhabel <florian.c.schilhabel@googlemail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20240828082935.GA3815@ubuntu-focal>
Content-Language: en-US
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20240828082935.GA3815@ubuntu-focal>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/28/24 10:29, Dorine Tipo wrote:
> Fix the parenthesis alignment in r8712_read_port() function to match
> the opening parenthesis.
> This improves code readability and adheres to the kernel coding style.
> 
> Signed-off-by: Dorine Tipo <dorine.a.tipo@gmail.com>
> ---
> Changelog:
> V2: Edited the subject line to fix a typo and make it more unique as
>      suggested by Philipp.
>      Edited the description to include the reason for the change.
> 
>   drivers/staging/rtl8712/usb_ops_linux.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/rtl8712/usb_ops_linux.c b/drivers/staging/rtl8712/usb_ops_linux.c
> index 0a3451cdc8a1..4a34824830e3 100644
> --- a/drivers/staging/rtl8712/usb_ops_linux.c
> +++ b/drivers/staging/rtl8712/usb_ops_linux.c
> @@ -221,7 +221,7 @@ static void r8712_usb_read_port_complete(struct urb *purb)
>   			fallthrough;
>   		case -EPROTO:
>   			r8712_read_port(padapter, precvpriv->ff_hwaddr, 0,
> -				  (unsigned char *)precvbuf);
> +					(unsigned char *)precvbuf);
>   			break;
>   		case -EINPROGRESS:
>   			netdev_err(padapter->pnetdev, "ERROR: URB IS IN PROGRESS!\n");
> --
> 2.25.1
> 


Tested-by: Philipp Hortmann <philipp.g.hortmann@gmail.com> AW-NU120
