Received: from mail-dy2-f41.google.com (mail-dy2-f41.google.com [74.125.229.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CD4929ACCD
	for <linux-staging@lists.linux.dev>; Thu,  1 Oct 2026 09:37:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790847471; cv=none; b=DXzSuaYs6WVDW/UYnfVVRAFG2ho9jKf1uEIFyBOMy9PaD5Swjtb/dHt03S0sULzGqgy3hUDTXD03PC1PDFucPeLTKwse3qAo5k+HR5DT98Q2civaWU2UAmZd67mgru8iGFX1s+azJwkiGJON67DGgal4GRoBNW15qK4SyAeRLP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790847471; c=relaxed/simple;
	bh=Ut64f01svE/N/t1zAIZ+diDyWjx5IMvx7i8wiDJGcN8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ObTB9+x3msLw0MHqX4uPvQgi1lMywAQGfmJExbZrTnBUgBuK+5I32rByUCprT87bxtgbOoRju+evCoL/cW2boXK8Qc1WxmLtRGXVv8ir/873cPjl/dIAHtvLATSLrUxBf8RmKBniLfDYoOFeLpf9oOuyqVzJEzNxRuHpyisv8ZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZC3GnyJG; arc=none smtp.client-ip=74.125.229.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZC3GnyJG"
Received: by mail-dy2-f41.google.com with SMTP id 5a478bee46e88-34cde269e1bso1118873eec.0
        for <linux-staging@lists.linux.dev>; Thu, 01 Oct 2026 02:37:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790847469; x=1791452269; darn=lists.linux.dev;
        h=content-type:mime-version:user-agent:message-id:date:references
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=8PMiWsf/04c7pmbSpgl+aQjw2eS+mXD0TDUKaDNGlNY=;
        b=ZC3GnyJGwoIOFVYo29j+H4QIxG1n1gdKQeRuNdRrFhGudO5No5qh9rHniM6nvHSxZr
         VoBpms78ZVf5VxXU7m9ijRTuy3xK0Bv6FEqTDFDwVpNIGFxDVV/6V70fVvPkAgH8+DSS
         XqhKoJ6JU7SNaZw7LOe8PIG//y765apSWApvVAgBx1Rc/kYwt22FYKFUzLcRi+3OTfGy
         xVjIEyh2Xlgch1eVzmHtPTCwLlbOgY8iYu/ClAuS9RKlLc2RLlVh3jJHmuPjI5wJDIZa
         Ziq+X3h9fTfjk2pRr7oUlhrUjemY/aJIdVOHJrb2mCXRVUO2Z8rCpRGvsIoD/8OFPiK6
         NTjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790847469; x=1791452269;
        h=content-type:mime-version:user-agent:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=8PMiWsf/04c7pmbSpgl+aQjw2eS+mXD0TDUKaDNGlNY=;
        b=D/OLt/5QFcxYZ2ZS7wI7zD3zj6X+6d5vd8R7j32KX53TvhBCeAjDplTWLERjSnSRG6
         W+SW6RG5NucHDOCdOq/QIejiXMBd0skAWsaswA26lyLftg8Lic1MPGmV9MOQeewvNED+
         vDzLaMu/lHnA35BL1oIF3weO1TCv34QOprZI5WNr/1kyMyn0+EYFDdo88RUPil3e2hJc
         9J/ebM+8ZAiAMvOun3kDnabTZ1q6Ed3nAfHmxxj0+gnjfZkcGF4WVZfvwNcsbsNLto6i
         1aACK0Ug68E2z/pXytYz1Up0PJSPn/L5BTshWPHpKseDtuL8SyY5VJEMb0If6siuLfdu
         MF6A==
X-Forwarded-Encrypted: i=1; AKwUvByi2NDeht8dP4vR1mvXXYpasNakwdbV5FcFfSaJ6JLM/3bx0vdNgXvL+99OFd4CenKI/534rRN1QuSQpmdt@lists.linux.dev
X-Gm-Message-State: AFq9FYKWCTAnl/yzsr8HjBQBMJ6YwlqRlSJZKIZ7MPvpgWb10JsgtOWG
	9FJ6T3VlVqnpqfHNSF0VFUAHUG8l+4tUlzwEyfhFoO0Nkfh0KI6qPU/J
X-Gm-Gg: AYBFou3C/DXTgA7ktzuISXa+/2BSR7CAU/wjGNRhLaOUMt4j2pFHg52XdhFbGEf3Yap
	z/1bSmAe2jdNqLjFW9VbD62028Z3IjTyb6bniONt8XNbIrv2lyW4E+np6qi8NuTY99Wo4h7eu+2
	LRZVhfKsQ4FUBbDWmzOQk3y+L4BAhgpNEjFMRqeNIyt16vtfAiTpPeJjbRyPZDdyLi2z6c1MXJM
	uGxW53Rq4feRUKVnpFNGnaFSL08VMu5I5EbM2A/6BZGm2FJHNLCw2ZAa5hoN5iPGfKTWTUFPZ5E
	//5hgy1uOrxijsg2U4uxGpfF8Pg1efCb/v5Cl3+QSGPKiPPZisea5RqKj/IkIR3P3eHx7Can6ez
	V6zCT+KwZ3fRzGmwML10gdsKtK8gDzZWSR9/p6aLV1vG8TZ56WNroeDYqi0A/S36pufrVHLA341
	slekBWgwCK2EY0O9VA3yubmiYk/UK1HNuA7UO0Cgj0HA3RJWTJQy1MFyzfB16YNpYwiuwAedPEn
	f7lgA==
X-Received: by 2002:a05:7300:5552:b0:33e:6bd8:8f1a with SMTP id 5a478bee46e88-34cd60fce9bmr4341822eec.0.1790847468967;
        Thu, 01 Oct 2026 02:37:48 -0700 (PDT)
Received: from fedorapc ([2405:201:4019:32fc:3c55:6b24:5147:322b])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34db3758da2sm6572857eec.15.2026.10.01.02.37.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 02:37:48 -0700 (PDT)
From: Ayush Singh <ayushsingh1325@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dan Carpenter <error27@gmail.com>,  Alex Elder <elder@ieee.org>,  Ethan
 Nelson-Moore <enelsonmoore@gmail.com>,  greybus-dev@lists.linaro.org,
  linux-staging@lists.linux.dev,  Johan Hovold <johan@kernel.org>,  Alex
 Elder <elder@kernel.org>
Subject: Re: [greybus-dev] Re: [PATCH] staging: greybus: remove camera
 driver marked as broken since 2016
In-Reply-To: <2026100102-drop-down-washcloth-ce5d@gregkh> (Greg
	Kroah-Hartman's message of "Thu, 1 Oct 2026 11:18:27 +0200")
References: <20260918011437.108678-1-enelsonmoore@gmail.com>
	<3f152ed6-e572-4c96-8762-2fb7cdc77695@ieee.org>
	<aq0x6IGnKd2IYXoU@stanley.mountain>
	<2026100102-drop-down-washcloth-ce5d@gregkh>
Date: Thu, 01 Oct 2026 15:07:43 +0530
Message-ID: <87mrsxoj6g.fsf@gmail.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Greg Kroah-Hartman <gregkh@linuxfoundation.org> writes:

> On Fri, Sep 18, 2026 at 03:43:20PM +0300, Dan Carpenter wrote:
>> On Fri, Sep 18, 2026 at 07:18:54AM -0500, Alex Elder wrote:
>> > On 9/17/26 8:14 PM, Ethan Nelson-Moore wrote:
>> > > The Greybus camera driver has been marked as BROKEN since
>> > > commit d4f56b47a8fa ("staging: greybus: Add drivers/staging/greybus to
>> > > the build"). It has not been able to compile since at least
>> > > commit ec0ad868173d ("staging: greybus: move core include files to
>> > > include/linux/greybus/") because it includes greybus_protocols.h from
>> > > its own directory. These two facts make it very clear there is no
>> > > demand for this driver. Remove it from the kernel.
>> > 
>> > Hmmm.  Do you know why it is BROKEN?  Do you know what it
>> > would take to make it work?  I understand the point of
>> > removing it, but in part the Greybus code has historically
>> > served as sample code for people to work on.  It might be
>> > nicer to have fixing it be a pet project.
>> > 
>> 
>> The compile breaks because of:
>> 
>> commit aa1b4da6af67d5c6a4e933c2d30890c6f282f505
>> Author: Boris Brezillon <bbrezillon@kernel.org>
>> Date:   Mon Nov 10 14:28:35 2014 -0300
>> 
>>     [media] v4l: Forbid usage of V4L2_MBUS_FMT definitions inside the kernel
>>     
>>     Place v4l2_mbus_pixelcode in a #ifndef __KERNEL__ section so that kernel
>>     users don't have access to these definitions.
>
> Good point, no one has picked this up since then so let's drop the
> driver and if it ever is needed in the future it can be reverted and
> brought back.

Just wanted to chime in, that there has been some work on audio and camera
protocols on the Zephyr side as part of Google Summer of Code 2026
[0]. With that said, the work never truly interacted with the kernel
driver. I would like to at some point, but I don't really have the
bandwidth at the moment. So it seems reasonable as well.

>
> thanks,
>
> greg k-h
> _______________________________________________
> greybus-dev mailing list -- greybus-dev@lists.linaro.org
> To unsubscribe send an email to greybus-dev-leave@lists.linaro.org

[0]: https://forum.beagleboard.org/t/gsoc-2026-final-report-greybus-camera-audio-protocol-implementation-in-zephyr/44315

Best Regards,
Ayush Singh
