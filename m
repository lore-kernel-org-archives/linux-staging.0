Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03EF13AD530
	for <linux-staging@lists.linux.dev>; Tue, 23 Jun 2026 21:21:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.217.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782249707; cv=pass; b=ZBLfACNXi4yYFMAlnDrgrQBYcyDFZt9j9r/8C4zNYZhFYA9YXZbW+lrs59H+LCZ1463X65wj6v6hQbxXh7KgnedJHq9QyP3KWJ++L6Nm8haOeBn4Zdb6EMAJJWBTKGHbOpsAp+AOpv69Dr6qcIZurAqEy0uiT3thIOcNyIbji5k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782249707; c=relaxed/simple;
	bh=HuNz3gzaU3SpTitrCcjHSjnqT31gir+cVrJY9GeZkhc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DaEmPodL5zYhfKVeYchWQLDEId7wFcKHlpRCJQW6vYKNVygXrO/mvrbEjIlnQQTe/pB/VIVr+eeU+wzTQ+tSs6UL9LBnJsQXHF1tI4S1n/fseo8ewps9l4wSjpOrE2vCDJZoJWS2mqXftlEv4xVrrd0E3pvUDropmcZOGxLgTwQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ItVCcz9M; arc=pass smtp.client-ip=209.85.217.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ItVCcz9M"
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-6c4a2458683so155330137.1
        for <linux-staging@lists.linux.dev>; Tue, 23 Jun 2026 14:21:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782249705; cv=none;
        d=google.com; s=arc-20240605;
        b=GxsYaVx+ks4h6K0uPq+7QCByxAXCb+/CtBNTlYx3jTvm0Aq1Eg7SadeMhNfhQs8RgV
         QP2YtQbebYprPl5CIh9etp9q3PCPPW6IsqCLLkf9VWcGQQr81eiXrgIvbNBFhx8TFGpR
         ZZv5KVEeMBGNqAhgdX3VFQS7TPCFqfuttMqhYFEAXLTDQuDap1WRG6LBnC/0of57lj2s
         TKuNpPPhPN+YREodDK07CAEOf83z23etfvtnaCkDhgAYBA0UQuObQqGP7q4tUslrYG/i
         4IvX/TT6Mj+7Rr0ptqPB1txddFpu1eeju+6DaEZUdupwMtj7Cx6CufaKjtir0IjFCeCS
         PsMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=olFbU39DFnBsSKO4a2kVqBncWeM8bqNzeNyBo1mvm6I=;
        fh=KpPEheZz8A1qTbIW3qKKM2UyHJLLQ+uPd0gfwMnED58=;
        b=ZH+LW3JQ7GUAPE1+yPsCj2Gx7EGo2YQtRsh4x9fcSIRs42g/kqwThwYA2cNxkM1FNe
         0td2Xjw7d4lGMq2u3iMLQfqgMfmpGc6soCwxHjchejtQQVGox/hsb/X419i1Sd9rxUZJ
         u5S0P14SchqBDXLlcsmVXn9a3UxVFQFZpiTjzmHlpfhcYXy09Svk1GXDtk00GR9BYBAf
         v5I6SjdvfHlxSFfaJ9ZaB4q6Duzdf4Syd7eJVlNXYiN+cGILbFLii/hEgw6LpuRoxB0/
         TJZmgqQLCZNUrLil4Dy5vYiELKbkZt4Itrq0YuERXilf83KF0Cf3MGbUIey3WAr8lBr5
         KQnQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782249705; x=1782854505; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=olFbU39DFnBsSKO4a2kVqBncWeM8bqNzeNyBo1mvm6I=;
        b=ItVCcz9MLFCKxVj35W/kmcjrUFkzAYqX1cqVPyiSEL6Yd2uzYCX7rVmDaSoHTr6239
         A5GjeTNoiy+Z12Y+3F6qX3if/IXlRI9TFBxFQUa/wMZXmgKqR/OJ7ARttq/JGR6xWJYg
         wdztXrOvZQqtPFEN0gWIy2Fz6pILBM4PDz5KWII0U2T95TQd3/ufUU7ozMxBrgTJ7JAb
         ZOgH0MW0d6HdDcIPt054NDL9w5p1jJV3TypaWCrP7MQWTIZZz0VLm4edaIhzzsQ3hIT9
         Q98fxt2QDqVDW0HT6KCE9QsegEvg8xSpa9FHQwKZrU9nkzx0hY6sgswlrhlRGKgyzNWH
         2DnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782249705; x=1782854505;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=olFbU39DFnBsSKO4a2kVqBncWeM8bqNzeNyBo1mvm6I=;
        b=B9AqzPSV0VyZJLXI1UrZU3nI8NljOkBmq6XLpM+AQQgWo2T7iBOEK/4+SZDpJFIKLf
         6DYOfH4pkb1wjPHPHZBRm9LTvPOAt9wrWW+P4r9F7gPiDMMu5CRVOxT7L2F6Hhjex27+
         mg6G476x3A4usz8+aD1vL2bhrdCYYUkvolODeFblvpMbKXV8MfXM2JGlwUvMU5f4td1a
         UQh5ucMCcQi3zLNugGROOIc4KXdeKVjRT7I0OGs8rMYXQvco9xPvLw8v2mxthBEaC193
         XEObrozy2PMkGM/CDpPB5SYKOiXrnO9hLMcBKBMMrEeWQOlxLbZehpRcekZ6WQAXOQyc
         0V9Q==
X-Forwarded-Encrypted: i=1; AFNElJ8mT+MS2lSWnrv+RSvZAaqBz8ohUEi82yOfQcyvZl82YhxMpyajuy/OPYiFxF8IowYi5hNDP4SHyMXhcLrt@lists.linux.dev
X-Gm-Message-State: AOJu0YxTer2ulALn/hhuSCuz9faeCfHezKisXDcoDm0sFL6LSFn7qMvl
	3l2532ACcI+yfN6Np4j04KN7t7ifC8HJJvYyx9O7Tya4573PQGQ7tP1v0KmIxA3Me6jLRWvBE4c
	wuPz7xLXA1AF4P/fhgt3QhMTSoO7KyMlUAIH5nvQi8Hqb
X-Gm-Gg: AfdE7ckKX+uPb/KTLuaFNje23VlRE7DGr1lb6VY9dURrmMSpC9/5GQjlg1xVM6/0kEs
	kX3983i4VnTumtN8oNGZBiJUx0c8Esa2Bgud0lrnzF8gJuvUzcvHblbwxvQXgM7thuh4m4cNGL9
	CMEb28TJhkIVGh0rYgtecBxGlTPxC3k2moPVkGfaZHQqyLb+OW1m5wXX4VcOvDuw/0Hv1I14g4W
	ApdxpFDxpMhQuS3fUrEwIWoFTg6nCUEn9LtkegUO4X8dosSTyEXn2ymmTYRwPL2Wazfx0Yr24To
	2BweLH8CYg==
X-Received: by 2002:a05:6102:953:b0:631:b834:e052 with SMTP id
 ada2fe7eead31-7311370159emr292424137.12.1782249705032; Tue, 23 Jun 2026
 14:21:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260622200239.14683-1-andrem.33333@gmail.com>
 <ajobVOpSu1PMHaNo@stanley.mountain> <CACO0qFLm0KCdyiKuaQQy9zwX0iwEStgg7n0XyyDP6DOBX+ZF3g@mail.gmail.com>
In-Reply-To: <CACO0qFLm0KCdyiKuaQQy9zwX0iwEStgg7n0XyyDP6DOBX+ZF3g@mail.gmail.com>
From: Andre Moreira <andrem.33333@gmail.com>
Date: Tue, 23 Jun 2026 18:21:33 -0300
X-Gm-Features: AVVi8CfwBCD6LSV3vmKyidR4Jc050w9Cy_5ytpkDQs8XyhW_hSI_HAztgc61Rek
Message-ID: <CACO0qFKBW8WSKNVaJ-8ps6k-TCVEpc_-sPucP67x8r=YW8WSqw@mail.gmail.com>
Subject: Re: [PATCH] staging: rtl8723bs: clean up style and dead code in rtw_recv.c
To: Dan Carpenter <error27@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Em ter., 23 de jun. de 2026 =C3=A0s 18:11, Andre Moreira
<andrem.33333@gmail.com> escreveu:
>
> Thanks for the review, Dan.
>
> I see how removing the 'else' broke the loop logic there. Thanks for the =
explanation and for catching that.
>
> It's great that this helped identify a pattern for a new Smatch check. I'=
ll make sure to double-check the control flow on these legacy cleanups next=
 time.
>
> Regards,
> Andr=C3=A9
>
> Em ter., 23 de jun. de 2026 =C3=A0s 02:36, Dan Carpenter <error27@gmail.c=
om> escreveu:
>>
>> On Mon, Jun 22, 2026 at 05:02:39PM -0300, Andr=C3=A9 Moreira wrote:
>> > Fix checkpatch.pl warnings in rtw_recv.c by removing an explicit '=3D=
=3D true'
>> > comparison with extra parentheses from check_fwstate() and dropping a
>> > redundant 'else' block after an early return.
>> >
>> > Signed-off-by: Andr=C3=A9 Moreira <andrem.33333@gmail.com>
>> > ---
>> >  drivers/staging/rtl8723bs/core/rtw_recv.c | 5 ++---
>> >  1 file changed, 2 insertions(+), 3 deletions(-)
>> >
>> > diff --git a/drivers/staging/rtl8723bs/core/rtw_recv.c b/drivers/stagi=
ng/rtl8723bs/core/rtw_recv.c
>> > index f78194d508dfc..3fb48a8a52b17 100644
>> > --- a/drivers/staging/rtl8723bs/core/rtw_recv.c
>> > +++ b/drivers/staging/rtl8723bs/core/rtw_recv.c
>> > @@ -1597,7 +1597,7 @@ static signed int wlanhdr_to_ethhdr(union recv_f=
rame *precvframe)
>> >       eth_type =3D ntohs(be_tmp); /* pattrib->ether_type */
>> >       pattrib->eth_type =3D eth_type;
>> >
>> > -     if ((check_fwstate(pmlmepriv, WIFI_MP_STATE) =3D=3D true)) {
>> > +     if (check_fwstate(pmlmepriv, WIFI_MP_STATE)) {
>>
>>
>> Someone already did this.
>>
>> >               ptr +=3D rmv_len;
>> >               *ptr =3D 0x87;
>> >               *(ptr + 1) =3D 0x12;
>> > @@ -1841,8 +1841,7 @@ static int enqueue_reorder_recvframe(struct recv=
_reorder_ctrl *preorder_ctrl, un
>> >                       /* Duplicate entry is found!! Do not insert curr=
ent entry. */
>> >                       /* spin_unlock_irqrestore(&ppending_recvframe_qu=
eue->lock, irql); */
>> >                       return false;
>> > -             else
>> > -                     break;
>> > +             break;
>>
>> This change introduces a bug.  I created a Smatch check based on the
>> new bug.  It's in the Smatch devel branch.
>> https://github.com/error27/smatch/blob/devel/check_pointless_loop.c
>>
>> KTODO: review loops that are really if statements
>>
>> Some of these have comments where it was originally intended to be
>> a loop but it lead to bugs so they hacked around it by only looping
>> one time.  These are mostly quite old code and they seem to be working
>> okay so probably they are false positives in one way or another but
>> just I feel like most would be more readable as an if statement.
>>
>> kernel/rcu/tasks.h:1521 rcu_tasks_verify_self_tests() warn: replace whil=
e loop with if statement?
>> kernel/bpf/btf.c:7383 btf_struct_access() warn: replace while loop with =
if statement?
>> drivers/net/wireguard/selftest/ratelimiter.c:170 wg_ratelimiter_selftest=
() warn: replace while loop with if statement?
>> drivers/video/fbdev/sis/sis_main.c:2226 sisfb_sense_crt1() warn: replace=
 while loop with if statement?
>> drivers/video/fbdev/sis/sis_main.c:2228 sisfb_sense_crt1() warn: replace=
 while loop with if statement?
>> drivers/video/fbdev/aty/radeon_base.c:1556 radeon_calc_pll_regs() warn: =
replace while loop with if statement?
>> drivers/media/pci/tw686x/tw686x-video.c:133 tw686x_memcpy_buf_refill() w=
arn: replace while loop with if statement?
>> drivers/media/pci/tw686x/tw686x-video.c:159 tw686x_contig_buf_refill() w=
arn: replace while loop with if statement?
>> drivers/ntb/test/ntb_perf.c:462 perf_cmd_recv() warn: replace while loop=
 with if statement?
>> fs/afs/rxrpc.c:526 afs_deliver_to_call() warn: replace while loop with i=
f statement?
>> fs/xfs/scrub/attr_repair.c:532 xrep_xattr_find_buf() warn: replace while=
 loop with if statement?
>>
>> regards,
>> dan carpenter
