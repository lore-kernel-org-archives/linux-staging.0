Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7C2B72
	for <linux-staging@lists.linux.dev>; Sat,  7 Aug 2021 04:14:26 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id j3so9803679plx.4
        for <linux-staging@lists.linux.dev>; Fri, 06 Aug 2021 21:14:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=IlfaVygAdb8lsGHENosdNja/iJlekGHCWhm6a0q2CfU=;
        b=ONKFJEO+gW+A1uEwvsmfj/a+eem704R2bAp2n/D9zPESLrH7soUTKnaWUsUkQy3EDe
         KOU/Wo+AgJaTPsws+N6EMqzTxTN+Et/eiN+nOAUL+iL7JAwD4lnvyNkw31mModbWwOFi
         oC7i/iclHE1EYFlZB3KcGOhIU1dAUf3W7Cm2YTxgR7HJZpX+iGWILSLt5bN3r8uNndre
         fuhTlwK3hU5AWK46Nj8/Suu0Xs6GJsUhgSwFg/NqTI4zqbbV8nmSvxU5E++Gsoqo5iWs
         /p1Y3N+StkFU9XXIU/2WWVkgbs/8Me4SgWVhInjN/N8/p7yBaLXAoJTtaCxpwKNgciOi
         uA2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=IlfaVygAdb8lsGHENosdNja/iJlekGHCWhm6a0q2CfU=;
        b=hZACe8YtLkYka8kITw3sSiXBtuObLMh4+lAFGQ1+sEr0ULbIOHl2P6TpbUWT/P3RaF
         r50DgXOxtcwVb00dlUIQe8IaxKRj3awLo7hOpw3ERj0dj8Vpf/JYyHc9VJIt0NXvTl6f
         +G6fQa9Fh1jU4EzXzHdkEjJxVKBZ/rKXqYuZLaZzLgI3MJwzVmtgFVt20foJPnV+tBGj
         MQhEkDiyffBl5MKTkqKir5yyE5KteI18jL1KiuLuxyF+WNve1LtI71/NIfnCWf9NxYD3
         v3qvxIhLLsv3ysASw2nXSFiX8YADMlFSo9UIRTPGT82oM5lUIWoMhad15rSrVZzZbrbe
         NPSg==
X-Gm-Message-State: AOAM533pdBnsOH/ZWqTlBR8m1EWY0XbNKjlzK1cuS9uW8QDMnGsN3Yep
	cW1sdcNCOZYh7Jvi3Yp+z80=
X-Google-Smtp-Source: ABdhPJyETMIETObcBlKTSp4IomBI75Ge2KRu7FLt60dYwwP/l46JITRSxTWCZa5xQFy4oC03lg+EZw==
X-Received: by 2002:a17:902:70c8:b029:12c:dd57:c57d with SMTP id l8-20020a17090270c8b029012cdd57c57dmr11845241plt.32.1628309666352;
        Fri, 06 Aug 2021 21:14:26 -0700 (PDT)
Received: from user ([106.212.234.168])
        by smtp.gmail.com with ESMTPSA id b12sm12558129pff.63.2021.08.06.21.14.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Aug 2021 21:14:25 -0700 (PDT)
Date: Sat, 7 Aug 2021 09:44:21 +0530
From: SAURAV GIREPUNJE <saurav.girepunje@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: fabioaiuto83@gmail.com, marcocesati@gmail.com, ross.schm.dev@gmail.com,
	insafonov@gmail.com, linux-staging@lists.linux.dev,
	saurav.girepunje@hotmail.com
Subject: Re: Post to linux-staging@lists.linux.dev denied: [PATCH] staging:
 rtl8723bs: os_dep: remove unused variable
Message-ID: <YQ4InXVA8FaqdEfo@user>
References: <1628081824-28535-mlmmj-16bf2009@lists.linux.dev>
 <YQqZ4TlTzZGIaixJ@user>
 <YQqccPSjYA/lR11g@kroah.com>
 <YQrMZEND3pY8Pav4@user>
 <YQvFpwNDRSxLxNmp@kroah.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YQvFpwNDRSxLxNmp@kroah.com>

On Thu, Aug 05, 2021 at 01:04:07PM +0200, Greg KH wrote:
> On Wed, Aug 04, 2021 at 10:50:36PM +0530, SAURAV GIREPUNJE wrote:
> > On Wed, Aug 04, 2021 at 03:56:00PM +0200, Greg KH wrote:
> > > On Wed, Aug 04, 2021 at 07:15:05PM +0530, SAURAV GIREPUNJE wrote:
> > > > On Wed, Aug 04, 2021 at 12:57:04PM +0000, linux-staging+owner@lists.linux.dev wrote:
> > > > > Greetings!
> > > > >
> > > > > This is the mlmmj program managing the <linux-staging@lists.linux.dev>
> > > > > mailing list.
> > > > >
> > > > > The message from <saurav.girepunje@gmail.com> with subject "[PATCH]
> > > > > staging: rtl8723bs: os_dep: remove unused variable" was unable to be
> > > > > delivered to the list because the list address was not found in either the
> > > > > To: or CC: header.
> > > > >
> > > > > (The denied message is below.)
> > > >
> > > > > Date: Wed, 4 Aug 2021 18:26:57 +0530
> > > > > From: Saurav Girepunje <saurav.girepunje@gmail.com>
> > > > > To: gregkh@linuxfoundation.org;, fabioaiuto83@gmail.com;,
> > > > >  saurav.girepunje@gmail.com;, marcocesati@gmail.com;,
> > > > >  ross.schm.dev@gmail.com;, insafonov@gmail.com;,
> > > > >  linux-staging@lists.linux.dev;, linux-kernel@vger.kernel.org;
> > > > > Cc: saurav.girepunje@hotmail.com
> > >
> > > Why do you have ";" in your email addresses here?
> > >
> > > Try removing them.
> >
> >
> > Thanks Greg, That was the problem.
> >
>
> Can you resend all of your pending patches in the proper way, in a patch
> series, so I know what to apply and in what order they should be applied
> in?  Right now I have a bunch that never made it to a public list, and I
> can not take them, so I will just drop all patches from you that are
> pending in my queue to make it obvious what I need to review.
>
> thanks,
>
> greg k-h


Yes, I will resend all the patch.

