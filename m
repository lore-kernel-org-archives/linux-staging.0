Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 277B4382377
	for <linux-staging@lists.linux.dev>; Mon, 18 May 2026 05:08:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779080912; cv=none; b=IXhzjy4BwAGl4lxk1xe0z7a8Oa8S2wMeBwG9pbZ8WMP/OdflK8XkmPDuB9libOMcLKbvWkxrr1OTTmUsUW12xLRWLaL0JlMROgk6eyOfeqUGq5JhXnEUzNJ6402Vgdz9dMuR8xXcccmqUSqvCyfTVLqrzbFqvRjvZGItZoItMWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779080912; c=relaxed/simple;
	bh=+36rpvZixCz3dcHBWPHznA1fUug/+AJB870vCAqLJa0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r6VFOHJkHCm0llz0dNSzXw5wmF3zSvi1/g4RBvwKpPaRCn8PdGNtZTmMx8lmkZN5rqQvdWI8to9BHQXFmDEvxTTxFJiuXW7wN9AeIOlWtYuICtz9fWP4CEJQ4OLe4r1kDI4I8z3mtBrjW5YV7+TYQSulXw3qzJC8hokEf5BsKPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=s3TJiG+8; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="s3TJiG+8"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-45e7c636e74so271425f8f.0
        for <linux-staging@lists.linux.dev>; Sun, 17 May 2026 22:08:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779080909; x=1779685709; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DuHdrpK6dCZDNp5i65/Z1rewEsn0x2ZcutMsNSGxc+Y=;
        b=s3TJiG+87+IVjUHKzyzb7aXfnEg8pAL4AmWXTAMccllctnFIgQZW73PR5HlwSX8TYN
         MTqr0nNuhUZAzpFVyHMtCIKWM/2mzYAawD/ozsLrc2OJFIwe9sA1OqPEvWPjn3BEtq8V
         vEqBFC/GO6jPBBMlwQ3jLDrdolMjKYyMdeGHfcL9caAl5QVTecC303VeFSMbR3ZwrNPj
         7/x047ngoJpNsVA7HWgC9ZAVZv1ju5cxPIPN+DaVDMAJ6DZT0cYU0HDetpb+YdP/dAOT
         i6uVVwqRtDW6XSZZzdLar37ctqUysDbkyzOcDI7Uj9LttrzIAV2y1ylu+/AXwUYnswlb
         ajCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779080909; x=1779685709;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DuHdrpK6dCZDNp5i65/Z1rewEsn0x2ZcutMsNSGxc+Y=;
        b=WLggtCOxfzI8ypFydvSPQZ4K/qBXYQQJ1UsgGsGhYGMZatUmWttsg5JbzCuToYjPDH
         mRl2AJZKajpFgnwJY8WoGeWL15s+NQUUuFb3CKxjfUMEY678bj71cjv9kfvdT/M+UML4
         iLNa0fT/8lbKFbKL0OvkjC75xfbEWXY/xjl0yrIo5UT38+ZO1KT5nPxbaxflIPIzTSge
         oI/1jb45ZAsP7/Mh2ra+BDQ4BKhSCC5arbWHQUz83JKbSNHL55F6DtBXMhfdZwv8xeyH
         NNrOEudAz8/aKUYALqKxv79qJ08/bsmy+Ggs1i5Ph2Uar3tge60gsmyxp/m2qPz1Y08e
         jrqg==
X-Forwarded-Encrypted: i=1; AFNElJ/boRhmQ6oHcKawUVLHRgGi8UkJGyRR3vJGXqIdoFQ2154nta+Et7TyvPgMh/ErhbRdoAIQVr5YnPBPnxDc@lists.linux.dev
X-Gm-Message-State: AOJu0YwBWWZBqGCEtwUEtLBoyCP0ZQFkLNlkOS3KS+98FmhjU1jknI99
	4L+i1hpuhxyZUHVkWTpBM3jLx0k5i9GPzHYjIcHelzaai45d2z1xzOyh
X-Gm-Gg: Acq92OFoWFOqOxwKqKcnJ5wUNY2LTcHLDu8N/DI562KJsuNbvoSVKq22dxMFL5dmA+j
	PL49tHiNEbzozN9IY42FM5qmkZXL939Sr9HZMohfjRZUlqS+c+9A9Zuhd6jJ7kUM3ICdXYSSnBI
	6lO5n2CbwlUIPQHzSbZPvSG9wf0MlAPTktfIg1Xl1grDYOrJHSJl0u2gbvnqXPBv6QaHwveNWTL
	yDqZhbKTYBAIBvv2dAfPykPma0O269O2DS4JyDktX1hykQvLudeDrGUDoHwIQoW6rG03A7W8yxM
	vYU8aloip6Q6Nz+hHX365INx2W3IiiSatmb/b42heP3Jv9rcHx1uFXq8Hex3J49bACrWaXNOnve
	FlZQrdvAN/J1Tfw7eyXIZZj6Rcrd5imyhhN9DfSRRpzkSd49VzV5eLLwWp5C/7m3mHEJj22ib2N
	PeRDioQJ6Xe7aRWWM6wFR+eY606vW4EQ==
X-Received: by 2002:a05:6000:25c1:b0:43c:fb48:6856 with SMTP id ffacd0b85a97d-45e5c5af3c9mr24564453f8f.13.1779080909605;
        Sun, 17 May 2026 22:08:29 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da0a19a0csm32564625f8f.20.2026.05.17.22.08.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 22:08:29 -0700 (PDT)
Date: Mon, 18 May 2026 08:08:26 +0300
From: Dan Carpenter <error27@gmail.com>
To: Diego Fernando Mancera =?iso-8859-1?Q?G=F3mez?= <diegomancera.dev@gmail.com>
Cc: thierry.reding@kernel.org, jonathanh@nvidia.com, skomatineni@nvidia.com,
	luca.ceresoli@bootlin.com, gregkh@linuxfoundation.org,
	mchehab@kernel.org, linux-media@vger.kernel.org,
	linux-tegra@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: media: tegra-video: prefer using the BIT macro
Message-ID: <agqeyhCD9g7IjqjS@stanley.mountain>
References: <20260517060511.231437-1-diegomancera.dev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260517060511.231437-1-diegomancera.dev@gmail.com>

On Sun, May 17, 2026 at 12:05:11AM -0600, Diego Fernando Mancera Gómez wrote:
> Replace open-coded bit shifts (1 << 28) with the standard kernel BIT
> macro. This improves code uniformity, matches style guidelines, and
> prevents accidental signed overflow issues.

It doesn't prevent any "accidental signed overflow issues".

> 
> Signed-off-by: Diego Fernando Mancera Gómez <diegomancera.dev@gmail.com>
> ---
>  drivers/staging/media/tegra-video/tegra20.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/tegra-video/tegra20.c b/drivers/staging/media/tegra-video/tegra20.c
> index e513e6ccb..08fa234af 100644
> --- a/drivers/staging/media/tegra-video/tegra20.c
> +++ b/drivers/staging/media/tegra-video/tegra20.c
> @@ -177,7 +177,7 @@ enum tegra_vi_out {
>  #define       CSI_SKIP_PACKET_THRESHOLD(n)		(((n) & 0xff) << 16)
>  #define TEGRA_CSI_PIXEL_STREAM_CONTROL0(n)		(0x0018 + (n) * 0x2c)
>  #define       CSI_PP_PAD_FRAME_PAD0S			(0 << 28)
> -#define       CSI_PP_PAD_FRAME_PAD1S			(1 << 28)
> +#define       CSI_PP_PAD_FRAME_PAD1S			BIT(28)
>  #define       CSI_PP_PAD_FRAME_NOPAD			(2 << 28)

This change makes the code  less readable.  There are two bits, 28 and
29 and they mean something.  0 meand pad0, 1 means pad1, and 2 means
no pad.  The patch jumbles the pattern.

regards,
dan carpenter

