Received: from mail3-relais-sop.national.inria.fr (mail3-relais-sop.national.inria.fr [192.134.164.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1155101C1;
	Thu, 12 Oct 2023 07:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b="UGcSCDh2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=Es7QN2GEuzhlQdl0k2scO4nnsg4P8+3YcCL5L8h6RlA=;
  b=UGcSCDh23Bz2f36LsEoJPPGkcVvqGmN678hSB70f31nwLBZmObbvWSv1
   tcpWdZ6m6/un2kLdQLhD3OgAJF9WSxUM4uI+JZ0U8/IvLMae3CTqKCKjE
   iYHAu3SzTvS75yUa+7q8QGmgKnr3TNSkwg+7L6EizcRYgFKkgsNV+zqbe
   k=;
Authentication-Results: mail3-relais-sop.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.03,218,1694728800"; 
   d="scan'208";a="68479733"
Received: from dt-lawall.paris.inria.fr ([128.93.67.65])
  by mail3-relais-sop.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2023 09:51:27 +0200
Date: Thu, 12 Oct 2023 09:51:27 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
To: Soumya Negi <soumya.negi97@gmail.com>
cc: Dan Carpenter <dan.carpenter@linaro.org>, 
    Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
    Micky Ching <micky_ching@realsil.com.cn>, outreachy@lists.linux.dev, 
    linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rts5208: Parenthesize macro arguments
In-Reply-To: <20231012074837.GE16374@Negi>
Message-ID: <a1556f74-83ef-d32-103d-6b0b0233473@inria.fr>
References: <20231012050240.20378-1-soumya.negi97@gmail.com> <81d6e283-fd87-4fd6-964f-22cbf420cdaa@kadam.mountain> <20231012074837.GE16374@Negi>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII



On Thu, 12 Oct 2023, Soumya Negi wrote:

> Hi Dan,
>
> On Thu, Oct 12, 2023 at 09:33:07AM +0300, Dan Carpenter wrote:
> > On Wed, Oct 11, 2023 at 10:02:40PM -0700, Soumya Negi wrote:
> > > Use parenthesis with macro arguments to avoid possible precedence
> ...
> > >   */
> > >  #define rtsx_writel(chip, reg, value) \
> > > -	iowrite32(value, (chip)->rtsx->remap_addr + reg)
> > > +	iowrite32(value, (chip)->rtsx->remap_addr + (reg))
> >
> > These would be better as functions instead of defines.
>
> There are actually more macros in the code. Should all of
> them be redefined as functions? The original code looks like this:

You should make a static inline function if you can.  That would require
that the parameter types are the same at all call sites and that all of
the arguments are used as values, not eg as the left side of an assignment
(looks fine here).

>
> /*
>  * macros for easy use
>  */
> #define rtsx_writel(chip, reg, value) \
> 	iowrite32(value, (chip)->rtsx->remap_addr + reg)
> #define rtsx_readl(chip, reg) \
> 	ioread32((chip)->rtsx->remap_addr + reg)
> #define rtsx_writew(chip, reg, value) \
> 	iowrite16(value, (chip)->rtsx->remap_addr + reg)
> #define rtsx_readw(chip, reg) \
> 	ioread16((chip)->rtsx->remap_addr + reg)
> #define rtsx_writeb(chip, reg, value) \
> 	iowrite8(value, (chip)->rtsx->remap_addr + reg)
> #define rtsx_readb(chip, reg) \
> 	ioread8((chip)->rtsx->remap_addr + reg)
>
> #define rtsx_read_config_byte(chip, where, val) \
> 	pci_read_config_byte((chip)->rtsx->pci, where, val)
>
> #define rtsx_write_config_byte(chip, where, val) \
> 	pci_write_config_byte((chip)->rtsx->pci, where, val)
>
> #define wait_timeout_x(task_state, msecs)	\
> do {						\
> 	set_current_state((task_state));	\
> 	schedule_timeout((msecs) * HZ / 1000);	\
> } while (0)
> #define wait_timeout(msecs)	wait_timeout_x(TASK_INTERRUPTIBLE, (msecs))
>
> > >  	pci_read_config_byte((chip)->rtsx->pci, where, val)
> > > @@ -131,8 +131,8 @@ static inline struct rtsx_dev *host_to_rtsx(struct Scsi_Host *host)
> > >   * The scsi_lock() and scsi_unlock() macros protect the sm_state and the
> > >   * single queue element srb for write access
> > >   */
> > > -#define scsi_unlock(host)	spin_unlock_irq(host->host_lock)
> > > -#define scsi_lock(host)		spin_lock_irq(host->host_lock)
> > > +#define scsi_unlock(host)	spin_unlock_irq((host)->host_lock)
> > > +#define scsi_lock(host)		spin_lock_irq((host)->host_lock)
> >
> > For these ones, the name is too generic.  probably the right thing is
> > to just get rid of them completely and call spin_lock/unlock_irq()
> > directly.
>
> I understand that there should be 2 different patches, one for the
> macro-to-function rewrites & one for replacing the scsi lock/unlock macros with
> direct spinlock calls. But, should these be in a patchset(they are vaguely
> related since the patches together would get rid of the checkpatch warnings)?
> I'm not sure.

Patch set, since they affect the same file.  Otherwise, Greg doesn't know
in what order to apply them.

julia
