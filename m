Received: from mail-oa1-f65.google.com (mail-oa1-f65.google.com [209.85.160.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7343A342C93
	for <linux-staging@lists.linux.dev>; Sun, 26 Apr 2026 10:20:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777198841; cv=pass; b=uLLzb1lgip5cLxYnHpnLfCOswjUM/5rVhsPHA28VU3Al30XC0Sy8jh1PBvlylg2l6CmAlbWoTwSVYGuBuZicjwV+rOFD1zYbaM6PT2ZM5GGy8gfBlioZSrbaEVFYYHYna2NXdZReu/QkWiLgWDj3WSmGC5mu35r3z9PC7qZLR20=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777198841; c=relaxed/simple;
	bh=LQvH2mbwegrN+VEQidG8kTSQZ3rKVsF03ZG4LsQ5/jQ=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=SZAxe6q/0EWt2jindyi6ivfQBHX+fPP0aWPwmb6/B5Ztb8KQDYNP2seU0yxixQINXybgIzF9G7RUECVhNV125Ondxx3j4MMsOv+E6ps+/y0pXCSlpdbsZhvFpwcz7PvDmYA07eap8H7NxVqEIRLUpC7ew4ZGWZqA8nTkEinDXOM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A76DKmWo; arc=pass smtp.client-ip=209.85.160.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A76DKmWo"
Received: by mail-oa1-f65.google.com with SMTP id 586e51a60fabf-40427db1300so6944537fac.0
        for <linux-staging@lists.linux.dev>; Sun, 26 Apr 2026 03:20:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777198838; cv=none;
        d=google.com; s=arc-20240605;
        b=FRWhotd5EPccVTvUmDQ39wa4Z6BmKqONPZyhAw8ESdevU1JQlFMBr7lTuUZXdWkwyL
         qRPQs3hQgS57mhfn0Ks0eOo0MOQl69g/5vVMcAn3UGE6bizFDmExkB/L75U6NTY3CaA2
         Cf9YnAuehR0gDLQLSMSfBLe0Vkm9Qy3DM1RuKMB7gvRO7GNnR77FKGMtIX90/1SlCBuo
         bWq41QYZi8CqK+bB1+Kvj9Ues/53ztO0wOLax3n8rzMRRzjjXGs9ravTqp2ZFRjs4puA
         l/jin4Q0SxbIgr+2YdYwy3jQXnTsyu1IXHG/J+IZnwx9kcBfwfeuHMRY/G8COspQk+0W
         OjBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=UsEBY7MkMLZkCgWqS4uRi4msI5Oa3QX74tFzDUVaMfo=;
        fh=OGuGyImkAcJwt+sRhpXRgKfXKBxNQnSga2zoz3XK8eQ=;
        b=YlZ8hlzKFK0gpz24NPDTcyKCRTeIhrgZwv/OnUupS3o1zm50kDELm4jtI9m6w9b0bM
         lK3r92n5KNj4wC34HOzW7S5WYwOXXVXmtDIX8NvFGeTPg9vgR3HavmDWJOPsBBnU7roI
         EDVFZyiNYirdg9HWl0NCR/68eG/qOXAHMm9xqmpb1iK9Cli3/qrIWbPMJEZ6zx9KdN3c
         Fq7ZgNIjUf/RNPDppaBnWA0JwINpfzeGd5y0fEtY6CFAtL+C4j2lcrjj5lkGEzv5GOsC
         opXhDo/suCg8T4sLnPethJiQ1+VAZegGfj+yZa5ILKh7MF9chG+lcFsZFn+yowswSPf1
         lW9w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777198838; x=1777803638; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=UsEBY7MkMLZkCgWqS4uRi4msI5Oa3QX74tFzDUVaMfo=;
        b=A76DKmWoGgMLtKdhbY+ErZfSFWiVsbF6SvSG0/ij2bwWcQarNIUe7c6x4KEZ7gkVkt
         V3CQgMp3CP6wBcgk4A257B+m0BZE+3qhgFJ7gzCPuSChFD3MWmx+4z3CYpZsuhwCZzFs
         p7+NTs1YE4dtWgY9aLH3GPNtzVJRI9UFJi2cbsF2QGNv7fDkRk44Ao6mp81lfQuvZWJd
         TFFRLZ2F8VGKyuW0IHqv6Vv8YRM+r0EiKozkk138IjazPTm8tDY0QKx6oQqthdns7STh
         OB450wdvcNIIY9flc++88XucA9s2jwhtPpSNKsigUm3govZW3IGH0Tf4bxYo4Cx3HGoE
         oDDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777198838; x=1777803638;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UsEBY7MkMLZkCgWqS4uRi4msI5Oa3QX74tFzDUVaMfo=;
        b=JGYM9GuDTBYJaSXb+e5AlF9mZ0ZttPv8yUHQkID4QppwjUrMi2S6rDc8P1ZL9uEQa9
         6+vb5mscRCGEo5ei0q32hHOtYCKTPayV5g8jZM2Hy6se5+MYhQ73ZUeg1xdHEuiwsSTF
         8W9Vs4Yktc+AtMZ2kcN6LTixUnPyBRwNPCRDOgY26AJDVnjw3cM2lmeg0CzezdRSFhIS
         3t7Qyuk7e9yVbm4DN8goJeB/TAKxXHsYzDuEbtWNL7XhdTxoiTYTiU26jDznlhoWRNHI
         0fdozzlCjCydR9qfJkntUpH8P+2koBLZRe7rjbB4Hegj62MCWnfHB7aa7j2rCl8B1SD6
         WEVg==
X-Gm-Message-State: AOJu0YwO4iuvF9SE5vbKdnyfSHhlJm9nzMuOjdqy0OW5MEfDz868QOq+
	QMqZJidKUuK6ujHXSOtYz2LIK5Haxcf9zh2ZfAGGJPjmZSn8j+faFjWiHlqXPpU4SyYvujZP59g
	F1RL4+p4NWqWc1M0DNvTUhJB4W6Ttjms=
X-Gm-Gg: AeBDievzgwocA773iWvu61HnIoqgO3R2eLraHfxVOtMv0g98AqaGr+LDPfhSvaE6Qn6
	pJ3liihgw/zlh8VekOgZUYAtc6PqTakDmhtfZwnrnuRoL50aJyZ89C+RcMF50vabx82xKp2ASgQ
	nLFuFBNLe5oxVH8tsVR2PEUBT+6feA6NOEJFJ94I3oK/Xre1/i1m0epIXN+Osix9uSHp/t9hpXO
	4nx2RYGB8HDuQHHydtNk1KoSJ7rr98AKBzt9wHducCf7pnSA71PuQfXCcMwHwx+8Z4XLGxQSw8x
	fj9r7Gp9G863EiSI5peyLbRiloU=
X-Received: by 2002:a05:6871:4726:b0:417:a283:9c81 with SMTP id
 586e51a60fabf-42aded952c6mr22444645fac.35.1777198837996; Sun, 26 Apr 2026
 03:20:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Lettice up <minecraftwemmne@gmail.com>
Date: Sun, 26 Apr 2026 18:20:26 +0800
X-Gm-Features: AQROBzD0ajyXivOXWU-QHlWBI2zjo6NybrnATxUVN8RhdguAcYe8e_PIA5hup4Q
Message-ID: <CAJYuYVk5NYQd4h3pUjiFYfthmPNo3k6n2DF-Of70n0cFqg1OWQ@mail.gmail.com>
Subject: [PATCH] staging: rtl8723bs: fix line length in rtw_cmd.c
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: multipart/mixed; boundary="0000000000006f38ca06505a590c"

--0000000000006f38ca06505a590c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64

5Zeo77yMR3JlZ++8jA0KDQrov5nkuKrooaXkuIHkv67lpI3kuoYgcnR3X2NtZC5jIOaWh+S7tuS4
reWFs+S6juihjOmVv+W6pueahCBjaGVja3BhdGNoLnBsIOitpuWRiuOAguaIkeaKiuWug+S9nOS4
uumZhOS7tuWPkemAge+8jOS7pemBv+WFjeaIkeeahOmCruS7tuWuouaIt+err+WHuueOsOagvOW8
j+mXrumimOOAgg0KDQrosKLosKLvvIxMZXR0aWNlIEppbW15DQo=
--0000000000006f38ca06505a590c
Content-Type: application/octet-stream; 
	name="0001-staging-rtl8723bs-fix-line-length-in-rtw_cmd.c.patch"
Content-Disposition: attachment; 
	filename="0001-staging-rtl8723bs-fix-line-length-in-rtw_cmd.c.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_mofmakjm0>
X-Attachment-Id: f_mofmakjm0

RnJvbSBkZjZmMjhlMWJjNjU3MzQyZTQ4M2IxNWU1YjcyMzQzOTI5MTI5YmIwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBMZXR0aWNlIEppbW15IDxtaW5lY3JhZnR3ZW1tbmVAZ21haWwu
Y29tPgpEYXRlOiBTdW4sIDI2IEFwciAyMDI2IDA2OjEyOjIyIC0wNDAwClN1YmplY3Q6IFtQQVRD
SF0gc3RhZ2luZzogcnRsODcyM2JzOiBmaXggbGluZSBsZW5ndGggaW4gcnR3X2NtZC5jCgpGaXgg
YSBjaGVja3BhdGNoLnBsIHdhcm5pbmcgd2hlcmUgYSBsaW5lIGV4Y2VlZHMgMTAwIGNvbHVtbnMK
YnkgYnJlYWtpbmcgdGhlIGxvbmcgbWVtY3B5KCkgY2FsbCBpbnRvIHR3byBsaW5lcy4KClNpZ25l
ZC1vZmYtYnk6IExldHRpY2UgSmltbXkgPG1pbmVjcmFmdHdlbW1uZUBnbWFpbC5jb20+Ci0tLQog
ZHJpdmVycy9zdGFnaW5nL3J0bDg3MjNicy9jb3JlL3J0d19jbWQuYyB8IDMgKystCiAxIGZpbGUg
Y2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJp
dmVycy9zdGFnaW5nL3J0bDg3MjNicy9jb3JlL3J0d19jbWQuYyBiL2RyaXZlcnMvc3RhZ2luZy9y
dGw4NzIzYnMvY29yZS9ydHdfY21kLmMKaW5kZXggYzExODVjMjVlZDM2Li41MDY2MmQ0NGE0YjYg
MTAwNjQ0Ci0tLSBhL2RyaXZlcnMvc3RhZ2luZy9ydGw4NzIzYnMvY29yZS9ydHdfY21kLmMKKysr
IGIvZHJpdmVycy9zdGFnaW5nL3J0bDg3MjNicy9jb3JlL3J0d19jbWQuYwpAQCAtNTU3LDcgKzU1
Nyw4IEBAIHU4IHJ0d19zaXRlc3VydmV5X2NtZChzdHJ1Y3QgYWRhcHRlciAgKnBhZGFwdGVyLCBz
dHJ1Y3QgbmRpc184MDJfMTFfc3NpZCAqc3NpZCwKIAogCQlmb3IgKGkgPSAwOyBpIDwgc3NpZF9u
dW0gJiYgaSA8IFJUV19TU0lEX1NDQU5fQU1PVU5UOyBpKyspIHsKIAkJCWlmIChzc2lkW2ldLnNz
aWRfbGVuZ3RoKSB7Ci0JCQkJbWVtY3B5KCZwc3VydmV5UGFyYS0+c3NpZFtpXSwgJnNzaWRbaV0s
IHNpemVvZihzdHJ1Y3QgbmRpc184MDJfMTFfc3NpZCkpOworCQkJCW1lbWNweSgmcHN1cnZleVBh
cmEtPnNzaWRbaV0sICZzc2lkW2ldLAorCQkJCSAgICAgICBzaXplb2Yoc3RydWN0IG5kaXNfODAy
XzExX3NzaWQpKTsKIAkJCQlwc3VydmV5UGFyYS0+c3NpZF9udW0rKzsKIAkJCX0KIAkJfQotLSAK
Mi41My4wCgo=
--0000000000006f38ca06505a590c--
