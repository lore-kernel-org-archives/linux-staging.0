Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 623B22BE7BA;
	Sat, 11 Jul 2026 14:00:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783778415; cv=none; b=Yv0El3weu5WRiv7esnWYiFmlyiPSwEsl7YidKgsljTN+bbhzev34FHtPZ+EhW5QuXaVnYb/lQQgKTCXuqcGLWFEjdomByWlbxm8/za/9n6dyZ0XVJcYkIv6eHHIyUpfvw0chiyqYTvRarux0bZ1C/6g57tt6ik1FguVjdtF8Q1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783778415; c=relaxed/simple;
	bh=w7wAhjr3OsrA14pePJOiCKmYusjZh13Z62To1CeUVP8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=adNFQtKE43TYTfitB4wKDccg6AOluyvQAO+uVP6puWMMPxHLyuwSUztNWrQuFBD0F25wXN0zoiTojYSuixLserO38X0HMO4JZmH6WNe7E2JIJnxllDa0qQ9VZCJcO3V9MHk2+1hhO51cDN+M6kSo1ZlS4BYjXyBNCoCIno567UA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Fd/VIn4c; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Fd/VIn4c"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53C6B1F00ACA;
	Sat, 11 Jul 2026 14:00:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783778411;
	bh=S0G6ilPkMy+tyb9WZl7gdzOFKTmLXdAZ+ze/q2dbU/c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Fd/VIn4c1J8V59LUaGWkWv55Qq+DISlOq2SdFQdsrm7PRTb9acBvD4EFc+GdYonOm
	 Tk2dj34bkwLoCQOwvM8emvJaUVsaJKvXvuvCWGyqOxlZ+rMehkgbs1ywfmqH7QfVSj
	 5by4fAspZSknuhgFRGv8TUfZIgC8gEL6uLFALxGeBzouHY8i/w9aoinw0D6hlkupui
	 4lWEtZkFOSbhekyzSIXpLzmOma5pc9UkFc79hb0E/bXY6fBz1JKjVjS6McQKRulUeV
	 o2j7E5WQt1feEwXv6sVzRZMcCNyjijcCTRUuDlNYx8Wq8pb8wVOG07P5isDAUg+uFz
	 ZJCOLnmmRWUIQ==
Received: by wens.tw (Postfix, from userid 1000)
	id 6ED87601EA; Sat, 11 Jul 2026 22:00:06 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: Maxime Ripard <mripard@kernel.org>,
	Paul Kocialkowski <paulk@sys-base.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH v2 4/7] drivers: staging: media: sunxi: cedrus: add H616 variant
Date: Sat, 11 Jul 2026 21:59:55 +0800
Message-ID: <20260711135959.3616919-5-wens@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260711135959.3616919-1-wens@kernel.org>
References: <20260711135959.3616919-1-wens@kernel.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Allwinner H616 SoC has a video engine hardware block like the one
found on previous generations such as the H6. In addition to the
currently supported features of the H6, it also includes a VP9 decoder.
Support for VP9 will be added separately.

Add the compatible for the H616 variant, using the H6 variant data.

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Signed-off-by: Chen-Yu Tsai <wens@kernel.org>
---
Changes since v1:
- Updated commit message on VP9 decoder status
---
 drivers/staging/media/sunxi/cedrus/cedrus.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.c b/drivers/staging/media/sunxi/cedrus/cedrus.c
index bbd186b8035b..ac0217976670 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus.c
@@ -696,6 +696,10 @@ static const struct of_device_id cedrus_dt_match[] = {
 		.compatible = "allwinner,sun50i-h6-video-engine",
 		.data = &sun50i_h6_cedrus_variant,
 	},
+	{
+		.compatible = "allwinner,sun50i-h616-video-engine",
+		.data = &sun50i_h6_cedrus_variant,
+	},
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, cedrus_dt_match);
-- 
2.47.3

