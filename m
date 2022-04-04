Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8069E3200;
	Mon,  4 Apr 2022 18:49:23 +0000 (UTC)
Received: by mail-oi1-f174.google.com with SMTP id j83so11006219oih.6;
        Mon, 04 Apr 2022 11:49:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=+x8xeE7VdwyEBg9gBJjb/VSkL3ctOrEYGykxx0ig/m0=;
        b=aIIJqQOlgGEaPFjQYKZkBfSoalRDYuXCqe3vleD+YoMT6FyQdOFPNf+S+9sxlwUq54
         NmltyIWDy33kTR0OTRadOhK77QdqSl8Vr+QvqTOBdxzTwwZoyooJtH7PAoM4B6VuHvOb
         mnKMngV7nKSgJ1NYzzG0jE2zETbUAFXGphzJoGcUTTRIAspUa2tNMrIYjM7MWIWIy/8E
         NjJS7bznd7wBf5/40L9ymVkjSitPiflm5WaSfgHVSllrk9/yCcHtgWJ+KTmIMLY7VEhr
         o2TpSk48hwsKaRx3fAQt2RGKCujfvasVxP9JLA++ZfvQi49nDSq+okk9BBSdlu/rffvk
         cO1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
         :subject:content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=+x8xeE7VdwyEBg9gBJjb/VSkL3ctOrEYGykxx0ig/m0=;
        b=LEKGROjBrIRNXxY60rEDnS+ctM+dZWz148ioteMc8pJRnnWnmWhhGjK8ix3hlOKIcW
         uj2xWs0M9nk12+DnbHD31hqfN1NMVWsKfuUCdI+kofaoDyQc0YsNQsgc9QbbW7aG6370
         61s0CEiJTQyK6a2MLPKjqXMTtOQBdmqT5bTC9bOSrBQg2h/7YlK0k4VFDoFZxMSm08CZ
         mxXLGLoiMcyofW145G1Q9Nybh8NducMS8GolwKS6opn0kUk9H7+yCUnVVVbJoxB/mquW
         pEqHMhhy078tJtuf8aUQ5rdzIi2PKYkK77xHd9yweHhFN3BFQG4wyblt5HPq5TY3/pY9
         u/hQ==
X-Gm-Message-State: AOAM533pd/LuqTo+KshadZSaxLmiQFcZXy3RJK6g8k0sDVMNkE2Lc0kf
	p8ec4eXS+4K5yt6teedVMTM=
X-Google-Smtp-Source: ABdhPJy1vzaNMEa6qR1jv8tDRSZiMxYpeg4RNjKExhY59rCu0Q+CxA5CqAv26vovX2cZDXQXs4yhBg==
X-Received: by 2002:a05:6808:9ae:b0:2d9:a01a:4bf4 with SMTP id e14-20020a05680809ae00b002d9a01a4bf4mr238080oig.283.1649098162576;
        Mon, 04 Apr 2022 11:49:22 -0700 (PDT)
Received: from ?IPV6:2603:8090:2005:39b3::1004? (2603-8090-2005-39b3-0000-0000-0000-1004.res6.spectrum.com. [2603:8090:2005:39b3::1004])
        by smtp.gmail.com with ESMTPSA id m17-20020a0568301e7100b005b256697d7csm4795089otr.72.2022.04.04.11.49.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Apr 2022 11:49:21 -0700 (PDT)
Sender: Larry Finger <larry.finger@gmail.com>
Message-ID: <547963ab-4922-3208-fe63-07e0756890d9@lwfinger.net>
Date: Mon, 4 Apr 2022 13:49:20 -0500
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] staging: r8188eu: remove unnecessary blank lines
Content-Language: en-US
To: Alaa Mohamed <eng.alaamohamedsoliman.am@gmail.com>,
 outreachy@lists.linux.dev
Cc: phil@philpotter.co.uk, gregkh@linuxfoundation.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20220404145217.15069-1-eng.alaamohamedsoliman.am@gmail.com>
From: Larry Finger <Larry.Finger@lwfinger.net>
In-Reply-To: <20220404145217.15069-1-eng.alaamohamedsoliman.am@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/4/22 09:52, Alaa Mohamed wrote:
> Reported by checkpatch:
> 
> CHECK: Blank lines aren't necessary before a close brace '}'
> 
> Signed-off-by: Alaa Mohamed <eng.alaamohamedsoliman.am@gmail.com>
> ---
>   drivers/staging/r8188eu/core/rtw_ap.c | 3 ---
>   1 file changed, 3 deletions(-)
> 
> diff --git a/drivers/staging/r8188eu/core/rtw_ap.c b/drivers/staging/r8188eu/core/rtw_ap.c
> index 2ff78ed1faab..ac6effbecf6d 100644
> --- a/drivers/staging/r8188eu/core/rtw_ap.c
> +++ b/drivers/staging/r8188eu/core/rtw_ap.c
> @@ -188,7 +188,6 @@ void	expire_timeout_chk(struct adapter *padapter)
>   				spin_lock_bh(&pstapriv->auth_list_lock);
>   			}
>   		}
> -
>   	}
>   	spin_unlock_bh(&pstapriv->auth_list_lock);
>   
> @@ -381,7 +380,6 @@ void add_RATid(struct adapter *padapter, struct sta_info *psta, u8 rssi_level)
>   		/* set ra_id, init_rate */
>   		psta->raid = raid;
>   		psta->init_rate = init_rate;
> -
>   	}
>   }
>   
> @@ -455,7 +453,6 @@ void update_bmc_sta(struct adapter *padapter)
>   		spin_lock_bh(&psta->lock);
>   		psta->state = _FW_LINKED;
>   		spin_unlock_bh(&psta->lock);
> -
>   	}
>   }
>   

Acked_by: Larry Finger <Larry.Finger@lwfinger.net>

Thanks,

Larry

