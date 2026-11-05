Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793915232;
	b=KMeMJUgcJgzplpRm0EGaxGqrCE6GL9LLmZu643CW/uUiyEWHcHX8SEEdDGPpomB6BLp+
	 wPd4uYr8RIKVrmaFl18h53tDhU44C0DhRCsQYWrkuZV5mcZhNW5yqdY33+kPhSqy3MB66
	 IIzJHQ4jCZhWzwxSERW9/xwU7qCMihirzZ0FROnueRn72K2Fgabec2QB4KbXJ1vZaquyS
	 oF4InGp6T350bBWane3cfxiJYfiMsTNdt7wpMKSqSN6glx4v6ZJswuBLvsP5QJEx+N0/p
	 RPFMtlXFQVjo5PL9xuPAPhKC0Ip7jlfIi3nsU1UNt4eqMt5b69jSefQ95kpGSG2NGow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793915232;
	h=DMARC-Filter:From:DKIM-Signature:DKIM-Signature:To:Cc:Subject:
	 In-Reply-To:References:Date:Message-ID:MIME-Version:Content-Type;
	bh=fWEq7ANjuAxT0SsQWCA6NNqlsk5fygPVddvQlmahPzI=;
	b=1Vx7menPR2I6fOrenBpqIBS8hpfT7HQNBt5eXgUhZIZzhSPPbKpAzf31aT+aIqTKdZYq
	 U7pi8SF/pBR9ygwfk9isr99CTqpdRxjMXAnksf3ZUX6JpxKG9D5hk3yf+9WesvRKsUBAQ
	 zz5ShaEpJAZjNTj2aFiRv15MmmLrPXgjD/hF4t7ipHW88eXiGhKzYa066CgpB0KcraVuF
	 lDUFHQXMcm7ljhI7VzgZgLOslgQhlPzVU6aB+5j8iA/osf9bi7ZpbhO1itCRY8yo2WRsa
	 IHTxbEV7nsJM62BJcu7myYhkuqZTq0WAVb9xxJrS+ROYKv0ou+/p9/jqPCjLfpxJfwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=oY6hUsF2;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=Kzv9OIGZ;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A514606A32C
	for <linux-staging@lists.linux.dev>; Thu,  5 Nov 2026 21:47:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4A514606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=oY6hUsF2;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=Kzv9OIGZ
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1793915229;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fWEq7ANjuAxT0SsQWCA6NNqlsk5fygPVddvQlmahPzI=;
	b=oY6hUsF2Jx+NRaoHk81kEfoNEY+zkReOYRbyvhWrJy4CqaCVDc/BA2X+16JJnZXeTPyy5K
	rnI7LOgaXmNRBNvXnGM+EgGTyQOBt8xy/GPCJJQgaXzTHvc7YbxvJ4P6tk8gUAgkWAlsmf
	sNr9aArKBucyyonucqvG9lGYA164GHmgyRp09lEuQIQWmaIW1MF/zmnBWSXF/Xj/QF5MUF
	X4yocNFsZcXQ+IAchbLZ4X70PhEHRpRBxSGeefm1GAopDbSo8s3fyeOCVTnH/EEe1rA1ra
	ApljPya+O4QdZIWd0iQpY1uie2Jn9IvWO6fry+v2OK1AqHjstIqp+DhfZfJCIA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1793915229;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fWEq7ANjuAxT0SsQWCA6NNqlsk5fygPVddvQlmahPzI=;
	b=Kzv9OIGZXm3GfDja/e1kGOPpANmqPEdnG3/UWpLWsZ3yo+uGUbKbLNxSzBkZkOCvBFQ7qN
	Yv7wNl+KWROkx+Aw==
To: Daniel Matyas <matyasdaniel006@gmail.com>, dri-devel@lists.freedesktop.org
Cc: Daniel Matyas <matyasdaniel006@gmail.com>,
 linux-staging@lists.linux.dev, Andy Shevchenko <andy@kernel.org>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Alex Lanzano
 <lanzano.alex@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Conor Dooley <conor@kernel.org>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Paul
 Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [RFC] staging: fbtft: Moving fb_ili9341 (and others) to DRM
In-Reply-To: <20261105201154.37294-2-matyasdaniel006@gmail.com>
References: <20261105201154.37294-2-matyasdaniel006@gmail.com>
Date: Thu, 05 Nov 2026 22:47:06 +0100
Message-ID: <874idv2bol.fsf@yellow.woof>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

Daniel Matyas <matyasdaniel006@gmail.com> writes:
> Questions:
>  a) Is removing fb_ili9341 acceptable, pointing users of other ILI9341
>     modules to panel-mipi-dbi? The KD233 node would then have no driver.
>  b) Or should KD233 panel support go into a DRM driver first? I don't have
>     its init sequence or physical size, or the board...
>  c) Is removal of all of fbtft already planned?
>  d) Several other fbtft drivers have drm counterparts. Should I inspect those
>  to see if removal is needed?

IIRC the main reason fbtft needs to stay is because it supports parallel
interface which is missing in the DRM drivers.

Nam
