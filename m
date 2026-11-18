Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.169
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794996451;
	b=lrl3ZdypWsxqcICpSj5wjamDlcjNwF1otCG1ixKBWKBVxFZzNrV3iFfavZSdIqa+H1wo
	 +yrtvSN+rS5mPNiHdXs8Z76CoGaBL7s42Ii3t49owCXe8T+YDrqKeMzE0Ipd1yAxuAZBX
	 45BiHQTsQj3o0WBllUur3HtFkZA6kYy3oShXWrLMCmkRm0EFEEKGbZze7CBr6XAFQ2V/o
	 kEojgz65pGFuDcuartOCxdYgJhIm4bYfRKj1Feo5nTfilI4SjaIHi6UkBCvvuP90XPH/c
	 LbQ0Wz14YFvTjGJytocK0b7Oyp2tFbmmXdoXT1oHZhjmyzyJDhxmyKNsiDA8ZCQpAGw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794996451;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=S+vT9vEZXXGE5nylP28OP5E16FdGgGeVcWYBckNJ7xA=;
	b=yJote9HF11rYtIK+Uf7/WYcqQ9AtLNz1psyKYXLxGgKRHXS9RvwXPsZ1ecvYT2t2jcac
	 Cr0wBwCgoWOoHOfVV4/W0oZhW7tg/reCw+CZs+1dvghpqg7xKXqPb620F2uEzrT3hd6cf
	 D5lFTbzRjEZLsXqhxpaI8by8j5opuauHZoK9LhaKwjn03CmMzZWykKAId7XrXZ75TegM5
	 2scwjDpp6wH+2upwVAMQMUUAgsLYPD0XVcvhC0vEuSOSit9tUaSm3qLO50I9lwWkMLnot
	 SxQuDKK33LIIY71reEoTlwK75/0Xk/1GLH22ThUM6+o5XUQaoY1lDOGfwe9ZeGy/o2g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sLe3E8rS;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.169
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03018606A31C
	for <linux-staging@lists.linux.dev>; Wed, 18 Nov 2026 10:07:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 03018606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sLe3E8rS
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-8b4e2ec4b42so4598497b3.0
        for <linux-staging@lists.linux.dev>; Wed, 18 Nov 2026 02:07:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794996450; cv=none;
        d=google.com; s=arc-20260327;
        b=IQlifcMTeDhPpfx4QxgTcR9hpa1+kVf5VGIxblu6+CzXY4gkkxfte0MDKyoh+88cNr
         s/iKAo4Ew3gdh1KDuSPC1FtlC8i0e8sT3uDUDnv2hDILtDtSo1brEl5VymQDpW7qXuEX
         NMuq6OFU27/X9udKn0ZzHofpncGVo1wOi/1wFsa7nDk3swHKCrtsEgIFZK2678QNd9RD
         N6tczfK20QCdFU2K+9/9ZeH9lk/i7zI4oSMLSOJDxPYLjxOKpr4QmkPbYvxucm+TQtht
         tYSj7yZtDd7TTEkYbMYkger2Jpu02NfQ0Hs5q2fCGTgf0wJbPRTSUVoVeLR+AAKMIHmA
         FYCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=S+vT9vEZXXGE5nylP28OP5E16FdGgGeVcWYBckNJ7xA=;
        fh=GU4HwJPIa4UcY4TgCsfad0UeHHgCNT/0kIak+WzZNtY=;
        b=mvjAh6v8lUsHAhj97mZwYL1T5ecKO7OPtRrJSc3AtnPDTTdrImOKkwQMEq5EufWJpx
         ana8GkCVGxKUHMrzqJv9kXis6iGL7R/61VxhRwoUwJ6FnurQFOPoqqo9L5Qyen+PNwFw
         mP0eoNeV77NOpwlzi9svHYW8wP88J7RjjYmX/4hfcTGeIhI8XBIj4ZRAvOQ6t7kP7mY/
         YUTU4EYNWp0DC+am1z/vbBkdN9sV34HvwL1lauG193LyUuvONf9jgSrl+9wTuaYyRsaL
         Vqv0o29B1i+Zjh62WtkWyh29IKNfnlPMQGqoro+9oc7Ci2B+3AWW+Q5+v4M24VLY1SX2
         1upA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794996450; x=1795601250; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=S+vT9vEZXXGE5nylP28OP5E16FdGgGeVcWYBckNJ7xA=;
        b=sLe3E8rS4ogsdzLVnBSpd0l+l5dJZ/LbWZrOsNrxhS7ZBPHnSAMIGM6Sx+L3KmqURg
         QKYdHAdH1CN0HnXRwPthQY3TcwdYsJxQGBAMzv2p+oX4cHgdillsg5NPDPresvHHXoIp
         IvkIiMea6HlmtZDcvQ5Gg6i9ClkX3Hd68UfARXg0iKczxvgRBHIoGwPLrpKMnTmjpWok
         cnY1EsRpTnj+3wALveM5rPCtRPlZlYq2Haaco5bYZWnXi7NbQLYKH5lwdixX0Twlcx0j
         bGQtA7ECYy6tLtaudtevzt7MA1XPom9AnhbocIz8eyML+paC9MpzbFk1+ZZOkM0+i8mG
         b/OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794996450; x=1795601250;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S+vT9vEZXXGE5nylP28OP5E16FdGgGeVcWYBckNJ7xA=;
        b=mLecY4BwdhtfcRNrwiIgdAWPpi/eNYcdbs/+vaEU9sNgTlhelJgOBmZr1pjivtvE/U
         seqSzjXey2KbLi6sv/bO6KqJl1C4GZ+BxTs56+Tlk1r0WWIDBDLD+w5KB88nl22fykZs
         nfdL9t550WbjroLEJuY356q+RRv0jOoleIpFcbMX/XxBoz3zVK6moYOiFOjQLGEVmHk2
         tlZO2N2R5IeFyGrjhw2tZ60Vc0wFTsgJRAHukYwKNW4l2t26LyD6SESgnlGhtQVIrDUR
         fMf4SUtizB22hUpf1nPHshljQzr9fIKfe699B82VTE3+nXHB0ot1bHafg5/vJxRkJCZX
         FwBw==
X-Forwarded-Encrypted: i=1; AL+hErE0h7QJ+5WNqLd79CgSAjdmKI7pEivguCW47wS7dyGjDwjnPCG/wDCkYJKehnk7A+/AOMM1LB5r2heDp5/X@lists.linux.dev
X-Gm-Message-State: APuU4Z/wzzAqoEZ8zJLZ3hKfVtLmjlIKwL1lUTNuBXLVSv8jTYrn1bo4
	6LXMD8Se07/96IM/NRvFA0lDNHp5UoKVV9hP9KRw/YSvSTcr7XwQ8EpSMQawhKgtSuyQYayg7AI
	5MHGn2YuA3/3Zt7hMmE3lcbFWMyuOWUQ=
X-Gm-Gg: AZFdTZfVOjLwGhquq9liXBCcxLnsJn+4+nLxsi6qf7xZctanGs3bP42e8S/dbtIT+Jr
	CW1gQ0vffiCc/9H36gTqqG2kAbpS9h4fyoBSozUBGBfIvBDzYPROpTRP0po5906HoLcXnQd3hS0
	L3sM0nCdOEBMlU7vBVWJjeznFwKKAqykAF9ELCiSoCNGKxvcOezT5kmCm0lrjdh8uKvT3M4Ie42
	yrL73wh7WUoY6gCvHxKS0KySDwhUlHin5sCH46IpU7Af6ea5oHbRlaAKSdqy1e7dkP3WwIC4j0j
	Yvj46YFH59DAo4hgrv0ukiXtpZXwxHYol4buKAFf7+iR5NF4Au+XRC9W4aO5Zh07F3u6TaCwIn8
	4IGHHfYoNAvlvDUwhi+Hm2mrlt4f9JX4Xlfoyh29h+lRMCWRpok5zZtwAXpAdSYr1MRIIO6Z+kp
	MgSd3dhBBItfNpWAUDz0DdgDVvdj1+zoiQiTIf22YnJ9EnFFR661MEJHrltuRuL1O1v8g4k86Ak
	UZhSQ1AGdawar79Js3/islOvIJbWBp1wr4ZspCKmgHq1ZUARyQqFibjapyyjw==
X-Received: by 2002:a05:690c:a402:20b0:8b5:6e9:2183 with SMTP id
 00721157ae682-8b506e9277emr1851467b3.7.1794996450036; Wed, 18 Nov 2026
 02:07:30 -0800 (PST)
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261118095314.42769-1-patelshivani2283@gmail.com>
In-Reply-To: <20261118095314.42769-1-patelshivani2283@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 18 Nov 2026 12:06:53 +0200
X-Gm-Features: Aa3M54qZ8hkps0LsViVJo_s7XZ7AAjtX2_rzeA2MmsfOWg5FnTjwadGRxEgW-j8
Message-ID: <CAHp75VcPRtBpFmrd0sRD3HHPd3dMgwATzUxTyfkBPkuSh_xABg@mail.gmail.com>
Subject: Re: [PATCH] staging: media: atomisp: Deduplicate and reformat atomisp_find_in_fmt_conv_by_atomisp_in_fmt()
To: Shivani Patel <patelshivani2283@gmail.com>
Cc: Hans de Goede <hansg@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Andy Shevchenko <andy@kernel.org>, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 18, 2026 at 11:53=E2=80=AFAM Shivani Patel
<patelshivani2283@gmail.com> wrote:
>
> atomisp_subdev.h contains duplicate declarations of
> atomisp_find_in_fmt_conv_by_atomisp_in_fmt() under ISP2400 and ISP2401
> comments. Both declare the exact same function with broken formatting
> (lines ending with open parenthesis, leading spaces, and awkward line
> breaks).
>
> Furthermore, the definition in atomisp_subdev.c uses the same broken
> formatting with leading spaces and a line ending with an open
> parenthesis.
>
> Remove the duplicate declaration in atomisp_subdev.h, place the return
> type on its own line, and shorten the parameter name to 'fmt' so that the
> prototype and definition adhere to the 80-character line limit and
> Linux coding style.

...

> +const struct atomisp_in_fmt_conv *
> +atomisp_find_in_fmt_conv_by_atomisp_in_fmt(enum atomisp_input_format fmt=
)

Can't we take one more step and drop the duplicate 'atomisp' in the
name? The quick suggestion (you can try find a better one) for the
name is atomisp_find_in_fmt_conv_by_enum() and also rename
atomisp_find_in_fmt_conv() to atomisp_find_in_fmt_conv_by_code().

Also drop stale declaration for atomisp_find_in_fmt_conv_compressed().

Altogether, make a series of the three patches:
- drop duplicate / unused declarations of atomisp_find_in_fmt_conv*() names=
pace
- rename atomisp_find_in_fmt_conv() to atomisp_find_in_fmt_conv_by_code()
- this patch that renames atomisp_find_in_fmt_conv_by_atomisp_in_fmt()
and fixes formatting

Don't forget to add a cover letter.

--=20
With Best Regards,
Andy Shevchenko
