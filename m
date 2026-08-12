Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB54733937D;
	Wed, 12 Aug 2026 00:24:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786494294; cv=none; b=tYtfzUjxPYhEJWeD4ZPDNrzTc0BNooTNrxUFCHy5JH0B8esnAI9JrE/Q2TmoggjR2pXw8e9gvKwgA1vA/Bj4mmnZ7WjD+FVOhM7oQuqnAZ9IpZa0Dh8M+2iSOBVKbcPDzvwz+h9hYhmNxGlEDJXd4DB22NswHhkL4A4ewkQvNNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786494294; c=relaxed/simple;
	bh=zoEKiaNQSaDsFx+sbcx1jYCbiE7+VJvy95kwWSXYWR0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G+70UNUGumUvb7gm8RlyN06BRZeqZ5n5Wl9c/ynFovLmo0JhLTZdJD7S7vXYh/dPIhS+hJRz+s9OWeLbMp9knfne4VfDlgOF2ZQACOtPmeOFewjcBzhUBprUPFLHl8TT+YrQBhwP8CV7es/AOTPtfVKVGi93NXD9IebGLp5NKK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=a2gMxPFf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="a2gMxPFf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4CEC1F00A3D;
	Wed, 12 Aug 2026 00:24:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1786494289;
	bh=jNOIoIxQPaoSRZ2/xg0yNYTW6P1VdHDNPDO7zY0Qp6c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=a2gMxPFfKlEAAab0ISk2+1Bn3RilLAd1Rjn/LbJLhkNXk57/pRU6XqH+7ZwM3TzuC
	 jIuscj0O13VAgXK4djx7f8VGL8VwSEv/wgwG6ytb1/VPOCN7fEPazDSANu526MBB3p
	 ZTMLum4Ea3R9PEnB6N1uecwt7u3p8H4ZaWN/8yhA=
Date: Wed, 12 Aug 2026 09:23:16 +0900
From: Greg KH <gregkh@linuxfoundation.org>
To: Yunshui Jiang <jiangyunshui@kylinos.cn>
Cc: kees@kernel.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev, martyn@welchs.me.uk
Subject: Re: [PATCH v2] staging: vme_user: fake: stop tasklet before freeing
 its data
Message-ID: <2026081257-embattled-audience-3fe6@gregkh>
References: <2026081116-flounder-facing-6ef7@gregkh>
 <20260811092557.373903-1-jiangyunshui@kylinos.cn>
 <20260811092557.373903-2-jiangyunshui@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260811092557.373903-2-jiangyunshui@kylinos.cn>

On Tue, Aug 11, 2026 at 05:24:59PM +0800, Yunshui Jiang wrote:
> fake_init() arms a tasklet whose callback fake_VIRQ_tasklet()
> dereferences fake_bridge and fake_bridge->driver_priv. Both fake_exit()
> and the err_master error path of fake_init() free
> fake_bridge->driver_priv (which embeds int_tasklet) and fake_bridge
> without calling tasklet_kill(), so a pending or running tasklet may
> access already-freed memory (use-after-free).
> 
> Add tasklet_kill() before the frees in both paths.
> 
> Fixes: 658bcdae9c67 ("vme: Adding Fake VME driver")
> Assisted-by: Claude-Code:GLM-5.2
> Signed-off-by: Yunshui Jiang <jiangyunshui@kylinos.cn>
> ---
>  drivers/staging/vme_user/vme_fake.c | 3 +++
>  1 file changed, 3 insertions(+)

As per:
	https://lore.kernel.org/all/2026080354-skater-urgent-31b2@gregkh/T/#u
I can not take this change, sorry.

thanks,

greg k-h
