Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B91E72
	for <linux-staging@lists.linux.dev>; Fri, 29 Oct 2021 14:47:51 +0000 (UTC)
Received: by mail-pj1-f51.google.com with SMTP id k2-20020a17090ac50200b001a218b956aaso7553331pjt.2
        for <linux-staging@lists.linux.dev>; Fri, 29 Oct 2021 07:47:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=hV6vofY7LVmgEKN79iTvz1KdYYvMLZvDW2AQ8HYXn/E=;
        b=PchEGoqznLSapRib9ayECws6mKwf45wiAVWBNDkJ3CUb8tFnVGhuCvyAqoG3Y7wa+X
         oxUXyRklHvdyeUK1TiKYHaOuXmR/fG7PRLWCycEjQwL3bKyZI5TAnrnG1TvZDENcOVAR
         kOU65pb2p3EAVzHgR+s5jGWQLp524ixxd17ZXbRu1tRLWYCh0fthr+WyTb6cxOJqw42L
         O2/xwEzF2LqlzPxD+R3OKWdAlGNCSL3J0DPk0JsiGX4OfvXeEa7fs8Csw0Lszdgypvk3
         mTEsKi0ESFvBcTaG0v8Bk1Q1jiM1acSq44s4HxbkyAyVRiK798g3xcBcduWSv3+WGpNi
         /eHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=hV6vofY7LVmgEKN79iTvz1KdYYvMLZvDW2AQ8HYXn/E=;
        b=qa19CTdlzTiENiptr5Gg3yNSA7OivQ//QjTaZYfU/fBDIpXoqHdAPnr5LLdd+Yr5O8
         A+kIhFITMIdB1jSLaDmphXCQVIcd+hGFRvYbf5w8JH9JLqYgylA7BdEZxBhvTeTnqokq
         rQ3/pyr3ljKuLdVJkpRKnvHLSBLX7Hwr3x12W/3qe7WTxLAjGpJ6v5NqzkuMBiQdOSLX
         3yLXhzSF73sVJ7MUJMhTFYypAorZYTPICEy3cXIEG6nFOg2wzWS3VLUR1HmlybMh2Y4/
         yQWWxWwU3smeT1Qnr8YybXEqa/ebRzvVZm9F5AKAOGR7u+YX3GK9ooeLW4CQFu4RnJmN
         lNcQ==
X-Gm-Message-State: AOAM532SSsgFepWk4cD7FbN/azSvStgnWD/37Wj1p67stEtJiUBA4F36
	CnhB9solqaH+zmnmssI9s3w=
X-Google-Smtp-Source: ABdhPJzsXBdSdtSr21ya/684zcKViMYI/czst3dq83J9Sdp5vippaNUP/l/f/HhnItmeCDTmCor/tw==
X-Received: by 2002:a17:902:e848:b0:13e:f908:155a with SMTP id t8-20020a170902e84800b0013ef908155amr10320481plg.13.1635518870777;
        Fri, 29 Oct 2021 07:47:50 -0700 (PDT)
Received: from ?IPV6:2405:201:d007:e827:3d78:7315:8c23:fdaf? ([2405:201:d007:e827:3d78:7315:8c23:fdaf])
        by smtp.gmail.com with ESMTPSA id k22sm7629195pfu.148.2021.10.29.07.47.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 Oct 2021 07:47:50 -0700 (PDT)
Message-ID: <8cf5e5a4-675e-8c50-f234-018321dcb93a@gmail.com>
Date: Fri, 29 Oct 2021 20:17:45 +0530
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [Outreachy kernel] [PATCH 1/7] staging: vt6655: Introduce `idx`
 temporary variable
Content-Language: en-US
To: Karolina Drobnik <karolinadrobnik@gmail.com>,
 outreachy-kernel@googlegroups.com
Cc: gregkh@linuxfoundation.org, forest@alittletooquiet.net,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <cover.1635415820.git.karolinadrobnik@gmail.com>
 <34bd0e8f42597edf006a950d420345befc4e0bc2.1635415820.git.karolinadrobnik@gmail.com>
From: Praveen Kumar <kpraveen.lkml@gmail.com>
In-Reply-To: <34bd0e8f42597edf006a950d420345befc4e0bc2.1635415820.git.karolinadrobnik@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28-10-2021 16:05, Karolina Drobnik wrote:
> Add a local variable to store `MISCFIFO_SYNDATA_IDX` offset.
> This change helps in shortening the lines in `rf.c` that
> are deemed too long by checkpatch.pl.
> 
> Signed-off-by: Karolina Drobnik <karolinadrobnik@gmail.com>
> ---
>  drivers/staging/vt6655/rf.c | 17 +++++++++--------
>  1 file changed, 9 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/staging/vt6655/rf.c b/drivers/staging/vt6655/rf.c
> index bc4abe77db7b..f195dafb6e63 100644
> --- a/drivers/staging/vt6655/rf.c
> +++ b/drivers/staging/vt6655/rf.c
> @@ -681,6 +681,7 @@ bool RFvWriteWakeProgSyn(struct vnt_private *priv, unsigned char rf_type,
>  {
>  	void __iomem *iobase = priv->port_offset;
>  	int i;

Why not to make *i* as unsigned short and get rid of all the type conversions below ?

> +	unsigned short idx = MISCFIFO_SYNDATA_IDX;
>  	unsigned char init_count = 0;
>  	unsigned char sleep_count = 0;
>  
> @@ -699,11 +700,11 @@ bool RFvWriteWakeProgSyn(struct vnt_private *priv, unsigned char rf_type,
>  			return false;
>  
>  		for (i = 0; i < CB_AL2230_INIT_SEQ; i++)
> -			MACvSetMISCFifo(priv, (unsigned short)(MISCFIFO_SYNDATA_IDX + i), al2230_init_table[i]);
> +			MACvSetMISCFifo(priv, (unsigned short)(idx + i), al2230_init_table[i]);
>  
> -		MACvSetMISCFifo(priv, (unsigned short)(MISCFIFO_SYNDATA_IDX + i), al2230_channel_table0[channel - 1]);
> +		MACvSetMISCFifo(priv, (unsigned short)(idx + i), al2230_channel_table0[channel - 1]);
>  		i++;
> -		MACvSetMISCFifo(priv, (unsigned short)(MISCFIFO_SYNDATA_IDX + i), al2230_channel_table1[channel - 1]);
> +		MACvSetMISCFifo(priv, (unsigned short)(idx + i), al2230_channel_table1[channel - 1]);
>  		break;
>  
>  		/* Need to check, PLLON need to be low for channel setting */
> @@ -716,17 +717,17 @@ bool RFvWriteWakeProgSyn(struct vnt_private *priv, unsigned char rf_type,
>  
>  		if (channel <= CB_MAX_CHANNEL_24G) {
>  			for (i = 0; i < CB_AL7230_INIT_SEQ; i++)
> -				MACvSetMISCFifo(priv, (unsigned short)(MISCFIFO_SYNDATA_IDX + i), al7230_init_table[i]);
> +				MACvSetMISCFifo(priv, (unsigned short)(idx + i), al7230_init_table[i]);
>  		} else {
>  			for (i = 0; i < CB_AL7230_INIT_SEQ; i++)
> -				MACvSetMISCFifo(priv, (unsigned short)(MISCFIFO_SYNDATA_IDX + i), al7230_init_table_a_mode[i]);
> +				MACvSetMISCFifo(priv, (unsigned short)(idx + i), al7230_init_table_a_mode[i]);
>  		}
>  
> -		MACvSetMISCFifo(priv, (unsigned short)(MISCFIFO_SYNDATA_IDX + i), al7230_channel_table0[channel - 1]);
> +		MACvSetMISCFifo(priv, (unsigned short)(idx + i), al7230_channel_table0[channel - 1]);
>  		i++;
> -		MACvSetMISCFifo(priv, (unsigned short)(MISCFIFO_SYNDATA_IDX + i), al7230_channel_table1[channel - 1]);
> +		MACvSetMISCFifo(priv, (unsigned short)(idx + i), al7230_channel_table1[channel - 1]);
>  		i++;
> -		MACvSetMISCFifo(priv, (unsigned short)(MISCFIFO_SYNDATA_IDX + i), al7230_channel_table2[channel - 1]);
> +		MACvSetMISCFifo(priv, (unsigned short)(idx + i), al7230_channel_table2[channel - 1]);
>  		break;
>  
>  	case RF_NOTHING:
> 

Regards,

~Praveen.
