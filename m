Received: from mail-244121.protonmail.ch (mail-244121.protonmail.ch [109.224.244.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68D382D2496
	for <linux-staging@lists.linux.dev>; Fri, 20 Feb 2026 05:44:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.121
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771566272; cv=none; b=A/Skr6nHVcxO2BpQxCl/zN39+ik/dDd+MCSeI1uy/qAl1Lv0FC1WRsm5GEG024nbU2K1/xrqkJ0H2ERl5fdMlvKjmOKXfMy9evD0NCTuDInZ11/jFC9R1QG7AQBRtzash/vIzKqSB+fdlyykO+Q7Egyf8u2klLkmTkdnFdffenk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771566272; c=relaxed/simple;
	bh=R76UmX9/00ElZTMV+xfZ7SP0EVshDWTf3qMR1/xDN1M=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RJCjgf0nnpINzy7mJ9ZWod8wCfNJdCGLOa2R2Ow2fwU0pw1tvnw+yb9V1TfAEHISjtoWWN7IuQcAOSeykzDYRRwXZTJuRJue86xEPveF7qteBETyoZ1/mjasnhp542hBhiIG8j5WWfmY780xUjvU2gNYDqqFHsJiVxgw0XXNKvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=FVFkPSs/; arc=none smtp.client-ip=109.224.244.121
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="FVFkPSs/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1771566263; x=1771825463;
	bh=R76UmX9/00ElZTMV+xfZ7SP0EVshDWTf3qMR1/xDN1M=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=FVFkPSs/KKQeX4QbSOhsWvrhQIemtR7Yp6oQzDZJ6jF98B0NtbvYwGHHY1Tl1/vky
	 iwUxTF8bD1AahJfUtPJKQ0MnP+UKAYSwb0XS9i1QOutQ2ptOet9vcuHTJWOaSvJsMv
	 fVeGSQlNppLOnNY5ZXjVPWduklhjJUU6eluQ3ekIA4BsCODGi7LJo4vPzZSKDewNek
	 XhIz+sqmNxAN4doLu0irREXdCo5dgv0gJeNiPGwDuz6Sj1uAwTsW3iMOO4sMqPaZcr
	 xvcht7FysVSqG7sJPdSdmi28lvo2gB2WnOUYzNus78CgCSK5JlzFzy0mrgEbGLzXqs
	 RAq+veSHs7Bpw==
Date: Fri, 20 Feb 2026 05:44:19 +0000
To: Hardik Phalet <hardik.phalet@pm.me>, linux-staging@lists.linux.dev
From: Hardik Phalet <hardik.phalet@pm.me>
Cc: vaibhav.sr@gmail.com, mgreer@animalcreek.com, johan@kernel.org, elder@kernel.org, gregkh@linuxfoundation.org, greybus-dev@lists.linaro.org, linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/2] staging: greybus: audio: fix NULL dereference in gb_audio_manager_get_module()
Message-ID: <DGJJTPL4YY7N.1JMN32YIUCHB8@pm.me>
In-Reply-To: <DGJJRT1BJV4H.1JGMNMC4SGKT7@pm.me>
References: <DGJJRT1BJV4H.1JGMNMC4SGKT7@pm.me>
Feedback-ID: 166659585:user:proton
X-Pm-Message-ID: a67a8913e30025287f99030ae81b3a00d8b874bf
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="b1=_AHS4X2sOCrCUDYH6wtbACi57D0OHhvYElFYfGavQC5o"

--b1=_AHS4X2sOCrCUDYH6wtbACi57D0OHhvYElFYfGavQC5o
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Empty Message
--b1=_AHS4X2sOCrCUDYH6wtbACi57D0OHhvYElFYfGavQC5o
Content-Type: text/x-patch; charset=utf-8; name=0001-staging-greybus-audio-fix-NULL-dereference-in.patch
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename=0001-staging-greybus-audio-fix-NULL-dereference-in.patch

RnJvbSAzYjQ5NmEwZGFhOGNiYmJlNTBhN2EwOWU2ZGFmN2JiNGQ4ZTZlOWU1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBIYXJkaWsgUGhhbGV0IDxoYXJkaWsucGhhbGV0QHBtLm1lPgpE
YXRlOiBGcmksIDIwIEZlYiAyMDI2IDEwOjQxOjQ5ICswNTMwClN1YmplY3Q6IFtQQVRDSCB2MSAx
LzJdIHN0YWdpbmc6IGdyZXlidXM6IGF1ZGlvOiBmaXggTlVMTCBkZXJlZmVyZW5jZSBpbgogZ2Jf
YXVkaW9fbWFuYWdlcl9nZXRfbW9kdWxlKCkKCmdiX2F1ZGlvX21hbmFnZXJfZ2V0X21vZHVsZSgp
IGNhbGxzIGdiX2F1ZGlvX21hbmFnZXJfZ2V0X2xvY2tlZCgpLCB3aGljaApjYW4gcmV0dXJuIE5V
TEwgd2hlbiB0aGUgcmVxdWVzdGVkIGlkIGRvZXMgbm90IGV4aXN0LiBUaGUgcmV0dXJuZWQKcG9p
bnRlciBpcyBkZXJlZmVyZW5jZWQgdW5jb25kaXRpb25hbGx5IHZpYSBrb2JqZWN0X2dldCgpLCBs
ZWFkaW5nIHRvIGEKTlVMTCBwb2ludGVyIGRlcmVmZXJlbmNlLgoKT25seSB0YWtlIGEga29iamVj
dCByZWZlcmVuY2Ugd2hlbiB0aGUgbW9kdWxlIGlzIGZvdW5kLgoKU2lnbmVkLW9mZi1ieTogSGFy
ZGlrIFBoYWxldCA8aGFyZGlrLnBoYWxldEBwbS5tZT4KLS0tCiBkcml2ZXJzL3N0YWdpbmcvZ3Jl
eWJ1cy9hdWRpb19tYW5hZ2VyLmMgfCAzICsrLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9u
cygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVz
L2F1ZGlvX21hbmFnZXIuYyBiL2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL2F1ZGlvX21hbmFnZXIu
YwppbmRleCAyN2NhNWY3OTZjNWYuLjFkYTg4MDRlNjFjYSAxMDA2NDQKLS0tIGEvZHJpdmVycy9z
dGFnaW5nL2dyZXlidXMvYXVkaW9fbWFuYWdlci5jCisrKyBiL2RyaXZlcnMvc3RhZ2luZy9ncmV5
YnVzL2F1ZGlvX21hbmFnZXIuYwpAQCAtMTExLDcgKzExMSw4IEBAIHN0cnVjdCBnYl9hdWRpb19t
YW5hZ2VyX21vZHVsZSAqZ2JfYXVkaW9fbWFuYWdlcl9nZXRfbW9kdWxlKGludCBpZCkKIAogCWRv
d25fcmVhZCgmbW9kdWxlc19yd3NlbSk7CiAJbW9kdWxlID0gZ2JfYXVkaW9fbWFuYWdlcl9nZXRf
bG9ja2VkKGlkKTsKLQlrb2JqZWN0X2dldCgmbW9kdWxlLT5rb2JqKTsKKwlpZiAobW9kdWxlKQor
CQlrb2JqZWN0X2dldCgmbW9kdWxlLT5rb2JqKTsKIAl1cF9yZWFkKCZtb2R1bGVzX3J3c2VtKTsK
IAlyZXR1cm4gbW9kdWxlOwogfQotLSAKMi41My4wCgo=

--b1=_AHS4X2sOCrCUDYH6wtbACi57D0OHhvYElFYfGavQC5o--

