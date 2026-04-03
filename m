Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12E53359A62;
	Fri,  3 Apr 2026 06:42:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775198535; cv=none; b=dcl10WXU6H6mUZzE2yBBG6x6MVcp1ueG51AAVIU2pM6WPKn+XpNk5ilhtmX4FVUX3pPrw9zm39lJ8x1mtpwzYf+lb7XIQyxWUzJ3amP22RcRg/PE6Rr22jRWjW9COQbt0wOP/wSt5QUwYn34/eHYf6M5kZYlts0Oy/A404GtP4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775198535; c=relaxed/simple;
	bh=2Wrmd986Gc4FF+hoYV3dVEF3oCELncJWds1+DGYWvaQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sHKXJ6FEAuyYhHd7DaGM6OwiAJYObvZZKgvDz5mr5KTEUxi0j8/l81iO4o6wLqiheSaQED6ocBDQjK+NYtBeg0kQrJTOCBVVJEIHVTph2kk1drVY/SfMQ1bUZn26chprt1wS8ujlpmX2Bo/ptYpjxDuqjuaaTQimejEAC84q5BM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=dQYzYUWu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="dQYzYUWu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3641CC4CEF7;
	Fri,  3 Apr 2026 06:42:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1775198534;
	bh=2Wrmd986Gc4FF+hoYV3dVEF3oCELncJWds1+DGYWvaQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dQYzYUWuG8iZ3s/eYXrONftncW2Oj2pUBB6Z+k0c6asCFYkozrAwrg7zGi3yy2Qm1
	 PV5rbTXQQKzsY9I3agJs3noenJePZd1XiTVItul26IoZlpJTBB3SvGyH8Bgt9h3kpA
	 sQage8Qu8ao5h6lDWAov7TcHb9E4suoKgE7IBRtY=
Date: Fri, 3 Apr 2026 08:42:11 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
Cc: linux-staging@lists.linux.dev, Andy Shevchenko <andy@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH v3 2/2] media: atomisp: remove redundant call to
 ia_css_output0_configure()
Message-ID: <2026040336-humvee-throwback-72cf@gregkh>
References: <20260402183402.444630-1-azpijr@gmail.com>
 <20260402183402.444630-3-azpijr@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260402183402.444630-3-azpijr@gmail.com>

On Thu, Apr 02, 2026 at 08:33:45PM +0200, Jose A. Perez de Azpillaga wrote:
> The function configure_isp_from_args() contained a duplicate call to
> ia_css_output0_configure() using the same output frame index. Remove the
> redundant call to simplify the configuration path.

Are you sure the hardware doesn't actually need this called twice?  Lots
of devices need to be told multiple times what to do in order for it to
"stick", hardware is "fun" that way :(

Have you tested this?

thanks,

greg k-h
