Received: from forward502b.mail.yandex.net (forward502b.mail.yandex.net [178.154.239.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 797C539E6F0
	for <linux-staging@lists.linux.dev>; Wed,  3 Jun 2026 20:13:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780517633; cv=none; b=sbM/JRlRxbxVnwEbD5amFd84rwNrpm3UYXskmamst/dUKqHHkjwYqbolAQI7a0ddUwa4d6lZL2uvO/GvJEnxjo0pqTWM1YX6D9r04IAUZGFc3G1vbI/nRnRgHYI1LZxnSK1IlLZcswPi+ciWnDV845+GODECk3SM4Ys2fFjQE/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780517633; c=relaxed/simple;
	bh=BUojQuPPqcRcc+26Tg/iaa6hx06OOkU/idAD3gpsRvw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IiK/pnKuJG062Mst+t6JKyYSxmetLVsGOTgbXWjYVJehhb/btcagju/7J3s5CbNGjZHUJlAzubV8tUHSwFJYL/apicnpdu2mCmQ1WdiUAXtsfqgyVPqf1S3ielLhQxIlj6cYy3g3gWLkDW6jZY8jgqHWYXwWhd9ShvkaLJOeM2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sezginduran.net; spf=pass smtp.mailfrom=sezginduran.net; dkim=pass (1024-bit key) header.d=sezginduran.net header.i=@sezginduran.net header.b=qdMfohrO; arc=none smtp.client-ip=178.154.239.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sezginduran.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sezginduran.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=sezginduran.net header.i=@sezginduran.net header.b="qdMfohrO"
Received: from mail-nwsmtp-smtp-production-main-63.sas.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-63.sas.yp-c.yandex.net [IPv6:2a02:6b8:c1e:489c:0:640:8d6b:0])
	by forward502b.mail.yandex.net (Yandex) with ESMTPS id B72CE82C5D;
	Wed, 03 Jun 2026 23:07:29 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-63.sas.yp-c.yandex.net (smtp) with ESMTPSA id Q7n8nI2fxqM0-lYFBKJsv;
	Wed, 03 Jun 2026 23:07:29 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sezginduran.net;
	s=mail; t=1780517249;
	bh=lizfpTChkrRyvmOPStilvcFK4uIKiR9Qyda6SquEm40=;
	h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
	b=qdMfohrOCTQf6QI343mWTUNzRQNMpVekNftruXge5pus2/Mt49zmLy0XKmckoLz/S
	 TbfdcXwAHy/pfHyEc/YXMFst8K0f8LQs5xY7QWSWhs4rtCBLTKJbalBn1mo4jOVeaG
	 sVMX+Hd8gIsZ7Y5DQrk3CRwXf7xWgqmMJzVRmVVE=
Authentication-Results: mail-nwsmtp-smtp-production-main-63.sas.yp-c.yandex.net; dkim=pass header.i=@sezginduran.net
Message-ID: <4abc61e2-e5f3-4c92-a751-c8397c1ec8df@sezginduran.net>
Date: Wed, 3 Jun 2026 23:07:25 +0300
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] staging: rtl8723bs: remove comparisons to boolean
 literals
Content-Language: tr
To: William Elder <williamxelder@gmail.com>, gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20260603195239.200775-1-williamxelder@gmail.com>
From: Ahmet Sezgin Duran <ahmet@sezginduran.net>
In-Reply-To: <20260603195239.200775-1-williamxelder@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/3/26 10:52 PM, William Elder wrote:

> -	if (phtpriv->ht_option == false)
> +	if (phtpriv->ht_option)
>   		return;

Still same buggy code, V2 didn't change anything.

Please work on it properly and wait a day to send a new revision, not 
right away.

Also, send your replies using `Reply All`.

Regards,
Ahmet Sezgin Duran
