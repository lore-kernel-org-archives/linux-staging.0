Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 610BD6FA7
	for <linux-staging@lists.linux.dev>; Sun, 17 Sep 2023 20:01:53 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-50300e9e75bso2046095e87.1
        for <linux-staging@lists.linux.dev>; Sun, 17 Sep 2023 13:01:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1694980911; x=1695585711; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TBYyotW/pdIWdI0cH7Z40wrfoq7zKPeFkckDRbW/Efs=;
        b=Ck928O34VGSulFBtvZQ5SPcq7Na5wFe8hj37EzmjQXhDLGiE5REiNdo70ZAKv3uJRl
         RK9xzGztfa/qCAQ17ar24D986bsNtqOTuwZy66DDsbSdNIpl5jc97U/QFxeMi3r2cPTs
         WLQhw/PX3/TUwu1i1xnXZqnA1DXCH5lpXrL2wKtI1RYRQIJ4fG+bR1FAsdrDEAPAdEBF
         lPSL8UE4ZV9yBZtkjUTm8S//39GLvV3a+lr+MNIGDhCGyp6goxUUYd36wd8IOJsbwZJY
         BtqbjHMdN2SDtYrzzHccwQvbIGBUslYANDSHbl26fVB4KWr/zPKDoTOUSH4bc3dak69w
         tA/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694980911; x=1695585711;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TBYyotW/pdIWdI0cH7Z40wrfoq7zKPeFkckDRbW/Efs=;
        b=toOOGXONENzv2toBOIF7um+03eRnzbi+QK6gle6wtgFNFK8Urcq4ZSQ474IMvSt7ft
         cR/naJn/oQ6oeo6fiQNwRhPyaUv9lpFpXF/tDgJAj8vhLWYcHuUdvmk4GcXNr9ioBpGC
         k5sn8xqZUZappQeY6u4qn4KOXfY9J0ug5lvyyGxaP3e4M+CTqA6ZnKY9HcQNUxKO57hs
         wzPTWMR15BdGh3iSNN4bdh1BHQCEsVbakwW9QuA6NncYF7ORy8vrWdGlUgPc4HN7EGMf
         M81jtXnQsQdXQ52b6CvsMMLTsBw8kMlndLUXduzfzzcMdWtBAgxpG8jcktucA6C7YDW4
         kQnQ==
X-Gm-Message-State: AOJu0YwTt37RbvNjtyADWNS35XKYZSkyhb9Rcq8dR1HpXjcu1jPdCoNz
	Ctsr+KdKgFjyTXMu0M2Psk4=
X-Google-Smtp-Source: AGHT+IETR6CvkBHbfEWd4EfCCD9JKVSO3/wNxkcelQ/OCb0FXFPYJydvmxxQ8XAqMfwqSMjBNYOYjw==
X-Received: by 2002:ac2:58f8:0:b0:500:bb99:69a9 with SMTP id v24-20020ac258f8000000b00500bb9969a9mr5279065lfo.64.1694980911019;
        Sun, 17 Sep 2023 13:01:51 -0700 (PDT)
Received: from HP-ENVY-Notebook (81-229-94-10-no68.tbcn.telia.com. [81.229.94.10])
        by smtp.gmail.com with ESMTPSA id b26-20020a0565120b9a00b005031939dbe9sm70495lfv.77.2023.09.17.13.01.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Sep 2023 13:01:50 -0700 (PDT)
Date: Sun, 17 Sep 2023 22:01:47 +0200
From: Jonathan Bergh <bergh.jonathan@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: vme_user: Replace strcpy with strscpy
Message-ID: <ZQdbK95P/GRNQo1F@HP-ENVY-Notebook>
References: <20230917154302.913956-1-bergh.jonathan@gmail.com>
 <2023091756-pastel-ipad-6cd7@gregkh>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2023091756-pastel-ipad-6cd7@gregkh>

On Sun, Sep 17, 2023 at 06:24:35PM +0200, Greg KH wrote:
> On Sun, Sep 17, 2023 at 05:43:02PM +0200, Jonathan Bergh wrote:
> > Replace strcpy with strscpy as preferred by checkpatch in vme_fake.c to
> > prevent warnings.
> > 
> > Signed-off-by: Jonathan Bergh <bergh.jonathan@gmail.com>
> > ---
> >  drivers/staging/vme_user/vme_fake.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/staging/vme_user/vme_fake.c b/drivers/staging/vme_user/vme_fake.c
> > index 9bcb89a84d53..0cf5700e151f 100644
> > --- a/drivers/staging/vme_user/vme_fake.c
> > +++ b/drivers/staging/vme_user/vme_fake.c
> > @@ -1093,7 +1093,7 @@ static int __init fake_init(void)
> >  	tasklet_init(&fake_device->int_tasklet, fake_VIRQ_tasklet,
> >  			(unsigned long) fake_bridge);
> >  
> > -	strcpy(fake_bridge->name, driver_name);
> > +	strscpy(fake_bridge->name, driver_name, sizeof(fake_bridge->name));
> 

Hi, thanks a lot for the review + comment.

> If it were this easy, we would have swept the tree and done so, right?
> Are you sure this is correct?  If so, please document exactly why it is
> correct in the changelog text when you resend this.

Thought it better to discuss before sending an updated patch
that might be wrong. 

I think it is correct since driver_name:
  * In: vme_fake.c:
	static const char driver_name[] = "vme_fake": 

will always fit into vme_bridge->name:
  * In: vme_bridge.h:
	...
	#define VMENAMSIZ 16
	...
	struct vme_bridge {
		...
		char name[VMENAMSIZ];
		...
	}

but I could have missed something. This is in the module __init
method and i dont see that name pointer being reassigned before
the strcpy call (which was changed).

Maybe its not worth changing, but (if it is correct) it would get
rid of the checkpatch warning and convert to the "preferred" API?

> 
> thanks,
> 
> greg k-h

FWIW Wouldnt it always be better to use the "safe" option since it 
at worst its going to truncate the destination string rather than 
write off the end of the array? 

thanks in advance
cheers
Jonathan
