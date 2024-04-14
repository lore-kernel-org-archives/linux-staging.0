Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B97B923759
	for <linux-staging@lists.linux.dev>; Sun, 14 Apr 2024 10:23:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713090233; cv=none; b=G7FXd10UEHnTuak6LWcOYumjMmaiCO+8cmEgur5+HBfVFIS7VBGa4kxqwkBwvJhERLEyDPWLtQwye3rfKWXT3dpldFE6WXtX3H2VKMXHFoai/huQRUchCH9x34H6fXq3IGGfNRwWrr2Of7Z9g4xU5q7HruvVEJRgydHmq35bqbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713090233; c=relaxed/simple;
	bh=V4/v4mKvlSqF0CH+HBmVfMXz7qhit5lB0c6K7fdGKdk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KlU2MtldBrf578i+BY8EFJFstiS4SP26HG3MO2+++ECu3hQPR0JQKeml4qItAOidmh9DtjwnIiwv6nubUP3PW+7NH+sanVaATIGBetMhR+iMxO4lAvDzlZchiFoce0PdkAt4yRzS7S/3nf31hkjWB7nv0g1FwCqkDyd1FyXTdio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=bzq1NC1B; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="bzq1NC1B"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1713090223; x=1713695023; i=wahrenst@gmx.net;
	bh=V4/v4mKvlSqF0CH+HBmVfMXz7qhit5lB0c6K7fdGKdk=;
	h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:
	 In-Reply-To;
	b=bzq1NC1BgSaPH4nQi2ZksE5XBWISJUScmv8F/VldnBOSGfD4MNBULDQlNHzYGtQ2
	 HKnMQeMsXiMnqkkANVxoWaGTxyst8XswsRd2yBvrmozj3iW7M9tQLEFCUeDfqdY3z
	 mK3ghXAK0fmHt0hxDvnFdr5wLpbD65rL21rgXkxXAh+YUQSyo7f7wfm5hQk/y8JCz
	 TLTp2HnK4mcXyLZqWBylwQYl/JouiIcG7E4J1TRzykWAsPtAmkRfCZrgsccyYg4Nb
	 1LMn3ywUzlYSyZ3Gk/ZuEIcxgFhI0ujErWQ5k4/Q+ffR5pU5N3t3Dm3VPRGZfyhG3
	 b2zIH+s0PZXJ+LFXRg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.167] ([37.4.248.43]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MdvmO-1sVYQD3Ata-00b3Xf; Sun, 14
 Apr 2024 12:23:43 +0200
Message-ID: <f1ad7708-5792-4efc-8169-f8b6714021b2@gmx.net>
Date: Sun, 14 Apr 2024 12:23:42 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 01/11] staging: vc04_services: Drop g_once_init global
 variable
To: Umang Jain <umang.jain@ideasonboard.com>, linux-staging@lists.linux.dev
Cc: Dan Carpenter <error27@gmail.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Phil Elwell <phil@raspberrypi.com>, Greg KH <greg@kroah.com>,
 Dan Carpenter <dan.carpenter@linaro.org>
References: <20240412075743.60712-1-umang.jain@ideasonboard.com>
 <20240412075743.60712-2-umang.jain@ideasonboard.com>
Content-Language: en-US
From: Stefan Wahren <wahrenst@gmx.net>
In-Reply-To: <20240412075743.60712-2-umang.jain@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:yO+/75bRSgrVEEsSKllH+cZAscn2kQOwDWIlpeK3eOG9IP8q0wW
 XYyz2cqJUGXT6OlqOMlWJG1TiqbyTvSnh1m+Bk49pJfimVH0Ev+RAv73Y/oV7OwaF+iiNHL
 1Z45xuXA5Olal94d2CBs/nyfWtFUsGQNSiP21/AEQHifqe0qFKpPCBAqwglKUgZnlHVjPuZ
 upPaw02dFwJnZVSRP3vjQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Ptm4yEyYIDs=;2oOo6g2nyFb7ObN5ya6cUKCEPxO
 VjfvovlUk46dIcrWUb5k/ipOwz3loCYhUNP1qSFw8johjNxJQ2z9Un1EwDcs7NjOY55OOZL8u
 si5ZRxHzjJoN07eyBsTeJdFiHZNHNZpd8lmU2e2W4SjBwQt6migZ2KDpQf8vKtMbsH/5SXvQw
 fwoofKbW85Dr115I4hDIDlqdZt2/DRq9FIrpqEmOyT4pPUfOG1kSWCuNStmZIZD8BWHJYV6kj
 nyz9rzRPR17Hcp0zPJCi1WzxeRQsJXpOvOtJOKUiGaMDM9BlXHJdd2IO2thy/6Q11T7p5TSU8
 jmcLQtqCEZSrD7XKPpLOjolExlTeZlkA4Tzzr+NWHU8nsE5iuMMNqY4pP2a2uJTjaHvTNMRtY
 CcSWx5ktFMRxgIhs0BDlaWDACFir75tBYoR1ccuCBcNQHgSDhGEkEX30h2rK+83Tn0HS62xVv
 H4UpUhgSuqzIz+rnlXmsHknCGN2jlfeaWRj9Nedo4BaRJtkU991qUUqAeAHIBGYApqZryowAi
 sGsEpGbQsNDAlCGOLwsUQV5RyLhQlOVJspp9V1mdlufzwRwGw4lclC8pUEoSkmSJBw8bSy/X3
 KVfREsxfqAhwYb22NtcIpLP6p/3dh+NoYP2j7yESCUR7EGUW5jpSuFTd0+e8hmiNhd0aWc7Ky
 IKB2eRa6TMojQBLgJKz2ijgxHi+BN4ilHWc6f22JHOx83EaUdLS021KQgkatuIGmHAiTEd0n9
 z22/2mxuFT4QUFS5a++AwfS1o6cBvD7ZNoPaSooo9J9qnUYsasb5MtYpxOrSAHAfGQFQsfC5Q
 CUlaJLE9iZIXMwjCqYxz/fxxlSyovZPeJtnFVG1MKdpfo=

Am 12.04.24 um 09:57 schrieb Umang Jain:
> g_once_init is not used in a meaningful way anywhere. Drop it
> along with connected_init() which sets it.
>
> Suggested-by: Dan Carpenter <dan.carpenter@linaro.org>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>
> Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
> Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
> ---
>
Yes, this cleans up the rest after commit 1790f2be41e4 ("staging:
vc04_services: use DEFINE_MUTEX() for mutex lock")

Reviewed-by: Stefan Wahren <wahrenst@gmx.net>
