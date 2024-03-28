Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AA5F4CB38;
	Thu, 28 Mar 2024 07:53:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711612405; cv=none; b=I/1ugtClZFGlrRMt02+Xz+kj9ZLJ4Hyl8Lt5YPSWKwJ7KOmpL2Xa4O4X0VE9Kvc/T24BK+xu0qp+GonwuvsmFJX89ynUOPVpmdRzsDJ0v2tL3GyyR7bPCdP3tcICxohXAl6JMoJvwZS9napLFkg6HzbkTNKdasE1oAZxBgRV/GU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711612405; c=relaxed/simple;
	bh=hXUOINxev2sW2aHJR3Tsa4GArFRCJyPX7m0SK/yhJVM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YYKXXw+UZwnbRJjSPnYEotQGw1dOSVmj3pOX5VWwbMA2olOQHFgWZ7X8f0qwFWcphmTHJiTMuKpQ3BY6DvGgwdBTWtSUaqiPvxV1T1IyXFRhGaR5jayoq6jSGY3Hq0jFmuHChghISA30wtuTSzEfZTLp60OySSpkE2NErR3Q2uQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Sy5TyO3h; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Sy5TyO3h"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-6ea80de0e97so517784b3a.2;
        Thu, 28 Mar 2024 00:53:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711612403; x=1712217203; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VWzLPeLLlmGOBtEnLvR7ID/q8d8vc0GlObcdJceoe8U=;
        b=Sy5TyO3h5vBdOl8ATIlvfVgqOc1Jff7zsP6qI8m8yCQHY8tZL3xf5BW2PRkVimXpCp
         C3A0W+FXSjW7hP5LWXc14adyG3lk/2f6aRASjWwjuxAhnlBt6mcvfcoS0duFtvckJIl4
         xu1+teAOtTk732lCDD6CHcxutQu5gZ8ako7FKlik26ukeRxayaXgyGlxSVUx9OgjOH7e
         j3hyz3BE/Bbl98k0/TfY2Tw2tLurNUvwUYhiS2+PZMZKrKONcLYaE0afEdgsMBNFXuRD
         J3JnfaKQ4S2IRriXqlgIFghr39DuFWli4+C6Js/FQKt9qGtN47HjPPzep14yqsE6on11
         m61A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711612403; x=1712217203;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VWzLPeLLlmGOBtEnLvR7ID/q8d8vc0GlObcdJceoe8U=;
        b=pzOHzAiQjNMPFKib+4C32PtUZDprTJS4/OPtB6FpaFnG/MefZddu3VBFfbEqefB0J1
         uaDfLhlh/zVxjWh8h17AA3qGkqty8PTfBK9U3MdEZCu1CcyBEzMWfOFe15CkK1sNEorF
         PyB4AT3F/+gn59tuQmM3W0ckKDnh4ypJc3OQ8s6cN+nz/bxrZxPQCRpCqJFArShq55/p
         Q5wWKLxEbVnl/Fe9lyYU3z6cqPuNUYE/Bk3WFJMx9WZpyoKlbzBZnyZtjfH2HKORDGL6
         Zjhn6sh1uwTW7iBX6tqRoHbgB6vzTZBhojDzVR+KuztEslvrIANOu06CSCJ7muqBjwp/
         mz+g==
X-Forwarded-Encrypted: i=1; AJvYcCVLdv+VSuZo3I/EqFNquN9JUttJ5xzJoBU+T0y+VRZsb2TFdXARa6+U4jarOg1/KY8HqHmhACs0YjqPblI/Fs0GDGJZ8UCgI4itDuR7DQRJ/279+s7KewZ1TBS6pTUfJvu3u7XFZfGtOQ==
X-Gm-Message-State: AOJu0YyDx1jFSUmvR3cnqP8GSV0pf354CceFWYnhlgq6VuAwpBgyT0ym
	a785s/4XCgKJHefwTbZwONZ/FjFlV9mTI20aIDrBhZwpES4Sohwq
X-Google-Smtp-Source: AGHT+IGNSCAzjZUIEUhikEwCO0OBMmnJm83tV+FlDjZ9po4KHUV3/ZohPm+enyNSfYnUY3P+hJl5KA==
X-Received: by 2002:a05:6a20:d049:b0:1a3:6ec2:d23b with SMTP id hv9-20020a056a20d04900b001a36ec2d23bmr2957496pzb.15.1711612402804;
        Thu, 28 Mar 2024 00:53:22 -0700 (PDT)
Received: from ayush-HP-Pavilion-Gaming-Laptop-15-ec0xxx ([103.6.158.65])
        by smtp.gmail.com with ESMTPSA id d13-20020a170902654d00b001d9fc6df457sm879274pln.5.2024.03.28.00.53.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Mar 2024 00:53:22 -0700 (PDT)
Date: Thu, 28 Mar 2024 13:23:17 +0530
From: Ayush Tiwari <ayushtiw0110@gmail.com>
To: Paul Moore <paul@paul-moore.com>
Cc: alison.schofield@intel.com, mic@digikod.net,
	fabio.maria.de.francesco@linux.intel.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	gregkh@linuxfoundation.org, outreachy@lists.linux.dev,
	linux-security-module@vger.kernel.org
Subject: Re: [PATCH] LANDLOCK: use kmem_cache for landlock_object
Message-ID: <ZgUh7cIQIsOgvWpw@ayush-HP-Pavilion-Gaming-Laptop-15-ec0xxx>
References: <ZgSrBVidW1U6yP+h@ayush-HP-Pavilion-Gaming-Laptop-15-ec0xxx>
 <CAHC9VhRYDNoqkbkgdUSg-kYSHVbheD5NtezmVxyRakZ0-DzuSg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHC9VhRYDNoqkbkgdUSg-kYSHVbheD5NtezmVxyRakZ0-DzuSg@mail.gmail.com>

Hello Paul
Thanks a lot for the feedback. Apologies for the mistakes. Could you
help me in some places so that I can correct the errors, like:
On Wed, Mar 27, 2024 at 07:43:36PM -0400, Paul Moore wrote:
> On Wed, Mar 27, 2024 at 7:26 PM Ayush Tiwari <ayushtiw0110@gmail.com> wrote:
> >
> > Use kmem_cache replace kzalloc() calls with kmem_cache_zalloc() for
> > struct landlock_object and update the related dependencies.
> >
> > Signed-off-by: Ayush Tiwari <ayushtiw0110@gmail.com>
> > ---
> >  security/landlock/fs.c     |  2 +-
> >  security/landlock/object.c | 14 ++++++++++++--
> >  security/landlock/object.h |  4 ++++
> >  security/landlock/setup.c  |  2 ++
> >  4 files changed, 19 insertions(+), 3 deletions(-)
> 
> Hi Ayush,
> 
> Mickaël has the final say on Landlock patches, but I had a few
> comments that I've included below ...
> 
> > diff --git a/security/landlock/fs.c b/security/landlock/fs.c
> > index fc520a06f9af..227dd67dd902 100644
> > --- a/security/landlock/fs.c
> > +++ b/security/landlock/fs.c
> > @@ -124,7 +124,7 @@ static struct landlock_object *get_inode_object(struct inode *const inode)
> >         if (unlikely(rcu_access_pointer(inode_sec->object))) {
> >                 /* Someone else just created the object, bail out and retry. */
> >                 spin_unlock(&inode->i_lock);
> > -               kfree(new_object);
> > +               kmem_cache_free(landlock_object_cache, new_object);
> 
> See my comment below, but you may want to wrap this in a Landlock
> object API function.
Sure. I will definitely implement this.
> 
> >                 rcu_read_lock();
> >                 goto retry;
> > diff --git a/security/landlock/object.c b/security/landlock/object.c
> > index 1f50612f0185..df1354215617 100644
> > --- a/security/landlock/object.c
> > +++ b/security/landlock/object.c
> > @@ -17,6 +17,15 @@
> >
> >  #include "object.h"
> >
> > +struct kmem_cache *landlock_object_cache;
> > +
> > +void __init landlock_object_init(void)
> > +{
> > +       landlock_object_cache = kmem_cache_create(
> > +               "landlock_object_cache", sizeof(struct landlock_object), 0,
> > +               SLAB_PANIC, NULL);
> 
> The comments in include/linux/slab.h suggest using the KMEM_CACHE()
> macro, instead of kmem_cache_create(), as a best practice for creating
> slab caches.
> 
Sure. Apologies I didn't see that, I tried to implement it from scratch
using the reference from linux memory management APIs.
> > +}
> > +
> >  struct landlock_object *
> >  landlock_create_object(const struct landlock_object_underops *const underops,
> >                        void *const underobj)
> > @@ -25,7 +34,8 @@ landlock_create_object(const struct landlock_object_underops *const underops,
> >
> >         if (WARN_ON_ONCE(!underops || !underobj))
> >                 return ERR_PTR(-ENOENT);
> > -       new_object = kzalloc(sizeof(*new_object), GFP_KERNEL_ACCOUNT);
> > +       new_object =
> > +               kmem_cache_zalloc(landlock_object_cache, GFP_KERNEL_ACCOUNT);
> 
> If the line is too long, you might want to consider splitting the
> function parameters like this:
> 
>   new_object = kmem_cache_zalloc(landlock_object_cache,
>                                  GFP_KERNEL_ACCOUNT);
> 

Sure. I didn't do as it was below the 100 columns limit, but will
definitely implement it.
> >         if (!new_object)
> >                 return ERR_PTR(-ENOMEM);
> >         refcount_set(&new_object->usage, 1);
> > @@ -62,6 +72,6 @@ void landlock_put_object(struct landlock_object *const object)
> >                  * @object->underobj to @object (if it still exists).
> >                  */
> >                 object->underops->release(object);
> > -               kfree_rcu(object, rcu_free);
> > +               kmem_cache_free(landlock_object_cache, object);
> >         }
> >  }
> > diff --git a/security/landlock/object.h b/security/landlock/object.h
> > index 5f28c35e8aa8..8ba1af3ddc2e 100644
> > --- a/security/landlock/object.h
> > +++ b/security/landlock/object.h
> > @@ -13,6 +13,10 @@
> >  #include <linux/refcount.h>
> >  #include <linux/spinlock.h>
> >
> > +extern struct kmem_cache *landlock_object_cache;
> 
> This really is a decision for Mickaël, but you may want to make
> @landlock_object_cache private to object.c and create functions to
> manage it as needed, e.g. put/free operations.
> 
Okay. I didn't make it private as I was using it in fs.c to use
kmem_cache_free, but if this is supposed to be private, I can modify the
approach and expose it via some function, not directly exposing
landlock_object_cache.
> > +void __init landlock_object_init(void);
> > +
> >  struct landlock_object;
> >
> >  /**
> > diff --git a/security/landlock/setup.c b/security/landlock/setup.c
> > index f6dd33143b7f..a5fca4582ee1 100644
> 
> -- 
> paul-moore.com
I will make all the changes you mentioned, and as you said, I will
wait for Mickael's say.
