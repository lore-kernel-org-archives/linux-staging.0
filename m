Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C47772
	for <linux-staging@lists.linux.dev>; Fri, 29 Oct 2021 14:56:28 +0000 (UTC)
Received: by mail-pj1-f47.google.com with SMTP id o6-20020a17090a0a0600b001a64b9a11aeso291960pjo.3
        for <linux-staging@lists.linux.dev>; Fri, 29 Oct 2021 07:56:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=Psdok0lolc/DRk6gfEZkpmxNT4+m/VOYNLeCH1dS5Kw=;
        b=c88mFZGRY94DlJQosTNHHqjAM1zsfGZjFnJpNLRb9jvir3ir+OsuQ93qUFRiVZ5w+9
         CD796z/24q/IZg+sWZjvP4DpkNAuePSXi3T9a0Sqcjo0kzOuxXXvFt0KFZSSf1EvAkRy
         xl1LASVrzVLZReVmf2Few2Z3u2t9igt7q+sflgo734CGMnuuNiWhnyz3ZbSm0pkHTExl
         PILHvtrgyzvMYLr2EYCecdnNjLN946sFlahG/KODZOKlMh5KIDggHVSW1ogSlR7RFO8I
         AKbQjROVoBiBgYrt70Sy6gxsWGjho2R44tMNw44vA1OzBOeEE0wiPIzXALmPNfWUkWfr
         VL4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Psdok0lolc/DRk6gfEZkpmxNT4+m/VOYNLeCH1dS5Kw=;
        b=hULcizZNfVuVkTzfo9tRdaT+HiBrklamT34LZv+C/Icdyo12A+8W0wgTPlT9w0hU9v
         5o/0D2pxAATUhwdeYpSpJMV/GrSIj+Z0Zaj9A9DSHV1lDGcD5iJq8mFZjDwv6yhuvoCO
         P4GvfjWhKNESP9fpmgYOXj6M3D5PhGPS4aeNpRE4CasB1RleDW9Q9QRzQNHbCoD1s0M2
         wTNCaXbtkN6pFt4DoyXff/kb24J9ga//ZygK/GwUvGRVc4ibeaPXGP2OpAE7bVpZhFh+
         PqnQzxdWIx+rfXApMxLNcfs5uLis4pX06EoGVp2rJY/AUWswX/mMPst/GeRMLbeQJQBe
         TxRA==
X-Gm-Message-State: AOAM530C/Q+eZhV0CpDuJDhUL5QOhuYyKJDCvGzq+Ab8aA+IKz2XfZ63
	5zQeQv9lwuxP0uUmJuFX0TM=
X-Google-Smtp-Source: ABdhPJxH7iZHXSjXfXBNmzCTRFr8GmtBzCMxOSDuAAWI62URFuLO40iVem+2gcbB01YfzS9M88bwOw==
X-Received: by 2002:a17:902:e806:b0:141:5df8:c535 with SMTP id u6-20020a170902e80600b001415df8c535mr10263327plg.9.1635519387911;
        Fri, 29 Oct 2021 07:56:27 -0700 (PDT)
Received: from ?IPV6:2405:201:d007:e827:3d78:7315:8c23:fdaf? ([2405:201:d007:e827:3d78:7315:8c23:fdaf])
        by smtp.gmail.com with ESMTPSA id v8sm6462465pjd.7.2021.10.29.07.56.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 Oct 2021 07:56:27 -0700 (PDT)
Message-ID: <3dfc45e5-12bc-72da-a260-5551a483fe6e@gmail.com>
Date: Fri, 29 Oct 2021 20:26:25 +0530
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [Outreachy kernel] [PATCH 2/7] staging: vt6655: Use
 incrementation in `idx`
Content-Language: en-US
To: Karolina Drobnik <karolinadrobnik@gmail.com>,
 outreachy-kernel@googlegroups.com
Cc: gregkh@linuxfoundation.org, forest@alittletooquiet.net,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <cover.1635415820.git.karolinadrobnik@gmail.com>
 <c569952d92ba51f32679c2fd87fd48ad8e49e3fc.1635415820.git.karolinadrobnik@gmail.com>
From: Praveen Kumar <kpraveen.lkml@gmail.com>
In-Reply-To: <c569952d92ba51f32679c2fd87fd48ad8e49e3fc.1635415820.git.karolinadrobnik@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28-10-2021 16:05, Karolina Drobnik wrote:
> Increment `idx` in a loop instead of adding the loop counter
> `i` to do so. Thanks to this change, the cast to unsigned short
> can be removed.

> 
> Signed-off-by: Karolina Drobnik <karolinadrobnik@gmail.com>
> ---
>  drivers/staging/vt6655/rf.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/staging/vt6655/rf.c b/drivers/staging/vt6655/rf.c
> index f195dafb6e63..c07653566d17 100644
> --- a/drivers/staging/vt6655/rf.c
> +++ b/drivers/staging/vt6655/rf.c
> @@ -700,11 +700,11 @@ bool RFvWriteWakeProgSyn(struct vnt_private *priv, unsigned char rf_type,
>  			return false;
>  
>  		for (i = 0; i < CB_AL2230_INIT_SEQ; i++)
> -			MACvSetMISCFifo(priv, (unsigned short)(idx + i), al2230_init_table[i]);
> +			MACvSetMISCFifo(priv, idx++, al2230_init_table[i]);
>  
> -		MACvSetMISCFifo(priv, (unsigned short)(idx + i), al2230_channel_table0[channel - 1]);
> +		MACvSetMISCFifo(priv, idx++, al2230_channel_table0[channel - 1]);
>  		i++;
> -		MACvSetMISCFifo(priv, (unsigned short)(idx + i), al2230_channel_table1[channel - 1]);
> +		MACvSetMISCFifo(priv, idx++, al2230_channel_table1[channel - 1]);
>  		break;
>  
>  		/* Need to check, PLLON need to be low for channel setting */
> @@ -717,17 +717,17 @@ bool RFvWriteWakeProgSyn(struct vnt_private *priv, unsigned char rf_type,
>  
>  		if (channel <= CB_MAX_CHANNEL_24G) {
>  			for (i = 0; i < CB_AL7230_INIT_SEQ; i++)
> -				MACvSetMISCFifo(priv, (unsigned short)(idx + i), al7230_init_table[i]);
> +				MACvSetMISCFifo(priv, idx++, al7230_init_table[i]);

If I'm not wrong, there is a problem here, we are using the modified idx value here, instead of original which is *MISCFIFO_SYNDATA_IDX*.
I don't see idx value being reset either. Am I missing something ?

Further, this bring a question, how are you validating or planning to validate these changes ?

>  		} else {
>  			for (i = 0; i < CB_AL7230_INIT_SEQ; i++)
> -				MACvSetMISCFifo(priv, (unsigned short)(idx + i), al7230_init_table_a_mode[i]);
> +				MACvSetMISCFifo(priv, idx++, al7230_init_table_a_mode[i]);
>  		}
>  
> -		MACvSetMISCFifo(priv, (unsigned short)(idx + i), al7230_channel_table0[channel - 1]);
> +		MACvSetMISCFifo(priv, idx++, al7230_channel_table0[channel - 1]);
>  		i++;
> -		MACvSetMISCFifo(priv, (unsigned short)(idx + i), al7230_channel_table1[channel - 1]);
> +		MACvSetMISCFifo(priv, idx++, al7230_channel_table1[channel - 1]);
>  		i++;
> -		MACvSetMISCFifo(priv, (unsigned short)(idx + i), al7230_channel_table2[channel - 1]);
> +		MACvSetMISCFifo(priv, idx++, al7230_channel_table2[channel - 1]);
>  		break;
>  
>  	case RF_NOTHING:
> 

Regards,

~Praveen.
