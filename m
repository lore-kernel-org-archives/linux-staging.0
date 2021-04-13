Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C241471
	for <linux-staging@lists.linux.dev>; Tue, 13 Apr 2021 10:07:30 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id u5-20020a7bcb050000b029010e9316b9d5so8426381wmj.2
        for <linux-staging@lists.linux.dev>; Tue, 13 Apr 2021 03:07:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=bsZsq5YfwrnQLUZc0VDsOOICMjGBzW9IErtRWmW7VlI=;
        b=X8t0d4vOS3dFvsZvYFC0bFdfGc4Rm2x0mBOnGu0YvNXGmzsGn5q9WgnaBcGJUY7zYr
         IDYOg6jpVllDN3JCdQWqgkejPd5dBg2j8y+03CIAvb9a+CC5+2wvx58A/aP4wN/u5O3C
         6dkrW4bI/RghaF3q9OLGsRd9V4/Skkg1ZJ1VA+GAaWLYiW92gt2AfbrktYsUtUvoKjf1
         v3SmqzuivKFQLt9T53j4F/jM47e0dhw6J3Gp/wNClND3f5H1m+U6a/VbG3AcVPaB9i5S
         Rv6m9fRC9MtwW31fjKW1LP0VA8wOH8RCpKQfBrUWQ/E787yjuJrIvhEXqEfdq00FrhZ8
         0xIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=bsZsq5YfwrnQLUZc0VDsOOICMjGBzW9IErtRWmW7VlI=;
        b=YvOa0MmNSdPyMjBRau8F1VTpDwd+R36os3zWqn4SBBc3bR4y2Y5kdo1rUpdP4QtQ8B
         PB2nEpjt4iyn9YVmdK2m+hNzttPexXBD6BkWFzbTt6oK6pUUrFDmmLJZQIJKDP/C6hDn
         ZREuFWo/Wabx00OE3Aalor/h8NGf5F1eF7WfXWVziG4hD5ZmHBPPLogZf5EJg4unjXAq
         R5Q+5Q3Exozx+N3R453P7N2OvhdeeP1TPydNv1LBZMKHhW2OCWdIUQcygTqcSUNdJEgZ
         olttsIKVralMhoVk7uSR4JGJ2n1/W7fmEePhseeG/k0++kBAX2vgMwLxHeflLfTlDHMO
         3rig==
X-Gm-Message-State: AOAM530JnDwRQKCNzup4E/zfi/nf5ISqetgSvPL72VvHJh/2tL/dgenF
	3xnqBnlr3rl7+XyNuzzcDR4=
X-Google-Smtp-Source: ABdhPJw5brg58l/WXx/7PqhFNrKZQAqpLm27+qQUqXZjQ4IYSYrkq6ADt6Nn14YDZY3zlCMKrFgj3w==
X-Received: by 2002:a05:600c:2dc8:: with SMTP id e8mr769839wmh.10.1618308449352;
        Tue, 13 Apr 2021 03:07:29 -0700 (PDT)
Received: from agape.jhs ([5.171.81.143])
        by smtp.gmail.com with ESMTPSA id a2sm3304132wrt.82.2021.04.13.03.07.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Apr 2021 03:07:29 -0700 (PDT)
Date: Tue, 13 Apr 2021 12:07:26 +0200
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: Julia Lawall <julia.lawall@inria.fr>
Cc: gregkh@linuxfoundation.org, joe@perches.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: cocci script hints request
Message-ID: <20210413100725.GC5477@agape.jhs>
References: <20210413090400.GA5477@agape.jhs>
 <alpine.DEB.2.22.394.2104131154100.2872@hadrien>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.22.394.2104131154100.2872@hadrien>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Tue, Apr 13, 2021 at 11:56:20AM +0200, Julia Lawall wrote:
> 
> 
> On Tue, 13 Apr 2021, Fabio Aiuto wrote:
> 
> > Hi,
> >
> > I would like to improve the following coccinelle script:
> >
> > @@
> > expression a, fmt;
> > expression list var_args;
> > @@
> >
> > -       DBG_871X_LEVEL(a, fmt, var_args);
> > +       printk(fmt, var_args);
> >
> > I would  replace the DBG_871X_LEVEL macro with printk, but
> > I can't find a way to add KERN_* constant prefix to the fmt
> > argument in the + code line. If i try this
> >
> > @@
> > expression a, fmt;
> > expression list var_args;
> > @@
> >
> > -       DBG_871X_LEVEL(a, fmt, var_args);
> > +       printk(KERN_DEBUG fmt, var_args);
> >
> > plus: parse error:
> >   File "../test.cocci", line 94, column 20, charpos = 1171
> >   around = 'fmt',
> >   whole content = +	printk(KERN_DEBUG fmt, var_args);
> >
> > how could I do this?
> 
> Although I certainly agree with Greg, I'll answer the question from a
> technical point of view.
> 
> I'm not sure that that kind of compound string is supported for a
> metavariable.  It is possible to get around this problem using a python
> script.  If you ever need to do this for a better reason, you can take a
> look at demos/pythontococci.cocci in the Coccinelle source code
> distribution.
> 
> julia

thank you, this helps a lot!

fabio
