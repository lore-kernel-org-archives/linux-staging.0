Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.134.164.104
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792675842;
	b=NhN3VbIqBNZ3+an/W6DTX/kijAPu+RymRdMjdclJwJiPDsDm4UqJ5slGdFoxEY7ck0o2
	 Gac5WDj62w9p09yz1VOybxGXpkv49+XL9Ea35pttcaZCL2tvs7A4ompaZWmqJ2yaxnr5l
	 5pS3O4WyXIVkfhM5DnmLpXuQgcoJQ2nc8oW3ojsWNfr0uBDqhB3ChMOAaXF6Sobx9cKu1
	 rGxCMc2LXwI/Fn0POQzhc8gT8r10NdYWeoFrLuuuZycmu1X6FlBrKp19867wIvYQRBw26
	 ZuHUdiqo8w2cgNCEGzZraE3Demx/1AXbOcJouRWkOUrtSrQ87lqdZa79+Lp2Qcmf9Nw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792675842;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:Received:Date:From:To:cc:Subject:In-Reply-To:Message-ID:
	 References:MIME-Version:Content-Type;
	bh=XOZqn71pVavvTKy71++IgxHnK+qgoJzxDKpxvsFhUAA=;
	b=nfFPlhtqxJ5geXWj/yWUAOMIdacDs+VpdnRd70/W/u6uQTyqphFwdpe7l1r9YBZ+CMR3
	 anPivEDLvD/0M6w+Fblg0znpt71mZ3lNaCQotFUGkltm09vMgRhd95ckBx4Uasx8ogQCk
	 KOAU3IL166r8rLSvJ7yA4/FfIBCBvwxU0++DXUB7o8eAgMNVbk4I9nk68KokbAoTQR+DQ
	 gky04j/Kgjv0zZUhTzOytSG5HxPQWrgq5wAwo0ecrRQHbNhAg+KNZXQAPj++P+cgMRTH8
	 Yx+NF5UZCIF7eomFkRNtB6woUqbsqNNL3TV33QWvjTzd/FiMraQqQ2SvvFzpULjhuYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=inria.fr;
	spf=pass smtp.mailfrom=inria.fr;
	dkim=pass header.d=inria.fr header.i=@inria.fr header.a=rsa-sha256 header.s=dc header.b=XR7Cj3HA;
	arc=none smtp.remote-ip=192.134.164.104
Received: from mail3-relais-sop.national.inria.fr (mail3-relais-sop.national.inria.fr [192.134.164.104])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F753606A31D;
	Thu, 22 Oct 2026 13:30:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F753606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=inria.fr header.i=@inria.fr header.a=rsa-sha256 header.s=dc header.b=XR7Cj3HA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=XOZqn71pVavvTKy71++IgxHnK+qgoJzxDKpxvsFhUAA=;
  b=XR7Cj3HAK8igPfIosx5R71ECVpCiK7efIR18Gy2chvipCJ9Godn01JM8
   JSHUNuuRZ/SsgHAckbovG8zgVBVDnVq1nGEraaiGQdYgO5xC4k/ShWyNa
   pK/u8ldHlVmAHLlSzLA1Cb/YMIaH0wTRPD1QBocXhv+SAUAqn7vKW1eRh
   U=;
X-CSE-ConnectionGUID: IF5VVBG6Tla+ikNMG3ij/w==
X-CSE-MsgGUID: qxDlp+foRMOLqy43/enSQw==
Authentication-Results: mail3-relais-sop.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.27,172,1787004000"; 
   d="scan'208";a="160604364"
Received: from c-76-123-3-53.hsd1.va.comcast.net (HELO hadrien) ([76.123.3.53])
  by mail3-relais-sop.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2026 15:30:29 +0200
Date: Thu, 22 Oct 2026 09:30:26 -0400 (EDT)
From: Julia Lawall <julia.lawall@inria.fr>
To: Alex Elder <elder@ieee.org>
cc: pavankumaryalagada@gmail.com, greybus-dev@lists.linaro.org, 
    linux-staging@lists.linux.dev, outreachy@lists.linux.dev, johan@kernel.org, 
    elder@kernel.org, gregkh@linuxfoundation.org, vaibhav.sr@gmail.com, 
    mgreer@animalcreek.com, vireshk@kernel.org, rmfrfs@gmail.com, 
    dtwlin@gmail.com, pure.logic@nexus-software.ie, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: greybus: Replace format specifiers
In-Reply-To: <3433f922-bffb-4f1c-8e06-a7a87f5dbcaf@ieee.org>
Message-ID: <77adf02-43a9-7621-a94-9da41f8c5a56@inria.fr>
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

I was suprised the compiler doesn't complain about this.  It seems to
complain a lot about type-related format specifiers.  Yalagada maybe it
could be worth adding something clearly invalid in one of the argument
lists to see if the code is actually getting compiled, or if you need to
set some config option to make that happen.

julia

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
