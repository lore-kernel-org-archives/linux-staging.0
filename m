Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A5A83B95E0
	for <linux-staging@lists.linux.dev>; Fri, 31 Jul 2026 11:04:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785495864; cv=none; b=OKVjrdNHrbaC1hY2aQsVMV9zoudACI10VkMzjT3lw66Rs7bl/qjh2rOrApezBj5L6s4MKPJqvIT2B9laKfWxGcTrCdVHtG88uWnORTk+QOP7OAWFx9DtYn7taEduwuYwOB7/PRqvqwkHfINMld8XYHDmYk88EOaEyMnORs3i7zY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785495864; c=relaxed/simple;
	bh=Ip1Tc14WQ8kWKUd64ygJloWb2KjHGPnwCnBSmgVeAfs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S1cJDpp0d7BS3EyUKN0naj6XDBbjrdmj4hBygIIVUyDbaD+gNNE8aHNXogyhRvwNOR7mwgXWSoypQS/NOnSzs9flG6+a2OOGRHJMXRgQzBKP+icYqaCIiwFYwLBjmvLGFFPJI7RPt7a4VVZKZepvTHZ3qnU8n7xhoEWpP0hcmaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P10fcAol; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P10fcAol"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c15d3cd51b2so104512066b.3
        for <linux-staging@lists.linux.dev>; Fri, 31 Jul 2026 04:04:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785495861; x=1786100661; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5k2RLQqC46IoD+6vTDAv3WcLwbLeEg+LzHDsLOj7ryk=;
        b=P10fcAolPvVMKmfHcudo3J26qWLZit7LIwoCQKGPrI7oskFFjDKsidOJQutgRPuCpZ
         mhdQZ/dFkpHTAeVQY6DX4Vjmkfjf6SlwlfFTWELyjLArAToAwB8R+YHG4JNeQ/9TdkCl
         rZFRbRvporB3mE5+RXxIxiUr0iDUN0csAzGeValhd5q8Z+j3AYvpmguKIRk/1i/Al/NM
         IMED4lhfHbXZwGjbqzmFVp34IDv1PzIgXUeZTu1w/KERyJn95HXwchFB2L6DfmXPCepF
         1zA59O5bwzHUt7wy01sos7tx6OQ1uifMb00BVfaFy70VgPFpvRTfw+q4zgqXzbU2evU0
         gv6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785495861; x=1786100661;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5k2RLQqC46IoD+6vTDAv3WcLwbLeEg+LzHDsLOj7ryk=;
        b=M2Q6LktuDCjntbujNbqiYQ6oP4cRALRR981VEXPRNp42mlQ6zDz5AlzjPqwYjUdOfT
         wrSzq50Mu5tgzvYmptSGANu0t1c3mMUD/NrPIFsi7fgm7PuE6dRuZK8fipFR0/Mu5B2Q
         VYOC0fxasSI55OpcvupbmTcak6aWbveFxx6ZC6dP0pO6lYGE/1EKszPjwbSa31FHFmzs
         wabtx8T9lqEHuiHJqt2h1YFgHY4Rsnnf8es+sFzZjeXZV+MxA9SAIfUOLuebiWqpcekv
         tqBb07HUfpcimXkNcNpm8HAI6QtOuljMp1b3aVj8omGRU0o48jpIGN6qQjX5M1yenmJA
         jhlg==
X-Forwarded-Encrypted: i=1; AHgh+RocFsp/BFedTV/sZ6nZkHdL/jls/RtMc854LhMc0qpeyR2WQQwuqbeYcXH2dqBbYnGrHJoNatgBBSzN+n56@lists.linux.dev
X-Gm-Message-State: AOJu0YzLbRwb0Fo9Ys7wWdTYNWH8eQy1apuSgEGr8ObDz3HlJGC7cj8K
	YUZkRDylUEV382qc59YehFA0lcmnPtYiH7qu76tlwuiUxKqdBcUVs54puwO2uZ06LFQ=
X-Gm-Gg: AR+sD13TkmzhHR/IxCySBdEy3oYA+8VYpNPgT8CK1804reZlmeI/x5C+RWoVAusCHFr
	ZtZUiBiiL0Hz9p71wyuyAeqgv5KCavJUoOh9+MqOaJ4744bcB+uN+gNEyICn/BH8hFpEUWrqIHD
	D0r4MclPquBaKTFUHsnT7wSGnBbDimMqlBqFZxT7EVmvtG3UDtKm4yUjgaWrNjmb9SfWC4QZ5Lg
	tlk8wirRt8iNhX8FugxE9gGKmz3do2tYMCuERQ6SLc8nxPKW6X5mfsqqSlrLlhe49wxdG5JPUKI
	Ug1ANdZ4S/lOeEW/lMRu3XZneCjMJkfTnCCxWX9lnYFVfHKk8U30CVB5r5fSTRcWfJ0/n568Ms7
	dSNRf7AoA6jctlIAWugvMrGg6WbkPdx0+Ob1iYR/NYbK7W2+V5bp7IhrQPfX0Pl1KlwVmbSd1F+
	DE/qPoJWoMcGZZCN5vOFq+t8qaZKcc736dL8C6zXAyrQArI1Ms3IggFetX
X-Received: by 2002:a17:907:d1d:b0:c16:7402:1abc with SMTP id a640c23a62f3a-c1fd26e85fcmr97603066b.47.1785495861256;
        Fri, 31 Jul 2026 04:04:21 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1fd44ebf2esm95392366b.44.2026.07.31.04.04.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 04:04:20 -0700 (PDT)
Date: Fri, 31 Jul 2026 14:04:16 +0300
From: Dan Carpenter <error27@gmail.com>
To: Hungyu Lin <dennylin0707@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] staging: rtl8723bs: convert dump mgnt path to errno
Message-ID: <amyBMId0r72hMg50@stanley.mountain>
References: <20260731070546.20959-1-dennylin0707@gmail.com>
 <20260731070546.20959-4-dennylin0707@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260731070546.20959-4-dennylin0707@gmail.com>

On Fri, Jul 31, 2026 at 07:05:46AM +0000, Hungyu Lin wrote:
> Convert dump_mgntframe_and_wait() to return errno-style values and
> update its declaration in rtw_mlme_ext.h.
> 
> Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
> ---
>  drivers/staging/rtl8723bs/core/rtw_mlme_ext.c    | 13 ++++---------
>  drivers/staging/rtl8723bs/include/rtw_mlme_ext.h |  2 +-
>  2 files changed, 5 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
> index 0027f9333738..da74184fd07e 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
> @@ -1971,9 +1971,9 @@ void dump_mgntframe(struct adapter *padapter, struct xmit_frame *pmgntframe)
>  	rtw_hal_mgnt_xmit(padapter, pmgntframe);
>  }
>  
> -s32 dump_mgntframe_and_wait(struct adapter *padapter, struct xmit_frame *pmgntframe, int timeout_ms)
> +int dump_mgntframe_and_wait(struct adapter *padapter, struct xmit_frame *pmgntframe, int timeout_ms)

This is like patch 1 where nothing checks for errors.  I feel like
the right thing here is to change it to a void function.  (Based on
the "dump" in the name and not based on careful reading).

Either way it probably should have an explanation in the commit
message.

regards,
dan carpenter

