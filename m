Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D73C44A710
	for <linux-staging@lists.linux.dev>; Fri, 15 May 2026 10:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778841727; cv=none; b=jmoJINgOlNfkvPUTIcoIXx87+mHyx3FuftGVvF9bVUoPe0EbZBQ1C9dhY9/LaNXVLpNi54RW976uEJ9V9ChyXuVSFVpzxfaQ9xPpFoIMmKBGtaYiBc2FaVKuxoMk3BBSsTZJQkDaEmcNKHHiC9U3hgqJ1jDbjoQ04PkZ1umlX/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778841727; c=relaxed/simple;
	bh=l1M3G4hBp8ZT/4GJbSeXWyWX4h3yK46S5Ca9rdmSaLE=;
	h=Message-ID:Date:Content-Type:MIME-Version:From:To:Cc:Subject; b=IM5Lz/Hn/I+2wP0m5BBwn3uTrGprA9HAi0zb4V/qG8xTcNa4cutqsusSUkjW7bgE4O6CPmEHh3IFRBGZO34YbQJnlfzJESGy0YUNtVSnL3W78AhNdWRU3BcIR144L4WFdmUcobkJMYcHU0oxG8DGl39/llLhbqD7dMnklCKy5sc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PmuUIZVU; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PmuUIZVU"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-bd21ffaca79so149808666b.0
        for <linux-staging@lists.linux.dev>; Fri, 15 May 2026 03:42:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778841724; x=1779446524; darn=lists.linux.dev;
        h=subject:cc:to:from:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=l1M3G4hBp8ZT/4GJbSeXWyWX4h3yK46S5Ca9rdmSaLE=;
        b=PmuUIZVUc/ZUgqwcC8DEYkEjZOca4H/PaglUUl+VoEBDPSp4IZH1RcbnwSE+UWt6Eg
         rLes4S6oVYWSme1ogvexE13/tWu34bHzKos81SNErRi3/Nk3FuO29HjEIyneHM5uH3ms
         2gUk72rJFY7BnKga3MccxOhsyDb9Sn2xDsCZnqzKSAiz601o64XgBflBRgYDMH/RmnPy
         vYZ/beSig3UbhsLD6rp198wJjlWSx1YL7TTpyItYEx1LeGwkqff9w4WIRvH/Y2/e5qZ8
         YoDv6wKMyFDwD7zLi+3vmLHEvO80DsDgFrdpFap7IWkW9IskRJiyByIaH1EKZvcGHkz1
         GvRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778841724; x=1779446524;
        h=subject:cc:to:from:content-transfer-encoding:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l1M3G4hBp8ZT/4GJbSeXWyWX4h3yK46S5Ca9rdmSaLE=;
        b=syH5VXfJX/aiiHEb3Q/Ibo6fypJPakPOR7IQhDPxfbMQtGe0NRjZ4wJOHxLTg3QIeH
         mPQIw6H23uE0eAefK1GG4turzJ6gLMdKdCAlaQ0PWWhS1m/EM5uhrjX7hdTQIS2jYHyO
         qfTlugchmLIBqzOvT/3LMvheqv9w5QV6txESpG36vJ69mvz1j470fuXueqa41Cn7WWRG
         QK9zYnxFKhvcbLBci3CDp7aAEEBOxMJxv9GSBSK0zS4h+S8DWAOv2z9DWZOzOdix5brk
         sd2WF58R0DRraWrl0h1m6qybppkhojthRgMICcL0qnwyE/OHz2252OAe9RATHt3r0HJa
         w3zA==
X-Gm-Message-State: AOJu0Yztll7DsjdM8ZCXVWbHYm5xH78EXFDR1JXvYSQtaiG3W2lGK4jL
	oCAYM+sRfmgSL5eoOb9VVbhHCPkUOrhVpLKCsYFL1/Xv84AaNBvQXWDS
X-Gm-Gg: Acq92OHZUI0guD7yzb4WmFrq60vjxYDqS/ZaKr+fiBdVInxLTby+uLuZ3d9GeTp9atC
	0iOD1wqbvJeFe84fWblvS+CDpwtdv2H520/x29tWFpoAW4z5+YolT9YtpO8BuV0Ll/4E3aLCCq8
	xQOpm0s/APT+CiOGdlb4a+JvsXE9AWSAH9/WQz1/WvQwKyyj1YknH7LIVKtPtrSg7d7LD/K/slG
	S7pJER1VESP13syT9FU/Cq1H2p55+fUK7DtLRciRoCsbhJYGec5JCzKXcf+U43Ygf6zDKwLB/dk
	nN3y2b503PmPGtnN8MJ2qVt/0AGqwfdL2PMaN0Y4ixEAdzNG5mO+8gadCtSBXDw5d0LO6F2+mf5
	m78hSa80jJsPTEZWdRvFR+BzHRWg65AXMXAGYWExS22+dFL3ECOXcIFgJpGYwZGll6/yqhoFHbJ
	50JaHjIMjHgK5FRxdwV1JbLKUhx5WI30X5Wo+qPiVVaifUUHUlA/Fm9GDsK857VvTq2KJHQ6cLE
	3XcakBghREUFGmAKCSlpXXPdJn9ot0A22N/3XsEQd7s3BzRXJ5/rVU3/011s5jsQiWfuQF5+SUB
	xHGMZ3rFtlOjzTyH7Oi5RK/xOCJbWKBNuftxJjo=
X-Received: by 2002:a17:907:2d92:b0:bd2:44de:d698 with SMTP id a640c23a62f3a-bd4f346141dmr454985866b.17.1778841724193;
        Fri, 15 May 2026 03:42:04 -0700 (PDT)
Received: from ahossu.localdomain (ip-217-105-56-94.ip.prioritytelecom.net. [217.105.56.94])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bd4f4e2d75bsm206042566b.45.2026.05.15.03.42.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 03:42:03 -0700 (PDT)
Message-ID: <6a06f87b.669ca06b.fb7de.57d2@mx.google.com>
Date: Fri, 15 May 2026 03:42:03 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: base64
From: Alexandru Hossu <hossu.alexandru@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev
Subject: [PATCH] staging: rtl8723bs: fix OOB write in HT_caps_handler()

SGkgR3JlZywKCkhlcmUgaXMgdGhlIGZpeC4KCkFsZXhhbmRydQoKLS0tCgpUaGUgbG9vcCBpbiBI
VF9jYXBzX2hhbmRsZXIoKSBpdGVyYXRlcyB1cCB0byBwSUUtPmxlbmd0aCB0aW1lcywgYnV0CkhU
X2NhcFtdIGlzIG9ubHkgMjYgYnl0ZXMuIHBJRS0+bGVuZ3RoIGNvbWVzIGZyb20gdGhlIEhUIENh
cGFiaWxpdHkgSUUKaW4gdGhlIGFzc29jaWF0aW9uIHJlc3BvbnNlIGFuZCBjYW4gYmUgdXAgdG8g
MjU1LiBUaGlzIGxldHMgYSByb2d1ZSBBUAp3cml0ZSB1cCB0byAyMjkgYnl0ZXMgcGFzdCB0aGUg
YXJyYXkgdXNpbmcgYSBiaXR3aXNlIEFORCBpbnRvIGFkamFjZW50CnN0cnVjdCBmaWVsZHMuCgpD
bGFtcCB0aGUgaXRlcmF0aW9uIGNvdW50IHRvIHRoZSBhcnJheSBzaXplLgoKU2lnbmVkLW9mZi1i
eTogQWxleGFuZHJ1IEhvc3N1IDxob3NzdS5hbGV4YW5kcnVAZ21haWwuY29tPgotLS0KIGRyaXZl
cnMvc3RhZ2luZy9ydGw4NzIzYnMvY29yZS9ydHdfd2xhbl91dGlsLmMgfCAzICsrLQogMSBmaWxl
IGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvc3RhZ2luZy9ydGw4NzIzYnMvY29yZS9ydHdfd2xhbl91dGlsLmMgYi9kcml2ZXJzL3N0
YWdpbmcvcnRsODcyM2JzL2NvcmUvcnR3X3dsYW5fdXRpbC5jCmluZGV4IDRmNDFmODg5MDhkNy4u
ZTI3MWQxZTM5NWE1IDEwMDY0NAotLS0gYS9kcml2ZXJzL3N0YWdpbmcvcnRsODcyM2JzL2NvcmUv
cnR3X3dsYW5fdXRpbC5jCisrKyBiL2RyaXZlcnMvc3RhZ2luZy9ydGw4NzIzYnMvY29yZS9ydHdf
d2xhbl91dGlsLmMKQEAgLTkzNSw3ICs5MzUsOCBAQCB2b2lkIEhUX2NhcHNfaGFuZGxlcihzdHJ1
Y3QgYWRhcHRlciAqcGFkYXB0ZXIsIHN0cnVjdCBuZGlzXzgwMjExX3Zhcl9pZSAqcElFKQoKIAlw
bWxtZWluZm8tPkhUX2NhcHNfZW5hYmxlID0gMTsKCi0JZm9yIChpID0gMDsgaSA8IChwSUUtPmxl
bmd0aCk7IGkrKykgeworCWZvciAoaSA9IDA7IGkgPCBtaW5fdCh1bnNpZ25lZCBpbnQsIHBJRS0+
bGVuZ3RoLAorCQkJICAgICAgIHNpemVvZihwbWxtZWluZm8tPkhUX2NhcHMudS5IVF9jYXApKTsg
aSsrKSB7CiAJCWlmIChpICE9IDIpIHsKIAkJCS8qIENvbW1lbnRlZCBieSBBbGJlcnQgMjAxMC8w
Ny8xMiAqLwogCQkJLyogR290IHRoZSBlbmRpYW4gaXNzdWUgaGVyZS4gKi8K
