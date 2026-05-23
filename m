Received: from forward500a.mail.yandex.net (forward500a.mail.yandex.net [178.154.239.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 163752D3ED2
	for <linux-staging@lists.linux.dev>; Sat, 23 May 2026 08:34:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.80
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779525277; cv=none; b=n7FgJAb/9STb7FA4JlJ2/EOTLY4NqfXQ5Ps4UeuuvGcFWdYgqQqGEStqL0x7eoWieqru8eCizL0KaEYgtzgrGOcYWvsMq1if8JQhhZW3mKKf8Z+M3jjUxLqMpKaF5WEQJdQMei/lA/9gLA8Jkvo9w25SmW5oK8E/T4EWZni4m/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779525277; c=relaxed/simple;
	bh=UsbNwRqxNGPp8fmGBYQcu28WstrjwL0qDLGhQgEXF8g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UmBccEw8PehSEYSK4xeEmezo25eprpk+1D/lCbTcPgDt7KiuorllwYrpNu0dHnryaAP6qvkaoPqMjPsoIzWLfwTMNnzC7iBT09Bh49Y2abLAT0EPhki1I7ULD2tf3I6M37GcVozYnKxXJEw3vAtkjjPAiA03vl8LXjRCu17Yjc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sezginduran.net; spf=pass smtp.mailfrom=sezginduran.net; dkim=pass (1024-bit key) header.d=sezginduran.net header.i=@sezginduran.net header.b=oXT7Y/rb; arc=none smtp.client-ip=178.154.239.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sezginduran.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sezginduran.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=sezginduran.net header.i=@sezginduran.net header.b="oXT7Y/rb"
Received: from mail-nwsmtp-smtp-production-main-95.vla.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-95.vla.yp-c.yandex.net [IPv6:2a02:6b8:c15:340d:0:640:ad51:0])
	by forward500a.mail.yandex.net (Yandex) with ESMTPS id EB5C4C0B9C;
	Sat, 23 May 2026 11:27:06 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-95.vla.yp-c.yandex.net (smtp) with ESMTPSA id 3RQwmwKeFGk0-Sid0gBeM;
	Sat, 23 May 2026 11:27:06 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sezginduran.net;
	s=mail; t=1779524826;
	bh=MdXfPpVzbBL8SzH4B9eWWxFe9PCur209g0OzI3O75wg=;
	h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
	b=oXT7Y/rbJVjFjJapxJu575LWOGZpDb/NuMFwpSLYk2thF+ekYhzys8SpSTVWZp8IK
	 x/yTmTIAZkU/oRF0pw0AG8dZyaXk6l+cW3zlX5fkT/QgQKfL8YmLHaQGtiSh7LJS+2
	 IjTky1yT56uqPPHYN4O12tWxWqxBWKrvwD2QaNuo=
Authentication-Results: mail-nwsmtp-smtp-production-main-95.vla.yp-c.yandex.net; dkim=pass header.i=@sezginduran.net
Message-ID: <af38465e-ad21-4c98-85ed-6370eaf20a7e@sezginduran.net>
Date: Sat, 23 May 2026 11:27:03 +0300
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] staging: rtl8723bs: remove unnecessary boolean
 comparisons in rtw_recv.c
Content-Language: tr
To: Ashwin Gundarapu <linuxuser509@zohomail.in>,
 gregkh <gregkh@linuxfoundation.org>
Cc: linux-staging <linux-staging@lists.linux.dev>,
 linux-kernel <linux-kernel@vger.kernel.org>
References: <19e53a283b8.4f2498e045168.7106069608127124839@zohomail.in>
From: Ahmet Sezgin Duran <ahmet@sezginduran.net>
In-Reply-To: <19e53a283b8.4f2498e045168.7106069608127124839@zohomail.in>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/23/26 10:00 AM, Ashwin Gundarapu wrote:
> From: Ashwin Gundarapu <linuxuser509@zohomail.in>
> Date: Sat, 23 May 2026 12:28:02 +0530
> Subject: [PATCH] staging: rtl8723bs: remove unnecessary boolean comparisons in
>   rtw_recv.c
> 
This part should not be in the mail body. Better to use `git send-email` 
for sending patches.

Regards,
Ahmet Sezgin Duran
