Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 249B220E3
	for <linux-staging@lists.linux.dev>; Mon, 30 Jan 2023 11:53:52 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id r2so10785682wrv.7
        for <linux-staging@lists.linux.dev>; Mon, 30 Jan 2023 03:53:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hGloNujiL0CsgogRLovAVVyc6KEZFVadDdcOWuMAQsQ=;
        b=DV8o93oCQ73nQnF6DKwI5AzadrxQNopoi9mYTUm8VXhAF/qN4J/4O5a5pBBbHw9+dy
         ZtqDU02mUJOTkEW3lXS3R4n610Pein98fCIAQDcPn38n+/aaJTet9MP1WMw6Ww+6CLjl
         5+F6klm8htSBwuIFCZuPNW8wrPHaMMr5XyxIO55Z5H/9Xdgn0JQLD7q/ME/fr/X2RCIK
         mPYzzMe8sPJBT6nzlF/rTs46FncTH6ZMAuUjEgDxMl/Zh2q7TeWkqSU5R2ip/hnPFhMB
         8SAFIo3GB6loDpJxArn2vu8S4eiM5GYSaLAh0+spfd730xZq+zplUPNsNfLeEnYM21aw
         t2yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hGloNujiL0CsgogRLovAVVyc6KEZFVadDdcOWuMAQsQ=;
        b=eYpjSvIA5MSvb73unGDE8cqTEI2qLTq7ORXNQRFkx7ulHG0WjyZvAKkxvnFDn+PSiF
         dEgaIIL8vePqP5rcdU2v6qM0mvj0+bcccbTRy1I7BNGIaew2oi2HiuoOSmDGrWiJvfe3
         uxaM6Oi0Wjc7EwziY9jEWAkKmDQKWa2NLn5SSNIDXsXcaWWG7PoMC2oFWvUbn8RUfQYZ
         TIMXjq36cqUb/OkTRxpkFtGDNqE7i4iRry6pEHJlz2vsYm6OxV7bs0PnpJefNpy8J0Yy
         wIpIt6o2eMXze+XQ4UPIEAkcUpHY/4t7M2J1/XtRK95pKixfAK5RDb62nlyr/9nl68p2
         R7uw==
X-Gm-Message-State: AO0yUKVeXRtifPlJL2DH2cKzGn31d1KqvklHCqVmf/rtH2qpuNx7Lr1m
	RllD9SQjrRU/j93uF4K5nfk=
X-Google-Smtp-Source: AK7set99aypYxsMEBlz2WZVjweCmV/hwIdnZNU+KENU9bagNUuU2UXoj/aDRU6yeJuS1ze7BTzlhow==
X-Received: by 2002:adf:f8cb:0:b0:2bf:b047:d4af with SMTP id f11-20020adff8cb000000b002bfb047d4afmr19424812wrq.5.1675079630213;
        Mon, 30 Jan 2023 03:53:50 -0800 (PST)
Received: from [192.168.2.202] (pd9ea3cac.dip0.t-ipconnect.de. [217.234.60.172])
        by smtp.gmail.com with ESMTPSA id t27-20020adfa2db000000b002366553eca7sm11594342wra.83.2023.01.30.03.53.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jan 2023 03:53:49 -0800 (PST)
Message-ID: <4a196e8f-cbc9-7453-6e36-aad458549e25@gmail.com>
Date: Mon, 30 Jan 2023 12:53:48 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH 6/9] HID: surface-hid: Constify lowlevel HID driver
To: =?UTF-8?Q?Thomas_Wei=c3=9fschuh?= <linux@weissschuh.net>,
 Basavaraj Natikar <basavaraj.natikar@amd.com>, Jiri Kosina
 <jikos@kernel.org>, Benjamin Tissoires <benjamin.tissoires@redhat.com>,
 "K. Y. Srinivasan" <kys@microsoft.com>,
 Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>,
 Dexuan Cui <decui@microsoft.com>, =?UTF-8?Q?Filipe_La=c3=adns?=
 <lains@riseup.net>, Srinivas Pandruvada
 <srinivas.pandruvada@linux.intel.com>,
 Corentin Chary <corentin.chary@gmail.com>,
 Hans de Goede <hdegoede@redhat.com>, Mark Gross <markgross@kernel.org>,
 Viresh Kumar <vireshk@kernel.org>, Johan Hovold <johan@kernel.org>,
 Alex Elder <elder@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-hyperv@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 acpi4asus-user@lists.sourceforge.net, greybus-dev@lists.linaro.org,
 linux-staging@lists.linux.dev
References: <20230130-hid-const-ll-driver-v1-0-3fc282b3b1d0@weissschuh.net>
 <20230130-hid-const-ll-driver-v1-6-3fc282b3b1d0@weissschuh.net>
Content-Language: en-US
From: Maximilian Luz <luzmaximilian@gmail.com>
In-Reply-To: <20230130-hid-const-ll-driver-v1-6-3fc282b3b1d0@weissschuh.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 1/30/23 04:59, Thomas Weißschuh wrote:
> Since commit 52d225346904 ("HID: Make lowlevel driver structs const")
> the lowlevel HID drivers are only exposed as const.
> 
> Take advantage of this to constify the underlying structure, too.
> 
> Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>

Looks good to me.

Reviewed-by: Maximilian Luz <luzmaximilian@gmail.com>

> ---
>   drivers/hid/surface-hid/surface_hid_core.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/hid/surface-hid/surface_hid_core.c b/drivers/hid/surface-hid/surface_hid_core.c
> index 87637f813de2..a3e9cceddfac 100644
> --- a/drivers/hid/surface-hid/surface_hid_core.c
> +++ b/drivers/hid/surface-hid/surface_hid_core.c
> @@ -174,7 +174,7 @@ static int surface_hid_raw_request(struct hid_device *hid, unsigned char reportn
>   	return -EIO;
>   }
>   
> -static struct hid_ll_driver surface_hid_ll_driver = {
> +static const struct hid_ll_driver surface_hid_ll_driver = {
>   	.start       = surface_hid_start,
>   	.stop        = surface_hid_stop,
>   	.open        = surface_hid_open,
> 
