Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792562664;
	b=kS2nmWWWwZzACiIh6hkVChfKpsnuVVI/jT6tgMT0T6kupERUpXS2lXLfflEF1+n3AqrD
	 7eAwIMJZWiiEpcWmTQn+4UIznjNOQUSCfqQYfvSmfJ2eX4SxzaYwQHlc0ogo3fj6rUyR4
	 wJWjcUb4wU/Gkzu/FUnAi8lIZ7xIpC3W0u0/Yyn88eiJsCH7uKOfYxhNSJEyASaizCRPP
	 NSDo7xhPxvOVXgN9B102xQKPi4DjyJQzAihIMtNY6lu9Xwsh7YEHOxIIDn/Xxon0RTA4n
	 tQ9ClEU0a7MdrQ9QcCTg6e3ICTl9RRXB9i6Vmhen4oGrPYPlcaUFyCilycxPvCdbZyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792562664;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=9eZU8moXQGAcGHZP9eqMMJfUyCPJT8Jq29uwh/HfL1g=;
	b=ZvyGQHSet7LJ9KoSHb3yIMxBQuR/dymqYk0vAnInwTQ3cpPuNui4E4ny3stFGVe8jQ4H
	 utNrqosvkKs56vKyJh/AnwZQY4XedYSj+6u8tP1+Jh6VigZ9T5Da4AzfVxoPo453eJ3dv
	 5em1cYHzWI02r7rmReNH3SjiOdkyBF7IfryInLgpY15sIATa28zSI9oE6EXfc1+nQwaWb
	 z+pQCT3da0PoPuCcBCBt1NTjQTaAPmBIy01HiB69XVr6qgodICLamdah2yUGBgObzW8Sp
	 LwAIKeGDpN7zxt/93b3mKxI19rys9WoVtvnbXWYkPTdjq5n5+Rau6C92gKnL0kYCY6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=IAKK9Rgj;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 234FD606A31E
	for <linux-staging@lists.linux.dev>; Wed, 21 Oct 2026 06:04:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 234FD606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=IAKK9Rgj
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-49d0da752ffso2068505e9.3
        for <linux-staging@lists.linux.dev>; Tue, 20 Oct 2026 23:04:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792562662; x=1793167462; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9eZU8moXQGAcGHZP9eqMMJfUyCPJT8Jq29uwh/HfL1g=;
        b=IAKK9RgjAKiD/QjKa8BIL0SmzoGwEy2ZovxLpnxQjG7C+57Od2kZ1gdT+DEZ9NJab6
         uFMuEgm08cTF+XFRGe88fO6YULNU8PjeyO1dzmXDDLK8uFEAyW1jjRw7gPxAwGp42b3L
         7gaVWE46v4cyj9jQfguZzHe+zqiJBmPaTYgxGuG4CyZZBfu4T/b4EcIbX5qhdReUZVBl
         Z/iV5xI5xN9/UFzNgWTsWvP6MnM9Emjr7rl+tGPtpBgv+Qkp6vmW/11kzszoeLrk1KNn
         fbFGy2Q0v/ZBkN/A3Uk50fKTUJ8VqPLDbyHIDpB5aVYRwR/WQS0r88hlGG7oiRsnezpx
         CyRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792562662; x=1793167462;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9eZU8moXQGAcGHZP9eqMMJfUyCPJT8Jq29uwh/HfL1g=;
        b=AgPrpS+8GHndv9w0oSoIsYVUuYpA6S0X1/Lx0rS5l8ZPcPMI/w0cdcvKfHNtEJrXAv
         Okr/7Dr/VUERmBFYpbATkZJixKquw0DGmA4VzHhTKIigadBex+Uv6KeM8+W2RwIoToA+
         uCfm1A6N40afM79KYIuPQnydlAqfiP8rxALSfgIlz02V0YZPtGkzKSU1BDU36/qpV28T
         6KcWndyIl8iQT3wn1raHJsM/vSzOcyyO+ei1zvY/8UgXyzCw4L12te9EtP/i+dKXfPgX
         2QgSrMQQTixrGZnP8UcU91bBdqe6UWcubLviUEkQTUZqHMmVovxtiRvwmf6idsrjNsxg
         d57A==
X-Forwarded-Encrypted: i=1; AKwUvBxOhF6xZB8he2lbpv1MMFor2v03q/rVCeHaCIzJ7nRNrp/47UnZKYU38tP0lplJmDkzW+DfNOPqVY8KI2M6@lists.linux.dev
X-Gm-Message-State: AFq9FYKqcfPQu1RS6fkc4gJNL210ri1qYzLXMr8fw3yXJktHoKJ2fYek
	EGP8Rv5bIOSIVVmCWdGjD4pJ6grrtbztp9g6FDZbF2xUJhvVr7lQBmaw
X-Gm-Gg: AYBFou1iwO1ICUdqxhrGUsAu6eswtYtaemOinNhwcP9rN8bkfO+J/RPwILlJpidEhYL
	MVYsmA8WQbqUM/h9p+QYI3kwpSZU26oUr2+ywAvqHR3e2nDP722fYnvLoqOQ109i8BPIHPilA9Q
	VNZwsnVqp4Mnfe9KjyEj7Hm0HAwKh+pfMJVaG2sAhP3tv0vy2CEbFz6CpXJMgNIGNUDaNdOXDwK
	WPrz+t77U+4OVztfpZu2vDJ5eksxXpzf2Qi/Jat68ZRRh+p7NjyDJVekuy+oOp8mH8gs6Wb74uq
	vOCJJeOTYIr2w4yrr/cnp5LK/w6FsD6mY+DVRXrnhey7IZwq6ymBIt9o/TPbqmn4NZBhniDnZfH
	gI31+lZBvac2n2ADIavUQwMkzFB4QRt4YU8AVGYSNF2uadzLgLnres7UHEOV7r95L1v3XeLKQaF
	MBCgNCaLA/lKR0sbHWN+K0nvzZo8D8ga/GM76rkYQ+iB5US+dtkWdkj3RRjzFW4tw63bVqvqoBo
	6NlJwQ0uefj9QMBeq8HUze6QLBBWh7h+cxLKtG3G4sFYABC3vzg
X-Received: by 2002:a05:600d:82ea:b0:4a0:a34:6e7d with SMTP id 5b1f17b1804b1-4a1fdb0ab43mr18170835e9.18.1792562662120;
        Tue, 20 Oct 2026 23:04:22 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1fcd2eff9sm28339855e9.4.2026.10.20.23.04.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 23:04:21 -0700 (PDT)
Date: Wed, 21 Oct 2026 09:04:18 +0300
From: Dan Carpenter <error27@gmail.com>
To: LiuJunyuan <2058432396@qq.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: vme_user: handle zero image size in read/write
Message-ID: <athV4vUa3aZDDlAX@stanley.mountain>
References: <tencent_FE0C25ACDF20A06CBFD0651E7C4ECD7E5009@qq.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tencent_FE0C25ACDF20A06CBFD0651E7C4ECD7E5009@qq.com>

We removed the requirement that AI patches need to a special tag.

Generally, staging is just for practice writing code so it doesn't
make sense to use AI, but I was asking Greg to merge AI security fixes
like this so we'll see how persuasive I was.  :)  The vme_user code is
full of way more serious security issues and probably we should just
delete it.

regards,
dan carpenter

