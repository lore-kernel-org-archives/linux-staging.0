Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 714AC23B1
	for <linux-staging@lists.linux.dev>; Sun, 14 Apr 2024 11:59:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713095996; cv=none; b=c2c/eHlIL+KF3YtRmGxE2/KfkFIRMVbXrxowluFtzzofiB8/RuEvM//KvdDT76uKf0ysobiumST6dY2criY/W8k/T47QPsxoannUgcNqXqqoOywpDdYdPkw2PshFWusKnd3eV6IRSk/jCXmVx/nJKPiBwlkSNYnWJ8CtWFq3gKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713095996; c=relaxed/simple;
	bh=ue5lvNJdZobgFg/O06OWqryAcvzlr09yx8o69ue59oE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NQ4UEQ+r1nEJgDjg1bX9aao0WGo7OlTMYS4vChlsrVMQ5jV2gAjTVBDUJoPRWiOYt2UJhYMpkjOUTFeZ6/CRqr81Gfa3ZB7yZr+Q3ib/+UMgdSzKsnfhVhEMRsLCW7C0N6zz575y5dfv7H7MNZyAV+4L2YfHcQ4SB/JPJ3ddLYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=eslNfB2j; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="eslNfB2j"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1713095988; x=1713700788; i=wahrenst@gmx.net;
	bh=ue5lvNJdZobgFg/O06OWqryAcvzlr09yx8o69ue59oE=;
	h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:
	 In-Reply-To;
	b=eslNfB2jG6v8zn6bPoXhh93+Q0gLuguysPo5UVMOA82kiWJUQBV8/cUWEGizE3G+
	 VCWpCDmvs5Y1PbBeridhykVW2AGG7VifW0I47cADDU4HlG6jzsc9aw2oTPSpmBmh3
	 fUIx+mtem555/54+PSfQhY8JwVEdgwSbvtWcNOZY0OeqbUA48hpPcMarDg1VXqsxX
	 vcQ8dTcbiTs66KjUXKfg+xJrf539hZ60EfjXNfEGSHSPhGDGkx98E3g13x7SYrByV
	 AxmWxD9CJfW4Tg5iQMvE+UcL+RkP5Vw6jV0Wj2q9ErZgTjv7VSBMBOA8UlgUsvPWZ
	 11y386N8diwQ79TewA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.167] ([37.4.248.43]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MSKuA-1sK9Eq28M4-00SdK9; Sun, 14
 Apr 2024 13:59:48 +0200
Message-ID: <cf4b4cab-bb7e-4764-bc27-14cd37705917@gmx.net>
Date: Sun, 14 Apr 2024 13:59:48 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 08/11] staging: vc04_services: Move spinlocks to
 vchiq_state
To: Umang Jain <umang.jain@ideasonboard.com>, linux-staging@lists.linux.dev
Cc: Dan Carpenter <error27@gmail.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Phil Elwell <phil@raspberrypi.com>, Greg KH <greg@kroah.com>
References: <20240412075743.60712-1-umang.jain@ideasonboard.com>
 <20240412075743.60712-9-umang.jain@ideasonboard.com>
Content-Language: en-US
From: Stefan Wahren <wahrenst@gmx.net>
In-Reply-To: <20240412075743.60712-9-umang.jain@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:fCpFw7cQJtHis560J06mO8C0CQ276twoV5h4OkqLGy6ZPm0kKW/
 GePtCWDMb+DWo0fC8bvj9LWrR4ImfwnN95gf82pI1A8oGSNH2QbbqfoGrE14rOzvZg6Abz3
 OgKgayq8P4s5+CJyy1JrYzeLGHAYe9zFSPG88XTq5+yZsaZqskVRUcBZuUof9/05+sYEKF/
 xJcAleIM0TSCbhUFYOXvQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:DSQHPiZ3X5o=;tdkGtbiQqOt0UE7c2xwe6PpSeB3
 BFy/m3imsRvHcOvPpttlMoYhN/eRXTK1BUiEpLlrm2MQpplZUrvmPF0aq4fie9kbqNn1YY++4
 GVbe7XkWJSkkHhZIrvs0eNhHl/5C1hqIaxihNhDoDyBcehcITKm/Lsmu3fueEFMsBa5bRUxvn
 8KJ5SboVObLbHoFmkW4Lk4x2/fIHkQsrPRRjfrIJG1KFkjDUqqDJiIueb9iPUShkEslO1sZfl
 8huzpQfwniUJZyNz83NWhS1hwmEPplV/gDHEZ58oGCfoupHjxjHl8aTji2ifMFTRij6Bgo3Hi
 GFmRWeO+rnUOrvxl45oDjKumSZ7Kp2gMER5cwtTrEacnyWgFEUDWNcdG74adUW49V0NCR1tIG
 8OMHKWEK4Cx1x7ApxT8Jhml6ZBB6jHBzeWlxcYQApYB03EOsbXaCfNseAJBi08OtCrndAQmEM
 rosA2tEbnjQ66x/qAa69kZhmE4YvqEMrOj2pxBvtYyb12qOUSX6ilHHvn4DDHvYO9Hc6//oKq
 S44Kh+5EzWUx7c68nzAlP80KtKlCoINqM3QxsR04bBh4uHdq/E5eAzXiqNQuGMokJ9YLrghnB
 U/8+mpL4qbKdSlH0QE4Z9LXvU9wNNDZVdePziFOFaZxO7DvD7FWfxDfVdR6JMV2RmLTrsNma/
 01C6N2wkoNwoCNJ2Q/SLomYyLCqOYdGgQeSyb2QYBVgVTQuzVelHM1eY8lwWsrk8EBm6i3+AQ
 tDY95tuS5ZSKId94NrSVsOqS7WB7N6P202LcbU6hMjGFjfDakH8+5EUH4zWCFNuq6zBn95+3B
 x9IlF+b+s2Va7ORcfLrrh8FFeuAMxROPAjFMVHKTuYgms=

Am 12.04.24 um 09:57 schrieb Umang Jain:
> The msg_queue_spinlock, quota_spinlock and bulk_waiter_spinlock
> are allocated globally. Instead move them to struct vchiq_state
> and initialise them in vchiq_init_state().
>
> Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
Reviewed-by: Stefan Wahren <wahrenst@gmx.net>
