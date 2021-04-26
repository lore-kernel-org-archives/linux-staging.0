Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 025DE72
	for <linux-staging@lists.linux.dev>; Mon, 26 Apr 2021 10:39:28 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id h10so65101959edt.13
        for <linux-staging@lists.linux.dev>; Mon, 26 Apr 2021 03:39:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gzHm2Q3m5eV6N16rIWqgxmdmJyqiVMUv0odqYwAOQNQ=;
        b=UpGKxYZTYfaT1MCe+bXuvLXU2xxGlwemq1AZuAKSU97jwPrPiYg5ffkj00lGDG1eJw
         GZxESO91tagyp80tGf6ndDaDmRvlfcsVjLw0OvT8qenKcB7lhwyV0ZlQO4RIIUNVE1GK
         TIKMcdf9qIORVpthXZnGZVA4GlkmcSTu5FvzSpoYzUCARVGCRK7Cl5VBCck5AeKQi2hH
         w9ZazKzeyXbMLq2hVRhg3cVi95PKeN9vDH3VQkKxn9PSzlAwA/acazumpND7gl0+YyZy
         /ernYeqfEiJh66J6qOZtGgX77b5eM4mb3PDu3iHoRNd951tEdGpbCnCJaGFS2UrTDISV
         s/ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gzHm2Q3m5eV6N16rIWqgxmdmJyqiVMUv0odqYwAOQNQ=;
        b=ExWGV2RZqkuCTk007fZ3X2i+7eHmc+mpzzsLf9zt+LboRHTsxKd+lTsCNZpyFLkmQI
         HaqZn0HmOU9KMxCrFleFnY9N7DI10n1wUTbwwx++7PFqc3XJwbyPePF7J7WlBBg1Ls//
         MBiiowVa3cu/+5rCgTqAFVDj0GqqO6uSanB7RlbQOFjbme/anTGVp+Bn8BLGtCiYk8i8
         ws5fpQQarwOMC9X5GVg8X4ncBH8DYqQjexmeeCZIUEu0n/ivOOKYkhdqgugqOqk8WD2o
         W/l35b7KRfpqw/yCBeP9rRo9Lx3Bs3pYe3X+zhVorq/jp+HwgZY1tUUllh5ZwR4CPB+7
         0QOQ==
X-Gm-Message-State: AOAM531gWVq7J2HIA19ZkVveOmryb10suAnTK6O2AXFMiLVkiQbVBTTn
	wS2yyS/swZ6h4e9I8xpJhNg=
X-Google-Smtp-Source: ABdhPJxPR9QPG3UeK+zaOlu4evCRetKoiS1xibepvH7xcBd/uQAy0GBKqZ6Xplz7t9X3ZFdNtZ7mtw==
X-Received: by 2002:a50:ed0c:: with SMTP id j12mr13505252eds.12.1619433567449;
        Mon, 26 Apr 2021 03:39:27 -0700 (PDT)
Received: from linux.local (host-79-52-107-152.retail.telecomitalia.it. [79.52.107.152])
        by smtp.gmail.com with ESMTPSA id u6sm11251505ejn.14.2021.04.26.03.39.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Apr 2021 03:39:27 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: outreachy-kernel@googlegroups.com, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, David Kershner <david.kershner@unisys.com>, Matthew Wilcox <willy@infradead.org>, Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [Outreachy kernel] [RFC PATCH] staging: unisys: visorhba: Convert module from IDR to XArray
Date: Mon, 26 Apr 2021 12:39:25 +0200
Message-ID: <70412520.S8q5jszebs@linux.local>
In-Reply-To: <YIaORY3B6+6vMvFj@kroah.com>
References: <20210426095015.18556-1-fmdefrancesco@gmail.com> <YIaORY3B6+6vMvFj@kroah.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday, April 26, 2021 11:56:21 AM CEST Greg Kroah-Hartman wrote:
> On Mon, Apr 26, 2021 at 11:50:15AM +0200, Fabio M. De Francesco wrote:
> > Converted visorhba from IDR to XArray. The abstract data type XArray is
> > more memory-efficient, parallelisable and cache friendly. It takes
> > advantage of RCU to perform lookups without locking.
> > 
> > Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
> > ---
> > 
> >  .../staging/unisys/visorhba/visorhba_main.c   | 107 +++++++-----------
> >  1 file changed, 44 insertions(+), 63 deletions(-)
> > 
> > diff --git a/drivers/staging/unisys/visorhba/visorhba_main.c
> > b/drivers/staging/unisys/visorhba/visorhba_main.c index 
4455d26f7c96..851e60ab0c46
> > 100644
> > --- a/drivers/staging/unisys/visorhba/visorhba_main.c
> > +++ b/drivers/staging/unisys/visorhba/visorhba_main.c
> > @@ -6,10 +6,10 @@
> > 
> >  #include <linux/debugfs.h>
> >  #include <linux/kthread.h>
> > 
> > -#include <linux/idr.h>
> > 
> >  #include <linux/module.h>
> >  #include <linux/seq_file.h>
> >  #include <linux/visorbus.h>
> > 
> > +#include <linux/xarray.h>
> > 
> >  #include <scsi/scsi.h>
> >  #include <scsi/scsi_host.h>
> >  #include <scsi/scsi_cmnd.h>
> > 
> > @@ -23,6 +23,8 @@
> > 
> >  #define MAX_PENDING_REQUESTS (MIN_NUMSIGNALS * 2)
> >  #define VISORHBA_ERROR_COUNT 30
> > 
> > +static DEFINE_XARRAY_ALLOC(xa_dtstr);
> > +
> > 
> >  static struct dentry *visorhba_debugfs_dir;
> >  
> >  /* GUIDS for HBA channel type supported by this driver */
> > 
> > @@ -78,12 +80,6 @@ struct visorhba_devdata {
> > 
> >  	unsigned int max_buff_len;
> >  	int devnum;
> >  	struct uiscmdrsp *cmdrsp;
> > 
> > -	/*
> > -	 * allows us to pass int handles back-and-forth between us and
> > -	 * iovm, instead of raw pointers
> > -	 */
> > -	struct idr idr;
> > -
> > 
> >  	struct dentry *debugfs_dir;
> >  	struct dentry *debugfs_info;
> >  
> >  };
> > 
> > @@ -183,32 +179,16 @@ static struct uiscmdrsp 
*get_scsipending_cmdrsp(struct
> > visorhba_devdata *ddata,> 
> >  }
> >  
> >  /*
> > 
> > - * simple_idr_get - Associate a provided pointer with an int value
> > - *		    1 <= value <= INT_MAX, and return this int value;
> > - *		    the pointer value can be obtained later by passing
> > - *		    this int value to idr_find()
> > - * @idrtable: The data object maintaining the pointer<-->int mappings
> > - * @p:	      The pointer value to be remembered
> > - * @lock:     A spinlock used when exclusive access to idrtable is needed
> > - *
> > - * Return: The id number mapped to pointer 'p', 0 on failure
> > + * simple_xa_dtstr_get - Store a pointer to xa_dtstr xarray
> > + * @id: Pointer to ID
> > + * @entry: New entry
> > 
> >   */
> > 
> > -static unsigned int simple_idr_get(struct idr *idrtable, void *p,
> > -				   spinlock_t *lock)
> > +static int simple_xa_dtstr_get(u32 *id, void *entry)
> 
> What are you trying to really "get" here?  We shouldn't name the
> function based on the data type being used.  All we want is some sort of
> "token" or hash or something else?  It's hard to tell...
> 
Sorry, I am so lazy that I just substituted the _idr_ in the old name with 
_xa_dtstr_. Perhaps simple_entry_get() would be better. it deserves a v2.
>
> >  {
> > 
> > -	int id;
> > -	unsigned long flags;
> > +	int ret = xa_alloc_irq(&xa_dtstr, id, entry, xa_limit_32b, 
GFP_NOWAIT);
> > +	/* TODO: check for and manage errors */
> 
> That's a nice TODO, which means we really should not be considering this
> patch to be merged, right?
>
Right, lazy again :)

The fact is that I was just interested in conversion from IDR to XArray 
because this would be the main subject of the project I applied for the DRM 
subsystem. Therefore, where I didn't find proper error checking and management 
in the old code, I simply wrote some TODO. 

I suppose that some more knowledge of both Linux device drivers programming 
and of that specific driver is needed to do proper management of errors in 
order to unwind what is already done by the code and leave everything in a 
consistent state. I'd left that work to Unisys developers, if you don't mind. 
I'd prefer to simply remove those TODO from where I placed them. I hope that 
you agree with me.

Thanks for your review,

Fabio 
> 
> thanks,
> 
> greg k-h




