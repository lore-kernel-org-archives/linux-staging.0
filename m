Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 754CA3BBC1
	for <linux-staging@lists.linux.dev>; Thu, 28 Mar 2024 16:49:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711644579; cv=none; b=EhaOm6MHqrEIxInrAwNonHWSHN+mxoozGJh1Cp/u+jsQLzSU0T4sHgPO6mcosLWIQn/VXfuKmDkgbpdTL9uiXH4Hoim7JVQ29JKdj06l/CFtr0bTeUU3L7cGZ/jsyBym01UazEywF5UBV7Qryb2VcC/y2cquVKKgENcy3kpEkvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711644579; c=relaxed/simple;
	bh=t4cTlzECMq5LKlXpYwa5rNfW1FBBR201aMcJW2m6Weo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cR7mA6cqEp8RYVr5fPYaUCNYtMETw+2ctKgC3OPIRCQ0f7AyJp1NXJDY2IGhG4K28hlILhADYFAeSeycT351xXwuqDJ++zAWzl2yei+nknuDP9Gi+/AA+hPkYhtPURl4APpLYVBcxZLM9qSQYY4EFFu7vZAvw6WmzmkHUlahCPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=qGg0iT9I; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="qGg0iT9I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1711644566; x=1712249366; i=wahrenst@gmx.net;
	bh=qdpbrrCGCYe1ARMoCDOB8lr6GQpVMIuXTkel1s/jXz0=;
	h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:
	 In-Reply-To;
	b=qGg0iT9IxBNqqcLy4Wx6v30fC3kxSVHjyX7imU/WzXV6tSm7oitJmFqxMAdtypBb
	 /6oVMEzWhu33qisEzig4bcpkEQg7MHZwI1BYU8uQ6PElac5gMxpIDkZciWARwE5C4
	 8uOjRvJ7TzIEbhqG83hk/a1zcDNIqKLGxVzgHHoZxeDSugN2y6F3BAoSY4JKpt/Ud
	 x7E4lDo7+sHaqpIStk0to6vi6XJEQT9aHw0I3Gz5HNdJxwIDe/UmjGaxu/yhTJ/UF
	 dhTamrMmf3+Vnt3QnrIce9RmLbBDBWR0wfwFTKUcEEwG2qjCbay9UolKLeAf5wz4c
	 tzXb2v2bmqOeSjqt+w==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.167] ([37.4.248.43]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MFKGP-1s516V1SS9-00Fg8L; Thu, 28
 Mar 2024 17:49:26 +0100
Message-ID: <21465844-c2dd-4c6f-bc9b-fbe102fbdcc1@gmx.net>
Date: Thu, 28 Mar 2024 17:49:25 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] staging: vc04_services: Stop kthreads on .remove
To: Umang Jain <umang.jain@ideasonboard.com>, linux-staging@lists.linux.dev
Cc: Stefan Wahren <stefan.wahren@i2se.com>, Dan Carpenter
 <error27@gmail.com>, Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Phil Elwell <phil@raspberrypi.com>, Greg KH <greg@kroah.com>,
 Mark Brown <broonie@kernel.org>
References: <20240328051615.618908-1-umang.jain@ideasonboard.com>
Content-Language: en-US
From: Stefan Wahren <wahrenst@gmx.net>
In-Reply-To: <20240328051615.618908-1-umang.jain@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:EHxpYHCKVaDQ+pu7aEsBCvVo4HUC8fBkTWrVswp++Poe2XrOTBk
 Gn5oPHW8svl8Er0JV2BhyHmxPth0XkhtyNmfWt+GyQ+S3KDWFcDLih1hPnKIxG13vCpQjTb
 tuvShwme4AVo2Ofe09615wHrKiGSCN7CckO+uaFwhovcgjiFNRH0q73bqOY6eObzsrtEFHT
 xxb3O2AdbeuAqI9CS+4hw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:4OxmPR5axk4=;BKx5M6eL+pWijzFgkef0c5HRgb0
 z0KWXnNZkyzWjfr36/RyGzRb0YmunkReavtw1mePCLaZWAMaooTtXf0KdUh4zl/wqz/mFd0uT
 Apba1LlWoqtLQgaA+XmVbWe1MxhTapbdtl6G9p9R7zwGL9voDKiX2cNhwMHlogaamJ1K1pqa/
 KZv/3d3c70CNyfuDpXNgHmmVqALFh11ebWhi+4FQJo/F/SfJ5lJITxSkEYio8n/jRSEyD31t/
 LZHoWS6gHoTEif9txRlD67t9rZIuiXsp1OLaesb6IcbLgINLhMIUG1LOUue+lflyOFbraHsM9
 HGvw8Pkf6w3nXrm3WUxsBMwtYNT5qtX21doZuVcijYiRoItrioW5XNeNBsNt6SK4LRKIiwKJB
 a9QANoZ+lzIoowm57nez8mQra6zSQWPS3bkM4OO1P3p/UV8VZMkAjNCM7YNIyCx4jDgKDnH0p
 VAuLt9PZkNRQMHqnlQm3sQw8I0UY2Yk1RK+RDRKDNnwOoHi7Bq8wrX+BHXjC1aNjriXYW+pbJ
 bUBTynervKJLuwALtn2Qj8/d4Y8HiXU0IJbeGQG8huey1PiNVhjwJc/71sUVHEF36/Oq1wNFJ
 8s2tvmUTXTUi66IhNfkJMLzenBc0N8wt3JcO6U1as3zBd9p8LwJvnkyyxXOddG7qzxP3+2pVa
 +1klHyLtyuptJz1MI80KjC2tu0OynebJ7o7pjXS1p3845JGPkHaAH95xCRDNDfMdvT46J8AbA
 uiR91xY1mu4M1xhhDZLEylUxQNj7m/x+Vpe/X317hiz1hRYHYQVtwt5kxu51SUQaVEge4hVZo
 QGp+2ciINwPAxBuNfXdKvN8CAzyYqkJwp+khlUO6Z/mv0=

Hi Umang,

Am 28.03.24 um 06:16 schrieb Umang Jain:
> It turns out that stopping kthreads on vchiq_shutdown_internal()
> corrupts the vchiq firmware during probe.
>
> [   11.005324] bcm2835_vchiq 3f00b840.mailbox: sync: error: 0: sf unexpe=
cted msgid 0@b18db30a,0
>
> Since the kthreads are created during vchiq_probe(), symmetrically
> they should be stopped on vchiq_remove().
>
> Also, vchiq_shutdown_internal() is called by vchiq_shutdown() which
> is a exported function. Hence, modules can take indirectly shut the
> vchiq interface by stopping the kthreads.
>
> Fix it by stopping the kthreads in .remove instead.
>
> Fixes: d9c60badccc1 ("staging: vc04_services: vchiq_core: Stop kthreads =
on shutdown")
> Reported-by: Stefan Wahren <wahrenst@gmx.net>
> Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
> ---
>
> Reproduced on rpi-3-b 32-bit kernel with multi_v7_defconfig and all
> vchiq configs options. Patch seems to fix the error mentioned in the
> commit message.
i tested the patch on my Raspberry Pi 3B+ with multi_v7_defconfig and

CONFIG_BCM_VIDEOCORE=3Dy
CONFIG_BCM2835_VCHIQ=3Dm
CONFIG_VCHIQ_CDEV=3Dy

Now X came up, but if i run

modprobe -r vchiq

but i'm still getting

[=C2=A0 146.730014] bcm2835_vchiq 3f00b840.mailbox: sync: error: 0: sf
unexpected msgid 0@10b01b8d,0

so it seems to me stopping those kthreads isn't that trivial (which i
never expected). Maybe we need to care about the order or an even more
complex synchronization mechanism between VideoCore firmware and the
kthreads.

I won't have the time for further investigations during the eastern
holidays. Maybe we should revert d9c60badccc1 and take the necessary
time for proper testing.

Best regards
