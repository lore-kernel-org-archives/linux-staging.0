Received: from mail-43102.protonmail.ch (mail-43102.protonmail.ch [185.70.43.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C0FF29405
	for <linux-staging@lists.linux.dev>; Sat, 18 Jul 2026 00:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.102
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784335379; cv=none; b=p1rUPw1RD6oonPNLbIR8HDcJMUzm2MtjAz25qylZ0E2M8hAKm4xfyLZMDyCzrLlFXAFdUPC0nvxPbLLFpjmymz9fSHAL9FjB3H4q4r5ATwLwBn/5/nJBAXfn1U5nlQMs9DezIptOnG6IPZIZRv5nSMUqAtlAwAJ4J7uWHXAS1jY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784335379; c=relaxed/simple;
	bh=iv6s9NzDmH65gDpA7I256JI4HKad5KrPNSm6lmm7EPA=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=AR+qZ2iKO+4BRpndPQ0AHzkg6hTruSZ3jfCwFv+VUTE8hyQev7udYTZ1e/Q+v5ZmRaXkZeRlmzdS/e7R9ImVp5nm2O6KvTS4qHLuhhzHHb0OCprEnpaeE9HG2Xqw+qdPpJbflwPfQR/P7qNMMjkiRynb6UINfh9VxBVGzOxjJdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=CxJpOXw+; arc=none smtp.client-ip=185.70.43.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="CxJpOXw+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1784335365; x=1784594565;
	bh=z+Z/q/R/PxaIfp4pmFwcxBfItwqmAy6PyKLIe/k4KPg=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=CxJpOXw+qnjrRYgNjYA3u+IoTf8KzuOPtqUEYn4xsQHWTNRMY6Rl2Lvk7jAoZCo7d
	 EWx5c9y+vnn9PbkWzuIzmvrl6kn2iEiNv3emjNvJTNoKo+5xCWQqqqPmNrsY9OJqB4
	 T9zjSge1aJpSuq+DEr4OB0UovhopBf7dQ4xzcn8zFLwh9FLZOGeClXbcJXYOy2Z83h
	 myuQuLFZ/yOev/LJMJsYI8a1PDInKPKO+ARGn6HYCyKOedavgMf1sXW1pztnbivN8U
	 Og5PThZu8EUwX+USSjcjUZ1qR9lDj8qKktS0jOlEqT7UX7uqI/G878YNWP1pvatR5q
	 KTwWM9Sb6Sy1w==
Date: Sat, 18 Jul 2026 00:42:40 +0000
To: Parthiban Veerasooran <parthiban.veerasooran@microchip.com>, Christian Gromm <christian.gromm@microchip.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
From: Nils Lehnen <nils.lehnen@proton.me>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Nils Lehnen <nils.lehnen@proton.me>
Subject: [PATCH] staging: most: video: replace pr_err with dev_err
Message-ID: <20260718004223.54943-1-nils.lehnen@proton.me>
Feedback-ID: 188354734:user:proton
X-Pm-Message-ID: c2fd27c4d28c6a0ca2ef6edc3906be268dab81f9
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

The MOST core and the already converted net component log with device
context, while the video component still uses bare pr_err(), which
leaves its messages without any hint of the originating interface.
Both affected functions have the most_interface at hand, so log through
dev_err(iface->dev, ...) exactly like drivers/most/core.c does.

All English text in this patch (commit message and code comments) was
translated from a German draft with the assistance of Claude Fable 5.

Assisted-by: Claude:claude-fable-5 sparse
Signed-off-by: Nils Lehnen <nils.lehnen@proton.me>
---
Compile-tested only (x86, CONFIG_MOST_VIDEO=3Dm; no MOST hardware
available).

 drivers/staging/most/video/video.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/most/video/video.c b/drivers/staging/most/vide=
o/video.c
index 78234620d48d..88892b5db28b 100644
--- a/drivers/staging/most/video/video.c
+++ b/drivers/staging/most/video/video.c
@@ -464,18 +464,18 @@ static int comp_probe_channel(struct most_interface *=
iface, int channel_idx,
 =09struct most_video_dev *mdev =3D get_comp_dev(iface, channel_idx);
=20
 =09if (mdev) {
-=09=09pr_err("Channel already linked\n");
+=09=09dev_err(iface->dev, "Channel already linked\n");
 =09=09return -EEXIST;
 =09}
=20
 =09if (ccfg->direction !=3D MOST_CH_RX) {
-=09=09pr_err("Wrong direction, expected rx\n");
+=09=09dev_err(iface->dev, "Wrong direction, expected rx\n");
 =09=09return -EINVAL;
 =09}
=20
 =09if (ccfg->data_type !=3D MOST_CH_SYNC &&
 =09    ccfg->data_type !=3D MOST_CH_ISOC) {
-=09=09pr_err("Wrong channel type, expected sync or isoc\n");
+=09=09dev_err(iface->dev, "Wrong channel type, expected sync or isoc\n");
 =09=09return -EINVAL;
 =09}
=20
@@ -495,7 +495,7 @@ static int comp_probe_channel(struct most_interface *if=
ace, int channel_idx,
 =09strscpy(mdev->v4l2_dev.name, name, sizeof(mdev->v4l2_dev.name));
 =09ret =3D v4l2_device_register(NULL, &mdev->v4l2_dev);
 =09if (ret) {
-=09=09pr_err("v4l2_device_register() failed\n");
+=09=09dev_err(iface->dev, "v4l2_device_register() failed\n");
 =09=09kfree(mdev);
 =09=09return ret;
 =09}
@@ -521,7 +521,7 @@ static int comp_disconnect_channel(struct most_interfac=
e *iface,
 =09struct most_video_dev *mdev =3D get_comp_dev(iface, channel_idx);
=20
 =09if (!mdev) {
-=09=09pr_err("no such channel is linked\n");
+=09=09dev_err(iface->dev, "no such channel is linked\n");
 =09=09return -ENOENT;
 =09}
=20

base-commit: 64276d9bfe4d1fdd5cf2636f1065f7ea55c2defb
--=20
2.43.0


