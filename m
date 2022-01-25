Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19A4D168
	for <linux-staging@lists.linux.dev>; Tue, 25 Jan 2022 19:03:10 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id n8so18222869lfq.4
        for <linux-staging@lists.linux.dev>; Tue, 25 Jan 2022 11:03:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=9gdYrrg8x04ug7UjMhLRJzA5TbsZ5ufvAwyd3dzX5Zc=;
        b=OF+M1jImGD65G86hbWx/Mp3H9qEXxLV6k58BVfn8Fjjs1FiaBFqIT77J5aMGtfagM4
         az2NcbOyd4h6lQUnPrnfF8XIpVanD2j0EOO4R8vGloNCPoJORMv+o1L3lFS8q0uvtO1f
         CN2PaQQj0UHtPbu7W7GlWZcUmNyRhDI528C8mqrlW5e1xdY9bfEIS/1+Q1qlf9/9k8j3
         gnUoBZa3B6CsmR25OSDIXmWEUYUZYNzJwiNKcqZZoqjfWkChGMmnbjH4JpHwjiIySyw1
         TbBTv6FWUEkiCGIi4ZmtXexdsz480MFXTpDF8hlS1Yac7RYIz/P+8RGvKgCEXadxcAaE
         zvPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=9gdYrrg8x04ug7UjMhLRJzA5TbsZ5ufvAwyd3dzX5Zc=;
        b=sy9e0KYa4KPOf65czIO3WtSbX5eOneBP8WQVQLmjh4U2Q9N/1hIk9/lX5S4TYWU0MG
         CYsun/HQokvtGKdrB7QUAspw6VTmypN2PZb/DS1w62Kl9p2VhDKnAEuXy6qSF7P5uopX
         EUfND62vxfJiCRmZ4KiG6ydaOOyt1T+fOXOuefnxlJvSXt2Q0ZuVlgOhCV3ymNRDFck3
         vukEtO4d37yxhiCvKdYLAyLRajzC76E5IUMq5j/PE2aOJKR7MzRsmjTlvRPkO/we/HdR
         cH7/h4Zf1kYrrpAoszO7oNGCcIAoh/7hZxXGlZCfqsQI/sO/9GH2eJlufnRsGgI9oYpg
         gKXQ==
X-Gm-Message-State: AOAM530JdWVjNaRzKInUvBDRsHgRos+A/aRKAcwCA761WOjbbehjeqs6
	i1fKDevUJtcDj91E+S8y49E=
X-Google-Smtp-Source: ABdhPJzVxK69QJVS1EwxnFny0TDTGSI/9M1GtVkBMAEfugUNeg1wTJAGYE5M5ex2UsChGmeDqpZSnw==
X-Received: by 2002:a05:6512:68a:: with SMTP id t10mr1657328lfe.10.1643137388089;
        Tue, 25 Jan 2022 11:03:08 -0800 (PST)
Received: from [192.168.1.11] ([94.103.227.208])
        by smtp.gmail.com with ESMTPSA id s4sm899971lfb.215.2022.01.25.11.03.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Jan 2022 11:03:07 -0800 (PST)
Message-ID: <a681a562-eb41-9dc8-703a-5b235c15a3a1@gmail.com>
Date: Tue, 25 Jan 2022 22:03:06 +0300
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 06/10] staging: r8188eu: remove DBG_88E calls from
 os_dep/ioctl_linux.c
Content-Language: en-US
To: Phillip Potter <phil@philpotter.co.uk>, gregkh@linuxfoundation.org
Cc: dan.carpenter@oracle.com, Larry.Finger@lwfinger.net,
 straube.linux@gmail.com, martin@kaiser.cx, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20220124224415.831-1-phil@philpotter.co.uk>
 <20220124224415.831-7-phil@philpotter.co.uk>
From: Pavel Skripkin <paskripkin@gmail.com>
In-Reply-To: <20220124224415.831-7-phil@philpotter.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Phillip,

On 1/25/22 01:44, Phillip Potter wrote:
> Remove all DBG_88E calls from os_dep/ioctl_linux.c, as they do not
> conform to kernel coding standards and are superfluous. Also restructure
> where appropriate to remove no longer needed code left behind by removal
> of these calls. This will allow the eventual removal of the DBG_88E macro
> itself.
> 
> Signed-off-by: Phillip Potter <phil@philpotter.co.uk>
> ---

[code snip]

> @@ -3746,7 +3541,6 @@ static int rtw_dbg_port(struct net_device *dev,
>   			u32 write_num = extra_arg;
>   
>   			int i;
> -			u16 final;
>   			struct xmit_frame	*xmit_frame;
>   
>   			xmit_frame = rtw_IOL_accquire_xmit_frame(padapter);
> @@ -3760,11 +3554,7 @@ static int rtw_dbg_port(struct net_device *dev,
>   			if (rtl8188e_IOL_exec_cmds_sync(padapter, xmit_frame, 5000, 0) != _SUCCESS)
>   				ret = -EPERM;
>   
> -			final = rtw_read16(padapter, reg);
> -			if (start_value + write_num - 1 == final)
> -				DBG_88E("continuous IOL_CMD_WW_REG to 0x%x %u times Success, start:%u, final:%u\n", reg, write_num, start_value, final);
> -			else
> -				DBG_88E("continuous IOL_CMD_WW_REG to 0x%x %u times Fail, start:%u, final:%u\n", reg, write_num, start_value, final);
> +			rtw_read16(padapter, reg);
>   		}
>   			break;

I see, that you somewhere removes reads and somewhere leaves them. 
What's the difference? I saw, that one of the places has the comment, 
that asks not to remove the read, but others do not have such comment

I can point to few places in 2 and 4 patches where you have removed reads.



[code snip]

> @@ -4014,16 +3664,8 @@ static int rtw_dbg_port(struct net_device *dev,
>   			{
>   				u32 odm_flag;
>   
> -				if (0xf == extra_arg) {
> +				if (extra_arg == 0xf) {
>   					GetHalDefVar8188EUsb(padapter, HAL_DEF_DBG_DM_FUNC, &odm_flag);
> -					DBG_88E(" === DMFlag(0x%08x) ===\n", odm_flag);
> -					DBG_88E("extra_arg = 0  - disable all dynamic func\n");
> -					DBG_88E("extra_arg = 1  - disable DIG- BIT(0)\n");
> -					DBG_88E("extra_arg = 2  - disable High power - BIT(1)\n");
> -					DBG_88E("extra_arg = 3  - disable tx power tracking - BIT(2)\n");
> -					DBG_88E("extra_arg = 4  - disable BT coexistence - BIT(3)\n");
> -					DBG_88E("extra_arg = 5  - disable antenna diversity - BIT(4)\n");
> -					DBG_88E("extra_arg = 6  - enable all dynamic func\n");
>   				} else {
>   					/*	extra_arg = 0  - disable all dynamic func
>   						extra_arg = 1  - disable DIG
> @@ -4032,51 +3674,17 @@ static int rtw_dbg_port(struct net_device *dev,
>   					*/
>   					SetHalDefVar8188EUsb(padapter, HAL_DEF_DBG_DM_FUNC, &extra_arg);
>   					GetHalDefVar8188EUsb(padapter, HAL_DEF_DBG_DM_FUNC, &odm_flag);
> -					DBG_88E(" === DMFlag(0x%08x) ===\n", odm_flag);
>   				}
>   			}
>   			break;
>   

Is odm_flag needed now? Seems like it was used only for printing random 
debug info

>   		case 0xfd:
>   			rtw_write8(padapter, 0xc50, arg);
> -			DBG_88E("wr(0xc50) = 0x%x\n", rtw_read8(padapter, 0xc50));
>   			rtw_write8(padapter, 0xc58, arg);
> -			DBG_88E("wr(0xc58) = 0x%x\n", rtw_read8(padapter, 0xc58));
> -			break;
> -		case 0xfe:
> -			DBG_88E("rd(0xc50) = 0x%x\n", rtw_read8(padapter, 0xc50));
> -			DBG_88E("rd(0xc58) = 0x%x\n", rtw_read8(padapter, 0xc58));
> -			break;
> -		case 0xff:
> -			DBG_88E("dbg(0x210) = 0x%x\n", rtw_read32(padapter, 0x210));
> -			DBG_88E("dbg(0x608) = 0x%x\n", rtw_read32(padapter, 0x608));
> -			DBG_88E("dbg(0x280) = 0x%x\n", rtw_read32(padapter, 0x280));
> -			DBG_88E("dbg(0x284) = 0x%x\n", rtw_read32(padapter, 0x284));
> -			DBG_88E("dbg(0x288) = 0x%x\n", rtw_read32(padapter, 0x288));
> -
> -			DBG_88E("dbg(0x664) = 0x%x\n", rtw_read32(padapter, 0x664));
> -
> -			DBG_88E("\n");
> -
> -			DBG_88E("dbg(0x430) = 0x%x\n", rtw_read32(padapter, 0x430));
> -			DBG_88E("dbg(0x438) = 0x%x\n", rtw_read32(padapter, 0x438));
> -
> -			DBG_88E("dbg(0x440) = 0x%x\n", rtw_read32(padapter, 0x440));
> -
> -			DBG_88E("dbg(0x458) = 0x%x\n", rtw_read32(padapter, 0x458));
> -
> -			DBG_88E("dbg(0x484) = 0x%x\n", rtw_read32(padapter, 0x484));
> -			DBG_88E("dbg(0x488) = 0x%x\n", rtw_read32(padapter, 0x488));
> -
> -			DBG_88E("dbg(0x444) = 0x%x\n", rtw_read32(padapter, 0x444));
> -			DBG_88E("dbg(0x448) = 0x%x\n", rtw_read32(padapter, 0x448));
> -			DBG_88E("dbg(0x44c) = 0x%x\n", rtw_read32(padapter, 0x44c));
> -			DBG_88E("dbg(0x450) = 0x%x\n", rtw_read32(padapter, 0x450));
>   			break;
>   		}

And here you also removes the reads. I guess, some kind of magic pattern 
is used




With regards,
Pavel Skripkin
