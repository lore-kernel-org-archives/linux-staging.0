Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA57A42F708
	for <linux-staging@lists.linux.dev>; Mon,  6 Jul 2026 09:25:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783329945; cv=pass; b=Q5S2OUc1en8VfHSq4+W6fmmAeDV5IOOV+C/3DpvEFWZp1T34PFg4OXDj1H1l8zxFZD5RkR9/FJFSyn2oOBVYe1cPEbHBolpRNH6ZdwW9h6Jy3PIO57fqWnrg5zVuP9nZUnZ57oeeos0+7OoYdRyLNmMOrgIInh43f8JwK7xDlWs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783329945; c=relaxed/simple;
	bh=aXWqhXzW8pgQrEqSXKb1HaNw65owccWkYKJ5NB9TYM4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DzkCTYZrJXVLqrASP4b1BuETP73RboBaW9iSK3N0urdiNRbKGDjHHkj+UGUe7pzm6JTSa61g5OYimi8jV3WTxd3rJnJvZ/32sY9CILL9gGS5AMM+hkP3pYUooqLLkc5G4OOrrcpAaMItSCKshfztyMN4cBCjc5gBAD46t+8j4mk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i3Fwce6y; arc=pass smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i3Fwce6y"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c12614b81c9so482344166b.3
        for <linux-staging@lists.linux.dev>; Mon, 06 Jul 2026 02:25:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783329941; cv=none;
        d=google.com; s=arc-20260327;
        b=FlAw3GVs+all5hecoB4jv5Y9llrcP30QsgZla5y7uVq87si9iRoli4IKseDnbVXmrP
         tK779E0FLBqG5MdL1n3bDdszn3GheOWWGz7Qf0hEl7dLiUhxrzR1ehPu67rO4aYUuowf
         gEj2Kl7jWXVt97rjh1Ycr5byXIU4COdb+L12v4oV6HMrAjcY8ZR9YCYUsNpakcpFq4jt
         emPhAJ1QkO76bbp/qdXg+ZtrowXj9X1lc5b+GNnD0U+TNu0BaMkPwbR37TD1X8NfAA8v
         BW76YIDm+IrqHMIXzvSn8rKfG0DBv+EU5dbFh+rouU0xGSV1LZGNikbF57N2Ilo8xdQU
         s2Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=aXWqhXzW8pgQrEqSXKb1HaNw65owccWkYKJ5NB9TYM4=;
        fh=RFmfNzaiZ4cT4WlN+ELDQLmCHSx8sFDyRewnqRYQmoU=;
        b=haxaWKb3qpBgUqR4QpPq7E1ULfCBre6nc6J3tllp0NGLYsE5kDqIiMjmE/y4LBdn44
         /3FNWfDMFv0JHpbI0myuKeQs6/1LuTKiKp8f41XSICD1pJLeOBCr+RANDcpfiwMhbh6P
         EH4tCVJDk2C6af/QwgG3cuHb2eT3JuKORgW9IfeYudYeBSFXXpXojJMqPoOLTzgTkTAA
         ppDPecBbkzK/X8mh29hUku2HeYvwH0VylYz6k3GL6TfAy0kB3eQ8W71ESGI5Q2Rjeuv5
         DpHP/eJDxnFILPp/iCtR8ucUmi7egiR6fT/9JPDRlTJ9vCsNdnU/vPMsUfmB136UBVoe
         MvEQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783329941; x=1783934741; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aXWqhXzW8pgQrEqSXKb1HaNw65owccWkYKJ5NB9TYM4=;
        b=i3Fwce6y8FgxUZj8VDiuoc0SmOueuCqPrS3E4Oq8bYxLQ0QabN9gPczE31YbHGP91z
         cPDKkzwf23JFfKvqsLNPCFZ87s2M7uEnl97lZyZM9Q2OmllbJYdsUtifcRlR7sgTuMEz
         5ptDzy0q/cOzooU9Cbj6oSGbXGQv9x3eui90PjRCjMG8X/Vp4X+PJTuh6HM+9sZKDacx
         O7YKz2KsG1t8JP2CvVzso2BufMwe3SbgKqRifNquxuSglIjvz9AocLSfjdBAan5KNIIy
         E/XM5MKDPCrzeADGXSO9j54KjMQZ55MUHBM1bp2KU1p/GOu2pRbcmvT7DvO1U7Q2NDTj
         d2Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783329941; x=1783934741;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aXWqhXzW8pgQrEqSXKb1HaNw65owccWkYKJ5NB9TYM4=;
        b=qMBLb0mEOiwnVuljMUdJiP6XaVpoHMOKUeJ1rcCKVscFETwkJ9ogOmeLwbuJH05VAe
         cMt3VI+P6leWl5vOQBJh6ejPzLZ3MXlgrNzGHuAVOckwtnZIV922pL5TcrlBEm7wKjXP
         WUcvHBz8XPTug/B+UruTLXL0iVCJvT4lBU1aD17TJhRxmBppPNWcy6/xZxu4U9A+ycxG
         wco1umDmylyjVTAz1+tSu5SY4tBayp72ML6tX49apa0ecwOu9btYKDB1GJgzCn3T/o23
         AqIICuE7sxfSWyO2GVjDpwtJF6/yeTx5QqIiCHx/qvlBOFkDsIc6RVog4Snv16LCLvo8
         Oopg==
X-Forwarded-Encrypted: i=1; AHgh+RprARdF08E+24Ko4C1cgTIgtPTbp8MluvTbjrrxPAZphq2rIdPq2NeM7dxrZxwvc4rhmbYkZJF2PQn46rzU@lists.linux.dev
X-Gm-Message-State: AOJu0YwAOT5Al5Bm/YpMlnoYkuJbDRaYu81fzRALpyAniNcT1y5tNNHY
	IMSiNvozTFxKu4elX77UaZ4vikygPw78YUteVVtdK0Kej90GbLE+nIinPtaPdA3bHR8I79ItrkM
	lfEXZ5PE99iMRrH8GT8nrwod+okPhey4=
X-Gm-Gg: AfdE7cn2cVqKy9A+8puxapgDmUDBwZjRHT2uSHGIbtnoFPUNM72Cwd5++WTgtnIf9YH
	9QzGFw19O0NwX9X4Ll3mD6HjrJIqOW9hMEznQ7YHhVSFa6AG3ftHBFlPcqclPLTiTH9BtB0bSI3
	r06f9gm34J9Dy2IHF0nNU4rDGiSHQ1c7A9BRbGVszZ9AtTozO6fjzpFjy2QjRcgbGjQd+Wb8EVV
	ATEouJbWr9zEySCu1E/wz4MXeEd8OFFL0K1UdFF4fg6zTk6uChHtQbVg7CqbHCcPX1hf8n7J+QE
	84VZXioKXSBKzo7kGLPLchNRRque9IroMpMEuxxVkWkNR9WIBXq7WWlbwSbj2yHHj9SIizLGRL5
	3jks3/goRm5+DCzXs4nErxyqvUNkVVrx0nPZje2jhevlsSNkaoiW8wsvgGQ==
X-Received: by 2002:a17:907:3e05:b0:c12:51d9:bb7d with SMTP id
 a640c23a62f3a-c12e6b7d3b2mr304229666b.41.1783329940510; Mon, 06 Jul 2026
 02:25:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260704120113.201099-1-dileepsankhla.ds@gmail.com>
 <akkOdQ1oT0hIc0tz@ashevche-desk.local> <CAHxc4buoGJJ4ZUbvCz7EtcosH3mZWXp0NqFMfDBH1QV__0qDpA@mail.gmail.com>
 <CAHp75VfHKcW4BfgWht5wN=SY1u8=Jw4zAo=Sx0Fm_n0=D3pNWg@mail.gmail.com> <CAHxc4bt4ix2O_T6m4c9y+k8hqmx-C+iRd23mqVS-8Zns0DFa4A@mail.gmail.com>
In-Reply-To: <CAHxc4bt4ix2O_T6m4c9y+k8hqmx-C+iRd23mqVS-8Zns0DFa4A@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 6 Jul 2026 12:25:04 +0300
X-Gm-Features: AVVi8CdPYOjGsLChEXFwTwQ1EHWsCOAVxNB1tFPEox7z0_aLqRs7WYJvuTu3rp8
Message-ID: <CAHp75Vdh5crSErhWQ+pvEQcPek+H81hvoTeJC_2oxAE65ijaKQ@mail.gmail.com>
Subject: Re: [PATCH] staging: media: atomisp: Remove unnecessary else after return
To: Dileep Sankhla <dileepsankhla.ds@gmail.com>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, andy@kernel.org, hansg@kernel.org, 
	mchehab@kernel.org, sakari.ailus@linux.intel.com, gregkh@linuxfoundation.org, 
	abdelrahmanfekry375@gmail.com, error27@gmail.com, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 6, 2026 at 10:26=E2=80=AFAM Dileep Sankhla
<dileepsankhla.ds@gmail.com> wrote:
>
> On Mon, Jul 6, 2026 at 10:58=E2=80=AFAM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
> > This is a huge driver and doing half-baked work doesn't make sense.
>
> I will try to send a patch addressing all the "else is not generally
> useful after a break or return" warnings.
>
> > Also if you want to continue working on this driver, get the hardware.
> > Almost any cheap second-hand Bay Trail and Cherry Trail tablet should
> > suffice (of course one needs to check the specifications beforehand to
> > be sure it uses AtomISP camera).
>
> Sorry I cannot get the hardware right now.

I see, but please consider that to have in the future. The driver has
tons of work needed to be done, but most of that needs real testing on
a real HW.

--=20
With Best Regards,
Andy Shevchenko
