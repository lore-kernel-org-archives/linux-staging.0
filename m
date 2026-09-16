Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BE1437F748
	for <linux-staging@lists.linux.dev>; Wed, 16 Sep 2026 12:50:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789563038; cv=none; b=fj16xI8vwszFIMsGTDznCmttGbR5X3frYsy5jwLi3zKfYjsSw//ibElBF2JNQkxq7/7adjIhVhFjLsPw/PINMtmokS+HZf+GBMzdKDRviuYhdtZuKpQYAxl0qJ4cYCMpN8gvPpRx5EWRIhSi23SQkdbXvTCBkvkgpwitGyFbYCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789563038; c=relaxed/simple;
	bh=I+JhpuGGvMdmNOgYncDR/qRYD0Xl8TCeVVwQFy7834Y=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=HnAvBniP0mrEM0af6LS+UmGz2b7ZXRGhYT+pU6aS7nnm5R7LGZ10nvUgI8niMPeEjz+3iA1L2ploIbDudBaXBB4E/9+LQcpaCktddGRuJyR7lOwwLq6rqm8+BzNNQvAM7x6JKd7Yhkaawp9eT+80EVxw3EX2W51z7Ef6nlwBDlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=S5s282Ot; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=iOsARUDc; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="S5s282Ot";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="iOsARUDc"
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1789563030;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=I+JhpuGGvMdmNOgYncDR/qRYD0Xl8TCeVVwQFy7834Y=;
	b=S5s282Ot3+Cl4K2caSQMcqrsRWnyaAT9YU1HZYruN3O6mxOXJbiLHOSWUbFaKDJZBNV/tw
	ZPXsJoAlGo5ZGh/PUVnyeGEYm0sKsyIUxoP6fgsPkNqOOj4Ds34ASF6Qoe4ldOlPoKJYJZ
	g3fMuR0nhIDJ7rWED1/FDoy7Lo0hZZfWsXQFDWHYTmiw7JOTXenc2RYMO8jzjHAZ1JLA10
	8nCukFec4G+b02IQBZ91jwwS507k7aCUeT/upK8e1NCSwhUv3zwaFCIPVkSmXGKMc+EB1l
	DaHp1voyLv4jBGfdlz+BwS0fq2w1ofoVH+v+Fx7aBgdAnJZeHmkkcw0HHT7c9A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1789563030;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=I+JhpuGGvMdmNOgYncDR/qRYD0Xl8TCeVVwQFy7834Y=;
	b=iOsARUDcZvCRmPDbIOTtLhyZEvx7CQh/F9y3JDHsLwRfedcDm4wRZVhEi+pYmIA6t52Zvx
	gZL9AiRehpkmOVDQ==
To: =?utf-8?Q?=C3=96mer?= PALA <palaomer100@gmail.com>, Andy Shevchenko
 <andriy.shevchenko@intel.com>
Cc: andy@kernel.org, gregkh@linuxfoundation.org,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: fbtft: fb_upd161704: replace udelay with
 usleep_range
In-Reply-To: <CAKhZXnr0GdUrEu9vyMAWRCWyQzPM7cWQ6LRDa8fX0hnMkTN0RQ@mail.gmail.com>
References: <20260916093928.52057-1-palaomer100@gmail.com>
 <87ecet5xos.fsf@yellow.woof> <aqp4GA1q6cLKivZo@ashevche-desk.local>
 <CAKhZXnr0GdUrEu9vyMAWRCWyQzPM7cWQ6LRDa8fX0hnMkTN0RQ@mail.gmail.com>
Date: Wed, 16 Sep 2026 14:50:29 +0200
Message-ID: <87bj9x5pii.fsf@yellow.woof>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

=C3=96mer PALA <palaomer100@gmail.com> writes:
> Thank you for the feedback and review. I note the line-length
> formatting (~72 characters per line)
> for my future commit messages.Second, do you understand the difference on=
 what
> code is doing before and after your change?
> I understand that udelay() provides deterministic, busy-wait timing requi=
red for
> hardware register initialization, whereas usleep_range() introduces sched=
uler
> overhead and non-deterministic delays.
> Out of technical curiosity regarding the driver IC: theoretically, if we =
knew
> the exact window between the hardware lock/stabilization
> time (min) and the internal state-machine timeout (max) from the datashee=
t,
> would a range like usleep_range(min, max) be acceptable,
> or does scheduler wake-up latency make it too risky for
> timing-critical init sequences without hardware validation?
> I will drop this patch series.

A crucial difference is that we can call udelay() in any context, but we
cannot call usleep_range() in atomic context. Thus, a test run with
CONFIG_DEBUG_ATOMIC_SLEEP enabled is recommended.

I don't know if non-deterministic delay is an issue, the datasheet would
need to be checked. But udelay() is not deterministic either, for
example the CPU may need to handle an external interrupt while the task
is calling udelay().

Nam
