Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A07922F44;
	Fri, 28 Oct 2022 17:21:25 +0000 (UTC)
Received: by mail-pf1-f180.google.com with SMTP id k22so5333065pfd.3;
        Fri, 28 Oct 2022 10:21:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cSOoNwD7h9nBv4OBLS47FnqfzC33ZvNOfAPcKMYectQ=;
        b=GcwhTA66fsFKqmcqEgWuIRW4tMyFWrTRPwzuVIvqWKuSdTwsTB+067+SBnz/SHMvmF
         KR6J1h0SDZPvvuKRz6M4cxyh8rs5WGt7B/M1bkafttKFjfdIAEheRMw7C37Yl2HQ6D5Y
         NvOyqe29nMCr+3OpyW8Qmi+gfxCbKmn+h1RHx/JCySesGL7YkHYDvuTKhRkiUXyj+zdl
         Zlia1O4DdG0K2caRXPd86P553+wG1UZZRhns9GoysHqa32gT4YtdBJ58cFDtwjGY/skI
         5NLputifJH6Ep40yeCUVEiTfU9T9ff/ns+R+DzajrC3MWjiZ8Bk8fUgOcjNVKSztR4UW
         THtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cSOoNwD7h9nBv4OBLS47FnqfzC33ZvNOfAPcKMYectQ=;
        b=5cG/wXqffl2gBCjYzrK2YKCuVu55w4bjYSCFx0HlOVwkETsHakO+9mpg1iDtnjHSvq
         fGvdbzADMUaBvWbQZOMw/ExRWFGEn82fz1q+9gKlMdOGuC8n2Riynlh8WkAuGVFxc8Vu
         VvtgkkpU2SUbID+nyFAdJyZO/ITa7FuQx7goiHeh4HqolWX9LrFc89o6oq8FWuDaTXcw
         SNNlq3AnmN1bIRtnm6kokCh5kMwyGGl2I2JwLjSlm8ZkP9E6Y+X9coZ/97n6GT2Bsj8L
         cX5p/UkVemrCPzrMU+75uACzjivJd1q3xnUj7XxdJdAPoAktLU7++bomMx66eOlxVG1G
         /5nw==
X-Gm-Message-State: ACrzQf1GxN4IST4nBH13BnJIcJlznhf8JzCm+gPWFhydXz4GaeAXnQct
	5jXx8VL+5WHQ2HRY4yPDedE=
X-Google-Smtp-Source: AMsMyM7cab1xSb/34wP62xMtfVhnuWgjzSZenfFO5HtLw27m61lglSstTNEKd7rAycWMaIPmJO/e5w==
X-Received: by 2002:a05:6a00:148e:b0:56c:882e:3480 with SMTP id v14-20020a056a00148e00b0056c882e3480mr452296pfu.31.1666977685006;
        Fri, 28 Oct 2022 10:21:25 -0700 (PDT)
Received: from marshmallow (192-184-163-51.fiber.dynamic.sonic.net. [192.184.163.51])
        by smtp.gmail.com with ESMTPSA id m4-20020a170902db0400b00186a2274382sm3338796plx.76.2022.10.28.10.20.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Oct 2022 10:21:02 -0700 (PDT)
Date: Fri, 28 Oct 2022 10:20:32 -0700
From: Emily Peri <eperi1024@gmail.com>
To: Julia Lawall <julia.lawall@inria.fr>
Cc: gregkh@linuxfoundation.org, outreachy@lists.linux.dev,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: Replace ternary statement with min
 function
Message-ID: <Y1wPYCvbV6SMsIEO@marshmallow>
References: <Y1neXqVYZ8mq8jH+@marshmallow>
 <alpine.DEB.2.22.394.2210270811540.2792@hadrien>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.22.394.2210270811540.2792@hadrien>

On Thu, Oct 27, 2022 at 08:12:14AM +0200, Julia Lawall wrote:
> 
> 
> On Wed, 26 Oct 2022, Emily Peri wrote:
> 
> > Ternary statements that pick the min of two values can be replaced by
> > the built-in min() function. This improves readability, since its quicker
> > to understand min(x, y) than x < y ? x : y. Issue found by coccicheck.
> 
> It looks like a nice change, but I get a compiler error afer the patch,
> 
> julia

Okay, I think I know the issue. Another person commented (Dan Carpenter)
that the function needs to be min_t, I'm guessing so the function
returns the value as the correct type. But one thing I'm wondering is,
why I didn't I get a compiler error when I compiled the kernel myself?

Also-- this is just a general question, when we work on drivers I'm
guessing we don't need to include header files from include/linux,
right? 

> >
> > Signed-off-by: Emily Peri <eperi1024@gmail.com>
> > ---
> >  drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
> > index 6aeb169c6ebf..0cf7d9f82b83 100644
> > --- a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
> > +++ b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
> > @@ -1551,7 +1551,7 @@ static int rtw_cfg80211_set_wpa_ie(struct adapter *padapter, u8 *pie, size_t iel
> >
> >  		wps_ie = rtw_get_wps_ie(buf, ielen, NULL, &wps_ielen);
> >  		if (wps_ie && wps_ielen > 0) {
> > -			padapter->securitypriv.wps_ie_len = wps_ielen < MAX_WPS_IE_LEN ? wps_ielen : MAX_WPS_IE_LEN;
> > +			padapter->securitypriv.wps_ie_len = min(wps_ielen, MAX_WPS_IE_LEN);
> >  			memcpy(padapter->securitypriv.wps_ie, wps_ie, padapter->securitypriv.wps_ie_len);
> >  			set_fwstate(&padapter->mlmepriv, WIFI_UNDER_WPS);
> >  		} else {
> > --
> > 2.34.1
> >
> >
> >
