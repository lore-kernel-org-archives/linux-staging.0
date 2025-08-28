Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21D8B7082F
	for <linux-staging@lists.linux.dev>; Thu, 28 Aug 2025 13:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756386177; cv=none; b=nXe534zgH/KR79K8KnHCvl2JwtIog2Fgwch3gea0QKdVWe/8Mmymrkz+f+cEpVmqR19yiSpWFlvI8kr/1pvrcbTEjySaMD60MGWsWBvq3tnbC3VBaSOIYOVNpTipeX8UF2HTK5UyjUtLIxKN8ITgAgtUBttdo4iTgce4B45DrQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756386177; c=relaxed/simple;
	bh=IPlm5S5YIN4Ht1NgFPaU71FGHN88XGb9ttp9n4Ge5pE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N+aH8X44LL78PR1uopPm2s6traGa9IUOu9/JUctD0yoIcyTZcj8FMVYBTTaEeCoBEqky5qk4yvw+sSfbzfvSbBt0W0FzBPyJKzhY+rRhytsx0/Qo/SiwfcfACoIOzvVTU+g6h8eVTdbBdg3E69kYEL8Vuw3a6hlUN46YvrwQfWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TKyKwjP+; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TKyKwjP+"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3c985f13d45so643908f8f.1
        for <linux-staging@lists.linux.dev>; Thu, 28 Aug 2025 06:02:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756386174; x=1756990974; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sYAEu2X34yJC5N/vh2EYp2lnq4ZIeFPJb3ke4a7CquM=;
        b=TKyKwjP+bOIAAz2gGeGzAoningCVHS2UXt4w/ZxVcc4PmtEeJ1thdnYblS0vq4At2c
         ZSrvXsATnBAi3lU1xYRBbEro7rfhRmO9nE48KJFkZe4UzizEsb1FS8M4jSrYSZwO40gH
         6xGzkRx0EunvUKkkob+pHf1mE25mAbPFnTR/hdYziqOO5UpArA3psvxwppk19mZ9ujTF
         aYskooB8qDYbEfSYix2/gY7kIJS4kDvgF+Zy13S8Fz8eeocBkhxSmBgvM2EQMYvt1FEG
         Bl/aIhfYmpB0d+U1Mns+3o4kryZBuz2Tb+C0QC+NF3c8oHTnaqQzIV44N2wKcglXKWLz
         ZPmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756386174; x=1756990974;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sYAEu2X34yJC5N/vh2EYp2lnq4ZIeFPJb3ke4a7CquM=;
        b=IaSeiPiGVM5LoOqQLTwJtHv1h0R1VuyerGz3KjZh1VLmjrHM64t5UdCq63l/2EoyIW
         Sw5bGvrq0IwSNQg7IgSYJ8vIRAemw7Nt8JAoP40188JOE20B9I+Y9AA7lwV7Oa5wIKMN
         i5U85meqazCprnPG8h/HYfEgst52x3Ork0OTJM9yosDIJsIeRzCHuK3f7xCDJmkGLH3D
         H0+YrXKBFyaAFnEt/m8v4seUpg2pek89ie6KOylaTYKBQFfCbnFal0/n+OSIvia2NWTs
         IdMJY6junQRt+wS57BrBlvxINOy/vFdQMhO9dfxZKqzHRR+nO5IPFDsBjYPpa3ybQAhS
         k9ug==
X-Forwarded-Encrypted: i=1; AJvYcCWwta20DaS+r8iC4TIPXFs1vxHoN7a+3yhBmXuPnYr8GTG9JdfHue7M8WKbxeod+5EYbFeuD6WvqN2RuNdu@lists.linux.dev
X-Gm-Message-State: AOJu0YzUEMdtcaVnlqQXlKc0C/hhv5qA2U364JL0Nqh+5N3N5NGoxpfb
	qZkYkk/CIJLXK5iTh/yjVwwy2/9h/+/q2ccinZz1ig9mmb9VuiJDHU7kwpolVFtudpw=
X-Gm-Gg: ASbGnctCoJBqgwR4J8LifoH8sOBPsNbRmaZd7+PJysTM+TZqk4XkNfr8T7f+2a+4TKt
	X4MTKT6j8lqVsfRt01ABmHv1JvLVZbOjAvXDdoPdXbvS5SlUNtHn83Spa2z+P7dGwPo8fQljkE/
	/XmNhEsEQ6xp+ZW7H4ELAl2tEYn6xUJV5u6zq06+1woEX3uJQZ7nOnEVDcQvRCJdowDdxaBMIdC
	uXIja6gQlKpsGy/cZucSxgTyTk9ZCCZwK/6Fm0x1qyNsHaC1/FVProNaLTjMRFMby1Y/BxGg7A/
	M//YnY1iATzHFk1/UQmDdXaBCwOBhFB0dwStMo3qVE60DDgtYTfVcpMt85fE+0fYKbBO6W7P5ck
	PRg5rPmhtA7D7fWOxjmareqWqKhI=
X-Google-Smtp-Source: AGHT+IHQxbX6Q6u6vdwuoTlu7z5xflaVbY+bPcWTO7859yPEOlFmhSSfwk00Y727IE/eLiVBYP2PWA==
X-Received: by 2002:a05:6000:1448:b0:3c5:f975:5f97 with SMTP id ffacd0b85a97d-3cbb15ca266mr9271871f8f.16.1756386174285;
        Thu, 28 Aug 2025 06:02:54 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3cd935931ebsm4081897f8f.55.2025.08.28.06.02.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Aug 2025 06:02:53 -0700 (PDT)
Date: Thu, 28 Aug 2025 16:02:50 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: yingche <zxcv2569763104@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH] staging: rtl8723bs: fix fortify warnings by using
 struct_group
Message-ID: <aLBTehFv_VfOWEj3@stanley.mountain>
References: <20250828094537.884046-1-zxcv2569763104@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250828094537.884046-1-zxcv2569763104@gmail.com>

On Thu, Aug 28, 2025 at 05:45:37PM +0800, yingche wrote:
> Fix fortify_memcpy_chk warnings in rtw_BIP_verify() and
> rtw_mgmt_xmitframe_coalesce() functions by using struct_group
> to access consecutive address fields.
> 
> Changed memcpy calls to use &hdr->addrs instead of hdr->addr1
> when copying 18 bytes (addr1 + addr2 + addr3).
> 
> This resolves 'detected read beyond size of field' warnings
> by using the proper struct_group mechanism as suggested by
> the compiler.
> 
> Signed-off-by: yingche <zxcv2569763104@gmail.com>
> ---
>  drivers/staging/rtl8723bs/core/rtw_security.c | 2 +-
>  drivers/staging/rtl8723bs/core/rtw_xmit.c     | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_security.c b/drivers/staging/rtl8723bs/core/rtw_security.c
> index 8367fd15c6b1..314ec5894d47 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_security.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_security.c
> @@ -1363,7 +1363,7 @@ u32 rtw_BIP_verify(struct adapter *padapter, u8 *precvframe)
>  		ClearPwrMgt(BIP_AAD);
>  		ClearMData(BIP_AAD);
>  		/* conscruct AAD, copy address 1 to address 3 */
> -		memcpy(BIP_AAD+2, pwlanhdr->addr1, 18);
> +		memcpy(BIP_AAD + 2, &pwlanhdr->addrs, 18);

Use sizeof(pwlanhdr->addrs) instead of 18 and on the other too.

regards,
dan carpenter

