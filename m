Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F84A3FC3
	for <linux-staging@lists.linux.dev>; Fri, 20 Aug 2021 21:50:42 +0000 (UTC)
Received: by mail-lj1-f172.google.com with SMTP id w4so17912004ljh.13
        for <linux-staging@lists.linux.dev>; Fri, 20 Aug 2021 14:50:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=KtF4JikGirGmEWSBEEKstne20Z5mP6gMbaTtDOFM/E8=;
        b=O45Q8k7Yv6smbjwukTq/JsAAARfnKcC3r7i3flcvoMjRjOUcoP+1DGaEox7bCyphcR
         mvJK824Yl3Ncf+EcrlV8gUMIFUfgZH39OA5LQb2+EeJZU43erBhgJGEu2E5gPpA5e3K+
         0Jw+EJzopRpPMCj4xmAYGMAazISBRMzVc7tdL09lIBgp6Vzskzh21I1wPyGN7kJkMNv0
         Yoa3qz3y8EtPEr+lDEE8e+RgDtG3+If4Jqm9WxWw/oo/mJ2pyXGrjFBeyqRBIIVA3/EA
         VrbY0mk7/rW0JOVXrSpf4Ms6XVBeA3UDsnYnlqJf0gjzb8/ICAyU/didwOn/H7da8qZ1
         wZKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=KtF4JikGirGmEWSBEEKstne20Z5mP6gMbaTtDOFM/E8=;
        b=EkGMivNTMuwgnUrM+MbyegOip7PujDupbV5gJ/aFaFDw9bQvPGYuwFUyzA6jOcoDFT
         sTz5dlcE/M7Gzk7RBOpgR4kA73GSoFIMNBJivFyHshLQbNGaA2erwOXPuQKWT8ubhGUN
         EF47CySwrlSpMniZqkVWCRZlhfZmVzmUtmsc74G74+npUsNLss6x3dckYhsxho287TX0
         IzzxXBQFK5xo3+EFsJ/hW1B5dHuUr/wlP0YzWRr/ojMX/3ljZ7OgBYKNYD2IGgbQUD3f
         D355yQP3A6ILTEb7wjBwNGR898EXL5oYXtFeq9txoXDVjJrxadSiIStpJIdHSeUQzIlI
         QkLw==
X-Gm-Message-State: AOAM531ZTgIQxzxQ7xED31bzRVraSZMu7FmJ6FWYwntsEkBNBS1kFQGF
	c+0mSzpG3mXN3mM8q9qaAF8=
X-Google-Smtp-Source: ABdhPJxhMzpWrgh4BFli1vyaftvD7m1rDFgsUSQ11EBA9Nb7S3RWBRO0b/GQthCetfGf4MoY/9QqIw==
X-Received: by 2002:a2e:9b12:: with SMTP id u18mr17472707lji.350.1629496240457;
        Fri, 20 Aug 2021 14:50:40 -0700 (PDT)
Received: from [192.168.1.11] ([46.235.66.127])
        by smtp.gmail.com with ESMTPSA id c18sm328376lfv.268.2021.08.20.14.50.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Aug 2021 14:50:39 -0700 (PDT)
Subject: Re: [PATCH RFC 1/3] staging: r8188eu: add proper rtw_read* error
 handling
To: Larry.Finger@lwfinger.net, phil@philpotter.co.uk,
 gregkh@linuxfoundation.org, straube.linux@gmail.com, fmdefrancesco@gmail.com
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <cover.1629479152.git.paskripkin@gmail.com>
 <f4fb967c992c29c8d2e8f67e78835b52a60d2e52.1629479152.git.paskripkin@gmail.com>
From: Pavel Skripkin <paskripkin@gmail.com>
Message-ID: <29de0bb8-efaa-1625-3f5d-04332c21ddc1@gmail.com>
Date: Sat, 21 Aug 2021 00:50:38 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <f4fb967c992c29c8d2e8f67e78835b52a60d2e52.1629479152.git.paskripkin@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 8/20/21 8:07 PM, Pavel Skripkin wrote:
[snip]

> @@ -336,13 +338,21 @@ s32 c2h_evt_read(struct adapter *adapter, u8 *buf)
>   
>   	memset(c2h_evt, 0, 16);
>   
> -	*buf = rtw_read8(adapter, REG_C2HEVT_MSG_NORMAL);
> -	*(buf + 1) = rtw_read8(adapter, REG_C2HEVT_MSG_NORMAL + 1);
> +	*buf = rtw_read8(adapter, REG_C2HEVT_MSG_NORMAL, &error);
> +	if (error)
> +		goto clear_evt;
> +
> +	*(buf + 1) = rtw_read8(adapter, REG_C2HEVT_MSG_NORMAL + 1, &error);
> +	if (error)
> +		;
	 ^^^^^^^

Should be goto clear_evt;. Will fix in v2, I want to receive some 
feedback first :)



With regards,
Pavel Skripkin
