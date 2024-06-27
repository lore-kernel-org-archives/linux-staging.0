Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AFD718C3B;
	Thu, 27 Jun 2024 05:01:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719464519; cv=none; b=inRlMXysvvA4ynDoSNqvNpssS5d4U2vFayzf1XeZAgJcLErbOQI6frX+ssAT5uwrKtAz3Hio6wSB4k5xkzUBCKR86G5NGSouemId+1dm8iO5fT17Yz1Po8/4RmK1MtB95T1OMkHUmaZNnLr0CC9CrbeGe7LHssx7vdoFSjyqL+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719464519; c=relaxed/simple;
	bh=neSvzffn7aVOZHHBR80gHa/jIr/IAwkAvGDm0NDaxHM=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=mNQnLLMhEwJ2pc1szxPaL7zYx3ZUCXYkSOyg4vrYunpd4mDApoo+72Ye8fpamA6eeoNwJNhDIqI2ooASsh0F3Bi4y44xkHwTZxNVPZWsv0Q2BjKfTRnfDASFt5VNDfdA+p6FFFvoH+YizIkLOI7EG67Ld7oFb9SGuMEDgFQ/3p0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ufj+DBqz; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ufj+DBqz"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2ec5de1e328so5846211fa.0;
        Wed, 26 Jun 2024 22:01:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719464515; x=1720069315; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UXx9V3mIBIPJ0R/DpHVeLVStS2HGhaz/07TcRzXhw+0=;
        b=Ufj+DBqzmYhYkcaWgiVpLItD8Ox0AuwKoXxYKSOX9CE6kSHgMiS3vsWwYbyFu4f/bE
         HHplIuQL0bTa7ar+iuAdoNYzM+OJT7819XfXL09mm7NHGZPIE+RPPEVSizRWJVTDBbFb
         o1x/08BS6qgoszf+mbL9Y5GxYnE9N0Wsz5+9IWgD3VN1jnECHpn5Xh7/ANacnf6UJyo9
         u7Bm7LP5RjTBae6W2w0C2Cqcfn9aUwuCSdFOzYJB7TaBLPu3Uk56rzCigQLaFdKaM3HE
         QVQLHst3CAtba/YW08bx6fjVSNErdYNIaWZNsOFqsKn/+e7m7syyWuk9W7xF0y6aBZOW
         5wsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719464515; x=1720069315;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UXx9V3mIBIPJ0R/DpHVeLVStS2HGhaz/07TcRzXhw+0=;
        b=v8c3GR6NpwBH8a2ugHGLS2gCnZGZSKj6Witmtmz4mYeeJSnrbLSWAIQszy82GQJKlY
         8LmTtgjVLM42QW/V39BXFgLjIt0f/XAFkrMxC614d3CplhaQPrO6vHCOLucBGiNBrx1I
         mzKADUI3BjRwkQ1K2v4qoGfOP9KTIiLfhTtUJ3qMI0rWV+iyUm0FsDfjhYs+DWuNI6Zi
         ndi3+RWUW4ZrwNp9grqWeXO6AroJFxYbfYVnqHefexh2Rs1xQLCmPyg0Xor5FnYjIecz
         tn6E5W+uzF9lThZugcxxsHUdU5aZMb8hrk5wbK/lfZUuxJ25IPWfixqgiUOV05StuSLO
         azjg==
X-Forwarded-Encrypted: i=1; AJvYcCWllDpk3femz396d3JMn/Ew+MaejtE9x/Qbf86jS8SBRbWOraSzzRJXhM/4lfpJ4aPgcZ8mWwVCRC6g9Abhf56laXOV5xo8NFzf1TdSNR/GhI10cJjtP0C+uocRWjc7n4SwYNcml/Vnyg==
X-Gm-Message-State: AOJu0Yzt0IuI43ZAa+QE6vSn7hXLeNY+5Z9K+jX7r3xZoRjOuoyKXT3U
	lu0D07T6BWY61TaQATsu9ikO5R7jsAHsg8g00bYzUwx8nsVyV4a/cUShbA==
X-Google-Smtp-Source: AGHT+IGRWcJ+EBLHzrnk9cuOes9LkkVCvSwVRl6Ra+CZF/cW8kdVhXyyFt+q8ZeDUjuJjF4rRVvGyQ==
X-Received: by 2002:a05:651c:1986:b0:2ec:5365:34d3 with SMTP id 38308e7fff4ca-2ec560e8d60mr110765591fa.1.1719464512392;
        Wed, 26 Jun 2024 22:01:52 -0700 (PDT)
Received: from [192.168.0.103] (p57935a9b.dip0.t-ipconnect.de. [87.147.90.155])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-424c8469016sm46971025e9.41.2024.06.26.22.01.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Jun 2024 22:01:52 -0700 (PDT)
Message-ID: <3d8b92c4-9562-473a-be47-26785d621cc3@gmail.com>
Date: Thu, 27 Jun 2024 07:01:51 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] staging: nvec: Use x instead of x != NULL to improve
 readability.
To: Tom Mounet <tommounet@gmail.com>, Marc Dietrich <marvin24@gmx.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, ac100@lists.launchpad.net,
 linux-tegra@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, outreachy@lists.linux.dev
References: <667c8a0c.050a0220.9e3d5.3b80@mx.google.com>
Content-Language: en-US
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <667c8a0c.050a0220.9e3d5.3b80@mx.google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/26/24 23:37, Tom Mounet wrote:
> Issue identified by checkpatch.
> 
> Signed-off-by: Tom Mounet <tommounet@gmail.com>
> ---
>   drivers/staging/nvec/nvec.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/nvec/nvec.c b/drivers/staging/nvec/nvec.c
> index e5ca78e57..814eb121c 100644
> --- a/drivers/staging/nvec/nvec.c
> +++ b/drivers/staging/nvec/nvec.c
> @@ -300,7 +300,7 @@ int nvec_write_sync(struct nvec_chip *nvec,
>   {
>   	mutex_lock(&nvec->sync_write_mutex);
>   
> -	if (msg != NULL)
> +	if (msg)
>   		*msg = NULL;
>   
>   	nvec->sync_write_pending = (data[1] << 8) + data[0];
> @@ -322,7 +322,7 @@ int nvec_write_sync(struct nvec_chip *nvec,
>   
>   	dev_dbg(nvec->dev, "nvec_sync_write: pong!\n");
>   
> -	if (msg != NULL)
> +	if (msg)
>   		*msg = nvec->last_sync_msg;
>   	else
>   		nvec_msg_free(nvec, nvec->last_sync_msg);

Hi Tom,

please answer the why also in the description.

The change history is missing.

If you send in a third version of this patch please use a change 
history. Description from Dan under:
https://staticthinking.wordpress.com/2022/07/27/how-to-send-a-v2-patch/

Thanks for your support.

Bye Philipp
