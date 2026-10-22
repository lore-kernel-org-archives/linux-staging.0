Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.134.164.83
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792676129;
	b=YlSEcCIbtYlPvp8TdS9jllUHJjuCfDYBiHQ5jZjZrm5ZcCZKs0n4U90QFUf4aCAgGdqL
	 a8O06vrnqYxESNk/7GjPbP6/1K1S/dv4RoJIzdUu6MU9Y6RQE2wjPXKfM9uGQYi/KvxLG
	 3hKTnQA/40uFIPZlj6efEU4zjCnXz/8DJzXAHepfyaL+2zFgxzampjGINr9e6dpyzLQKm
	 8YLTNyyVss9i5p2ZQpqO2tkN3brl2e+NpE3bq8s7oTQPRFpRwticKSXAu/jXJAAP44dOZ
	 pZ3BVZhO7/wN210ZYMoC2NgxJgbPiO9xBw7H8mtzkV4l1zJGY/Cd2AnQoN+UMMpU+sA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792676129;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:Received:Date:From:To:cc:Subject:In-Reply-To:Message-ID:
	 References:MIME-Version:Content-Type;
	bh=b+enJ4/aTvt+mAJ0vWs0JTWM5U1pomDLS1TrQR3CHRI=;
	b=5C6whyYRWa0wAg4XMEbGNkgKC2970YGIi5IF+xkFuz1W786RvVV0x8zdiUoqSGQuB2Fq
	 s0r/QV1fI2wrsvREyRvQOA5S+H5cNLaNU+V+5t2tkh/9xEFaKZDy02tbcYXV3YcFQRn+K
	 qXCm4op9P68mf+0PDVQVCpaP4mPzHLFpya55t5V4A2Mpfqy0welkQIOgXSZPb6MAONrQ2
	 F7+EbL3usTtifNDHGfyJR8T+mzEHh4J/629y05cAjgIa6QgRpNge/mXR0D2Z1nPaWJ347
	 a6VCJH73MbSLe/Oof80kjT0VKjV80UM6nnFKkkvkyafxBghyX08E2jCzdQK+2KtOomw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=inria.fr;
	spf=pass smtp.mailfrom=inria.fr;
	dkim=pass header.d=inria.fr header.i=@inria.fr header.a=rsa-sha256 header.s=dc header.b=iffJxoHF;
	arc=none smtp.remote-ip=192.134.164.83
Received: from mail2-relais-roc.national.inria.fr (mail2-relais-roc.national.inria.fr [192.134.164.83])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BAD6606A319;
	Thu, 22 Oct 2026 13:35:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7BAD6606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=inria.fr header.i=@inria.fr header.a=rsa-sha256 header.s=dc header.b=iffJxoHF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=b+enJ4/aTvt+mAJ0vWs0JTWM5U1pomDLS1TrQR3CHRI=;
  b=iffJxoHFxGvZuWZN6vwT4LR4zpOSZhu2/heHml/4tNZAyprN+mK4NyzV
   SlvmNvy6GWDxKefeaXvFzT6Nmocj8Zko+EiCxqTkoJcd8KfOeq47nKSup
   X/ly9rw3u8Tl6tVnPLY8mK7AvBZ7z1KsqyGbkXc8TwHF9LTWYFb4grFX7
   Q=;
X-CSE-ConnectionGUID: HcacyPO+T0uagYMzpd4VAw==
X-CSE-MsgGUID: aiW8raj1ROOd7cMTYQJdGg==
Authentication-Results: mail2-relais-roc.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.27,172,1787004000"; 
   d="scan'208";a="301890556"
Received: from c-76-123-3-53.hsd1.va.comcast.net (HELO hadrien) ([76.123.3.53])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2026 15:35:17 +0200
Date: Thu, 22 Oct 2026 09:35:16 -0400 (EDT)
From: Julia Lawall <julia.lawall@inria.fr>
To: Alex Elder <elder@ieee.org>
cc: pavankumaryalagada@gmail.com, greybus-dev@lists.linaro.org, 
    linux-staging@lists.linux.dev, outreachy@lists.linux.dev, johan@kernel.org, 
    elder@kernel.org, gregkh@linuxfoundation.org, vaibhav.sr@gmail.com, 
    mgreer@animalcreek.com, vireshk@kernel.org, rmfrfs@gmail.com, 
    dtwlin@gmail.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: greybus: Replace format specifiers
In-Reply-To: <3433f922-bffb-4f1c-8e06-a7a87f5dbcaf@ieee.org>
Message-ID: <d0a4a257-1ec9-7096-11db-5ff4b3244bac@inria.fr>
References: <20261021163437.280930-1-pavankumaryalagada@gmail.com> <3433f922-bffb-4f1c-8e06-a7a87f5dbcaf@ieee.org>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Does anyone on the greybus list know anything about this person:

Bryan O'Donoghue <pure.logic@nexus-software.ie>

The email address is not valid, which is somewhat tiresome...

julia



On Thu, 22 Oct 2026, Alex Elder wrote:

> On 10/21/26 11:34 AM, pavankumaryalagada@gmail.com wrote:
> > From: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>
> >
> > Unsigned variables are printed using %d.
> > Replace them with %u to match their types.
> >
> > Signed-off-by: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>
>
> I have reviewed every one of these and they look good.  Quite a few
> of them--because the size of the value being formatted is less than
> 32 bits--would print correctly no matter what their value.  But I
> think it at least does no harm to convert the format specifier to
> unsigned in all of these cases.
>
> I have highlighted below an existing bug that should be fixed.  It
> gives an example of something to look for when you do this sort of
> activity.  Please arrange to get that bug fixed.
>
> I also pointed out one other observation for you to think about.
>
> Thanks for sending this.  I didn't check to find any other instances
> you might have missed, but you seem to have found quite a few.
>
> Reviewed-by: Alex Elder <elder@riscstar.com>
>
> > ---
> >   drivers/staging/greybus/audio_codec.c    | 20 ++++++++--------
> >   drivers/staging/greybus/audio_topology.c | 30 ++++++++++++------------
> >   drivers/staging/greybus/bootrom.c        |  2 +-
> >   drivers/staging/greybus/fw-download.c    |  2 +-
> >   drivers/staging/greybus/fw-management.c  |  2 +-
> >   drivers/staging/greybus/gpio.c           |  2 +-
> >   drivers/staging/greybus/light.c          |  2 +-
> >   drivers/staging/greybus/log.c            |  4 ++--
> >   drivers/staging/greybus/loopback.c       |  4 ++--
> >   drivers/staging/greybus/power_supply.c   |  2 +-
> >   drivers/staging/greybus/raw.c            |  2 +-
> >   drivers/staging/greybus/sdio.c           |  4 ++--
> >   drivers/staging/greybus/spilib.c         |  2 +-
> >   drivers/staging/greybus/uart.c           |  4 ++--
> >   14 files changed, 41 insertions(+), 41 deletions(-)
> >
>
> . . .
>
> > diff --git a/drivers/staging/greybus/bootrom.c
> > b/drivers/staging/greybus/bootrom.c
> > index 83921d90c322..fb1fbd3f7b99 100644
> > --- a/drivers/staging/greybus/bootrom.c
> > +++ b/drivers/staging/greybus/bootrom.c
> > @@ -222,7 +222,7 @@ static int gb_bootrom_firmware_size_request(struct
> > gb_operation *op)
> >   	size_response = op->response->payload;
> >   	size_response->size = cpu_to_le32(bootrom->fw->size);
> >   -	dev_dbg(dev, "%s: firmware size %d bytes\n",
> > +	dev_dbg(dev, "%s: firmware size %u bytes\n",
> >   		__func__, size_response->size);
>
> This line actually contains an error (and it was there before).
>
> The type of gb_bootrom_firmware_size_response->size is __le32.
> So the value being formatted needs to be converted into CPU
> byte order before being used.  That could be done this way:
> 	le32_to_cpu(size_response->size)
> or just use this, which is known from a few lines above to
> have the proper value and byte order:
> 	bootrom->fw->size
>
> Please add this to your list of things to fix, and submit it
> as a separate patch.  This would be a bug fix, which would
> also give you a little bit of a new experience.
>
> >     unlock:
>
> . . .
>
> > diff --git a/drivers/staging/greybus/raw.c b/drivers/staging/greybus/raw.c
> > index 4f1b3f4db404..2314496a858a 100644
> > --- a/drivers/staging/greybus/raw.c
> > +++ b/drivers/staging/greybus/raw.c
> > @@ -112,7 +112,7 @@ static int gb_raw_request_handler(struct gb_operation
> > *op)
> >   	receive = op->request->payload;
> >   	len = le32_to_cpu(receive->len);
> >   	if (len != (int)(op->request->payload_size - sizeof(__le32))) {
> > -		dev_err(dev, "raw receive request wrong size %d vs %d\n", len,
> > +		dev_err(dev, "raw receive request wrong size %u vs %d\n", len,
> >   			(int)(op->request->payload_size - sizeof(__le32)));
>
> The above size calculation was done somewhere else without the
> (int) cast, and the format specifier was %zu in that case.
> I don't think this needs to be changed necessarily, but it's
> something inconsistent across the Greybus code.  Consistency
> helps readability and maintainability.
>  >   		return -EINVAL;
> >   	}
>
> . . .
>
>
