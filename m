Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 351A73FCF
	for <linux-staging@lists.linux.dev>; Mon, 27 Sep 2021 16:53:07 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id s17so53219087edd.8
        for <linux-staging@lists.linux.dev>; Mon, 27 Sep 2021 09:53:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nMa3M1bs6F4XDDZsVandl5JemeFlfQBynfNRsq6BDAQ=;
        b=j/wKp7D6FSZhZSwNHaN+/7yrcCHyNCLHO9LiQ7AItO19rTT3AEdAGjAO4PLFuEI43x
         5WzAce1yY+R2sh/LE/m2qTq/KatnhCqhE5cuHJUM6H7N/sDcagUivWuH5yiD9qPai2jH
         RHDG1SjnfKnuy3BB1Z3djAap+7QTMSwSxuMvfP51+P/JhAXlyFcxeCJN37aQW15vQD+y
         kFnx6Ct42Kb/uf0NMX9N8IWUt88EE3QgnoIzjwOiSmjS30gre4WFS2JJBuE5dWlyFxxZ
         LoPb5SljuSZDXeJkydsSvAneiqyjohnxAmAnMg4INzoRoTAYa6l1qN14/OmGG+rnY5t6
         oFTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nMa3M1bs6F4XDDZsVandl5JemeFlfQBynfNRsq6BDAQ=;
        b=iJWOkwx6JqMczOg7sV7d8HOYkmLy2z58LNpZsKPHzlN9/FLaiy483xYsWlhXPRfm2O
         GKK52W+LLB+w5e0NjgaKnEoMLSLcbjWKPNeuVLeIdaiS7scSQnsg2+fqYB8p722JR7HW
         J+fF0WdeOIkcV+zT8Jgl4joPq3q+KAvN83MppviFXYsjfUrkOgHAnRxGAXpTig+UoJUX
         fdS4JGRpa4QA3ZbK7caXsRK8srZvOfJbO7d353tCJ4C7LhP5c3yn5+8BLFLj20Tj2Fab
         5PCiyccjBYxsSB02RODhSAz9JzAxUFDQFzsgE72FD4hEtNRPusnbQ3M5+WDRiig2dm7a
         cosg==
X-Gm-Message-State: AOAM530ZlOgiG6xLlZ600d4CQ/y/bj4sgXNi96wejYs28D9RpwCkFZPY
	cUHbDHfLNsY9qxuF6A3iF1U=
X-Google-Smtp-Source: ABdhPJysvTphbDucZcDQxa0AnvAbpnjIbT24c+ysEFd9fsbh7unovF7upOwbsRV3h34ERGp5YSJx0g==
X-Received: by 2002:a17:906:3a4d:: with SMTP id a13mr1199259ejf.220.1632761585538;
        Mon, 27 Sep 2021 09:53:05 -0700 (PDT)
Received: from localhost.localdomain (host-212-171-30-160.retail.telecomitalia.it. [212.171.30.160])
        by smtp.gmail.com with ESMTPSA id p24sm10733641edq.27.2021.09.27.09.53.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Sep 2021 09:53:04 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>, Phillip Potter <phil@philpotter.co.uk>, Pavel Skripkin <paskripkin@gmail.com>, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, David Laight <david.Laight@aculab.com>, Dan Carpenter <dan.carpenter@oracle.com>, Michael Straube <straube.linux@gmail.com>, Martin Kaiser <martin@kaiser.cx>
Subject: Re: [PATCH v9 10/16] staging: r8188eu: shorten and simplify calls chains
Date: Mon, 27 Sep 2021 18:45:49 +0200
Message-ID: <2224179.S7mhbqmIgH@localhost.localdomain>
In-Reply-To: <YVHlRf7C6m+2Si+3@kroah.com>
References: <20210924122705.3781-1-fmdefrancesco@gmail.com> <1836626.W0nMHyKdkH@localhost.localdomain> <YVHlRf7C6m+2Si+3@kroah.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

On Monday, September 27, 2021 5:37:41 PM CEST Greg Kroah-Hartman wrote:
> On Fri, Sep 24, 2021 at 02:37:52PM +0200, Fabio M. De Francesco wrote:
> > On Friday, September 24, 2021 2:26:49 PM CEST Fabio M. De Francesco 
wrote:
> > > --- Preface ---
> > > 
> > > This is v10 of "shorten and simplify calls chain". 
> > > [...]
> > [...]
> 
> Nah, I can figure it out, looks good, let's queue it up and see what
> breaks :)

"[and] see what breaks :)". Interesting...

This is the second or third time you have written me these words (I cannot 
speak for Pavel). I guess I'll have to work on it :)

All kidding aside, we seriously appreciate that you have decided to accept 
the patches.

Regards,

Fabio

> thanks,
> 
> greg k-h
> 




