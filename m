Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1A9236605B
	for <linux-staging@lists.linux.dev>; Fri, 20 Feb 2026 18:14:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771611279; cv=none; b=uU8bDqqT2CIKsQCh0tsMITr0aW5baJnxlvNveK6MJBjDv0temxfEAy1ZYanRABixlYpWbmoRQQxpUzOWMsNbHBeTlBmaz1zxNLfEkbcyk1Udl8cDUrWQ98dsIxxMgLsTdsXOq1l8vWLtbLdeEhjsMwB8UKxYX17iXCg2uHbDoTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771611279; c=relaxed/simple;
	bh=JXszejtptBo806eF5fhpdme0katrmEEjO6iXEfmeDOw=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=Yoy8sxt8qCpubcijYZ/EBohIt/gmYoCscOSnRMsjLtk69g/qJ9OXUsh2Rmva5FuC0Cj5yN3evcm6L8aqUMOpAaIEiCUAId0SzbwGc4NtlZ05mjrJphmUmyQKaZrKpHoDsAbbkImUTLbuYRqg1DQxLgSC7dqOF2SxjDBxNTVS9mU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Uj1bchoK; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Uj1bchoK"
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-78fc4425b6bso21237537b3.1
        for <linux-staging@lists.linux.dev>; Fri, 20 Feb 2026 10:14:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771611278; x=1772216078; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dDX8SMelSD4WMhRzm6iW15MIU9ylcroL1kUDHPo23CM=;
        b=Uj1bchoKxHdfA4xHZ99rU2bllye83McGC/AYvdGmvAXofozYbZLGAsUpqU6KetuPid
         tO+09+pnvSWQ6diYN2FzQ0i0SvQmuoIbUk/JArsGtGqXr9Yx3paoVUBOWNh1KZK7T0Xj
         7/dUHYS/db2Dd26RbveC35GmTCbENXYyvd8dQ/BDBFo+uZRWrcwTWyr9kqPpDahxMObG
         7Eg/pVwz2Jdv7yKkkfnyO8JAhJVUrsN6zSHxW75swj9Q42y8vaKF1UtyFEkKWIeYIfwb
         136EopBVwqm4poNUZ66gpw6SBIYUShsjUg2/4mRJOQij2BkUN7Ivj3L4RAvgcUGTkhXS
         M2YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771611278; x=1772216078;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dDX8SMelSD4WMhRzm6iW15MIU9ylcroL1kUDHPo23CM=;
        b=eeadj0tKfe/i+8cZRXvBuquj8yZt7aGUXlal8PyhiRK2NiTI7RCiIFdIdKYKfoJQ+1
         IgvazYXIz29xOeEZ0PASSrcmUhh5185PCD+Y6gASTwsbv5tvhkw8Ka4VftrLIfg3WMHM
         EDqZ/n+OaRNloniNIHuXuT882eifcza9Sl/gW0mSlR+q99o7t0OpvTp2508paSWqWNh5
         wcwyOIP0cpeJVQqWf17L/na9MDKULiT/1zn99NKGkE7OBMao5RioZbkBPpOdOBGfaWR1
         qrxovA1k85n3zaxtAvoBjZUfpNS7uVuGo0zmYZQ7OhSq4COCrZI0NZsWHU7NiO6zsC3U
         MSJw==
X-Forwarded-Encrypted: i=1; AJvYcCU/bARSAKy0vQUsvTwh642ir9iu3/u3McCfO5s+8Bd6Lv4Oh1L0z5U8nYpltJfjJM5OC7htIHv9y3CZhpNp@lists.linux.dev
X-Gm-Message-State: AOJu0YyA8ur1+reJuagwdl2xry0Lzg1n0SinZg5FgwNZzNgNFEvP7pH1
	sWLvRIlXknerrB7qm968Mi5PatUzfPYfjfwHTamqg3moz4c9qgX/7MRu
X-Gm-Gg: AZuq6aJ1rY+djQRqhSc3tn22b1RUJ7S5YqY5vyu91zUfFMvtQZjn9ij5mvXhjoUgFxN
	TLx6rPintSrYsxze1tc1NlM7owYvNWfdfGlvwLvhrI12blAwVrEVxJURVArFfLyqQJfgdoXMzc9
	R37zAX7Av0ZHRVpT2g33j8RjzmGUhWzxZ8DVf2T5C7dqejHDVdiDfmB6J1pk4TKkw8/iSyW8i/P
	/JDVBneGaoJPZyzLV2dbWON74ar73/Qf7EEDwTJ+JRpVjzuO6K9mZ5PLSSQKrZJwNhS2rzqy8nu
	MamETHsY63ddeLtlN0wAvmAi/U+DEtYso8JdNBW+rXzmaiqZqqRWStj6nqwupKilklX6SWB6ql/
	zsX/CphmEr+SPUqiLFB0ZOryyyIUI6P+knnmPr5ThRDq+b95bv1LSh0urYCkvoTAFroOFowgoIm
	zeScxHy3xmnQr69ZbnRFqIogDIP8+nR6PcZ4DSE9hfidWhWBlvLa6mfylacA3M1/keWNHPSbcMl
	pccbvClWz5UZjq6s+zqH8wRlwcFFZ6MtJ5SptNOl6hGdgFxh9Q=
X-Received: by 2002:a05:690c:660f:b0:798:34a:8849 with SMTP id 00721157ae682-7982913e9a3mr7786687b3.48.1771611277715;
        Fri, 20 Feb 2026 10:14:37 -0800 (PST)
Received: from localhost ([2601:7c0:c37c:4c00:e3a8:26f7:7e08:88e1])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-798064888ebsm17700727b3.15.2026.02.20.10.14.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Feb 2026 10:14:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 20 Feb 2026 12:14:20 -0600
Message-Id: <DGJZS1M87UBU.2JA0KERUBN6OP@gmail.com>
Cc: <dan.carpenter@linaro.org>, <linux-staging@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] staging: rtl8723bs: Fix spelling mistakes in comments
From: "Ethan Tidmore" <ethantidmore06@gmail.com>
To: <tomasz.unger@yahoo.pl>, <gregkh@linuxfoundation.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260220131647.1922405-1-tomasz.unger.ref@yahoo.pl>
 <20260220131647.1922405-1-tomasz.unger@yahoo.pl>
In-Reply-To: <20260220131647.1922405-1-tomasz.unger@yahoo.pl>

On Fri Feb 20, 2026 at 7:16 AM CST, tomasz.unger wrote:
> From: Tomasz Unger <tomasz.unger@yahoo.pl>
>
> 'alloction' -> 'allocation'
> 'overwirte' -> 'overwrite'
> 'indx' -> 'index'
>
> Found by manual inspection.

You don't have to write this, only say if you used a tool and what tool
it was. With that said... there are better ways to find spelling
mistakes than manual inspection, look into codespell.

>
> Signed-off-by: Tomasz Unger <tomasz.unger@yahoo.pl>
> ---

...

>  		if (i >=3D 0) {
> -			/* Fix issue that pairwise and group key have same key id. Pairwise k=
ey first, group key can overwirte group only(ex: rekey) */
> +			/* Fix issue that pairwise and group key have same key id. Pairwise k=
ey first, group key can overwrite group only(ex: rekey) */

While you're here, go ahead and turn this into a multi-line comment. If
unsure how, look in "Documentation/process/coding-style.rst".

Thanks,

ET
