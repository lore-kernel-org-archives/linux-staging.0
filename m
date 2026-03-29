Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4F30F9C0
	for <linux-staging@lists.linux.dev>; Sun, 29 Mar 2026 02:39:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774751950; cv=pass; b=k/RaDJW/WbA/ybd+099YHd3jmGi8G1YUtAySmPN9vPtPR+NAvwfY0dfwTeQjZhMJpjaqhcT6Vy15gI4cwRygPt8FjG4afcLcjNqCvemjBqBa3u8Mb2hIydZozndVt9nV7Z+c00yTsj0B3KI2F/6g+nVPSkWUDbp2txcNZHzwgO4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774751950; c=relaxed/simple;
	bh=QGmIMxsVgulT8MnB/EqewCaBNCFJYcUqeZcOqqqn56g=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=m93hGzzHTIKu3YKvis6XV9eD2Qq/8J1Ynj8vReowyIJU+MQu4HBY+w6F6c8w+xnezBBytEvatJddJkAKVq53L3fSqVtCC4gRTTUgPDTyj+e9hwpwJIqUpGbEFEXZpEqsyhr7WZbFN+UwBpIJhBDsWZfk6B1Jn6avMBXOU/6MLYg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RsrAjHSb; arc=pass smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RsrAjHSb"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-35c2fe0d90fso1136348a91.1
        for <linux-staging@lists.linux.dev>; Sat, 28 Mar 2026 19:39:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774751949; cv=none;
        d=google.com; s=arc-20240605;
        b=BeGsYn6B0u9y29QtSA+U9oqGg7lTh4xitOY7M8w3YKbxAWVK2AdSkxOs23HEkbByfN
         Jk0/HUbo+WI1kTLlTLi5/pAYXfbsTPwX/1kGLtsusmg15rUGpwPV/TOn5SAl2AT0r5qK
         APZehTnkv5VvlWPHbhKDvvmhdZJP+iuJuQ4OSqQ4ksqqFFCQoT2trDpjXMxs6rko1Cbr
         fnVmrNnNoJaxyaLBQHCHoXnG6mNc6xwYM/f6VJiPwFRTUvi2rPzYIP3UinoVzY8VNlCn
         tG3zw/2HKPVROAHMkI9ycbpM1QLIqt1NeQWYIe49McPFi9kqne2Sqx4oHwsagYE7BqP3
         LSTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=+RukdEOVFmIG5gc5TFvXH50zcf30eK/EKWtwqx4ZJTk=;
        fh=Ls6ZQsuZSYoQAAR0XXOsW00qy8lZ6bQjRXkDhH1RFK8=;
        b=Bc1wguJwpaMlLFxbRzb6FIqebNy0GLX1J30/zXSH98jvkqBNe6yTkik5xglPQubm6m
         of9L4QRMfaR1ZnekxEVAWt9DQ7ME2VWJ4JAairOO1Ltg6ZsEWbBCKEzuozycRYv6qy7P
         IJbnXCYfKVgN8aLjRTre7VWEB0UAELF+0gxM9tmWo1aoWWlkg09xjl+z5A1I87fhUeOo
         3phprJKtwNXl8lnh30waKjXRnH/QUK3YWl45CpE84QdLmhiXROksyhYTqWJxwaDEtX4q
         q4goNwSs2f3XoVca8wp5XMaVoYM4TS8Fb54UWL0NxAmGgJFJCRN3vK0QSyGbzuTNmK6B
         5ZPw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774751949; x=1775356749; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=+RukdEOVFmIG5gc5TFvXH50zcf30eK/EKWtwqx4ZJTk=;
        b=RsrAjHSbaFKrKlcw2Kh9X9R7dhpSy5ptX5/XKu9pyvzVtmGgqkAfu5NOqsdOuTb1GM
         EsJgGSAV4/BuAJbcdFePf416ANmtASpykpgFk4cAChQ2FzqjzDomCTcj4Wx7WvSLjwAM
         KFg7cqJDAPByU3qnQr6x2Y4tMSD86u8r32VL2+CKoAITi24ii8DhOZV8fmTn2WLg7cJz
         7SGEcR0KgMQeR3CDj11viCsq9WKL1SIdjcFCAqmo2alkxPe44kQN7qH9a2uy1u8vTXXu
         XKxUbxkZ+dmHIrouY4lmzhqVqmXW9cQgHdY1hDOHWKpbLfytITVsESVP7X8SEZJ7UgGd
         OMRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774751949; x=1775356749;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+RukdEOVFmIG5gc5TFvXH50zcf30eK/EKWtwqx4ZJTk=;
        b=FzjeQOXAwfe591I7m53/OuvEsagcnYmmt9Y+H84KRLzXO9W+3DNhFFLnBNmCCvEuev
         vnLXdYFQA3zk0UCSJ6cHZ/g06ROYPRx+WerLLc/B9AxwkmumBHZv1CiZbzDEy6tohy9O
         TgBcP9dNhoavos87D2CfG0dkhmVZ3CDXAhMMR3A8HqgWm/m9Y9Oox4P1/8mdzKHMAjSY
         Y9IzAa0FrznaQoQngairDMqhjPh0EnU5I5BmEEsXbityM11XiPTPEeCHkMF1zdeRZw/z
         B7+VevN5oqJsXyOgJLgHCCGcH3Fgeuxp+A34vpvBZRarZS4IWgrbxNKbqECLZAVZuBFx
         faYQ==
X-Forwarded-Encrypted: i=1; AJvYcCUvPRLvxBpNQkbwrDAUPt9zQ3K3u8W3sauOueOHsK7jCP7hNx1Y5IgnxThzZ6I7BDCylBpTyh1OCLuXViCL@lists.linux.dev
X-Gm-Message-State: AOJu0Yyw7mGMVKmHBvBr2Y1xy8KVi/IkbjUFv3qIsY9avuwGAcV055T9
	1cqZjbC8x0Q+NZ13xpyaJB5Uwnr2RmVpSysS7vygYACcaJT5BZTtGgQHbYyNVcY5KqJEjFncPH0
	7fSW7OfOtHqXkRJ2uvfP65LXe6ne3ciI=
X-Gm-Gg: ATEYQzyNy13xdswQknqrSjZaoCv0qzieAtKimHVfMjF/USotJnFrhIpVNnHRnCQjQnY
	Ll0UvKER7RHvMZzB6ZJ554G5JWuHoIrsckGSGTfeYkooQKTrC9niR1WYfvaJNhuG2TF50muLZ7C
	dySdv+4Kep4d8el/fuXSvE1czkMM6XnzqRrm7x4XOeOtNi/BVZLrFtHDZb8hGR2D45EWsOpZZLd
	Oq79cY+2z+77PCuaRe9QeJWvOLOwR6/UzdlQ+8UF7cb+kKkAB2IiRHB0QoSQm4L1+uSxQ8fYpVz
	KIldHSs=
X-Received: by 2002:a17:902:ce12:b0:2ae:54b2:27c7 with SMTP id
 d9443c01a7336-2b0cdcca420mr86930085ad.39.1774751949081; Sat, 28 Mar 2026
 19:39:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: loren coomer <lorencoom@gmail.com>
Date: Sat, 28 Mar 2026 19:38:57 -0700
X-Gm-Features: AQROBzDIF4niyNITyVhIWjMczI5LrAVbYjsV3qNAiF7JRMnrNHg5XVBhQyst7bE
Message-ID: <CALKC8YEZwrLkp1c5uE_bdn7g+1kVt-LFfr_TxGTCTbW-f-=00A@mail.gmail.com>
Subject: [PATCH] vme_user: add missing blank line in struct fake_driver
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Content-Type: multipart/mixed; boundary="0000000000007d621d064e20a310"

--0000000000007d621d064e20a310
Content-Type: multipart/alternative; boundary="0000000000007d621c064e20a30e"

--0000000000007d621c064e20a30e
Content-Type: text/plain; charset="UTF-8"

Add a blank line to separate fields in struct fake_driver

Signed-off-by: Loren Coomer <lorencoom@gmail.com>

--0000000000007d621c064e20a30e
Content-Type: text/html; charset="UTF-8"

<div dir="ltr"><div>Add a blank line to separate fields in struct fake_driver</div><div><br></div><div>Signed-off-by: Loren Coomer &lt;<a href="mailto:lorencoom@gmail.com">lorencoom@gmail.com</a>&gt;</div></div>

--0000000000007d621c064e20a30e--
--0000000000007d621d064e20a310
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-vme_user-add-missing-blank-line-in-struct-fake_drive.patch"
Content-Disposition: attachment; 
	filename="0001-vme_user-add-missing-blank-line-in-struct-fake_drive.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_mnb5gxaj0>
X-Attachment-Id: f_mnb5gxaj0

RnJvbSA2OWVjNzgxNzlkODhmZjgzZDZmZjRjMDA2M2YzNzZjZGU1ZjA5MWIwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBsb3Jjb29tZXIgPGxvcmVuY29vbUBnbWFpbC5jb20+CkRhdGU6
IFNhdCwgMjggTWFyIDIwMjYgMTk6MzY6NDAgLTA3MDAKU3ViamVjdDogW1BBVENIXSB2bWVfdXNl
cjogYWRkIG1pc3NpbmcgYmxhbmsgbGluZSBpbiBzdHJ1Y3QgZmFrZV9kcml2ZXIKClNpZ25lZC1v
ZmYtYnkgTG9yZW4gQ29vbWVyIGxvcmVuY29vbUBnbWFpbC5jb20KLS0tCiBkcml2ZXJzL3N0YWdp
bmcvdm1lX3VzZXIvdm1lX2Zha2UuYyB8IDEgKwogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9u
KCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9zdGFnaW5nL3ZtZV91c2VyL3ZtZV9mYWtlLmMgYi9k
cml2ZXJzL3N0YWdpbmcvdm1lX3VzZXIvdm1lX2Zha2UuYwppbmRleCBiZTRhZDQ3ZWQ1MjYuLmVi
OTE4YTg1NzBkNSAxMDA2NDQKLS0tIGEvZHJpdmVycy9zdGFnaW5nL3ZtZV91c2VyL3ZtZV9mYWtl
LmMKKysrIGIvZHJpdmVycy9zdGFnaW5nL3ZtZV91c2VyL3ZtZV9mYWtlLmMKQEAgLTY3LDYgKzY3
LDcgQEAgc3RydWN0IGZha2VfZHJpdmVyIHsKIAl1bnNpZ25lZCBsb25nIGxvbmcgbG1fYmFzZTsK
IAl1MzIgbG1fYXNwYWNlOwogCXUzMiBsbV9jeWNsZTsKKwogCXZvaWQgKCpsbV9jYWxsYmFja1s0
XSkodm9pZCAqKTsKIAl2b2lkICpsbV9kYXRhWzRdOwogCXN0cnVjdCB0YXNrbGV0X3N0cnVjdCBp
bnRfdGFza2xldDsKLS0gCjIuNTMuMAoK
--0000000000007d621d064e20a310--
