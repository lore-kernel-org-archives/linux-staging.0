Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AE4958207
	for <linux-staging@lists.linux.dev>; Thu, 21 Mar 2024 11:30:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711020623; cv=none; b=KDoL2rnn64mAQ2JepDaIVNXplDIm2NLK/GPqJZJw9ieCU6hdkws1yFMwffSVEceYv/a38q3vVFbbqu9U4rbzz9ot4ndOgHB8L9tVgAJH0WxjURiP/zrfzQ4NdZ4HKWSpN2JtVcmD/KV5782vRgph2sh3ReGdIEEuFI1cMhcBNlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711020623; c=relaxed/simple;
	bh=0rGZaiUBvGB4WdBkHKuREsZ0kTVy+v4wziin1YNKMX4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IWCPc1MBD60tlanWY7gKioDqO+eEYtMjlUmpEe+jm0IFEuUCYSLta7bOg2KWoXFcGqrI1SrpSpmEBU4jJaNrwCaHmBcVw0Bfqktx0lEW9jSeCcPa+Q8w2sWeGgksLwSwTIitv9BVBO4AUuxgFCQDeW507hwMyz8h5YsQlrz1qwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=OnCiMAeC; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="OnCiMAeC"
Received: from [192.168.1.105] (unknown [103.86.18.138])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D07577E9;
	Thu, 21 Mar 2024 12:29:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1711020591;
	bh=0rGZaiUBvGB4WdBkHKuREsZ0kTVy+v4wziin1YNKMX4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=OnCiMAeCgBxWkwMqJ5GnbQ9CQO+reY75pA8wZ4wOYpDd66V1LPS6RgSgkLJzSCIk6
	 lvFV8xpxF7/fFqaO0N7olvMI7Bi+BDBNFGCbDULy/QyRY+Ro0PV8IV211PhSSsSBcW
	 n1C8voyxp/qMiRKlIX/rzIJX6WrGmmp5kgnWyjkw=
Message-ID: <dea39969-606d-4f4d-a702-e96eb73a5270@ideasonboard.com>
Date: Thu, 21 Mar 2024 17:00:08 +0530
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] staging: vc04_services: Address module cleanup
To: Stefan Wahren <wahrenst@gmx.net>, linux-staging@lists.linux.dev
Cc: Dan Carpenter <error27@gmail.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Phil Elwell <phil@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, Greg KH <greg@kroah.com>
References: <20240315105659.111544-1-umang.jain@ideasonboard.com>
 <22dd25ed-1dae-4276-b734-b6f531fe43a3@gmx.net>
Content-Language: en-US
From: Umang Jain <umang.jain@ideasonboard.com>
In-Reply-To: <22dd25ed-1dae-4276-b734-b6f531fe43a3@gmx.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Stefan,

On 17/03/24 5:38 pm, Stefan Wahren wrote:
> Hi Umang,
>
> Am 15.03.24 um 11:56 schrieb Umang Jain:
>> The series addresses the following TODO item:
>>
>> ```
>> * Fix kernel module support
>>
>> Even the VPU firmware doesn't support a VCHI re-connect, the driver
>> should properly handle a module unload. This also includes that all
>> resources must be freed (kthreads, debugfs entries, ...) and global
>> variables avoided.
>> ```
>>
>> Patch 1/5 to 3/5 are log cleanups spotted during the reading of the
>> driver.
>>
>> Patch 4/5 implements .remove() function vptr so that individual
>> devices(bcm2835-audio, bcm2835-camera, bcm2835-isp etc.)
>> can run their cleanup when removed from the vchiq_bus, during their
>> own module unload.
>>
>> Patch 5/5 stops the kthreads started by vchiq - on shutdown path.
>>
>> Rest of the module cleanup (debugfs entries, deregister char device
>> etc.) is already done as part of vchiq_remove().
>
> great work!

:-)
>
>>
>> Testing on RPi4 for vchiq module unload:
>>
>> ```
>> uajain@ATX:~$ uname -r
>> 6.8.0-rc1-00128-gab2b09f632fa-dirty
>> uajain@ATX:~$ dmesg | grep vchiq
>> [   21.401426] vchiq: module is from the staging directory, the 
>> quality is unknown, you have been warned.
>> uajain@ATX:~$ sudo modprobe bcm2835_mmal_vchiq
>> sudo: unable to resolve host ATX: Temporary failure in name resolution
>> uajain@ATX:~$ dmesg | grep vchiq
>> [   21.401426] vchiq: module is from the staging directory, the 
>> quality is unknown, you have been warned.
>> [   96.388148] bcm2835_mmal_vchiq: module is from the staging 
>> directory, the quality is unknown, you have been warned.
>> uajain@ATX:~$ lsmod | grep vchiq
>> bcm2835_mmal_vchiq     40960  0
>> vchiq                 581632  1 bcm2835_mmal_vchiq
>> uajain@ATX:~$ sudo rmmod bcm2835_mmal_vchiq vchiq
>> sudo: unable to resolve host ATX: Temporary failure in name resolution
>> uajain@ATX:~$ lsmod | grep vchiq
>> uajain@ATX:~$ dmesg | grep vchiq
>> [   21.401426] vchiq: module is from the staging directory, the 
>> quality is unknown, you have been warned.
>> [   96.388148] bcm2835_mmal_vchiq: module is from the staging 
>> directory, the quality is unknown, you have been warned.
>> uajain@ATX:~$
>
> What happens if you run "sudo modprobe bcm2835_mmal_vchiq" again?

Just seeing this right now - at bottom of the mail thread.

So trying to re-load the module fails :

[  207.665281] bcm2835_vchiq fe00b840.mailbox: failed to set channelbase 
(response: ffffffff)
[  207.674245] bcm2835_vchiq fe00b840.mailbox: arm: Could not initialize 
vchiq platform
[  223.527580] bcm2835_mmal_vchiq: module is from the staging directory, 
the quality is unknown, you.
[  223.539469] bcm2835_mmal_vchiq: unknown parameter 'vchiq' ignored

which is known as vchiq doesn't support re-connect.

