Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 160D911188
	for <linux-staging@lists.linux.dev>; Fri, 14 Jul 2023 10:10:39 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-3fbc5d5742eso16807705e9.3
        for <linux-staging@lists.linux.dev>; Fri, 14 Jul 2023 03:10:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689329438; x=1691921438;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GFWHPsarbAE5FM1drwTioIbYAwpqVOcGLX+OiTOraMA=;
        b=C6UTowscgaC03hoB1biFZGdDzAmjE564AEcUAjvuMxX0PZlLZu2T5rMD2GZJWXh2We
         KGJKx0i2CbFWExPIbuVTN3jlWVp51B1YlwswbHi21ESQLtxfPw068T130OpokD8Ud/jx
         x3xg9yidt7PXReJXEYnm0QMqO57cEHJjR6TzJlx3ZFLyF++Y1C3NTxOId2aFUvSGzSLm
         fFlMbL5qwVYRSM4XQuj16hnmgeGZPXpFfbIi8t/AYeBZuFUmIKywl4nh0oEx7VIN2H9T
         ntUiM2HL0LDgjrhpyvOfEQxcVAeq0LlKISAkL39VifoYc1KWIFrj9qS8TW//IsxN634X
         ojwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689329438; x=1691921438;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GFWHPsarbAE5FM1drwTioIbYAwpqVOcGLX+OiTOraMA=;
        b=ANTuug2/2lrEvVjSmqTqhe5p1nwKsevDU9pveQ5OZBDOXrzbhDN6vyrmVg0JPpReSB
         r1n3sn66DboVEoMK4n39UhhAbV2aP7McBM4iaYtRXHVrzF48z9zKILo/G6cOzQPO7+Ob
         5c6FXGDbvur2WpkOoBtTvHroaaqZiPE+90oewzv3yo9OznDMno3PSEHbXCLL3U7IPVDw
         LxNmbMgL8NL5Fe8WV+ooA4NnwnpkaOXWih1nZBl3drsqfW3pTzV+m/m0CzSxx5MIkFpx
         0DIViGHlcoYJaph2EaOben4jwry3esHi371fBnBHYLlTHS6G+vJW4EM3dVnTLSIbFYwP
         nwdA==
X-Gm-Message-State: ABy/qLbVWaYHTnM92XRhNIwnmlTeNGiytU0C8NFmWveBgEavhAoWqR/M
	MI+6VcIWNVRoPljYoYGI/WqoLw==
X-Google-Smtp-Source: APBJJlH2uXC8tVM47KU/TINzaEMuifZhGUg/YVBem70u7gBASp8AdDhtewR2bY4voQZ5bQC2qFHOuQ==
X-Received: by 2002:a05:600c:20c4:b0:3fb:e054:903f with SMTP id y4-20020a05600c20c400b003fbe054903fmr3717641wmm.36.1689329438056;
        Fri, 14 Jul 2023 03:10:38 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id 18-20020a05600c22d200b003fbca05faa9sm1065054wmg.24.2023.07.14.03.10.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jul 2023 03:10:35 -0700 (PDT)
Date: Fri, 14 Jul 2023 13:10:32 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Tree Davies <tdavies@darkphysics.net>
Cc: Philipp Hortmann <philipp.g.hortmann@gmail.com>,
	gregkh@linuxfoundation.org, anjan@momi.ca, error27@gmail.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 09/12] Staging: rtl8192e: Rename variable pBA
Message-ID: <4867720d-bc9e-4560-b8cb-50c8a0422e97@kadam.mountain>
References: <ZK84sYjc9uHIWZcr@basil>
 <724b252e-0c72-6c77-4817-aee8d87a99cb@gmail.com>
 <ZLC3w4tjw16LwuEa@basil>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZLC3w4tjw16LwuEa@basil>

On Thu, Jul 13, 2023 at 07:49:39PM -0700, Tree Davies wrote:
> On Thu, Jul 13, 2023 at 11:54:40PM +0200, Philipp Hortmann wrote:
> > On 7/13/23 01:35, Tree Davies wrote:
> > > Rename variable pBA to pba in order to Fix checkpatch
> > > warning: Avoid CamelCase
> > > 
> > > Signed-off-by: Tree Davies<tdavies@darkphysics.net>
> > > ---
> > >   drivers/staging/rtl8192e/rtl819x_BAProc.c | 106 +++++++++++-----------
> > >   drivers/staging/rtl8192e/rtllib.h         |   2 +-
> > >   2 files changed, 54 insertions(+), 54 deletions(-)
> > 
> > 
> > Hi Tree,
> > the p is typically for pointer. This is not wanted when you change the name.
> > But ba is is in use....
> > 
> > Bye Philipp
> 
> Thanks Philipp,                                                      
>                                                                      
> A few thoughts...                                                    
> Looking at occurances of pBA, they all appear as local variable      
> declarations of struct ba_record, mostly as function params.         

I'm reading my inbox in the wrong order so I already sent an email
with the same advice that Philipp sent.  Philipp is correct.  "p" is
not allowed.

>                                                                      
> I also see what you mentioned, as BA being already taken in          
> rtl819x_BAProc.c:394 and line 292, but I don't 'think' that renaming them
> both to ba will result negatively(?).

Thanks for noticing this.  Figure out a solution.

> 
> Agreed, let's wait on Greg.

Heh.  Greg is not going to fix these minor issues and neither am I.  We
trust you to find a solution.  You can do it!  I believe in you!

regards,
dan carpenter

