Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 719343B5846
	for <linux-staging@lists.linux.dev>; Mon,  9 Mar 2026 14:03:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773065023; cv=pass; b=qsnZrN4AGgyPhJdNrBgCvasUc4ppy33NQjmaoi2SADNwuivuR3T09y2iH4FaOStVN7PP+hkGcTr9jMgMTv0mdSiBcpSEJY8mHoaOQeZbSKEooPBYhgRIJE9CPtokfhQaU0G4Mcn8GKnMl/kq/pb1xPELxjgGHPvsK79D1vyYDI8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773065023; c=relaxed/simple;
	bh=1WBg+LaRUHKZOalid4XJKFAzNKMOVMNajaJlFN8XFAQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=c/KJWflrr8ZpmsQzO2YWvWyuedyKqm9RLlU8eXqJQuby2KKP8maoU4uIMxAJbOeer6sIKTzobTtL8ZjhERJKDBCQI31GantquKGc/uzvo8uyoDsbrt3pdHuYnRBEE+A41JS/+FljrWCw3U9tNqc5WKp6R64mUBVo9/yjpm1zrHM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hv22nZIj; arc=pass smtp.client-ip=209.85.160.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hv22nZIj"
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-40946982a78so2667129fac.2
        for <linux-staging@lists.linux.dev>; Mon, 09 Mar 2026 07:03:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773065021; cv=none;
        d=google.com; s=arc-20240605;
        b=gfh+XPhKD41CYyxiL7SJb10gaxlvhB8o0rIonv2H+T3wi9tjYIVBH6Z2mBlmg8xwBe
         /0TcG6MdgaTc1jD6bFiVHPj8SKCy8hzLcB16ifecmi0Kx2r2tSMMVvsB+iRtdXCapZJW
         FX0z97X+4OvA0IDMN3u5josMHm5SiAVcCKmBHiFDO9vT5SZ3D0/GvFF/+00PhrJOwRab
         bJJOnDcd5Mq6YSHj9THB4NU4Loc5n4BlsWcFs+VA4T+vAnqXmOmeq/iMHXAIyknqPo38
         N7cUug36nkY0e8gtx8MiBkTDRF15FqYr4ZD9WR9QK1npKXxlZYZzLIGWegoXUMZY7NY5
         VCIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1WBg+LaRUHKZOalid4XJKFAzNKMOVMNajaJlFN8XFAQ=;
        fh=67rGPnAvj77djVLP+HOI2y/L07KEQ78bBayotI9PPwA=;
        b=QErJqNKIpAURHCsevElUu/CcZEM1H+OjRbVunIH+QFNBBWGEK4RbbQSMO9tzCMDO0r
         5MYx/ITBlbL2Vjj8YMfP6zKdMW8DH1zxGVO6CMHYc869UJKZHBf5MhIKDSjlKEahP9J7
         zNz8Wwbj3W3lEdBch5CYuyjcW1jq7X1Ak4vnVvlNHkC99nDSVMYdHTxblbWqz0OnDC5w
         mUnjI/4/MV7GkXGwteFtJzAUubY1fmAnw/F/xGvZaaC1ZGa0SGrFVSqdn4HQ6SoP8qTd
         tLwlMcvls763pq7QNsCIGYcLlnvGJQOdXHy7u75SUfZLBOVf9R5sJyN9SpLaLC4c+1KU
         4N/g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773065021; x=1773669821; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1WBg+LaRUHKZOalid4XJKFAzNKMOVMNajaJlFN8XFAQ=;
        b=Hv22nZIjjHzOECcjxYHVhGoKJs2Y/0J5Tx6+7upO5RD6rSieXsXVrZe0nO3+CgHxlJ
         N9BFrWi3zeDg3BC3gQxLg/KP7YBn7chr3y6MClIZPIHXwz5O6sbCVSjEa3LgpAX+yQyB
         uTGx3QU+L4TMXyzHndzG6qnIY44CLDoR2vEr0JUwVAkxgklAc8nWPemjRGp0XxHKy5Z+
         61pgXyWYl5/vp72hjfDCMnU/ld5GMn1VoIkygUnNBaZ3QWGAA4IFQzgKrh71MeDdTaw0
         hZVs9ZHhBxnkn3AwouQQvNk09HwAknz3I7yW+1HSWO1n1z4OyAMpsiVKGapedcqgZ6bs
         8qjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773065021; x=1773669821;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1WBg+LaRUHKZOalid4XJKFAzNKMOVMNajaJlFN8XFAQ=;
        b=BAdUa1wWtLJZhIR6/QnvT+473kQHIqeKpjrd5u8v8p/XZ712dstQHdFTe55Ld22qSq
         bN3Cf4YnDHS3iIUQmhHwhcKnWwhB629eMzwBVUxN5JDC9sZK6SFtlW1OK/4Dd1rbg8pN
         mpN8FcoaHyTpAxT3V9uLEoU0K8mOPWV/LbEk8hyre8sBxD3TvYR7Z28VGE6oUcHe9+Ey
         KI/tkNP/KDnNiFyCOIxH/TQ3cxT5s1+cv3VnObfghUl9izvMH3EVharcozoF7Forbres
         Da9LP6u4+7csEZn634g5gNphpj8gEGlccVQOsTiZjcpW2kkmnM9RUCy1ySRokzzNM5Xm
         9V5A==
X-Forwarded-Encrypted: i=1; AJvYcCUptqU6v16jMJY2gtDr6sy3uyTpqpTXaDTf/mbm3BkYy5P/Q6oH+spvge9wuZqNMCNjdTX9N6cOKI8bONKn@lists.linux.dev
X-Gm-Message-State: AOJu0YzFDq+qV60fKkc5+h2izK0jk6FTdhRxdr0gCVhynmuMsRQ/Kmfi
	5fGlvHdvhTYCHLxgOvhUo4a8RmwRPkiYOEFGnGQbhtRwilup4RJukaHzPGYZwNtw04uz+/rfLcF
	o/VteCOJ3TdEvfk0U7tiC3k+SIpr1RkE=
X-Gm-Gg: ATEYQzwE6AvYoKDNvPrl+35myjagAZGWNCAJZXENHE7ljBBaD/A9woVjQRdfxVhJGrK
	ngWIP3557nYpgQQ2dELGiUNgKrEFIFFzLiNgd0PsHaJ+0zZwfBTr39J7boUeHk5u/uauugTu1bg
	qQKA66hHrQ8/vTOZIMxr7k+fs1tfAG39ocWEdPUCEwtkZnlOu5bXFs2i5v7iMAtMd+0ZizhHBCQ
	plaOhtI88WXvoltzBGPtRhOGEraJBF3+bemrqbk9aO4opqgGnXP+w0wrYGYFTEV4roy9iZc/rq6
	9VuGmnuHacczjOjSOxLnPbFceZZaDoRSVFskJw==
X-Received: by 2002:a05:6870:fba9:b0:417:3307:e1c2 with SMTP id
 586e51a60fabf-41733080b57mr1915950fac.36.1773065019699; Mon, 09 Mar 2026
 07:03:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260308221950.6721-1-dev.gustavoa@gmail.com> <aa7M1WzJd5JWa1Wh@ubuntu-desk>
In-Reply-To: <aa7M1WzJd5JWa1Wh@ubuntu-desk>
From: Gustavo Oliveira Arantes <dev.gustavoa@gmail.com>
Date: Mon, 9 Mar 2026 11:03:26 -0300
X-Gm-Features: AaiRm51jsuSz2HjNphyY3SjWFaQOGLD_I6qn_0ePa71MWzC2WLuBAqiDM6ee_gs
Message-ID: <CACjo_997jGZ7V+yZX44xoi7Tktp-wHTmtxqr6Q-=5-4NmD90Ug@mail.gmail.com>
Subject: Re: [PATCH] staging: rtl8723bs: replace msleep with usleep_range in rtw_suspend_common
To: Bryant Boatright <bryant.boatright@proton.me>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 9, 2026 at 10:36=E2=80=AFAM Bryant Boatright
<bryant.boatright@proton.me> wrote:
> This has been addressed in a thread recently and Gred said to drop the pa=
tch [1].
> [1] https://lore.kernel.org/linux-staging/20260214173139.49094-1-ofekalm1=
00@gmail.com/

Thanks for pointing that out. I'll drop both usleep_range patches.

Best regards,
Gustavo.
