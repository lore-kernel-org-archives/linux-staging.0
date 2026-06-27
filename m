Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 514453093DF;
	Sat, 27 Jun 2026 07:58:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782547118; cv=none; b=cHhByM5ccjq/VUx0bSpq8D5yMsSRPAY+Xm6PDR7ZBhiGuJQwPFe0v3fgVcKdDPKsetVEnHCCGyIAUUsHcd0VYlY2rNoaOxiHLI4HZvkhi+IiBs0guJvozZ5Ci+CmTQXtIiqYRmqFQ9xOYHjFt1FfnyLcuO5yAgHGuCc2fMwcxjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782547118; c=relaxed/simple;
	bh=zzld5Ps1lp0aisU7FMGtUh0gURSpE3Zf600yOc+p9Wc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KVs+kGCuUIWvpFJgItYO0NVwt4allGH5AnxSqS1feXyF81Ys6lTiJ3uv2gD6pyb0zPEjn+XZycAy+Ix13XNSkXz+JS6lhuKDLAKBK3XGQsme1MNsYGKK8hhvbR4A9dj5M4bgJg4mArlx1XBqX2Y9x72nckeQtIfCj5xncmcbFWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=ySlmQxaM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ySlmQxaM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AE931F000E9;
	Sat, 27 Jun 2026 07:58:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1782547116;
	bh=sC/9NRaMhx8xOE1zpBvZ6+soTA49hwC/fkHgMNk6Cz0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ySlmQxaMkn5EL193hboPUN4jtNlvxZwkmADfBQXLIUEjHFsyVS+pT5bFNyJrvw50u
	 5QkLb8/pU4xtdHt59fwHL1FVrb511qK3iH/XKYPFH2eSRVC1ZAUwo6hkfL5lusNjF1
	 abQ3u0kqBQdh7gDI644vy0JvrwSph9MErRN6IbUo=
Date: Sat, 27 Jun 2026 08:57:22 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Doruk Tan Ozturk <doruk@0sec.ai>
Cc: Hans de Goede <hansg@kernel.org>, Andy Shevchenko <andy@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Dan Carpenter <error27@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] media: atomisp: validate user-supplied buffer
 sizes in two ioctl paths
Message-ID: <2026062709-copy-ensure-cf64@gregkh>
References: <20260627063924.79491-1-doruk@0sec.ai>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260627063924.79491-1-doruk@0sec.ai>

On Sat, Jun 27, 2026 at 08:39:21AM +0200, Doruk Tan Ozturk wrote:
> Two ioctl paths in the Intel AtomISP staging driver share the same
> defect class: one user-controlled field sizes the destination buffer
> while a separate user-controlled field sizes the copy/store, with no
> cross-validation between them. A local caller on an atomisp V4L2 device
> can drive a kernel heap out-of-bounds write with attacker-controlled
> length (and, for both, attacker-controlled contents).
> 
> Patch 1 (framebuffer-to-CSS, FPN / S_FBUF path) bounds arg->fmt.sizeimage
> to the frame allocated from width/height/format before the copy/store.
> 
> Patch 2 (S_DIS_VECTOR DVS 6-axis config) bounds the user-supplied
> width/height dimensions to the stream-grid-sized destination config in
> both the ISP2401 and ISP2400 branches before the first copy.
> 
> Both were found by 0sec's autonomous vulnerability analysis
> (https://0sec.ai) via static analysis; neither is yet runtime-reproduced
> (Intel Baytrail/Cherrytrail ISP hardware required).

Please document this in the assisted-by tag as the documentation
requires.
