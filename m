Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 021EC3EBF2D;
	Sat, 14 Feb 2026 16:28:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771086481; cv=none; b=DV5OhfVB2KQOly6kQAaRAdk0nPm5oB76MVzC1vLNeSMPO66L/Z5IIjcMymBiUJAMC6k6gFDvHCTocYAgdJWE1CPy69ItxBE/ISv1S0fvLAOTbXmk170aYJZDGHo/QJ3V7uguR91fjY+TFrdStrAVYe9iHU7u5Y81L8rNjX+qH/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771086481; c=relaxed/simple;
	bh=aH6grlOctkXEV8mFJam91cCRPhr3ZAF+Qht2P1zvDOo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YX/Z4VkJWRBywx/Cj8UxjJbDpKXmA1RQS0kHeX6LNjHLiYfj0Qs+s8Zn+2Ex++I7cNot4yvX9WiL/m2KEYoEZ9CTZlMA3PQrtsW/umvik+hxWSv1yI/OrPi8k5KDzcHaT8MVN0C6PJTg4V4RcHy0eDMjmziryZKKJdRG3c2yiAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=2orEqtDi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="2orEqtDi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56E3CC16AAE;
	Sat, 14 Feb 2026 16:28:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1771086480;
	bh=aH6grlOctkXEV8mFJam91cCRPhr3ZAF+Qht2P1zvDOo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=2orEqtDixOh+IBlfHx0/WYvCgPy2Op/5djjcxD7cK+3gtNMwvz4RT9/30lkd1/y1R
	 7jvyf3mCnBZ/RY+uirQgrkK8ji8DyhCkhQ2OzG9rDBr+WGYqUyVp93E9gGl1NImCvN
	 XIzgpKXd0ne//WoBotH3nKqt3aZgumXV/I98G/XM=
Date: Sat, 14 Feb 2026 17:27:57 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Samyak <samyak.bambole07@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: vme_user: use kmalloc_obj instead of kmalloc
Message-ID: <2026021428-reliance-vitally-f279@gregkh>
References: <20260214161321.669459-1-samyak.bambole07@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260214161321.669459-1-samyak.bambole07@gmail.com>

On Sat, Feb 14, 2026 at 09:43:21PM +0530, Samyak wrote:
> From: Samyak Bambole <samyak.bambole07@gmail.com>
> 
> Replace kmalloc(sizeof(*ptr), GFP_KERNEL) calls with kmalloc_obj(*ptr,
> GFP_KERNEL)
> 
> This addresses scripts/checkpatch.pl warnings and follows the preffered

Nit, spelling problem in the last word :)

> allocation pattern.
> 
> Signed-off-by: Samyak Bambole <samyak.bambole07@gmail.com>
> 
> ---

You need to put what changed below the --- line as my bot recommends.

v3?

thanks,

greg k-h
