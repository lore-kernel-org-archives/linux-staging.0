Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA249381AFB;
	Tue,  7 Jul 2026 09:27:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783416478; cv=none; b=OC4M9Uj4xkESZFiEKyAsRBv82ES6DRsbLaZI21sHrSTlk1NSrCPLK+H3AxUrgO796U8BQa9O/NwaVyLtAN9jCCM2UYect3o/mV2S+H0RBocDlnjy8KOVO3mC1RxK3GrJ6V6VeVTlN1Wyvg3AfDpt5mGqBZSMmD01uGn8Tctj/TM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783416478; c=relaxed/simple;
	bh=mzhV9PZlFYVDp69odxrjMuteChcFpPDq9b1Ke6zqP8s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bINQrdY0/iyb9vzwAA92U77UPtkrO2Wv7mT2imjk0kIaYUXfkkZ+rHpL8HWKhg1rdUcv3btO5tUWuoipWWbp1Agy+weY7oYeyBoyz69lcXXrkqJVra+TQWqt8YLn+Q4ztB9sMHNoL4T3SdV+avi+Q1s2JRMp4HNzGvW//KgtG4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=E+6BT2zq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="E+6BT2zq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE99C1F000E9;
	Tue,  7 Jul 2026 09:27:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1783416476;
	bh=SqM3+8qrnXjf/va0yGiRuDyx2yicUZMJdo41t5+3ZAs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=E+6BT2zqkXBhWocdEwLcJyNnOxJIaBbAXDrTMfnCODatOJBoxa7aI+w3/N6tpPe/Y
	 22g78Z4x9wRiq406dPgHoZz7jVOBgNaAGR6W8woc0Amuh8TovGCNh1HvCBrsv83bit
	 D2kxRdVY+xRyJ7pqBRvjAM8M3y+iuSwRl7x8IegA=
Date: Tue, 7 Jul 2026 11:27:53 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Batu Ada Tutkun <batuadatutkun@gmail.com>
Cc: parthiban.veerasooran@microchip.com, christian.gromm@microchip.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	error27@gmail.com
Subject: Re: [PATCH v2] staging: most: dim2: use dev_err_probe() for clock
 errors in rcar enable functions
Message-ID: <2026070725-unlearned-elephant-b869@gregkh>
References: <20260623124243.1245-1-batuadatutkun@gmail.com>
 <6a3ae40a.3dabba3e.2527ef.7783@mx.google.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6a3ae40a.3dabba3e.2527ef.7783@mx.google.com>

On Tue, Jun 23, 2026 at 03:35:08PM +0300, Batu Ada Tutkun wrote:
> rcar_gen2_enable() and rcar_gen3_enable() use the old pattern of
> dev_err() followed by return PTR_ERR() when devm_clk_get() fails.
> fsl_mx6_enable() in the same file was already converted to use
> dev_err_probe() by a previous cleanup series.
> 
> Convert the remaining two functions for consistency. devm_clk_get()
> calls clk_get() which can return -EPROBE_DEFER if the clock provider
> has not yet registered. Using dev_err_probe() suppresses the log at
> error level in that case, avoiding misleading "cannot get clock" output
> during a normal deferred probe.
> 
> clk_prepare_enable() cannot return -EPROBE_DEFER since the clock handle
> is already acquired at that point, so those error paths are left as
> dev_err().
> 
> Signed-off-by: Batu Ada Tutkun <batuadatutkun@gmail.com>
> 
> ---
> Compile tested only. No R-Car hardware available. This is a correctness
> fix for the deferred probe path, not a response to a reported
> user visible issue.

You forgot to document your use of a LLM in the creation of this change.

thanks,

greg k-h
