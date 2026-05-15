Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D60AA3E5A15
	for <linux-staging@lists.linux.dev>; Fri, 15 May 2026 10:29:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778840965; cv=none; b=nM5DA4F1Mt+pwdRmsZyjg5J4iY5UlytjAMA4bQrMi7Fsv3sLn6R7nQ7gXPbmAf56mFLhR/cawSCbeLm/jtRjWTuahatd0osL9iqjstRAPVr6CxSUumD4U23EpYTnQin7FH1EgJeOWwFDA3N79tTHnz5cUVCezkcjnfhCaLZYlKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778840965; c=relaxed/simple;
	bh=ZG6VGuf7BYHkFuGsEJJiysAcwDOPW9dmIoFvLwnaG7g=;
	h=Message-ID:Date:Content-Type:MIME-Version:From:To:Cc:Subject; b=BOPbD3da6CaA51MQOmaplS51krAPLi50JFG1te4BjOPE5Ybqr+C2FgTu7G7grZuCz6GkVGKMJ2IJI65zvEGLzGv2c0M42wToOHtAMZykkyqAvDG3cm45IGDUPChrgAM3eXHGghrHk6yzgdh23o6gJB5iqNLZPezr6ykyX4olp8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ilYdnEW5; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ilYdnEW5"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-676a89de629so3610481a12.1
        for <linux-staging@lists.linux.dev>; Fri, 15 May 2026 03:29:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778840962; x=1779445762; darn=lists.linux.dev;
        h=subject:cc:to:from:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ZG6VGuf7BYHkFuGsEJJiysAcwDOPW9dmIoFvLwnaG7g=;
        b=ilYdnEW5uFHJ5G+FOVbEhOCOG/Zu+ZfM/fZV8nMoNFoZrDrNc7AgLFaIL07rJ75M9r
         TQMjbacNomTyEpc760ERN7m9WAIcnc9LPzzx/mb2DJnrazPeMRSGn8eguyXc8oEml+O+
         0xnsNUmwgr2p7VH9umKol6I2sInWOKOj5NhtkG9/0lMqKcVBGUDnvbnUzmDMIBQyMIYE
         YTBuWaFfEPU457YOxUKBrfthUaDlRRGn1KmRmf/L+K+zdPg9/vl41NwEbPyBBIBdt2+r
         cc/ha/wFAWCZDs45vDCaiZi7Df2PnJ7A6Du8mG/56EC2XyywGDAutk4E9mmGJ6Ay1HUp
         qifA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778840962; x=1779445762;
        h=subject:cc:to:from:content-transfer-encoding:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZG6VGuf7BYHkFuGsEJJiysAcwDOPW9dmIoFvLwnaG7g=;
        b=WTDx/y/fC6TzlAY1FUq6OvF/yqk4pVUBsF51ZTEgjGGuH26497upbE+J3+AZ/MiSfx
         cxUaHkuU+nTBz24jCWVjoRT1Z242c8B1WJt++3tYtPqp7/lotlrwoEApzcGZj3XFuyW6
         SgMtXVKSuvhbnX6GZcLboJgMvPHDxnSy/4fsmPAZgDiNRuAmRH9H5JujsM45wRmP42as
         BY+17wQ79YM9mFBwIP+ODkMAayFIVU5myhsohwlrnhFphwFlDZqcyDS4R9yplPPzckHc
         fTnp8vm2PADc/U1uSntloA3zgpNqLHm364cwH3lACU3vR+2y2cZCQK5QRnkpfA70dQLr
         pIkg==
X-Gm-Message-State: AOJu0YwnE1uWEIBebt40rRo/ur6P5W9M48hZ/praWWdQtJ4+uiJTuVQF
	LHmDGYXYZ5X5ps7sX3F8vYkdRVo0HB4v2XJQA0EaAEMtn6itGomfcewfjWbv3GYs
X-Gm-Gg: Acq92OG/ZM61Eb2aDoF0hMezz0OBhpmsMikGZPFuEBKUKfD4UpGXepB54+q2d+qf7gC
	qhOy4jf8+Wmk++gZ7tnZemTiQw+pW0nKslh5GFj6ST/EVOpaXBBdSPKlrgxoqXAe78J7d7XdEX7
	Vw3bDwssGqgOTdLumxdmnBb0kGrkfoHpcAflzFYi+gj4d/FheseV/g5/f02ompA7/Poyjhil/la
	152fsee+uFGjRUP/46IBcfeu9N3bwe7Ara/WIoqgkDt4xnquvWplAopZcuc4xrUtTJLi9A1LazC
	gO7tVfScLGBu0R3ycppf1pwTdpdiHmzTrp7fpxHpeUwXKF+qd2a5/W1/01vwZndXvHnuYhjQMYS
	SB2mgp8ZxwqSLiykQctEgoFn4QcNt0kul/0n3I2B4DZUH6N1xVolsJISGIM2PoV7fjTFDvVxwlX
	0olE0hcMXaSK1vvsWHzz7DzQ4ztT5VIgxKHWe8idpY876B9zlD5vb8oZSLhomMprraojzoIgre+
	krKLV7G2+hB9KTIxcPXwpoI6VIIK/e4XvMDcerAiJChnG89QLI9oSiTDdNydTWECaRGgsbi7MRz
	PoKr46wtdryHikxfg3foElPgUqY7
X-Received: by 2002:a17:906:6185:b0:ba8:a21f:9c4e with SMTP id a640c23a62f3a-bd5177e0935mr172779266b.11.1778840961946;
        Fri, 15 May 2026 03:29:21 -0700 (PDT)
Received: from ahossu.localdomain (ip-217-105-56-94.ip.prioritytelecom.net. [217.105.56.94])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bd4f4ec6548sm205327866b.62.2026.05.15.03.29.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 03:29:21 -0700 (PDT)
Message-ID: <6a06f581.0c99f0eb.149f9e.4214@mx.google.com>
Date: Fri, 15 May 2026 03:29:21 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: base64
From: Alexandru Hossu <hossu.alexandru@gmail.com>
To: linux-staging@lists.linux.dev
Cc: gregkh@linuxfoundation.org, dan.carpenter@linuxfoundation.org
Subject: staging: rtl8723bs: OOB write in HT_caps_handler() via attacker-controlled IE length

SGksCgpJIGZvdW5kIGFuIG91dC1vZi1ib3VuZHMgd3JpdGUgaW4gSFRfY2Fwc19oYW5kbGVyKCkg
aW4KZHJpdmVycy9zdGFnaW5nL3J0bDg3MjNicy9jb3JlL3J0d193bGFuX3V0aWwuYy4KCkF0IGxp
bmUgOTM4LTk0MjoKCiAgICBmb3IgKGkgPSAwOyBpIDwgKHBJRS0+bGVuZ3RoKTsgaSsrKSB7CiAg
ICAgICAgaWYgKGkgIT0gMikgewogICAgICAgICAgICBwbWxtZWluZm8tPkhUX2NhcHMudS5IVF9j
YXBbaV0gJj0gKHBJRS0+ZGF0YVtpXSk7CgpIVF9jYXBbXSBpcyAyNiBieXRlcyAod2lmaS5oOjM0
OSkuIHBJRS0+bGVuZ3RoIGNvbWVzIGZyb20gdGhlCldMQU5fRUlEX0hUX0NBUEFCSUxJVFkgSUUg
aW4gYW4gYXNzb2NpYXRpb24gcmVzcG9uc2UgYW5kIGNhbiBiZSB1cCB0byAyNTUuClRoZSBsb29w
IHdyaXRlcyB1cCB0byAyMjkgYnl0ZXMgcGFzdCB0aGUgZW5kIG9mIHRoZSBhcnJheS4KCkEgcm9n
dWUgYWNjZXNzIHBvaW50IHRyaWdnZXJzIHRoaXMgYnkgc2VuZGluZyBhbiBIVCBDYXBhYmlsaXR5
IElFIHdpdGgKbGVuZ3RoID4gMjYgaW4gdGhlIGFzc29jaWF0aW9uIHJlc3BvbnNlLiBObyBhdXRo
ZW50aWNhdGlvbiBpcyBuZWVkZWQuCgpUaGUgd3JpdGUgaXMgQU5ELW9ubHkgc28gaXQgY2FuIG9u
bHkgY2xlYXIgYml0cyBpbiBhZGphY2VudCBzdHJ1Y3QgZmllbGRzCihIVF9pbmZvLCB3bGFuX2Jz
c2lkX2V4KS4gVGhpcyBjYXVzZXMgc3RhdGUgY29ycnVwdGlvbiBhbmQgY2FuIGNyYXNoIHRoZQpk
cml2ZXIuIFRoZSBSVEw4NzIzQlMgY2hpcCBpcyBpbiBhIGxhcmdlIG51bWJlciBvZiBjaGVhcCBs
YXB0b3BzIGFuZCBJb1QKZGV2aWNlcy4KClN1Z2dlc3RlZCBmaXg6CgogICAgdTggaHRfY2FwX2xl
biA9IG1pbl90KHU4LCBwSUUtPmxlbmd0aCwKICAgICAgICAgICAgICAgICAgICAgICAgICBzaXpl
b2YocG1sbWVpbmZvLT5IVF9jYXBzLnUuSFRfY2FwKSk7CiAgICBmb3IgKGkgPSAwOyBpIDwgaHRf
Y2FwX2xlbjsgaSsrKSB7CgpUZXN0ZWQgb24gbGludXgtbmV4dCBjb21taXQgZTk4ZDIxYzE3MGIw
ICgyMDI2LTA1LTA4KS4KCkFsZXhhbmRydQo=
