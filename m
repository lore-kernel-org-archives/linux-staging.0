Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74A408460
	for <linux-staging@lists.linux.dev>; Mon,  1 Dec 2025 16:50:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764607813; cv=none; b=aAydMYlxgMP4zhRLSnp5E6IjIszwxNKztaTjVGtPxouVxr3an1JNUkI2VPljglcGC9bVwaffGJV0zMXnpRRWgz2E2nxaovooyBbXzobuc0LXtl2lWaQd3oHYtaXOGxd/ZbjYz1NLykDvSlokfsxz2wBBhTQt/l7mmn1CF9AbBPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764607813; c=relaxed/simple;
	bh=IUlk0RiWKxSC9MBdv7RzX66VzV1ziNlZBBwLEjUPeGc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hGQvhfZyUi9DZ3ZsaBU39ouTnM9ccWE00HjW2ZTeen5eV7mZX9box8eBbEAbc5KLsXlb1WIrldXkgyHCKNo0H3j819JGFlbSwOxBoOfpD4DvBXeqz+jo5kLxTeTXdB/b9/7ZQx8ewX4en3tsYFqTcPB7CUCLU4pkhFKLwuRssXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EkH9fFol; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EkH9fFol"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-7bf0ad0cb87so5335739b3a.2
        for <linux-staging@lists.linux.dev>; Mon, 01 Dec 2025 08:50:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764607812; x=1765212612; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AvcNEhDuLn+vatCl0I6V6UWZc4kOmAdKBr1H/K66C/s=;
        b=EkH9fFolkavDWsviXIfjmRqVx+qgEVQdj4RgN+YtH9jtKM2BBMjhgu3T5IccA3snL8
         aB+YWZatNwseeQJewNEcaREZC5BNv3TlPBTnXbuPT6EqFJhoPcgOkfOVyYRy+CPHn0TQ
         zvmgAyE6S8DmCoSrZRgP7y17WdXz8K00p/DVdvwHenUBjRimprunqcIvYg0PpO3fDjLG
         5IaR5/Md0CPQPa5/Sn5al1Yw0F8APwtr1W8rrgr2kJj+mY7phC5ctKe3lCHBE+fxf8F5
         +Z7holFdpyTJ5ssmSqM+vEIL0hV8kFzAnSYrWcM2ptdxuxmJVKnuGBEnyKOVkyicd+Nc
         6fhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764607812; x=1765212612;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AvcNEhDuLn+vatCl0I6V6UWZc4kOmAdKBr1H/K66C/s=;
        b=MK3VJQtydO1SUF4at5B6YgJJjCovWICDNi6Yd3Bd+R6MCy4+bzslzSIrJxPeYToHM4
         udfyW8tYezlPl7M1LeH3MnlSTM5ddqwR3nZCd/QIFORHQP6N/AiJq7+2Monj9EjYfqfx
         jBqw47MsLGE3kU9L7jJK2gbRiqDk/g7wThyl3UoGKi+OvicF8SIRdc9YmO+H5pxAvtX2
         At5SCI1mKNhsULe65VLBfL4uSr90xzRGh102hsMc9ZpqADomtNpqjexnGVTpRAP1LBNR
         f+fr+jeKPUNB0fFK5UfXmOU+VVUXJSt5BNmH1DXnkzq+P9XLUaiTs/VH0zPfMn/BTHKB
         Qynw==
X-Forwarded-Encrypted: i=1; AJvYcCX0+smZuC2pa3Rc0wSD6pT0yLZB9/FunU9adyEIKCaGGohacvB+gL8gEweaf+l3fyol9rawXQf8lM1y+e7Y@lists.linux.dev
X-Gm-Message-State: AOJu0Yxf0o/81gI6J+txYK5zLwkjaaYtmB1yYP7DZiWcXCpuhBm8dJvf
	N7+FkiBWCJcHXAZEo/pk4XBtHCP2UcX/sRPugdyAEMfBzmIt+yNrWIgj
X-Gm-Gg: ASbGncs73dXLr2kPChti97wPkmZ0Xo9BXWdSw+hiy/cRtc0AMZ+GPcFPH5wLN9lyTL3
	8/J/5G1m8nMFMEo3vNZlE6YL3VobHPm24gpMR83CbgFGBHHPHKbed6vhW3vURtIV4npj49dCQGB
	QR41sn7j5hHHqE7Q6kA1m9tIaz8RHsJhk16SxmPIDNIatQmaD4I9T0tN0/JPMOhF6xxsnbX8kFN
	hQdnzY4lP+zEs6w9MQBxc5jqVA2ThRqjI3c4/AMEWL6iwd+UYO/9tbtijzOxvsghyGd0eNuQz1F
	Kvz2/s4JHKXjw5fIDrukoIsjEStOrCtSYbEKeSJgvO8T5/eIpUS3q7KrbWLcTeX8wFR9vKZD4ak
	8+48oFfqk1f2FScRlDvxujX6aRvu+2i05F4IfKMRdu9Xp3b32pLjSjRxpQgDjI5Z1AZpTlUjzHY
	yCGsP7vT/E9zn8nK/3n5w=
X-Google-Smtp-Source: AGHT+IFcfYv1UvAfJ30K/d1C60sHdw3nK5lXHBFrmebJunXpq41W40Vmml5aKdrUUQvWkwvikceKYg==
X-Received: by 2002:a05:7022:692:b0:119:e569:f60d with SMTP id a92af1059eb24-11c9d60e3ebmr23373511c88.6.1764607811566;
        Mon, 01 Dec 2025 08:50:11 -0800 (PST)
Received: from localhost ([2804:30c:941:4500:2e30:10b5:73b0:4b74])
        by smtp.gmail.com with UTF8SMTPSA id a92af1059eb24-11dcb04a07bsm61594077c88.7.2025.12.01.08.50.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Dec 2025 08:50:10 -0800 (PST)
Date: Mon, 1 Dec 2025 13:51:43 -0300
From: Marcelo Schmitt <marcelo.schmitt1@gmail.com>
To: Jonathan Cameron <jonathan.cameron@huawei.com>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <noname.nuno@gmail.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Shi Hao <i.shihao.999@gmail.com>, Michael.Hennerich@analog.com,
	lars@metafoo.de, dlechner@baylibre.com, nuno.sa@analog.com,
	andy@kernel.org, gregkh@linuxfoundation.org,
	linux-iio@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: iio: adt7316: replace sprintf() with
 sysfs_emit()
Message-ID: <aS3HnzzrfgmerZ-m@debian-BULLSEYE-live-builder-AMD64>
References: <20251116101620.25277-1-i.shihao.999@gmail.com>
 <CAHp75VdY7W8EgOfKuxtTALj777aVatxV5dqsxm688JTy=iVW2Q@mail.gmail.com>
 <20251116152800.4c1849cc@jic23-huawei>
 <34a55901fe0729145097d287a98746f23eea13d8.camel@gmail.com>
 <CAHp75VejBvRX=5psgVgGPCsKk7gVgcDUd1q3Gn+4_jyzk=2pEw@mail.gmail.com>
 <20251119145751.00003a9c@huawei.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251119145751.00003a9c@huawei.com>

On 11/19, Jonathan Cameron wrote:
> On Tue, 18 Nov 2025 14:10:25 +0200
> Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
> 
> > On Tue, Nov 18, 2025 at 10:17 AM Nuno Sá <noname.nuno@gmail.com> wrote:
> > > On Sun, 2025-11-16 at 15:28 +0000, Jonathan Cameron wrote:  
> > > > On Sun, 16 Nov 2025 13:08:07 +0200
> > > > Andy Shevchenko <andy.shevchenko@gmail.com> wrote:  
> > 
> > ...
> > 
> > > > Applied, but I will note that this driver is a long way from suitable
> > > > for moving out of staging and I would be surprised if more than
> > > > one or two of the lines changed in this patch make it through the
> > > > necessary refactors (should anyone actually have another go at
> > > > doing them).  Anyhow, I still think this is worth taking just to
> > > > reduce the noise of remaining instances of this.
> > > >
> > > > I'd have deleted this long ago except I actually have one somewhere
> > > > and it one of the supported parts was still listed as suitable for
> > > > new designs when I checked not long ago.  
> > >
> > > Seems to be now "just" in production. So no longer advised for new designs. I gave a
> > > quick look and this is far from being a simple driver. It would require a fair amount
> > > of work to bring it out of staging. So, are there users relying on staging drivers?  
> > 
> > If there is no choice, yes. For example FBTFT is famous for being used
> > by IoT / DIY _a lot_. Currently a bit less since we got tinyDRM
> > subsystem with most popular drivers reimplemented there.
> > 
> > > But I would assume that for staging we are still free to drop support it?  
> > 
> > At any level, we are still free to drop :-) Just different conditions
> > applied. For staging is basically an "effective immediately" case.
> > 
> 
> If no one replies to this thread in next few weeks to say otherwise, let us see
> if anyone objects to patches. I'll spin a series in a few weeks and they can sit
> in linux-next for most of the cycle to see anyone notices.  It is easy to bring
> drivers back if turns out anyone cares and then there is some motivation to
> finally clean them up.
> 
> staging/iio/
> 	accel/adis16203 is production
> 	adc/ad7816 is production (7817, 7818) - the 7816 itself is obsolete.
> 	addac/adt7316 is production (what we are discussing here)
> 	frequency/ad9832 + ad9835 are production
> 	frequency/ad9833 etc are production
> 	impedance/ad5933 + ad5934 are production
This one is an old pending task of mine. I want to finish that. IIRC, the only
thing holding that from graduation was lack of conclusive testing from my side.
I still have the eval board for that. Luckily, I shall have some vacation time
at the end of the year :)

Thanks,
Marcelo
