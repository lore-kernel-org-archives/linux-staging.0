Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4F3E6AC2
	for <linux-staging@lists.linux.dev>; Fri, 29 Mar 2024 09:53:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711706014; cv=none; b=iNaS4Lyrr/M+30U1m4WuyK17Z2ohPlA1Rg0dKoHhzC1WnxvN2ASgFio4offvwhXUz766M1TPSIh8BDODCXD/c2UxCOosp/WL2+b8G7Jk9JwhfNImKiJRoQOXh043Lphm3kyriRFghveUT4Wuegr3QfXAiyANkLM4SUc9eRenaQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711706014; c=relaxed/simple;
	bh=tQdGrPtFrKy/MjJE97UMGBqkRQWQg6wR5pnSJnJCkFA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NC+63/W+9CUxh1LMlD9Di9fKyfLwF8K+3b3KgZCF4nVaPdRcca9jDNb9oLTHDgKsNEu45VBqkMvWKrwhFzpa2Jwdrh4i2ebjUIqiMTayE1kOgcVvT+GLf2devcZbluE9WwpCRoQvrvbX4GqWzoZMLKVckvelCVdISzrdNZu7jmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=DCzFgWZw; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="DCzFgWZw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1711706000; x=1712310800; i=wahrenst@gmx.net;
	bh=s65PsfKPGSAWxUX7kFqF9quYMoCUgg+Z1QHlDCVFYno=;
	h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:
	 In-Reply-To;
	b=DCzFgWZwgQHhP+OyGzImZhYLoJVrxWNTfqOtNHZbRvUDyAVaHQiv1+ZmpVvtXdO2
	 jzB8IjcOGF6fDq7OiDkM/Ks5sTb/9ckCCP1lzXLIGqH6ppd9v+ZhpASKIYI2mmck7
	 x30WBmB9GeNDK4I6fDOsqkie6pPPBCDpepnoru50rUzb799GJ9fp8qfXqSfs1Liaj
	 BGPuuY0rt7TUZ1OXfoD/J2MlAFLwX4TF/wIU3kTKu5OltOWuPxTKqZiwrQgUuH0ww
	 8tkLptpuC3VljhvjqsmYygy3S0EficJUuReeg8uY8N7BR0ML+QoEvqxvRB06ZsIZD
	 YUu+N7I5nNYSfnmAsQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.167] ([37.4.248.43]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1McpJg-1sOeOY236I-00Zxix; Fri, 29
 Mar 2024 10:53:20 +0100
Message-ID: <b03c9b02-b2c7-4a09-961a-9708456ad181@gmx.net>
Date: Fri, 29 Mar 2024 10:53:19 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] staging: vc04_services: Stop kthreads on .remove
To: Phil Elwell <phil@raspberrypi.com>,
 Umang Jain <umang.jain@ideasonboard.com>
Cc: linux-staging@lists.linux.dev, Stefan Wahren <stefan.wahren@i2se.com>,
 Dan Carpenter <error27@gmail.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, Greg KH <greg@kroah.com>,
 Mark Brown <broonie@kernel.org>
References: <20240328051615.618908-1-umang.jain@ideasonboard.com>
 <21465844-c2dd-4c6f-bc9b-fbe102fbdcc1@gmx.net>
 <2f02e574-dc47-429a-9e2f-fd439684866f@ideasonboard.com>
 <CAMEGJJ2V1G+JNGeR-=eL32WZVbcME0X_KGgGs8bxJp6+aY4GSA@mail.gmail.com>
Content-Language: en-US
From: Stefan Wahren <wahrenst@gmx.net>
In-Reply-To: <CAMEGJJ2V1G+JNGeR-=eL32WZVbcME0X_KGgGs8bxJp6+aY4GSA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:22v2jlLkou3UjKtRgvhA5E+0iieuBEyKKyCxQjqCmrFA4M8/Qb4
 KrA5iHuqNVrgVCIjYYqLlfSx171ni5xb5Onpbj/QB4SCA/2yFtLeokRJC48vnpuevgmHN3w
 Ev+PD3jiIhUjaNY9a1ic1RniJA8Gm1rrCflgvPef4+TRC5QJyoTPErqTmV2QjCbxltlJCLV
 WYVOxs9RirprdDq0ibd0Q==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:ReFypVYEleM=;AR5NooCMpLd/li8YvWJ9ZprqRDe
 gkLDtAwiNzrXzIilKQVs5zqWvik/Xvnxi3WU0EhbpG2ZKr6I1bJ+UBsLROB36BtcjTUCqfFnA
 r4Kx9yrL+o0h0+h9gDeTIi4rfr05xkC3Q0gmsfmE0r7PycwVSFMQ2iYsuCbS9Dsmutnw9FDmY
 HK7K6gh8ZTrXV1vEC9yGE04gPMH3X+7D1VfeeX4IAl4M/m9at0LBVUARoyGDvXJmTI4YFJVEJ
 6oocpSHHCaPYPebt2dDwoe71Xyt6VL59K6ISUwNy1qznw6foFYlHVQuw8jcJPZ9L6VbYFmn5+
 mRJcQDQul9guH6RxcUC/zXL5/UUEtnabMUJGsz8zYEK49lupRv7chNRABi7awBrL2SHaKVmeI
 DdH9/HY5QkP8tZrd7o92yCh5CzPCyuo042agRdt6Q7IBVqp4arFayOETtZn5mb8AKPJn1eT3E
 K/v6snmAUm8wrFRUQairJtPrxt1K/0HXIZdFEN+uFntvhdDicE2Dn1Zv1xf7plmbQ8EfYVmiV
 nqsl/+yB/rJJYxddn2OA6MfLC1bpcbEohlHV6kl9qP74k4fSvuUm6WWusUitcm3jt92IfkrCH
 D30AGtKDmU3anx7ImWEAXC/XnH/dpZg7HI16wGAjyTzx1uOzn6NzNR7QQ7DEfjDy3Lccnz/U2
 ANOLfu3lj2uRwGyKjWC5Yr1YKPLwwABbkd8oZcYnMRsKGXlDmk+bZgvuXO/CwMA+msmBLGs1S
 9x3VJarwSCy6mqjEFTNZf3JSQ7zgl4QOqRme74vEsXfa8XWZ917W2Op2afKkOWpoqAeWoRy0f
 1pMyf5uD8yWvywLNidmirrJ1GCZ6Ok+fvHcBB4QWIVhZ8=

Am 28.03.24 um 23:43 schrieb Phil Elwell:
> Hi Umang,
>
> On Thu, 28 Mar 2024 at 16:54, Umang Jain <umang.jain@ideasonboard.com> w=
rote:
>>
>>
>> On 28/03/24 10:19 pm, Stefan Wahren wrote:
>>> Hi Umang,
>>>
>>> Am 28.03.24 um 06:16 schrieb Umang Jain:
>>>> It turns out that stopping kthreads on vchiq_shutdown_internal()
>>>> corrupts the vchiq firmware during probe.
>>>>
>>>> [   11.005324] bcm2835_vchiq 3f00b840.mailbox: sync: error: 0: sf
>>>> unexpected msgid 0@b18db30a,0
>>>>
>>>> Since the kthreads are created during vchiq_probe(), symmetrically
>>>> they should be stopped on vchiq_remove().
>>>>
>>>> Also, vchiq_shutdown_internal() is called by vchiq_shutdown() which
>>>> is a exported function. Hence, modules can take indirectly shut the
>>>> vchiq interface by stopping the kthreads.
>>>>
>>>> Fix it by stopping the kthreads in .remove instead.
>>>>
>>>> Fixes: d9c60badccc1 ("staging: vc04_services: vchiq_core: Stop
>>>> kthreads on shutdown")
>>>> Reported-by: Stefan Wahren <wahrenst@gmx.net>
>>>> Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
>>>> ---
>>>>
>>>> Reproduced on rpi-3-b 32-bit kernel with multi_v7_defconfig and all
>>>> vchiq configs options. Patch seems to fix the error mentioned in the
>>>> commit message.
>>> i tested the patch on my Raspberry Pi 3B+ with multi_v7_defconfig and
>>>
>>> CONFIG_BCM_VIDEOCORE=3Dy
>>> CONFIG_BCM2835_VCHIQ=3Dm
>>> CONFIG_VCHIQ_CDEV=3Dy
>>>
>>> Now X came up, but if i run
>>>
>>> modprobe -r vchiq
>>>
>>> but i'm still getting
>>>
>>> [  146.730014] bcm2835_vchiq 3f00b840.mailbox: sync: error: 0: sf
>>> unexpected msgid 0@10b01b8d,0
>>>
>>> so it seems to me stopping those kthreads isn't that trivial (which i
>>> never expected). Maybe we need to care about the order or an even more
>>> complex synchronization mechanism between VideoCore firmware and the
>>> kthreads.
>> Dave, Phil - would you happen to have any opinions on this behavior ?
>>> I won't have the time for further investigations during the eastern
>>> holidays. Maybe we should revert d9c60badccc1 and take the necessary
>>> time for proper testing.
>>>
> It's hard to be sure, but I would guess that stopping the thread is
> causing the remote_event_wait in sync_func to terminate early. The
> following code assumes that the message is valid, when it fact it will
> have a message type of VCHIQ_MSG_PADDING.
>
> If that's the case, you can either find some way to spot that the wait
> has actually failed, or handle VCHIQ_MSG_PADDING explicitly in the
> switch.
Thanks. It seems the return value of remote_event_wait() is ignored here
and should be used.
>
> Phil

