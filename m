Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 496FF329374
	for <linux-staging@lists.linux.dev>; Tue, 18 Nov 2025 16:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763482277; cv=none; b=jx43wuR1B6+MMAHx6fJyCV2dYUWW8bpZ20u7aaC+x+aXffW7ALc8r02qzkhqMxMAxcINiNCOpHIRXVNWQSkaxXlGS44w1i4WHMdWW8hXEAnreItkOvOKeOya4GmeGGkZpko9G294CX50LFjhyuVbVabrM4yVXtv5OLQxEoY6nvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763482277; c=relaxed/simple;
	bh=2R+W0bNW0qaHbH1C5fWHY3FbQ8vbRzdINajKOyRjyvw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qFTqiJhIdFNwdT+H4UBjDl5OusBDt0wTsvHl26z7fVfb0iGUmjjyRl5ZP1pWTiPWOs5GRY/GhXbrOq5eTxSZVf8+4mySf7FVSNu0QM3lZ3jnWhqhZZk+ZVoloG5otg6usDmclDeWk1yF0UpfIwhmqFCfT60dCZie0Ju035kqq8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=r04RTVDV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="r04RTVDV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AD79C4CEFB;
	Tue, 18 Nov 2025 16:11:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763482275;
	bh=2R+W0bNW0qaHbH1C5fWHY3FbQ8vbRzdINajKOyRjyvw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=r04RTVDVEKxJSfcCMmoX9CdCrwGz34qrAgEOWZgvn6iKduDAnLol1yW1Jx8KEhwRG
	 wCyGsXPpd5/GvdDk2Dewcjz8vjVdqT9HYiVvl6VRTInN1gbI738yQFoaFiUEL9PjLE
	 NDM+wIzFlDfNrl0yf5ivov6w6JsPGMe/Bqys2RRjOgdwtXHC2CpUUWN4SBjMfefHLD
	 SQ5q90vtq25UWQYrzw8sP6HdsuayDRhYIXca6cFPGtxUGk/Ga+6rU1iOfejAHYB0Xu
	 ptQsGRHT9duyT+jfSAtcyS/EvqHAu4QnXqieGIf2U9Q7/qvoWYjjo7x85JeGexfNYo
	 XdLN0R9u7nrvg==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1vLOIT-000000003I5-3ll7;
	Tue, 18 Nov 2025 17:11:13 +0100
Date: Tue, 18 Nov 2025 17:11:13 +0100
From: Johan Hovold <johan@kernel.org>
To: Ayaan Mirza Baig <ayaanmirzabaig85@gmail.com>
Cc: gregkh@linuxfoundation.org, elder@kernel.org,
	linux-staging@lists.linux.dev, greybus-dev@lists.linaro.org
Subject: Re: [PATCH 00/13] staging: greybus: cleanup, FIXME removals, and
 driver correctness fixes
Message-ID: <aRyaoaauQyE78OhX@hovoldconsulting.com>
References: <20251117181818.118139-1-ayaanmirzabaig85@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251117181818.118139-1-ayaanmirzabaig85@gmail.com>

On Mon, Nov 17, 2025 at 11:48:05PM +0530, Ayaan Mirza Baig wrote:
> Hi Greg and all,
> 
> This series performs a set of cleanups, correctness fixes, and
> remaining TODO removals across the Greybus drivers in
> drivers/staging/greybus.
> 
> Greybus has existed in staging for a long time, and many FIXMEs,
> outdated comments, and partial implementations had accumulated over the
> years.

These haven't accumulated in staging, but during development as the git
logs should tell you.

> While reviewing and compile-testing the drivers I found a number of
> places where the comments were obsolete, logic was incomplete, or newer
> subsystem APIs had evolved.
> 
> This series addresses those issues without changing any fundamental
> design or architecture. All changes are self-contained, straightforward,
> and focues on improving correctness and maintainability.
> 
> The patches include:
> 
>   * Removal of obsolete FIXMEs that no longer reflect the current code
>     or hardware behavior.
>   * Correctness fixes in several protocol drivers (UART, RAW, USB,
>     Loopback, Firmware core, Audio).
>   * Small improvements to error handling and shutdown paths.
>   * Cleanup of commented-out or dead code.
>   * Removal of the now-completed GPIO and PWM TODO items.
>   * Removal of the empty Greybus TODO file.
> 
> All patches were compile-tested with COMPILE_TEST=y and all Greybus
> options enabled. Runtime smoke testing was performed where possible.
> 
> This series does not attempt to graduate Greybus out of staging; these
> changes are preparatory cleanups only.
> 
> Thanks for your time and review.
> 
> Ayaan Mirza Baig (13):
>   staging: greybus: Remove completed GPIO conversion TODO item
>   staging: greybus: pwm: move activation into pwm apply and remove
>     request()
>   staging: greybus: remove empty TODO file
>   staging: greybus: audio: remove obsolete INPUT_PROP_NO_DUMMY_RELEASE
>     FIXME
>   staging: greybus: audio: remove obsolete FIXME and document topology
>     ownership
>   staging: greybus: bootrom: remove obsolete FIXME about SVC parallel
>     event handling
>   staging: greybus: bootrom: remove obsolete FIXME around firmware
>     filename logging
>   staging: greybus: fw-core: remove obsolete S2 Loader runtime PM FIXME
>   staging: greybus: loopback: remove incorrect FIXME about async wait
>   staging: greybus: raw: handle disconnect while chardev is open
>   staging: greybus: uart: clear unsupported termios bits
>   staging: greybus: usb: validate hub control response length
>   staging: greybus: usb: remove obsolete FIXME about bridged-PHY support

I only skimmed some of these and there are so many bugs and
misunderstandings here that I can only imagine what's lurking in the
remaining ones.

The basic misunderstanding seems to be that FIXMEs can and should be
removed without addressing the underlying issues.

Johan
