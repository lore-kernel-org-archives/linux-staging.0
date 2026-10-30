Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793367973;
	b=HtGdGWjAUb79t+dYFB2ogRJ+sWpamt8F0R4joTydV0s/cskza9dmiGWrqcpbHQdQw3g2
	 K29MCVuW2r9FYAiGnwK0To5TcgMVkGzLAZgj0NPz4MFXjA4O1BP9IrN/OA1MCDx4pDCxX
	 1XxVO03iYSLuhVQH/V7F49xwAqhtcoHnKpUPjPLCfT0wS0rmmp8fstRktuHZFklMu0JS1
	 Fz1419QBkMxRm0Wnm5C74sGb34hMvfTfr6DwE0BYDzOevV1/5CWCmxgR88tqXQ68ZB+nF
	 SdsC4f3ThBacDTyP8Qq9j9TzPSMWsvx2KqGRQJ9DD8ShTl+iF0BSuO5CcoK8FdVX3VA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793367973;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=Cel0vcm4G5w81qs6p/3zOaRkogZgkiMaq/fEg3zUQoI=;
	b=3wRYl+YggiWqg1OP68EvsqXEN5/xFeE36d9P1Z7T41RauD+ronguxGVCn6QnWBWwhlPX
	 PwANrXB6gyJm3T0yNiBd5np15C/106DmDmwjPIoqHooCoB/IJrMuq+gf5Pc7wjxGKMwT5
	 9jV41mWQEosd0lUxUHmppJrWhlOGzMQGzyBIDecnTlOHL+RWiYYmABLA3PzbzLGTytfp4
	 nMNn3VMlWozwZV/oLIY8SQLijdnQwhiBSJeY/y0KnGW2/+/81BOjgZ+evO2vkhISMnziV
	 zpq8plIF0je6TiQUDaQ3vjdKEc5sNpFY3+B0qTeKfLGcymE97dpQ1ojmbTitkxduF0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ieee.org;
	spf=pass smtp.mailfrom=ieee.org;
	dkim=pass header.d=ieee.org header.i=@ieee.org header.a=rsa-sha256 header.s=google header.b=anzOZR+H;
	arc=none smtp.remote-ip=209.85.167.178
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8548606A324
	for <linux-staging@lists.linux.dev>; Fri, 30 Oct 2026 13:46:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8548606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ieee.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ieee.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=ieee.org header.i=@ieee.org header.a=rsa-sha256 header.s=google header.b=anzOZR+H
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-4ed6d69bdfaso463136b6e.3
        for <linux-staging@lists.linux.dev>; Fri, 30 Oct 2026 06:46:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google; t=1793367971; x=1793972771; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Cel0vcm4G5w81qs6p/3zOaRkogZgkiMaq/fEg3zUQoI=;
        b=anzOZR+H+dK6ExDZEutUyPXQRiYAnmo7mWGvRaJRanil0/s1rT6oAu82jXDlQMTmY0
         SihZTqD8Xlzk/p0H4U1zHuR29KMhMR1vM8tn86I7sYKRmO0d2X072tivdKtllDCvMPa7
         ulmPmXYshDlvdv3WS9QGD/v/KGwid4H2TUP1g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793367971; x=1793972771;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Cel0vcm4G5w81qs6p/3zOaRkogZgkiMaq/fEg3zUQoI=;
        b=0Pk149EPxLKoxSWSJkmr/S5kpby+3D3DsYG2Hhyn2y8377aePASfq6A/yli2fPrPAA
         e51+TskmQK1XYTw/nBBtw9SI/7rbusDiszBlqZRTvTcteN7Cwki3Qllr81ySuR7gTiD2
         yhTCTlOC7leP1xAjJpbQY2F5tNWydbmJydh/8w8yhY/bXLkE1W4t9K5035ttFhkf6DDM
         hr/UuQ7qMUY6GNwyTrFC0D/DHGxtxOWJhtgzcd0/k3fClauy6Wo0MRyjzN5QQT1QY2qI
         noXoajOTw7hisCW1ov63BxSp5DoJeutwo/ktA4UYRs+sCWn99E5g2r/Sx2ypyQACyGjt
         nhLA==
X-Forwarded-Encrypted: i=1; AKwUvBzYSQDu0Y2ehvoyca/OZkWApaevJzwf/fBoqFYW3u6Ra5GW08Bu2DNaK5mGaXtFq1QKE60weoywn6pYrOqo@lists.linux.dev
X-Gm-Message-State: AFq9FYLTCPoEhklR97momGioV4pDACJ7VwLcri9VL1V5xZEaILvHT4N/
	y1IIlFq9bIAD3u87Jl3CkKHFbsXXyUeZ6nFgEUqODg6JD9NvTlnaxflJ4NBt8UHSaw==
X-Gm-Gg: AYBFou350FinjxNtLGDBH8ZL26pe2PUFy0zN/4bPet6YekSA/qgfNWg7TEzDtp0+2ij
	TYqXGl6cc0BAMZOLIF3WphlHtzQVFvXe8X3OdsriCcs7HwyRS7AbQmk2CAW30kkiU33VYSqMmUC
	/Mj3nZ4QYcfWDRc+eAliUkbVvh2sEcz/e0uQdo4TuXvFtjsf85dgIeTPWUETzpkw9VsKan/ZSxq
	uIU+5kr7KRUsWRKG0sG+zeHr0eVs8ZYgj0a2BwAS6OFjexCDykRnRciI1MREWxvoipvqP46VpHG
	+y5avSl8KYqq72DxUubBnKlk6GnK4WOUxqc2VN7YOsCMqOI8Q9Gm5jRDGR+o4fxoWqnyeOJ29lZ
	VrYAgSCJB1Aa/++DUKAI6XxuhJ7RZBtB5CPXqAhNq8+oYo0TIMvSN192aSfjMWP6ZAvZ/BGeO17
	/cLid9AWEDyrRWZRRMUNO90zJtNl4jxqZGWGheNwFryOyKg5qQBIiMIxuw8MmCxCWLKgnMzo6JM
	H4r/UKl0XvZrEreTyLOKzjNrd0tefZK2Wrifot/REpCJkiljTqDLoN9Aw0xzBevtowiw+8MjZDo
	SHLef89rNxN0ceFwXBQceaqu
X-Received: by 2002:a05:6808:151f:b0:4c3:6d56:77c2 with SMTP id 5614622812f47-5640de7e3a9mr1613306b6e.41.1793367971178;
        Fri, 30 Oct 2026 06:46:11 -0700 (PDT)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.googlemail.com with ESMTPSA id 5614622812f47-5640fdcef5asm1492922b6e.9.2026.10.30.06.46.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 06:46:10 -0700 (PDT)
Message-ID: <9207a52e-2d42-4e10-b777-2988e84d7dbe@ieee.org>
Date: Fri, 30 Oct 2026 08:46:07 -0500
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] PM: runtime: change stub pm_runtime_get_if_active()
 return 1 when !CONFIG_PM
To: Sakari Ailus <sakari.ailus@linux.intel.com>, Frank.Li@oss.nxp.com
Cc: Frank Li <Frank.Li@nxp.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Andrzej Kacprowski <andrzej.kacprowski@linux.intel.com>,
 Karol Wachowski <karol.wachowski@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, Matthew Brost <matthew.brost@intel.com>,
 Thomas Hellstrom <thomas.hellstrom@linux.intel.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Alex Elder <elder@kernel.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Guenter Roeck <linux@roeck-us.net>, Guan-Yu Lin <guanyulin@google.com>,
 Mathias Nyman <mathias.nyman@linux.intel.com>, linux-pm@vger.kernel.org,
 linux-usb@vger.kernel.org, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 linux-hwmon@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org,
 linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
 netdev@vger.kernel.org, imx@lists.linux.dev, Rob Herring <robh@kernel.org>
References: <20261029163044.3062958-1-Frank.Li@oss.nxp.com>
 <auRb_r8ZSSU-eHZA@kekkonen.localdomain>
Content-Language: en-US
From: Alex Elder <elder@ieee.org>
In-Reply-To: <auRb_r8ZSSU-eHZA@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/30/26 3:57 AM, Sakari Ailus wrote:
> Hi Frank,
> 
> Thanks for the patch.
> 
> On Thu, Oct 29, 2026 at 12:30:37PM -0400, Frank.Li@oss.nxp.com wrote:
>> From: Frank Li <Frank.Li@nxp.com>
>>
>> When CONFIG_PM is not enabled, all devices runtime PM state should be
>> treated as active.
>>
>> __pm_runtime_resume() returns 1 (called by pm_runtime_get()).
>> pm_runtime_get_if_active() is the try-and-get version of pm_runtime_get().
>> stub pm_runtime_active() also returns true. So pm_runtime_get_if_active()
>> should return the same value as the stub pm_runtime_get(), which is 1.
> 
> Shouldn't the same change be done to pm_runtime_get_if_in_use()? It's
> otherwise the same, except that it requires also the use count to be
> non-zero.
I think "yes."

I think the logic for !CONFIG_PM should basically pretend runtime
PM is enabled for all devices, and they're all ACTIVE and effectively
in use.

That implies:
- disable_depth == 0, so usage accounting would (if enabled) be done
- runtime_status == RPM_ACTIVE (power is on, no delay)
- usage_count > 0
- runtime_error == 0
- Maybe ignore_children is false?

This might not be complete (and could be wrong!).

Some of the other dev_pm_info flags could probably be assumed false,
because they represent states in transition between ACTIVE and other
states.

					-Alex
