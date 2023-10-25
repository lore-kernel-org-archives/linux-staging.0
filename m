Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13460286B0
	for <linux-staging@lists.linux.dev>; Wed, 25 Oct 2023 22:27:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QOPcix7L"
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-6ce31c4a653so152094a34.3
        for <linux-staging@lists.linux.dev>; Wed, 25 Oct 2023 15:27:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698272877; x=1698877677; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=gpIvHM5NvuykoUDW2kRupuz5sx/Tvq7a0jlZsKkUcZs=;
        b=QOPcix7LOu5BpNhnLCY/oyhoWWywYnNI4RCfitS13umJZrmtwEIbbO3AkpfvoaqDhj
         w/fSWnV945NzP75HeJFXiw4rxoHqOLlYfApTEMT+FriMl5rywxPTnczj533g7lAUqFfZ
         IfVaR3iU4t13120NUkl6ao5xYEhKL/8r5AkIxfvfR1SD85gQtUUprGI/48I1/RKH4Yxj
         U/QRjKVxlz8+oGCfHpSv0lfpOUPSpH79PM3zozA3GgB+ndX/EBNrIsJ3+F6D2uWyf0ak
         f7mIenDyWzjG6Q/3gxcw1VUsJsQ3GOvgTGVfftogkmlgRYckKBU8+PAoMvdDpBXFsDNI
         qqiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698272877; x=1698877677;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gpIvHM5NvuykoUDW2kRupuz5sx/Tvq7a0jlZsKkUcZs=;
        b=dC7TZ5uEhQRjOx85gAq7p+tcI31GQJONCxQ8KU+5vwj+TYPZOuKAhaaWoYU6vJpfNk
         Rs903HbibaEv5qBI08/BOoEF694b0qqgPesNMBsE4TNjbM4tcVVTgrjJJ3mGvH37ZmAC
         ZKyY4vhaasKNOJyKeA9mYpK04zZOUhg8ILX+WzT2eh2SytztHDAe1r8/qvExAoxafhwR
         mskysRgQ7du45ZFuL6pihiqIvmMhd9ue2o/1DW1rDrBeRd6lUSclvi0ss5Y04eZQYkys
         TKhdoLF4o4gYVYbcly5PP/p4M26P0H2fw1IMf8E7j6nT8d4EeWJyNCBSSJrPJSFIn9Rl
         VeHw==
X-Gm-Message-State: AOJu0YyR/P0C2wtIofcNZtpaNGdVRyeHd1TxQfAxUzTy5B0/vasbNOlR
	wEwAI03Acckbo5ABHmvmk6bk25NDFVB0Da9fIvI=
X-Google-Smtp-Source: AGHT+IGppM3tGzEymUiuG98SnROM8wXZMsAgd+v2Tnglma2FhzcDZnsttPGrnBID7W3UQdByYtn9HbwApuPSX3zdZhk=
X-Received: by 2002:a05:6871:4391:b0:1bb:a227:7008 with SMTP id
 lv17-20020a056871439100b001bba2277008mr20401190oab.3.1698272877001; Wed, 25
 Oct 2023 15:27:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Witold Baryluk <witold.baryluk@gmail.com>
Date: Wed, 25 Oct 2023 22:27:20 +0000
Message-ID: <CAEGMnwo6RFqADPO5FRkRUNL=GfV6DY8UuwgsypEYOD3LTnXdJg@mail.gmail.com>
Subject: Re: [PATCH 10/10] [RFC] wifi: remove ipw2100/ipw2200 drivers
To: arnd@kernel.org
Cc: Larry.Finger@lwfinger.net, alexandre.belloni@bootlin.com, arnd@arndb.de, 
	claudiu.beznea@tuxon.dev, davem@davemloft.net, geert@linux-m68k.org, 
	geoff@infradead.org, gregkh@linuxfoundation.org, gregory.greenman@intel.com, 
	ilw@linux.intel.com, johannes@sipsolutions.net, kuba@kernel.org, 
	kvalo@kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-wireless@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	nicolas.ferre@microchip.com, pavel@ucw.cz, quic_jjohnson@quicinc.com, 
	stas.yakovlev@gmail.com, stf_xl@wp.pl
Content-Type: text/plain; charset="UTF-8"

> From: Arnd Bergmann <arnd@arndb.de>
>
> These two drivers were used for the earliest "Centrino" branded Intel
> laptops during the late 32-bit Pentium-M era, roughly 2003 to 2005, which
> probably makes it the most modern platform that still uses the wireless
> extension interface instead of cfg80211. Unlike the other drivers that
> are suggested for removal, this one is still officially maintained.
>
> According to Johannes Berg, there was an effort to finish the move away
> from wext in the past, but the last evidence of this that I could find
> is from commit a3caa99e6c68f ("libipw: initiate cfg80211 API conversion
> (v2)") in 2009.
>
> Link: https://lore.kernel.org/all/87fs2fgals.fsf@kernel.org/
> Cc: Stanislav Yakovlev <stas.yakovlev@gmail.com>
> Cc: Linux Wireless <ilw@linux.intel.com>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
> I'm not convinced this should be in the same set of drivers as the
> rest, since this is clearly less obsolete than the other hardware
> that I would remove support for.

I still use ipw2200 on Intel PRO/Wireless 2915ABG [Calexico2] Network
Connection card, in my IBM Thinkpad X41 (Pentium-M 1.73GHz, Centrino
platform). The laptop is rock solid, and I use it as a backup for my
other Thinkpad. In fact is sometimes preferable to more modern machines
(IMHO X41 itself is the best laptop ever made in terms of a design).

Never had really issues with WiFi on it. In terms of speed it is neither
far or slow, but does the job anyway.

Now, I do not use this laptop frequently, maybe once or twice a month.
But that is more because in I use laptops less in general these days. Not
because the machine is not usable. I have modern SSD in it, second hard
drive, two USB 3.0 ports via ExpressCard, high res 4:3 (1440x1050)
display, full disk encryption, etc.

I would really like for this driver to stay in the mainline for another 5-10
years.

I might be interested in modernizing the driver, but I have no idea how
much effort it would be (in terms of changed fraction of code). 20k LOC is
neither small or big, and not obvious (a lot of it would be unchanged),
if it is a week of work, or months of work.

I would not have an issue with removing it, and readding back if somebody
(or me) ports it, if not for re-review from scratch concerns. If I port
it, I would not be able to do re-review, 1) out of date coding standards,
2) different reviewers, 3) I would only port needed parts, and keep rest
of the driver intact, so I would not be able to really provide much
insight. So, readding after porting might be harder than keeping and
porting.

I also used in the past other drivers you are removing (zd1201, hostap,
orinoco, rndis, wl3501), but I do not have too much worry about them, as
they are ancient, and also require ancient hardware to run.


Cheers,
Witold


-- 
Witold Baryluk
