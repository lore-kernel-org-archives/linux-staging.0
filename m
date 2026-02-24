Received: from mail-10629.protonmail.ch (mail-10629.protonmail.ch [79.135.106.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 947711ADC83
	for <linux-staging@lists.linux.dev>; Tue, 24 Feb 2026 18:54:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.29
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771959297; cv=none; b=eLhf+baRMEP0LGjFc4vw+OcFJRduiG4jiES/4fKt+c8v9IlrSat6VPxFfK10NNPQbC4HuTy4RaLHqfNItruyaHN01ItkaD7yC7dp0ZnPqVRq44IWpCJ7g1HA8VgLHp1SnylVa4+l6Jtl53ngSjfbwVoGTsFv5biEixNpRKkt1fI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771959297; c=relaxed/simple;
	bh=273rzipKZt3iWmBt4Z1jKu3D9z1P+6Z8tlzSJOBv2/A=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=tYBf+qs0wdwaHajT4iNl+qQfT0PyK8C/0O7DSHuh+ncl4TR9O3ybjMDdo9RNUzZnAU6tCXE0LN5KofBfd1jB84IlALfEMuAI3xU2qGKlR6UahQ/QfbPb/H2gbeIxx0sMmVy8e7pzuulXrq50pKKWSIuXDFpGAHxK163y9D8uHW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=mIt+rIgR; arc=none smtp.client-ip=79.135.106.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="mIt+rIgR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1771959293; x=1772218493;
	bh=JnJurbv9xGNA5l1meJmsf8wFAKqxDX+/AAKbZcDSXM8=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=mIt+rIgRAX8Q90cEicFv/mjpNc7KL7zeRVzCiXCJ6etxXKoEOI3VlOX9C4YjO0B21
	 cKdv9CAAl7DXpmHOpuO0JEdxyjvjMnIfyIHAIORtTia2sXrERWqVajliY3KV+lsRIi
	 A5raNOOhL6lfFaIfb8XvGSo7cFfx0lfkN+mU437GvnlpZHyLhxo7qiEzVAZZ5RY1xH
	 Rh++3Tj6q3IMche1rWqqMaTVUnxKGvKQSW/OA3ZFoH21Nkz8t3dTIg5GdLwvf8GwDA
	 +u0MdU3DJuos1OUWdOCQ2UC7ZYR69WjUsZd7B2zcN2mO6W/A1GyGrerHbnyhu9D9Qb
	 ysBpwnI2Xx8sA==
Date: Tue, 24 Feb 2026 18:54:46 +0000
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Vaibhav Agarwal <vaibhav.sr@gmail.com>
From: Hardik Phalet <hardik.phalet@pm.me>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, Mark Greer <mgreer@animalcreek.com>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Hardik Phalet <hardik.phalet@pm.me>
Subject: [PATCH v3 0/2] staging: greybus: audio: remove dead code and clean up
Message-ID: <20260224185421.824210-1-hardik.phalet@pm.me>
Feedback-ID: 166659585:user:proton
X-Pm-Message-ID: 888bb053d7bcff0cfb0fed0f3019fa0c92c892f3
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

This series cleans up dead code in the Greybus audio manager.

gb_audio_manager_get_module() has no in-tree callers. The previously
reported NULL dereference is therefore unreachable. Per review feedback,
the unused function is removed to avoid carrying dead code.

Patch 2 performs a small cleanup in the same area.

Changes in v3:
- Replaced the NULL-deref fix with removal of gb_audio_manager_get_module()
  since there are no in-tree callers (per Greg KH).
- No functional changes otherwise.

Thanks for the review.

Signed-off-by: Hardik Phalet <hardik.phalet@pm.me>

Hardik Phalet (2):
  staging: greybus: audio: remove unused gb_audio_manager_get_module()
  staging: greybus: audio: drop stale TODO comment

 drivers/staging/greybus/audio_manager.c        | 12 ------------
 drivers/staging/greybus/audio_manager.h        |  7 -------
 drivers/staging/greybus/audio_manager_module.c |  1 -
 3 files changed, 20 deletions(-)

--=20
2.53.0


