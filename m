Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 303F72C8E
	for <linux-staging@lists.linux.dev>; Tue,  5 Oct 2021 22:04:42 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id s15so2281781wrv.11
        for <linux-staging@lists.linux.dev>; Tue, 05 Oct 2021 15:04:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=wWGT6wyYNrHQcVjKvvDi6depYNBPBPoEJbTYnS4YHRE=;
        b=oMaqA3o9QB94TpF7CppOdrcV4haz930ZF4+Q3iSjOXfqsmWCdei2kltW3OvQJU19kd
         /V59SHINqQjwDzbyAYjjrf4QWS5WUlsx8P3x9EXaatOnSqxvbEoepxQzx2stjYfASETq
         BUVIcAZvX2YPsATGazdGcy2Z3bnQxTYFcv4AMI7z55NhgW9pRgad2/PlOkB1Gw8p3NO0
         gB2f/Fr1QhgZTdCrnC3bIXpAqdllyjpvErazZEXE9l4pePYmnNroUlbFuvKibj+7197V
         HF0WJEU4IfhNkmwDqBhilfR/zAJIaHcHYgWMxYL8Nf4ZKIJKDkRFFGPbcdVXnIKxomtr
         xO1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=wWGT6wyYNrHQcVjKvvDi6depYNBPBPoEJbTYnS4YHRE=;
        b=6A4m5dV0xtz4PJI+GyxivnZv38lH5nIa+cziHqlADztXBvTNWGutJ42vqDQhCBMEJ0
         dEdYdW2tySYc2XqccHDQGig8tD1KOOPtXmm6p/AmGt/s/vvs9O7hdFBK1OM43XYmGq6v
         yYMaNUfUgs+RSGCaatUK11ZAyz7S08Wlfe2MxAe8nTK8QdyyKBm2VUyBg00ozimrNowS
         bF94UyjHL0HAogK7AD2WpWW9vo2E578AVp7iVfUE7KFWhQ00BzRnFqO6KSG4ijf1Jq28
         JCvzIEFA02iCjWWBFMYLSzjeIbBn2U6Z8EWcNTABfUhsuj0n2ttuBCtvJyKzdZ1hOwtF
         GdAg==
X-Gm-Message-State: AOAM532Xd9FywiFd+o9e4eYWRZS2Pm/4wgKUaVZXEWyCH1vKeP190YiR
	Hi8yCy9PuM/25oCb7k7Tz/8=
X-Google-Smtp-Source: ABdhPJy9S4jOKQChoQmLTDTvyvbf/rfKtqtNfqEC4t7BRNUobE80G3hGH22bvz5nxHqCc9dzxqYnuw==
X-Received: by 2002:adf:a292:: with SMTP id s18mr5861731wra.42.1633471480523;
        Tue, 05 Oct 2021 15:04:40 -0700 (PDT)
Received: from ?IPV6:2a02:8108:96c0:3b88::f816? ([2a02:8108:96c0:3b88::f816])
        by smtp.gmail.com with ESMTPSA id z79sm3216353wmc.17.2021.10.05.15.04.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Oct 2021 15:04:40 -0700 (PDT)
Message-ID: <82be310c-6e8f-8ec8-fbb0-a08ee62ae220@gmail.com>
Date: Wed, 6 Oct 2021 00:04:39 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.1
Subject: Re: [PATCH 1/9] staging: r8188eu: remove an obsolete comment
Content-Language: en-US
To: Martin Kaiser <martin@kaiser.cx>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
 Phillip Potter <phil@philpotter.co.uk>, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20211005200821.19783-1-martin@kaiser.cx>
From: Michael Straube <straube.linux@gmail.com>
In-Reply-To: <20211005200821.19783-1-martin@kaiser.cx>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/5/21 22:08, Martin Kaiser wrote:
> The function that this comment describes is not present in the
> r8188eu driver. The comment can be removed.
> 
> Signed-off-by: Martin Kaiser <martin@kaiser.cx>
> ---
>   drivers/staging/r8188eu/hal/usb_halinit.c | 15 ---------------
>   1 file changed, 15 deletions(-)
> 
> diff --git a/drivers/staging/r8188eu/hal/usb_halinit.c b/drivers/staging/r8188eu/hal/usb_halinit.c
> index 83813388de24..ab7b80144403 100644
> --- a/drivers/staging/r8188eu/hal/usb_halinit.c
> +++ b/drivers/staging/r8188eu/hal/usb_halinit.c
> @@ -624,21 +624,6 @@ static void _InitAntenna_Selection(struct adapter *Adapter)
>   	DBG_88E("%s,Cur_ant:(%x)%s\n", __func__, haldata->CurAntenna, (haldata->CurAntenna == Antenna_A) ? "Antenna_A" : "Antenna_B");
>   }
>   
> -/*-----------------------------------------------------------------------------
> - * Function:	HwSuspendModeEnable92Cu()
> - *
> - * Overview:	HW suspend mode switch.
> - *
> - * Input:		NONE
> - *
> - * Output:	NONE
> - *
> - * Return:	NONE
> - *
> - * Revised History:
> - *	When		Who		Remark
> - *	08/23/2010	MHC		HW suspend mode switch test..
> - *---------------------------------------------------------------------------*/
>   enum rt_rf_power_state RfOnOffDetect(struct adapter *adapt)
>   {
>   	u8 val8;
> 

Hi Martin,

patch looks good, just one note. The function RfOnOffDetect() is not
used and could be removed as well.

Regards,
Michael
