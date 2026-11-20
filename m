Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795170168;
	b=gfGtgPZspNfligWmqSFBc8t7LZyqppCfy0iTGtZgJUd6DJkiFW0hBcL/+bC2lL86v1qf
	 3YP+t2gQNO15ZO68wZQ0CBG0m3kD9d4RQ/avwYGKNpyX3Z+EBOSSmD0mJ8guu0QkDLES9
	 Dn0TrN0ea+a+GcW0ueVgkEG+XhJWoG+wPjvDUAzhuDB4GPWuCst4SusTbDiltURlhRQqt
	 rTIzWI0q4Q1P4I4XUoBMkX/KqyUG4gHb+KxgRPz668KeQ6D8djrZap3aJt0VcKpmp2dg6
	 o1CW5R+9gZFv0yrDvW2qcmO4YKcr9UBAEaZAw/6Slptl+pdkYhsNTaYS68F39TfutqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795170168;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=VajH4hmmm3l/s5njp3ywy3EhTP1RvSBqpJgoUnAALQc=;
	b=nfNNHfnBwYIJwnAdNN4x+RjiWUlEHrgaYV9kJ6Vwh4WeBjrJ2kmj1YQVPRT04AcfSc5h
	 Yatmq/X2yUxdFA7QnbGqu6bsnRgT7FtkeXfd8KlxV6pVLTR2UUgTB17imCBi5Z/JFU11W
	 4k+qqAf9rzPyNhzgAQoZGkYp5fM/NcHy16GtJWCtL/opR57zoSz3hHun5K8ZUv+nWlRKs
	 +cCX3c4u+UDT1V/MPhBP33DT+D+DW/z8mDzXdoM6EBZoouOR/822j6tHhwQP2zhLBp2E0
	 9NoAYmF+htZGIJ8fQp3ZIYFeTr7+T/JVL2javXus1I9yCSGre1NdFhrrxlsRolbHVYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=EYjTJVzC;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 103AB606A326;
	Fri, 20 Nov 2026 10:22:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=EYjTJVzC
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16AE31F000C0;
	Fri, 20 Nov 2026 10:22:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1795170167;
	bh=VajH4hmmm3l/s5njp3ywy3EhTP1RvSBqpJgoUnAALQc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=EYjTJVzCHrpKNkeOYU6m51VaY+lGSn6aQnTIiC5KjghAJAxLAoO1LK/0zHAww7Frw
	 6hRYv0RH7Fb9Mhsc+rgo3csGgPitjVw80R0dNY55Wpsz2xbL6hOzKkO6/zemGXL0Ch
	 hN9ZMEffhKYRi08FRdl6vy50q4anK6osBtth0viI=
Date: Fri, 20 Nov 2026 11:22:45 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Victor-Marian Albu <albu.victor.m@gmail.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, christian.gromm@microchip.com,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
	parthiban.veerasooran@microchip.com
Subject: Re: [PATCH v2] staging: most: dim2: add missing Return: documentation
Message-ID: <2026112035-persuader-jackknife-1586@gregkh>
References: <20261104205108.1041666-1-albu.victor.m@gmail.com>
 <20261105202110.1081296-1-albu.victor.m@gmail.com>
 <2026112048-dimmer-ravine-ae33@gregkh>
 <CAE5KA-NS5-yJXAHUofgmyCmWyjbjPSNdoQZi5+iPwZKabVbbyQ@mail.gmail.com>
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
In-Reply-To: <CAE5KA-NS5-yJXAHUofgmyCmWyjbjPSNdoQZi5+iPwZKabVbbyQ@mail.gmail.com>

On Fri, Nov 20, 2026 at 12:18:09PM +0200, Victor-Marian Albu wrote:
> A few had no Return: at all so I added one, the others already had the
> sentence and I moved it into a Return: section, because kernel-doc
> -Wall only looks for that. Nothing needs this, drop it if it's not
> useful.

I have no context here at all, sorry.
