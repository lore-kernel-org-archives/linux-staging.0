Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.134.164.104
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792676759;
	b=UZkZrdekch4Wpsntq08qfT0OnMiEBQoacAl5oKfbKMJNyyxEScgpV5lkoxvXuaZ+ptjM
	 50vc7hgiHL9NJSBk8oLc0FirhD5M4Om8u/gxfFd9/BdvDYtqvmMb0diZ70aWcgJ0Nsupc
	 PECvlsGMCTbqKQ/wX1KoSfe84AfkIRZBJ8Y1eTN/YigDecPhRl8fJSe05r0TqbjuUiZkJ
	 f5KaJ5MCa67u8x1x8MbvYvPOW0N6qyJH35wEUzCKVIebIR561rulK6QZBKzrQS/Ep3H7E
	 tWBHf/3Il2NvbU9DwVv64bvfDJyDdMeCjpvT0SneU3PNG0Qza36ewnyKcm6UhbjG3xQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792676759;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:Received:Date:From:To:cc:Subject:In-Reply-To:Message-ID:
	 References:MIME-Version:Content-Type;
	bh=pYCXYRMYM3w50/3+sv6Tzrn/zeXy4fAad/KXHO/jW5I=;
	b=wS50pOuWKH7HnuvdwP98pns5EcpdGu0uGDtt1ikXSzHObageci8B7nZBAzX/vvqcLOyw
	 2WwO208N5GJ4K7yb/ne9LZI4wXh13jFhIS5HdQ5Mni+TYnYR9HCX06T6IpbFYmpUfqRkv
	 5s6MK0SXUNkWpGkt16XxSOir4EWn5e4YydeqKezrDvijkD33u53MNsT+apRenSN2xPILB
	 wubhpwQlnHJuXbfbwSgiTWxwqN+mUp4hlclmsn/jd1TE2NweWcNLIpCvKPvJ85uelh+Lr
	 RI6taN4U9VSJEa65AMDvMB85UIkd4UdpuWxxcqDQjeR9ThpwiDusuzERusQj5EgJAew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=inria.fr;
	spf=pass smtp.mailfrom=inria.fr;
	dkim=pass header.d=inria.fr header.i=@inria.fr header.a=rsa-sha256 header.s=dc header.b=S3VvHWEF;
	arc=none smtp.remote-ip=192.134.164.104
Received: from mail3-relais-sop.national.inria.fr (mail3-relais-sop.national.inria.fr [192.134.164.104])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58C8A60A6F72;
	Thu, 22 Oct 2026 13:45:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 58C8A60A6F72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=inria.fr header.i=@inria.fr header.a=rsa-sha256 header.s=dc header.b=S3VvHWEF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=pYCXYRMYM3w50/3+sv6Tzrn/zeXy4fAad/KXHO/jW5I=;
  b=S3VvHWEFbQ4JHO71UZiuZc2mtcDnN8EolGxtDlVfUVekcCAmGO1j8gBh
   Flxhld7Q8L7ug4fae6xqgfL/KHU+1JcrQ3pBDMuLdoVmQ2ONQVfIzDNTY
   RMQ2MS1E6JJmXeBQqUn7CUmh2qwTEuG/Tn0Mq7pXnIEeM2thO8LXM1c/9
   E=;
X-CSE-ConnectionGUID: kxJgW2CDRPiiIeEGms4YgA==
X-CSE-MsgGUID: tBF8NsKiQbSWuYgpbOvpSQ==
Authentication-Results: mail3-relais-sop.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.27,172,1787004000"; 
   d="scan'208";a="160606352"
Received: from c-76-123-3-53.hsd1.va.comcast.net (HELO hadrien) ([76.123.3.53])
  by mail3-relais-sop.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2026 15:45:53 +0200
Date: Thu, 22 Oct 2026 09:45:51 -0400 (EDT)
From: Julia Lawall <julia.lawall@inria.fr>
To: Alex Elder <elder@ieee.org>
cc: pavankumaryalagada@gmail.com, greybus-dev@lists.linaro.org, 
    linux-staging@lists.linux.dev, outreachy@lists.linux.dev, johan@kernel.org, 
    elder@kernel.org, gregkh@linuxfoundation.org, vaibhav.sr@gmail.com, 
    mgreer@animalcreek.com, vireshk@kernel.org, rmfrfs@gmail.com, 
    dtwlin@gmail.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: greybus: Replace format specifiers
In-Reply-To: <4c393ce3-41ae-4f4e-9af0-4eb7cf1c425a@ieee.org>
Message-ID: <6b5a87f-3ca-ddc4-1ea8-f3ee7f45d83@inria.fr>
References: <20261021163437.280930-1-pavankumaryalagada@gmail.com> <3433f922-bffb-4f1c-8e06-a7a87f5dbcaf@ieee.org> <d0a4a257-1ec9-7096-11db-5ff4b3244bac@inria.fr> <4c393ce3-41ae-4f4e-9af0-4eb7cf1c425a@ieee.org>
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

> On 10/22/26 8:35 AM, Julia Lawall wrote:
> > Does anyone on the greybus list know anything about this person:
> >
> > Bryan O'Donoghue <pure.logic@nexus-software.ie>
> >
> > The email address is not valid, which is somewhat tiresome...
>
> Bryan was on the Greybus kernel team.  Remove that address from
> the list.  I'll let him know that e-mail is bouncing so he can
> add himself back.

Actually, the email comes from the MAINTAINERS file.

julia

>
> 					-Alex
>
> >
> > julia
> >
> >
> >
> > On Thu, 22 Oct 2026, Alex Elder wrote:
> >
> > > On 10/21/26 11:34 AM, pavankumaryalagada@gmail.com wrote:
> > > > From: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>
> > > >
> > > > Unsigned variables are printed using %d.
> > > > Replace them with %u to match their types.
> > > >
> > > > Signed-off-by: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>
> > >
> > > I have reviewed every one of these and they look good.  Quite a few
> > > of them--because the size of the value being formatted is less than
> > > 32 bits--would print correctly no matter what their value.  But I
> > > think it at least does no harm to convert the format specifier to
> > > unsigned in all of these cases.
> > >
> > > I have highlighted below an existing bug that should be fixed.  It
> > > gives an example of something to look for when you do this sort of
> > > activity.  Please arrange to get that bug fixed.
> > >
> > > I also pointed out one other observation for you to think about.
> > >
> > > Thanks for sending this.  I didn't check to find any other instances
> > > you might have missed, but you seem to have found quite a few.
> > >
> > > Reviewed-by: Alex Elder <elder@riscstar.com>
> > >
> > > > ---
> > > >    drivers/staging/greybus/audio_codec.c    | 20 ++++++++--------
> > > >    drivers/staging/greybus/audio_topology.c | 30
> > > > ++++++++++++------------
> > > >    drivers/staging/greybus/bootrom.c        |  2 +-
> > > >    drivers/staging/greybus/fw-download.c    |  2 +-
> > > >    drivers/staging/greybus/fw-management.c  |  2 +-
> > > >    drivers/staging/greybus/gpio.c           |  2 +-
> > > >    drivers/staging/greybus/light.c          |  2 +-
> > > >    drivers/staging/greybus/log.c            |  4 ++--
> > > >    drivers/staging/greybus/loopback.c       |  4 ++--
> > > >    drivers/staging/greybus/power_supply.c   |  2 +-
> > > >    drivers/staging/greybus/raw.c            |  2 +-
> > > >    drivers/staging/greybus/sdio.c           |  4 ++--
> > > >    drivers/staging/greybus/spilib.c         |  2 +-
> > > >    drivers/staging/greybus/uart.c           |  4 ++--
> > > >    14 files changed, 41 insertions(+), 41 deletions(-)
> > > >
> > >
> > > . . .
> > >
> > > > diff --git a/drivers/staging/greybus/bootrom.c
> > > > b/drivers/staging/greybus/bootrom.c
> > > > index 83921d90c322..fb1fbd3f7b99 100644
> > > > --- a/drivers/staging/greybus/bootrom.c
> > > > +++ b/drivers/staging/greybus/bootrom.c
> > > > @@ -222,7 +222,7 @@ static int gb_bootrom_firmware_size_request(struct
> > > > gb_operation *op)
> > > >    	size_response = op->response->payload;
> > > >    	size_response->size = cpu_to_le32(bootrom->fw->size);
> > > >    -	dev_dbg(dev, "%s: firmware size %d bytes\n",
> > > > +	dev_dbg(dev, "%s: firmware size %u bytes\n",
> > > >    		__func__, size_response->size);
> > >
> > > This line actually contains an error (and it was there before).
> > >
> > > The type of gb_bootrom_firmware_size_response->size is __le32.
> > > So the value being formatted needs to be converted into CPU
> > > byte order before being used.  That could be done this way:
> > > 	le32_to_cpu(size_response->size)
> > > or just use this, which is known from a few lines above to
> > > have the proper value and byte order:
> > > 	bootrom->fw->size
> > >
> > > Please add this to your list of things to fix, and submit it
> > > as a separate patch.  This would be a bug fix, which would
> > > also give you a little bit of a new experience.
> > >
> > > >      unlock:
> > >
> > > . . .
> > >
> > > > diff --git a/drivers/staging/greybus/raw.c
> > > > b/drivers/staging/greybus/raw.c
> > > > index 4f1b3f4db404..2314496a858a 100644
> > > > --- a/drivers/staging/greybus/raw.c
> > > > +++ b/drivers/staging/greybus/raw.c
> > > > @@ -112,7 +112,7 @@ static int gb_raw_request_handler(struct
> > > > gb_operation
> > > > *op)
> > > >    	receive = op->request->payload;
> > > >    	len = le32_to_cpu(receive->len);
> > > >    	if (len != (int)(op->request->payload_size - sizeof(__le32)))
> > > > {
> > > > -		dev_err(dev, "raw receive request wrong size %d vs %d\n", len,
> > > > +		dev_err(dev, "raw receive request wrong size %u vs %d\n", len,
> > > >    			(int)(op->request->payload_size -
> > > > sizeof(__le32)));
> > >
> > > The above size calculation was done somewhere else without the
> > > (int) cast, and the format specifier was %zu in that case.
> > > I don't think this needs to be changed necessarily, but it's
> > > something inconsistent across the Greybus code.  Consistency
> > > helps readability and maintainability.
> > >   >   		return -EINVAL;
> > > >    	}
> > >
> > > . . .
> > >
> > >
>
>
