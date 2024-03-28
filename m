Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7534212DDAB
	for <linux-staging@lists.linux.dev>; Thu, 28 Mar 2024 15:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711639815; cv=none; b=LLcaPNECCSIRfEmQMW/sAdS62ZQqDMdF1i0b35DhjHmLzAQo9FjgIxOK/vaVK7wU/Tufkay0WgKllUgoIYvRvFQM2/GKNjTNePZWiRzquUMeiQdNSGQ4JlQ/48Tep2LDVr3soUS04carDNWD6fEJ74yFINbZUGra/w4d6u8/p8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711639815; c=relaxed/simple;
	bh=eTkYEIO6xGKCBPSNNcA+qSM50wnYa53a1ulCV3EXFdo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Rf5KfuBRpAT/z7S63U3/3V/sqZAhY7Q0efHayfK0vJzINyZiu8gqzfepFT5Ia2KnGnfoJ8Nez9TP4Ox6SikXhQ9tmUnKRekJedPxvX2nTTb6Drev/buG1rd7famtY3Yfq0b9a2fNhc+ZQkAsH4BYiHt0snM7N2bE5Sug0wE5mHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=Og5tji0G; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="Og5tji0G"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1711639800; x=1712244600; i=wahrenst@gmx.net;
	bh=NUVf/ApBhxkfLH93WC9AA8Zvhmz3hoGRwYPW68JP8ew=;
	h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:
	 In-Reply-To;
	b=Og5tji0GcVg/F2ovnnKhLxd/YAWvROYS99iNABnkSqFxp+6OCVNhA0ibSzswpeh4
	 cg7yXVr7TqSE2CRCATH54og/4dF8s9WWITKLXLPDyOGAc0WCzoVbyvZTs5296ixQW
	 YwqXre4cB3UtwybPExI7Eyf2QI0OzTy+eNCAqumEJx9b/wkOTRIldTMxF3N0EzueT
	 riR1oumDF/OBAwiIwJZgIMHFRUpcWKNvk7i3UvGuNrF+eZTCwudld0BGSZAybBJuf
	 nRGaHHY3zdCWE/VwXrzqDLuHdxVZOpYftb/bSroArkv/MI1yzWixhI9AeLGHQRNIG
	 nuDa3ff8fxDhFgy+jg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.167] ([37.4.248.43]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MYvY8-1sKmbo2aGG-00Uoge; Thu, 28
 Mar 2024 16:30:00 +0100
Message-ID: <5d0708c6-a6fc-486b-b43a-09db23d6ba3b@gmx.net>
Date: Thu, 28 Mar 2024 16:29:59 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/5] staging: vc04_services: vchiq_core: Stop kthreads
 on shutdown
To: Mark Brown <broonie@kernel.org>, Umang Jain <umang.jain@ideasonboard.com>
Cc: linux-staging@lists.linux.dev, Dan Carpenter <error27@gmail.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Phil Elwell <phil@raspberrypi.com>, Greg KH <greg@kroah.com>
References: <20240321130737.898154-1-umang.jain@ideasonboard.com>
 <20240321130737.898154-6-umang.jain@ideasonboard.com>
 <80c720d9-8a9b-42c9-b5fa-fe8a33da7945@sirena.org.uk>
Content-Language: en-US
From: Stefan Wahren <wahrenst@gmx.net>
In-Reply-To: <80c720d9-8a9b-42c9-b5fa-fe8a33da7945@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:QDujG0/+hRzq/XMxXCUZgkitIwTiWZ0LSdDhZ2SHhrx6Zd63yCi
 WdMWiUg25qy6OnUZ0V/3NplyM9a3GlJWHoOsBmcNMsyHvmsZing1AGCAekbyItJFNoMrAX9
 xDqpOS7PNtBONdjyRWE/V2WsT7nJPtlcUWKprsWmZZnZ6PLkOxWKs7x69ZwV+Lti+fgndvV
 +PW12va7sn9W9Z5eSR04A==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:ak2A6gnbJM4=;c7pjNMRFeDOG6UhnEBF7d2WcOkD
 LSDrzj8/sw9vQw4mPFkdaf+yi/nZyLzWqvazL12rZ3UEUrnZvYtHMF4BQLArrhF1rtl/Zsd0C
 iY/2ikvKc8IQFeM57dh6O4tlU0o03UboRFc43Y9w/Spw/BY0Ikv6EPBWPJhw8kMSl5njEp41g
 ATlWIFUVtfkqu1117HsK9sGZ3dFahOfUAMfwKbnyi1JgISJAEgoCfLmv5+yZAOYFrd12kZSH4
 BCmWEA/8CTRlJcxR+GUbDeyyqMy3Vi9cpFk5oBh7SVoRxqm4xpLeCTFRQS2Op7mhgwtyYIOdB
 qFU/yPPW/AcxLwBerggTe+StXFXNizjwDJbM0Sqzu/C+UNLk8Z2wk4O4bQ/JvESIvTvKiQQfo
 17+zzru5TR1yECDEJddYp0WL/CAOUw0ApcyL7vRTcpSpQb2ulpynMeeaaY4uuyHpi1xwIN3Bv
 BamC0h55AEKmHlhIgEQUfR8sLe5yo5p84fXb5K7LA79okUop+arRs2EcDYhp1KY3P+Ai/G5zx
 ojjlec2FVEC+fDk2jXDcb3WfZrtuTv+MLGoAt2dDnD6KIAQ55gIIHeS9jX7kJgnXZoeSdDKWg
 IAtSJ/QkqFaZkBamks6eCnuMOxc7dHK8TafmlxmLKTzqpVKOiD7DCo+0ocoYZYOL974Q++Enz
 o9VcHVnRb+XLfF10UfrBbCIJbaQ2iHZd7hySBu5IcZs/7za0DW01Wi/guczuef/ESSBFQ1M6v
 jBOiAuGK+okCmY0mrFbmR3Zu/1X10WgTzPyibGKa6u0+KKmiWJeR3WbfL40Mj+g82wBqexvGV
 RzG6nuy5hDkFIfZvo0IFbNwzrgv4mZr94n5/BGFERiYkc=

Hi Mark,

Am 28.03.24 um 15:53 schrieb Mark Brown:
> On Thu, Mar 21, 2024 at 06:37:37PM +0530, Umang Jain wrote:
>> The various kthreads thread functions (slot_handler_func, sync_func,
>> recycle_func) in vchiq_core and vchiq_keepalive_thread_func in
>> vchiq_arm should be stopped on vchiq_shutdown().
>>
>> This also address the following TODO item:
>>   * Fix kernel module support
>>
>> hence drop it from the TODO item list.
>
> This has landed in -next as d9c60badccc183eb971e0941bb86f9475d4b9551
> and appears to be causing substantial issues on the original Raspberry
> Pi.  I'm seeing a lot of failed boots and one that worked is showing a
> bunch of faults the first of which is:
>

yes this broken patch was applied before i to tested it with Linux
6.9rc1. The bugfix is currently under review [1]

[1] -
https://lore.kernel.org/linux-staging/171161507013.3072637.121257825075239=
19379@ping.linuxembedded.co.uk/T/#m1d3de7d2fa73b2447274858353bbd4a0c3a8ba1=
4
