Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FFEE2BEFEF
	for <linux-staging@lists.linux.dev>; Fri, 20 Feb 2026 05:42:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771566122; cv=none; b=RNdTsqG4hpI+25VeeDc993WwNDD/gbJjzhjDa3Qmtk0EFCrdPFN+sUxN8GmtKLChfoCg+TidGx50c1WKnXH4ed8E8jv0CkNXXJc5ij5NnBppxImXPiVJziv0IgJCAw2dv4WN2DrQ0LceNOC+fTHfohGFZvaOejhawprVCERMKzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771566122; c=relaxed/simple;
	bh=+1huOgB43ir7P1leu3NQYddufx0nCeZ2o3NtrpAsLUo=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=pwTBxJy9qV1JwfY/TWdoP6Lk4aWERGbS89YpZL4XHr/jv42H/wSp63Wo46Agkq0sQusD9OJzIVR+ajZSdnchP5uC6CnLc8eCI1p485W9ljdh8gS8PSUxZhWPDDt/fdWMV//69md40Bmj7iN8aVUW0hFuWJrgbSKmhpzHLnKQqNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=O8PUulLP; arc=none smtp.client-ip=185.70.43.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="O8PUulLP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1771566112; x=1771825312;
	bh=+1huOgB43ir7P1leu3NQYddufx0nCeZ2o3NtrpAsLUo=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=O8PUulLPISAyWINj8K7GZoBNA8ZC9qt8ggIWByNC4i1eOMTJhH56K/G1UqrqQ75DR
	 4CEgTdm40addkCNuZ/W5P31mvmdRqPEodY/ucLOmwyAIlG5TTr5TFT8sPqeolXM4XS
	 Bv3aCBw/etZ4+7WZ8NsFsRUfSORAvfUJ7z+qwhLhH4p4SsSbFzSUBGrifBaCKrbIP4
	 RwNnMx1how/NJimg/onzfrAfiCqtR+UdnC5FHWP1xs/leZFwCufxMRyRut5MEg7ijJ
	 g80kBq7F+f4ZXxnJFyD3gX9uZU+qkfbtxp+JC5R1u4HkPyMmHDtmt4/rUkTPK2jPp0
	 tJBm4dmUGf2qw==
Date: Fri, 20 Feb 2026 05:41:50 +0000
To: linux-staging@lists.linux.dev
From: Hardik Phalet <hardik.phalet@pm.me>
Cc: vaibhav.sr@gmail.com, mgreer@animalcreek.com, johan@kernel.org, elder@kernel.org, gregkh@linuxfoundation.org, greybus-dev@lists.linaro.org, linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/2] staging: greybus: audio: small fixes
Message-ID: <DGJJRT1BJV4H.1JGMNMC4SGKT7@pm.me>
Feedback-ID: 166659585:user:proton
X-Pm-Message-ID: 43ad6efd0e3a2bca415310f6e54455951a1f6e96
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="b1=_yxARdOMigsEyTeZuBEG3mhf7MD5UDtMS2KbQAfBNUk"

--b1=_yxARdOMigsEyTeZuBEG3mhf7MD5UDtMS2KbQAfBNUk
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

This series contains two small fixes for the Greybus audio manager:

1) Fix a NULL dereference in gb_audio_manager_get_module().
2) Drop a stale TODO in the module release callback.

Both are correctness / cleanup fixes with no functional change beyond
preventing crashes.

Thanks,
Hardik

--b1=_yxARdOMigsEyTeZuBEG3mhf7MD5UDtMS2KbQAfBNUk
Content-Type: text/x-patch; charset=utf-8; name=0000-cover-letter.patch
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename=0000-cover-letter.patch

RnJvbSBiMzgxNzY3NjcyMDIzMjM0ZTZkMTg0ODJhN2I2OGFlYjc4ZmRmMmI5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBIYXJkaWsgUGhhbGV0IDxoYXJkaWsucGhhbGV0QHBtLm1lPgpE
YXRlOiBGcmksIDIwIEZlYiAyMDI2IDExOjAwOjQxICswNTMwClN1YmplY3Q6IFtQQVRDSCB2MSAw
LzJdICoqKiBTVUJKRUNUIEhFUkUgKioqCgoqKiogQkxVUkIgSEVSRSAqKioKCkhhcmRpayBQaGFs
ZXQgKDIpOgogIHN0YWdpbmc6IGdyZXlidXM6IGF1ZGlvOiBmaXggTlVMTCBkZXJlZmVyZW5jZSBp
bgogICAgZ2JfYXVkaW9fbWFuYWdlcl9nZXRfbW9kdWxlKCkKICBzdGFnaW5nOiBncmV5YnVzOiBh
dWRpbzogZHJvcCBzdGFsZSBUT0RPIGluIG1vZHVsZSByZWxlYXNlCgogZHJpdmVycy9zdGFnaW5n
L2dyZXlidXMvYXVkaW9fbWFuYWdlci5jICAgICAgICB8IDMgKystCiBkcml2ZXJzL3N0YWdpbmcv
Z3JleWJ1cy9hdWRpb19tYW5hZ2VyX21vZHVsZS5jIHwgMSAtCiAyIGZpbGVzIGNoYW5nZWQsIDIg
aW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCi0tIAoyLjUzLjAKCg==

--b1=_yxARdOMigsEyTeZuBEG3mhf7MD5UDtMS2KbQAfBNUk--

