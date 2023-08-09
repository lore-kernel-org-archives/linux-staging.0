Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB02B18AE4
	for <linux-staging@lists.linux.dev>; Wed,  9 Aug 2023 16:18:45 +0000 (UTC)
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-1c02345cad6so732040fac.0
        for <linux-staging@lists.linux.dev>; Wed, 09 Aug 2023 09:18:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691597925; x=1692202725;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ti5YpVJETeixuCpoZ0ZGTbW0aEvrY5dl5mp0PqcF+V8=;
        b=ceKIciqrukI/00ca1jssImFg3oAqLm/cE3tjjF6cgD8FiPZe3vRSDzcykHMEXCv37j
         D4pU6Fd8uLOHmgjNuMRxoth+sXIcx17ulWLub9i/XONASsRC57RU4im/ix3q5vAAH4ja
         xci0E1+fvRsJSMdWdkQcbh2MXViWsRRQsgHBhRnPsar0SFMvAsLCderlYdrOsvAgVO8F
         684V3rUcjJ2d69wQOpwYlM2xYWkpMPfc7tVK2dqyy+giH8506zFfI6d6j3gQnSBTkorS
         rox6PHwddACVmLn9qESep6JCgPDszCeTNjilFYmcSHAG7wXaMPhk5r3Cp5CsPeqBcq3I
         NUiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691597925; x=1692202725;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ti5YpVJETeixuCpoZ0ZGTbW0aEvrY5dl5mp0PqcF+V8=;
        b=aLp4ltRoFtWvMTt9qnRNfH/Vpz1yp1xPchuPn1jTAZoIb8AXzSTNh3My1pUTUUvFrw
         I1XQ7/Hhov1XoQhYm0RTbHvGFy+Gbq8VQlV3EUrQOnCy7asd1GQyvEMcQJIsn9IDhTM2
         qaviKO3/AUg4McRXvssaBG2DRhiAWJUiTPpUIIhPCT9VXdnKJhKMRXzsxYeYbKvNaLPM
         DTLSmYWugecfaJUZbU6XzEzIWmqaAKkFoaVAfCPrHxm9J18vNUnQa7tcdwxJ1RUh1tdI
         M6CR99wsrLo7A+y327yfatWtrYK8XLyn0TSMrajjEu0RBvMp1zdPO5wmtRl2IDMDTBnQ
         O/eA==
X-Gm-Message-State: AOJu0YyYe4CM8UTYjDiIsZsln4GdQJ/iN6seoxZZapK2iJHF32aHf5UT
	A/K8Y30LJ4rcAqvcHcyqSuY=
X-Google-Smtp-Source: AGHT+IE3mYF8NBLvPfFZJAlmgPoKDX1p00mZmHw4Ov1A71c7/UXf/pDlVx94W+4hr52Gy3ipZTD/7g==
X-Received: by 2002:a05:6870:171b:b0:1b0:3821:f09b with SMTP id h27-20020a056870171b00b001b03821f09bmr2323177oae.13.1691597924625;
        Wed, 09 Aug 2023 09:18:44 -0700 (PDT)
Received: from alolivei-thinkpadt480s.gru.csb ([2804:14c:bf20:86d6:7871:f7e9:8a15:865a])
        by smtp.gmail.com with ESMTPSA id cc4-20020a056871e18400b001a9eb707366sm7282513oac.15.2023.08.09.09.18.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Aug 2023 09:18:44 -0700 (PDT)
Date: Wed, 9 Aug 2023 13:18:38 -0300
From: Alexon Oliveira <alexondunkan@gmail.com>
To: Nam Cao <namcaov@gmail.com>
Cc: gregkh@linuxfoundation.org, martyn@welchs.me.uk,
	manohar.vanga@gmail.com, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH v3] staging: vme_user: fix alignment of open parenthesis
 and deleted trailing spaces
Message-ID: <ZNO8XmOpylyE0AWS@alolivei-thinkpadt480s.gru.csb>
References: <ZNJKTLZ62SZMM6D8@alolivei-thinkpadt480s.gru.csb>
 <ZNOizFnDXojT4s85@nam-dell>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZNOizFnDXojT4s85@nam-dell>

On Wed, Aug 09, 2023 at 04:29:32PM +0200, Nam Cao wrote:
> On Tue, Aug 08, 2023 at 10:59:40AM -0300, Alexon Oliveira wrote:
> > Fixed all CHECK: Alignment should match open parenthesis
> > and deleted the trailing whitespaces as reported by
> > checkpatch to adhere to the Linux kernel coding-style
> > guidelines.
> > 
> > Signed-off-by: Alexon Oliveira <alexondunkan@gmail.com>
> > ---
> > 
> > Changes in v3:
> > - Rebased against staging.git and staging-next branch, noted by Greg KH
> > 
> > Changes in v2:
> > - Fixed changelog, noted by Greg KH
> > 
> >  drivers/staging/vme_user/vme.c | 8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/staging/vme_user/vme.c b/drivers/staging/vme_user/vme.c
> > index 977c81e2f3c7..741593d75a63 100644
> > --- a/drivers/staging/vme_user/vme.c
> > +++ b/drivers/staging/vme_user/vme.c
> > @@ -563,7 +563,7 @@ EXPORT_SYMBOL(vme_master_request);
> >   *         returned.
> >   */
> >  int vme_master_set(struct vme_resource *resource, int enabled,
> > -		   unsigned long long vme_base, unsigned long long size, 
> > +		   unsigned long long vme_base, unsigned long long size,
> >  		   u32 aspace, u32 cycle, u32 dwidth)
> 
> As Greg said, it doesn't look like this in staging tree, so your patch doesn't apply.
> 

Hi Nam,

I did all the steps to have my branch updated with the origin/main
branch, but I've found out that was something more.

> However I look it up and the last change to this line was 12 years ago, so I doubt
> that it is because you didn't rebase to Greg's tree. I think the more likely
> possibility is that you have a commit to this line yourself (by mistake perhaps?),
> and this patch is on top of that.
> 

Thank you for poiting that out. You're right. I found that was indeed an issue on my
side thanks to your input.

> Make sure you don't have any accident commit that modifies this line in your tree.
> 

There was indeed and accident commit modifying more than one line in my
tree, hence the "trailing whitespaces" messages in one of the commits.
So, to clean evertyhing up, I decided to drop these commits and start
all over again, from scratch. That way I'm sure I'm not messing up
anything else. I just sent a fresh patch in another thread.

> Best regards,
> Nam

Thank you.

Alexon Oliveira
