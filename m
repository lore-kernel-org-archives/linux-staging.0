Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7F6F293B75
	for <linux-staging@lists.linux.dev>; Sat, 18 Apr 2026 11:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776510650; cv=none; b=mUsP7Am4tWAFkSAHBedBR7cXMfrbzlzpnydLVSTIAZDsIGfKMQ9ffvql73fXT5PhzFg5RvYU/pr/x4tzQWT9tjptoPlmgN5kc1matPuwyKsqQsKT7jTMt/uNwC4sEhWXZ4vY3YymlrzyKgQcVa4gxXTTQYNzT0dfJ2yep4F/2Xw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776510650; c=relaxed/simple;
	bh=gsSR96D6b6/nyUMPckNiYP+yHyYGDVpjrBSlOsL3dYg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Kz+PS7azd/Zx/2pTplimVnwC6KDsWoZrrjkas+Q1pjuiLImkvtIR+RpV6VtI8/IDc7mw7Fdfhes1dKaEnW4cs3sbR3amdCDpKnKRC+YFmynpFYTpgjEM2iONSdx3DP8DCwhYfdiVSG+7C3yAKcDl4WtzzXodF66cnmv1xBUge/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=n0S5TOS9; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="n0S5TOS9"
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 099C6B8B;
	Sat, 18 Apr 2026 13:09:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1776510544;
	bh=gsSR96D6b6/nyUMPckNiYP+yHyYGDVpjrBSlOsL3dYg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=n0S5TOS9iKo4ec7gpIGajgZn17sAV8DHdRvcwHz8z7KyceUvQA9WFKJFwn0V8yNrV
	 Ycj8eTre7GcoB52Hpl81v3ExEjeL9KzfBazqtkVX5y3ZozjF9qBR8gjKVtkmV2J42p
	 soS5NltC76N3eGnLY9EcRohqKs5F0pD4gZJSeJf8=
Date: Sat, 18 Apr 2026 14:10:37 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Robert Mast <rn.mast@zonnet.nl>
Cc: hdegoede@redhat.com, mchehab@kernel.org, sakari.ailus@linux.intel.com,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	andy@kernel.org, gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org, Robert Mast <rmast@live.nl>
Subject: Re: [PATCH 0/1] media: atomisp: mt9m114: Graceful teardown atomisp
 and mt9m114
Message-ID: <20260418111037.GK1824072@killaraus.ideasonboard.com>
References: <20260418092651.7873-1-rn.mast@zonnet.nl>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260418092651.7873-1-rn.mast@zonnet.nl>

Hi Robert,
On Sat, Apr 18, 2026 at 11:26:50AM +0200, Robert Mast wrote:
> From: Robert Mast <rmast@live.nl>
> 
> During the many iterations on mt9m114 and atomisp on my T100ta baytrail
> I was annoyed by having to reboot each time, as modprobe -r/modprobe
> wasn't able to fully reinitialize mt9m114 and atomisp, resulting in cpu
> core hang ups. I asked Github Copilot Enterprise to fix it for me, and
> the fix looks quite good and has served me well since. I'm not able to
> distinguish any structural flaw, so please review.

No, sorry. You first need to get a complete understanding of the logic
yourself before you can ask other people to review the code. This
includes cleaning up all the obvious mistakes, and turning it into a
form suitable for upstream. Dumping code isn't acceptable.

This applies to v2 as well.

> Robert Mast (1):
>   media: atomisp: mt9m114: Graceful teardown atomisp and mt9m114
> 
>  drivers/media/i2c/mt9m114.c                   | 118 ++++++++++++++++--
>  .../media/atomisp/pci/atomisp_csi2_bridge.c   |   1 +
>  .../staging/media/atomisp/pci/atomisp_v4l2.c  |   3 +
>  3 files changed, 110 insertions(+), 12 deletions(-)

-- 
Regards,

Laurent Pinchart
