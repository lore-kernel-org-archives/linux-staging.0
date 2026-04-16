Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABCEB3A6F16
	for <linux-staging@lists.linux.dev>; Thu, 16 Apr 2026 11:22:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=195.140.195.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776338559; cv=pass; b=GjbwZ11lMA4Zufh70SsNVKbUeWTFjdqle7fjhwInxNHiuWT0E0B9YPzJOrc+UskPz9TEpGBBI5j4OaihDvSkV9BJ2isnLCgo4skXgvfTa+1qJpvT/pDW63IvArg3l3IE31FR9LcvsCVgc8HehMAnZnKzHlu7OM/wXGNN0DIizxM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776338559; c=relaxed/simple;
	bh=ZysG+T2gYUNGnDUwt2iM01kDW3KfB/fBMoHnxzYYJt0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qcELQ9hXt0uonOeix68bLZoYqZfJOViJcG3zvjx68gDplI1XZ20P/rXnBsEL4bKYhvT4/gPPG97eiG+JGcIBxyJD+iDAS+WBqLuf7Yi5x1Nti0q4cgz/pYPVU/vGa6B+JT/jOUshV0j3elko5RFc0iwKvnTfKtm+ZYaAHX7YBh4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b=nkis52Sd; arc=pass smtp.client-ip=195.140.195.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b="nkis52Sd"
Received: from hillosipuli.retiisi.eu (n18ws8cotq5gnfn8-1.v6.elisa-laajakaista.fi [IPv6:2001:99a:0:19f:4ce7:0:938c:d2f4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by meesny.iki.fi (Postfix) with ESMTPSA id 4fxFwj60bszySY;
	Thu, 16 Apr 2026 14:22:29 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
	t=1776338550;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=evIaAmwzwHqlI+MpK9nClbz4R3+nUguOsjFjz9PUBsE=;
	b=nkis52SdLtFB7uxaxGNn0NDhobyUSmdyUKS0FAsrBLx3VUc9X5AYGL1vMHKuXIVinla8/+
	LPCtv0Bn5BswESld90YZl5VNHQYSzqdUIiM0+Nc1A5y0FA4+OKclT5rRyuwAWRw9VMNHZT
	3hOJX1I62d7K7ubzxjpXX9+vK8YQy1g=
ARC-Seal: i=1; a=rsa-sha256; d=iki.fi; s=meesny; cv=none; t=1776338550;
	b=JTT/8ILl438IkY8NVrS/hTAaawiEIOMQmkwa6sqRrB5UQrqUiCiiaH+IoHc8NCqH8eVxZ3
	ie9n6VgqyhN+BY3Labh4o0xL/O89PrsyKBqObSQmzMrO0ec1UP3zekhKP2GHneoED2Slkn
	gi/GI5irwtD7whgu00QBWL72dXzBeKo=
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=meesny; t=1776338550;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=evIaAmwzwHqlI+MpK9nClbz4R3+nUguOsjFjz9PUBsE=;
	b=UVJzI/GvP65amDom6IfMyog/kv2KxyM+/JX9EqxptddJzS9UK+lcRaDJ14aOvKXUvu3aBw
	yL7Usqq3dp1rkKlgZo/qi0FTvjWW9Pjz5MsoKl//9SxeierVqVxUyxZpu44cAZhSpcXTUV
	J6erZdY5B59x5DHFKads3nsXFm41Th0=
Received: from valkosipuli.retiisi.eu (valkosipuli.local [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 5CC3D634C51;
	Thu, 16 Apr 2026 14:22:29 +0300 (EEST)
Date: Thu, 16 Apr 2026 14:22:29 +0300
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Anushka B <anushkabadhe@gmail.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	andriy.shevchenko@intel.com, andy@kernel.org,
	gregkh@linuxfoundation.org, hansg@kernel.org,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, mchehab@kernel.org,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Dhruva gole <goledhruva@gmail.com>, m-chawdhry@ti.com,
	Simona Toaca <simona.toaca@nxp.com>
Subject: Re: [PATCH v6] staging: media: atomisp: fix GP_TIMER_BASE scope in
 gp_timer.c
Message-ID: <aeDGdRKoE_7FNSJw@valkosipuli.retiisi.eu>
References: <20260327031106.10386-1-anushkabadhe@gmail.com>
 <acZo5LUXH70-UKUi@kekkonen.localdomain>
 <CAAfE=nNNxCKv0JoRcib7YVQfQ9MxqE34WyYu2GHNYaroxzpw1w@mail.gmail.com>
 <aczBS_KJQa_j97RP@kekkonen.localdomain>
 <CAAfE=nOs9YfpnFGY+bPg1WPxuCHOzkR9oHD9DizNxxse25A0hw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAfE=nOs9YfpnFGY+bPg1WPxuCHOzkR9oHD9DizNxxse25A0hw@mail.gmail.com>

Hi Anushka,

On Wed, Apr 01, 2026 at 09:32:29PM +0530, Anushka B wrote:
> > > Would it be okay to proceed with the simpler in-place fix for
> > > GP_TIMER_BASE declaration instead?
> >
> > I'm fine with v4.
> 
> Should I send a v7 similar to v4, where I merged the split declaration
> of GP_TIMER_BASE, and a separate patch for the comment fixes?

Yes, please.

You can find the currently applied patches in my atomisp branch here:
<URL:https://git.linuxtv.org/sailus/media_tree.git/log/?h=atomisp>.

-- 
Regards,

Sakari Ailus
