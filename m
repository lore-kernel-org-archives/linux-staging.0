Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBF262F26
	for <linux-staging@lists.linux.dev>; Tue,  8 Feb 2022 09:48:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 044BDC004E1;
	Tue,  8 Feb 2022 09:48:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1644313723;
	bh=Jr+sZHpsrK0CTn986hnaOkGXEBbNrbNjqqaLRgclFz0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CFlMNBOoX0IJ4AnR+xh58Q35hh38kR33v1i+6vHYOEdz2LeOUdWwkY1mZi+1DhGIx
	 UJqwwK7nck0KMH0W1av45J37PQx1ANyhi7LIvH+x/uxJ05uvEkvH7/T6QqYp5o04A+
	 MGQKexaEBmNNKg+BuvUCNsDTosMhK9Vi2TCkc7GI=
Date: Tue, 8 Feb 2022 10:48:40 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: Leonardo Araujo <leonardo.aa88@gmail.com>, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH] Staging : android: Struct file_operations should be const
Message-ID: <YgI8eO4T+CAmcAlc@kroah.com>
References: <20220207031711.13644-1-leonardo.aa88@gmail.com>
 <YgFCPbnqs40wS+j1@zeniv-ca.linux.org.uk>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YgFCPbnqs40wS+j1@zeniv-ca.linux.org.uk>

On Mon, Feb 07, 2022 at 04:01:01PM +0000, Al Viro wrote:
> On Mon, Feb 07, 2022 at 12:17:11AM -0300, Leonardo Araujo wrote:
> > From: "Leonardo Araujo" <leonardo.aa88@gmail.com>
> > 
> > WARNING: struct file_operations should normally be const
> > 
> > Signed-off-by: Leonardo Araujo <leonardo.aa88@gmail.com>
> > ---
> >  drivers/staging/android/ashmem.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/staging/android/ashmem.c b/drivers/staging/android/ashmem.c
> > index ddbde3f8430e..4c6b420fbf4d 100644
> > --- a/drivers/staging/android/ashmem.c
> > +++ b/drivers/staging/android/ashmem.c
> > @@ -377,7 +377,7 @@ ashmem_vmfile_get_unmapped_area(struct file *file, unsigned long addr,
> >  
> >  static int ashmem_mmap(struct file *file, struct vm_area_struct *vma)
> >  {
> > -	static struct file_operations vmfile_fops;
> > +	static const struct file_operations vmfile_fops;
> >  	struct ashmem_area *asma = file->private_data;
> >  	int ret = 0;
> 
> Wait a minute.  Why the hell would it possibly want a private instance
> of all-NULLs file_operations?  Odd...
> <checks>
>                 if (!vmfile_fops.mmap) {
>                         vmfile_fops = *vmfile->f_op;
>                         vmfile_fops.mmap = ashmem_vmfile_mmap;
>                         vmfile_fops.get_unmapped_area =
>                                         ashmem_vmfile_get_unmapped_area;
>                 }
> Er...  So it *is* modified down the road.  What, in your opinion, is signified
> by the const you are adding?
> 
> Folks, could we please have the first "WARNING" in checkpatch.pl output replaced
> with
> "I'm a dumb script; this line looks like there might be something fishy in the
> area.  Somebody smarter than me might want to take a look and figure out if
> there's something wrong going on there.  From now on I'll mark all such places
> with 'WARNING' (with the summary of heuristics that pointed to them), to avoid
> repeating the above".
> 
> Pretty please?  This exact trap keeps snagging newbies - folks misinterpret
> "this place might be worth looking into" for "great (s)tool says: this is
> what's wrong there; must propitiate the great (s)tool!"
> 
> In this case the damage is minimal - the resulting change would be instantly
> caught by compiler, so it's just a matter of mild embarrassment for poster.
> In other cases results had been nowhere near as mild.

It's a great "catch" for people who try to modify the kernel and then
never actually test-build their changes.  So for that reason alone I
like it as it does reinforce the need for drive-by people to at least
build the kernel tree.

> Incidentally, the place those heuristics had pointed too _DOES_ look fishy,
> indeed.  What happens, AFAICS, is that the first time we hit that branch
> (asma->file being NULL) we stash a copy of whatever file_operations we get
> on file obtained by shmem_setup_file() (IOW, shmem_file_operations),
> with ->mmap and ->get_unmapped_area replaced with local functions.
> This is a bloody convoluted way to do things, not to mention being rather
> brittle...
> 

Ashmem is horrid and is not used by the Android project anymore, except
by really old userspace programs.  I think we could just delete it
entirely now, I'll go ask the Android developers about it.

thanks,

greg k-h
