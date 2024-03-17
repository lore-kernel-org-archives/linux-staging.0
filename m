Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76DF1175BE
	for <linux-staging@lists.linux.dev>; Sun, 17 Mar 2024 12:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710677302; cv=none; b=V8ipWiSAF/DopSl5m54c4y1AAxv6sHdGG65z3x9sbXEVyituIVCnLiquTR+bvHDbgkVjumPg3h+XYGjOymTYhoXjIFbJjIcTtzIPefzrQpM5fTWXxlgsVGOGTZoNPBlYO+vjqvmBSfRn5dexOJsz8SLNKGgAmnDloO2Z+npKLfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710677302; c=relaxed/simple;
	bh=zH9edj1akvXemqQylv/QNJGaBt+lIfHgL9aORJBkO8s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MJ1y9HVrFagvjFc4XxYu59mtBA2q+rpbKcIuqkPeBkl9qhnu0nXSaHZfGwuth0gi+QfclAsMcNeZcD0Vyy4p6UpKGAV3YZ+kR4mjVxJH70kTFqClJKYJ+lwSlm5vOCMI30H+Og4b+d7QJyhgS0LltyrFVx+3u0/aN+QlpXrdTxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=KMGHSLJn; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="KMGHSLJn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1710677292; x=1711282092; i=wahrenst@gmx.net;
	bh=ydh318if9iyE1+DoFarROpfEj18AMDDcYOSldugHhhk=;
	h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:
	 In-Reply-To;
	b=KMGHSLJnHfqycP/+TCtvYiiikobaa7kackpfqwLWqbFd7W2LQu77adjBjkbuO+l0
	 9ddCLT1sf/f9CfvhjSJkqQCNeYBAue5iSTsdJ4DVPpjIbUwjhWazRtqovNHxvr1Uu
	 UAERmNeyXlgNTOyP/QM/yGlpNrfOZCxbylW0PSpgEIgIWdMXU+lDaDKllgSlsTWMB
	 0KSBQnuYP/m9M6Zj+baBb0syk/D7qlvl81PgcUemS5xFj9cCfxGEdILnOGpNtGxJ8
	 H57VdaycpeS+715kTu377EIb+txYda3/JI5RHxIU0H9BrpigvIkeg9JT/8gMmsZs2
	 E7bt9T6D3RKAwPJX6w==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.167] ([37.4.248.43]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MI5UN-1rXGZv2fNH-00FCcm; Sun, 17
 Mar 2024 13:08:12 +0100
Message-ID: <22dd25ed-1dae-4276-b734-b6f531fe43a3@gmx.net>
Date: Sun, 17 Mar 2024 13:08:11 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] staging: vc04_services: Address module cleanup
To: Umang Jain <umang.jain@ideasonboard.com>, linux-staging@lists.linux.dev
Cc: Dan Carpenter <error27@gmail.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Phil Elwell <phil@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, Greg KH <greg@kroah.com>
References: <20240315105659.111544-1-umang.jain@ideasonboard.com>
Content-Language: en-US
From: Stefan Wahren <wahrenst@gmx.net>
In-Reply-To: <20240315105659.111544-1-umang.jain@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:lfwlprobhpVC8JomaXl8V0ApPzFmJru7GCuktU0/s97t5eEUMmH
 D5QXcoOCc3lIhOqkoxdvyVr2nNsFRuyGqUAQ0KmrzREmQTZM7iSa1dUYrtusKfMNGNYANIh
 AL9Qx4mOqpVzNTl8N5+yodhUBeFPOKdFOqJECGD3R7kS7byQRDXHqpNRJgDxe0f1fyrUV+v
 ZE6APTPg0ANGPVUE9povw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:OiVgNR4GXTA=;jEIN3jQ1eXM9OSIOoadi9DMPynM
 kusQHlAU6Sn2kwNzKQVK8iN3uT522K/1kUjwHqT14dttQrXh+Lkhh6J2E+mse+t0Wiq6FDASX
 3eAFEavlmCQXyixkn6+px6p8gKGDkJsutCvQf6Ya36G+hLL/UIB1z4j0bc4k7vL4ZjVmgjrEP
 59o9uUL8I9fYpGLoBUr15/iLTNhKqom64LLvZ7p5ydbSX3W1XckG6WMGP1gjN6hSf01MSxOc9
 kQ1tZaz23yvMLM9qvklp9jO6vncDN9W0xuB+gJGqaAcpAr+03wEJsZAfQqgcPEnEGI0TOIWvN
 co9CLUiHGAdO91g10ZkMaPtNUQpLa5kiSgT4SDGn6I8/kt5BJ8ZVtXdJLwWkm2IAue6NkHE4T
 GNLrxWCpJUm89CruW/OEoTmrgb9NNDhJdLhJI+Emv8OE1O47mArwiFNQrd6LZqw2sL+Lil1ua
 Xgcb1vp/TH7/4wdIe9W/zPLfGmleaxSl2TALL5RQyb8Z2hdOSL9wVngAgLWqQ3/naFvtPpXB2
 MdMOKYpJRAjZSC/x/ptf9hX6FLp1mH8SYIkVhBl0d76FdQPMB+3y7CQ47jLw2c7dg5jVgGo0K
 cpqGjOmb6xFhsjQSiK40/CT18paOioYfCtECUb8o0UhzNQJs2LflHnr3xOrVPySkddbI5E4Yj
 3csQ2o5mAP4NqpLN+0Cq3vNieBkWPI+CEflCg0p9gMfR6YR0a51iwciT4+K5RU9IpWgsNL+4m
 Mhy+wHtcp8WJmQWkcaKjAwNmZO/tZE7FiJWSa5/ravIfUgk4Pccye3/w4ajjyiTi0QGzuZ8ha
 XGQaJl6DGck9c90bHJVrZjDowv9dqxMz+VEeXM6SooQXc=

Hi Umang,

Am 15.03.24 um 11:56 schrieb Umang Jain:
> The series addresses the following TODO item:
>
> ```
> * Fix kernel module support
>
> Even the VPU firmware doesn't support a VCHI re-connect, the driver
> should properly handle a module unload. This also includes that all
> resources must be freed (kthreads, debugfs entries, ...) and global
> variables avoided.
> ```
>
> Patch 1/5 to 3/5 are log cleanups spotted during the reading of the
> driver.
>
> Patch 4/5 implements .remove() function vptr so that individual
> devices(bcm2835-audio, bcm2835-camera, bcm2835-isp etc.)
> can run their cleanup when removed from the vchiq_bus, during their
> own module unload.
>
> Patch 5/5 stops the kthreads started by vchiq - on shutdown path.
>
> Rest of the module cleanup (debugfs entries, deregister char device
> etc.) is already done as part of vchiq_remove().

great work!

>
> Testing on RPi4 for vchiq module unload:
>
> ```
> uajain@ATX:~$ uname -r
> 6.8.0-rc1-00128-gab2b09f632fa-dirty
> uajain@ATX:~$ dmesg | grep vchiq
> [   21.401426] vchiq: module is from the staging directory, the quality =
is unknown, you have been warned.
> uajain@ATX:~$ sudo modprobe bcm2835_mmal_vchiq
> sudo: unable to resolve host ATX: Temporary failure in name resolution
> uajain@ATX:~$ dmesg | grep vchiq
> [   21.401426] vchiq: module is from the staging directory, the quality =
is unknown, you have been warned.
> [   96.388148] bcm2835_mmal_vchiq: module is from the staging directory,=
 the quality is unknown, you have been warned.
> uajain@ATX:~$ lsmod | grep vchiq
> bcm2835_mmal_vchiq     40960  0
> vchiq                 581632  1 bcm2835_mmal_vchiq
> uajain@ATX:~$ sudo rmmod bcm2835_mmal_vchiq vchiq
> sudo: unable to resolve host ATX: Temporary failure in name resolution
> uajain@ATX:~$ lsmod | grep vchiq
> uajain@ATX:~$ dmesg | grep vchiq
> [   21.401426] vchiq: module is from the staging directory, the quality =
is unknown, you have been warned.
> [   96.388148] bcm2835_mmal_vchiq: module is from the staging directory,=
 the quality is unknown, you have been warned.
> uajain@ATX:~$

What happens if you run "sudo modprobe bcm2835_mmal_vchiq" again?
