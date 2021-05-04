Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A31670
	for <linux-staging@lists.linux.dev>; Tue,  4 May 2021 11:55:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=h3EPt9T2mGUyus+ShdFHaeueBKd8gCSxTLbCM2fRUg0=; b=CIbcePInDC6f68d/cxjRFtAQQo
	IE3/xlBK6jc7Av0IY9x0Rul5piptd1cC55bPjSLTLfNaR5Y3Oc0mt1PQy+gUPh53MdqXBjSlAbK+c
	ayjeqDlqfudpYiXqnfEp7rOGVx/ZbsFoy/rrGfon8bwSYrckc2BPPJaxNl9CorVjfY/BPP/aFMNxH
	z0kYbuaMKjf5qm4YGwRp0Ux4dSc2jEKpC+KwQeIVSQt8oND1VKbTptiIhBNhrgWtqshwUknPr8XZt
	z6dDiRR2jJ7rfvky9QkBDzrTa0PITOW8sK58VKNgTq+AxU57Y79Hk0qR1AQqd/J4xi3aEm4XSyJRf
	dHN3Bcpw==;
Received: from willy by casper.infradead.org with local (Exim 4.94 #2 (Red Hat Linux))
	id 1ldtcx-00GWJm-6c; Tue, 04 May 2021 11:54:21 +0000
Date: Tue, 4 May 2021 12:54:11 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>,
	outreachy-kernel@googlegroups.com,
	David Kershner <david.kershner@unisys.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	sparmaintainer@unisys.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [Outreachy kernel] Re: [PATCH v6] staging: unisys: visorhba:
 Convert module from IDR to XArray
Message-ID: <20210504115411.GF1847222@casper.infradead.org>
References: <20210504100744.28073-1-fmdefrancesco@gmail.com>
 <20210504110001.GV1981@kadam>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210504110001.GV1981@kadam>

On Tue, May 04, 2021 at 02:00:01PM +0300, Dan Carpenter wrote:
> On Tue, May 04, 2021 at 12:07:44PM +0200, Fabio M. De Francesco wrote:
> > -static void setup_scsitaskmgmt_handles(struct idr *idrtable, spinlock_t *lock,
> > -				       struct uiscmdrsp *cmdrsp,
> > +static int setup_scsitaskmgmt_handles(struct xarray *xa, struct uiscmdrsp *cmdrsp,
> >  				       wait_queue_head_t *event, int *result)
> >  {
> > -	/* specify the event that has to be triggered when this */
> > -	/* cmd is complete */
> > -	cmdrsp->scsitaskmgmt.notify_handle =
> > -		simple_idr_get(idrtable, event, lock);
> > -	cmdrsp->scsitaskmgmt.notifyresult_handle =
> > -		simple_idr_get(idrtable, result, lock);
> > +	int ret;
> > +	u32 id;
> > +
> > +	/* specify the event that has to be triggered when this cmd is complete */
> > +	ret = xa_alloc_irq(xa, &id, event, xa_limit_32b, GFP_KERNEL);
> > +	if (ret == 0)
> > +		cmdrsp->scsitaskmgmt.notify_handle = id;
> > +	else
> > +		return ret;
> 
> Reverse the condition.  Always do error handling, not success handling.
> Try keep the success path at one tab indent and the failure path at two
> tab indents.
> 
> 	ret = xa_alloc_irq(xa, &id, event, xa_limit_32b, GFP_KERNEL);
> 	if (ret)
> 		return ret;
> 	cmdrsp->scsitaskmgmt.notify_handle = id;
> 
> 	ret = xa_alloc_irq(xa, &id, result, xa_limit_32b, GFP_KERNEL);
> 	if (ret) {
> 		xa_erase(xa, cmdrsp->scsitaskmgmt.notify_handle);

umm.  When you put these things right next to each other, it's obvious
that should be xa_erase_irq().

> > -static void cleanup_scsitaskmgmt_handles(struct idr *idrtable,
> > +static void cleanup_scsitaskmgmt_handles(struct xarray *xa,
> >  					 struct uiscmdrsp *cmdrsp)
> >  {
> > -	if (cmdrsp->scsitaskmgmt.notify_handle)
> > -		idr_remove(idrtable, cmdrsp->scsitaskmgmt.notify_handle);
> > -	if (cmdrsp->scsitaskmgmt.notifyresult_handle)
> > -		idr_remove(idrtable, cmdrsp->scsitaskmgmt.notifyresult_handle);
> > +	xa_erase(xa, cmdrsp->scsitaskmgmt.notify_handle);
> > +	xa_erase(xa, cmdrsp->scsitaskmgmt.notifyresult_handle);

If this code were even run, assuming the appropriate lockdep options
were enabled, xarray would point out that you were taking a lock with
interrupts enabled that was previously taken with interrupts disabled.
That's a good thing!  Because before, this code was deleting entries
from the IDR with _no_ locking.

So these should both be xa_erase_irq().

> > @@ -1096,8 +1085,6 @@ static void visorhba_remove(struct visor_device *dev)
> >  	scsi_remove_host(scsihost);
> >  	scsi_host_put(scsihost);
> >  
> > -	idr_destroy(&devdata->idr);
> 
> Do we not have to call xa_destroy()?

Correct.  We covered this in earlier iterations of this series and I
don't feel like typing out the explanation again.

