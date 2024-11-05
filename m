Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D861E3D81
	for <linux-staging@lists.linux.dev>; Tue,  5 Nov 2024 20:58:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730840333; cv=none; b=deBjrpEwVVwTdJKS3LQqMUomg0Rh53uGO4gF0NkXRA8pkWCbUMJyeStarhXhOUw/nWXty7KsXzNRke2nVs6QlgcRUhRwXHhPCsEtIHlvWrbdcmW4+RlWysLObs8zk1pc0C2kYaWZ8A4GqGm1pQGyEXoBt5z730yk/qb6hLdNijc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730840333; c=relaxed/simple;
	bh=kTrZ23ZN/z/dNF0r5uBHslkTKc8atg+bkgoNPGdUYMo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kd5PScxC+kYnUhgVeRxch6nm8bGmsgE5aKftGO8l7sNxHS35jNLD/vLeqR/M5U2N1qImp2r03s1mkmHWF9zGoiXs3vOjE4/fCbrqsnz7Xpe7KTcCqDNHBxrIVkz1LKUIV7u2IJauG7exRwlJ01m6I9TxRinhlPoq3ojO9RSoEOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=if2k8ss/; arc=none smtp.client-ip=209.85.221.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="if2k8ss/"
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-50d4a6ef70aso1987036e0c.3
        for <linux-staging@lists.linux.dev>; Tue, 05 Nov 2024 12:58:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730840331; x=1731445131; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kTrZ23ZN/z/dNF0r5uBHslkTKc8atg+bkgoNPGdUYMo=;
        b=if2k8ss/c0Q0dOzFHHJM5+4Lqzropf0c8UuA8bLq5K4qLCRm+89k9f1k4FcCuLuLj6
         D9as6ll0V2390NHJ8furTDNDDklR9C+xrXFDGn8Kdmgm1QsmktiY/1xVGpa+duBo0zkp
         ayQ3Z4uK57bPUt/lFLwJ+rIPpgzYhUNHHUhhhIyhhj9OCCUOh2ZlkxWoxmwVw1PKpMTG
         obcG9xezctRZpM0lXwYVCaU+37PyqYkg8w/9O6iKHtOUGs5rmF/WdEn3M+8EdT14t1Di
         P48pTsyO1O8hFDwdCREW8BuKu4j4PT0UP+hMgCQK6MN+Ro4rVXqBlrrFeZpOV6DuH1Uc
         vc/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730840331; x=1731445131;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kTrZ23ZN/z/dNF0r5uBHslkTKc8atg+bkgoNPGdUYMo=;
        b=RLsXXPCOPm9NsO3KD/njHb1v8vb0JlhESJUJxa4C/MbG6i1NKUYgSwZZvnd2z9Q+Ln
         pnYtOWUAkgYHfnLJz5ANBgcfEHFoItDeHobVnVvFfgLZsHXA0I2VNurO0XWFfRu/rJH6
         NXfbb47LIMsqVfNLnlJ069cScrwtuGAh45ZSqjM+mY817vGIE5a5ry372KXRrOKbUuMO
         YRf09BcNcslAN6ht5dTjG+NFIx9Mics12oiyR09Rz+0Ngs2HqLUkgfAfeUoaygFA1y5R
         NBvjfU6SWJ6nYGPTm5Vqzz+H+JhrXDsUPYtf+01CRHghXWYDKwuaSX7Eh3uE5Co/D6NG
         5O1A==
X-Forwarded-Encrypted: i=1; AJvYcCXe4lPh3hPL2GNlCeJSNQYu6Zxa63+XoZi38N52XIvX3+kVEt9aG0XfwhAnKb8iD3fUpbWozpe5Gi7RLifA@lists.linux.dev
X-Gm-Message-State: AOJu0Yz1Jlx0IjDJsBJWXbpqYBekEhHlAd0NebKkXUIgSjcXwKrQxsIB
	2GPFODMcmuw+mDbcWPdBVU4HvO2NG9WLSNyOGQTwWvu1DqEHN8Q4r5H4Vo/uPVZwsB6LzVbXD7q
	9ohyqb6qsn7FlgsjWVRpySlGsgkZNIPCF
X-Google-Smtp-Source: AGHT+IFXnwefW07oXVzpuW4z07lz6ZhGUwzk3Eyj8AMF+h/Xo9djR6GAj2QVFEFzWKaTsqk8vNDVXI1nBnA7kkLoH1I=
X-Received: by 2002:a05:6122:659f:b0:50c:a762:8f95 with SMTP id
 71dfb90a1353d-51227346c6amr13981212e0c.10.1730840330681; Tue, 05 Nov 2024
 12:58:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241102191436.23177-1-philipp.g.hortmann@gmail.com>
In-Reply-To: <20241102191436.23177-1-philipp.g.hortmann@gmail.com>
From: Sven Van Asbroeck <thesven73@gmail.com>
Date: Tue, 5 Nov 2024 15:58:39 -0500
Message-ID: <CAGngYiU=aP4FG_3R1f13n7u5o6L7S80HqnYbSTDCgK_NjgNCGQ@mail.gmail.com>
Subject: Re: [PATCH] staging: fieldbus: Delete unused driver
To: Philipp Hortmann <philipp.g.hortmann@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org, "Ricardo B . Marliere" <ricardo@marliere.net>, 
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Ruan Jinjie <ruanjinjie@huawei.com>, 
	Zhu Wang <wangzhu9@huawei.com>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
	Deepak R Varma <drv@mailo.com>, Ajith P V <ajithpv.linux@gmail.com>, 
	Tian Tao <tiantao6@hisilicon.com>, Rikard Falkeborn <rikard.falkeborn@gmail.com>, 
	Ding Xiang <dingxiang@cmss.chinamobile.com>, Jing Xiangfeng <jingxiangfeng@huawei.com>, 
	Cristiane Naves <cristianenavescardoso09@gmail.com>, YueHaibing <yuehaibing@huawei.com>, 
	Oscar Gomez Fuente <oscargomezf@gmail.com>, Nicholas Mc Guire <hofrat@osadl.org>
Content-Type: text/plain; charset="UTF-8"

This is no longer part of any working product that I know of, so:

Acked-by: Sven Van Asbroeck <TheSven73@gmail.com>
