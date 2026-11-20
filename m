Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795158623;
	b=pdu1Yd7XjFvvEcXnBL9k50xkM5l/44OB7jz3Ig+bHqxFdwTWaZoZOvG2khKJApz5Rn4z
	 3MPHWELAdslKsPMPEs7stgkSt/nuFZXUzBV1R+7ve36PiH2OoD3EdQacykfJpByWpyOd1
	 CRHwBdDQOOY4tikTQM5i2UIh3RMztJjHz9SA69k/cB4T8PH1miBRCEJ5PrjUxIHgc+IHO
	 p8oxDK+ty/uN1PN//EfnqHnShyzgFhYwjBTPjPhrcC5CTX3VHApmgGIO2erHVIjhAitBv
	 cEq+tgAJ+2WsLeSedqbV9ZlqBKzyXI0WnF3rFdPwmmD0ZYVoorAiWvblVThZOUGF8QQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795158623;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=M2FU8kYP9X2dTB3mmpaGj3laMQ2U7w59LgTbjk8z+uI=;
	b=A8OrQfCiUPlKd6IG5BE3p5A+xtypNVYVI2tVtJYAVkSPVVkMefESzuwW9n/e2v+EqCJ8
	 lxkC0BP7yyK6ZC9HjgEPH5dh0axVjWCXrvSMMQ5GMgSL4nsLBxPzezPe/VozWziNg4KGP
	 eUNJojtwdq6AzJXm57bkOY2MkJyOnYXfaYMT1C+0xQpqsZpq/c6bcOi65IGj+Wn3tl2/L
	 muWG3UI0f7Su22vteuVtN5kxfLyywk0rFFYkjfCF/dQXScuNLpMCXCY7rptdB8aqj4IqU
	 TfoiYPFKPkbOPnTthBftfvyUvmJdfTKCXkMUcQ7JK9a1NXp3opFnHIFBR40JARAqbKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=RRjGA9N5;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B0F0606A320;
	Fri, 20 Nov 2026 07:10:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=RRjGA9N5
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E4641F000CF;
	Fri, 20 Nov 2026 07:10:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1795158622;
	bh=M2FU8kYP9X2dTB3mmpaGj3laMQ2U7w59LgTbjk8z+uI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=RRjGA9N5ThOjsTH0R4uDpj18WQL+3s29IVMqYmqvW13SNdR6yoqJBz2Y91mgddpCs
	 yc0GuR1VACZvEDUoUKjmqE/RhpVlqZ5mNwi503LFfNipLE/df9lsjx2DllfbGY5McP
	 Cel6F0uxlfGYXKwoSkyqCzUvoOS3hfZUTe9CJTBM=
Date: Fri, 20 Nov 2026 08:10:20 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Anthony Lian <1198715581lxf@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: fix CamelCase identifiers
Message-ID: <2026112009-semisweet-dusk-9059@gregkh>
References: <20261024143728.106296-1-1198715581lxf@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261024143728.106296-1-1198715581lxf@gmail.com>

On Sat, Oct 24, 2026 at 10:37:28AM -0400, Anthony Lian wrote:
> Fix checkpatch.pl CHECK warnings about CamelCase naming by converting
> the remaining identifiers to lowercase with underscores, as required
> by the kernel coding style.
> 
> Rename bInSuspend, bSurpriseRemoved, hal_btcoex_InitHwConfig,
> hal_btcoex_Initialize, and LeaveAllPowerSaveMode to their snake_case
> equivalents.
> 
> This covers the variable, field, and function names touched by this
> patch; all call sites and declarations are updated accordingly.
> 
> Signed-off-by: Anthony Lian <1198715581lxf@gmail.com>
> ---
>  drivers/staging/rtl8723bs/core/rtw_btcoex.c   |  2 +-

These files are no longer present in the tree, sorry.

greg k-h
