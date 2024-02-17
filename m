Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBF071E492
	for <linux-staging@lists.linux.dev>; Sat, 17 Feb 2024 18:49:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708195767; cv=none; b=tAzt819m1bpigF1zxX/3J4NzZycH/0G3ONlhd+Zo0RTpilw/WWiXESiMOC7/9xVu9G9roRBNyeUp5Jzx6f3sk0/v1flBXAODtsPB6UgAXcnYCWZmHXKlIAj0SsSxME93h0Abnd8KuIvBgPA35AtIU+NbEMQKfd0d/SkrMU+zq+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708195767; c=relaxed/simple;
	bh=tVdFkiuKgbKzE6Gz/75ntqSZtQxuEh8c1qDUVRnHDPQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Fa2AfYXNuz0Y7WfHvQRWHDaJkjCkA77VExIEJmmyfw2P4C0xENmdFp0QVLoINfqSz/i6hneD4yfSXVDhg8mkxbRAd/lIQ44mUW0g5//sdLDjgVkZzCNBBERces3StDrhdiAfYLkPaHrr7ukWKSn4RdIZ2fBnyio4bZM5RjWwIrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SVFB6zHK; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SVFB6zHK"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-55a5e7fa471so2225070a12.1
        for <linux-staging@lists.linux.dev>; Sat, 17 Feb 2024 10:49:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708195764; x=1708800564; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z8Il7Kft3mdaMOMzG2JXVblquBnarZFp7+L4OeCIil4=;
        b=SVFB6zHKRTFOavhdo7bHjdpusiwqlO+CtGgneVaityHU4iY93Df54C6gbDJEUFOPI9
         Q/ppyT/0f9pUN+5hQ56cFQuW62IgBKzwn8Rt4alPTKCCVFlDnyh5U2Wp+GG32ZHyO+M1
         ONbfxgt1eC3xvsfmrM1L4kqh5pvGX6Mh3glDuq6ZCz9TIGNNgYx1Vy/xoL/bPwrQ+8Qn
         i4MkVTE5sh9DE8cfYnoBu42VL0SproTNQVGRio5+SATyVG2Ksn3Ztvpz7OaUT+oXUY6w
         Hl4Xpz7GTAp7s5kKe+Z8YUDveoo2MeLeigebJ/c4PXe0yE6RPM1cw/s7VkfvdmHsnMQm
         Rn0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708195764; x=1708800564;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z8Il7Kft3mdaMOMzG2JXVblquBnarZFp7+L4OeCIil4=;
        b=mv7antbOHWMwnV5xMo4GSzdhaM41cK4O5Mh0YuzUW+yoCeimlgQKoMDYslcPPtkSJj
         DkzkDHl+iznKxapgKHhVErjTijSE/KqbaW6gKPlGAJ4FpBvvtlWKkDPCyYv9NN1qdpqK
         9AB07Hkv70g737LrtBFA9dsCcK8xAVLUkBC5Fks7VMfjpntwkv6kBm3zNxna0kAWHnHn
         lnk2S7Q6/QMHiyQ5MfAqrzHXdouZj32CMnr1mp1ZA4mOgj91A2e8JqTaJKWIpTuBus9x
         AG59mQHnqrzktSkCeDzr7lXyak2zW/bJrF2sIs4ozTNZnyrAQnVm8rV0OvjokDEYZVxD
         PU8Q==
X-Forwarded-Encrypted: i=1; AJvYcCWYwW+tDaGA+020+HBHCUpmdUKKfI+dIyV6Nsa42fHPEXVeyUKMxJb4x3cpOQPPv/xqu5BhC1FWsJX9omuOuMyg0F74HC2203OqECCBlw==
X-Gm-Message-State: AOJu0YwumV1Ojw41koCMjzpyaeRGa5ToHxPcuNbuyO+IVOsI+SpwfZfo
	2MAmQjvnFpvIkH5ANhD8TbVx6LgW1AcsRIzhTY2dwG+7fW/B7w2rXhgmqxEU0eBi6E+cSVqNAHD
	AcDlmOcmnMEczyAv8YxIvBs56i98=
X-Google-Smtp-Source: AGHT+IGbT/dABf64NLru2OpDqaHothjKYVRbdBSvna58sx6rvZGnGEWCJoVftQOsH16vsPGZY3be7yejhI8Ls7mkPv0=
X-Received: by 2002:a17:906:1982:b0:a3d:c9e9:c7e5 with SMTP id
 g2-20020a170906198200b00a3dc9e9c7e5mr3857107ejd.61.1708195763892; Sat, 17 Feb
 2024 10:49:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240217112438.15240-1-hdegoede@redhat.com> <20240217112438.15240-8-hdegoede@redhat.com>
 <170818560760.1206667.14199319396527835603@ping.linuxembedded.co.uk>
In-Reply-To: <170818560760.1206667.14199319396527835603@ping.linuxembedded.co.uk>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sat, 17 Feb 2024 20:48:47 +0200
Message-ID: <CAHp75Ve-v=gbNtzy4o=gvhhQxhyaw=awkDrf+_Qgee0v43PcsQ@mail.gmail.com>
Subject: Re: [PATCH 7/9] media: atomisp: Change ISP subdev name to "ATOM ISP"
To: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Andy Shevchenko <andy@kernel.org>, Hans de Goede <hdegoede@redhat.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Kate Hsuan <hpa@redhat.com>, Tsuchiya Yuto <kitakar@gmail.com>, Yury Luneff <yury.lunev@gmail.com>, 
	Nable <nable.maininbox@googlemail.com>, andrey.i.trufanov@gmail.com, 
	Fabio Aiuto <fabioaiuto83@gmail.com>, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 17, 2024 at 6:00=E2=80=AFPM Kieran Bingham
<kieran.bingham@ideasonboard.com> wrote:
> Quoting Hans de Goede (2024-02-17 11:24:36)

...

> Pure bikeshedding, but I'd probably lower the shouting to just
>         "Atom ISP"

You beat me to it, +1.


--=20
With Best Regards,
Andy Shevchenko
