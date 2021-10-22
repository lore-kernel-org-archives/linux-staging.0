Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06C252C98
	for <linux-staging@lists.linux.dev>; Fri, 22 Oct 2021 14:26:35 +0000 (UTC)
Received: by mail-pg1-f177.google.com with SMTP id s136so3477150pgs.4
        for <linux-staging@lists.linux.dev>; Fri, 22 Oct 2021 07:26:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=JhwFuccVZQeiwvNuHNQ1RS7yIFWPLwTUxexiIKglluM=;
        b=Z4u24KMLF/8Ym9rkji3BWniCuaq4Qc7CR11xwyizB+rQcVNYj05t0WbBDBmi0wZkB/
         M2FzT5a0jpdsgEIW+TwVATCsXGR8mzfRywoqD0fF02bgM+DAgOTjhdObYu6ujxfBk/yN
         7W4sj6mS59Ilm1u+Jm/+0vyNko45GJoV0NiwBxZm3BcZZSbHMKwDFMgO+i9XcHeuDSmh
         gyTsiIql7khMX8Cq/kc6i3Lh/TDPdSOzKsqfcu3JvsnM4coJvp22QNdmkdscpWuRrqQd
         HKbrphcur2Qum/YZRI5yFrztx40OrO+Ngq+xUtIvYJrttdnBisWd7StdVNFJuOBk+68b
         s1dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=JhwFuccVZQeiwvNuHNQ1RS7yIFWPLwTUxexiIKglluM=;
        b=s+dgJlYH6OQpsoOoacVaagv59hZQhsodJ/xmAK4pU1s2VV4d+j3Wxt/IRjZG/XigMK
         XiewWonVNrCMqNptBxDCpW+xaTh1mGeyaJ1Ext3y9unjZzWqZya/QrsPEQ9x90NPHgDy
         XaLmvOOiJ655O7ZPATdwG1xywrkQBwTFqmMnyZUxi5wvZ5gjFZWGKJGcFGA9wEQUObau
         uqa2tBOeNOUKLkaME5cAcEISIOjrbuOyPp5b+zZkV5pEBHwLcGl+hVLHgOZTwemc38qh
         fn7D0SH23b76J4s8i7XmEg9cZ4FK+dx5MNSPVeR6EwXTo5f1UqMSDzLqu1mA0OqXvDd8
         ySIw==
X-Gm-Message-State: AOAM5338yqvxRzzv2SJIEZqNuyGjaBkliIi1TBwCb76HGoRwpbssAWY+
	KwxN63Kp7SA8k3dkisOi+JI=
X-Google-Smtp-Source: ABdhPJyVzouQUApdOVABmW7iJ2tSCJcNx2TQaGYfivjl8SeHFtmuXCqilAWvZnpPOds1wNpJzGvYqQ==
X-Received: by 2002:a63:8f4a:: with SMTP id r10mr22860pgn.337.1634912795519;
        Fri, 22 Oct 2021 07:26:35 -0700 (PDT)
Received: from [192.168.1.122] ([122.181.48.19])
        by smtp.gmail.com with ESMTPSA id g5sm1238858pfc.65.2021.10.22.07.26.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Oct 2021 07:26:35 -0700 (PDT)
Message-ID: <049d4b3e-ed32-9b48-0c2e-19f9af95ca37@gmail.com>
Date: Fri, 22 Oct 2021 19:56:30 +0530
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [Outreachy kernel] [PATCH 5/5] staging: vt6655: Rename `byRFType`
 variable
Content-Language: en-US
To: Karolina Drobnik <karolinadrobnik@gmail.com>,
 outreachy-kernel@googlegroups.com
Cc: gregkh@linuxfoundation.org, forest@alittletooquiet.net,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <cover.1634826774.git.karolinadrobnik@gmail.com>
 <f0b6818d2b15982081bebaf14f830f4646f61fe2.1634826774.git.karolinadrobnik@gmail.com>
From: Praveen Kumar <kpraveen.lkml@gmail.com>
In-Reply-To: <f0b6818d2b15982081bebaf14f830f4646f61fe2.1634826774.git.karolinadrobnik@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22-10-2021 15:07, Karolina Drobnik wrote:
> Drop Hungarian notation in `byRFType` variable in
> `RFvWriteWakeProgSyn` function. Change it to use snake case.
> 
> Fix issue detected by checkpatch.pl:
>   CHECK: Avoid CamelCase: <byRFType>
> 
> Signed-off-by: Karolina Drobnik <karolinadrobnik@gmail.com>
> ---
>  drivers/staging/vt6655/rf.c | 4 ++--
>  drivers/staging/vt6655/rf.h | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/staging/vt6655/rf.c b/drivers/staging/vt6655/rf.c
> index 0dd91b0433f6..3f57834901a6 100644
> --- a/drivers/staging/vt6655/rf.c
> +++ b/drivers/staging/vt6655/rf.c
> @@ -676,7 +676,7 @@ bool RFbSelectChannel(struct vnt_private *priv, unsigned char byRFType,
>   * Return Value: None.
>   *
>   */
> -bool RFvWriteWakeProgSyn(struct vnt_private *priv, unsigned char byRFType,
> +bool RFvWriteWakeProgSyn(struct vnt_private *priv, unsigned char rf_type,
>  			 u16 channel)
>  {
>  	void __iomem *iobase = priv->port_offset;
> @@ -685,7 +685,7 @@ bool RFvWriteWakeProgSyn(struct vnt_private *priv, unsigned char byRFType,
>  	unsigned char sleep_count = 0;
>  
>  	VNSvOutPortW(iobase + MAC_REG_MISCFFNDEX, 0);
> -	switch (byRFType) {
> +	switch (rf_type) {
>  	case RF_AIROHA:
>  	case RF_AL2230S:
>  
> diff --git a/drivers/staging/vt6655/rf.h b/drivers/staging/vt6655/rf.h
> index d3f2b8dd6afc..0939937d47a8 100644
> --- a/drivers/staging/vt6655/rf.h
> +++ b/drivers/staging/vt6655/rf.h
> @@ -60,7 +60,7 @@
>  bool IFRFbWriteEmbedded(struct vnt_private *priv, unsigned long dwData);
>  bool RFbSelectChannel(struct vnt_private *priv, unsigned char byRFType, u16 byChannel);

IMO, probably we can sync RFbSelectChannel as well with similar notation in another patch.

>  bool RFbInit(struct vnt_private *priv);
> -bool RFvWriteWakeProgSyn(struct vnt_private *priv, unsigned char byRFType, u16 channel);
> +bool RFvWriteWakeProgSyn(struct vnt_private *priv, unsigned char rf_type, u16 channel);
>  bool RFbSetPower(struct vnt_private *priv, unsigned int rate, u16 uCH);
>  bool RFbRawSetPower(struct vnt_private *priv, unsigned char byPwr,
>  		    unsigned int rate);
> 

Regards,

~Praveen.
