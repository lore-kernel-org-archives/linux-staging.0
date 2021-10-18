Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D402B2C88
	for <linux-staging@lists.linux.dev>; Mon, 18 Oct 2021 16:28:50 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id r18so1419381edv.12
        for <linux-staging@lists.linux.dev>; Mon, 18 Oct 2021 09:28:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=m6QZSMKoKsWpgmNXk4KkFREjG4V6YJq4oDohc3s6X4w=;
        b=cWMxKm5wkNY9gqpYEuN3n6dOF60JnOX/VtrvHQSW9l/JuLwr/TJy2FkFJQ0RANo3Py
         cxNGRoumeNBzNcweC0ZdU/mgQvYfY0aYEQxeGVOvPquE7EDal147QYovR8HgNA6v16Rm
         aGO5qOkGaIAbdnoSWQ1ZOy591s4sii1NEF3hFTwPayFxcY19iAxS2VkwUbNzpyzjgEwt
         1OERlU4naKcXkumWlKn7fCF37PyDEWwrbpw4sOQoteAf6RhXD2LehitYI1gkYhjj5xL2
         huZeQaZEW0oEQxHukaVEQoNXciw12/dzfNdSE9GpKzG0dhJSfug58fFihZetJbbePYKw
         VX7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=m6QZSMKoKsWpgmNXk4KkFREjG4V6YJq4oDohc3s6X4w=;
        b=jbj1RJ8FaRh8eFixJOm/D6qy5l5w0Jq3ovpXrcmOh+JdTijeX7XV1DeGTdV5R8NIvN
         lA7aR7edIlTCssm26IPGe5EvJPRejsRIgP1Gjdc6kZ/QWPlUr9gnx6kEZ4Cr+xh3pyxk
         kgv4PpV9xhm15sq0N4NF0ByJIHDRrVjhINPxzTes3NApYZUCu0G1Ddg9hgLVygHD1wOd
         wkmPua4xAsKHnzwQDR1OvdsredGXYBuVSZ7SmOoXVhEZGWleJsHgZFdqxI10zWCUM9mx
         f4VKfsOBjuTrF1aXvMJcBy0UPONtnSrjZBQn2a5Ll0uK+VJSKheiNiA1TxHIg000JxPn
         ixZQ==
X-Gm-Message-State: AOAM531saM7ViU3Ceecru8GUax+y0X7e4RI1SbO/X/dMsnSHJsBozFEX
	Pojw/c6Vn6+ihJUqTDsyuB4=
X-Google-Smtp-Source: ABdhPJxHvpqk4QP5TnrUda93FNK1XRS/AfXf1iG6QvZ4YKxGPm5MIQ7vJJeWkPvfiwdeA7ED/M81Nw==
X-Received: by 2002:a05:6402:1778:: with SMTP id da24mr44822850edb.318.1634574528943;
        Mon, 18 Oct 2021 09:28:48 -0700 (PDT)
Received: from localhost.localdomain (host-79-47-104-180.retail.telecomitalia.it. [79.47.104.180])
        by smtp.gmail.com with ESMTPSA id f12sm10665948edx.90.2021.10.18.09.28.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Oct 2021 09:28:48 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>, Phillip Potter <phil@philpotter.co.uk>, Dan Carpenter <dan.carpenter@oracle.com>, Martin Kaiser <martin@kaiser.cx>, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] staging: r8188eu: Remove redundant 'if' statement
Date: Mon, 18 Oct 2021 18:28:46 +0200
Message-ID: <2162009.ybMk9oByy7@localhost.localdomain>
In-Reply-To: <YW2H63JAWKcM6+hL@kroah.com>
References: <20211017142812.4656-1-fmdefrancesco@gmail.com> <20211017142812.4656-4-fmdefrancesco@gmail.com> <YW2H63JAWKcM6+hL@kroah.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday, October 18, 2021 4:42:51 PM CEST Greg Kroah-Hartman wrote:
> On Sun, Oct 17, 2021 at 04:28:12PM +0200, Fabio M. De Francesco wrote:
> > Remove a redundant 'if' statement.
> > 
> > Acked-by: Martin Kaiser <martin@kaiser.cx>
> > Acked-by: Phillip Potter <phil@philpotter.co.uk>
> > Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
> > ---
> >  drivers/staging/r8188eu/core/rtw_cmd.c | 6 ------
> >  1 file changed, 6 deletions(-)
> 
> Why is there not a "v2" in the subject line like the other patches in
> this series?

Simply because I edited manually the "Subject" and overlooked to write "v2".

> 
> > 
> > diff --git a/drivers/staging/r8188eu/core/rtw_cmd.c b/drivers/staging/
r8188eu/core/rtw_cmd.c
> > index 6fb79d711692..42084b029473 100644
> > --- a/drivers/staging/r8188eu/core/rtw_cmd.c
> > +++ b/drivers/staging/r8188eu/core/rtw_cmd.c
> > @@ -254,12 +254,6 @@ int rtw_cmd_thread(void *context)
> >  	while (1) {
> >  		wait_for_completion(&pcmdpriv->enqueue_cmd);
> >  
> > -		if (padapter->bDriverStopped ||
> > -		    padapter->bSurpriseRemoved) {
> > -			DBG_88E("%s: DriverStopped(%d) 
SurpriseRemoved(%d) break at line %d\n",
> > -				__func__, padapter-
>bDriverStopped, padapter->bSurpriseRemoved, __LINE__);
> > -			break;
> > -		}
> 
> 
> Why is this redundant?
> 
> It is not obvious from the diff what is going on so you should say a bit
> more in the changelog text please.

Yes you are right. I wrongly thought that is was "obvious", but re-reading my 
own text I noticed that it is not. 

In 1/3 and 2/3 I was particularly careful in writing changelogs. Instead in 
3/3 I forgot that commit messages _must_ explain "what" and "why" :(

I've just sent version 3 of the series.

Thanks for reviewing my work,

Fabio

> 
> thanks,
> 
> greg k-h
> 




