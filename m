Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D50333176E4;
	Tue,  3 Feb 2026 12:02:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770120143; cv=none; b=Pn+q9xZeNEi0XLRppKrWBF8Er3d742+xhpLWmnzZqQFUDTDDiLzfQ9HMfF+KC5SOTCvaqL4kWL89Lwg+eD9AfVLLdRM6aW+IHSB/aL9osRAyAHWjSI90tZ1z5+kCjehLXdCA2hACkkj29NNwDxafjdULDNUvHX6JThVsBHGAhKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770120143; c=relaxed/simple;
	bh=XylmMM1CtZ5wvNaT3YGWaQ1xmvboqwQtxwO8AWi2IqY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jkBceqtDYDFvfWZFejWl5QwUJRtPEkWoLH5f0OOcXaoJyBs1O4+1L9km1jdjTu1VJ/wHDKp8/vWKueA3uxHZWZxPz3YjrIFoC4Uu9RjP0fzaNGLdil8YLtGBuf5sYt7e28KXL7u9F6/XN1HtAbpsgaMaIqGO185yWDiSHMRN7jk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=l2Y+Y0IR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="l2Y+Y0IR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F08A7C116D0;
	Tue,  3 Feb 2026 12:02:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1770120143;
	bh=XylmMM1CtZ5wvNaT3YGWaQ1xmvboqwQtxwO8AWi2IqY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=l2Y+Y0IReReigOn7gVwMQxVvDi4n/HiwjTxwHjByqY+vSGqqByPo/qkj9t5KxM/p4
	 OCUDpyB5bson28m9EOwZ5//eBrwSYonsQrrKkf07Pwf2C/XnR6Msk8eLukhTATUQ9i
	 Lm02X3sMz32GkGyrpfqMNBTbBRA05pVg5v1jw6u4=
Date: Tue, 3 Feb 2026 13:02:20 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Baran Arda <baran9arda@gmail.com>
Cc: ovidiu.panait.oss@gmail.com, gshahrouzi@gmail.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: axis-fifo: fix sleep while holding mutex
Message-ID: <2026020353-ended-graffiti-25d4@gregkh>
References: <20260203114858.28278-1-baran9arda@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260203114858.28278-1-baran9arda@gmail.com>

On Tue, Feb 03, 2026 at 02:48:58PM +0300, Baran Arda wrote:
> The driver calls wait_event_interruptible_timeout() while holding a mutex. This can lead to a deadlock or poor performance as the mutex is held while the process is sleeping, preventing other processes from accessing the device. This patch moves the wait_event call outside of the mutex lock in both read and write operations.

What kind of tool was used to "find and fix" this "issue"?

And how was this tested?

And are you _sure_ it is correct?  (hint, I think you just broke the
driver's logic, please look closely at your patch...)

And what caused you to want to make this change to this driver?  Do you
have access to this hardware?

thanks,

greg k-h
