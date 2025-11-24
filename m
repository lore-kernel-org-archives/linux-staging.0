Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A7EA28D8DB;
	Mon, 24 Nov 2025 16:44:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764002653; cv=none; b=hurRnElZXFdCp5EDJ1FbOU/Ouyiy1YCeM6pMVr+ZjnmAkCg0ZPLXZj12Hg+O0Xkr/LZ7RfeJyXT2Hre7zbLyYdcEONU90XREUtTvy3bWARqQaeH/fSi1+AlBy7yf2uRE/76jO3cY2sks+NZUgCH4Fb2crrkTqvgHadiuYQF0w8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764002653; c=relaxed/simple;
	bh=0z9erSFonxkXFN1+3lLmgKHWbPpw5VFmnre9QMm0k5A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ACWTv1T/XmfoX6ymadd4xU6Es/xlpy9YcKpTM9ZeB3rOWyOEBBzM9hHnUUJ1h2aRKe5JyOrxMVMGBdO0uAg5WiHszAYkep1rBzOXp4FMiUrRpi7EM7GDtfrIciai7tA+p0WmCn+wrSD1qfybUOioxo017vHchuaXWhPKiSOy7zw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=QrdWS+a6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="QrdWS+a6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C53CC116C6;
	Mon, 24 Nov 2025 16:44:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1764002652;
	bh=0z9erSFonxkXFN1+3lLmgKHWbPpw5VFmnre9QMm0k5A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QrdWS+a6Og4qeJ0WeIoJZhY51xq5VzsP7CB5T4E+XWFZZwgTmY68J5TXeWGMDEch5
	 HioUEgHMl2TVWmROgcZKcFZ5PuYkt54igAUFlMhL4pa58eJP2Hrqg28ocwmsXJ8p16
	 K+OHxTOOO7Lv8rW2FOXhdq3pXh41zpZRS8Zcm4qo=
Date: Mon, 24 Nov 2025 17:44:10 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Bryant Boatright <bryant.boatright@proton.me>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: Re: [PATCH v2 2/3] staging: rtl8723bs: Rename camel case argument
Message-ID: <2025112415-unusable-preview-4fce@gregkh>
References: <cover.1762803720.git.bryant.boatright@proton.me>
 <6fa67d3588ac82dadd715bcb9c16d4e79dac506e.1762803720.git.bryant.boatright@proton.me>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6fa67d3588ac82dadd715bcb9c16d4e79dac506e.1762803720.git.bryant.boatright@proton.me>

On Mon, Nov 10, 2025 at 07:49:46PM +0000, Bryant Boatright wrote:
> Adhere to Linux kernel style.
> 
> Reported by checkpatch:
> 
> CHECK: Avoid CamelCase: <bw_40MHz>

MHz is the correct spelling of this, right?  I think "mhz" means
something else (i.e. nothing.)

So this isn't a good change, sorry.

thanks,

greg k-h
