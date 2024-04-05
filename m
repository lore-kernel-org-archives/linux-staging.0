Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E75FB161902
	for <linux-staging@lists.linux.dev>; Fri,  5 Apr 2024 10:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712312662; cv=none; b=VxMiL7bsUG3BrQUaRELfxnWELqhRIMK5gpV44WUeV1sjclKsffdcl0ljGwQ5F8tUpHBGZ6BIk6PK6j3GwViny4ZaBdDZPqHv23UojDPZtqQoCQr2Dlplehi1RD0OUtyiZPWrhBXAbXq/Y5fpLexW1KDMk6SFIQFgih0Kd4kotMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712312662; c=relaxed/simple;
	bh=IXNUq7oefZ/HatBUyTvFVP7ACYQovRlKUiJApLekvxA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uvY5jfpopaDG+Y/Bzuhoex03I1yTQFSxYyf3FYNkpolK5I5Kos0NdbeDro8eryhPzm5FHpUVCWqT5v+C7TaR2X2oEWj8/kCQjS+KCqDnvvRR2TFb2fGhpfqBlDFgItskhLTv3BHX90okqYqB6pTin8hNTyXq8LjeztJCirdJyTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=YZMavdOM; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="YZMavdOM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1712312648; x=1712917448; i=wahrenst@gmx.net;
	bh=IXNUq7oefZ/HatBUyTvFVP7ACYQovRlKUiJApLekvxA=;
	h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:
	 In-Reply-To;
	b=YZMavdOM+JAN6cqvlbzjrP4Hn4/cuM/C/+rLDaW8VaOGR/Vq0oTNgXOLS/NTSNFg
	 hBZ+9yoqhvPcxXe5zVA5JJlRzFN1MVfPJS/JG+t7hvT/zzUruWI0nfeC+UE7LbJcz
	 TEm09aUDeE3PKUK8sVrCB6Bs/d+yucfYOcJMtibqW3WxpgOaVoSPHizsF787886tH
	 W6InosSo0UDhJMsQlzbfUKJ7Nzrhjj8jgETcd6jVcFJ1rlDVNtkOtb7MjzhYN2jn7
	 GYJ+eAKVgqMRaH3Gkn/NBPkj8G5zx64bbfkGZPrj6RgX8o+xRYBxJSK4xiau24/KO
	 7A2DfqyHXiEr2L6gDQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.167] ([37.4.248.43]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N8GQs-1swUmm1yvw-014DnA; Fri, 05
 Apr 2024 12:24:08 +0200
Message-ID: <34b14772-1386-44f4-bb7e-e3f6cf137971@gmx.net>
Date: Fri, 5 Apr 2024 12:24:07 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] Revert "staging: vc04_services: vchiq_core: Stop
 kthreads on shutdown"
To: Umang Jain <umang.jain@ideasonboard.com>, linux-staging@lists.linux.dev
Cc: Dan Carpenter <error27@gmail.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Phil Elwell <phil@raspberrypi.com>, Greg KH <greg@kroah.com>,
 Mark Brown <broonie@kernel.org>
References: <20240403052100.2794-1-umang.jain@ideasonboard.com>
Content-Language: en-US
From: Stefan Wahren <wahrenst@gmx.net>
In-Reply-To: <20240403052100.2794-1-umang.jain@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:t3Hsa6Hh4bkT2JAzSjU29R2xjt+Ps0wd0N6nasrnk6Oa7/Gu65s
 0EyvWxTwoocaLM+1rOZlB0f0T9+Zm0phIgjJWMOBCb6sbdwNeYlmI0fsOrfC6Rpl1WZiWzZ
 fr1GqQIol0GCo2UrZ5Lwy3NgROFVuKmtHjUqUf9xXMpvXQleJQGZZniSGDx2c+IZRgUCbDp
 MDP2FrC0+/JURZhbz0Caw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:k2FUjgwmxOc=;Dp5teanA92e/JIIb3JRzZ3/zAiz
 27JBEtwWEUIsn6aJqnhCvRhQ2SUkwROm4sphE88DEsWAglGEX7hdXU8ugIsixShMefUaUOks0
 ph15b+2PP6pf/eL2ZVc3iSd/maQL+SZImVCIFr5E7aGgM/7TXDsmxdi767Hue64HB+HY9Kf1Y
 cr68NvPoHoQERzIlocRq1XtHtM2wezoBC6ssP5IQuJ03leqIEWYxaIhnK9ugIuBUr2LFk6KzZ
 YAetMXiZihD78W/vSfbuFzY1hGIa2gvBhoDAvWl8Z4F5dNBT0ZzDJuOTKUgM/PHqGjl+QIig+
 /8ooUEHC6g5Uh5FsOpv4pSwaHZnaRbisRZ9NNQrxA+3HFE5RC9EOHUK4rPIPeSnhmINExtH3r
 hBFQeN1XY3EJD8cRwDxBYhPbf+9DK3liiBH1vHguwGHxTks8RvpEylYN3CYwzeoWEJZuUfgH9
 RRpLo9bbolMchRzyOcgHYkhLqg354xAWzdo+cEgcFx9bDmFkLhGB+d5Zt7tHTw2cfetTt25Ms
 9jK2eqoYGlCARIUEbVUH1hmfdV/WhzQ1/XbRqSZgNm9ALkivsTyPKaG5irvG8cQRCaDAFN+Jq
 jdpF+gc7XACO+HpGrxPMO8Trf/Ui/oQp6hLbOz9+YSt89XnOzRiNybIQd5eDKrI4Ju1qkQ8ms
 bgkDWKSS/0jzCBgZVjrL0JCpwmbH6Gt2BMql2wF1gD+0ysFeSUKdZEd/375voTBtYc6aMLGk9
 H4mbo9wMWGfCh0c4k7Tgk9rrANAlkpVOfx29odcL+kCyD+yueMVGYveDt2BMzc2biMtuDBoIv
 aSNOt94HlhyIhMAOThvRcn2CynEDGP8aNVI9wGfMkn9ao=

Am 03.04.24 um 07:21 schrieb Umang Jain:
> This reverts commit d9c60badccc183eb971e0941bb86f9475d4b9551.
>
> It has been reported that stopping kthreads corrupts the VC04 firmware
> and creates issues at boot time [1].
>
> A fix-up version of this patch
> bac670144384 ("staging: vc04_services: Stop kthreads on .remove") [2]
> was also attempted but it also doesn't properly fix the TODO
> (i.e. clean module unload) and similar errors were observed when
> stopping these khthreads on RaspberryPi 3.
>
> Hence, revert the entire patch for now since it is not very clear why
> stopping the kthreads breaks the firmware.
>
> [1]: https://lore.kernel.org/linux-staging/CAPY8ntBaz_RGr2sboQqbuUv+xZNfRct6-sckDLYPTig_HWyXEw@mail.gmail.com/t/#me90b9a9bc91599f18cd65ceb7eedd40e5fee0cdd
>
> [2]: https://lore.kernel.org/linux-staging/171161507013.3072637.12125782507523919379@ping.linuxembedded.co.uk/T/#m1d3de7d2fa73b2447274858353bbd4a0c3a8ba14
>
> Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
> ---
>
Reviewed-by: Stefan Wahren <wahrenst@gmx.net>
