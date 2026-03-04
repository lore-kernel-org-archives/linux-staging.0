Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D96632566E9;
	Wed,  4 Mar 2026 13:24:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772630692; cv=none; b=S2WcRzZCqauIm7eqE0B97MU7j/YhQ7w1KXcuFY8s2yWxRXdlPBBUAMX5SM0AW6xTcHxMtPKKdub6xWyfOoYPjR9CRcdUKB5ToF4c9zwbY50ua653v0jZoiXLUXDP/DIvzVuXib7SOuyY8svUPTEPHVFaxqqLO18BwLeVB5qqct8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772630692; c=relaxed/simple;
	bh=PbZ5gNy6CTP3upocGECtM0xHnq87X+zgkgTSOA9U49I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GFrjTrc+/XP/2v7Z0IStiGd1tHSmFsxUZwjXnBdkr8Fru4htwm74UZDFjmL0t1m4Aydl4UqO5J5c1ugIjJFFKRutEX5oFAgCzScatupFNaVz/Wx1Hlaye3rPAssLHx7hNLFRRBtzfR7GdZNWtxHyNTuXey7h1hxbgMTIPiPkhIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=UYj1iViC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="UYj1iViC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04D4AC2BC87;
	Wed,  4 Mar 2026 13:24:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1772630692;
	bh=PbZ5gNy6CTP3upocGECtM0xHnq87X+zgkgTSOA9U49I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UYj1iViCmL1eZXiowtlEgkc5CgtJujAUAVZOImccM7nuoyD5En/GUhQN1jJgloWQC
	 hTvMXwcvwt4g68BRX5x5OYcNyGimgUHB7o/sBZuHzJ6oyT/jvK8O42qCt27aZDl/z0
	 ajxA3w6TE8VCbJCMvvPHLCNmclosU0zfQTXMD99E=
Date: Wed, 4 Mar 2026 14:24:39 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Alexandru Hossu <hossu.alexandru@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: rtl8723bs: replace kzalloc/kmalloc+memcpy
 with kmemdup
Message-ID: <2026030429-alkaline-stubbly-1f2c@gregkh>
References: <20260304130706.37347-1-hossu.alexandru@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260304130706.37347-1-hossu.alexandru@gmail.com>

On Wed, Mar 04, 2026 at 02:07:06PM +0100, Alexandru Hossu wrote:
> Signed-off-by: Alexandru Hossu <hossu.alexandru@gmail.com>
> ---
>  .../devicetree/bindings/misc/xlnx,axi-fifo-mm-s.yaml          | 2 --

This is not a drivers/staging/ change :(

