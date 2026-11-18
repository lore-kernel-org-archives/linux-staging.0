Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794992431;
	b=inYWu4v/LwPPM4BAl2Gp7f6UJnsY36poZC5noRZ1GU82IPoXPPIwTLPCUi65EX4rEa5A
	 eCaqiCqGrndjH7CXG6wBczsaxu5jkH5+9Vcb0JrfcOTatiBv4kj/re/Qs0/iiSY8595pM
	 QGqcJ/53VeZMphNewmQN0MtCp25A3R62nJkrjQuAc5niZPpyim59TIz5kUZRPfsBbe/kD
	 V/4P0oRZMW8uU19BBjBudH8WM+M4ZPcl8HgJt5jdJCNS2aIW+qQmc3EYzizDCX54GVlcK
	 qtA8ceoYOOhxZDV0a3HrRvYb5urzs3y5eW2tPwuuRivyVBQQUEv7vg8Gov/8fhLQ1AA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794992431;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=1J9aLUOWfs4AT7gYXjQA1mkmgTZ5ck2P77/Iu/xB0LM=;
	b=SKpkKhTLl4vzyh9HN5w6nWMDJXI5WYgREmvm559+1mEenZHaC6iD+OdRvoq0LbXHsF6R
	 mYzgbrn6VGYUorHPbeLGX2WuMhgs6SQpHz0Ys+/0m7v3xxBtwbmuqllxZBYHOlN9svdSz
	 FsVpHxqkVLLxpPxEPDzNWXpkbEpTC7GxHaUolI2p5wUj3NMyJzMauBmsfB9ckwb/lbhS7
	 nfKUpkasWfVw4YvllNYYD4QnO1XxtZmNR59F6lIxbeirlCuIHBHYtzhn/Vt9OPwo8tj3a
	 TpaL4zXk9DK5uwoc5GFEU4cEFsC741flJ8TybXI6vYUvA1z2F7hdVMWRiyjrUsHb2Vg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CzSv65Ka;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 507A7606A32A
	for <linux-staging@lists.linux.dev>; Wed, 18 Nov 2026 09:00:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 507A7606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CzSv65Ka
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4bb6c7b6dbdso11086255e9.0
        for <linux-staging@lists.linux.dev>; Wed, 18 Nov 2026 01:00:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794992430; x=1795597230; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1J9aLUOWfs4AT7gYXjQA1mkmgTZ5ck2P77/Iu/xB0LM=;
        b=CzSv65Karo5uEvXH1vytUbFVcHGov8B0gB+qyZ2rZm5Pa0RyL47HRtN9lopbONyEpi
         xstvKWbsDMnSseb28gXgVhTsrPQDPIv+jO3Gvp+2tiIpcXq/vOdeSaMBhgNaadeb01Zx
         jbzBAUcFDNEXBsxUMGiTJV7xUdbD81ehZes3VbbzOItzUmXbkZFNgtlId7Bo1LxBWFwz
         lwSMTxNrW78zxhGsN5jDJY25yYsZp4k5JexaBlHayYiUMI6BeYf1J+ePTcYTcWn+QT4H
         knnMubTrh+tKqlLonH64LEoBhFbQW+0cKCNP+XcgwUgwUtlYGUUkRwfdPz8+7mLZFjrc
         rYYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794992430; x=1795597230;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=1J9aLUOWfs4AT7gYXjQA1mkmgTZ5ck2P77/Iu/xB0LM=;
        b=J5g42K8FaozWoXUnxI3+Qknuqs6Z5demcT0Cw3N9u2ETXvtcFmK/bGlDdPdld6ND8V
         Bj9yEGHiIrp4Fh68LWVov0cqITjPKCZL8gkn732diATLEEnadRfe+SDCO7Ay+8W4iAqX
         EWoN41fNxdJASuXTB3ojLAUFZ/iujssrtkXuK4PiahvkSUTF2vhGVSsd7D15++2YENCq
         GrRgjtHimTfTQqU5zu9w2K46VEubWo9Q+qTWjhDRHmgXMmSJpO1DrhQamSkMYxjff15f
         spGEerQX+/UoezvVowMSdsFTrjM1Wj5PMglDCkB1pgDDzY1ck1IGTMjZQNDUhxP3FIyW
         Z5Yg==
X-Forwarded-Encrypted: i=1; AL+hErF6FcnnzrqoVGQ6GINK+rcfszL/3aXz9D/XJidcu7rKJj+hvOTUY1r3Cb9Dwm7GBxs1jXiCtUsjAC18rQVg@lists.linux.dev
X-Gm-Message-State: APuU4Z+TQXKAFwFSmRwkjg5jIztaOHn25rIwa+KoH0Jq4AAyOPdff1Sl
	NMv6pvau9kbWB4cOzy/dqX9jAtScDCHcr4VGKh0SyGEtS9yvPwq6PgAU
X-Gm-Gg: AYBFou1rHIM2j42u+xXFbL0eLp+7bKubBTS2ofc851QWJKwzMxmnXXwIvqrN1a71Ulf
	qfzMgmwWCHTIPIt6CXfGk2EAVfNRiv0QP9YIT0yH9ZdC4B/5cULnQ/7Vl3yFbX52nPzxTrt/NH4
	s+7lluvoKoWY4yyzJImv4TpkLhCuEoyRF14mbO6gdBcVbe/SnBYJ1imWiCDrBC1BGeYwNHVRMLI
	RGlp2gp4R/Jhx9kVtKCUZFh64ZfoQM7/0Qaf4HbDKZUVQYj4iIVGnoLI+kM1aSgAynN53k/7l/2
	yBEH2H8XL+MQmjxlJzbyeJ/0igcUEJMCwtdxSPC3DdzGcWMv6QUjod++n/2l3GWepSH6FYVC1in
	ua6q3Me4VL8Wq/mfnS7m5v9ng5iqgNz1hideamcNY+PbwKSspYIZQLRvbiKO29LAATNcqCdbTIv
	Dv9/iqpMCYH+8bqbJYd90mvEyXHsE9+bP+NxBXPhFAcxGZuE9MXxAt+hwbF71Y+hPmF4zpcUTRV
	66tE2BIX8dpYoLgNljyotMWR8UDy8YdYkL1egKgB5pq+2QgIvnyxwSTQucFsIOc3hYazerhr/Y9
	eVQCwVmmXwEJvZhUWv59540qFO8OPgGNuwTD+MnO9nG7vXmA1H2iDEIFmni/Y8GJzroF6bWTLDk
	Tl0cNSrGdLTB6tO1ezWQ6jqzy35D9GE8aPIHOQIUfEHEl3b/LY8s6
X-Received: by 2002:a05:600c:4e11:b0:4bb:6a2d:b438 with SMTP id 5b1f17b1804b1-4bb7d578be5mr38973015e9.0.1794992429444;
        Wed, 18 Nov 2026 01:00:29 -0800 (PST)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb783f8220sm126529375e9.5.2026.11.18.01.00.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 01:00:28 -0800 (PST)
Date: Wed, 18 Nov 2026 12:00:20 +0300
From: Dan Carpenter <error27@gmail.com>
To: Garrett Floyd <garrettfloyd345@hotmail.com>
Cc: Vaibhav Agarwal <vaibhav.sr@gmail.com>,
	Mark Greer <mgreer@animalcreek.com>,
	Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: greybus: audio: add size enforcement to name
 prefix in topology
Message-ID: <av1pJIssLeNxZiIS@stanley.mountain>
References: <DS4PPF67BA2A7859950C09372FE7397AAAFE67A2@DS4PPF67BA2A785.NAMP223.PROD.OUTLOOK.COM>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DS4PPF67BA2A7859950C09372FE7397AAAFE67A2@DS4PPF67BA2A785.NAMP223.PROD.OUTLOOK.COM>

On Tue, Nov 17, 2026 at 08:44:33PM -0700, Garrett Floyd wrote:
> Copied name for certain functions can be 32 bytes, but destination is
> also only 32 bytes. After adding prefix, name may be truncated, causing
> compiler warning from -Wformat-truncation.
> 
> drivers/staging/greybus/audio_topology.c: In function ‘gbaudio_tplg_process_kcontrols’:
> drivers/staging/greybus/audio_topology.c:1172:65: warning: ‘%s’ directive output may be truncated writing up to 31 bytes into a region of size between 17 and 27 [-Wformat-truncation=]
> drivers/staging/greybus/audio_topology.c: In function ‘gbaudio_tplg_create_widget’:
> drivers/staging/greybus/audio_topology.c:1090:51: warning: ‘%s’ directive output may be truncated writing up to 31 bytes into a region of size between 17 and 27 [-Wformat-truncation=]

Just ignore this warning.  It's stupid.

We're using snprintf() as a belt and suspenders approach to preventing
buffer overflows.  If it gets truncated that's fine.  Great even.

The fix is to disable stupid warnings from W=1.

regards,
dan carpenter

