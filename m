Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB9CACA5C
	for <linux-staging@lists.linux.dev>; Mon, 14 Aug 2023 20:51:16 +0000 (UTC)
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-6bd092cba5dso2920305a34.1
        for <linux-staging@lists.linux.dev>; Mon, 14 Aug 2023 13:51:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692046275; x=1692651075;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=j6w5W3N4z/R1wmqArsnIh7Uu9/mMtIFy3tf8fGTkmf8=;
        b=NZXGALlzO36NaPHcKVSp64zmWXpa4qjPlQv9O5S8Nfub9f76N+VugvnyjOczh/UIgO
         RSY2x8gplNQh9vaUE+smPBPPm1ZKUKyJKVRUpVq4V172q7GTx8VwvC2ksw5xIrXmja48
         DgQRXAWWWFl+BdXga6KIz3wu8htgTO2Otnm9/f8H/SUdgWgdGipQ87cQAyUHatHVLomL
         oInYPecehZbiu3CStqsLod7gxexVjbF4306l8wmBwtAc7l9/GsRrommap1qbeGVYLIbr
         VWdu9Y0KusxZUn7PZwwdxCbQ/7UzkpcZwOz2kXX4syCUuW94VQIC+mhrNGWZMmmzeulh
         dpBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692046275; x=1692651075;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j6w5W3N4z/R1wmqArsnIh7Uu9/mMtIFy3tf8fGTkmf8=;
        b=LA7Zg0iXvCBaunz3qr1GzOUeWMHAQCPM6gLn1b+cL0eVjTf6PlVEL8EDKhAK7SS4hP
         mr+ZNwymIcsT8zb53gRmCI1kD6MMOShvEewWYV1gLKpTBbJMb/C1F6JAd33KFlTZcYwb
         hfqwllAlXhbBEMzoOyZIxipMgnh6WMQIUcbgPWx/f266pjyMGARN6DQ/2URLJWKGS7FM
         WoeF/dWE3gn2ML90VV2UoKa9RdOnLNriSt4KQXupLBD7ow0wdYJuNxm5j/WMm+RsdLTf
         /18kPe97uKLWcgKXCqILZySd3aO7V/9RfeHzbTDUhaCXocPAKy2pp8LXqU8PIezHpw3y
         ys6A==
X-Gm-Message-State: AOJu0Yz5vjOeqkTGmpD2OEMKg8Rj7+e/jL98Jv26yvMdkACT4JWSEAIM
	uRNBFEVFM6Amq5PI3OdGTBA=
X-Google-Smtp-Source: AGHT+IF8To7ajDk5voVdr7BnC5C2Un42fuBi9miXKH+18ua+CD0ak8K77xvG6K+Mw1dC4EZPJV/myA==
X-Received: by 2002:a9d:6d93:0:b0:6bc:6445:e24f with SMTP id x19-20020a9d6d93000000b006bc6445e24fmr43784otp.19.1692046275651;
        Mon, 14 Aug 2023 13:51:15 -0700 (PDT)
Received: from alolivei-thinkpadt480s.gru.csb ([2804:14c:bf20:86d6:7871:f7e9:8a15:865a])
        by smtp.gmail.com with ESMTPSA id l6-20020a9d7346000000b006b991ac6408sm4727797otk.40.2023.08.14.13.51.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Aug 2023 13:51:15 -0700 (PDT)
Date: Mon, 14 Aug 2023 17:51:10 -0300
From: Alexon Oliveira <alexondunkan@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: martyn@welchs.me.uk, manohar.vanga@gmail.com,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: vme_user: fix check blank lines not necessary
Message-ID: <ZNqTvrQiprKkeX1z@alolivei-thinkpadt480s.gru.csb>
References: <ZNqBd/08H/Y5UEOm@alolivei-thinkpadt480s.gru.csb>
 <2023081448-sustainer-prelaw-25a2@gregkh>
 <ZNqPIvaQJ9HO8p9x@alolivei-thinkpadt480s.gru.csb>
 <2023081410-railroad-overbill-cb05@gregkh>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2023081410-railroad-overbill-cb05@gregkh>

On Mon, Aug 14, 2023 at 10:46:39PM +0200, Greg KH wrote:
> On Mon, Aug 14, 2023 at 05:31:30PM -0300, Alexon Oliveira wrote:
> > On Mon, Aug 14, 2023 at 10:17:10PM +0200, Greg KH wrote:
> > > On Mon, Aug 14, 2023 at 04:33:11PM -0300, Alexon Oliveira wrote:
> > > > Fixed all CHECK: Blank lines aren't necessary after an open brace '{'
> > > > and CHECK: Blank lines aren't necessary before a close brace '}'
> > > > as reported by checkpatch to adhere to the Linux kernel
> > > > coding-style guidelines.
> > > > 
> > > > Signed-off-by: Alexon Oliveira <alexondunkan@gmail.com>
> > > > ---
> > > >  drivers/staging/vme_user/vme.c | 5 -----
> > > >  1 file changed, 5 deletions(-)
> > > > 
> > > > diff --git a/drivers/staging/vme_user/vme.c b/drivers/staging/vme_user/vme.c
> > > > index 5eb0d780c77f..c7c50406c199 100644
> > > > --- a/drivers/staging/vme_user/vme.c
> > > > +++ b/drivers/staging/vme_user/vme.c
> > > > @@ -308,7 +308,6 @@ struct vme_resource *vme_slave_request(struct vme_dev *vdev, u32 address,
> > > >  		if (((slave_image->address_attr & address) == address) &&
> > > >  		    ((slave_image->cycle_attr & cycle) == cycle) &&
> > > >  		    (slave_image->locked == 0)) {
> > > > -
> > > >  			slave_image->locked = 1;
> > > >  			mutex_unlock(&slave_image->mtx);
> > > >  			allocated_image = slave_image;
> > > > @@ -510,7 +509,6 @@ struct vme_resource *vme_master_request(struct vme_dev *vdev, u32 address,
> > > >  		    ((master_image->cycle_attr & cycle) == cycle) &&
> > > >  		    ((master_image->width_attr & dwidth) == dwidth) &&
> > > >  		    (master_image->locked == 0)) {
> > > > -
> > > >  			master_image->locked = 1;
> > > >  			spin_unlock(&master_image->lock);
> > > >  			allocated_image = master_image;
> > > > @@ -682,10 +680,8 @@ ssize_t vme_master_read(struct vme_resource *resource, void *buf, size_t count,
> > > >  		count = length - offset;
> > > >  
> > > >  	return bridge->master_read(image, buf, count, offset);
> > > > -
> > > >  }
> > > >  EXPORT_SYMBOL(vme_master_read);
> > > > -
> > > 
> > > This line needs to be there, checkpatch should not have complained about
> > > it.
> > > 
> > 
> > Hmm, ACK. It complained, as below:
> > 
> > CHECK: Blank lines aren't necessary after an open brace '{'
> > #311: FILE: drivers/staging/vme_user/vme.c:311:
> > +		    (slave_image->locked == 0)) {
> > +
> > --
> > CHECK: Blank lines aren't necessary after an open brace '{'
> > #513: FILE: drivers/staging/vme_user/vme.c:513:
> > +		    (master_image->locked == 0)) {
> > +
> > --
> > CHECK: Blank lines aren't necessary before a close brace '}'
> > #684: FILE: drivers/staging/vme_user/vme.c:684:
> > +
> > +}
> > --
> > CHECK: Blank lines aren't necessary before a close brace '}'
> > #686: FILE: drivers/staging/vme_user/vme.c:686:
> > +
> > +}
> > --
> > CHECK: Blank lines aren't necessary after an open brace '{'
> > #890: FILE: drivers/staging/vme_user/vme.c:890:
> > +		    (dma_ctrlr->locked == 0)) {
> > +
> > --
> > 
> > Should I keep them then and forget this patch?
> 
> No, those are all valid warnings.  You removed a line that checkpatch
> did not complain about, and should not be removed :(
> 

Oh, I see it now. My bad. Keyboard issues. Fixing it now and re-submitting it.

> thanks,
> 
> greg k-h

Thank you.

Alexon Oliveira
