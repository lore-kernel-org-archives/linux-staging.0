Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9BAC233723
	for <linux-staging@lists.linux.dev>; Sat,  4 Apr 2026 01:17:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775265433; cv=none; b=cdjSbfiFl+YQAiJkSoX2xkLEqf8tqA+CQnZurIrE/hvb85ToSEwTCXMdTrwt9kfXcToDWSbR0WLq/KZr1q/52//YYHHh99dctncwlJKOJqtiV2txVkE2wlPcCICzpqxNYK9Q4kDc+I5ROPiH3qAbAccDp6MdOv+MU6U+fCG/xU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775265433; c=relaxed/simple;
	bh=BZxH86q8tqzpLi93l6aqmPSGiyiRO+dgel8vWSXi684=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=K99u0bc3LlrUOL1mmpJy2indi3pJ2b8CAZ5GPBU+iLdft+ty8ZmtVy/irmXJSka9iOW39MIOwSI+tH8f0X/KCg9aaE8lJ1lkEzNafoLS0Ppz6XB7NoNUumpYihZwl33AWhe3idvIbkd7VNNRCHM+6sN4YxFqJmOJfDnLlzh9aGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IOPnJUBa; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IOPnJUBa"
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-7986e0553bdso22940137b3.2
        for <linux-staging@lists.linux.dev>; Fri, 03 Apr 2026 18:17:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775265431; x=1775870231; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BZxH86q8tqzpLi93l6aqmPSGiyiRO+dgel8vWSXi684=;
        b=IOPnJUBai/fjmNJYUKzLBwt9ae1qVlnpD3N5/LfFlHbgjwpsTa9s5pdzTxpkEkMLoG
         pB7Q81CNlesHZ5yIAi+LFZrqjPeEAOKD5RT7lYxOV5Zj0hSbc4qXaGL+BLO0RF+ZTes5
         iWOMUraTxIZmsOronFZzjq9y3r9eQCKtwF8Lgj7yfEGnrDU3aBKe9jEDZItMHeG7J2m5
         Zitccsitng3jGcQ1x2EtJR9QlQm7SlpOk04BDZr5e9V8CiwpffAbEmVq0ptcfq/D89/R
         3KwduYLCJhjGSmZI3FxRbQmeOx0LDXAEO1SvsFq0ceTsdUQPVGfSTkdf/VtTAg2jttLS
         RI0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775265431; x=1775870231;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BZxH86q8tqzpLi93l6aqmPSGiyiRO+dgel8vWSXi684=;
        b=ecNcVGQnlby0qN3KXTHG2dH84cWlAOPewxmPYuChlOYwJSK9FvZhT4jVF7rR41OvBr
         pm9aBJh7FVQ9SZ4aDLD/y0sWu9Y7eNWwloOpZ8dljPL2A9IcvmoC4LWd0ySVopJ9b02r
         Y36K5CUmuvuJa9m0DXSWHStoSR6RbonoiKCuYqwrou1zZANqC0RCFglGDD8JlZg/DVwX
         Wuv3q5i/bXmwHndoZ4MmUq0cdTYUdL4Gw2CH6N8SUzQRTzD5zTt3/9LvmpmfhCWlm1Kh
         BFbmfDySJnNw2gtf47tSnjsKbGDiDX5NjK0EtP5AiKr6gf1oaGPkTKwfMnUHXuQZPpH+
         dGuA==
X-Gm-Message-State: AOJu0YxWMPuppwgJ50P+Bli+KH6rjOYl66YYHnGqwYY1nkYtQOmZZg5/
	R6UZc33aGH6j7Xi2kY4+aKcZt8pmKNueY4nRnvk10mgekbAMP8LPW/S/
X-Gm-Gg: AeBDiesMetNWQelOzcqr8eeZ7XCEGKE15En43PTpZgbYIOdZnKGeKBwwu8t27W4UzPY
	LdPbP/dEJ6KdqFY2sus+YSElI+lT4bEXMB+T8/QbIwPj6u7+34mZgVU87ka94S8zPLYQUR0gj40
	x7cCMgBYlWyWX15Ji2e+upjWEOgLcnmWYPGRpdwuezXWD2OqOolj18QRWaV1PUIzpPyvqQCOJeJ
	EpGxGMqqozMTzMOIxWnN6XnnKjN4s4BWDg8/tZ14bzBkQB/PV5wLTtCzjedjKsoKG7WOYf1+CYZ
	E4ZgMtzgD/hHDZk6fjrQ3Y/MhMdKUyWyadIdCUduAFTE0mrWPK8RUIcvvIC2WW5Tt12pWsaHWKA
	fKSZE9Wd8ldR49KwJL1HpVsbGvzxK8wAMgamwTZnJKAP/MNp7aZr/H63z6VraU8oNuLiSTlzEP8
	C9EyuWXy2OzuYJoB0aFlFPt/4dq+vMEGeCAzrA98wxbHuOFkvCKIPodToRZyR8NHhYlNEW/88BG
	TF8mFvsiSeKFNk8HPfTnYL6zikofFOmzO2LCi2ORTqE1hYsqxJBpcORNQoOg//kzSo=
X-Received: by 2002:a05:690c:6c13:b0:79b:e346:fcfb with SMTP id 00721157ae682-7a4d536d25amr51724197b3.32.1775265431442;
        Fri, 03 Apr 2026 18:17:11 -0700 (PDT)
Received: from localhost ([2601:7c0:c37e:2360:70c6:b5f8:68a7:2f7f])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7a36e8343d3sm27262917b3.16.2026.04.03.18.17.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Apr 2026 18:17:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 03 Apr 2026 20:17:10 -0500
Message-Id: <DHJZ2NZMM7HS.3MA13Q4NVQN6O@gmail.com>
Cc: <linux-staging@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v5 3/7] staging: rtl8723bs: rename EFUSE_Read1Byte() to
 rtw_efuse_read_1_byte()
From: "Ethan Tidmore" <ethantidmore06@gmail.com>
To: "Linus Probert" <linus.probert@gmail.com>, "Ethan Tidmore"
 <ethantidmore06@gmail.com>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>
X-Mailer: aerc 0.21.0
References: <20260402054215.271981-1-linus.probert@gmail.com>
 <20260402054215.271981-4-linus.probert@gmail.com>
 <DHJUFTYOW0C9.1KG9RVHIZID46@gmail.com>
 <DHJV2X9P1XP8.2L6P5A8Y7G3EC@gmail.com>
In-Reply-To: <DHJV2X9P1XP8.2L6P5A8Y7G3EC@gmail.com>

On Fri Apr 3, 2026 at 5:09 PM CDT, Linus Probert wrote:
> On Fri Apr 3, 2026 at 11:39 PM CEST, Ethan Tidmore wrote:
>> On Thu Apr 2, 2026 at 12:42 AM CDT, Linus Probert wrote:
>>> Renames EFUSE_Read1Byte to rtw_efuse_read_1_byte in order to conform to
>>> kernel code styl.
>>
>> I missed that you misspelt style in my last review. Sorry about that.
>> Also, its generally wanted that you include the change logs in the
>> actual patches themselves.
>
> No worries. I'll fix and also include all the v0-v6 history in the
> individual patches.
>
> I had one question. If you have provided feedback on a
> patchset. Should I include you in the 'too' or just stick to whatever
> get_maintainer.pl spits out? Can't recall reading about any general MO
> regarding this.

There is no hard-and-fast rule but it'd be good etiquette to CC someone
if they reviewed your patchset.

Thanks,

ET

>
> Br,
> Linus

