Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D9A3225784
	for <linux-staging@lists.linux.dev>; Thu, 31 Jul 2025 15:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753977547; cv=none; b=XViMNRKKdHHAovqKjmVM+rXixeM5l8ZDClxpnLPiET4rTTA6vKzV8QEBLYwLTZkuZD14bhucnz3mUfda10v2485++M1TIE66w0ZfAdWqdRVZOGYN48y3IF/k0q4a3ButiZZMathR6LpoEQ8vhmRcX9Z9hJPMihL3DurbcQcuBQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753977547; c=relaxed/simple;
	bh=EGUB34VsUmvG1Zb9ZRJWC5Cb4aXm/XLM4GSFfCMKf1k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nC3eRCZkYkLXla+S9cPDV0QYFuVCfGYAVXMIWL5FgX2l4BIgF+wyQVn9E0W30dXrgGsesFO5qJGbqspR27WcMIme8fgz7Pbg5M11RJQxWJIkeku+4RtOHlbRk7thN0pZqcIFdVRUMTEKTc3xuB0/dnlhH2d37zQ9g/F+fEwrV7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lx1k3rmZ; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lx1k3rmZ"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3b788feab29so387675f8f.2
        for <linux-staging@lists.linux.dev>; Thu, 31 Jul 2025 08:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753977544; x=1754582344; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=17RO5tj8wCg7IBKuIfx2NeFRjK89caraONSxCkuBGWc=;
        b=lx1k3rmZJCmnTfl5d0ew/ufM7Xv8CVaYQDNzvxg4qZNTui6W8y9iFfQJvhDkVF7smE
         65ZH+ZkMOW/bWr4sDslnfQOwVba42FHdc2rLSjOYd3TzYMtPgiodHQp9Uc1JFH4FLlwc
         agZH2GRu5Pfi00Yp7D4DUh1Sm+2ZRuqvdJ2/PJeFNdRe6v007n5DWqJJEbQlHaYC3ctO
         G+7dxb/g4LJ60/OQ6o5HrA08M/4aHtBLK52Oapn9ILO0t/PIzpteNxdTYggvs4qJAXSC
         lAG77obl1EMb6Zgl3sDNRqcqxKGrd2kieUTvl0394UJ34XZLWq7moLy095kR3x4u7KQW
         KIZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753977544; x=1754582344;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=17RO5tj8wCg7IBKuIfx2NeFRjK89caraONSxCkuBGWc=;
        b=u88u2qh7nMISuecaBSGlI93vJZtlJqJYJurpigQVqGYj0dnmUMrzcHwD+xzoIzddBm
         p164Ft8TS0Xr2QNy2lxm+EH1AlbSJzkwrfk5twY2RJBa+qe8Dh7NyF0kiFaFOTtxZ2q6
         1gf+UoBP3HNURLUJDXm+vTcjNhqJQjrIxD8MkiT421Rcj23E7SuOvw0P9LBSOyyO1dFR
         cYau9JKyxqSYIjp8L/h+gwO7KHlPDtkhetRe59+LmuqnaylMVYRS4m4S6zlXvDksujLa
         lBhmZffVyRVa3GDGm9/U4pnxaG/7yNA5fB/B/5sXbQo26VIplKkuoCBpPPScEjowBvIe
         EW/g==
X-Forwarded-Encrypted: i=1; AJvYcCUSSEoPWcVAmqqT0/cYu46r+BQKxFz+fezFmxNgvAJaskG01ebaHg2NaZSWiXKDtCAwHp60X4t40f+R6fOa@lists.linux.dev
X-Gm-Message-State: AOJu0YyUqXU+FdjbEhwHkvIa6EmeOczFog5Dsdj+VoRYdbRqDqvz6g3u
	AfZ/DFHt0+0kuZPfPTJa6WF8kj2meE2AmTsvcj1aefqSNVtSzBBvVQIW3tFZ32FFSpI=
X-Gm-Gg: ASbGncvgWv9bI/qmKPZljpOlE5d/C51Yl0LRJmoN53JoSB1qXbjsROM4fS38A77ha55
	eaE0/tueigKWg0Kc7fF8LWqbwzZzttKERtm8zdQkpk4A7WC+TIoCbZFyzUIa06rA596nBf4MEUM
	WHV+mGZu1nwyw4zVmY3OTzsnNtZXGrQScaMMu96sl9KxSbpjDlsFZF19VSTDAzMgA+8day63q/p
	7/e1LnIOr3udMYOMqZGd07Wte3Xd7vdlHiYGW4/12MlPBF4lSvrwgnm/Fp7VSdAJ9lz1mB7cxrC
	fa6771ZTp1txeOBLsRMbpiqiGbf7Nww0lrX5dwjf0tBKTVjrlaz28zF+0y6Nk2QFB5UvgC3fJ6m
	0F5i0F1TkCiSMGEHQEJ634NHIixM=
X-Google-Smtp-Source: AGHT+IGi5XSwe1WlINYSaZIl9PD30Bv4d1ucxiE0q9IdFf/Di5Lqoo+8RUJufu6hF+pT8D6IwS4/tg==
X-Received: by 2002:a05:6000:2481:b0:3b8:4da3:cace with SMTP id ffacd0b85a97d-3b84da3cfb4mr2016313f8f.29.1753977544176;
        Thu, 31 Jul 2025 08:59:04 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4589ee621adsm32429795e9.30.2025.07.31.08.59.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Jul 2025 08:59:03 -0700 (PDT)
Date: Thu, 31 Jul 2025 18:59:01 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Michael Straube <straube.linux@gmail.com>
Cc: gregkh@linuxfoundation.org, hdegoede@redhat.com,
	Larry.Finger@lwfinger.net, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/8] staging: rtl8723bs: move rtw_init_mlme_timer to
 core/rtw_mlme.c
Message-ID: <05bc4742-ef57-482b-a2af-23a7f238fd69@suswa.mountain>
References: <20250730104501.150270-1-straube.linux@gmail.com>
 <20250730104501.150270-4-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250730104501.150270-4-straube.linux@gmail.com>

On Wed, Jul 30, 2025 at 12:44:56PM +0200, Michael Straube wrote:
> +static void _rtw_set_scan_deny_timer_hdl(struct timer_list *t)
> +{
> +	struct adapter *adapter =
> +	timer_container_of(adapter, t, mlmepriv.set_scan_deny_timer);

You accidentally deleted a tab here.  This should have been:

	struct adapter *adapter =
		timer_container_of(adapter, t, mlmepriv.set_scan_deny_timer);

regards,
dan carpenter

> +
> +	rtw_clear_scan_deny(adapter);
> +}

[ snip ]

> -static void _rtw_set_scan_deny_timer_hdl(struct timer_list *t)
> -{
> -	struct adapter *adapter =
> -		timer_container_of(adapter, t, mlmepriv.set_scan_deny_timer);
> -
> -	rtw_clear_scan_deny(adapter);
> -}

