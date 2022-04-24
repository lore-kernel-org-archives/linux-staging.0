Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D6C97C
	for <linux-staging@lists.linux.dev>; Sun, 24 Apr 2022 18:53:12 +0000 (UTC)
Received: by mail-lj1-f180.google.com with SMTP id l19so2804516ljb.7
        for <linux-staging@lists.linux.dev>; Sun, 24 Apr 2022 11:53:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=FC/8yLdSqiq2IyvCXByJ/UPgQYfMYiDtun4dRAazNxU=;
        b=Q78roLaBQBx0gfXmK715idh3BO84YfUpV+y9xmJ5vf/qCZ6phRouk4OLl1ZVPxD/lc
         i2eh2l3J5ZYsGpGFPJVPmWsurzpr540+spGY2f6ikvXipHnjkeMVTyD81Jd7Kg6T4KP7
         g0W+nUb1rbm6HX1h/tlcI8aVwRf4lsMJzX8w5SA0B1w1nxf9pFK4AGSfHDGY0G5r4eqG
         Noe8KRdZUjEXnEGIRwNFzjsVw+VwfHQwwirwkilemBQ716SMj6UFDeaxVB7NxbkbbHH1
         2PekuhxRCBhDnAT84Z+97/q2YPpdHBn29KvVUBOUDQCLX6O/6LUs6537AvBtkuWJ6NuW
         ZSqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=FC/8yLdSqiq2IyvCXByJ/UPgQYfMYiDtun4dRAazNxU=;
        b=FJ/Gi+aBZJgAzt08g0kEem8qQGS/NBdVN1GsiPB+Z9qmtShxCY88+TwmjiG5HIxP+x
         QfKLFYDUvLdrBbUOV8P11HNXUNize+xkSgQFqOGDFPWFnk/goLd+dSx18DHIAlXOAxvi
         tckZ6gYWSQRI9iL7xwgex1E7CJxeECGR0IytmylMBkfysYgwCTzXJUHcAKmn0Plk8Jc2
         yvZwPt/o4FF1dEzD+uvydYG5VLmTv6V+X6K/FlfGrX2R9uMoBWL+ITdU+HKxiRSEJ003
         QdXk8s68fmm2Gl0/ccTY2aCKf2qze9oojOZzvci4k64kipDrKrb+PjjbOJILuPmSGA+Y
         YQBg==
X-Gm-Message-State: AOAM532HlGTKMveEhpRGbt+0izy2jpDaf28Zk3XJeHu0PpMDZpues3SQ
	/lClbGKtCz0u//rEaf46J/s=
X-Google-Smtp-Source: ABdhPJybHN9XnQZfI3riHPEAJN67QQsQUACTyDDu6Fl0+w3A3H5LdF/DAlyKBRYxsi8w/Wmc31Ubfg==
X-Received: by 2002:a05:651c:17a3:b0:245:f39e:f2d2 with SMTP id bn35-20020a05651c17a300b00245f39ef2d2mr9346694ljb.490.1650826390054;
        Sun, 24 Apr 2022 11:53:10 -0700 (PDT)
Received: from [192.168.1.11] ([94.103.225.17])
        by smtp.gmail.com with ESMTPSA id l26-20020a2e701a000000b0024f0d5fb1b0sm340283ljc.94.2022.04.24.11.53.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 24 Apr 2022 11:53:09 -0700 (PDT)
Message-ID: <85f946c9-235e-cc69-4d19-1ebf972cd935@gmail.com>
Date: Sun, 24 Apr 2022 21:53:07 +0300
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 2/3] staging: r8188eu: fix null check in
 _rtw_enqueue_recvframe
Content-Language: en-US
To: Vihas Makwana <makvihas@gmail.com>,
 Larry Finger <Larry.Finger@lwfinger.net>,
 Phillip Potter <phil@philpotter.co.uk>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Michael Straube <straube.linux@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 Dan Carpenter <dan.carpenter@oracle.com>
References: <20220424163132.37007-1-makvihas@gmail.com>
 <20220424163132.37007-3-makvihas@gmail.com>
From: Pavel Skripkin <paskripkin@gmail.com>
In-Reply-To: <20220424163132.37007-3-makvihas@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Vihas,

On 4/24/22 19:31, Vihas Makwana wrote:
> There's a NULL check on padapter in rtw_recv.c:189 which makes no sense as
> rtw_recv.c:184 dereferences it unconditionally and it would have already
> crashed at this point.
> Fix this by moving the dereference line inside the check.
> 
> Signed-off-by: Vihas Makwana <makvihas@gmail.com>
> ---
>   drivers/staging/r8188eu/core/rtw_recv.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/r8188eu/core/rtw_recv.c b/drivers/staging/r8188eu/core/rtw_recv.c
> index 4cf9b4b8f..7d306a3c6 100644
> --- a/drivers/staging/r8188eu/core/rtw_recv.c
> +++ b/drivers/staging/r8188eu/core/rtw_recv.c
> @@ -181,12 +181,13 @@ int rtw_free_recvframe(struct recv_frame *precvframe, struct __queue *pfree_recv
>   int _rtw_enqueue_recvframe(struct recv_frame *precvframe, struct __queue *queue)
>   {
>   	struct adapter *padapter = precvframe->adapter;
> -	struct recv_priv *precvpriv = &padapter->recvpriv;
> +	struct recv_priv *precvpriv;

Actually, `&padapter->recvpriv` is not a de-reference, it's just address 
calculation, so in case of padapder being NULL precvpriv will contain 
offsetof(struct adapter, recvpriv).

>   
>   	list_del_init(&precvframe->list);
>   	list_add_tail(&precvframe->list, get_list_head(queue));
>   
>   	if (padapter) {
> +		precvpriv = &padapter->recvpriv;
>   		if (queue == &precvpriv->free_recv_queue)
>   			precvpriv->free_recvframe_cnt++;
>   	}




With regards,
Pavel Skripkin
