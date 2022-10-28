Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3D382563;
	Fri, 28 Oct 2022 14:03:29 +0000 (UTC)
Received: by mail-lj1-f178.google.com with SMTP id u2so8506731ljl.3;
        Fri, 28 Oct 2022 07:03:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tJs9/ylITivpEH1zK/iAiHT0oINqbTDSjSRxLxJdcQw=;
        b=Pu0ACCUhlEwq57fIuR45XKIffhHuGtFwRY3kjjOiQri3BIIoAHZxvVzQv1LvYsWzlj
         JbfRSf876t2kARp2YzW6SHv5+Hv8F0Ahb4bMqpQa02H0Id2xa6MdsgfoxwLmsrF2PhSR
         kA9bcxCbG49WW9qSx0LYHnblj5MZmVmaKaEAAilUP2mMsQZ7TBQeBYqFZs4uA0Ano2CZ
         uB65+nByzfvk5EcUHC4FlZPyT7hNbDdzpfIrfRNVvP8mN3yq6PC4Yk2ZHrtN5ofB4VLg
         jwIx75KHBuL/z3/EIimjaqehiC0g8eNH66POMt1jUd6wwMh29i4fKkcdvgbGVYUiQPed
         hNJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tJs9/ylITivpEH1zK/iAiHT0oINqbTDSjSRxLxJdcQw=;
        b=Ep2Ie1/cvX5MN+8nU82xl4s/nAOfaAC5W2x6lePSncMpOOyOwPPBnGFpvLUQF2n+7v
         bgVg0n4ODMmEFE/YrmOphA/u953kN9R+xIG+U0j06FQTBNYchTcW9/gURt03Q3Uh0Lpj
         H7JPc0uqLBtDXI3tNGKU7k0ySEZmNmOYh3aMkYCYcUdAoKyYLG/8x5MmzkHO2KRYp8QL
         wOTFhA9SlKuejXy8uxe6jfRMWYG0BhcfiaFoszrMyvms+drURY+NqEY0cM5puyZT6r4V
         iIa2XFc4E49hrcU74faY0iYOTr+yAfHgE/wtjY7jB5UNu464+0rSIUahqjlnzdVmrXK5
         eY9Q==
X-Gm-Message-State: ACrzQf3Gc1lwknrtYp6lBBcwlrzKh/0JeXDbXW3RtmQUER6digNvsgpr
	4bNFnj3xbS5br4tfmH1aacI=
X-Google-Smtp-Source: AMsMyM7XaoXvu5ZCen9f8QZ6699xYWIRVpbsXgv0d/Na6IjNonVqHqkrFSItkuSBhDQZNcYdAqOSww==
X-Received: by 2002:a2e:b8ca:0:b0:26f:ebb8:79d6 with SMTP id s10-20020a2eb8ca000000b0026febb879d6mr19844395ljp.331.1666965807471;
        Fri, 28 Oct 2022 07:03:27 -0700 (PDT)
Received: from [192.168.0.252] ([94.103.229.28])
        by smtp.gmail.com with ESMTPSA id b14-20020a056512070e00b0049876c1bb24sm574561lfs.225.2022.10.28.07.03.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Oct 2022 07:03:27 -0700 (PDT)
Message-ID: <642519a2-664d-d837-983a-1d5bbc72a25e@gmail.com>
Date: Fri, 28 Oct 2022 17:03:25 +0300
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH] staging: r8188eu: Use flexible-array for one length array
 member
Content-Language: en-US
To: Deepak R Varma <drv@mailo.com>, outreachy@lists.linux.dev,
 Larry Finger <Larry.Finger@lwfinger.net>,
 Phillip Potter <phil@philpotter.co.uk>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <Y1vRivFfRD6VoBt/@ubunlion>
From: Pavel Skripkin <paskripkin@gmail.com>
In-Reply-To: <Y1vRivFfRD6VoBt/@ubunlion>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Deepak R,

Deepak R Varma <drv@mailo.com> says:
> Flexible-array member should be used instead of one or zero member to
> meet the need for having a dynamically sized trailing elements in a
> structure. Refer to links [1] and [2] for detailed guidance on this
> suggestion.
> 
> [1] https://en.wikipedia.org/wiki/Flexible_array_member
> [2] https://www.kernel.org/doc/html/v5.16/process/deprecated.html#zero-length-and-one-element-arrays
> 
> Issue identified using coccicheck.
> 
> Signed-off-by: Deepak R Varma <drv@mailo.com>
> ---
>   drivers/staging/r8188eu/include/odm.h         | 2 +-
>   drivers/staging/r8188eu/include/wlan_bssdef.h | 6 +++---
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/staging/r8188eu/include/odm.h b/drivers/staging/r8188eu/include/odm.h
> index 89b01dd614ba..e2a9de5b9323 100644
> --- a/drivers/staging/r8188eu/include/odm.h
> +++ b/drivers/staging/r8188eu/include/odm.h
> @@ -166,7 +166,7 @@ struct odm_ra_info {
> 
>   struct ijk_matrix_regs_set {
>   	bool	bIQKDone;
> -	s32	Value[1][IQK_Matrix_REG_NUM];
> +	s32	Value[][IQK_Matrix_REG_NUM];
>   };
> 

you are changing the actual size of the struct. Wondering if you have 
tested this patch somehow

>   struct odm_rf_cal {
> diff --git a/drivers/staging/r8188eu/include/wlan_bssdef.h b/drivers/staging/r8188eu/include/wlan_bssdef.h
> index 831c465df500..33177de194eb 100644
> --- a/drivers/staging/r8188eu/include/wlan_bssdef.h
> +++ b/drivers/staging/r8188eu/include/wlan_bssdef.h
> @@ -179,7 +179,7 @@ struct ndis_802_11_status_ind {
> 
>   struct ndis_802_11_auth_evt {
>   	struct ndis_802_11_status_ind       Status;
> -	struct ndis_802_11_auth_req  Request[1];
> +	struct ndis_802_11_auth_req  Request[];
>   };
> 

this structure seems to be unused. Better to remove it instead of 
maintaining the old code

>   struct ndis_802_11_test {
> @@ -291,7 +291,7 @@ struct pmkid_candidate {
>   struct ndis_802_11_pmkid_list {
>   	u32 Version;       /*  Version of the structure */
>   	u32 NumCandidates; /*  No. of pmkid candidates */
> -	struct pmkid_candidate CandidateList[1];
> +	struct pmkid_candidate CandidateList[];
>   };

this one as well

> 
>   struct ndis_802_11_auth_encrypt {
> @@ -304,7 +304,7 @@ struct ndis_802_11_cap {
>   	u32  Version;
>   	u32  NoOfPMKIDs;
>   	u32  NoOfAuthEncryptPairsSupported;
> -	struct ndis_802_11_auth_encrypt AuthenticationEncryptionSupported[1];
> +	struct ndis_802_11_auth_encrypt AuthenticationEncryptionSupported[];
>   };
> 
>   u8 key_2char2num(u8 hch, u8 lch);
> --
> 2.34.1
> 

and this one as well

> 
> 





With regards,
Pavel Skripkin
