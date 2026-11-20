Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795159017;
	b=tmdNbsyqQ3x9L2EE0UkKpl2vmHDpSireflMSrc4+m6ZafUD4bxHQAgeS6Dwxd9mz6Yv8
	 6K4Q8aAjC9ArisEOJzSSSdP7Nwk0ZLHtyXe+uZXU2fh9aq1zJ2g2B++4EeeMA2jtAQDY8
	 C+Hv9Gd+LkZXtkLGTK5GjrJbYo7aSZfWG+rM8NhJgEFT7OZJtaE+ikjdj7nrbjvEVxA5n
	 H+e3VoukU3eXYy1o/RA6rFK2WDGsD5JeV0SKHh8GpWb3tcJADXMK8C6zruuHhZnQIxNoD
	 +OFt8iP+D8Gns5Ra4HkUyMgOW+w0wxAvNvQ4kryX8nuQ6qVUs1q5jffme+s7D5fEvBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795159017;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=7SAZQJF5qDDR1gr0gsfdLGkKz9vlx8ROjkl3OoJzoDM=;
	b=JR6k4sdjJreuOjIdx6EpNBTnpNb2njXpddQ1wSWFOpIHsouVnPYZUUyo7NNJ29HsAQBC
	 gvpxF6/FvGDc/zZ0ve2Nj/oraP71Dr73rM1tpj3Vt31aqDLwBM1Q/eanYwoF860uN+ZCV
	 XLBXnzox2iJqmKYpBxXAKEdjm8aCu2lPADYeo4SbZHI+7Xz9D31hBh8AjIpj9V0ciTW5O
	 QGLgFPUrW4L6GjYRj6/dt+R1EUe3hTb/6Woj8p9rdtuOXWYsfqw6C6EpeaiT0GU0vUpmw
	 cCCMsLctrClnHAKnQmzhiPPgk3z170pHsae7Adgu/44zzsLg6dFEht+IPX/7sWXL5Xg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=tVOP0u1M;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6EF5606A326;
	Fri, 20 Nov 2026 07:16:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=tVOP0u1M
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17E471F000C4;
	Fri, 20 Nov 2026 07:16:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1795159017;
	bh=7SAZQJF5qDDR1gr0gsfdLGkKz9vlx8ROjkl3OoJzoDM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=tVOP0u1Mi8GBCz7s8vCzuGhnkx+YwhN20yJl+gFjRljvc0q+P91Dv8axTMhYPkNiK
	 IAOgzNvzYoyvb+576dawA5ixA3OhlQTTQLgkLIl2zRZZ6WLMpsxb2x8hOnKKccwIbN
	 8c0akVRMB2HhWgzHnY7niBjPgVIsgcjiShjuIfBc=
Date: Fri, 20 Nov 2026 08:16:55 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Niloy Meharchandani <niloymeharchandani@gmail.com>
Cc: Parthiban Veerasooran <parthiban.veerasooran@microchip.com>,
	Christian Gromm <christian.gromm@microchip.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: most: net: use guard(mutex) for probe_disc_mt
Message-ID: <2026112038-breeding-skinny-7966@gregkh>
References: <20261114065358.149853-1-niloymeharchandani@gmail.com>
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
In-Reply-To: <20261114065358.149853-1-niloymeharchandani@gmail.com>

On Fri, Nov 13, 2026 at 10:53:58PM -0800, Niloy Meharchandani wrote:
> Replace manual mutex_lock() and mutex_unlock() calls on probe_disc_mt
> with guard(mutex)(&probe_disc_mt) in most_nd_open(), comp_probe_channel(),
> and comp_disconnect_channel(). Include <linux/cleanup.h> and
> <linux/mutex.h> explicitly.
> 
> This simplifies error paths by removing the unlock goto labels and
> temporary return variables while ensuring the mutex is always released
> on scope exit.
> 
> No functional change intended. Compile-tested only.

Only do this for new code, never touch existing code like this, it's not
needed.

thanks,

greg k-h
