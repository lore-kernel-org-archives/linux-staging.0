Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87EA78BFC;
	Fri, 29 Mar 2024 06:32:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711693951; cv=none; b=MX8/wX/qIqhT4ld8+Gwo+iAk8EMeqUUKtXkLJvF3h2uQlC+C7nbB5K17qRjq1BcBKF0FvlH4RKFEQ8jag4nGHymGLGfQ9n5L1FuFmL8B+VrbxF9B0ov+8oNt2zW5TbfbCJ+M/wl8g2E4hPMOWJ931D7yD1RLtqm3wm2glpsQECs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711693951; c=relaxed/simple;
	bh=gmr2fGvLS//TG94CAfSgeLtnfySif1Al3X5cocCuKwk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NwZsyxvWUGCnSyFPFdmp0SvUJR+UYT/0t8+Nq/ei0L9UisQAGPpRtz9RgWubuiJVSTJYZpXd+fgojmeozjDDaUukAAFyGVB92L8bVHl0bhdgGB5FEVDUwM5efi2xKJbIFLwLR55M1fMra2gXUeJbNNHzxf7pqw+QwKcRFMUD6e4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WNuOqVj3; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WNuOqVj3"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-5cddfe0cb64so1008984a12.0;
        Thu, 28 Mar 2024 23:32:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711693949; x=1712298749; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ndZTDMZkOJjEBIZTkRxOowZw+YYG8BnbmCDk2dhnrRA=;
        b=WNuOqVj33K1+1e/gvKEkUj62b/riMmekX3PGiC3WhsRRHHD4pPjVqeqioQdJuVblJi
         BORFjzPcYjuxDMIC6I5XIZbMD3HBf3hvjw2qIonGJqZRE5mxFK76fZFiNmulpAMToHZl
         +oSpj9GT4MS0z2nR2iS/JYeXcVYKi81ty3XdZc9HqFR0TBZ0FE++IYpT6B2c7DAdhWJE
         SJVRyvyhfeU1eErOqIDUh9O0eR9R1gsugvfMKoM9SE9UV3E62Z4CUIcojLmKolxGMLp8
         /L6v4bfMffa8QQGKLBUE9083UDsSErqXnIfBZzgczcxFmf0TMeq/uZcAEU23XRoBflnC
         7HIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711693949; x=1712298749;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ndZTDMZkOJjEBIZTkRxOowZw+YYG8BnbmCDk2dhnrRA=;
        b=LzIPe03kwC0eS96pnCVVLqUwxaucwPOTpZ5qAo8TgHQMQUh3N+k6rtBekXFL/qwBZt
         LByrMbCikujnnwfSsqWgGhpmFHjxHmArDqwmaTWKDGnLsVYV3Kg6w9bPYdwHOHV7Qjh+
         7J7jWpIQQHtKbTp9ASQdvdpiGW6wHz6Iazwyh5h3xl2XvqwQnetqlrfnwLfG4tuqngls
         KGP6ni3mKIxa1eeBPt9S/FXOD57ndtjg3L75Zg8Pb3n/n6uoPmU7JUnLWtvnvBdYqbIa
         MIIhvpR41D1/r8A1gH6EU/5/AuHGko91W75ncgUo5o/AeBKLnFTKiA4QtEtQNmid+SIt
         6OLA==
X-Forwarded-Encrypted: i=1; AJvYcCUUBRIb3rRn4XObXE2cFY3ysdbZGA9xhN2T3FsWvulu/r32ENDIspXm6lwc+Sta21komebrqabKvx8iM/ebxkGla7Awg0MGSPtKU1645n0lc3irD8AhUBXC42N4HBYYt2SMfcssBhIilw==
X-Gm-Message-State: AOJu0YyXXaHkmCRfYXLU88T1mP8iKO+arPr6DtMgu5BB3v/+MPMg7i9K
	tMKQNSSA6cj/Pa8sNhGwtrHWTbWreiPPEx37oTTvYCbtOJpld7IP
X-Google-Smtp-Source: AGHT+IFRmRQDyi7wwRtuc+POHnQVkysYigDwuTM6Oj37xtRf77j8LUvU+FV6uM1zEsYDb2Kum7ldDQ==
X-Received: by 2002:a17:902:c406:b0:1de:eac5:9294 with SMTP id k6-20020a170902c40600b001deeac59294mr1828172plk.13.1711693948781;
        Thu, 28 Mar 2024 23:32:28 -0700 (PDT)
Received: from ayush-HP-Pavilion-Gaming-Laptop-15-ec0xxx ([2401:4900:3a8b:cfcd:75f4:f0e2:44ea:221c])
        by smtp.gmail.com with ESMTPSA id l4-20020a170902f68400b001db8a5ea0a3sm2742058plg.94.2024.03.28.23.32.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Mar 2024 23:32:28 -0700 (PDT)
Date: Fri, 29 Mar 2024 12:02:16 +0530
From: Ayush Tiwari <ayushtiw0110@gmail.com>
To: =?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>
Cc: paul@paul-moore.com, alison.schofield@intel.com,
	fabio.maria.de.francesco@linux.intel.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	gregkh@linuxfoundation.org, outreachy@lists.linux.dev,
	linux-security-module@vger.kernel.org
Subject: Re: [PATCH] LANDLOCK: use kmem_cache for landlock_object
Message-ID: <ZgZgcPxkG1TEVnt6@ayush-HP-Pavilion-Gaming-Laptop-15-ec0xxx>
References: <ZgSrBVidW1U6yP+h@ayush-HP-Pavilion-Gaming-Laptop-15-ec0xxx>
 <CAHC9VhRYDNoqkbkgdUSg-kYSHVbheD5NtezmVxyRakZ0-DzuSg@mail.gmail.com>
 <ZgUh7cIQIsOgvWpw@ayush-HP-Pavilion-Gaming-Laptop-15-ec0xxx>
 <20240328.aiPh0phaJ6ai@digikod.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240328.aiPh0phaJ6ai@digikod.net>

On Thu, Mar 28, 2024 at 03:45:12PM +0100, Mickaël Salaün wrote:
> The subject should start with "landlock: Use" instead of "LANDLOCK: use"
> 
> On Thu, Mar 28, 2024 at 01:23:17PM +0530, Ayush Tiwari wrote:
> > Hello Paul
> > Thanks a lot for the feedback. Apologies for the mistakes. Could you
> > help me in some places so that I can correct the errors, like:
> > On Wed, Mar 27, 2024 at 07:43:36PM -0400, Paul Moore wrote:
> > > On Wed, Mar 27, 2024 at 7:26 PM Ayush Tiwari <ayushtiw0110@gmail.com> wrote:
> > > >
> > > > Use kmem_cache replace kzalloc() calls with kmem_cache_zalloc() for
> > > > struct landlock_object and update the related dependencies.
> > > >
> > > > Signed-off-by: Ayush Tiwari <ayushtiw0110@gmail.com>
> > > > ---
> > > >  security/landlock/fs.c     |  2 +-
> > > >  security/landlock/object.c | 14 ++++++++++++--
> > > >  security/landlock/object.h |  4 ++++
> > > >  security/landlock/setup.c  |  2 ++
> > > >  4 files changed, 19 insertions(+), 3 deletions(-)
> > > 
> > > Hi Ayush,
> > > 
> > > Mickaël has the final say on Landlock patches, but I had a few
> > > comments that I've included below ...
> > > 
> > > > diff --git a/security/landlock/fs.c b/security/landlock/fs.c
> > > > index fc520a06f9af..227dd67dd902 100644
> > > > --- a/security/landlock/fs.c
> > > > +++ b/security/landlock/fs.c
> > > > @@ -124,7 +124,7 @@ static struct landlock_object *get_inode_object(struct inode *const inode)
> > > >         if (unlikely(rcu_access_pointer(inode_sec->object))) {
> > > >                 /* Someone else just created the object, bail out and retry. */
> > > >                 spin_unlock(&inode->i_lock);
> > > > -               kfree(new_object);
> > > > +               kmem_cache_free(landlock_object_cache, new_object);
> > > 
> > > See my comment below, but you may want to wrap this in a Landlock
> > > object API function.
> > Sure. I will definitely implement this.
> > > 
> > > >                 rcu_read_lock();
> > > >                 goto retry;
> > > > diff --git a/security/landlock/object.c b/security/landlock/object.c
> > > > index 1f50612f0185..df1354215617 100644
> > > > --- a/security/landlock/object.c
> > > > +++ b/security/landlock/object.c
> > > > @@ -17,6 +17,15 @@
> > > >
> > > >  #include "object.h"
> > > >
> > > > +struct kmem_cache *landlock_object_cache;
> > > > +
> > > > +void __init landlock_object_init(void)
> > > > +{
> > > > +       landlock_object_cache = kmem_cache_create(
> > > > +               "landlock_object_cache", sizeof(struct landlock_object), 0,
> 
> No need for the "_cache" name suffix.
> 
> > > > +               SLAB_PANIC, NULL);
> > > 
> > > The comments in include/linux/slab.h suggest using the KMEM_CACHE()
> > > macro, instead of kmem_cache_create(), as a best practice for creating
> > > slab caches.
> > > 

Hello mentors
I was trying to work on the above suggestion and I am facing some problem
regarding replacing kzalloc with kmem_cache_zalloc calls when using KMEM
macro from include/linux/slab.h because for kmem_cache_zalloc I will be
needing a cache pointer, but KMEM macro doesn't return any such pointer.
So is there any way to do this using macro or do i have to avoid using
that macro for this case and use all methods regarding kmem as defined in
the linux memory management API doc?

> Agree with Paul and Greg unless commented otherwise. Thanks
