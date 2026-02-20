Received: from mail-106118.protonmail.ch (mail-106118.protonmail.ch [79.135.106.118])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E353280335
	for <linux-staging@lists.linux.dev>; Fri, 20 Feb 2026 06:30:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.118
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771569032; cv=none; b=JQaBlj0NCNAqZj6zGm1QtIHXfCQYJ3yWik+LMApaOlcLHL/lRx3VNkFCiwGqy0/wnWeimfzrfAbmf5YiLrY/DzIRj1WrrZ/5L9yr2/tAxQwjbNBnU8k/ZTLP0udi0BglPvx9RSuzz70H3nW3bBk2YDocD92wB90poql/bLUWmrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771569032; c=relaxed/simple;
	bh=F0mFdNaR5Emio3Yo+Hu3GkUWq/x3e2P48hGEO44QrW0=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UovznJvczz0f0JN+0Yae347kSiPoplPt/AlcEyOLG6UPm7fZQ8q5dPr3TZ69Kh8A1MazwhPaAhEGt7rBFy2Jfn5+ZQNPsDBfjK+oQwuA+OgETuaxexCZI5iZ9GrhKJ4WtK3Nk3g308qv1rmOVFcJMUdAEgSBwM894NJEJKaa+I0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=pvUhB9MJ; arc=none smtp.client-ip=79.135.106.118
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="pvUhB9MJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1771569023; x=1771828223;
	bh=F0mFdNaR5Emio3Yo+Hu3GkUWq/x3e2P48hGEO44QrW0=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=pvUhB9MJVV8YPa0LRjR3PDP5ceFl/sP/evZmR7Bagc+UCaekMDFhky65rsMGVkukP
	 eUGpzw1Fxsb7J1rKIMIUVAflY9k4MV3cPCGUsUDNTW6giYQYO4xXwLKAGh8KaddZ+O
	 Gxpimq+/YT8u8qqgcJNkFvBADy9SqrmtfoWvK7nFNdZg7WM+BzL3Mo+Tl5d5or9tXE
	 dkfarUmLWgtHZHbn08wrW74zMw7ZXKsTEuIj+NJPjjFw5tG9G+fbO1PUYt13HHWKqy
	 JHFkzBshG+Yzyk1V1RqcYr1hJuRnhoK27eTSOY0u/UapjOYuyenE7v7NUOMmfnKhHO
	 bcfGGTTpCjIjw==
Date: Fri, 20 Feb 2026 06:30:20 +0000
To: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
From: Hardik Phalet <hardik.phalet@pm.me>
Cc: Vaibhav Agarwal <vaibhav.sr@gmail.com>, Mark Greer <mgreer@animalcreek.com>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Hardik Phalet <hardik.phalet@pm.me>
Subject: [PATCH v2 2/2] staging: greybus: audio: drop stale TODO in module release
Message-ID: <20260220062741.399677-3-hardik.phalet@pm.me>
In-Reply-To: <20260220062741.399677-1-hardik.phalet@pm.me>
References: <20260220062741.399677-1-hardik.phalet@pm.me>
Feedback-ID: 166659585:user:proton
X-Pm-Message-ID: ecf394c129eea227a6197263e843479041a8442e
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Modules are removed from modules_list in gb_audio_manager_remove() and
gb_audio_manager_remove_all() before kobject_put(). The TODO suggesting
list deletion in the kobject release callback is stale and misleading.

Signed-off-by: Hardik Phalet <hardik.phalet@pm.me>
---
 drivers/staging/greybus/audio_manager_module.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/greybus/audio_manager_module.c b/drivers/stagi=
ng/greybus/audio_manager_module.c
index 4a4dfb42f50f..b1dd3da9f57c 100644
--- a/drivers/staging/greybus/audio_manager_module.c
+++ b/drivers/staging/greybus/audio_manager_module.c
@@ -69,7 +69,6 @@ static void gb_audio_module_release(struct kobject *kobj)
 =09struct gb_audio_manager_module *module =3D to_gb_audio_module(kobj);
=20
 =09pr_info("Destroying audio module #%d\n", module->id);
-=09/* TODO -> delete from list */
 =09kfree(module);
 }
=20
--=20
2.53.0


