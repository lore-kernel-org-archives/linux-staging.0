Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FFB31F9A95
	for <linux-staging@lists.linux.dev>; Fri,  3 Jan 2025 11:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735903735; cv=none; b=H1vyeJXnfXC9watt9Qf1j2lZUSm7zm8AAgmkVWwl0qYXzJ4cSXXWq8S/GoWICYg2nSvuvFLhcV2jElTilCi5XWlRWSyw/5VS21x1+h+/avOzbG/MV3mtTeWNk5xseemLzHJsfS9V3qILovNenQlF13ANzqqgytKnB1qZMgKSMdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735903735; c=relaxed/simple;
	bh=U17cwY5+L9na4uLSzjw/cPO+Dtv1+qbGErw3xlcP9co=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GC+hIrOY3suwp91Z6uNgn9QYHXmbmVvCWMk4xsduuYDJ2tHHriQn1LtKQZamHUaEpzioUnJ99y9Xph4P6EPHh8/H8kGGkZy0sjZ5Cx6krmKtulhoQL/vnV4lQSyEhkQyg5wv9UxztZchXi4kWtXAWcQbEPWSXAEENWJqZX2TDsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M6Z96/p+; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M6Z96/p+"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5d34030ebb2so4921384a12.1
        for <linux-staging@lists.linux.dev>; Fri, 03 Jan 2025 03:28:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735903732; x=1736508532; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=32PWNC7r6rHdSHh0MVozKUaF4TAx+dkDRht1Ruk2YR0=;
        b=M6Z96/p+n0pZco1GFPq3ALYLGDLNcH2MAegfzrA3I2MSHo/ZGnvUbt5pl7XAh2Rhpe
         WWEX6z6dC8svqKj6qDEmfkWD0PmAl6Pdvf/cgcdm94CxlFbIpulKozLj5Gzm462b4DRa
         2ARCMaCVY+iudeGDw/KCkcyTvHhPurhZ2cjI2CI3UFeW0IhHFw/aO5Rwrsgt/iXbcAjp
         +HgLtrPFM9A9IQgsKEFepXOVmJaD5azqsMa+oqOotUH9NdGZmOj8oHh8Vpxr89+lQ0eI
         UTBPTvb0nyCf+Horp3FKDxAlwhiRJ5Xq+L1n/ShBcisNejrUSpz5vC+9TyfuHPDIy65m
         uWug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735903732; x=1736508532;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=32PWNC7r6rHdSHh0MVozKUaF4TAx+dkDRht1Ruk2YR0=;
        b=jQ9BESsUkGAkgvMmwNdYPFagY+EySSwmZp2PfLAPJLApd8qjMvSys89zSCeiuP/wbm
         1tVZihCRSoDBlvgFdM3+TRekIpIRNreDAfwndgCywM/QI5xiUl5UoXqSsLKjmvV2TGvS
         ail3r3zkpPDlDnsTmJrW5X5lVSJeHxAZ7oXp1Ux6U48QN8M9QPpjo4nxU27QveR7Vjm+
         aAQ0YxyfYeuaBFptqtxn3Nmlq1UEtEJXqLga1xgDWoiTVIC3wcsQawIwrR+AVDmqjOlU
         NVXirQdKae1dlDTyz1XR6aCYRwvraporBjoML+FfLd7ehYdgUNkZUIMLfm6784rMwO+w
         bZFA==
X-Forwarded-Encrypted: i=1; AJvYcCXGKkzk5q5Zx8kQ3emgJs/NbvY9JXcgtcDEPidMc4BAUBg6RXKuT1ivYUiMmJ+gtdXb/FrSAKml2zWtFkqB@lists.linux.dev
X-Gm-Message-State: AOJu0Yw8EUdbsVuUDtX8E8yguLFa0YHyn9Bkh2c7l3n+6iOFjHgsqXWv
	kcr8NoFtdBRPrIHxD4vgK3Rm+0SGJm5JnFVhnmufO4wycqSU/7Nr
X-Gm-Gg: ASbGncu2yGAmOVVSgcvPtN4o4WEMoV27mWHdEbcP5/6ULiWL3WWJIyS3SctvGlseH9T
	DoCe2EQ5o9oKIvFrOFcEsthR/UXFHsPNeoIqAoOCvY6vo8W56UdhjpXLWlW/izM+XUlA8hPfnv2
	q8fJZuRo0QqPBN/2huJt6FvWlj/eff+lpYg6kHrVNcjZ5hSvbLkoQlGAuQPPY67zWQcW1HKUdiB
	DoyC+AgAe/K/t4nBA3cJ1ibS4n6w+hJo1of0KWA7LyveREEkmIySHI5YrqdzP2KpIVeXaZ+Z0o7
	/FSRNbCFCT6no8ADt5Mnen4pcJzeAbyEf7WgLfUb
X-Google-Smtp-Source: AGHT+IHEcdLqUHL2H3ucyXJoB8McZg4PpIJmWOrwxm+YDc8ziukB1qD/VdAnjm5hkaddAJsOcvw6OA==
X-Received: by 2002:a05:6402:2809:b0:5d1:2377:5b07 with SMTP id 4fb4d7f45d1cf-5d81dd4ef8emr43942219a12.6.1735903731101;
        Fri, 03 Jan 2025 03:28:51 -0800 (PST)
Received: from ?IPV6:2a02:3033:600:7448:4613:e00c:fbb7:1d60? ([2a02:3033:600:7448:4613:e00c:fbb7:1d60])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d80701abc6sm19336866a12.75.2025.01.03.03.28.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jan 2025 03:28:50 -0800 (PST)
Message-ID: <9e7e5b13-ece0-462b-bfa9-21a395612354@gmail.com>
Date: Fri, 3 Jan 2025 12:28:48 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] net: ethernet: toshiba: ps3_gelic_wireless: Remove driver
 using deprecated API wext
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Johannes Berg <johannes@sipsolutions.net>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Geoff Levand <geoff@infradead.org>, Simon Horman <horms@kernel.org>,
 Alexander Lobakin <aleksander.lobakin@intel.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Kalle Valo <kvalo@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jeff Johnson <quic_jjohnson@quicinc.com>,
 Larry Finger <Larry.Finger@lwfinger.net>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, Pavel Machek <pavel@ucw.cz>,
 Stanislaw Gruszka <stf_xl@wp.pl>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, linux-staging@lists.linux.dev,
 linux-wireless@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Stefan Lippers-Hollmann <s.l-h@gmx.de>, Christoph Hellwig <hch@lst.de>
References: <20241224080755.194508-1-philipp.g.hortmann@gmail.com>
 <b811d4af6a634d61389dfefacd49853c0e77f1d7.camel@sipsolutions.net>
 <39256db9-3d73-4e86-a49b-300dfd670212@gmail.com>
 <CAMuHMdVGdpVqkdvoFxu84YgBh_0fsAKeBhWFEg+nDyGLwbruig@mail.gmail.com>
 <8dfe122d-ce0e-4a1d-9a2f-f7585036b989@gmail.com>
 <CAMuHMdX_P9WGBiShm6Dp64Y9GRvESH-Nn=b=rRrsGbwza81VeA@mail.gmail.com>
Content-Language: en-US
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <CAMuHMdX_P9WGBiShm6Dp64Y9GRvESH-Nn=b=rRrsGbwza81VeA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 03.01.25 12:16, Geert Uytterhoeven wrote:
> Hi Philipp,
> 
> On Fri, Jan 3, 2025 at 12:02 PM Philipp Hortmann
> <philipp.g.hortmann@gmail.com> wrote:
>> On 03.01.25 09:53, Geert Uytterhoeven wrote:
>>> Care to tell us where the fix is?
>>
>> please find all patches for T2 on this page:
>> https://wiki.t2linux.org/guides/kernel/
>> More exact here:
>> git clone --depth=1 https://github.com/t2linux/linux-t2-patches patches
> 
> Thanks, but I cannot find a ps3disk fix there?
> 
> Gr{oetje,eeting}s,
> 
>                          Geert
> 

He Geert,

I think there are some regarding PS3 and also Sparc, not only ps3disk.
You can leave this to me. I will go through it. If anybody else is doing 
this please CC me so we do not do the work twice.

I am OOO so it will take some days.

Thanks for your support.

Bye Philipp








