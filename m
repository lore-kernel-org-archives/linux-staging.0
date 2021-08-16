Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC0D72FAE
	for <linux-staging@lists.linux.dev>; Mon, 16 Aug 2021 12:59:41 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id h9so31625292ejs.4
        for <linux-staging@lists.linux.dev>; Mon, 16 Aug 2021 05:59:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Y5uIXz2XwcikVYRQRK52KMA+VCLoXzka5XfwEtISp/M=;
        b=GJ3L2NH27/dAvkZV6A5+K504tWxrUGqV5s7zAnFXMZjVUO0FDrUnUf3LCxnRWFUd/n
         DhB9xWZKlU6fcaF48eIFxUM5AKeBMug339+Wn7FmshdLI0S5iKsaj1tutyYrAutaBYTc
         J7t74Ji7f/81u3DkVckf0J0EJU5zUjYVxakzO43BEzAE3sBmnyUk21WDnliEQVytacwo
         +l6Ig8L6EwpO1709Zzigmwv7RQ8GcX1eYf1EzsdZY/RnbkzFFzCsS+dTxmTmTy32bFla
         JsJDbUtlSRVOcXYdVY9AUZvTl84VQixATzugsa4QTJK/0K7hqoBazQxavwfDUCHuSrtC
         v99A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Y5uIXz2XwcikVYRQRK52KMA+VCLoXzka5XfwEtISp/M=;
        b=Je5hEzqOKV2Xkq4W7TlMdEn6zWp13o6d6SaAN942cbvuwARwyjPHM113YgchDCVsu0
         oGhyiB8u5Xecwo5T8+9AHshPRvMBdlbM5mJDhBfZGwxT6pT2mfRHEpzfQS/rxIHLw9b7
         Cd/8R7qDLBBQAbaRYvS0ykVmtnf824Fpx96BkbHTbU3QljuyizBYP6y/WQWn/ub61zER
         zbbc3Oki1bH0rzLQdwJDjnOAhG30mfr89wVaGFN5kjJXu2rJiLGz03fGms1zDahsQDkI
         CT7I0vUKhYWpJUxy6UvjbRBO0dkFI26Bwl4ndjsw39Xml2La+T6Yq9BlwAmOk6iXcFZX
         ZpEw==
X-Gm-Message-State: AOAM530zuwdtZfzVm9tT1zDJQqamQNieyUCmQdpcXsz8jDaLWRcZkLzM
	TSWpAA4br7JfeyliP1VM6+M=
X-Google-Smtp-Source: ABdhPJyi4cfLr8DIlO5bhLbKfRk8kxFUUe5CZbOmV6p/pFSTv0v8Klbhj4Bylf3qfAPOJrGKUFqA6g==
X-Received: by 2002:a17:906:6847:: with SMTP id a7mr7525988ejs.288.1629118779976;
        Mon, 16 Aug 2021 05:59:39 -0700 (PDT)
Received: from localhost.localdomain (host-79-22-109-211.retail.telecomitalia.it. [79.22.109.211])
        by smtp.gmail.com with ESMTPSA id l16sm3682542eje.67.2021.08.16.05.59.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Aug 2021 05:59:39 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: gregkh@linuxfoundation.org, Michael Straube <straube.linux@gmail.com>, Joe Perches <joe@perches.com>
Cc: Larry.Finger@lwfinger.net, phil@philpotter.co.uk, martin@kaiser.cx, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/4] staging: r8188eu: refactor rtw_is_cckrates_included()
Date: Mon, 16 Aug 2021 14:59:37 +0200
Message-ID: <22319347.s0ZA6q4zN9@localhost.localdomain>
In-Reply-To: <20210816115430.28264-1-straube.linux@gmail.com>
References: <20210816115430.28264-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday, August 16, 2021 1:54:27 PM CEST Michael Straube wrote:
> Refactor function rtw_is_cckrates_included(). Improves readability
> and slightly reduces object file size.
> 
> Signed-off-by: Michael Straube <straube.linux@gmail.com>
> ---
> v1 -> v2
> Refactored to more compact code as suggested by Joe Perches.
> 
>  drivers/staging/r8188eu/core/rtw_ieee80211.c | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
> 

Thanks for redoing the series as suggested by Joe Perches.
This is a perfect case where conciseness and readability don't clash and 
instead the former enhances the latter. 

Nice work, although you chose to not take Joe's suggestion about making a 
helper inline function. That would have been perfect, but I think it is a 
minor issue. So...

Acked-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>

Regards,

Fabio

P.S.: If I were you, I'd have provided a cover letter that would have helped 
the readers to immediately understand the purpose of the entire series. I'm 
not sure whether or not the above-mentioned cover is a strict requirement.

> diff --git a/drivers/staging/r8188eu/core/rtw_ieee80211.c
> b/drivers/staging/r8188eu/core/rtw_ieee80211.c index 0c7231cefdda..
964255a8c778 100644
> --- a/drivers/staging/r8188eu/core/rtw_ieee80211.c
> +++ b/drivers/staging/r8188eu/core/rtw_ieee80211.c
> @@ -70,14 +70,13 @@ int rtw_get_bit_value_from_ieee_value(u8 val)
> 
>  uint	rtw_is_cckrates_included(u8 *rate)
>  {
> -	u32	i = 0;
> +	u8 r;
> 
> -	while (rate[i] != 0) {
> -		if  ((((rate[i]) & 0x7f) == 2) || (((rate[i]) & 0x7f) 
== 4) ||
> -		     (((rate[i]) & 0x7f) == 11)  || (((rate[i]) & 0x7f) 
== 22))
> +	while ((r = *rate++ & 0x7f)) {
> +		if (r == 2 || r == 4 || r == 11 || r == 22)
>  			return true;
> -		i++;
>  	}
> +
>  	return false;
>  }




