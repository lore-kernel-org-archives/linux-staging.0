Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2434A275B15;
	Mon, 19 Jan 2026 06:50:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768805441; cv=none; b=PHN2klNQd6KSa3iBIYFjMBiI5hetYvOf4iYu43zCgDzLRpDkKSjZ/Q5x8T1DRO3i1dYvuARK6hxA02VblKDiWZH1TNb+SedDk1yNZPh3pKbZ2IO89WRRnkyoMGyWbqYC/vpcByUIAtYlQXvYvseu5eGH3927C85AgHb75E8S38M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768805441; c=relaxed/simple;
	bh=gDsKTzlgEHhk1hpSjj44v8zyWHYu05tK8/d8eKnBqb8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ekoPDuKGCuD8Oc4td+HX3Krw/hU6GlZXlDUhRH/VAGJimKrwiDQWa5WJlPO9rqfAk/4H8ZG73pCD4jE2b/eqVuOHfUjRm2Z4X7mdrXe6mHh62cITXkRhfRdRYgJeTuABighHZrjc/63P1TV7/QtYWwAsOahBFqRVTBNHz49FGRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=xpggJljP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="xpggJljP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FA5CC116C6;
	Mon, 19 Jan 2026 06:50:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1768805438;
	bh=gDsKTzlgEHhk1hpSjj44v8zyWHYu05tK8/d8eKnBqb8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=xpggJljPRwyhptqDQnDzwEoimm6y950F7LCBjXWaO1KXdrFGJoTZqam69EvW/mq/1
	 c46ne5KH0XiP4T0LIR2ZcVQG7CgyqeEc536HeAVy0RwAj8lal8JrVKfuUcKTIojFcd
	 HlSJBbhiAJPXTLbFsxL8E5BuaZkuT1vPB2dAYtLQ=
Date: Mon, 19 Jan 2026 07:50:34 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Karthikey Kadati <karthikey3608@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6] staging: octeon: Remove port status typedefs
Message-ID: <2026011949-carded-escapable-a029@gregkh>
References: <20260118171348.54963-1-karthikey3608@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260118171348.54963-1-karthikey3608@gmail.com>

On Sun, Jan 18, 2026 at 10:43:48PM +0530, Karthikey Kadati wrote:
> Remove cvmx_pip_port_status_t and cvmx_pko_port_status_t typedefs and
> replace them with struct cvmx_pip_port_status and struct
> cvmx_pko_port_status to match Linux kernel coding style.
> 
> This also updates the MIPS architecture headers to name the structs so
> they can be referenced by the staging driver. The anonymous struct
> definitions in the headers caused compilation errors when referenced
> directly, so they are now named structs.
> 
> Signed-off-by: Karthikey Kadati <karthikey3608@gmail.com>
> ---
> Changes in v6:
> - Actually removed the 'typedef' keyword from cvmx-pip.h (Greg KH).
> - Moved changelog history below the --- line (Greg KH).
> - Removed misleading Reported-by tag.

As the kernel test bot shows, this wasn't tested, which is what I asked
for you to do the last time this was submitted :(

I suggest working on something else please.

thanks,

greg k-h
