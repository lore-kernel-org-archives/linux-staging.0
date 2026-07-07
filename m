Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1C4731E856;
	Tue,  7 Jul 2026 10:02:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783418530; cv=none; b=A4gFy731PbSToHXQAEQZ1yZtYTamoSkSO5qRMhC6l9BstGZucPQwWbgcrl3T9Qfrj2ILuko0deEOaQVYfinI3X2E/xA4g9cYyKQZIC+URndnL8Hlhm7PDKUrVBA/ig3goZn9jLjvvJb0uHO9T6p+e5dKRfcvR6C+s6iYXvfnL+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783418530; c=relaxed/simple;
	bh=a6csmcUMIJW63wXJAcQfH+3q5FyVx53KWyWgQxNFoxk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Kzmgeb7MlQQ0nMzspn0nY4SPmg0mAQP7NNbLHHWfYmFd2BRr+m86UTElAzsdZvuVrMyHHRvWIJWDCpXCm3ny/ULC8qAl9F1ZUDS4x9Pe9JF7JYHq0IFmGmXlRxrLkQmCEw+ku1qfa7LFQMXefW8si006fccGDD7sccUerFfS6vg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=jhno44df; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="jhno44df"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7CA81F000E9;
	Tue,  7 Jul 2026 10:02:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1783418529;
	bh=WPWPoX4ii252RfluLZJuVrCneLPNQ4T6RVEw0R5zhG0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=jhno44dfdO5Mtxw4xdoNttmaVsCtz8RrOMhswaW9qvY6bWX6OiYJxedzdIUChapdo
	 Htnes/pkdBMRHM+sP0Z3pNd39WQ1Kzi2VqlNlJOGB4E7KH7jP3gUNuGDf3HKsM8frd
	 gs2Jt0Dn2lqyI9ZR4NqJC2rB5W1mwdgveJM0DAXI=
Date: Tue, 7 Jul 2026 12:02:06 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Pramod Maurya <pramod.nexgen@gmail.com>
Cc: jacobsfeder@gmail.com, ovidiu.panait.oss@gmail.com,
	gustavopiazdasilva2102@gmail.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: axis-fifo: use stream accessors for FIFO data
 transfers
Message-ID: <2026070725-submitter-mobster-1089@gregkh>
References: <20260523194009.195538-1-pramod.nexgen@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260523194009.195538-1-pramod.nexgen@gmail.com>

On Sat, May 23, 2026 at 03:40:09PM -0400, Pramod Maurya wrote:
> To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Jacob Feder <jacobsfeder@gmail.com>
> Cc: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
> Cc: Gustavo Piaz da Silva <gustavopiazdasilva2102@gmail.com>
> Cc: linux-staging@lists.linux.dev
> Cc: linux-kernel@vger.kernel.org

Again, why is this here?

> 
> The driver uses iowrite32()/ioread32() to transfer payload data to and
> from the transmit (XLLF_TDFD_OFFSET) and receive (XLLF_RDFD_OFFSET)
> data FIFOs. On big-endian architectures iowrite32() maps to writel()
> and ioread32() maps to readl(), both of which perform CPU-to-device
> byte-swapping. For AXI-Stream FIFOs, which carry opaque byte streams,
> this byte-swapping silently corrupts the payload.
> 
> Replace the per-word iowrite32()/ioread32() loops with writesl()/readsl(),
> which transfer data without byte-swapping, preserving memory byte order
> as required by AXI-Stream FIFO semantics.
> 
> Also convert the err_flush_rx drain loop to use batched readsl() with
> min_t(unsigned int, ...) to match the types of words_available and
> READ_BUF_SIZE, reusing the existing local variable copy.

When you have to say "also", that's a huge hint this should be split up
into multiple changes.  Please do that here.

thanks,

greg k-h
