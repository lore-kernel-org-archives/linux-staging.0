Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 353691F09A5
	for <linux-staging@lists.linux.dev>; Sun, 26 Jul 2026 10:04:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785060271; cv=none; b=YpVtFciwS79DTNIuGF8bSRiBYX7Ez0/lCwb1WWyeJ5QTEH8/3T+vBcVCgcJt3t7W+jbWqJrCvvRNoRKvtnmtXa6YNfwfgaN6qHa5AdHTXoJFXxVviug1t++oDmZBa1C1kCZDqjydo0oZBBkrPG+NHbkHAlzcQYK47GE3HWeNQPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785060271; c=relaxed/simple;
	bh=7B35YZE6oc15BiSnsGvUCtFqLPIM1pzfUZ2v9rqMQOU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=gVuYJZIkT8dkVQdolJSHpQvkU837BtbdT+1Gr4fiiIshP9t2CYRLP1QMc/Z8CGIbXXH7kN/8VgXeVUJ2Ay2hJAh1W4+3mdN9Ys5KtPQA5JPVNMtVPLW+8UWtoZKk7TGOn42FZqooy8Eyu5CeHkAUMYUoX57xKS5ddQDBfBE1vFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=joiADplY; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="joiADplY"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-ca12086c06eso1422313a12.0
        for <linux-staging@lists.linux.dev>; Sun, 26 Jul 2026 03:04:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785060269; x=1785665069; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8ylvgAcOl9oKpTpFug9fyDy646d3xIKNYqdv16u3reo=;
        b=joiADplYIK2liVu3EzwZluSA6BK41bw3b6y0B8KYQg2qAf3Pp9G+ga0q9oQPM2yxDm
         xWtLX9cc+Qz8wGR6i+hV4hEU7ErqTtbHx9/DVMqxIfjxhsHWiQpYCdhoTHUD7iyjPkFN
         MGnNRr1CdqNES+YqG/ghHqDAMINJ1tnN6lU3vpC0lR54QQ+IeeXHWoDms+vWEIGJDNZ7
         GKmsaUs+/42iejndOfPk79mrY6r5W1McPd4+DettvTDt6T9wVmjiOmavGjbakKCCQjP8
         revFazbC7ANtY3H5oXZhDCKTGeo6otukqESwCG0JERqcPP0jOw2UHbkIoyYqlZlvy9kK
         Gq3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785060269; x=1785665069;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8ylvgAcOl9oKpTpFug9fyDy646d3xIKNYqdv16u3reo=;
        b=r5yhsh8q3Ux9BFuenRyFLAWPDMEbLxL7BDMXTbOmvaj/ZI6YYMZFf/5nB+x3uNp+rc
         bEK1xP5O1tXdBbGbEyQZxJymfLirOw1egVSR8pfthg49lrALMs8XUmRKwnYojGughHHo
         ILUti3N9lmo7e7z2iBxBNde1I++9hHUdmgsBxd4oaZM7l/TSOIevSdgOpZtgetZgBYkl
         kDODHHbAsMle9ZZIwZHrvA3GP+WXgVjnHJyVSeJJxPtjOiCdxZmVFe2uZXMd/i0voGMT
         mzSkqiBUWsIxqNLogWV504kYESe9S9UYSU4CMJiU/kRIIseTYFE4OqT+ZmdSgYKVyo2c
         aRLA==
X-Forwarded-Encrypted: i=1; AHgh+RqUzjaglLmSwqzNF0q+8aMJISzjXCzDjL3mruarDe+CYNWrLOjAUmNiHOs0tPjB0kuIOTtvnKeef1f5v86s@lists.linux.dev
X-Gm-Message-State: AOJu0YxMiZiafMfsmkeXJvd6Qx8uYfZ06v40AUKaVMCh8eCbKfuEgd3l
	i8zLqFyQVNyD9umjtjtCiebkWG4oAHzU88RuAt/E8D8xsKdIcB3X0f9D
X-Gm-Gg: AR+sD11twkyGcFrQt3nQbHySmzOvygHsGs+p/Q8dAb/ULenhz8hzVuu4obY0r0eXL9q
	Fc7vXy4PewvByr+pA1lXBU4SGYWNZcv4NnjIDk255dY/dR+5I4EgRobx60K6fIU8HYdETZxCvuK
	C4vKF3ddIEnXkjxLYMOLU4FxMiy8KRkEOUV74JFq6pZJR7Pf0RccMnkkmB5HBRmmFnfXaRWeEvJ
	gUbfIIs4INE5scEJGGmvT7GkCmnicuh5XB2nbKdb8JIFNfyyIsbcDTg8l6nmbYRdzZWApYbRKeb
	qgL16NntiYBK4gzZnHsSECsVJwRBQVSOAXVBKVR85+V9FE/AxupcSco/Xu19T/sqfOQs2rjk/dM
	xhkYGf9tvGORIjqz7T84BXw6z0st9qo8J03Abz2ekUKQbwhlW7WE0PyLcwwfWvB278PABSDNWlE
	kkP5GdPgmu6y4eywbzKRU=
X-Received: by 2002:a05:6a20:d12f:b0:3c3:83e6:c705 with SMTP id adf61e73a8af0-3c67df08725mr4678734637.35.1785060269292;
        Sun, 26 Jul 2026 03:04:29 -0700 (PDT)
Received: from SGN-LDSENG.tasernet.com ([2405:4800:5cc3:11a:1ac0:4dff:fe8b:4a69])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc57ae17sm16923506eec.22.2026.07.26.03.04.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 03:04:28 -0700 (PDT)
From: Cong Nguyen <congnt264@gmail.com>
To: Thierry Reding <thierry.reding@kernel.org>
Cc: Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	linux-media@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Cong Nguyen <congnt264@gmail.com>
Subject: [PATCH] staging: media: tegra-video: fix syncpoint leak in tegra20 channel init
Date: Sun, 26 Jul 2026 17:04:08 +0700
Message-Id: <20260726100408.3262831-1-congnt264@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

tegra20_channel_host1x_syncpt_init() requests two host1x syncpoints. It
stored the first one (mw ack) into chan->mw_ack_sp[0] and only then
requested the second one (frame start). If the second request failed the
function returned without releasing the first syncpoint, leaking it: the
caller tegra_channel_init() bails out with a bare "return ret" on a
syncpt init failure and does not run its free_syncpts error path (that
path only covers failures after syncpoint init has fully succeeded), and
the channel is subsequently torn down via the kfree()-only path, so
nothing ever releases the orphaned syncpoint.

Release the already-acquired syncpoint on the error path, and only
publish the syncpoints into the channel once both have been successfully
requested, so chan->mw_ack_sp[0] never holds a released handle. This
matches the handling in tegra210_channel_host1x_syncpt_init().

Fixes: 0e2c4117c351 ("staging: media: tegra-video: add CSI support for Tegra20 and Tegra30")
Signed-off-by: Cong Nguyen <congnt264@gmail.com>
---
 drivers/staging/media/tegra-video/tegra20.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/tegra-video/tegra20.c b/drivers/staging/media/tegra-video/tegra20.c
index e513e6ccb776..f8acb6834a0b 100644
--- a/drivers/staging/media/tegra-video/tegra20.c
+++ b/drivers/staging/media/tegra-video/tegra20.c
@@ -429,12 +429,13 @@ static int tegra20_channel_host1x_syncpt_init(struct tegra_vi_channel *chan)
 	if (!out_sp)
 		return dev_err_probe(vi->dev, -EBUSY, "failed to request mw ack syncpoint\n");
 
-	chan->mw_ack_sp[0] = out_sp;
-
 	fs_sp = host1x_syncpt_request(&vi->client, HOST1X_SYNCPT_CLIENT_MANAGED);
-	if (!fs_sp)
+	if (!fs_sp) {
+		host1x_syncpt_put(out_sp);
 		return dev_err_probe(vi->dev, -EBUSY, "failed to request frame start syncpoint\n");
+	}
 
+	chan->mw_ack_sp[0] = out_sp;
 	chan->frame_start_sp[0] = fs_sp;
 
 	return 0;
-- 
2.25.1

