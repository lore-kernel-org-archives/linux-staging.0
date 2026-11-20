Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795159314;
	b=MoxxIiv3YeN8/AQqv7p3UJlx8yYrdnKALvQ6CBYBx2Mltk5uS1ymG9i9xelOj7QUstgl
	 EDhwG3dWaZqYI9iXgNpxRaeesDzG5dWbFMyTMhi0SZ++HdB1tlkAVqARYR37rj+7mZ/8G
	 ExEob3C6DJNcp6+VFTKYabr4lOJB/YMFPo6Fl6WJ2LW7b4eJlVX/jb69GunvvutKr7dYX
	 Oq6ePo/LpifovJinzvnXKxJ0m9H+dDGzH2gurbuHyQV5fpSZWP9CxMf49jBde7FXp3iO7
	 gUUFn7e4sgpsBZZ/Xd7ajRn1R9K+mf790nbEas1cYhaC61GddVtEHxOxl/tDOq0RNsg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795159314;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=XheRX6sx6r1KaJuHijkiDv8O1r5kPpBBGPltrX4uTCI=;
	b=yqs81wMGM9wIezDERbq23n37MGnbKqNtL1BAbxoBQPPjBpHqyKMBkNgUkNP0vOYGQvC6
	 AkQdWgvPJTk+Ec9gfW80kwaGJmom9iymlAe9jBVOuHcDrBQLlaN9x6DTY2sK8witrU41c
	 hDBwOGo4wdZOznFHWvvgQ3NL8zz81trq2FEt7/DpmNjgCOlHPqRrGcsdEJSzzyFfc+ai5
	 +e7d8H8vXsi9ggHhFPn4cW5v+Rz25cKkfDo2A2uzl5ntLJATckDzp7Jf/HAajVEQVIzA2
	 LxLcr26LBlKLA6VOeqRYBe5b8i71VcQgY4tEiHzOI/UiJzegWuI8y+gnX1kfxeLkxAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=B2jZV994;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D833606A320;
	Fri, 20 Nov 2026 07:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=B2jZV994
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C1841F000C4;
	Fri, 20 Nov 2026 07:21:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1795159313;
	bh=XheRX6sx6r1KaJuHijkiDv8O1r5kPpBBGPltrX4uTCI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=B2jZV994l15/UJMTDLl2P6x5JbABJhG9PC7So5dnd4diC5x+g+uWzkHPAKU8jFIsh
	 TAWyy/qozNXP1tYSQTb+3/qiRoNlcMe305sC9rJfrhYf7OQIVvTmJK6d1wUoxtZi7J
	 oj5e+CqvU569VwhTRHwwuZJRRlk6VDVWtqIC2JHU=
Date: Fri, 20 Nov 2026 08:21:51 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: yusuke8h@gmail.com
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	linux-staging@lists.linux.dev, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: bcm2835-audio: remove unused
 bcm2835_audio_retrieve_buffers() declaration
Message-ID: <2026112041-suffrage-bonanza-e079@gregkh>
References: <20261112-bcm2835-audio-unused-decl-v1-1-3b63a24b033b@gmail.com>
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
In-Reply-To: <20261112-bcm2835-audio-unused-decl-v1-1-3b63a24b033b@gmail.com>

On Thu, Nov 12, 2026 at 04:29:55AM +0000, Yusuke Hayashi via B4 Relay wrote:
> From: Yusuke Hayashi <yusuke8h@gmail.com>
> 
> bcm2835_audio_retrieve_buffers() is declared in bcm2835.h, but its
> definition and sole caller were removed in commit d7ca3a71545b
> ("staging: bcm2835-audio: Operate non-atomic PCM ops").
> 
> Remove the orphaned function declaration.
> 
> Signed-off-by: Yusuke Hayashi <yusuke8h@gmail.com>
> ---
> Found while scanning staging headers for declarations without definitions
> with an AI coding assistant, verified against commit d7ca3a71545b, and
> compile-tested with Clang 18 (LLVM=1 W=1 C=2) and GCC 13 (W=1 C=2) with
> CONFIG_SND_BCM2835=m.
> ---
>  drivers/staging/vc04_services/bcm2835-audio/bcm2835.h | 1 -
>  1 file changed, 1 deletion(-)

Please read: https://lore.kernel.org/r/2026080354-skater-urgent-31b2@gregkh
