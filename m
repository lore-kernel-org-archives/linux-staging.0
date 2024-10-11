Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1A5A1F8F1A;
	Fri, 11 Oct 2024 04:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728621642; cv=none; b=qJmquUIjr8SeHKi5+gRIFDSio6tgf9qnsUp+UIFwdpve2L0/IpnxvStROkRTxvkES1FSWs9jp0qymkzBV/UxbgxO3h3z3ylglv0q4bChnQEUMZ92dME2/7FwQPY7zdukRKGGAG4Mj4bn0GavQMfyaIHw5TBqS9bCadbo6VhqTas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728621642; c=relaxed/simple;
	bh=hess8hjBuAArOoeZuREZa5dewg+dYVaafsMxx2IXsF4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j8R/vomy7fVnxyHNlQSwcLZ5SBOjVLvi68I5FDZ3PfVOv4Zr7+h9igTvCEN9md6/nz93GN8IILnehSYT8EqMo7u1q47DNYHTwtEvwEjPcpqo7FVNdkwTQfPIe0LkysJwUOriq/+IZYMjZqFtbTwKjtuVA4nNd8R7OhdU2gti2p4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=rDyWyMxu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="rDyWyMxu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCFC7C4CEC3;
	Fri, 11 Oct 2024 04:40:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1728621641;
	bh=hess8hjBuAArOoeZuREZa5dewg+dYVaafsMxx2IXsF4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rDyWyMxuImy7FR+/mvysT0+jmelfS9KoV47RwSS+Fnhl/ODzxAeumbKF2pP6fEmMj
	 36tBQw4ETbyEyJmC3ScM1qAkMgxPze1y+mBngwXGu3tRYHKNeFclrn9SFG1COS5WR+
	 pcLSwBPigEKyoiCDLX+2TPBz2v4JXZL9//zKrROM=
Date: Fri, 11 Oct 2024 06:36:09 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Stefan Wahren <wahrenst@gmx.net>
Cc: Umang Jain <umang.jain@ideasonboard.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 4/5] staging: vchiq_core: Macros indentation fix
Message-ID: <2024101103-dizziness-occultist-b6ed@gregkh>
References: <20241010102250.236545-1-umang.jain@ideasonboard.com>
 <20241010102250.236545-5-umang.jain@ideasonboard.com>
 <890c234b-6d68-4a43-8bea-208e5d1a115c@gmx.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <890c234b-6d68-4a43-8bea-208e5d1a115c@gmx.net>

On Thu, Oct 10, 2024 at 06:50:24PM +0200, Stefan Wahren wrote:
> Hi Umang,
> 
> Am 10.10.24 um 12:22 schrieb Umang Jain:
> > Make sure that MAKE_* macros fit within 80 columns instead of spanning
> > in a single line.
> honestly i'm not a fan of this change, because it just silence
> checkpatch but doesn't improve readability.

Agreed, this shouldn't be needed.
