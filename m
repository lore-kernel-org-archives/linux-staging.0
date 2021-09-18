Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F72D72
	for <linux-staging@lists.linux.dev>; Sat, 18 Sep 2021 15:24:01 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id g21so41851519edw.4
        for <linux-staging@lists.linux.dev>; Sat, 18 Sep 2021 08:24:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=/PVHZeQvuCdJZw/7spyFDTgAV+tqTP3cubrD/AsvRUE=;
        b=g3G1y6iqalMUdxu2CHB+pDSTfXBWaVTyIT14AiI+GkxoKfEKO5deyRk3NhFk4nnbi4
         veFbn1FGSQMHNS/Kpd0pbpJNl0Pb30U6NehA17r/SrthCklGoP92qKGLKHchspDWK1T0
         uNDuS70fBhJ4gjQmrfnqj3MAjd7cdn0FPuMmdQ3dITDGUAjHJu/inMTB79hhGq+iJg/k
         IBrYTYyyCDgpSkLQTt5J+tOW/lRt9ed/M3Ov1W/urE5irU2BRqspRSvjmoTrfj8CYWrA
         Kx4KTJzJJ4GZbsvnrOKQxuFu9XrM2+33aL6gsY4n0ji77LUFYOMgCW7BE46zAWmIZu8i
         xOHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=/PVHZeQvuCdJZw/7spyFDTgAV+tqTP3cubrD/AsvRUE=;
        b=sh79iJOL5GFLrGGJmL7PxrYVvNt7nMBSmfi3AG09UmQAX7ER9G/U2TE0nryV66Q7TG
         MJYweNS1h80erVXKku/+daw2mFcza18KsCZ3MGZn3EAA8/o3wWd/a3MFu4eU+EJbdTq0
         fUQixMocpL34HMV8Ig4cFR5tPjYWCoVn6mhFI/uIahtFliK9p5MhNRt2w7jFNdrZV0LH
         fZkgbqos3FhVuE3YrfGdLtqZFj1ji8bYg7lt0xxfmTnKQMQjcFBS9Ax1l7RPf0vL24a8
         P6+KELHm8LLfR+oDlemrnwAh6rPebn+b0Ch7R/Q2oU/Ei2K+oB6E6sjvGdGpNNx2HnEJ
         tm2A==
X-Gm-Message-State: AOAM532U/o0Zo1u1c/bbEe8Pn1IAIJM2oSL/4G9UH/LHpd1zFp78tYMI
	CR9F/og/fYny9KWC/SMcourS93IzCssc/w==
X-Google-Smtp-Source: ABdhPJxyOJoPGKkmBorV+l/KTBon5gA3f+YV/V2WnySmLJsQeY152oV20/A8mhK3XxEPGkyZE6P9Tw==
X-Received: by 2002:a17:906:688a:: with SMTP id n10mr18642709ejr.389.1631978639707;
        Sat, 18 Sep 2021 08:23:59 -0700 (PDT)
Received: from ?IPV6:2a02:8108:96c0:3b88::cde? ([2a02:8108:96c0:3b88::cde])
        by smtp.gmail.com with ESMTPSA id i13sm4164751edc.48.2021.09.18.08.23.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 18 Sep 2021 08:23:59 -0700 (PDT)
Message-ID: <202aba98-2e54-9728-3bcb-2f195062a535@gmail.com>
Date: Sat, 18 Sep 2021 17:23:58 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH] staging: r8188eu: remove rtw_free_pwrctrl_priv prototype
Content-Language: en-US
To: Martin Kaiser <martin@kaiser.cx>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
 Phillip Potter <phil@philpotter.co.uk>, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20210918141141.28547-1-martin@kaiser.cx>
From: Michael Straube <straube.linux@gmail.com>
In-Reply-To: <20210918141141.28547-1-martin@kaiser.cx>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/18/21 16:11, Martin Kaiser wrote:
> The rtw_free_pwrctrl_priv has already been removed in commit 6729e7541934
> ("staging: r8188eu: _free_pwrlock is empty"). Remove the prototype as well.
> 
> Signed-off-by: Martin Kaiser <martin@kaiser.cx>
> ---
>   drivers/staging/r8188eu/include/rtw_pwrctrl.h | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/staging/r8188eu/include/rtw_pwrctrl.h b/drivers/staging/r8188eu/include/rtw_pwrctrl.h
> index a77fb76a0b09..e412ef71b54b 100644
> --- a/drivers/staging/r8188eu/include/rtw_pwrctrl.h
> +++ b/drivers/staging/r8188eu/include/rtw_pwrctrl.h
> @@ -134,7 +134,6 @@ struct pwrctrl_priv {
>   				       (pwrctrl)->pwr_state_check_interval)
>   
>   void rtw_init_pwrctrl_priv(struct adapter *adapter);
> -void rtw_free_pwrctrl_priv(struct adapter *adapter);
>   
>   void rtw_set_ps_mode(struct adapter *adapter, u8 ps_mode, u8 smart_ps,
>   		     u8 bcn_ant_mode);
> 

Looks good to me.

Acked-by: Michael Straube <straube.linux@gmail.com>

Thanks,
Michael
