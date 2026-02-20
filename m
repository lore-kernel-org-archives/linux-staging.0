Received: from mail-43103.protonmail.ch (mail-43103.protonmail.ch [185.70.43.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 492AA7478
	for <linux-staging@lists.linux.dev>; Fri, 20 Feb 2026 06:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.103
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771569015; cv=none; b=DbsX89iqkB8uNil0ob/tbKgrZlK/+badzN8zIvPbzCyzUxANA+cYVItHCX4q8AZ9Y+3WlKUU4NEH82vxkkxjeF0W3nvwq01yuyqbOhcG9auymCxQZBzcpXHHBkU1GTH7lKDwqAYGMAEOFHC0dK7Omlmo0zL1n+IIr3XviC1pkfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771569015; c=relaxed/simple;
	bh=/yCmZsVImkA91POQwnQLq4+evRMhgEY0xdFC1q2nqEY=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=fxZxR31Uek70Oqf/yxZ5R3nqcnwz09MLUKkZFymgEjneP+bgi8+0bD9GAPbXeCwcD9kHsoih5gmr5iOE6KyPP6dNvFmnLmdgIkEPoFoZnJHz0KujGE0Mr9gi+SNJSRxe8qmHnSJkJ6ge/41xT79/IRPs1udGl1t1cuGLqdOpp1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=arIV9jy4; arc=none smtp.client-ip=185.70.43.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="arIV9jy4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1771569007; x=1771828207;
	bh=E83ONfZnqyHZtuZXpb0GZApa4xUNgnlMeDlbhltn2fA=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=arIV9jy4rUld8d1GXPDMvXObTLrnf/x79/eJKnKQUzo92tYTpcRX+O63Op+1FnTmD
	 t28B984+uGsTVuAOSbDzXKw+UU+2gfEd/yAt80SpIKfkIQgIVS3198clbFzgImtW9b
	 GMZtz8JK47x9MYJH2qE1DYQEOfbOPfIo+5wB8qQ5r8Tn3oiYxuU/lYwFk/TgAVsHKR
	 fLb0NhcX/FquqVN5k8kNu5QKx1Ptl+2M+K4bNm7VKkee2eNLXS2bE5hlZ60W3xaU48
	 CpLmJhVAgEipgxEsvyYxKQAFGDhg041J62e6jxFh9T207tyP20ZWTmjnNtrBr2w1uy
	 VMX37tOs0LxSw==
Date: Fri, 20 Feb 2026 06:30:01 +0000
To: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
From: Hardik Phalet <hardik.phalet@pm.me>
Cc: Vaibhav Agarwal <vaibhav.sr@gmail.com>, Mark Greer <mgreer@animalcreek.com>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Hardik Phalet <hardik.phalet@pm.me>
Subject: [PATCH v2 0/2] staging: greybus: audio: small fixes
Message-ID: <20260220062741.399677-1-hardik.phalet@pm.me>
Feedback-ID: 166659585:user:proton
X-Pm-Message-ID: 04199aef8432e15796c9dd366aa051f63f0d9d47
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Changes in v2:
- Resent using git-send-email (previous submission had incorrect formatting=
).
- No code changes.

This series contains two small fixes for the Greybus audio manager:

1) Fix a NULL dereference in gb_audio_manager_get_module().
2) Drop a stale TODO in the module release callback.

Both are correctness / cleanup fixes with no functional change beyond preve=
nting crashes.

Thanks,
Hardik

Hardik Phalet (2):
  staging: greybus: audio: fix NULL dereference in
    gb_audio_manager_get_module()
  staging: greybus: audio: drop stale TODO in module release

 drivers/staging/greybus/audio_manager.c        | 3 ++-
 drivers/staging/greybus/audio_manager_module.c | 1 -
 2 files changed, 2 insertions(+), 2 deletions(-)

--=20
2.53.0


