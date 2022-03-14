Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22C4E7A
	for <linux-staging@lists.linux.dev>; Mon, 14 Mar 2022 17:35:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E3E3C340E9;
	Mon, 14 Mar 2022 17:35:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1647279351;
	bh=23aGtBZ+roTpnSTpxgU+DVYehJCSbai+m5P8j3ght4o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aS96RNBHOWtZ2Oa9UTMul1NAoszWh1lDejKFfG3GocyL5aZTUWWXW3pyaKmjckJY/
	 Nf2GH2QdHuP5ms3Ad4coPZ2kz05CVoVxdfsKhYkBp7IT7pTY9juZZlbtJl/51nDBHx
	 wIj3Uuy2qQfXCLJCO07Aq/FhqA806LDolCnAIkAc=
Date: Mon, 14 Mar 2022 18:35:39 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Philipp Hortmann <philipp.g.hortmann@gmail.com>
Cc: Forest Bond <forest@alittletooquiet.net>, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/5] staging: vt6656: Remove unused 5GHz support
Message-ID: <Yi9868MQr4CQLgIV@kroah.com>
References: <cover.1646935331.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1646935331.git.philipp.g.hortmann@gmail.com>

On Thu, Mar 10, 2022 at 07:54:02PM +0100, Philipp Hortmann wrote:
> vt6655 (PCI) and vt6656 (USB) do only support 2.4GHz band and not 5GHz band.
> Both drivers do allow only one vendor id and device id.
> So no other devices are covered by those drivers.
> Because of this the following priv->rf_type cannot occure:
> RF_AIROHA7230
> RF_VT3342A0
> 
> ---
> Tested with vt6656 on mini PCIe card (connected over USB)
> which is using rf_type: RF_VT3226D0 (2.4GHz only)
> Tested with vt6656 as USB Plugin Module
> which is using rf_type: RF_AL2230S (2.4GHz only)
> In order to combine vt665x infrastructure it is important
> that vt6655 is also not using this code. (Patch already provided)
> vt6655 on mini PCI Module is using
> rf_type: RF_AIROHA (2.4GHz only)
> 
> Philipp Hortmann (5):
>   staging: vt6656: Remove unused rf_type in channel.c
>   staging: vt6656: Remove unused rf_type in baseband.c
>   staging: vt6656: Remove unused rf_type in rf.c; top level
>   staging: vt6656: Remove unused rf_type in rf.c; unused variables
>   staging: vt6656: Remove unused rf_type in card.c
> 
>  drivers/staging/vt6656/baseband.c |  16 +-
>  drivers/staging/vt6656/card.c     |  16 --
>  drivers/staging/vt6656/channel.c  |  96 +------
>  drivers/staging/vt6656/rf.c       | 413 +-----------------------------
>  4 files changed, 10 insertions(+), 531 deletions(-)
> 
> -- 
> 2.25.1
> 
> 

If you could send follow-on patchs for the kernel test bot warnings,
that would be great.

thanks,

greg k-h
