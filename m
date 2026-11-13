Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.172
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794558188;
	b=bfzpqCM7LW7Wj3GVXiDhRAkBx5hmRqdeqFN9LzLDsr69R/LaquCdixOkaejebtygD8pv
	 eEROem3X+m2BHil9Xs7SyAAHQzYjc0svmdRPVrlDbRCVkBup8Z22ppzT4K+6mrZifL710
	 pcUPRjZo/Rs2w1OC88HgtY7mEyGBqL/nm9Yx0wHH3NjJ5xAur10u7I3ssYyBt0HGpf0mq
	 3/H471GHT0C1fqqgDMk4GzM4Bo8B5BJzzxx4HDC5NirtI/GIkmrRE9OPf8MfMpMi8wAXN
	 xlFpQtXTbqlF4zmzeNe6YZJR/lBOZkLBqNo9ct162rLbt+SmKo7XHXfrIXgSSeryt5Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794558188;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=CHg5JHziHE4Jpt9n0k93J782O7ifEZ9yYJVMuZq1mrQ=;
	b=3939AP2t33AiScYjhxJPaNfCobpg2WyRDLOtR8q0sFH0apBK5aYrC3N0IcjCW3x6KEW3
	 3EZPyRgqBKm38yGfRQ0uHw8SeBvc4zZzkT8TjjdfxPH7L8VVj1rhm0G6shPspYTR3tQLb
	 zyoM2aszr+gG60Izz6OSvlo0/pHX/teYzhrkXZ30kR0Rwj5kiA2q7cLxjA7+4VMw2mM/7
	 D6w+vdtdQBryDqjbdShcz9cIyBw1SqjwaPbkcspgCbRn8oKziY6bOsqKPmnhkCGt5+eDF
	 XwR4Jht90nenwj22MKf6FK8Cls4UvKO3o248kObu/w8Rppr3dtTsnS4g/34447qXZRA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NN3iTzxN;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.172
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17C86606A338
	for <linux-staging@lists.linux.dev>; Fri, 13 Nov 2026 08:23:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 17C86606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NN3iTzxN
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-8b349d21fd1so4693727b3.2
        for <linux-staging@lists.linux.dev>; Fri, 13 Nov 2026 00:23:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794558187; cv=none;
        d=google.com; s=arc-20260327;
        b=aq4y3n9CNa0r+J8HYwtzJIdJlRhxzWEjetrqxlY24ekrZgzaqIqlamTtx7lHY+JsWF
         6hDZ9RZ4ScBBCDy8mVrbZ8dNdE6NWlT1s9/r8vq5yN0tdWPbt77rnQnBwoyKUJ1AOIsc
         Ydx6Ke0FKLMYSO3ekK7aqCI+wIvIyPTeP5992BlS3wTuwy+9Oi6rIcfz/MLr/5It/MQB
         2GsaldE+EdtRja3cbwo9Aj3MOthggKdHyHS7sewhPFPm9EI7qC9eNGNEHOVnaFWU33ov
         ogWs7rB7dAsswdDX2jIv+b4EkAngeIfPzqJcfb5xtcvUhmUIcsYwjyTCA7DWcu05R/Mc
         t+xA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CHg5JHziHE4Jpt9n0k93J782O7ifEZ9yYJVMuZq1mrQ=;
        fh=vmeZ7A/cvf+2iMGagK9fPZ/QreLtvyDR5kfdUXuJgGI=;
        b=m8uaI1rq8B1asEnp7dZfdIlpXQqlfu3ORZh/qc0XzEdKOfGco840rWXCEhHEqmFnEw
         81B8VhQSADOQn7jUCPVpl54+ADUOmN/1DfeVPLr12VzDGZVfbC+Jzb+ohWH+MzvXYRWW
         9LmBiCxlZ6wlzoyUxw5IftBFF8Y2g5Re+HVPo6XuZpxZRD/BBAQuG/kpPVM8Y6coE23F
         OLHW84m7+wHePQf/qhNqJe4BHZadpx3fz/pEhTb9EstWr0Ohqpe32XXHXJXwQ1kwrkoH
         F3fzDtX2Vts+esNoJ/2BXkj4akl3WUQGYsHPUrmgSX50MMp4tsYGGCyq2OmrWRtwqDb0
         xspA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794558187; x=1795162987; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CHg5JHziHE4Jpt9n0k93J782O7ifEZ9yYJVMuZq1mrQ=;
        b=NN3iTzxNPqQpHKE7nt/W/ZCMwAL3Oq//Y8XtbgwgZfpfEdUW6CqUhzY0zEwvXeUzoL
         Sk+PHVKPK7PmTMmM0DIJ13PDWBIBx1PchLQvCvJ77JH3tos7unfHtAnNlyWqYW2dt5Ja
         h3Gjgpg9ueG2+MoApWm7UtCilTGZsPEqNssY8QznWxcOrOT/TJCC1QmxsLLMVIUegf0A
         70goo2YDx5XZv0u9GNuVbMkcWG7dihvYI31AR/eUzg+xnD5PSmHJ8FjW1H8JUgJ4ofsw
         SVCNEnyoUSjq02CqtiqoO23cZf5DrFvoNwH1E2jf9zqoIByehPRlA5LpZiyka4nbo3jF
         DAWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794558187; x=1795162987;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CHg5JHziHE4Jpt9n0k93J782O7ifEZ9yYJVMuZq1mrQ=;
        b=rCsDSrT+LaLYcveZo3A+w32Apg+Gl+y80N5zOcrX8iYGqjtJ2pLL5VFap2BgdaKyyX
         qvQZOP95DuAai7YquVoPTTl4NPW6oXusOioG1Fd2J7d6k+H+647Ot9Vf4HINrS4A1sdN
         p2gs6+unOVPH1G0WFES2uySrWr04n4R3YPO1Z5leqAzocizlauoK+0H276TrG+Oe9BDj
         QW3olz6bBSpl0qhzLfR1nsVIQnOCDjt9cfyIei//bI4lk/V+jRGoV9rEh2NODBByn/0H
         XUpwb+LJipu5QplGan8CyO7sACJqTE40ldLCpRLE+qChVcq+DzeJygZ80pYsTgozbSFG
         mR6A==
X-Forwarded-Encrypted: i=1; AL+hErG2WVUiSKCw3io3Ja7cnJ6M9KmIIlqvg3iDeYTCET8mkxFlrbcHGs4xVwOT+O8fc+1ZF5uMx9QRsKUk8Ho0@lists.linux.dev
X-Gm-Message-State: APuU4Z8RyUrmRt2ujrDVIRd0sCPC+A30IZMJ3O3+IWonZkPkszoPLlBC
	FRTTBxLl676RA7qZ5l+yldXADkePlXE5vlB4oggQ3bkMDIwEb22so78nrSk5cNs87C2rqyYIcdU
	yV92nEqYETGOFONERhmhdVXQOgaFvSWk=
X-Gm-Gg: AYBFou2kscMroWCRx+8Olv72QpNj+xR00+0puovQp95JsP2drTAGdqzQrgGj2i9hfT0
	kwIT8S2ZCd6BKsPbUvXyAs3vpt/wduL5ZBOD7YDFobtLTklNeK0fTZpydW5AnDVPmrw27LWaPKN
	U2DnxFA+MVnf0/RKN2STiDrmU+WtfFFkwHoGebaOkV0b8NZAAhPtgMv034ZjMXBJA561LQlUGwN
	1ssvCoCXZaVvNef9PppQZkfuF2Mtg+DYHRnfnuhXNRyErsXdjKqP87MMClTP2QqvhGnwAD/uteY
	kozDgPmHTA6/eSSc2GsMIIiZ5btSYvkM9HkEQPki/z5B0C4+dnjVlTc71tgmeISbTWBrSvAqrTl
	/zr6fGzKi6UwxC6ZV06Pk48uM5a2gWTCEl/n6hBPqh0x1UrdVuT5qz4IpRq6S4zKnSWUGhntbc9
	yUAfqPMeSdwhg2PjImfUXWQHLb37xB5TVMeucA22/WGqNfYE3tar5xzA7eWLkuQwaZ88jcTLmTR
	CTyy7cvYPZPKkdHSmvd5ylsIRC4xP4r/Ttn086N+ImOyLJbnxIfjTEJaZ5C+Q==
X-Received: by 2002:a05:690c:a923:10b0:8b3:2c71:b338 with SMTP id
 00721157ae682-8b4aa33e3b6mr8947087b3.82.1794558187196; Fri, 13 Nov 2026
 00:23:07 -0800 (PST)
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261112164642.38692-1-hmjm081106@gmail.com>
In-Reply-To: <20261112164642.38692-1-hmjm081106@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 13 Nov 2026 10:22:30 +0200
X-Gm-Features: AclHuK9gEreXQTMuEgxDO8HwoqRpAAdAWE2GTFJcD6vpcMJ_zpISOrJRwj1DDhI
Message-ID: <CAHp75Vczc7pg5SaBw++eTbca6jo8nWjTBfOaEmmF6Q4Lnd1j+Q@mail.gmail.com>
Subject: Re: [PATCH v2] staging: media: atomisp: Remove unneeded return statements
To: Hezekiah Mogere Joseph Mayaka <hmjm081106@gmail.com>
Cc: Andy Shevchenko <andy@kernel.org>, Hans de Goede <hansg@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 12, 2026 at 6:47=E2=80=AFPM Hezekiah Mogere Joseph Mayaka
<hmjm081106@gmail.com> wrote:
>
> Remove the bare return statements at the end of void functions
> throughout the driver, along with the blank lines before them. They
> have no effect and checkpatch.pl warns about them:
>
>   WARNING: void function return statements are not generally useful

Reviewed-by: Andy Shevchenko <andy@kernel.org>

Not that this is a really required patch for the current state of the
driver as a whole, but let's process it to avoid new patches like this
again and again.


--=20
With Best Regards,
Andy Shevchenko
