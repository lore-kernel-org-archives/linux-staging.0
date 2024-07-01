Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90E8E6FE16;
	Mon,  1 Jul 2024 19:31:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719862280; cv=none; b=eLVPP7bDBIqkZtHdfkmFfcv+0mCVTfFiFpHqP2ZlNEqsiT0Nv3+UfRpAmVslB8n9IrzFISdHEfzIfxAA7gF5JoPqgFCCdDX2q9ZrO1oWA2wjvPF0DL3+yPEe1D9vDZnDuSkla2iPCY/MgpGlnD1FD7n2adhQmH2rNNyZNjR83Zw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719862280; c=relaxed/simple;
	bh=7uK56noa9OT7NT7AiKzpcK8+8gv6waaOJ9178RHutXM=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=hNBh3RyusbVzkneC0pKiXNvbaeS4yFYE7jhkXAflHMvRzDKsWxEUvyqNV0SFBL4OR34rvS6zmrrBpypcBzLtRpnE3OK/bHZjAkiLtCfBdGv7FYEV2kDz0kr9Uz8jaLIrxPn3tRgiG9jQl3mX+JyTajOwHIpVztfFbFL/gB7VTRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kOHjqv0g; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kOHjqv0g"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-57d0ea30e87so89189a12.1;
        Mon, 01 Jul 2024 12:31:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719862277; x=1720467077; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=D0HZlK8nHwoje+lWDsShpqSJVC51ECArGsANp8ntoAw=;
        b=kOHjqv0gLp+BKdOFh/qNFte/rGwSHasMICSEovNIADUIhicz5ywsL5VgMCdbi5yU29
         o1JBn7+SsWX8hfYc2IvPEo3IhgyOmL4RFFY/pLBfd61G5r30UbdLjL44mqV7P7hCH7LH
         JerLtT0bN230BEZ3KOe9feR/WB95H88WT+zPeu2UdQuNMfFH/dnkRGrRWk6/PPnLdkJv
         +/JZiy4iDYY9O8WSxJVOL5DhthpwEm2ShQ0jJpvirWQFwZISGPRuMH9BGuz98c/CnHxy
         ZsY3ypMzezQrSEj0W4UI6zBs5wR6Sf0KSMFC/Mkq2WD5WcSkrjBBIlmEAVjpZxxzRKnh
         Rzmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719862277; x=1720467077;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=D0HZlK8nHwoje+lWDsShpqSJVC51ECArGsANp8ntoAw=;
        b=Pk01K9Q3Igj2SHT9hJuaGPRFaUioaOBn59YfrNuZ8rpWhAm9B5MyDCmOlYgqh8hUGG
         iMvt4t1d/nd2WT8VKZDDL+/3OQKTs/lO46jQdhyaXjjUdXOsLuiNdb+eJUONsTbPOkG9
         BF9c1H/Y/2lNEam0w5H7RiCeV7nYtpllC4YxbJEagedd7p9HEWxl37aNXldn//Mbirzr
         2rd1iohSYDcYNN0IvhUwTi5H9ZOxXoKChuQwAaufGIFo7UqCwn5Ymxk+CUcp6vspKUXV
         relRb6vYWMfrJhJG9nAHlntFFp7F9fCDAY8HkXeq9y2ChLc4ruDUvFXmSLchb9yq0SbQ
         3GKw==
X-Forwarded-Encrypted: i=1; AJvYcCVKYue++iBZZW9AiJKOBVQrOPYcYEifsaW0W4QKXgQEZav8xHWEp+lgzVze6bLWVu9xcGkMMSNyl3Y24C+MzFdxVyTw6qXJsVKBGivfNkwRrCuigYWVboNY6le70c4qShgVgmMvzVi2nA==
X-Gm-Message-State: AOJu0YxVd/ghF5oTMyZcqIvggD64kGTiZ1DOL+42CVVTYhJZ9L1pUl2p
	GE71wPMM0kw9F6cSZsz3ea+rp+93H0hx4D+TLmU8RfFZX+fHkYIu
X-Google-Smtp-Source: AGHT+IEtOTFhO5s/ESTanETwKJvhOIab0I4p7PgSG6Bi6jKBUgeYqvdk9TOJBWlSN/5+j6oA7dtTMg==
X-Received: by 2002:a50:c356:0:b0:57c:bc7f:fb51 with SMTP id 4fb4d7f45d1cf-587a0b030abmr4269936a12.2.1719862276901;
        Mon, 01 Jul 2024 12:31:16 -0700 (PDT)
Received: from [192.168.0.103] (p57ba2f9b.dip0.t-ipconnect.de. [87.186.47.155])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-58612c835c4sm4730177a12.11.2024.07.01.12.31.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Jul 2024 12:31:16 -0700 (PDT)
Message-ID: <cbd7ead7-bfe9-40d1-ae9d-053388384356@gmail.com>
Date: Mon, 1 Jul 2024 21:31:15 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] staging: nvec: Use x instead of x != NULL to improve
 readability.
To: Tom Mounet <tommounet@gmail.com>, Marc Dietrich <marvin24@gmx.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, ac100@lists.launchpad.net,
 linux-tegra@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, outreachy@lists.linux.dev
References: <66804898.5d0a0220.6df0f.4f0a@mx.google.com>
Content-Language: en-US
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <66804898.5d0a0220.6df0f.4f0a@mx.google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/29/24 19:47, Tom Mounet wrote:
> Use x instead of x != NULL to improve readability.
> Issue identified by checkpatch.
> 
> Signed-off-by: Tom Mounet <tommounet@gmail.com>
> ---
> v3: Add change history and proper description
> v2: Make commit title clearer
> 
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

Reviewed-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
