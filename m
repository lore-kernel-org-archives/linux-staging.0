Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFF6672
	for <linux-staging@lists.linux.dev>; Thu, 13 May 2021 18:03:46 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id E607861438;
	Thu, 13 May 2021 18:03:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1620929026;
	bh=pSnURB3mZsZn1Mf+5FCKkw2EgtO0kvoOufHFukSVgeA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CQb/gSEV8rBchGyBDkiJFiihVW8mDad2MYTf3FbNXINgiPDGAOJfnjVaPunmHX4Wf
	 KuAcb9KTl0UDfP15s8713ClRT935vQX6smv1wQa2MTdmWrshJuLfsQ71SYRbRoUsfF
	 TwUE/2KSBZrRh8jvj37+Jh04ZeFChYQEQptb6JSU=
Date: Thu, 13 May 2021 20:03:43 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Cc: "open list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 0/2] Remove set but unused variables
Message-ID: <YJ1p//NsZRdYRiO9@kroah.com>
References: <20210512132344.30225-1-fmdefrancesco@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210512132344.30225-1-fmdefrancesco@gmail.com>

On Wed, May 12, 2021 at 03:23:42PM +0200, Fabio M. De Francesco wrote:
> Removed set but unused variables from HalPhyRf_8723B.c. Patch 1/2 removes
> variables detected by GCC while compiling for x86_64. Patch 2/2 removes
> variables detected by the kernel test robot while building for PowerPC.
> 
> Fabio M. De Francesco (2):
>   staging: rtl8723bs: hal: Remove two set but unused variables
>   staging: rtl8723bs: hal: Remove set but unused variables

Those subject lines do NOT match up with the patches you sent out, so
something went wrong.

Can you fix this up and resend this?

thanks,

greg k-h
