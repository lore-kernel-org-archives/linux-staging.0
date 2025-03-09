Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A3EA33F9
	for <linux-staging@lists.linux.dev>; Sun,  9 Mar 2025 05:48:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741499336; cv=none; b=KYfGAatyqWoysoUyj0bx5yBQNsFectb5rrnMMLcjSxyLgqm6TXdRiKBSCMIkKMu/EvawzQUxXPSas+Ye1eCYbwUEu0PYAt00hSCJe0VQsdET7GJcb23pwOwQIhc27dBksaNRzT85yTodfEB5llIvxD4ZSEoEVJmaceftDqhTeMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741499336; c=relaxed/simple;
	bh=0+vUFsq883gp4a88Om3aIZZNxVbvT/09ZAgkqJiFKhE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=K/xmCKwpY/6JS50UKv7IBZnv+qIwdS54rb6geUnUgGitVd4JA8uoDGCg5MQrzPG8z3+77xB4oA82RmgLmw8Mp31kuKvAslE0SvevxAZQ0aGdlMlWM4QafGrJ943F+fFrKdY4ot4WCaMS7NiW+DAr93yOPC3Zbx7h6hlBxlPw0Xg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z9g0QUDL; arc=none smtp.client-ip=209.85.219.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z9g0QUDL"
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-e60f212fee7so2397521276.1
        for <linux-staging@lists.linux.dev>; Sat, 08 Mar 2025 21:48:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741499334; x=1742104134; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0+vUFsq883gp4a88Om3aIZZNxVbvT/09ZAgkqJiFKhE=;
        b=Z9g0QUDLW7ZnfeotnX/4AE+6CwxDwVk+0xHOE3YTqfs2I/XDpdJQVlJw4vIYGaogfb
         WbZAMEk+qe45WfzRUu2LI5YLWSKLKnUZ89RC62cD0P7iqKauP8KIvpM2a5przG8jejBi
         /svb3qLU/HPY1yFfpAOb52lnUAb/7cl0if0Jf50sPKRBsHY4PINq8gVZEHYLPgDiAxcK
         lqvrjd6LYHRA+D4UIFKMKddrxTtfecCCf/38hmuqrt+ru7o6wEBzojZe09+KsJ8Xe1ep
         zg4BvI2v+z4q9xZsPKVdt4JgPKX6RPETeHRin+qF5xJYi7WFhRUtzlYbKTGHV8W1MjMe
         mnsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741499334; x=1742104134;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0+vUFsq883gp4a88Om3aIZZNxVbvT/09ZAgkqJiFKhE=;
        b=C5IY72pPX9IfL1OoNKUTkgLtmdQAE0n+QafE2yqUTjr6v0LVaHpIAReMfdNm9kng+2
         Engs8OGS48ZbDbOoYtDPSq7Jx3p6WLg8qp2ALBVUqBQZa6sDcxgtbPdvGSqZUGqKRF2x
         8exjGPo0aep6PHFh/zqDUoCEKW8z49cby2Rkkz9eA1Jwx57hHCR01EQ41UtvtZL7PjI3
         wFaswKNXCM8PACWHj/AV+w/Ip2dOVsemBQguvmTDIUeN9QvX67HC7cAVDjoQpkgrg9h7
         KMsEvcaLiYBvW5KrbR5F6iWRyGh1SDsH/kbcoqslvbmygDpk7Aqy6gk4O+dCxxL8j8PS
         WD+w==
X-Forwarded-Encrypted: i=1; AJvYcCX+j0MgPKiEsekir1Na1AEkTvjY99D6v9DhKudJZ/eH+saIEOBEtSe73JY5pCuj/jvAy+HfgynQrn9xeGpz@lists.linux.dev
X-Gm-Message-State: AOJu0YwV5JjgFjNTxk5iQClak5ST0KETIOPOzdRjYo4AwJ63+y9fdfl+
	nz3uTe+lkJVBzJHPNO/ouhJHINOovU0DUlOMRFcyUrHJCxCb4+3O0sIy8YeNFc+5c6zXlHB6xja
	QnxYpkHuVClZe9uq3Oj0YFLSLric=
X-Gm-Gg: ASbGncuteQ4q3heKjwU6b0nW5XEwyjb2C9CDp7dU8sDx2U1aNgk6iEqJ1DqMSjb4T8D
	KtLNpPu1yBFyKvL0yFZCLYZuRMCOQSlCGXKgrSbbokZf6z9FNt16vGc7Wwd1/fOjhNMrjIFkCy5
	xJr+b1y+q20DPCimo3JPrGeA==
X-Google-Smtp-Source: AGHT+IGkM54VeRWhECXsPDF52IJ3lObNKFVMQZNCzIi+4MVCGhChHnkm7xcYx4R3VwX820vnJT8hwqDQG3epj7DrCI4=
X-Received: by 2002:a05:6902:1201:b0:e57:87b3:d2e0 with SMTP id
 3f1490d57ef6-e635c10191cmr13060935276.3.1741499334070; Sat, 08 Mar 2025
 21:48:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250305155712.49833-2-simeddon@gmail.com> <20250308144357.20f24fa6@jic23-huawei>
 <20250308144944.668d79b5@jic23-huawei>
In-Reply-To: <20250308144944.668d79b5@jic23-huawei>
From: Siddharth Menon <simeddon@gmail.com>
Date: Sun, 9 Mar 2025 11:18:18 +0530
X-Gm-Features: AQ5f1Jr8iMs5wRpKB_SDTiXKTS02-KTePjS_i1SGrxVLXCES9nMY-YEBd4G5tA0
Message-ID: <CAGd6pzO492FA4bijFgkGvusrbqo2mkT=kpkY150Xg-nMfHrpZw@mail.gmail.com>
Subject: Re: [PATCH 0/2] iio: accel: adis16203: cleanup and standardization
To: Jonathan Cameron <jic23@kernel.org>
Cc: linux-iio@vger.kernel.org, marcelo.schmitt1@gmail.com, 
	gregkh@linuxfoundation.org, lars@metafoo.de, Michael.Hennerich@analog.com, 
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 8 Mar 2025 at 20:19, Jonathan Cameron <jic23@kernel.org> wrote:
>
> > I'm not going to apply these because I think you correct
> > identified that the device support should just be added
> > to the adis16201 driver and this one dropped.
> > Good thing you were more awake on this than me ;)
> >
> Sorry - wrong person.

Well, I=E2=80=99ll assume these won't be getting applied.

Siddharth Menon
