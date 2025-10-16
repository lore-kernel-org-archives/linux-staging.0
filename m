Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB4A41E49F
	for <linux-staging@lists.linux.dev>; Thu, 16 Oct 2025 17:54:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760637246; cv=none; b=VrxxgsmrWjBNQiBmvjJ6WMZ2QH/+JODKVgSxeAUFb93+zWxkfVBDYcNKgGwAUfi+nD3MD/+Fn3nx+4MADZW/PQzK3O9zdwjGqD5ZFAIPd0FODXGCiPSARO0Brx4dengvLaohQAhp08h3F26tIpfP0j280Zy1awKSzo4ymUzZ7Uk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760637246; c=relaxed/simple;
	bh=FawIploMumH7dBn0ZStlxgmLztRwZU29KjYsEIrpdPQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ybdb+mik0dxvG7M/kIYyrf1CjBLH81ock6NS27SmknelRfrgJLEW1yDE6N3wa0g0YN+kXvGT8Ex6gt7sifh2oVVhSsKfu1GGuBNUus4O420P6Tvv3QV28mcRXFUoDq8fcl/cJkXvm5QX3rnt9kUxk2Z6m5j+I0a4NzYTPBGv4g0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KvVrhRy/; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KvVrhRy/"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-47112edf9f7so5664555e9.0
        for <linux-staging@lists.linux.dev>; Thu, 16 Oct 2025 10:54:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760637243; x=1761242043; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=re0k7Bmlzr6n+pTscGoh09v3TuZJXJlXBph6ofVeFQI=;
        b=KvVrhRy/uFTpkm06AeJyGSq/8VnFahKmnPWXyzJACpRvfq31WD5knUBk6W/7IptB7z
         Bk9h3Oz5aKTCWT9XbounGULm3DZUqFthrT3zUbxI+VgcHBL9ZtYY69JxMnwFRtaGuwcl
         mLKipkEIMAqIYd9ZTc1Hvby8ywpeja78H3iTBSft71zL94eEm4f89MCqg5+4W12BNZkY
         1a8DxbAbkZGCKQ6kzAwO5g8G7COFPpGSvZBa0Z1yZKuxEh4TlD8jg4GR8bfP4z3zFkqS
         4RPPsUsEy2h/LN5sBMpn7OFAOrrFU66Poe8jd29lZuC/IjTNdQOC6kuVttfRHRZXHdE0
         oMxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760637243; x=1761242043;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=re0k7Bmlzr6n+pTscGoh09v3TuZJXJlXBph6ofVeFQI=;
        b=OnxkI26SkoUJ/mzZ3K4UwWQOO9JbHhC5XHeB3otoEmsom7iHM3qyjm+YniJCjsR4AV
         ZNfWq4tgbHTok1K8Arjxps6JImJWFMGkfGEam1jo5XWsQfain6+jZIsIk+UbiaTvpWqR
         ksVDVjrH3xJgPnU2IoMWg3g3ISVhb9wF6ezVQZYJsoJ5j/qXHsh9LK0QANAC4+iATrVq
         /+rsLKAvGo7OFVq161AUN1yY7hMtb1+XpxsXTQANUM8Q61sX/s30nUHjc0qxRq3d3qLO
         eunq/ADIJnQOHbkHKDF+cMBpzqKUDFqX5mEohyIxZvaWD+i2kkskK/i13E2HAIWj7KlN
         Qaiw==
X-Forwarded-Encrypted: i=1; AJvYcCXX3Nk0D6Yi9lddaflIrUuDFWm8l/PCj1zksOdUFeHTm0Xx6owY254To4nH86Xw3IC7HVdlw4DOLZbyUVw6@lists.linux.dev
X-Gm-Message-State: AOJu0YwESfgzmRndwb0/Wfg0vegwwBGLio4xnLDnRNNi3wt1WeokQ89D
	b245hdOQjD4GT5+VMi4lPtcNIYo6n+/xHUv1Ecjj1AYWq0uwy25KsnH+TkUxkM5dgEo=
X-Gm-Gg: ASbGncsr5AJ98uvufuuAV1nN12GxeQmbbWvj36wmN4AaWEGIB8f7C0sdkYmO2VxXNvL
	2fYDwOhFsP6EP82HJtW5MspRrtDExTXktYnnOIt1LaqTdJuZGN5S6X8yWT/DlpgtYiBOFFFkGyz
	GVAtgmesAMVI9FQHtjd7uOuB4pGnTUtiFKpwtwkNvYwbInEw8X2RJ3z4BHi0xg01FJ4HTjQOlJ2
	aX0ZcIg7AP/WIE0f2q2TUcgGkLqL5aH6PBGIfixT1EQlluxhseTpuJY+97Iloc98aJ3SvE8OdMp
	0pwKFYJcKst7tTBTCworblbnhfi65YsIbpb1S39CHLVtQW07V/Sql7fgHXCXz0Tz3gWgyzV0PBb
	VSRj92AFpn/s6q3KxtkagpzA8KlG922s3XbF/j1wHgy4gTeD8rsGd2Q7fwHmPNw4tNx01HDY17y
	AsSapiApiONB+HrNjr
X-Google-Smtp-Source: AGHT+IF01qmGH8q+UOWkfTYTBBwfxd74efJeD0G55QsMn7HKQuxNWlH/tncuqzY9GwEgFvSx2x9/Tg==
X-Received: by 2002:a05:600c:540d:b0:45c:b53f:ad9 with SMTP id 5b1f17b1804b1-4711791d215mr7993025e9.33.1760637242866;
        Thu, 16 Oct 2025 10:54:02 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-471144b5d48sm39763405e9.9.2025.10.16.10.54.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Oct 2025 10:54:02 -0700 (PDT)
Date: Thu, 16 Oct 2025 20:53:57 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Emre Cecanpunar <emreleno@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: nvec: remove NVEC_PS2_DEBUG and dead debug macro
Message-ID: <aPExNS9yUUkBJSjq@stanley.mountain>
References: <20251016145324.13537-1-emreleno@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251016145324.13537-1-emreleno@gmail.com>

On Thu, Oct 16, 2025 at 05:53:24PM +0300, Emre Cecanpunar wrote:
> @@ -70,18 +62,15 @@ static int nvec_ps2_notifier(struct notifier_block *nb,
>  	case NVEC_PS2_EVT:
>  		for (i = 0; i < msg[1]; i++)
>  			serio_interrupt(ps2_dev.ser_dev, msg[2 + i], 0);
> -		NVEC_PHD("ps/2 mouse event: ", &msg[2], msg[1]);
>  		return NOTIFY_STOP;
>  
>  	case NVEC_PS2:
>  		if (msg[2] == 1) {
>  			for (i = 0; i < (msg[1] - 2); i++)
>  				serio_interrupt(ps2_dev.ser_dev, msg[i + 4], 0);
> -			NVEC_PHD("ps/2 mouse reply: ", &msg[4], msg[1] - 2);
>  		}
>  
>  		else if (msg[1] != 2) /* !ack */
> -			NVEC_PHD("unhandled mouse event: ", msg, msg[1] + 2);

This will introduce a bug.

regards,
dan carpenter

>  		return NOTIFY_STOP;
>  	}
>  
> -- 
> 2.51.0
> 
