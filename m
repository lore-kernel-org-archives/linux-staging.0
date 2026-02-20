Received: from mail-244121.protonmail.ch (mail-244121.protonmail.ch [109.224.244.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F06D51E1DF0
	for <linux-staging@lists.linux.dev>; Fri, 20 Feb 2026 05:45:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.121
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771566350; cv=none; b=BmlKGj/ho3isSRLhlw0sbBgWV9KWMWaU/NV5fav2/el8VSFBmSJTtjFMCgkNcQpK5xjPngjVWAouxxH6PUKpEDK4ibbmZjflsof0UAnqSIRYVMNBnkxeHE0ODhXj/rmgK9J83r+SBUHtGRfQxKAc2do8t/h11w+oPZUWNRpKQDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771566350; c=relaxed/simple;
	bh=cEmMqbhC2gyXvYoxSaDX0C67gqTjDU8rf+vypv5h1qE=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QuYR1IAOiKV9UF7YLaZqKYwmueLpcLdCTxybQgNiL/nUl6fhrBCKJVwcjvPy2DCjThL03axLxFEfJFdml2sPr7yLJiSKhCXOX8G4ziJTq5wEsfsGdGhxwHaf8o/EmimTx+mBkMQ24f0SQmF9TwWUi39MPeuhTNnwPx4LyOk58jY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=GRSZkJw3; arc=none smtp.client-ip=109.224.244.121
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="GRSZkJw3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1771566347; x=1771825547;
	bh=cEmMqbhC2gyXvYoxSaDX0C67gqTjDU8rf+vypv5h1qE=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=GRSZkJw3lthk6m8+DPZOnKOHU/WAZYLwXs1L5RaMKna7O278bTP8wxRDZeDSmq8E1
	 MiQoA/KCONnf/9DUM80pqy7QDj5Sz1ly1UY1p6dXx4GDQr95fKKKW7AfnccnovjZdk
	 0Gkn7YXy4cc/ft4zoMlYjc/Gr8MOSXb9fVfqYUBUNZHGIhx0aVpzG1l5zEEhLdv/a/
	 wpViICDqBR2luUu51+QbUl2STHFHulyaSXXee2q+wT6sjQaydJ1/vIKJiz6rZTy8Uy
	 qXp3uASjj9zrwlN1qcSMsRIPlmuI2bx7vEtAYYrZ8i14b3A5Nx5RPs/Kr3E1Iecila
	 vsozhGJn/MREw==
Date: Fri, 20 Feb 2026 05:45:44 +0000
To: Hardik Phalet <hardik.phalet@pm.me>, linux-staging@lists.linux.dev
From: Hardik Phalet <hardik.phalet@pm.me>
Cc: vaibhav.sr@gmail.com, mgreer@animalcreek.com, johan@kernel.org, elder@kernel.org, gregkh@linuxfoundation.org, greybus-dev@lists.linaro.org, linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/2] staging: greybus: audio: drop stale TODO in module release
Message-ID: <DGJJURREST2E.1YYACU06X3V9C@pm.me>
In-Reply-To: <DGJJRT1BJV4H.1JGMNMC4SGKT7@pm.me>
References: <DGJJRT1BJV4H.1JGMNMC4SGKT7@pm.me>
Feedback-ID: 166659585:user:proton
X-Pm-Message-ID: 82b57fac4ec9689d49fac34b65e19b6dfb99c225
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="b1=_DZi7fYXby5xhvUBGrX7xEEopy8rzfuRbw3zQ2Wec"

--b1=_DZi7fYXby5xhvUBGrX7xEEopy8rzfuRbw3zQ2Wec
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Empty Message
--b1=_DZi7fYXby5xhvUBGrX7xEEopy8rzfuRbw3zQ2Wec
Content-Type: text/x-patch; charset=utf-8; name=0002-staging-greybus-audio-drop-stale-TODO-in-module-rele.patch
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename=0002-staging-greybus-audio-drop-stale-TODO-in-module-rele.patch

RnJvbSBiMzgxNzY3NjcyMDIzMjM0ZTZkMTg0ODJhN2I2OGFlYjc4ZmRmMmI5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBIYXJkaWsgUGhhbGV0IDxoYXJkaWsucGhhbGV0QHBtLm1lPgpE
YXRlOiBGcmksIDIwIEZlYiAyMDI2IDEwOjQ2OjUwICswNTMwClN1YmplY3Q6IFtQQVRDSCB2MSAy
LzJdIHN0YWdpbmc6IGdyZXlidXM6IGF1ZGlvOiBkcm9wIHN0YWxlIFRPRE8gaW4gbW9kdWxlCiBy
ZWxlYXNlCgpNb2R1bGVzIGFyZSByZW1vdmVkIGZyb20gbW9kdWxlc19saXN0IGluIGdiX2F1ZGlv
X21hbmFnZXJfcmVtb3ZlKCkgYW5kCmdiX2F1ZGlvX21hbmFnZXJfcmVtb3ZlX2FsbCgpIGJlZm9y
ZSBrb2JqZWN0X3B1dCgpLiBUaGUgVE9ETyBzdWdnZXN0aW5nCmxpc3QgZGVsZXRpb24gaW4gdGhl
IGtvYmplY3QgcmVsZWFzZSBjYWxsYmFjayBpcyBzdGFsZSBhbmQgbWlzbGVhZGluZy4KClNpZ25l
ZC1vZmYtYnk6IEhhcmRpayBQaGFsZXQgPGhhcmRpay5waGFsZXRAcG0ubWU+Ci0tLQogZHJpdmVy
cy9zdGFnaW5nL2dyZXlidXMvYXVkaW9fbWFuYWdlcl9tb2R1bGUuYyB8IDEgLQogMSBmaWxlIGNo
YW5nZWQsIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3N0YWdpbmcvZ3JleWJ1
cy9hdWRpb19tYW5hZ2VyX21vZHVsZS5jIGIvZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvYXVkaW9f
bWFuYWdlcl9tb2R1bGUuYwppbmRleCA0YTRkZmI0MmY1MGYuLmIxZGQzZGE5ZjU3YyAxMDA2NDQK
LS0tIGEvZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvYXVkaW9fbWFuYWdlcl9tb2R1bGUuYworKysg
Yi9kcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9hdWRpb19tYW5hZ2VyX21vZHVsZS5jCkBAIC02OSw3
ICs2OSw2IEBAIHN0YXRpYyB2b2lkIGdiX2F1ZGlvX21vZHVsZV9yZWxlYXNlKHN0cnVjdCBrb2Jq
ZWN0ICprb2JqKQogCXN0cnVjdCBnYl9hdWRpb19tYW5hZ2VyX21vZHVsZSAqbW9kdWxlID0gdG9f
Z2JfYXVkaW9fbW9kdWxlKGtvYmopOwogCiAJcHJfaW5mbygiRGVzdHJveWluZyBhdWRpbyBtb2R1
bGUgIyVkXG4iLCBtb2R1bGUtPmlkKTsKLQkvKiBUT0RPIC0+IGRlbGV0ZSBmcm9tIGxpc3QgKi8K
IAlrZnJlZShtb2R1bGUpOwogfQogCi0tIAoyLjUzLjAKCg==

--b1=_DZi7fYXby5xhvUBGrX7xEEopy8rzfuRbw3zQ2Wec--

