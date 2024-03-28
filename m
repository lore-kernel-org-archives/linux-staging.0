Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 659AC210EC
	for <linux-staging@lists.linux.dev>; Thu, 28 Mar 2024 16:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711644842; cv=none; b=PUhrieoenlmpqqKDKowMg4M5BOVldmRCvWGTUPSalpSgeBAFS7S6HsXHPCWsJkOugqJxrYyxdIse+8/b4Vr4L7RrO+Z970O7G1/cB4j6CFhmsqoMYzJ6H9UAH+bnYIHnYeVyvSMmJWxvGUPTCRh0WjrsuB79Co9Jh853A/DxC5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711644842; c=relaxed/simple;
	bh=hO1iuxTqTWGCw5H56EkrE1NMrT/pIBckIvujdlXuO0s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hNFa937jleWEcNPeZBM1AGxclJIRUdIMDYgYo1d8FKo5uuLK9uOsBio63GjzlvcbvZ2blz6uipefNRUhZ6LuGG3KpJtZcGPZfngZjLefVKRuzqceTN7LgAeQWa+OTpuzDJHrrwRhy8mR3foAnwvG/NYnqBVCon/r3QQQQ+8cJ1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=vkDt3Ajj; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="vkDt3Ajj"
Received: from [192.168.1.105] (unknown [103.251.226.73])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id BC3A5D20;
	Thu, 28 Mar 2024 17:53:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1711644805;
	bh=hO1iuxTqTWGCw5H56EkrE1NMrT/pIBckIvujdlXuO0s=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=vkDt3Ajj2q6VAzcuVMFJHszCL8rjZUq+aQ6ujz68CcTvv5IEnx6pvD4judGrjD4Ga
	 oex+PpLLAadtFU/L5JP4HWl3UoNpHk93vDOG4HeZeMCHqmkDz2NAiRIdd37SajL3KC
	 pff1q2ByWKOwYy6tEmPR+Vdaa/p2pKj57jeBcOb4=
Message-ID: <2f02e574-dc47-429a-9e2f-fd439684866f@ideasonboard.com>
Date: Thu, 28 Mar 2024 22:23:42 +0530
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] staging: vc04_services: Stop kthreads on .remove
Content-Language: en-US
To: Stefan Wahren <wahrenst@gmx.net>, linux-staging@lists.linux.dev
Cc: Stefan Wahren <stefan.wahren@i2se.com>, Dan Carpenter
 <error27@gmail.com>, Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Phil Elwell <phil@raspberrypi.com>, Greg KH <greg@kroah.com>,
 Mark Brown <broonie@kernel.org>
References: <20240328051615.618908-1-umang.jain@ideasonboard.com>
 <21465844-c2dd-4c6f-bc9b-fbe102fbdcc1@gmx.net>
From: Umang Jain <umang.jain@ideasonboard.com>
In-Reply-To: <21465844-c2dd-4c6f-bc9b-fbe102fbdcc1@gmx.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 28/03/24 10:19 pm, Stefan Wahren wrote:
> Hi Umang,
>
> Am 28.03.24 um 06:16 schrieb Umang Jain:
>> It turns out that stopping kthreads on vchiq_shutdown_internal()
>> corrupts the vchiq firmware during probe.
>>
>> [   11.005324] bcm2835_vchiq 3f00b840.mailbox: sync: error: 0: sf 
>> unexpected msgid 0@b18db30a,0
>>
>> Since the kthreads are created during vchiq_probe(), symmetrically
>> they should be stopped on vchiq_remove().
>>
>> Also, vchiq_shutdown_internal() is called by vchiq_shutdown() which
>> is a exported function. Hence, modules can take indirectly shut the
>> vchiq interface by stopping the kthreads.
>>
>> Fix it by stopping the kthreads in .remove instead.
>>
>> Fixes: d9c60badccc1 ("staging: vc04_services: vchiq_core: Stop 
>> kthreads on shutdown")
>> Reported-by: Stefan Wahren <wahrenst@gmx.net>
>> Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
>> ---
>>
>> Reproduced on rpi-3-b 32-bit kernel with multi_v7_defconfig and all
>> vchiq configs options. Patch seems to fix the error mentioned in the
>> commit message.
> i tested the patch on my Raspberry Pi 3B+ with multi_v7_defconfig and
>
> CONFIG_BCM_VIDEOCORE=y
> CONFIG_BCM2835_VCHIQ=m
> CONFIG_VCHIQ_CDEV=y
>
> Now X came up, but if i run
>
> modprobe -r vchiq
>
> but i'm still getting
>
> [  146.730014] bcm2835_vchiq 3f00b840.mailbox: sync: error: 0: sf
> unexpected msgid 0@10b01b8d,0
>
> so it seems to me stopping those kthreads isn't that trivial (which i
> never expected). Maybe we need to care about the order or an even more
> complex synchronization mechanism between VideoCore firmware and the
> kthreads.

Dave, Phil - would you happen to have any opinions on this behavior ?
>
> I won't have the time for further investigations during the eastern
> holidays. Maybe we should revert d9c60badccc1 and take the necessary
> time for proper testing.
>
> Best regards

