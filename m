Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D74E70
	for <linux-staging@lists.linux.dev>; Sun, 11 Apr 2021 06:43:08 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1C557610C7;
	Sun, 11 Apr 2021 06:43:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1618123388;
	bh=YFGn2WAKfQ2q4+2h94r4/rjRw6/i8/opvnIP0fHdiVY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MUq9Co6uKbz0F2nvF6VIrb3h4g/GvM7Yn6fHZPU+bKLR5QZ1u5wkG24ske1D14Qo0
	 oooRhYSGXfiq6ZJVduFlBXx0ds0KetAypM5WO4pNgdTbsq8za+c0m22zdfc65pEd9F
	 3x8lUOx3JBfgKDXiRKcA0c5w02nXpyjIBlOVnxsM=
Date: Sun, 11 Apr 2021 08:43:05 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Bryan Brattlof <hello@bryanbrattlof.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Larry Finger <Larry.Finger@lwfinger.net>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH v3] staging: rtl8723bs: remove unnecessary goto jumps
Message-ID: <YHKaeaEPzoDRKI01@kroah.com>
References: <20210410152536.426047-1-hello@bryanbrattlof.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210410152536.426047-1-hello@bryanbrattlof.com>

On Sat, Apr 10, 2021 at 03:27:02PM +0000, Bryan Brattlof wrote:
> The next instruction for both 'goto exit' jump statements is to
> execute the exit jump instructions regardless. We can safely
> remove all jump statements from __init rtw_drv_entry()
> 
> This will also remove the extra line-break before module_init()
> that checkpatch.pl was concerned with.

When you say "also", that almost always means it should be a separate
patch.  Please do so here, try to do only "one logical thing" per kernel
patch please.

thanks,

greg k-h
