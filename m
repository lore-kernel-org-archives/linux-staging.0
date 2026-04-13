Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9DB638947C
	for <linux-staging@lists.linux.dev>; Mon, 13 Apr 2026 07:24:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776065087; cv=pass; b=cB0LyzfLEGS4k2pA1YdmOK84LrU8LG5k0TPEkciAdNr+4OfzL32JFUJW+2//90MYTq98YsLAXsJtoWEQEW912b4laOzCD80sszoWtcl4dh26o6hPC1ZFs93KCJDI20mnlHMm7ZP+DlX1/gkLJYPb4bAiP8YJhQp5YeUsXx0J+V0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776065087; c=relaxed/simple;
	bh=7ZHUD+kBQSpfUlxq49/apHzHgrZaXw2nBrklekUGpgc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mELAltpJsXxRMFAfPk2/oipMuCe8+XTzr8gRuyWjmif8yFnxlrmHXSvj7iIy+ixdgLlX2BfADE6ONR6IsgeE9rqJ1bFxDru74AMq2mVaVRQjN9ukGnDt3gTrvtVSxGTM0Iz5kotbpZXnc02SLCL660ZIcxIa4MOsALoKxHE+JQ4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=o0pC69v2; arc=pass smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o0pC69v2"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6718f336888so835331a12.1
        for <linux-staging@lists.linux.dev>; Mon, 13 Apr 2026 00:24:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776065084; cv=none;
        d=google.com; s=arc-20240605;
        b=KVN3rkul1fLUVxZNHnzu9ldsqbuk9bbHekmRdZD9L4Rc008qSL/oBuVI1dh+jYR1nQ
         G0pLU2zMjfz51G6Bs+FS/3DbZjec9/tjiXqTyRZUM4SE6qK1l+rYJBgcl16PqYQPv+ya
         MoJoRjWWNAAS9G0eWa9FawE1J2IvE55AkXR/CYKvrH6BY11SnkLR/AfptbGNLyzqisjE
         CShumqPBS9jj6KNWHOl9g9cikfKSUB/vG+/UKD+NoAxq5kHtyuo5M3a5TBPTehT9iyVv
         rWfAEyyRRVV/cgsK/vFeA+tKCFRkfT57vlFgEr+Jba/MWBIY8zad6NLD+hJDjn21o+M3
         WlzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7ZHUD+kBQSpfUlxq49/apHzHgrZaXw2nBrklekUGpgc=;
        fh=HTxn4kdM/zhtXioT4hCaBT+mz/On/ubG4ei833zFPiI=;
        b=SkTncPl1ay7pVSjjhFtBKl1P3/7ttSVqvHL/7nsUzg3GKZU9LyA5/0QeBPLpfVxqYc
         Y5UuBCM0mG6qKAE7ijXuQ+cHuUQTUBa/2ZBz81DSA/L0tvnqW/hux1AJV0zVsTjtBVqe
         Y+A0QszwFqNq3kH/hTb3bQsBI4BE8XewUU6Z7G1bRs0Vk7YLJGP7l9JCAflN4Fi626cs
         jt74oVk8ClzJTsme00letBL/7k9nGeQMvYX4fLo1cHC6ucEdK3hDD1RIh2jixEoh8y1m
         rSkAFDLvDzGJ92A3m6TiKVVHr+rwnpZr8lfkbUoqvVhCArKCg1WBu5TiJhDk6fWc3G3D
         0RtQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776065084; x=1776669884; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7ZHUD+kBQSpfUlxq49/apHzHgrZaXw2nBrklekUGpgc=;
        b=o0pC69v2zvhwS0ebHCfAmM7e18tbHJ/CmVRK/Gkjs0nDvXwGUdxf/aW4EVtJMxqTVW
         4cF5FmMxKb+DYanvxu7zfVKj5txmZ2lGwiMxTsjEoG+tS+gDIoU7LuuRVaYcEVvJuotH
         lNuNl35nP8W9xLEnSk9EPUy87uzJIEpe/8mwSHzULu/Q5YpzP7E7IqPluQ+PPtP3LiLl
         IL5WTaibu6BuT53ic5BAl/gAAGnILlFEUO79Qzrt6h6XuySs1GeNHAnOvX3k6hDUOFdV
         A9znRE2Wnv+8Df0IzBbRq5fjvIMTsVYrHh0t/ld/p6zzsKSGQP2qrg0i9m/DKj9SbROc
         Sp3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776065084; x=1776669884;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7ZHUD+kBQSpfUlxq49/apHzHgrZaXw2nBrklekUGpgc=;
        b=LqH8lsuct9pFbB3XJjvk6ppT57BrypWt16hW2ginrvZct/0TgC3B4tn/J4wl+yQ8ag
         J5k5ICFgKcClej/D9nlsPZgLJ4w61CUCH5z6mG6Nk5nKRkojOqBOLnwKG0TUFuzNVwnG
         AHjbxG90AXiUh6ZIIopg5/0aQMBSS16BMBwmJuLQdaxV45ACjJFZeP7PDHu5aFsN7A1x
         pyXh0gpwiqcYT2ekFsphmAJBzcMk85CG5/hD8W6kjBVGxXdbgFkKDhx+le24uP/5hkpw
         Bchdyjx+tbQfnO/orTQyp2icm2WSHQv0VbTuMSDNG0z/yABBG3nfpmsfOKT4z2FTat+2
         wxwQ==
X-Forwarded-Encrypted: i=1; AJvYcCUzIgWJLDya/+T9siAUW+Tfi+OXHXpMjoR+njknBkZwIuNPMkbk44Y9xxb9e02kXqzniHkYD0VCluMIUw20@lists.linux.dev
X-Gm-Message-State: AOJu0Yyq/T9D9EldXi0maXZCNuN1DchjmgX6TBYD2XXJ9cytnGwpeyIm
	kuqjZ01UTh2F1NhDvyflmpTTXDWWQGOIPbrph1iiPFDZ53NwVjUigiJxwmcGa6TagZYmLMp/oiZ
	RSi46tybI59xoomezHmC0kOa5B+/RwC0=
X-Gm-Gg: AeBDietdz6Zuj555NpidxFSn1vPCyhm87vFGFhbFLzPcC2AhXb3FeDudXXAS3330on0
	fk838Jfu6YImxdLJOkKtPduM6XSfXPlnNU3X6Xt6VQnncSn7f7PdgDcROhJPru/u4uo+D03AC+C
	VvYP1nEd9cu6wlJEoVwcNGTSvcVdaWv8t31KrQlcuw7fW0buK0ALZygZ5uvolG63+J4VustcVu8
	LnY7Rk51IoO5CuXUTieLjne50nLh0Lw4jROuZjYoucJVWfze7rPMUSXfV4Kix0b1LzQ1pwGPNuV
	K90SLOfrrO+aQVKpX1RiCj69WOwwYkNWEKUibSgoeENPeTCnTmwBes8qUNOQy13cZcmeOlykyRo
	U4/GLCOQ=
X-Received: by 2002:a17:907:1c16:b0:b9c:d04:e05f with SMTP id
 a640c23a62f3a-b9d72658a55mr682490766b.32.1776065084003; Mon, 13 Apr 2026
 00:24:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260411005512.46142-1-mugrinphoto@gmail.com> <adont11Sr92pi0_N@stanley.mountain>
 <20260411154223.3091eb45@pumpkin> <CAEiYE9hBGiDgP9FmMAuU0qyVygmwU0FrxVGcuy5g7JLO4KWMLQ@mail.gmail.com>
In-Reply-To: <CAEiYE9hBGiDgP9FmMAuU0qyVygmwU0FrxVGcuy5g7JLO4KWMLQ@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 13 Apr 2026 10:24:07 +0300
X-Gm-Features: AQROBzC8r5p418XMvH2NBWJUbqFPIOpGj32dYkPtq6_FWukEQoF6OL5Gq0THpKA
Message-ID: <CAHp75VcbDRHOeBW+i-FTLJ58C_hpOJoaKLu_qwLZEhRocSXFcA@mail.gmail.com>
Subject: Re: [PATCH] staging: media: atomisp: fix indentation to use tabs
 instead of spaces
To: Michael Ugrin <mugrinphoto@gmail.com>
Cc: David Laight <david.laight.linux@gmail.com>, Dan Carpenter <error27@gmail.com>, hansg@kernel.org, 
	mchehab@kernel.org, sakari.ailus@linux.intel.com, andy@kernel.org, 
	gregkh@linuxfoundation.org, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 11, 2026 at 8:14=E2=80=AFPM Michael Ugrin <mugrinphoto@gmail.co=
m> wrote:
>
> Thanks for the review, Dan and David.
>
> I'll work on a v2,replacing the ternary with umin() for that strscpy
> call and the other strscpy calls in the function.

Why not simply min()? Wouldn't it work (if type of p is aligned accordingly=
)?

Note, we prefer the (more) real patches, id est what David suggested
seems to me more useful to this driver to have in the long term.

--=20
With Best Regards,
Andy Shevchenko
