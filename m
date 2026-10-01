Received: from mail-dy2-f41.google.com (mail-dy2-f41.google.com [74.125.229.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA1013C0A04
	for <linux-staging@lists.linux.dev>; Thu,  1 Oct 2026 09:55:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790848555; cv=none; b=gqaFqABE5BqLT5RDeQQRvjyH14j4vyEAwcjGFDhnbMypSoILz2B1ysBm6V4wztRouy9H4l6P12Y4NcZjk8MqO00nXdYOMpxNlnWrgx1LOwPdazAI2m0rAdSi2YX6KmQxUbVaNJMXsW+xXONzN2GemIQjhYB1enQoM6NMRYcctXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790848555; c=relaxed/simple;
	bh=ulFKgvafDEhBx9+Z1P+lGL59XkkSsR5B7oO9uaKFxRQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=X13J5INLyHqs6qvKn0jFkEZYTVVNbTYCw951ouzeZPzgh0I9LbQGxu/IUl5Sd/XPKFv73mZwYFyJAid+C9Fg4jGKN+Z7jBcRsLLpP2FQf1TrKh7pdARoTGC2soBrOsLrzdqK8PwxF+SJFmEYu26DJTUoyyF70aJV2CkED6UpfDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=beagleboard.org; spf=fail smtp.mailfrom=beagleboard.org; dkim=pass (2048-bit key) header.d=beagleboard.org header.i=@beagleboard.org header.b=HzSg/pY7; arc=none smtp.client-ip=74.125.229.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=beagleboard.org header.i=@beagleboard.org header.b="HzSg/pY7"
Received: by mail-dy2-f41.google.com with SMTP id 5a478bee46e88-34bb8b31660so1654241eec.3
        for <linux-staging@lists.linux.dev>; Thu, 01 Oct 2026 02:55:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard.org; s=google; t=1790848553; x=1791453353; darn=lists.linux.dev;
        h=content-type:mime-version:user-agent:message-id:date:references
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=5Y2EWgynUCtR3AQwjgT0EJFKoafzi/jAbFdWOWz8SJ0=;
        b=HzSg/pY7At1GEP66BOnLWuTHzXEOzdC0GiK0aEIEHzgupTSPn+a0FrJacrFxndglGX
         9rdpGp92D7g21khJvm6a70ZRiBNBzxMlXUphlyNwLHR4QMXetq+wqCLSWOPCLd4NQ2ru
         5PiGurZXVyv435tR/c+ViPMtFLP/JHuybBUuPOAc0QEeQzUrrV7gCMWEIiPse4sstLsD
         tonzhBiSpJJEh2A+r96AMGXgY9Ai+jdE84f5LRLOOzeMrbRZ5JDiGo8v9JqqQL4JXyzz
         vRcHV0Ya93QWwuF+rBwF0Hwqy/j6dObt0VAeWWZ4+f5qBGZz5+bFQo48QHLhPc8Xsf6i
         8rnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790848553; x=1791453353;
        h=content-type:mime-version:user-agent:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=5Y2EWgynUCtR3AQwjgT0EJFKoafzi/jAbFdWOWz8SJ0=;
        b=AhVptY5ET3yAHS/MATQAC59PTUzehQTLfMmI92X51/1LgS7VEn+htpMiYIV5FVmB4X
         7xF8sSy21AJuAZhzbFP3BAfcrybZzPbCFvIlTxw98Yu3uMRmjMRiyddfEcKqdshNyUxY
         I4e9eyW1xAWKF8wnJLzA7ma/7TB+aTJw8S5K3j/Fdzkj0dyIfH1UjiRNl7n71Dt4YLMf
         kySIOCwM231g0xDQlPLhHNM362+NIKwTAcI3/EKe73ampgilRcE3NtLvhgoQu/Zs8P2H
         VT2c7L8FTPyuxkliq8NnRO0fx2uT9f/Ma9RqfU3yiCRBX/h36E1Ua/ODjfghZroF578Q
         aE7A==
X-Forwarded-Encrypted: i=1; AKwUvBw/Fa8njbR8iqm+0D2mzbvUhshHLNh9L4jAuRuhNsMYnvr+ypi/HxPMhegoAagQ1F3AQ4FI9Z4EoAR5MitM@lists.linux.dev
X-Gm-Message-State: AFuF++lgO1oZZ+DEsx/YPyDFJzk7Ty4ZxXxi7B7Gg+cdPOIOGsC9dtJp
	y7bf6MTGfmkMYMc7iWvN+5uhNXp6iCrsjEoOHlkPRyePd2CiVuGUmZ3e33GWa0i0BA==
X-Gm-Gg: AYBFou0lldamfABxs+3j3BJcqMDhSAjJIAWzexaHcp/muKedubfrgzUcDzzLYUDfVZI
	DyUWemONTXw54xbfyIB3hCOnyjCtplRSyytLj7afmgW9stogPEIyFFH+WD11HfqqRFBmK74bMKN
	eZIDYL8Rs4NiMzu7vPiluLfNdw0Pxg5jz1UmVBNSrAydnnC3QyG05B5AoZlF4RM3POGrj9Fqa/l
	Q/ajXGwiES11RF1Dw2ngMxs9vk41wCUxl19FpcSQfzCpQT9FOH/LepqXSUPEu9GLNW8YSkbhfPj
	8L4W3PcVCasAxO2YhiiuZKefqXmaFYR+8R6CxIYS9esGjajZ3co01/M/KxhtETJ+8X9BkZDr6it
	iT6n8NfrcKLj8ZboTgiokL6b1ls1u/cM/HyJUWkERHpWb4J8vT4UcLDG9m5vpzoqW+yE3Ixqkln
	DLJf2VEjXB0p8DyEiQHfdOW8JaNAubhcuWOi+tZN7mo6cPvDQpI28cKkY+IzSPSfghXU2FIeUg
X-Received: by 2002:a05:693c:41db:10b0:341:6552:8c3b with SMTP id 5a478bee46e88-34cdd79504bmr4084885eec.30.1790848552541;
        Thu, 01 Oct 2026 02:55:52 -0700 (PDT)
Received: from fedorapc ([2405:201:4019:32fc:3c55:6b24:5147:322b])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34db37507a7sm6166633eec.13.2026.10.01.02.55.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 02:55:50 -0700 (PDT)
From: Ayush Singh <ayush@beagleboard.org>
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
Date: Thu, 01 Oct 2026 15:25:45 +0530
Message-ID: <87zewxn3ry.fsf@beagleboard.org>
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

NOTE: recently switched mailing clients, and it replied from incorrect
account which was not in mailing list. So you might see similar email again
if it get's approved or something instead of being cancelled.

Best Regards,
Ayush Singh
