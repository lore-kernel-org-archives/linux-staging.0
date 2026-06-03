Received: from forward501b.mail.yandex.net (forward501b.mail.yandex.net [178.154.239.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59B7839DBF9
	for <linux-staging@lists.linux.dev>; Wed,  3 Jun 2026 19:53:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780516408; cv=none; b=g6U+ZhxU1QhkuIqPGzwUw1jEVIEK+7QTams/DI5U9mnuvtv8dpTUU4u/f2qSppdza7/gwt/yLZ7T1BXNiv1kSgPiUU7qSFFRW/+bNnpo/T5fIu5iWsII08rgi+pG3IohIjtwrG2fmwBjsI1oa6vVZkTcajlwaOYNQ02mFAJNz5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780516408; c=relaxed/simple;
	bh=XIWaW3/HugZJLuPxV/T5/oMqYRIKLFKToTwypbiUd6Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YPAjO2HQjYgMBjHz3zlgBaowgWx89FqUIHm2lN2nqM1ZRjQ6IiC4TjgoNjfZfL1QLllj3trbhXzvJ6HTT22B2XxC2dlTXoLuG6qi8eSHzXE6rfb3r4Lmo9hhplUW/kl/2SCUECA803jX0YwDxeJfWd6kwb0JBXpfR3XFCeK4Yu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sezginduran.net; spf=pass smtp.mailfrom=sezginduran.net; dkim=pass (1024-bit key) header.d=sezginduran.net header.i=@sezginduran.net header.b=Avi2lDg+; arc=none smtp.client-ip=178.154.239.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sezginduran.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sezginduran.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=sezginduran.net header.i=@sezginduran.net header.b="Avi2lDg+"
Received: from mail-nwsmtp-smtp-production-main-70.sas.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-70.sas.yp-c.yandex.net [IPv6:2a02:6b8:c11:e97:0:640:f294:0])
	by forward501b.mail.yandex.net (Yandex) with ESMTPS id 74F1D81C1E;
	Wed, 03 Jun 2026 22:46:58 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-70.sas.yp-c.yandex.net (smtp) with ESMTPSA id skmkX72fKCg0-Hdx3QAYb;
	Wed, 03 Jun 2026 22:46:57 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sezginduran.net;
	s=mail; t=1780516018;
	bh=HZav8EkntZV0bv53AtT0JLWXulO9+MAHB9Xb7kfPiM0=;
	h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
	b=Avi2lDg+K0gyzimyxJYWG6lKMYmbTZyh4MuWSojlflW3Lmxf5plHKnVnfTEwKwcsg
	 8p7Q/tc1pnbhEqCte6WI8Wrr0s1va9lMKaiumN5i12gT9DY8wY9LTqRTC1RrlAPfad
	 /kf6nepAzXkRi3tN5AYNkfJPGPVTe8nKB40EsyBg=
Authentication-Results: mail-nwsmtp-smtp-production-main-70.sas.yp-c.yandex.net; dkim=pass header.i=@sezginduran.net
Message-ID: <683a0f8b-1e5b-44c0-92cf-c7a7f0981fae@sezginduran.net>
Date: Wed, 3 Jun 2026 22:46:53 +0300
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] staging: rtl8723bs: remove comparisons to boolean
 literals
To: William Elder <williamxelder@gmail.com>, gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20260603193753.195640-1-williamxelder@gmail.com>
Content-Language: tr
From: Ahmet Sezgin Duran <ahmet@sezginduran.net>
In-Reply-To: <20260603193753.195640-1-williamxelder@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/3/26 10:37 PM, William Elder wrote:

>   
> -	if (phtpriv->ht_option == false)
> +	if (phtpriv->ht_option)
>   		return;
>
This breaks the previous behaviour and creates a bug.
It should be like `if (!phtpriv->ht_option)`.

Regards,
Ahmet Sezgin Duran
