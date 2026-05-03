Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC17C3C6A38
	for <linux-staging@lists.linux.dev>; Sun,  3 May 2026 13:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777813892; cv=pass; b=jFIgLv/fgQFCqsd0zd832ZjODtH8rIJMkVoBqPneTIWK3aRG5QLS+pXPR9iU7MAnUZQv532K0IdDC+gHTdMQk/e61dCRok6R1pEUPMdiDcYFdhbJBCqTc5urruLby8iSqS+w7e6qu+taxsC9NJPhzAMgD+fzeWoPHrWyIwsVCy8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777813892; c=relaxed/simple;
	bh=HyBbeD7jH/q1wggk6L9xoXXRW1SsgszsFSHW8izjd5c=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=ZKJ8PCUG9Ne/7cy8bS9FJXdcTGp+Va6gxPpErTP24YsNStLxqwdFxIxc7f0jJpXcDe75y/jL6896cVmS590d8GbB1mseHkH/Z7IiI5OGCc9rkxlmuzhgcmhmGk4Wd1SdHR2KUgPpEH7peS794OpNz6NFXFKko4k9999YdgHkrec=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X2uE2ZHc; arc=pass smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X2uE2ZHc"
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-8b3fecdd3c6so5798456d6.0
        for <linux-staging@lists.linux.dev>; Sun, 03 May 2026 06:11:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777813890; cv=none;
        d=google.com; s=arc-20240605;
        b=JMq4PUHI6CvbhjPisUnXzZoBAiXiF2YfHaimBfOtw/VwmjTU7h8e/YCA+m88RiBnFq
         RzH9vmbglU9jicww1N4wejGRUZdkhWiG4l1/tJ57bGK3EzmP1p7zHUWfkgA+MGusEyUB
         AQ60FTcTjfm5lTsDZI3rI+g3lB/RP1xaEhPYZ7z9kRsNLOssTZ5aS2ljnwu1RYTE7K5m
         /H5oaoWNgaF9ZEibRdyGIu6iEcJPlpgWnnwzhQ3PJHkFIwdkTrFGHBUENcDMqAdsjIeU
         cjY6rDoCNl88UwEFcy5ziNDL/b6W/4T2h/ERjv0ERTpaVamNEfTL1t8MsR8AVQhhDNQc
         UyPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=v7aiQO6fvNvJpdsJuZvEgPD+doUEhRpaySSpZmv7mPg=;
        fh=OGuGyImkAcJwt+sRhpXRgKfXKBxNQnSga2zoz3XK8eQ=;
        b=CG3fXU8ViYXdb6Y3L1IlagWGAldS7lDxO7z5ro/EBfrCx034bd9l8gyfKwGHjeYzW3
         cAF8WouKCpqfhi/3rL8ANlfC5KMcNlJcs525oyS5iTM7hr7wCcqgatRHf4NtAIy6onbj
         y5ncPNjTGTOD2ogDPbqNwys8YEV3sJPPawu0uqG5Kp729hHbGeXZArYQnUbXK2V/dWN7
         M5dn9jbamn5BPsq9bo0Tl9sNm5F51IhD869oCBYxZTE0IipvcBQiTLyl4SVll5+84hDW
         0K2KpsAhktv4Si9tALfBOSIr7xxhFfnQyleL7qmZPDdt4jXoNim7GJCnKMDpizYbEhMn
         FTPg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777813890; x=1778418690; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=v7aiQO6fvNvJpdsJuZvEgPD+doUEhRpaySSpZmv7mPg=;
        b=X2uE2ZHco2Am+LCJOqEXcOGS3wqP/Hn+nGDdN8fbMEdm/8+0g8i8s3afppEd/7zlrg
         Xirjg3/2RMveWlzsSazTQx4GhLhOo7YWRniuYibNtnCSYMFBAAq9NnraxlwxT134kMK9
         N8qS43LDt7MBBBnUnrcwzIj2yGUGmGqv6htPcFvHoCeyEFGP1rNBLBHfDs4qsoHOtN8H
         ALvq/W77C47mCV4P/kvDIuUxJSbesMFTSQoPZXGqsubdF+xOuKtDrrG9SLsBIXlyGb3L
         IZNNS2ekVS0drcOAs8DBHwVr5ZfsBbcNG7RFrxp0m5dtXlihwTxARTs3ZZOJYKsQ0W6Z
         tmLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777813890; x=1778418690;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=v7aiQO6fvNvJpdsJuZvEgPD+doUEhRpaySSpZmv7mPg=;
        b=Fb4fDIEabtzX4zqkSZW3C9IdnWlEq8WUveGUuY4tK2mxs43KxnSOI+T0N0w5ID2dKe
         XKvy9Osa677J8S0A4bmqQAEqvfodi65u1Q8MtKNNP7ElcgnCdJQOCPYY5mwW6DYcypby
         zeTfGdTViKWuLMf1xnsyM6X6bhOoR3R+UNWWTQtatgY5+0a4Hb4FRLthvkenEtOPGUVT
         a7Q2eC1K2SLuTy8283C6J8BnWKeT4iuWa+yrExch3fp2C0KLAaGzCRHFhnRuHA5N3cf8
         /cO+uK6F4LGBHMvJHSV+yNIbRwEGm5wSLkLZF8Ru81f5TAdwzDO2DBgIl6jKiH6jgGxu
         25Vw==
X-Gm-Message-State: AOJu0YxfmrVepSObb/pJfEaQFBmHtoihBYJMuwT5E50ZpXGnVt/7BjwG
	xgyY6OtYVt9Ucmr/4QRbMMD1ca48YWztdn+yIi9xIJi+48y5YFCYKYzOBI5Ol6flHgCoMMMrmp4
	ChlZQ72w+9H4NaWA5gxaDZlZMVixpcBY=
X-Gm-Gg: AeBDievQBqYlxQTAspkhsNPTkwu9Cab5ymS3f0cZv29y+bqP+JaEqnccp67CytURRiP
	TsvFtCNbF53/QmKBhXgkkBlHF/nVVebZBj7a5mVaBPFnJ8MqziaA4chOwsewwrb/2aOZqKei3vU
	qddBVI1sY9rJhXyRT4m88gVUcjVLPvZFGkFuueJbgUXfYbP3WFq0CzyAkRqXnThv2qUl2VTUZXi
	8WDf5frjkEQrafAkF9KzuoPN92xESxPVxSIWFq/p6O+JLn2/N/ARH7ITS7hS/G0ZzvVPwxzvhgA
	kpyEiffJkhExWNrrNx+xfApO7ShDVMqNxbtQvubi5blpKSitjznu
X-Received: by 2002:a05:6214:508b:b0:8ac:a833:a22d with SMTP id
 6a1803df08f44-8b66788d60dmr69566206d6.3.1777813890538; Sun, 03 May 2026
 06:11:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Ashwin Gundarapu <ashwin.gundarapu@gmail.com>
Date: Sun, 3 May 2026 18:40:53 +0530
X-Gm-Features: AVHnY4L2wIemsAQA-ab3Y9mKPRUBH0FEFueJOt3gBWrEDFq7kW-lkoqk6BEQ3_0
Message-ID: <CANAeh8e6rfBackrS4Vm1x2rFA2gW08iz2t1Kc3HCcPgN9S51xw@mail.gmail.com>
Subject: [PATCH] staging: rtl8723bs: remove unnecessary comparison to true
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: multipart/mixed; boundary="0000000000006c54eb0650e98de4"

--0000000000006c54eb0650e98de4
Content-Type: multipart/alternative; boundary="0000000000006c54eb0650e98de2"

--0000000000006c54eb0650e98de2
Content-Type: text/plain; charset="UTF-8"

Remove unnecessary comparison to true in conditional statement.
Found by checkpatch.

Signed-off-by: Ashwin Gundarapu <ashwin.gundarapu@gmail.com>
---

--0000000000006c54eb0650e98de2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Remove unnecessary comparison to true in conditional state=
ment.<br>Found by checkpatch.<br><br>Signed-off-by: Ashwin Gundarapu &lt;<a=
 href=3D"mailto:ashwin.gundarapu@gmail.com">ashwin.gundarapu@gmail.com</a>&=
gt;<br>---<br>=C2=A0</div>

--0000000000006c54eb0650e98de2--
--0000000000006c54eb0650e98de4
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-staging-rtl8723bs-remove-unnecessary-comparison-to-t.patch"
Content-Disposition: attachment; 
	filename="0001-staging-rtl8723bs-remove-unnecessary-comparison-to-t.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_mopsgbc70>
X-Attachment-Id: f_mopsgbc70

RnJvbSBiNDlkNjIxNTc5YmU5NmVmNzFlMzIwNmI4ODhmM2FiMzljMjk3NDkxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBBc2h3aW4gR3VuZGFyYXB1IDxhc2h3aW4uZ3VuZGFyYXB1QGdt
YWlsLmNvbT4KRGF0ZTogU2F0LCAyIE1heSAyMDI2IDE3OjE5OjQ4ICswNTMwClN1YmplY3Q6IFtQ
QVRDSF0gc3RhZ2luZzogcnRsODcyM2JzOiByZW1vdmUgdW5uZWNlc3NhcnkgY29tcGFyaXNvbiB0
byB0cnVlCgpSZW1vdmUgZXhwbGljaXQgY29tcGFyaXNvbiB0byB0cnVlIGluIGNoZWNrX2Z3c3Rh
dGUoKSBjYWxsIGFuZAphZGQgc3BhY2luZyBhcm91bmQgdGhlIGJpdHdpc2UgT1Igb3BlcmF0b3Ig
dG8gaW1wcm92ZSBjb2RlIHN0eWxlLgoKU2lnbmVkLW9mZi1ieTogQXNod2luIEd1bmRhcmFwdSA8
YXNod2luLmd1bmRhcmFwdUBnbWFpbC5jb20+Ci0tLQogZHJpdmVycy9zdGFnaW5nL3J0bDg3MjNi
cy9jb3JlL3J0d19pb2N0bF9zZXQuYyB8IDMgKystCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRp
b25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9zdGFnaW5nL3J0bDg3
MjNicy9jb3JlL3J0d19pb2N0bF9zZXQuYyBiL2RyaXZlcnMvc3RhZ2luZy9ydGw4NzIzYnMvY29y
ZS9ydHdfaW9jdGxfc2V0LmMKaW5kZXggYzcwNTQxZjk1YTczLi5jMTAwYTBkNzBmZTIgMTAwNjQ0
Ci0tLSBhL2RyaXZlcnMvc3RhZ2luZy9ydGw4NzIzYnMvY29yZS9ydHdfaW9jdGxfc2V0LmMKKysr
IGIvZHJpdmVycy9zdGFnaW5nL3J0bDg3MjNicy9jb3JlL3J0d19pb2N0bF9zZXQuYwpAQCAtMTUx
LDcgKzE1MSw4IEBAIHU4IHJ0d19zZXRfODAyXzExX3NzaWQoc3RydWN0IGFkYXB0ZXIgKnBhZGFw
dGVyLCBzdHJ1Y3QgbmRpc184MDJfMTFfc3NpZCAqc3NpZCkKIAllbHNlIGlmIChjaGVja19md3N0
YXRlKHBtbG1lcHJpdiwgX0ZXX1VOREVSX0xJTktJTkcpID09IHRydWUpCiAJCWdvdG8gcmVsZWFz
ZV9tbG1lX2xvY2s7CiAKLQlpZiAoY2hlY2tfZndzdGF0ZShwbWxtZXByaXYsIF9GV19MSU5LRUR8
V0lGSV9BREhPQ19NQVNURVJfU1RBVEUpID09IHRydWUpIHsKKwlpZiAoY2hlY2tfZndzdGF0ZShw
bWxtZXByaXYsCisJCV9GV19MSU5LRUQgfCBXSUZJX0FESE9DX01BU1RFUl9TVEFURSkpIHsKIAkJ
aWYgKChwbWxtZXByaXYtPmFzc29jX3NzaWQuc3NpZF9sZW5ndGggPT0gc3NpZC0+c3NpZF9sZW5n
dGgpICYmCiAJCSAgICAoIW1lbWNtcCgmcG1sbWVwcml2LT5hc3NvY19zc2lkLnNzaWQsIHNzaWQt
PnNzaWQsIHNzaWQtPnNzaWRfbGVuZ3RoKSkpIHsKIAkJCWlmIChjaGVja19md3N0YXRlKHBtbG1l
cHJpdiwgV0lGSV9TVEFUSU9OX1NUQVRFKSA9PSBmYWxzZSkgewotLSAKMi40My4wCgo=
--0000000000006c54eb0650e98de4--
