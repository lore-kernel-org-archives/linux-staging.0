Received: from forward501d.mail.yandex.net (forward501d.mail.yandex.net [178.154.239.209])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB7883624A9
	for <linux-staging@lists.linux.dev>; Thu, 21 May 2026 19:58:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.209
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779393517; cv=none; b=ur5QMJOaP/0JcQn/i1csfWvwtmT/5jLLpN80qWHzHnVqYLCYBZGkgGbyKkdGNhdjUZ+Q2tls5r4HUxv/GIXVmExaSyYeqk5F32woewjY3S+AO0gFlJvLGwWJb5P5ACCzCTdy+fqg/ZV2c9MOQAbWbKNaq7+V4k4TVTGyCs9x2zg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779393517; c=relaxed/simple;
	bh=SGgIFLR6TqEnAPvkQNhY1mFPeGOLmrcoFCBdNy4c+jE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=j39RAA//BxYbpWVN8DTnO4ySG9fOw5TjYrb6UXINMMOt7hXZgCTIwSqsLzt1ngw15qsaqcavBVlWXFdVz87xH2b0NM3RE+lyqmtFJYlCxhC8IVq1SZnmGEsrZi87RE3c9gRW+2SmEnvWys2RlUGpCSoUvIJ8iUVBTFhOjkRam/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sezginduran.net; spf=pass smtp.mailfrom=sezginduran.net; dkim=pass (1024-bit key) header.d=sezginduran.net header.i=@sezginduran.net header.b=ZCjSPeIn; arc=none smtp.client-ip=178.154.239.209
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sezginduran.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sezginduran.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=sezginduran.net header.i=@sezginduran.net header.b="ZCjSPeIn"
Received: from mail-nwsmtp-smtp-production-main-78.klg.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-78.klg.yp-c.yandex.net [IPv6:2a02:6b8:c42:83a9:0:640:50fd:0])
	by forward501d.mail.yandex.net (Yandex) with ESMTPS id 468D78111F;
	Thu, 21 May 2026 22:52:36 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-78.klg.yp-c.yandex.net (smtp) with ESMTPSA id XqZceb1geCg0-jmWnmVFZ;
	Thu, 21 May 2026 22:52:35 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sezginduran.net;
	s=mail; t=1779393156;
	bh=xKXYSeZVykJ2VCsmTh/2Op4+3xlDROGlXjeTqMJcpo4=;
	h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
	b=ZCjSPeInW+lcUaiOVXntK3X9kDahFPJCJzCUmHrh+LC5TgJaaglSutv57jYORymT9
	 GgIvTGchHhFfTt2NUHPA5EjKGGB1kZu7h4pvGGoXOJtECuwuR1jtocAqVPnFEjxAJ9
	 /eZ/iQOpJ92wYgKzCRRZvi5t6EV9240y6rVK2X8U=
Authentication-Results: mail-nwsmtp-smtp-production-main-78.klg.yp-c.yandex.net; dkim=pass header.i=@sezginduran.net
Message-ID: <4bf0f745-427d-4c10-860a-31f2f8db1b57@sezginduran.net>
Date: Thu, 21 May 2026 22:52:32 +0300
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] staging: sm750fb: add const to g_fbmode array
To: =?UTF-8?Q?Diego_Fernando_Mancera_G=C3=B3mez?=
 <diegomancera.dev@gmail.com>, Greg KH <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev
References: <20260521142655.24408-1-diegomancera.dev@gmail.com>
Content-Language: tr
From: Ahmet Sezgin Duran <ahmet@sezginduran.net>
In-Reply-To: <20260521142655.24408-1-diegomancera.dev@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 5/21/26 5:26 PM, Diego Fernando Mancera Gómez wrote:
> Signed-off-by: Diego Fernando Mancera Gómez <diegomancera.dev@gmail.com>
> ---
>   drivers/staging/sm750fb/sm750.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
> index 89c811e0806c..8f533f3b1b42 100644
> --- a/drivers/staging/sm750fb/sm750.c
> +++ b/drivers/staging/sm750fb/sm750.c
> @@ -21,7 +21,7 @@
>   static int g_hwcursor = 1;
>   static int g_noaccel __ro_after_init;
>   static int g_nomtrr __ro_after_init;
> -static const char *g_fbmode[] = {NULL, NULL};
> +static const char * const g_fbmode[] = {NULL, NULL};
>   static const char *g_def_fbmode = "1024x768-32@60";
>   static char *g_settings;
>   static int g_dualview __ro_after_init;

Did you compile these changes?

Regards,
Ahmet Sezgin Duran
