Received: from mail-24425.protonmail.ch (mail-24425.protonmail.ch [109.224.244.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E455118D636
	for <linux-staging@lists.linux.dev>; Fri,  4 Sep 2026 05:56:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788501394; cv=none; b=GBrSV8n+G8vnYA4nwyqUFs4fJMeev6mi6atsN9itzeRwIyEhY/gPEFDglDrWPGuGvs8v3hA5hJEXV1w9vucMYbMPJeIfJDFp7/8ytdQ6rQt9ZRH3w2AxIrEXXXwD+UBGLx7rGNKRdrrw9fqxhRj2mcmXUGpRYlA02krvYB0y8zo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788501394; c=relaxed/simple;
	bh=7Xt7Kn8kJF6lxMVlOVyIM3tORKDbc4KAs/7sPreRJc8=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=WD3xnMXy0YqLasOGgACVQrT5C3YeCt2fmv4/HEGqDYB6ZniokW5JjGweODgiT0zBf8li63ua1dWjzCiVvVMGuPwcNsEPvDn5ralEZnCqndgwX7hLSgP17o6oU/gh9sOrrnaEkR7lvLlPmTmiiwBjVBR4WNG8nh0PwlueNpqVcVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=N1xeDrO8; arc=none smtp.client-ip=109.224.244.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="N1xeDrO8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=ywveyr33ezbgrmu2ki7gud7ety.protonmail; t=1788501389; x=1788760589;
	bh=yA8mtXglU3dreRpjVd89aIiFhuD4odifB155h7kVRtE=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=N1xeDrO8KWYsRTCr7wpc8WBGtV1qapgC6X6KwAGZ/7GIwa/Yn5QqvWMSd4IlY36qo
	 fL367scAQEzkSAfjvuyoid5FY+rNlkzSi9E40jKg8FqUiUNOM/ixBedTb5G9/4z8Hk
	 5tf0L+Y5sptDCxfnZp9Apb+aIoDBGwjcepDvFpHzR2K6VvhBpgNsI7kpgRURwjc/0b
	 uavCpNpMmcaFUVpO6yTCt4KKi8Nh0NzwMrO+fbMINFBTqrEFOqMrzu94ZpL8ZwMEVE
	 0A4ktfjZfOZnuv95c3eYVu+Ke6r1+ejHTP2bPLEO3qJW2mi/GQxvuu+mo71anlHGNM
	 jZU2lwSuEVOvQ==
Date: Fri, 04 Sep 2026 05:56:25 +0000
To: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
From: contectforbusiness@proton.me
Cc: "rmfrfs@gmail.com" <rmfrfs@gmail.com>, "johan@kernel.org" <johan@kernel.org>, "elder@kernel.org" <elder@kernel.org>, "greybus-dev@lists.linaro.org" <greybus-dev@lists.linaro.org>, "linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: [PATCH 2/2] staging: greybus: light: add comments to mutex definitions
Message-ID: <PqjvDjNm1A3nH3BCu_rlHx6YLIzrr0r8McQL1Xbg5GX6VcF6GW49nKPhkTIcHashk4ktOEARq8_izQ6xyFqeWAliK0JqQ8MMPOrFIXSowcw=@proton.me>
Feedback-ID: 147676893:user:proton
X-Pm-Message-ID: 122e5c71d7d6b4f83da2ff1e4883039d31cf7c84
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

checkpatch complains about:

  CHECK: struct mutex definition without comment

Add short comments describing what each mutex protects. The
channel lock protects the channel state and lights_lock protects
the lights array.

No functional change, just quiets checkpatch.

Signed-off-by: Vaibhav <contectforbusiness@proton.me>
---
 drivers/staging/greybus/light.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/greybus/light.c b/drivers/staging/greybus/ligh=
t.c
index cab02b5da..a036fa2a0 100644
--- a/drivers/staging/greybus/light.c
+++ b/drivers/staging/greybus/light.c
@@ -37,7 +37,7 @@ struct gb_channel {
 =09bool=09=09=09=09releasing;
 =09bool=09=09=09=09strobe_state;
 =09bool=09=09=09=09active;
-=09struct mutex=09=09=09lock;
+=09struct mutex=09=09=09lock; /* protects channel */
 };
=20
 struct gb_light {
@@ -59,7 +59,7 @@ struct gb_lights {
 =09struct gb_connection=09*connection;
 =09u8=09=09=09lights_count;
 =09struct gb_light=09=09*lights;
-=09struct mutex=09=09lights_lock;
+=09struct mutex=09=09lights_lock; /* protects lights */
 };
=20
 static void gb_lights_channel_free(struct gb_channel *channel);
