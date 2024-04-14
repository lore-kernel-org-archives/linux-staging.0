Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ADF31862C
	for <linux-staging@lists.linux.dev>; Sun, 14 Apr 2024 11:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713095155; cv=none; b=ZZQBPMRC8dIf+Y+hNTCIIctKtiO9datGrKzbE4Rjao+EnLad94aQxmE4K7BKVO+lXo+sw1wF8HVLylDBVi9KJnY4SQz9+gZY/loVqjqmMihYyoCMkFRSGz8nBkWcn6yY1weiIb57QEBo/FnZLGUBFG5HlZMngeQSpen5n4icycg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713095155; c=relaxed/simple;
	bh=8U/0LXAtYi+ddxAoimeu+o8tgyEXReF/wMeA0XeIXxg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WFyYN+TC2fXCFT5R1Snj2x8aICRVY3t06croH+NPbgZEk/mFPPMbMdkPrrkMRKEWVnKaYR5L9StsLOQ1qBTM7EUIiAr4AOpmT2MLey3aDAQmDfDRpPnZxeAZ3zORhXfQR5Kf9j8urqVB1G8zwybd0Ribl4L4khefXKOyY7LtwZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=UwN1Jyet; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="UwN1Jyet"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1713095146; x=1713699946; i=wahrenst@gmx.net;
	bh=8U/0LXAtYi+ddxAoimeu+o8tgyEXReF/wMeA0XeIXxg=;
	h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:
	 In-Reply-To;
	b=UwN1Jyetk6zO3inT64Dz+xVZmBDHbhQxeLfAQEf7ZWOaFj2TvT9jZd0zMyyygkaj
	 KDDe6nWGIQcs4ieWCr+3axY8oxlneS648p2wKfDViLMqC4f2DiVHPNjjih0gLvevq
	 2e8c26nKNvRqbfXBfYZPz3S89JaV5gfii6+9TCEXnkm4plwblgpL3c05Y5e/Ogtgj
	 dA8MxVDZ5kwu1HNV3Z1CtCLX6Nh+6pu8qMBlF9Zw3IL0QURwwHkwbwBQsYCJyVuvL
	 78GlldBfY4/Pa1BBgSTJoTB3+3bu1hOIeNMpX4OQ0lytPhWFBX44fgMzf9qEueG6/
	 qAUGHqkyhsDkVI7HZA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.167] ([37.4.248.43]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M5wPh-1roZeL0i5r-007W9M; Sun, 14
 Apr 2024 13:45:46 +0200
Message-ID: <5d490bc8-371f-484e-a2bf-689ce7fb10d8@gmx.net>
Date: Sun, 14 Apr 2024 13:45:45 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 06/11] staging: vc04_services: Move global variables
 tracking allocated pages
To: Umang Jain <umang.jain@ideasonboard.com>, linux-staging@lists.linux.dev
Cc: Dan Carpenter <error27@gmail.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Phil Elwell <phil@raspberrypi.com>, Greg KH <greg@kroah.com>
References: <20240412075743.60712-1-umang.jain@ideasonboard.com>
 <20240412075743.60712-7-umang.jain@ideasonboard.com>
Content-Language: en-US
From: Stefan Wahren <wahrenst@gmx.net>
In-Reply-To: <20240412075743.60712-7-umang.jain@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:iti9/6L5rZIg22R+iuQc1hmV5p7Dv9TbyCOrlVGhM/4O3AXTyzk
 ZWDCpzCE2u26AnyPv3KobfzyQhJchzsVJs7nhQKEF3Pph4oxl7cKDFlxaKskBRrYkoeGelj
 Mbo4Bkawrc+yKxy727I4yG+inSKIW7FvrOg/oY+JkAGEZYcfH8nkpA7g0793OukZ0DyYy3M
 q3DQnS9rPAyDvfWs8smkA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:tmM/XqYRGMg=;a3tkqlIJ6XBy8CjUUAlVG9HdE7Q
 CkssEQi+ZWGGkYVIEeI6/8PNquACq+dkr6fbuxsGHVK9s/BO3+mJU5BRkVDEt53oymEZAxvN1
 97TiVIUbTKES62FxINjCSjU3dARjl2HH59ArfOmMckoGNGRXkW6/zIG8bEyosa6YqIEDmPZO/
 Nz91maBWmzusDaZk3fzP+wJ1XJSK+eenstrHVI++DYkeFUTHdsyYmD69XDcYRTa9rcvmljIBa
 zYPKgX6HslLBDTBf7wmS/BW/t31ZvsmL44aHbXaWww24MdEHMR0lIqb8PYvN/lCTCe8/wtjcw
 Dkp6L8WnBD4FQ7psGwNySeFT83tgYuQUdggy57LxlAuz60H//MlZt/oy5k8r4rM+CvcYdeSZ5
 8TzNiRPsefVANwKuWytWjaW9gg+omCAiPuNLI07betGaY1b8lKvmmLJYdzj51fc9eALn+rUR5
 BDmu4a/mYHYlK/djEkUdeIwyusm/47fZAWZLTVvDIAfZlwfcMbfY8VL9EFZT8O2clhQ4/PZpL
 JiK8Uz+FWzaVn2v3y3pbpxt2CDRb77VDXxortp2XMGKVLJQ6Tl8WzjJbz/s84FDTa8NxAIpfn
 DBuvCD3m7Vg/npy5I5Oqi5KJ6q6Ei0rkf3lYqxEZ17X0s5T/UspgMc0ZK794xrTPzoz97PHQ1
 0qnWGLIYPIOuMB84G/YOtWxk8kMQ0nqKPz1hmUtNqdGN3KFwh2Z/JOSrMKfNiGT3CQEliikGc
 9EUQ95ce2NH5iL0DMBmEDJ5guYm+PNKDnPncl0gtoO/6cyj7ApbDABjj3pDcxIoWNijhV6BIG
 3e5ZXeGHFJId8J2lY5g2O4ROws81F4YfkDdUo4O/zZi3Y=

Am 12.04.24 um 09:57 schrieb Umang Jain:
> The variables tracking allocated pages fragments in vchiq_arm.c
> can be easily moved to struct vchiq_drv_mgmt instead of being global.
> This helps us to drop the non-essential global variables in the vchiq
> interface.
>
> No functional changes intended in this patch.
>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
Reviewed-by: Stefan Wahren <wahrenst@gmx.net>
