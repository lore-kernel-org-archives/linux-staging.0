Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A07E333C0
	for <linux-staging@lists.linux.dev>; Fri, 15 Apr 2022 15:44:32 +0000 (UTC)
Received: by mail-oo1-f44.google.com with SMTP id 65-20020a4a1a44000000b00333316787bbso1087221oof.3
        for <linux-staging@lists.linux.dev>; Fri, 15 Apr 2022 08:44:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=j5NRrlqKENHyQZylLDNmhFaG1FDwZsqTXLGE7hmnAc8=;
        b=nIfghUNNlsWFgGmG0oagSqP/rbsjGz/ayL9SQmTjbAiE2C1DHSX2ULMahq+z7vZLb6
         YXc0sI/ArX5P1V8v9UodN+l7wZcJB6/IP5c3TtMy134/Xak+A9QMJrpfjhjGfo/VrSW6
         FNOMApcWJ6mW3EgIrAhypitfUYrEcq8imVcAGqI99jdCAofwj3w3COo+GgEaUeweNySA
         WCLMr3aQRHbhTisAnZmG6/uGgl8YEKVaLsdYYURqoFTxX48hxoXYUV5yobQro/gUHnjV
         S3xoKFi7e4pv883P81fE1F7pASmY7sdsmIXzhbmpoXvSL1PmtQ9bkLvZvVE7dTV8H65S
         MKNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
         :subject:content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=j5NRrlqKENHyQZylLDNmhFaG1FDwZsqTXLGE7hmnAc8=;
        b=0yvLNmLxM4+xJ/+7uHqoG7Vhbw2MYYlMZAhl2MU/916IQtJzpRvntI/0WZm0bKqG9n
         Mp/nbX1bG3HJ4+ywWWCMEa1OI01Kk33w34FTUuyeHHGxmso+efpMJ0k0PZ9LXnb3DV9D
         KcJP7hQ/Hvqhbxbidj3GrzztHsvA1HD/bcJ5XUZjv3QvfUdFb0tfxkEVzAPrT1MkJQ0d
         Xaw/bPSpyuwlE4/eQ8QgR6PcEzg8ekUXxvLnrV6a9og1OxRwRGYfefBHfvOQFfRiXbIb
         P5ylHFuHb3jlVQUr/bD151ZFy87D1zYiaXLifjCZBgijFlSWiJxaVa053zTG7mQvq+K5
         7cRQ==
X-Gm-Message-State: AOAM530dULaWzhGzEFRvT9v+gWRAGNQu20/8cabvxiBRavzRjAasx+a7
	tGsIkzHxuHISExNN3EcK5J4=
X-Google-Smtp-Source: ABdhPJxlabBeRt5snh3dbVOSDxuMbJAGcychFWL5yqte5rUEYQhYAI9blLmXaExxNobKuQl7Eb9MQw==
X-Received: by 2002:a4a:d254:0:b0:324:b1bf:da28 with SMTP id e20-20020a4ad254000000b00324b1bfda28mr2428616oos.49.1650037471728;
        Fri, 15 Apr 2022 08:44:31 -0700 (PDT)
Received: from ?IPV6:2603:8090:2005:39b3::100e? (2603-8090-2005-39b3-0000-0000-0000-100e.res6.spectrum.com. [2603:8090:2005:39b3::100e])
        by smtp.gmail.com with ESMTPSA id c19-20020a9d7853000000b005cdbc0f02ccsm1176938otm.68.2022.04.15.08.44.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Apr 2022 08:44:31 -0700 (PDT)
Sender: Larry Finger <larry.finger@gmail.com>
Message-ID: <f4f8d381-9ee1-c504-c41c-97a9332066c9@lwfinger.net>
Date: Fri, 15 Apr 2022 10:44:30 -0500
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v3 3/8] staging: r8188eu: clean up comments in struct
 rt_firmware_hdr
Content-Language: en-US
To: Michael Straube <straube.linux@gmail.com>, gregkh@linuxfoundation.org
Cc: phil@philpotter.co.uk, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20220415121023.11564-1-straube.linux@gmail.com>
 <20220415121023.11564-4-straube.linux@gmail.com>
From: Larry Finger <Larry.Finger@lwfinger.net>
In-Reply-To: <20220415121023.11564-4-straube.linux@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/15/22 07:10, Michael Straube wrote:
> The comments in struct rt_firmware_hdr are not needed.
> Remove them.
> 
> Signed-off-by: Michael Straube <straube.linux@gmail.com>
> ---
> v3:
> - no changes
> 
> v2:
> - no changes
> 
>   drivers/staging/r8188eu/core/rtw_fw.c | 37 ++++++++-------------------
>   1 file changed, 11 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/staging/r8188eu/core/rtw_fw.c b/drivers/staging/r8188eu/core/rtw_fw.c
> index 7cd08268f3b9..323e0c634c4e 100644
> --- a/drivers/staging/r8188eu/core/rtw_fw.c
> +++ b/drivers/staging/r8188eu/core/rtw_fw.c
> @@ -14,37 +14,22 @@
>   	(le16_to_cpu(_fwhdr->Signature) & 0xFFF0) == 0x2300 ||	\
>   	(le16_to_cpu(_fwhdr->Signature) & 0xFFF0) == 0x88E0)
>   
> -/*  This structure must be careful with byte-ordering */
> -
>   struct rt_firmware_hdr {
> -	/*  8-byte alinment required */
> -	/*  LONG WORD 0 ---- */
> -	__le16		Signature;	/* 92C0: test chip; 92C,
> -					 * 88C0: test chip; 88C1: MP A-cut;
> -					 * 92C1: MP A-cut */
> -	u8		Category;	/*  AP/NIC and USB/PCI */
> -	u8		Function;	/*  Reserved for different FW function
> -					 *  indcation, for further use when
> -					 *  driver needs to download different
> -					 *  FW for different conditions */
> -	__le16		Version;	/*  FW Version */
> -	u8		Subversion;	/*  FW Subversion, default 0x00 */
> +	__le16		Signature;
> +	u8		Category;
> +	u8		Function;
> +	__le16		Version;
> +	u8		Subversion;
>   	u8		Rsvd1;
> -
> -	/*  LONG WORD 1 ---- */
> -	u8		Month;	/*  Release time Month field */
> -	u8		Date;	/*  Release time Date field */
> -	u8		Hour;	/*  Release time Hour field */
> -	u8		Minute;	/*  Release time Minute field */
> -	__le16		RamCodeSize;	/*  The size of RAM code */
> +	u8		Month;
> +	u8		Date;
> +	u8		Hour;
> +	u8		Minute;
> +	__le16		RamCodeSize;
>   	u8		Foundry;
>   	u8		Rsvd2;
> -
> -	/*  LONG WORD 2 ---- */
> -	__le32		SvnIdx;	/*  The SVN entry index */
> +	__le32		SvnIdx;
>   	__le32		Rsvd3;
> -
> -	/*  LONG WORD 3 ---- */
>   	__le32		Rsvd4;
>   	__le32		Rsvd5;
>   };

The comments "LONG WORD" are useless, but the comments describing the fields are 
still useful. I do not like this patch.

Will your next step be stripping ALL comments from the driver? The source would 
be a lot smaller that way! :)

Larry

