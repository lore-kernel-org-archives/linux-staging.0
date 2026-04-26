Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AEC436EAB8;
	Mon, 27 Apr 2026 03:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777261841; cv=none; b=MWRJxlgmRmUQuzdrqW0mXVyK/MYPhvb4Vr+fgUqWeo1GMeq68Jc+dQXDFDvAxNzZNgidaQaD9+RSuCh1xCQgrCUj6Z0LZAm9fJJ+OiW5fk384g5/F+fIP9GL3JhnLRDIDjvcv3tHPFo8EmTbw8c/1E8WKhoZTvI/Ukw7oGNCIM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777261841; c=relaxed/simple;
	bh=wTL3wnmiocpeO0c2ZWK8lSWWnOBSh8DIpPcJD8nAuY8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Uns5FTwCZA5eT/p99LO7kTr5SWavMCmnSbTh+AXskCBJyLFtzi2fP0KUUOnF55IAy4IqqLvVLehuzU8RRCStCFiIqWg5AZAzTErEK1vSziqcSjfEeZ+bzB38KwoUX1PRQm+VarzTDDcuLWBWTmiih+qcwi4IMD8UFkpXgFsZPdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=xwNtbTMw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="xwNtbTMw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29030C19425;
	Mon, 27 Apr 2026 03:50:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1777261841;
	bh=wTL3wnmiocpeO0c2ZWK8lSWWnOBSh8DIpPcJD8nAuY8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=xwNtbTMw0/VwckqZW0AMLQbQuMiJ2aJw1C8LD4J0uBDi7XON/A3v6+pp8V1ymvdsq
	 HwTggey45ixkwpiDwnD7XV6/mTS2/7XdwGS68fNsoXG8HCGkqOn6OkEu5SFRMZ1W5J
	 sPjIIfkOoE2WWfmcHiTxaZ504zzE05265s2izldQ=
Date: Sun, 26 Apr 2026 21:16:05 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Debjeet Banerjee <debjeetbanerjee48@gmail.com>
Cc: dtwlin@gmail.com, johan@kernel.org, elder@kernel.org,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: greybus: uart: document c_cflag handling in
 set_termios
Message-ID: <2026042618-whole-cassette-b15e@gregkh>
References: <20260419032632.35351-1-debjeetbanerjee48@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260419032632.35351-1-debjeetbanerjee48@gmail.com>

On Sun, Apr 19, 2026 at 08:56:32AM +0530, Debjeet Banerjee wrote:
> gb_tty_set_termios() derives UART line configuration from a subset of
> termios->c_cflag bits, namely CSIZE, CSTOPB, PARENB, PARODD, CMSPAR,
> CRTSCTS, CLOCAL and CBAUD. Other c_cflag bits are not interpreted by
> the driver and are not represented in the Greybus UART protocol
> messages.
> 
> The existing FIXME suggests clearing unsupported bits from termios.
> However, the driver already limits its behavior to the supported subset
> when constructing line coding, and unused bits are effectively ignored.
> No invalid or unsupported values are propagated to the hardware.
> 
> Replace the FIXME with a comment documenting which c_cflag bits are
> consumed by the driver and clarifying that other bits are ignored.

Ignoring is fine, but shouldn't the bits be cleared to let userspace
know about this?  I think that's why we wrote that FIXME all so long
ago.

thanks,

greg k-h
