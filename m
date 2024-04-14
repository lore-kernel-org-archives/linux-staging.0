Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C24883D994
	for <linux-staging@lists.linux.dev>; Sun, 14 Apr 2024 12:09:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713096571; cv=none; b=DTeSZBVvpeH1ugwZVhfsUMULwPvxINha2OeaIqD7DypSqpE9M7Oqd4jhM42jNIGQsmrk3R37Vq2yn7aZ770DxGfSCQyROzkzDbrpSvpaC3ppGqPZXzFFqO12DggIREW31ZXBr8X/lASfpj4rjoE4qnw4T9+yoAvMjs5fc8jlEN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713096571; c=relaxed/simple;
	bh=38NdeFDx83/x/v0vlxHZ9ruoMqYV3fHi71pvPHbyOhM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rtox7JXypISgRfjUPUxMdNOf8tkFjvbQXrho7O64wF67rrWW1eAMhNM6+vSnqGrWGeevJJyHNQO31dOI6CQqBhVyDq6pmOMmUc4ZlO5ZHB8xvYx37esSwxJapk+5y0ileiu3GCMMpnG0aDZectFF+t8OX4rwH/3RABptfud/EIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=UOKHQrnu; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="UOKHQrnu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1713096563; x=1713701363; i=wahrenst@gmx.net;
	bh=38NdeFDx83/x/v0vlxHZ9ruoMqYV3fHi71pvPHbyOhM=;
	h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:
	 In-Reply-To;
	b=UOKHQrnuoAE2UeUku70LYKWtwQZMHc+fOQOyFp5JFrkM8ms0LhUl6PFZrrgmLxWP
	 JE6m12xDKnAMM0NCeS+KLCuFe7KP+SA9+Op1GCME4JtsDhRZz03pYCmM7zodTsYN6
	 jOD4YduNr7Tld1DJ7R5RdObqi0cfyfBqJx+dAcUMfANPYOVavIfg+yiYaAyPHbTzZ
	 fWi8nI4iKKb47PolHHJ3943ZeLy8jTlEk2YV09zvQ2yQoccMicrDQTE495N3kk2SK
	 a7EOEmsAy+lV9gxA5MNjny2EPDWaRvLliLZMOJPyHyZig8bSXRCM9ESxai2vKnpLU
	 Pcv2guLtHGrn0WQV4A==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.167] ([37.4.248.43]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MFsZ3-1ryVMj3oIp-00HSAt; Sun, 14
 Apr 2024 14:09:22 +0200
Message-ID: <8e48fdb4-ad7f-4846-bf7b-a45e7e852551@gmx.net>
Date: Sun, 14 Apr 2024 14:09:22 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 03/11] staging: vc04_services: vchiq_arm: Drop
 g_cache_line_size
To: Umang Jain <umang.jain@ideasonboard.com>, linux-staging@lists.linux.dev
Cc: Dan Carpenter <error27@gmail.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Phil Elwell <phil@raspberrypi.com>, Greg KH <greg@kroah.com>
References: <20240412075743.60712-1-umang.jain@ideasonboard.com>
 <20240412075743.60712-4-umang.jain@ideasonboard.com>
Content-Language: en-US
From: Stefan Wahren <wahrenst@gmx.net>
In-Reply-To: <20240412075743.60712-4-umang.jain@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:/1ujpgDc0n/afdK9MtEg0lMR7K2DmaV59W2MtAsPYhc5lr6LEAf
 knhsLZEzwHgeslLehuPhzLlIa6Jqwy0zFXH6LjbqtcW636XTziP4kckTOSLQ9SHI3nbhsgg
 F3hdVhTmDWlGoZ5GwEMrCmgsL0QRyMQo3FyYzHIQQLdmFSVllewA5s4q1aztCjvmqEyb/rZ
 5d0LgUSq7tJOvZirU9Ktw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:W3+ZKZSV/Qk=;5WdBojUE8kJhILyvSMfAh7fcA/X
 ivHj4ZEus/tT0sHKPKBJ3f0h7IEjXJJnJWrShoatAmdWWUFKerhWRM1rp8hAK/uCIixnbVIqG
 5+5fCX/fd+29SA5k+8HmyWq4cZOQtzFueqh1jzcvaEYzPo3MQBT4hLl+BMXIojpiN7X3jwnc/
 h+Z3zNe2tTHBjvlwQ/+/BiErRXj58X3Or2HLaj4GFPjRbv9dVgJV2qBikwPxZUcEpSqgLL+g5
 yvqCYIf3b2MnHArr1htTNTQFaoZoa+IO7LJvFD7CB6rFpc3w5exOTk3bXagAbaMFXwzhkRw8T
 hF4RUy3r5Q7ArJOGP66pJ4vVmUrCt/84ddXgSSyXv6LaCrFhC5214jv1khdZI5kNj74XHdbP8
 W/bmH9Sda3CGm0yGCeHFTdp9nxp15CcEboL9HrOd8a6HRfGdtQrpBQVbpLafg1AF2gkzxeNe0
 Yv7WYSo8Bxu2egRePV4s6iZJ6GQtS5IK3y82+RZdmvdMcwXnWh4nzb/xDSWdq7arO5WyeTKKB
 KYltVCr353IDcZcIEKDbUP8P/zQn42l8Kt4X5DNSVApYwXI77n23WZG9tV1TFZFwwphK0ANGk
 eTGQAM9h7hMRwIPzAT+RD6pzwM0EVtcD080q0Z3IVnrb+nf+lc0rGWKGznGYaMjL36VQagahd
 mqfk5h42M7IDfpCFcyChDjt76L9nl7EAqGuotWHqRnsJeolu1RPoeZmsydA7UFL03tJLQWnzP
 g1tJ7GaN/3rSVl/o8PfiXdUP6oCgSeQrWWQkwjmQPnPzPPA1zp1aPmEUD3BtyWRnk+dac5Odg
 YIZPcCDPK3Bs+91ABUTqXi2AGHE4p0qpnNVOWvh2qPCvc=

Am 12.04.24 um 09:57 schrieb Umang Jain:
> The cache-line-size is cached in struct vchiq_platform_info.
> There is no need to cache this again via g_cache_line_size
> and use it. Instead use the value from vchiq_platform_info directly.
>
> While at it, move the comment about L2 cache line size in the kerneldoc
> block of struct vchiq_platform_info.
>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
>
Reviewed-by: Stefan Wahren <wahrenst@gmx.net>
