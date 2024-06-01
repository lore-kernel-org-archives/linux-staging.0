Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10EF510949
	for <linux-staging@lists.linux.dev>; Sat,  1 Jun 2024 14:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717252052; cv=none; b=eMeAV5haEsXMs3gsl9Pgy3vOwGqWzf/Lo22wVx3+1X8p+dKLfuv2FiqyNnavl4qlP4H3Q/sLru/8360fgvhVrJ6gaz54+TQ5pGEvSnBgxqs4g/tl1m5Ye2gf9OWljVr2zT1DHrHH60xGdPuxR3XuZE073xyps79k1M94FdD5J64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717252052; c=relaxed/simple;
	bh=xTU0e5/IlLVMuoj82/8I3hETYtxgCRl8P/CVmfvLsAg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=g6zgoMjmf/uFsGi65k/KzvA3LTTmFQS51gvtwoSngOsbK0PnWIufOBUE7aA32keVarpnwno430GmNciuhlC/wx6rWN+t2DqEBgpn0kYZK/QjclA8IgttGID2fznIugPEDVUmUwcLMwVG+ue/2xj48djdPi9DTV6rZ+plwtZI/1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mGRVkdBl; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mGRVkdBl"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-57a2bee377dso230889a12.1
        for <linux-staging@lists.linux.dev>; Sat, 01 Jun 2024 07:27:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717252049; x=1717856849; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DKjdNbaQgpEtIGRdS/gMdImnNGt/YsqABekgtyYfmkQ=;
        b=mGRVkdBll7DeJpyZJssXbwEt8FeS+Kq4YXWEAhx+2eToI+Z09QOGCGYTasAHcLD8QP
         carreB3gMzETfX/h+zkvlm1YwWGRTkY03fOlaTk/stQN6hFSkr5lfrha2lySpFzTM6W8
         tXfMfHOrQdkt+Ujt8lKtTZ2V9P1YFO0pC3Ie3m2s3aRHe+DZ75QcFoGHmS8kr1FzREcH
         mmILP6qaeAP6R/9Y/S5t+ruTcl1ZL3qvJV1BiChl5mPy9dqvCS7othUWNLKM/iKxCIkB
         tJBxZJEgHaKU5LNvP18Mz/381YimOEoYWEJYfUTHevmZ93ufvg/21CHMQ+0xu+6mv2VF
         eEOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717252049; x=1717856849;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DKjdNbaQgpEtIGRdS/gMdImnNGt/YsqABekgtyYfmkQ=;
        b=msknDmaTQkqpZC8j4eq4/2crXwyG5/pY/ay1R4b5fG1auys2hsWxI/Xp3xv3FJkf2E
         wxpE09CDQOKEtkByuFhQdmm78jrlPJJH34If7DeNHXCllE2ZFpioUU13lVFQxjtd8Mgj
         sjQXyUukcYNCLLErmRTmXLoHRKNVRu2i2YJ1FyeI+RQhff8sIwbqav6oylJW4PjKDO8t
         Kmh+qTQf/dUHDxk9KU941x+xxN6VbKrUzwWH0eHYtXhRN6d6dM/g9x2lBY5UfClag60+
         VSn+esU0E61YoRQ/7zKamAGfL6pkr7zktD4Ku+yK0QNV3sNts9XAfGfSyl+8I5tqvwRw
         YhGw==
X-Gm-Message-State: AOJu0YyROkGeFc+Z5pk/Z8xv4y4vZELo2h5DHkVQNnUlOilfwABAU5ob
	l2029778xSkouSM1U4xStteoqh1ilsrQulWtqXw0Io6O7TayHWVm
X-Google-Smtp-Source: AGHT+IHB34M0BPvyG83Fnaa1gsOsFkNvB5GBcGcQKjWrzvhJhz/T0z3hba6+r/N1lagsaauyNMNvuA==
X-Received: by 2002:a50:8e59:0:b0:57a:2547:836f with SMTP id 4fb4d7f45d1cf-57a3643a410mr2882497a12.2.1717252049162;
        Sat, 01 Jun 2024 07:27:29 -0700 (PDT)
Received: from [192.168.0.102] (p57935a9b.dip0.t-ipconnect.de. [87.147.90.155])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57a31bb4a4esm2266967a12.21.2024.06.01.07.27.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 01 Jun 2024 07:27:28 -0700 (PDT)
Message-ID: <4a442f07-7718-40d6-b98c-256a5e550aa1@gmail.com>
Date: Sat, 1 Jun 2024 16:27:28 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] staging: r8712u: remove unused struct
 'zero_bulkout_context'
To: linux@treblig.org, Larry.Finger@lwfinger.net,
 florian.c.schilhabel@googlemail.com, gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20240601131611.52441-1-linux@treblig.org>
Content-Language: en-US
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20240601131611.52441-1-linux@treblig.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/1/24 15:16, linux@treblig.org wrote:
> From: "Dr. David Alan Gilbert" <linux@treblig.org>
> 
> Remove struct zero_bulkout_context as it is unused.
> 
> Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
> ---
> V1 -> V2: Reword as per review
>    
>   drivers/staging/rtl8712/usb_ops_linux.c | 7 -------
>   1 file changed, 7 deletions(-)
> 
> diff --git a/drivers/staging/rtl8712/usb_ops_linux.c b/drivers/staging/rtl8712/usb_ops_linux.c
> index b2181e1e2d38..0a3451cdc8a1 100644
> --- a/drivers/staging/rtl8712/usb_ops_linux.c
> +++ b/drivers/staging/rtl8712/usb_ops_linux.c
> @@ -26,13 +26,6 @@
>   #define	RTL871X_VENQT_READ	0xc0
>   #define	RTL871X_VENQT_WRITE	0x40
>   
> -struct zero_bulkout_context {
> -	void *pbuf;
> -	void *purb;
> -	void *pirp;
> -	void *padapter;
> -};
> -
>   uint r8712_usb_init_intf_priv(struct intf_priv *pintfpriv)
>   {
>   	pintfpriv->piorw_urb = usb_alloc_urb(0, GFP_ATOMIC);


Tested-by: Philipp Hortmann <philipp.g.hortmann@gmail.com> AW-NU120
