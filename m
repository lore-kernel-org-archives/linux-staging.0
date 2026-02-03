Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB875287507;
	Tue,  3 Feb 2026 08:19:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770106799; cv=none; b=FDZzon5CaN2M7dHQGffh3SFAdyW8KUXZqwl1bF3IDsa0vYFyCsLJnOBm+pRDlsQCfYuJfvYE6I4jIZj4tm0u/WQiu8JGbkvdbv5nCgRLQyo3WRJa0QTRC0qKzByupvPGpf7YaCmPDaF29j6X1qLUiNg8hd46gv4Ii/f4bgFPgm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770106799; c=relaxed/simple;
	bh=hnVngm3CIHCjqcI6Sh/5ACEN1ueu1NXFiGVB5uka4Z4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iRSO8CbClXzpvcuXrLsVZrZH4H8oJBvG+zRu7h4iAdEcfHAYbpnz4M/lxjOpyRO1LJ0fyzig5pnMlpDlYcJNsJsB4Ss9mHmocXUm06RsnLzAk3XB1gViiel4Jzqwhq17a0SFa9tZa+KER5QQwdJqVwJ5peJ6voXzIXO/a6UbTZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=tD/RAzp2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="tD/RAzp2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB1C0C19421;
	Tue,  3 Feb 2026 08:19:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1770106798;
	bh=hnVngm3CIHCjqcI6Sh/5ACEN1ueu1NXFiGVB5uka4Z4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tD/RAzp21w6VPJvIq/+dAPVMCNJgqFpIJwbNcQFkKvpkqPApOb99o4eyadDowEyZ5
	 gi4cetIX1Vd10ZIRRibrchw68Fzaac9Zj11BI7i5/3DdJLKt7XTL5TYRtMpTFjA7Ig
	 KIyhbwOaGVogKmhGcP3lo60ydWhWzo3kSjiiU/ps=
Date: Tue, 3 Feb 2026 09:19:55 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Gustavo Piaz da Silva <gustavopiazdasilva2102@gmail.com>
Cc: dan.carpenter@linaro.org, ovidiu.panait.oss@gmail.com,
	gshahrouzi@gmail.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 1/2] staging: axis-fifo: align fifo depth types with
 OF API
Message-ID: <2026020311-rethink-armory-9d84@gregkh>
References: <20260202142047.30704-1-gustavopiazdasilva2102@gmail.com>
 <20260202142047.30704-2-gustavopiazdasilva2102@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260202142047.30704-2-gustavopiazdasilva2102@gmail.com>

On Mon, Feb 02, 2026 at 11:20:46AM -0300, Gustavo Piaz da Silva wrote:
> Change has_rx_fifo and has_tx_fifo types from int to u32 in struct
> axis_fifo.

I can not parse this sentance, sorry.

> The of_property_read_u32() function expects a u32 pointer. While the
> current code might work, aligning the types avoids potential mixed-type
> issues and clarifies the data structure.

Please note that the current code does work, so to imply it doesn't
might not be the best thing.

thanks,

greg k-h
