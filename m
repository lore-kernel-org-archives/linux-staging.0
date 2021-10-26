Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 948932C81
	for <linux-staging@lists.linux.dev>; Tue, 26 Oct 2021 13:54:33 +0000 (UTC)
Received: by mail-pf1-f175.google.com with SMTP id o133so14395749pfg.7
        for <linux-staging@lists.linux.dev>; Tue, 26 Oct 2021 06:54:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=oChekstjDnKzwBhdDuGFpefvR6xyGjCzFXwyqCTn1FE=;
        b=XeW0KWC1g2HthKjpNT6Yaa7UdsE2wcfbZJGAm3iHM8imLVv7mRRyyO+fjHbp6/WH4l
         9rDRx0ijihXYsd8v0me+dtnaXDZuxKT69tBgcO7R6XbECV28jK2FyG/r3wzepmkuz2Ux
         RWDa+s9CkJvxtCtH3v3TCbmb+1GU7CLQq7vK5Vay+pQxor+axFECWC9kFO20XVVKG+xO
         /H8fT47GvCuQEk/y1xuMaW4E2n+axYATV4GLzkaO61BEE9PrMoo/Jl0+NZrB2G5bM1eK
         zfJ6By/TxpSCaxfj+DOIodffhmFskTVBcifhFaKl27UYCFMFs60X8zru/3bVmSU8EXQ7
         qeCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=oChekstjDnKzwBhdDuGFpefvR6xyGjCzFXwyqCTn1FE=;
        b=69/BbW0Ebdfdw8Zn0tGiuCe5i1clezrvI/6WVLXJm6wakl07fMsrevKoAnCrrboWU/
         4vR1bRbcfqqjXWctO33kZmwmUFJyH7ZitTKb6klO33CLim2rGeH0FhLQf0egwSwljC8E
         T80vSV8u7c+/lBTDdY70MTaHriyrRN2r66OH2QJjLavq2ki2kldz/zlidwGuHBMqVIM/
         5djYJnoJuozOOSWJZGGCotUD9WbSZXtQoYSPeAIyScXiQGqk/XNfKa91Hbk22HQJk55r
         GvNOv0KnrlEPq+T3buQobluZt3ygTr9aZnw7DKHF3aFCr9tRBr10r9hn5JVaOminpqpA
         b2uw==
X-Gm-Message-State: AOAM532WpT+tnPS2NtBzSdCd7aYFSPMRdd+pmOb7Xh942goW7fKbJaw7
	5BYfR5GfStBFypktJ9ZARl0=
X-Google-Smtp-Source: ABdhPJyhgTllBI7U5qR46CHoSwZnv3/cMgyHOAU/WUk4kVqfiooh1NbqVsORYmPmu81CMg0f3yUZkQ==
X-Received: by 2002:a63:e24b:: with SMTP id y11mr18769979pgj.452.1635256473057;
        Tue, 26 Oct 2021 06:54:33 -0700 (PDT)
Received: from [192.168.1.122] ([122.181.48.19])
        by smtp.gmail.com with ESMTPSA id lb5sm1066507pjb.11.2021.10.26.06.54.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Oct 2021 06:54:32 -0700 (PDT)
Message-ID: <84add494-6e39-cdd9-96c6-04a0245ae11c@gmail.com>
Date: Tue, 26 Oct 2021 19:24:27 +0530
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [Outreachy kernel] [PATCH v2] staging: rtl8723bs: core: Refactor
 nested if-else
Content-Language: en-US
To: Kushal Kothari <kushalkothari285@gmail.com>, gregkh@linuxfoundation.org,
 fabioaiuto83@gmail.com, ross.schm.dev@gmail.com, hdegoede@redhat.com,
 marcocesati@gmail.com, fmdefrancesco@gmail.com,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 outreachy-kernel@googlegroups.com, mike.rapoport@gmail.com,
 kushalkothari2850@gmail.com
References: <20211026134253.7868-1-kushalkothari285@gmail.com>
From: Praveen Kumar <kpraveen.lkml@gmail.com>
In-Reply-To: <20211026134253.7868-1-kushalkothari285@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26-10-2021 19:12, Kushal Kothari wrote:
> Refactor nested if-else to avoid deep indentations. There is no change
> in the logic of the new code, however, now it is simple because it gets
> rid of five unnecessary else conditionals and it combines nested if into
> single if-else-if. This refactor also leads to fix warning detected by
> checkpatch.pl:
> WARNING: Too many leading tabs - consider code refactoring
> 
> Signed-off-by: Kushal Kothari <kushalkothari285@gmail.com>
> ---
> 
> Changes in v2: Fix the bug of not handling properly the else logic
> when p is not null in else-if. Also, reword the subject line and break 
> it up at 72 columns.
> 
>  drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 69 ++++++++-----------
>  1 file changed, 29 insertions(+), 40 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
> index 0f82f5031c43..267d853b1514 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
> @@ -1192,50 +1192,39 @@ unsigned int OnAssocReq(struct adapter *padapter, union recv_frame *precv_frame)
>  		p = pframe + WLAN_HDR_A3_LEN + ie_offset; ie_len = 0;
>  		for (;;) {
>  			p = rtw_get_ie(p, WLAN_EID_VENDOR_SPECIFIC, &ie_len, pkt_len - WLAN_HDR_A3_LEN - ie_offset);
> -			if (p) {
> -				if (!memcmp(p+2, WMM_IE, 6)) {
> -
> -					pstat->flags |= WLAN_STA_WME;
> -
> -					pstat->qos_option = 1;
> -					pstat->qos_info = *(p+8);
> -
> -					pstat->max_sp_len = (pstat->qos_info>>5)&0x3;
> -
> -					if ((pstat->qos_info&0xf) != 0xf)
> -						pstat->has_legacy_ac = true;
> -					else
> -						pstat->has_legacy_ac = false;
> -
> -					if (pstat->qos_info&0xf) {
> -						if (pstat->qos_info&BIT(0))
> -							pstat->uapsd_vo = BIT(0)|BIT(1);
> -						else
> -							pstat->uapsd_vo = 0;
> -
> -						if (pstat->qos_info&BIT(1))
> -							pstat->uapsd_vi = BIT(0)|BIT(1);
> -						else
> -							pstat->uapsd_vi = 0;
> -
> -						if (pstat->qos_info&BIT(2))
> -							pstat->uapsd_bk = BIT(0)|BIT(1);
> -						else
> -							pstat->uapsd_bk = 0;
> -
> -						if (pstat->qos_info&BIT(3))
> -							pstat->uapsd_be = BIT(0)|BIT(1);
> -						else
> -							pstat->uapsd_be = 0;
> -
> -					}
> -
> -					break;
> +			if (p && memcmp(p+2, WMM_IE, 6)) {
> +				p = p + ie_len + 2;
> +			} else if (p && !memcmp(p+2, WMM_IE, 6)) {

I would think of something,

for(;;) {
	p = rtw_get_ie(p, WLAN_EID_VENDOR_SPECIFIC, &ie_len, pkt_len - WLAN_HDR_A3_LEN - ie_offset);
	if (p) {
		if (memcmp(p+2, WMM_IE, 6)) {
			p = p + ie_len + 2;
			continue;
		}
		pstat->flags |= WLAN_STA_WME;
		...
	}
	/* Here we will reach only if p is NULL or its required entry */
	break;
}

Can you please check if this works well. Thanks.
Also, wanted to check how are you testing these changes ?

> +				pstat->flags |= WLAN_STA_WME;
> +				pstat->qos_option = 1;
> +				pstat->qos_info = *(p+8);
> +				pstat->max_sp_len = (pstat->qos_info>>5)&0x3;
> +
> +				pstat->has_legacy_ac = false;
> +				if ((pstat->qos_info&0xf) != 0xf)
> +					pstat->has_legacy_ac = true;
> +
> +				if (pstat->qos_info&0xf) {
> +					pstat->uapsd_vo = 0;
> +					if (pstat->qos_info&BIT(0))
> +						pstat->uapsd_vo = BIT(0)|BIT(1);
> +
> +					pstat->uapsd_vi = 0;
> +					if (pstat->qos_info&BIT(1))
> +						pstat->uapsd_vi = BIT(0)|BIT(1);
> +
> +					pstat->uapsd_bk = 0;
> +					if (pstat->qos_info&BIT(2))
> +						pstat->uapsd_bk = BIT(0)|BIT(1);
> +
> +					pstat->uapsd_be = 0;
> +					if (pstat->qos_info&BIT(3))
> +						pstat->uapsd_be = BIT(0)|BIT(1);
>  				}
> +				break;
>  			} else {
>  				break;
>  			}
> -			p = p + ie_len + 2;
>  		}
>  	}
>  
> 

Regards,

~Praveen.

