Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCA8B38DC4E
	for <linux-staging@lists.linux.dev>; Thu, 30 Jul 2026 07:38:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785397143; cv=none; b=mfXR2iZJE5q1EXW1s2cEOzuRO2bttOROoT3M1iGGO7KJCdS1MI9uUnpFYFsRJFYegXs+tibmOaDb9966eBBhy4/tfES/wr5NeKhi6Lwc8tc2KxL7gsUQudpGDGk+rzbaXe2/nVgxjVHfcLnFHqMTpxSAQmdhScgy80T3MLgMJXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785397143; c=relaxed/simple;
	bh=xhU8Kir7iIRdFoo5ymKROv61SOQyoD7WOROeBO+65lI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tpjmilX8spwegFjHre8hNro/5W/Ko+os1HuVB2zOyFuy/TK3YrfYiIGnUXhm2K9iQm23DnTtT6+q9qDUZdW0XbwqQ85tAnaenoug6kGr3QkqyjWxtmPztYHeU2YWTE7CDUDSQOo8JAVXk5uhE6+U62kzLqrQcIlVxAFKNmL/3bQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=ykcS9s3N; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ykcS9s3N"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EB7A1F000E9;
	Thu, 30 Jul 2026 07:38:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1785397138;
	bh=3Q+xiFKJLeGmM2p2kQQMRUm5RlUkpcAF2rzPVwUyBZQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ykcS9s3Nqh4dMYuTC00glsjPYWICYJZnC8p0amd23KQm1la7Iv9Q9mFfpMSBXIJyT
	 86TMC/CdvBbW4jvlTsm9VBXa3jszPQwC179KnNx8Ihr8ZYec4nlt9rblg3V03cWIek
	 Kob7SsZ8jBa163hG3L25JVHKgniUTgq7HRdsvT9Y=
Date: Thu, 30 Jul 2026 09:37:31 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Connor Sample <tabulatejarl8@gmail.com>
Cc: linux-staging@lists.linux.dev, Ethan Tidmore <ethantidmore06@gmail.com>,
	Nikolay Kulikov <nikolayof23@gmail.com>,
	Dan Carpenter <error27@gmail.com>,
	Luka Gejak <luka.gejak@linux.dev>,
	Khushal Chitturi <khushalchitturi@gmail.com>,
	Hungyu Lin <dennylin0707@gmail.com>,
	Samasth Norway Ananda <samasth.norway.ananda@oracle.com>,
	Adrish Bora <adrishbora@gmail.com>,
	Shyam Sunder Reddy Padira <shyamsunderreddypadira@gmail.com>
Subject: Re: [PATCH] staging: rtl8723bs: os_intfs: replace msleep with
 usleep_range
Message-ID: <2026073013-tattling-herself-8f46@gregkh>
References: <20260729052040.249972-1-tabulatejarl8@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260729052040.249972-1-tabulatejarl8@gmail.com>

On Wed, Jul 29, 2026 at 01:20:38AM -0400, Connor Sample wrote:
> checkpatch.pl warns that `msleep()` of durations <20ms may sleep for up
> to 20ms. As per `Documentation/timers/delay_sleep_functions.rst`,
> `usleep_range()` should be used whenever the accuracy of `msleep()` is
> not sufficient in order to avoid jiffy rounding.
> 
> Replaced `msleep(10)` with `usleep_range(10000, 11000)` and replaced a
> 1ms polling loop (`msleep(1)`) with `usleep_range(1000, 2000)`. This
> should provide improved scheduling tolerances without changing the
> minimum delay expectation for the hardware.

Please see the many places in the mailing list archives where we have
rejected this same patch :)
