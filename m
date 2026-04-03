Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3655B371CE4
	for <linux-staging@lists.linux.dev>; Fri,  3 Apr 2026 07:14:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775200497; cv=none; b=euh9OS+R9SN5PgfAfL9yN5RWpbGHHQNKw7AF89kwIU6n5uLgdbwU0bN/nyjnWZPOcDWXTDWe7T8CKfQv1ALToHf2U01natRADIohJneNBpPSSeoQSiEd0WBCXJiVgcQGanpOljGmu1Zb9b8PNl7jIBfwVyriCDf8jeIX4mpvY0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775200497; c=relaxed/simple;
	bh=FwKHwrAV2i50z9UGJZPZYOPOzl6ymSmO0b+SpOfIV9g=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=l6nI+drwwPUfHD6Uh1EAbSSjSrkplbdcSd8he3GdA70ALB2Q05gspNoy7Vepdtr2aQrtmSgX1HbNzQXz/Tn3ZhhZDYu4/KNKRFjKA5hkT9WBdYg+Y3Kt7pN8nPAR5xTscSX2/eh+Gj8ySW7/Uoy4nWyrrNFb2r58iQmRfCiacdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YHUyuieF; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YHUyuieF"
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-79ea87af213so41463167b3.0
        for <linux-staging@lists.linux.dev>; Fri, 03 Apr 2026 00:14:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775200495; x=1775805295; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mdY9dtEEa6DLICSQktMXQSdPzvn36B86E1iBfLofCTo=;
        b=YHUyuieFUOuo2a4A34VBJ9oXF0CZ/+amR3cFjENn5qCFx+bbvqCHBaeeJzEBJotmHa
         k9rFFM1VJXG3cLK+4yKj7oUfVM+p29Xulinr9XHWxcdYgv5WLDvP87Xv2cdUOBMrYiMO
         vDyZYfZvvofoGGmfJtayB2eq0JO+0hwDxAPa08pv1IfCmluTsWHHw/PdIz7JqcNjPKTs
         NadB60WlQ6n3fYkFU3oSJ3BvyQZMwuPOH1xVqk8GLgt1bGRRbbePoPXb/USMROajvC//
         OORZeo2iOgpgrqN4yFPpj4j3y8TOJFt3hyMvAfAyS0zR2ncwEIAILjB3naP39vD1VxZP
         D8vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775200495; x=1775805295;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mdY9dtEEa6DLICSQktMXQSdPzvn36B86E1iBfLofCTo=;
        b=Ul/h9FjP9nFWVx4eZBNzpMaS2iclT7dWz5CpMvOMPVGBbPwOva6RGBgMpX6yU3HcFG
         z6s4w01/nbqHbnd9Qy6tPZZ8seYh2NE7Hvi+PGwBRv97Qo95EUtMv+Iw7c2z5I+zySlz
         /0BkxL3iXn/L/RqdXFt6+Inbvj6ngmMI2//RLW77hLJEckuzQyn8ObiPljmRQ6rhHDGD
         /klsbuXgWBQiNhCpInh+KlbSIeWPmueD3Tgo80YHlIrnuqreGIOMY2h/XjfC1+oN0XkV
         BznU3+8V6F6t6sGbbWf06HXr/TWNV1HN607rG+P1bnE49Z2ERDOAO4+QrMDuAqVPVugR
         1jrg==
X-Forwarded-Encrypted: i=1; AJvYcCXEP1w6411aNqF9KQkzN5QuJBek1kMrt7f/6u3A1ubhIPOzn7GzN22La6GZDzJdjxr0ZhT4lyDJIskccnIG@lists.linux.dev
X-Gm-Message-State: AOJu0YxaF2ybEG9ey3wxyjoOiOXwixtACVOkPnAxlU/oUv5Z5pBcUaOA
	ZFSjPU+Jxgxzg1k17pwoDTb8UDdx6U9eZtqkwGz1vXHf1KkW+OMpZi5H
X-Gm-Gg: AeBDievnWGOCAmDUuvD73kFYJyMapOyA5hhtFK+ky48F8giqcDojWeobf2fyWBk435C
	PfWLzao66oHjVTm3nvcHTmAlWIjzh8SFh79neYW4gHaSXH938ovt0cPK9WOoqio8reMfXrIhQVr
	+JwyZgaNSZK+jgf88leVRQN5nL590MW+xTt9USeSRfdM5Eu3tl2Ahs59+hvXNOd0rHVrdAg59r3
	L+gYrPdn4i20Z0gxHPU66VApiDvCerr3Vg3Cwrqqf+KhVWAQHVhiI2/g8QMwmtQXh0JIt5bmitC
	jDZRLkhLNgTI+WVH/lAIvJFgcZ6F0d+/u6Bkdj9hyB4N9+GKdX3ZY9h/B5IayvZU9PPDBz6hSmo
	JLraFS9NgskmGsciGuBbKZbzfAc/GsQqONpWktNMxGwpSRstkSog9ShcNA8GycJxyO805CfeJFq
	X1xWzevxpidKOp42jOJ9iWHKgp8sUMuPwPcQrtQSohrEUubHe9kuj/as7yDpB3iVV6NpbSlrGtv
	dCxBlqfPG3b8JbQPEn3nPdsIbL410/y
X-Received: by 2002:a05:690c:660a:b0:798:5213:d90e with SMTP id 00721157ae682-7a4e1e2fd11mr15718297b3.25.1775200495131;
        Fri, 03 Apr 2026 00:14:55 -0700 (PDT)
Received: from localhost ([2601:7c0:c37e:2360::17e2])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7a36ed2bb47sm20323557b3.21.2026.04.03.00.14.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Apr 2026 00:14:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 03 Apr 2026 02:14:51 -0500
Message-Id: <DHJC1ZE0WOIT.OF8R01UR5OZJ@gmail.com>
Cc: "Andrei Khomenkov" <khomenkov@mailbox.org>, "Luka Gejak"
 <luka.gejak@linux.dev>, "Dan Carpenter" <error27@gmail.com>,
 <linux-staging@lists.linux.dev>
Subject: Re: [PATCH v3 0/6] staging: rtl8723bs: cleanup code and style
From: "Ethan Tidmore" <ethantidmore06@gmail.com>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, "Ethan Tidmore"
 <ethantidmore06@gmail.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260402150429.14761-1-khomenkov@mailbox.org>
 <DHIZW7VQ8J91.ON752XZ2E2L8@gmail.com>
 <2026040335-ipod-pregnant-d48c@gregkh>
In-Reply-To: <2026040335-ipod-pregnant-d48c@gregkh>

On Fri Apr 3, 2026 at 1:40 AM CDT, Greg Kroah-Hartman wrote:
> On Thu, Apr 02, 2026 at 04:43:06PM -0500, Ethan Tidmore wrote:
>> On Thu Apr 2, 2026 at 10:04 AM CDT, Andrei Khomenkov wrote:
>> > This series of patches cleans up the rtl8723bs driver code to improve
>> > readability and better aligns with the Linux kernel coding style.
>> > The first three patches simplify boolean comparisons, and the next
>> > three perform general code cleanup.
>> >
>> > I figured I needed to split the changes into directories, so I did
>> > that. I also think each commit should do only one thing, so in the
>> > last three commits, I fixed the style that wasn't related to the
>> > logical changes with ' =3D=3D true' and ' =3D=3D false' that were in t=
he first
>> > three commits. However, if both the logic and the style need to be
>> > fixed in the same commit, let me know, and I'll make v4.
>> >
>> > Link: https://lore.kernel.org/linux-staging/20260330184640.17795-1-kho=
menkov@mailbox.org/
>> >
>> > v3:
>> >  - Split the commits into even more commits, each commit
>> >    affecting one driver directory.
>> >
>> > v2:
>> >  - Split the single patch into a two-patch series to separate=20
>> >    logical changes, as suggested by Luka Gejak.
>> >  - Cleaned up additional boolean comparisons found using 'git grep'.
>> >
>> > Andrei Khomenkov (6):
>> >   staging: rtl8723bs: core: simplify boolean comparisons
>> >   staging: rtl8723bs: hal: simplify boolean comparisons
>> >   staging: rtl8723bs: os_dep: simplify boolean comparisons
>> >   staging: rtl8723bs: core: style cleanup
>> >   staging: rtl8723bs: hal: style cleanup
>> >   staging: rtl8723bs: os_dep: style cleanup
>>=20
>> Instead of "staging: rtl8723bs: os_dep: style cleanup" do "staging:
>> rtl8723bs: style cleanup in os_dep/". For this driver the standard
>> prefix is "staging: rtl8723bs:".
>
> Either is really fine, we are not _that_ picky :)

I feel like you've corrected me on this before, this time I thought it
was a little different, but I see what you're saying.

I'll try not to be as pedantic with prefixes anymore :)

Thanks,

ET
