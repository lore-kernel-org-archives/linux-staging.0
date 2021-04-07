Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39ACE6D0D
	for <linux-staging@lists.linux.dev>; Wed,  7 Apr 2021 09:30:52 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id b7so26561984ejv.1
        for <linux-staging@lists.linux.dev>; Wed, 07 Apr 2021 02:30:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=M+6GqVIlsluT7FdXsJJtXy1o3ui55E+ovW1gQ+7xpPg=;
        b=nNHDkWuLX/g4T/aj4MaRROG2kPyKXlNHUwQt84bH3xItx7AxDuTmIv4w+f2xmUKMBX
         zFtve5MOj9P8EvjMKt9gJsEhsnSzOPlfP6RX2dKfbsw1Fui+4J10fjo6Kz2stsucJ8tb
         FsFIA0pI66uvtx0ZTTnv060kr+nGzWYCc+H8A1VRLvAsR0GSfb5mujFyEHrAFnbaWyw9
         GSeMaFsQsZHE1ELJJ7cGuJSJk756gN9WQFxAonq9DJ80ZoIncCk9dm94aPv0ExpCC5Ob
         cJqx9Ah/iPXzeS4/bPfdoScxHBZbYrdncz9gx2ruUo3/ra0PW+f3cLd/PhRMX1sJfmKS
         xQxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=M+6GqVIlsluT7FdXsJJtXy1o3ui55E+ovW1gQ+7xpPg=;
        b=Wf3Cuk2Qwdb9pgT08QHwk8Y6C1JiwIegRWExgH1x/w/AJhfo0jL31/mcO7wuDE7T1m
         3lEsPNxCkkZlMrJQLDKt+hTAvDDaQMlnlxC6qQdtfgOqkuWLPZSv0B4Z8XYIQvqH/gnu
         5mfOMgShnmQz2MoiN3CoLP/xzgIATqq4glSHhX3urQuWSUBeTu8ILcg9Immp8EJQs7E6
         qeZ0g0gaB6HOSZc8UgGsLPDt1t8E5LGkBbBSctzLHQfQvPGsJZdCQpdH8BGTthXzU7gt
         p2Xd1gY6/Ot6JGfkls/eb4/iFjjgrDKx576tksFXWglSkzNoqkFjssIwgx+VoIkd2dnm
         FBwA==
X-Gm-Message-State: AOAM530XHao3vSxwKtY2ZAz4LGd5q17GjWOGtneVEoS7TFm5DakJjM+2
	07siVXoQzEXe0lUfyN2a8gE=
X-Google-Smtp-Source: ABdhPJx2HalNQq9m4Ca4QrilDp2cOmq8egJ4MaGEcMb1zYgwOdLqv0iYKd2NZlJFi1qEILwH+YdEDg==
X-Received: by 2002:a17:906:4a5a:: with SMTP id a26mr2736461ejv.8.1617787850692;
        Wed, 07 Apr 2021 02:30:50 -0700 (PDT)
Received: from localhost.localdomain (host-79-42-91-147.retail.telecomitalia.it. [79.42.91.147])
        by smtp.gmail.com with ESMTPSA id lm24sm12287231ejb.53.2021.04.07.02.30.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Apr 2021 02:30:50 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: gregkh@linuxfoundation.org, outreachy-kernel@googlegroups.com, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [Outreachy kernel] [PATCH v2] staging: rtl8723bs: hal: Remove camelcase
Date: Wed, 07 Apr 2021 11:30:48 +0200
Message-ID: <2654358.BPhQiNMsfF@localhost.localdomain>
In-Reply-To: <20210407091752.27350-1-fmdefrancesco@gmail.com>
References: <20210407091752.27350-1-fmdefrancesco@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday, April 7, 2021 11:17:52 AM CEST Fabio M. De Francesco wrote:
> Remove camelcase. Issue detected by checkpatch.pl. The symbols aren't
> used in other files, so this change doesn't break the driver's code.
> 
> Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
> ---
> 
> This is a necessary v2 patch because v1 cannot anymore apply to the current staging/testing tree
> 
>  drivers/staging/rtl8723bs/hal/Hal8723BReg.h | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/hal/Hal8723BReg.h b/drivers/staging/rtl8723bs/hal/Hal8723BReg.h
> index b9aca99478db..616d20106392 100644
> --- a/drivers/staging/rtl8723bs/hal/Hal8723BReg.h
> +++ b/drivers/staging/rtl8723bs/hal/Hal8723BReg.h
> @@ -112,7 +112,7 @@
>  #define REG_RSVD3_8723B					0x0168
>  #define REG_C2HEVT_MSG_NORMAL_8723B	0x01A0
>  #define REG_C2HEVT_CMD_SEQ_88XX		0x01A1
> -#define REG_C2hEVT_CMD_CONTENT_88XX	0x01A2
> +#define REG_C2HEVT_CMD_CONTENT_88XX	0x01A2
>  #define REG_C2HEVT_CMD_LEN_88XX		0x01AE
>  #define REG_C2HEVT_CLEAR_8723B			0x01AF
>  #define REG_MCUTST_1_8723B				0x01C0
> @@ -429,13 +429,13 @@
>  #define	IMR_RXFOVW_8723B		BIT8	/*  Receive FIFO Overflow */
>  
>  /* 2 ACMHWCTRL 0x05C0 */
> -#define	AcmHw_HwEn_8723B		BIT(0)
> -#define	AcmHw_VoqEn_8723B		BIT(1)
> -#define	AcmHw_ViqEn_8723B		BIT(2)
> -#define	AcmHw_BeqEn_8723B		BIT(3)
> -#define	AcmHw_VoqStatus_8723B		BIT(5)
> -#define	AcmHw_ViqStatus_8723B		BIT(6)
> -#define	AcmHw_BeqStatus_8723B		BIT(7)
> +#define	ACMHW_HWEN_8723B		BIT(0)
> +#define	ACMHW_VOQEN_8723B		BIT(1)
> +#define	ACMHW_VIQEN_8723B		BIT(2)
> +#define	ACMHW_BEQEN_8723B		BIT(3)
> +#define	ACMHW_VOQSTATUS_8723B		BIT(5)
> +#define	ACMHW_VIQSTATUS_8723B		BIT(6)
> +#define	ACMHW_BEQSTATUS_8723B		BIT(7)
>  
>  /*        8195 (RCR) Receive Configuration Register	(Offset 0x608, 32 bits) */
>  #define	RCR_TCPOFLD_EN			BIT25	/*  Enable TCP checksum offload */
> 
I'm sorry I put the wrong patch version number in the subject and in the body.
Please diregard this patch. I'm about to send v4.

Thanks,

Fabio




