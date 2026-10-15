Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0870940B11C
	for <linux-staging@lists.linux.dev>; Thu, 15 Oct 2026 21:25:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792099551; cv=none; b=B/zZuh3SzJ0q8B2gN+6iWQ58EgM/TxSTuAtqHDKl5hmI9zmhSQrcgGgkKUcSjhAQoZWdmABrSuPsHwEkLbX9OUR8oQMJ0KK1v6CAZ3BAqKt6hiDaBlpJM7aOm5qTcjdJ4YhAuEmh+lMUOkL4cYCWZYToTeVUn+eXIAi8m/Nimwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792099551; c=relaxed/simple;
	bh=Kf30i8cGqP3IPHZ3WCA4IROcb1QglSnTECh4JWUUq2s=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=BNwNnrVlvwcswrlihmJY7wRUBgjwzj0t9Y/7/xuOie7xle5vhMUtkTfRD/qyUv5fSaRuPJ/ZcTRpfNuBkM6YbuzVXk0O/d9aoi861P5vfRxYj5UUDo7dwTPts+P/od+787t9NmcN34+V14pAMjGDgMVcoRFKFC+DD1cQtD6P3Qs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ekHq1AO4; arc=none smtp.client-ip=209.85.221.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ekHq1AO4"
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-5c7d1fc8f9dso196102e0c.1
        for <linux-staging@lists.linux.dev>; Thu, 15 Oct 2026 14:25:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792099548; x=1792704348; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=hmU7byQJ7V4GqxfEroCMT0quvOeWGZm1zt5/8tVd594=;
        b=ekHq1AO4fQ38rZc0GxfRpDSInePP4n4E5itOaGmINZdtga5mSbD+nTijUh5gZtlAMz
         CIS+Ta+yfmHLWZuuwjxo7J6NGZiXgny75W6ORr4TmSvKTWlRDNG9gugoYFaq/p1VemiU
         BlZWXC7tQ7SYnL+eVQt+KqvF+M/EDLihfAORbQo9Vu78J/ZgRS0v2cmnD4lPz70oacmI
         6qAOJRqKoS2aOZnfljMbPJdO95TGskOWZFGgyKIj6DTWtAYPWZwKLxsXYrtyDEpBnQ8C
         RYn+HbKxQic0GjjcdJAspngm6BT74eRQF6gQXKrAIrafnP9DxOllTgxc/GdCnANmY8/u
         Bn1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792099548; x=1792704348;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hmU7byQJ7V4GqxfEroCMT0quvOeWGZm1zt5/8tVd594=;
        b=ywEUeN2vsv8yt7WmHeDcch6I7jZreTmMPs2rovh3d46bsQUE2+W5QMj+ASCn2EAk90
         5vtFGR+I2vG0aDUJpE1OyvCM35rprx0cleUIjCpOPjtC1XE0znpiRkaWUygHtGrANwcZ
         KI9up5r557E6d4K7roXbo/+I8SkHSDMpEuqPCHwNr89V3tNuw4HMPBBN0Q80Z2CJI9HC
         tpiT6ps9WLxGQX7O12mLPHJY21Q/EC3mBDjg7eVPm0yZyVApRL3oI2103Tt2onIJv0aw
         3veeVcQUukLj2fI/a0zisoYvLvNBTgag/SGeNiv10pAyYoayW2Y8Mi+IozaX82EafELy
         gDWg==
X-Forwarded-Encrypted: i=1; AKwUvBxAHyw1DIZla8BUKv1JW208K9qa8UUfV51OQ/HRxFOrOxOlNiHz/EvhWEbp4skXbEP+a9YNrWAB15NKbuOr@lists.linux.dev
X-Gm-Message-State: AFq9FYLhMZyDP3fQazdb5GM5hz7Dpe7Q9TFM9aS8FvEgTPaZv26GDUsN
	08rMDqg6o6MKiz04eFBJxZzpB4kDZ2WNL3GOQ4TPPg5fOFl78uo828G8
X-Gm-Gg: AYBFou0hjUuKaRJJ/9Y8USfWsdPZEoUULZHiOR01R/e0fmy868TJyM3jtP+FWN/s/sx
	pIk/aTKYU2wCTYMcV7s2zrFk8LfwecTdodQp+D3Ox+gXoDTBafI1YRCh8ONThjOZK8W4/WT1JfI
	qb/tRgucQwX76IhyasR/31E5mEyCH6I3kUVvpLmsMwXRyt9i1n/AK7webXgkQTFV8S32IJguFHG
	+lG3maKPj1W5ej3igTDiv21zuDKhRyzZJPxSTqwZ20FreIizVTyG+9xgchtUNW+nIkxrzKgt83X
	/dTQ9OSDgP01wZ3abzqovBrIGR6/z9e33w27dKmbEuHAwmMtwrjlNUfZ0alDgOGwIVbtgvN2M+R
	dZ/MpZNhyYAlQ+ihQuE58t0Ezd/xwoNZjjSNidohcjeqfSFRz5O4dcikWyT40QIM+6E1iT/6UKb
	ruRZ2U5VrkggNo903O/w5vt+9o6feqYbp76GURPlZf+MVKVYED3myzH3jNhXK/zOVCeg==
X-Received: by 2002:ac5:c001:0:20b0:5e9:4e2b:4c9f with SMTP id 71dfb90a1353d-5e94e2b4d71mr3032400e0c.4.1792099547922;
        Thu, 15 Oct 2026 14:25:47 -0700 (PDT)
Received: from localhost ([2802:8012:9f:dd00:c85b:fc61:635f:8eeb])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ea9b53cfdfsm190902e0c.15.2026.10.15.14.25.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 14:25:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 15 Oct 2026 18:25:40 -0300
Message-Id: <DM5Q9NKRO89O.22R04QM8YBKWM@gmail.com>
Cc: "Broadcom internal kernel review list"
 <bcm-kernel-feedback-list@broadcom.com>, "Jai Luthra"
 <jai.luthra@ideasonboard.com>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, "Stefan Wahren" <wahrenst@gmx.net>, "Phil
 Elwell" <phil@raspberrypi.com>, "Laurent Pinchart"
 <laurent.pinchart@ideasonboard.com>, "Umang Jain" <uajain@igalia.com>,
 "Kees Cook" <kees@kernel.org>, <linux-rpi-kernel@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-staging@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>, <regressions@lists.linux.dev>
Subject: Re: [PATCH] platform/raspberrypi: vchiq: register bus at
 subsys_initcall
From: "Gaston Gonzalez" <gascoar@gmail.com>
To: "Martin Wetterwald" <martin@wetterwald.eu>, "Florian Fainelli"
 <florian.fainelli@broadcom.com>
X-Mailer: aerc 0.20.0
References: <CAFERDQ0FpdVvA5VJxOyRAE_pgxnPVmFx1tkZio5R272j6Bs4tg@mail.gmail.com> <20261013131435.1454019-1-martin@wetterwald.eu>
In-Reply-To: <20261013131435.1454019-1-martin@wetterwald.eu>

On Tue Oct 13, 2026 at 10:14 AM -03, Martin Wetterwald wrote:
> Since the VCHIQ interface was moved out of staging, its bus is no longer
> guaranteed to be registered before its client drivers. bcm2835-audio,
> still in drivers/staging, registers at device_initcall level and now
> runs first:
>
>   Driver 'bcm2835-audio' was unable to register with bus_type
>   'vchiq-bus' because the bus was not initialized.
>
> Register the bus and the platform driver at subsys_initcall so the bus
> exists before any client driver, independently of link order. The
> platform driver probe already returns -EPROBE_DEFER while the firmware
> is not ready, so probing earlier is safe. When built as modules, this is
> equivalent to module_init() and nothing changes.
>
> Tested on Raspberry Pi 1B rev2, 1B+, 2B, 3B and 4B with VCHIQ and
> bcm2835-audio both builtin and both as modules.
>
> Fixes: aa125180c673 ("platform/raspberrypi: Destage VCHIQ interface")
> Reported-by: Martin Wetterwald <martin@wetterwald.eu>
> Link: https://lore.kernel.org/r/CAFERDQ0FpdVvA5VJxOyRAE_pgxnPVmFx1tkZio5R=
272j6Bs4tg@mail.gmail.com/
> Closes: https://lore.kernel.org/r/CAFERDQ0FpdVvA5VJxOyRAE_pgxnPVmFx1tkZio=
5R272j6Bs4tg@mail.gmail.com/
> Signed-off-by: Martin Wetterwald <martin@wetterwald.eu>
> ---
>  drivers/platform/raspberrypi/vchiq-interface/vchiq_arm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/platform/raspberrypi/vchiq-interface/vchiq_arm.c b/d=
rivers/platform/raspberrypi/vchiq-interface/vchiq_arm.c
> index e78641703252..d35f5ac5c2e2 100644
> --- a/drivers/platform/raspberrypi/vchiq-interface/vchiq_arm.c
> +++ b/drivers/platform/raspberrypi/vchiq-interface/vchiq_arm.c
> @@ -1462,7 +1462,7 @@ static int __init vchiq_driver_init(void)
> =20
>  	return ret;
>  }
> -module_init(vchiq_driver_init);
> +subsys_initcall(vchiq_driver_init);
> =20
>  static void __exit vchiq_driver_exit(void)
>  {

Hi,

For Raspberry Pi Zero v1.3:

Tested-by: Gaston Gonzalez <gascoar@gmail.com>

Test setup:

- Branch: patch manually applied in staging-next over commit ec1ecf4f23c5
- Setup: RPi Zero v1.3 connected to a HDMI monitor
- OS: standard raspbian with the desktop environment enabled
- Driver built both as a module and built-in.
- The following command was run to test the sound: 'speaker-test -t wav -c =
2'
- Result: Both HDMI audio channels worked correctly

I=E2=80=99d be happy to run any additional tests if needed.

Regards,

Gaston
