Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com [209.85.167.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF89A366;
	Wed, 30 Mar 2022 00:48:05 +0000 (UTC)
Received: by mail-oi1-f193.google.com with SMTP id q189so20653532oia.9;
        Tue, 29 Mar 2022 17:48:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=L/Z+SxVbLz6ou3wwMOlt3AaF7PE4HzKd6bt7UJffX70=;
        b=dK3yx5gryzNDPyAAOCVtVbTt6MA3aToJUg/XKmbY9u6v6CDKkg97/nXMI3XNohXqul
         +odZD9TcwzPCqy0FeM4nvrkc0knqqsdrl7BB9x0QGMI8V09xjhhEOnFD/yz8QQqucqpf
         PTRspLJIkr2jx2pFIj8KDj7cKxiya5Smh063hd2565QZyZnPgmzq/cDauruSVSuXQfNu
         0lcjfZKCqricvN3VhZV2/rSX2M7jUb6aEjN8Pa2kI/8CZqTNxjXM8DrYSFxsGlha5Tjw
         mfxLeXGutfy9L88MiD2lbvCFR6hjYb8AeMzoju847wZxeBYIBP5COfOlzzYQW8ChYzwe
         1bKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=L/Z+SxVbLz6ou3wwMOlt3AaF7PE4HzKd6bt7UJffX70=;
        b=PUjgeQNLpym9dECzaLOuI+txNNPucdzkBHhRjSIhsI3tXHbbM+IUG4XL+2f8X8t/EE
         sNlmXaiHxXYcjBefueufz7sAoYm523qTA5YzkO4Bmlu3mlcvga49xBKhrZI4ynK0HLl3
         l4YvuMC1TZ5ESKZSILcXQg+bY8xDbGFSdWgXEKk1BTZL3ZCLx3sb9NhKY3xrF+L4WAxb
         2cH7BbmCPeSeCddbVuJl1WnZwTlDI76k5rKBGQiEH82yVe72SeJFkF/98QybmltYpOkd
         PawGbKFtCmylh3HciM2cVYPf9++H4tsslllLYhz5Mpeu65ehsQhElNLQugFG3PI5s4Nl
         ohWA==
X-Gm-Message-State: AOAM530pwKfOLL/206I74Bupbd1fPl8y2+8AuTza7W9WHvIF9wffGQEp
	QBmcs5ILSTMkJiIMBbn+LcV6RDy1Gh6SK8wfoE8=
X-Google-Smtp-Source: ABdhPJz+BEqfvl9GbjQHynhZTbgEuZapz+Az1wHFJL6oeHdaNVucltGFv4oWTtKFblHw9u4FSRzlLQ==
X-Received: by 2002:a05:6808:8c7:b0:2ee:f75b:bc20 with SMTP id k7-20020a05680808c700b002eef75bbc20mr812170oij.44.1648601284654;
        Tue, 29 Mar 2022 17:48:04 -0700 (PDT)
Received: from bertie (072-190-140-117.res.spectrum.com. [72.190.140.117])
        by smtp.gmail.com with ESMTPSA id u16-20020a056808151000b002f734da0881sm7604064oiw.57.2022.03.29.17.48.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Mar 2022 17:48:04 -0700 (PDT)
Date: Tue, 29 Mar 2022 19:48:03 -0500
From: Rebecca Mckeever <remckee0@gmail.com>
To: Alison Schofield <alison.schofield@intel.com>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev
Subject: Re: [PATCH] staging: r8188eu: fix suspect code indent for
 conditional statements
Message-ID: <YkOowzOkAE5Fr1dW@bertie>
References: <YkK7ABTVt0TCbd18@bertie>
 <20220329161632.GA1169956@alison-desk>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220329161632.GA1169956@alison-desk>

On Tue, Mar 29, 2022 at 09:16:32AM -0700, Alison Schofield wrote:
> On Tue, Mar 29, 2022 at 02:53:36AM -0500, Rebecca Mckeever wrote:
> > Align the if and else if branches of the conditional statement
> > to improve readability. Prevent bugs that could be introduced
> > if developers misread the code. Issue found by checkpatch.
> 
> Thanks for the patch Rebecca!
> 
> Lots of stuff done right - passes chkp, compiles, patch is sent to
> correct recipients, the commit message follows the format of the file.
> 
> Let's set a pattern here for all checkpatch related cleanups,
> for you and others that follow.(Thanks for being the first ;))
> 
> Commit msg says 'what'. Commit log says 'why'. Acknowledge that
> it was found using checkpatch in the commit log also. (In the future
> you may be acknowledging use of other tools like sparse, coccinelle.)
> 
> Note that the 'why' is never that a tool reported an error. The 'why'
> for these checkpatch reports is usually to follow the Linux Kernel
> Coding Style.
> 
> 'Fix' in the commit message is needlessly generic. Perhaps:
> [PATCH] staging: r8188eu: align both branches of a conditional statement
> 
> Commit log: (what you have is fine in the log)
> I usually paste in the checkpatch error explicitly so it can be grep'd
> for. Something like:
> 
> Issue found by checkpatch:
> WARNING: suspect code indent for conditional statements

There was a section of https://kernelnewbies.org/PatchPhilosophy that suggested
putting the warning message in the subject line. I thought it would be
redundant to also put it in the body. Is it a good practice to include the
warning message in both places?

> 
> Thanks,
> Alison
> 
> > 
> > Signed-off-by: Rebecca Mckeever <remckee0@gmail.com>
> > ---
> >  drivers/staging/r8188eu/core/rtw_cmd.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/staging/r8188eu/core/rtw_cmd.c b/drivers/staging/r8188eu/core/rtw_cmd.c
> > index 6eca30124ee8..ccc43c0ba433 100644
> > --- a/drivers/staging/r8188eu/core/rtw_cmd.c
> > +++ b/drivers/staging/r8188eu/core/rtw_cmd.c
> > @@ -1408,7 +1408,7 @@ void rtw_survey_cmd_callback(struct adapter *padapter,  struct cmd_obj *pcmd)
> >  		/* TODO: cancel timer and do timeout handler directly... */
> >  		/* need to make timeout handlerOS independent */
> >  		_set_timer(&pmlmepriv->scan_to_timer, 1);
> > -		} else if (pcmd->res != H2C_SUCCESS) {
> > +	} else if (pcmd->res != H2C_SUCCESS) {
> >  		_set_timer(&pmlmepriv->scan_to_timer, 1);
> >  	}
> >  
> > -- 
> > 2.32.0
> > 
> > 
> 

Thanks,
Rebecca
