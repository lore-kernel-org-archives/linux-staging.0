Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E32F5F
	for <linux-staging@lists.linux.dev>; Thu,  1 Apr 2021 13:55:42 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id e14so2991861ejz.11
        for <linux-staging@lists.linux.dev>; Thu, 01 Apr 2021 06:55:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=eYreHFpv0BL2btEls5SiLmwIJ5VSkFqo0ZMxXFwX268=;
        b=kGjgCDBXErU2ZA04du1n/L9dTEVS4HW1jnvPUC7QIuc6AITZm8YO58IElC9VNnm2Ef
         7qb2n+yQKrBoBqd+EFn3bDo247IktS6a+C2HiUiuvArXX0Cr7OgEpvsYEkeXs4X8zozX
         MOKrcGYznyxWFqkxN+H6kgiLQxfF6uUU7dAJHh0pTPL8IcmeNJz2zKajDkqbaIDIhvwq
         61xB2Sw5ZQEzZVHhf/KLzso0xjHlB+AxpIdn9b1kkW5SB8ML8x+SxUyqA7xINlgcFkxy
         AAE9Z3nuNAIu7dJXoEQrHVvr28bRohaD804lgz9Gl89PkHZLrDyhk6kdTLvxAF/Y0/Yp
         o3sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=eYreHFpv0BL2btEls5SiLmwIJ5VSkFqo0ZMxXFwX268=;
        b=a7WJOpshnVnLHCnzcUPJ7LnKUpIYzMdfwQYmp3mhHYo8aawl+cldsp1XE4c99FKkn9
         b3n3eATuWDzuhCdBaG8xZJtRoWfnHbyp791XeL92DirIIspZB26v5uLdwbWQ2T2jEl1x
         Ekkx3UXl6lC3YMHbsd8ugoEBi7cMM72t45Wcrx5itSFUQytMe4j8UaWffUlyYaiD2xAG
         IntK8X/vCZ/liDXQ3LLEmP4zLY/uqmOT/iXEmrV/aq9dccGNfBeCd1M0JVYbgINmqLdc
         bHdkgvofdrR7Z3f3WYTRegtqYKTq0qTVle/uUURRb/83t3+x01qx7b1JEHgW2R1rneSq
         DeNg==
X-Gm-Message-State: AOAM532ewOXHIyY4itHVJX9OHSaoZw6Q44ebKhdkblcwROGJ9jzYJ3/R
	X0bfGzxlIiyPGfkQnhKbXIw=
X-Google-Smtp-Source: ABdhPJwxp5I0r/vkxr01SS2RSAXGjq9/ef2BzyxVren8qr9aipCK2n7ZL8+gefIM+NW3kOoCvF06qQ==
X-Received: by 2002:a17:906:b20b:: with SMTP id p11mr9371928ejz.0.1617285340757;
        Thu, 01 Apr 2021 06:55:40 -0700 (PDT)
Received: from agape.jhs ([5.171.72.40])
        by smtp.gmail.com with ESMTPSA id c12sm3880032edx.54.2021.04.01.06.55.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Apr 2021 06:55:40 -0700 (PDT)
Date: Thu, 1 Apr 2021 15:55:37 +0200
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: gregkh@linuxfoundation.org, joe@perches.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 08/49] staging: rtl8723bs: remove RT_TRACE logs in
 core/rtw_cmd.c
Message-ID: <20210401135536.GA1691@agape.jhs>
References: <cover.1617268327.git.fabioaiuto83@gmail.com>
 <7f51432d99459d79742639341f107115f0c224c5.1617268327.git.fabioaiuto83@gmail.com>
 <20210401095017.GR2065@kadam>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210401095017.GR2065@kadam>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Thu, Apr 01, 2021 at 12:50:18PM +0300, Dan Carpenter wrote:
> On Thu, Apr 01, 2021 at 11:20:38AM +0200, Fabio Aiuto wrote:
> > @@ -677,9 +663,8 @@ u8 rtw_createbss_cmd(struct adapter  *padapter)
> >  	u8 res = _SUCCESS;
> >  
> >  	if (pmlmepriv->assoc_ssid.SsidLength == 0)
> > -		RT_TRACE(_module_rtl871x_cmd_c_, _drv_info_, (" createbss for Any SSid:%s\n", pmlmepriv->assoc_ssid.Ssid));
> > +		;
> >  	else
> > -		RT_TRACE(_module_rtl871x_cmd_c_, _drv_info_, (" createbss for SSid:%s\n", pmlmepriv->assoc_ssid.Ssid));
> >  
> >  	pcmd = rtw_zmalloc(sizeof(struct cmd_obj));
> 
> This is a bug.  Smatch has a check for this which hopefully would have
> detected it (I haven't tested).
> 
> There are some more similar issues below as well.  So generally the rule
> is don't adjust the indenting if it's not related to your patch.  In
> some cases you have been fixing the indenting but it should be done in
> a separate patch.  But the other rule is that if your patch introduces
> a checkpatch warning then you need to fix it in the same patch.  In
> this block the whole if statement should be removed.  But also if you
> have something like:
> 
> 	if (foo) {
> 		RT_TRACE(blha blah blah);
> 		return;
> 	}
> 
> Then checkpatch will complain that the the curly braces are not
> required.  (Checkpatch might not complain for your patch but it will
> complain when we re-run it with the -f option over the whole file).  So
> you should update this to:
> 
> 	if (foo)
> 		return;
> 
> That's all considered part of deleting the RT_TRACE().  Also if there
> are empty curly braces then delete those in the same patch.
> 
> I have looked over patches 1-7 and those seem basically fine.  I'm not
> going to review any further into this patchset because you're going to
> have to redo them and I will be reviewing the v2 set later anyway.  So
> just look it over yourself and check for any similar issues.
> 
> regards,
> dan carpenter
> 

Hi Dan,

I have the following:

 	if (rtw_createbss_cmd(adapter) != _SUCCESS)
-		RT_TRACE(_module_rtl871x_mlme_c_, _drv_err_, ("Error =>rtw_createbss_cmd status FAIL\n"));
+	;

will I leave

	if (rtw_createbss_cmd(adapter) != _SUCCESS)
		;

or just

	rtw_createbss_cmd(adapter);

?

what's best from the static analysis point of view?

smatch and sparse says nothing about that.

Checkpatch too seems to ignore it, maybe the first one is good,
but I would like to be sure before sending another over 40 patches
long patchset.

thank you,

fabio
