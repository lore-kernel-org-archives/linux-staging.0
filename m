Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F3DC46F495;
	Tue, 25 Aug 2026 15:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787672606; cv=none; b=kagoIW6+gUFXIeaXUViOTpDnG81RXBxuKrxSX26ITaJvuu4yIlENv1KtUW31LFC5hu+dDKF96q4Wv8u8YbD3M784RuBrxJ4qX/qx7SKtxwQHPEo0ry9J1+cdrE1w4YoaACIbUYfxHTo8IyJNOtgH9yoWGVyU7/rhsyE8w3WRTro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787672606; c=relaxed/simple;
	bh=YZPg4+MXSkA+rXUWREwQP/Ue4Aw0tvIGp324DNLTAhw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mHKe3LPD9YfObXNPZJGTnmA0jNQvcbfPnTpP2Ylk3/uY/jCOImAqpPrz5/arzWSbkOGXAtppVMkZ5opsPUOLHTgYyn8oO1/inmx7pQ8Vx/3fJg2Vwd0vH0PiAtNNerfNjPlQceMsTB0qRa8xocn3yqDPBuRPac9lA5kM0XmUKWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=dFzibjwL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="dFzibjwL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BAD511F000E9;
	Tue, 25 Aug 2026 15:43:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1787672604;
	bh=EW+OWy7lJ7Q+7+jyFqqYk+Pyho3sxlanrQlByGpqh4A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dFzibjwLm1OFRMsl0s5Fo7VtbKCHlaMzcCBBWGyb987/vXmQVoNeiiAw8KXA+q/Mf
	 0nSKVyZKg+MsWVG7AOPFzbtluFageDnz2zTO9GUrk4PgNSlCmFivON/sRY4kyD7bVY
	 V5RuO1H+ejSOwCNYekokA9SPhqXiciyAqzajunRQ=
Date: Tue, 25 Aug 2026 17:43:18 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Mirza Ishan Beg <seedandsyntax@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	nikolayof23@gmail.com, lkp@intel.com
Subject: Re: [PATCH v4] staging: rtl8723bs: refactor traffic_stat access in
 collect_traffic_statistics
Message-ID: <2026082546-treble-delivery-49dc@gregkh>
References: <20260803180549.20859-1-seedandsyntax@gmail.com>
 <20260807150940.5066-1-seedandsyntax@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260807150940.5066-1-seedandsyntax@gmail.com>

On Fri, Aug 07, 2026 at 08:35:29PM +0530, Mirza Ishan Beg wrote:
> Replace repetitive `pdvobjpriv->traffic_stat.` dereferencing with a local
> pointer `ts` to improve readability and reduce line length. This resolves
> multiple checkpatch line-length warnings without manual wrapping.
> 
> Suggested-by: Nikolay Kulikov <nikolayof23@gmail.com>
> Signed-off-by: Mirza Ishan Beg <seedandsyntax@gmail.com>
> Link: https://lore.kernel.org/linux-staging/agDaGJ5UKndFUNPY@archlinux/
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202608070159.puVnOVxb-lkp@intel.com/
> Closes: https://lore.kernel.org/oe-kbuild-all/202608070545.V0T8UE77-lkp@intel.com/
> ---
> Changes in v4:
> - Fix incorrect struct type: use `rtw_traffic_statistics` instead of `traffic_stat` (reported by kernel test robot)
>  drivers/staging/rtl8723bs/core/rtw_cmd.c | 25 ++++++++++++------------
>  1 file changed, 13 insertions(+), 12 deletions(-)

Where is the 1-3 version info?

And the "Closes:" isn't correct, 0-day was responding to previous errors
you made in other versions of this series, not the original code.
THere's nothing wrong with the original code that needs to be "Closed".

thanks,

greg k-h
