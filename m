Received: from mail-oi1-f195.google.com (mail-oi1-f195.google.com [209.85.167.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 792737C;
	Thu, 31 Mar 2022 12:06:03 +0000 (UTC)
Received: by mail-oi1-f195.google.com with SMTP id q129so25017896oif.4;
        Thu, 31 Mar 2022 05:06:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=XUYGC/MdNC/QqLiDIIOH17Fg3yzA6z93mDMspfC2XaQ=;
        b=ddKq2q3GyR8sFIXGUgmNi3oXOBB72Xs9tG83/2jymJ6saS+DmSitBcCsgPZovTXmoj
         fdkHFNdbr0Y/8p4YzxLf12jy+9uRUenoC1q69G7eM2SWzzYtITHrrTzjTgOmgXQGZwik
         /k/xAbrK2jfpwtn9iPxbuf1H9Y19x32ZAtVP6mDU9Cpn30A23idfmjc6LxHC4U7Y8bui
         0UtcyIT/B7b/pCFkmcEVBvzvvYZrDj9hCB90XU3ykhBgNCcQyeQCqG6mv0DAvQvip0Sx
         uwqJLxujMwMHQdifm+du9W+iTrVULqPtPvf08BCHnXwReBaUJfJxV/3pbWnpqIL4Muql
         qf5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=XUYGC/MdNC/QqLiDIIOH17Fg3yzA6z93mDMspfC2XaQ=;
        b=fWYjZeSQe1fR/LdlbxcYyaaW2DRl1y5PEBsyJdFKyOOXmHz4IbfGJI4x25MjWLsaDt
         yERrZZAFhz1g4Gx/f4jLYLY4rnw5+dEc9IV+dU4O/LIRSZrafZNN4pjfCJuwarM/Fh1f
         kXMrWIGLQfpisHb+yhQWxnD2UBYKWiEwf6B/Vk03Z3imIYSHVBZt0G4u+oOpK3oyaUlN
         SpOqoRO6G0cH6tZPZUa/IzgCQjJNR3i+b8kpAfHJwCxPU1FeVgOmmECsPgYQlY9h3vEL
         VKTdu1XJMWJ764UthI2ZFAp1bxifQxI6SeimnElHpKcxF0LHBXHgLOQYkY7lkSDGHly9
         EOeg==
X-Gm-Message-State: AOAM531fS15tSNZk20OMkNRotDUGLZY4G5odPtMd3pX4L8vRtjeTsf/2
	kTh8e2mmO+rRbmY9+XO5KMzMmGE4WycGZw==
X-Google-Smtp-Source: ABdhPJwPeUCR7dZ0ZNy9Z6Z4+gWzjpXEMiYmvnVekMgG7S8j/XpHIN3LixCKkM0Ny3Ya1/1xVWna2Q==
X-Received: by 2002:a54:478e:0:b0:2ec:c28d:8930 with SMTP id o14-20020a54478e000000b002ecc28d8930mr2503337oic.162.1648728362311;
        Thu, 31 Mar 2022 05:06:02 -0700 (PDT)
Received: from bertie (072-190-140-117.res.spectrum.com. [72.190.140.117])
        by smtp.gmail.com with ESMTPSA id 184-20020a4a03c1000000b003240492fc15sm11729175ooi.36.2022.03.31.05.06.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Mar 2022 05:06:01 -0700 (PDT)
Date: Thu, 31 Mar 2022 07:06:00 -0500
From: Rebecca Mckeever <remckee0@gmail.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Alison Schofield <alison.schofield@intel.com>,
	Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev
Subject: Re: [PATCH] staging: r8188eu: fix suspect code indent for
 conditional statements
Message-ID: <YkWZKOvThq5paUi3@bertie>
References: <YkK7ABTVt0TCbd18@bertie>
 <20220329161632.GA1169956@alison-desk>
 <20220330062829.GF3293@kadam>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220330062829.GF3293@kadam>

Hi Dan,

On Wed, Mar 30, 2022 at 09:28:29AM +0300, Dan Carpenter wrote:
> I don't really like the focus on commit message minutia...  :/
> Basically everyone can understand the commit message.  There are one or
> two maintainers who will fly into a rage when they see the word "fix"
> in a commit message but I have a simple solution where I just never
> email them again.  My time is too valuable for that nonsense.
> 
> We would have applied this patch as is.  Or I would normally have
> written it like this:
> 
> [PATCH] staging: r8188eu: Delete a stray tab in rtw_survey_cmd_callback()
> 
> This code works fine, but the line is indented too far so it's confusing.
> Delete a tab.
> 
> Signed-off-by: ...
> 
> I had reviewed this patch earlier and almost pointed out that both sides
> of the if statement are the same except for the comment.  The "need to
> make timeout handlerOS independent" comment is wrong.  I have not looked
> at the details of the other comment.
> 
> I did not send my review comments because the patch was fine.  But what
> we want is for the code to look more like this.
> 
> regards,
> dan carpenter
> 
> diff --git a/drivers/staging/r8188eu/core/rtw_cmd.c b/drivers/staging/r8188eu/core/rtw_cmd.c
> index 6eca30124ee8..dcf7b24f95a8 100644
> --- a/drivers/staging/r8188eu/core/rtw_cmd.c
> +++ b/drivers/staging/r8188eu/core/rtw_cmd.c
> @@ -1404,11 +1404,8 @@ void rtw_survey_cmd_callback(struct adapter *padapter,  struct cmd_obj *pcmd)
>  {
>  	struct	mlme_priv *pmlmepriv = &padapter->mlmepriv;
>  
> -	if (pcmd->res == H2C_DROPPED) {
> +	if (pcmd->res != H2C_SUCCESS) {
>  		/* TODO: cancel timer and do timeout handler directly... */
> -		/* need to make timeout handlerOS independent */
> -		_set_timer(&pmlmepriv->scan_to_timer, 1);
> -		} else if (pcmd->res != H2C_SUCCESS) {
>  		_set_timer(&pmlmepriv->scan_to_timer, 1);
>  	}
>  

Is it okay if I submit a patch to implement your suggestion? I would
include a "Suggested-by" tag.

Thanks,
Rebecca
