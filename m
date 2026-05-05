Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8CFA47ECEE;
	Tue,  5 May 2026 13:48:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777988901; cv=none; b=t6kxE0LNW3zQ8shxVRp6eLXnKXbvzyATfV8Im17Vsqlk+ys7wJom+NwWXS+RO5NCdNsTySO3U0CkrgknlqvDIDiZb3rYMW69622Ypdt5FqZlkRXikHrGcBmJUiLE36qxa0/4PNwGS5YeB4oE4Y06V+Y1ZbOD5TftNXt47wT2/tg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777988901; c=relaxed/simple;
	bh=xF1jTvN4NvmVxS1I/epYbue7pIXNESPdSRtLfleCD1w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Vz3BsQAEPFb5XEjkjEDAzVmsXeKDJ84AqFP7iPj91UV4cnyMKpphRJvM80q4eQQbPIjxNv2q6sCxHcc1njYNYli9bG6YbEVYsrC4EYsfqwv5Ksh+BBM/SCkuaUX+UaE524SBcFVkPJFwY2al2evXrEIKkFlQqCPkbHwznR1Vwhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ijx1lBqN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ijx1lBqN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94034C2BCFB;
	Tue,  5 May 2026 13:48:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777988901;
	bh=xF1jTvN4NvmVxS1I/epYbue7pIXNESPdSRtLfleCD1w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ijx1lBqNPEMBLP0Ay/ZHh/p1+vm09mTq5rbpTTL9e2SRWmgOk+2cdAYU55l+2+gqM
	 x4KLqdokMk/QJS9+kE1wTYVOhNr9I5aGoBIQr7sV+HIfGCkKRh9Tiu++nD4BPtIm5+
	 WZXtCvLPinyKtuiUkmxEbmb314GQC9bz7FnacDyNkAorkQHPJeLN6VCIcKd5b8IS4K
	 CeQjNyyfQjV3aSm5B2s2r7c8fXQTIuxDS1gpUeHOYpX+iw3TAxLTAbAS0aVoxRMNSQ
	 BH4FZyY1dlC5dA3hTbmWjJ6/ij4SZKsJvCOqIWRP44mVoIsgJVvDUYyYXI01NBj5o0
	 N61zew6Me6/sw==
Received: by wens.tw (Postfix, from userid 1000)
	id 539755FFCE; Tue, 05 May 2026 21:48:19 +0800 (CST)
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
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/7] drivers: staging: media: sunxi: cedrus: add H616 variant
Date: Tue,  5 May 2026 21:48:08 +0800
Message-ID: <20260505134812.408316-5-wens@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260505134812.408316-1-wens@kernel.org>
References: <20260505134812.408316-1-wens@kernel.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Allwinner H616 SoC has a video engine hardware block like the one
found on previous generations such as the H6. In addition to the
currently supported features of the H6, it is also supposed to include
a VP9 decoder. However software support for this is currently missing
and still needs to be reverse engineered from the vendor BSP.

Add the compatible for the H616 variant, using the H6 variant data.

Signed-off-by: Chen-Yu Tsai <wens@kernel.org>
---
 drivers/staging/media/sunxi/cedrus/cedrus.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.c b/drivers/staging/media/sunxi/cedrus/cedrus.c
index ee0e286add67..2801b9a064bd 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus.c
@@ -695,6 +695,10 @@ static const struct of_device_id cedrus_dt_match[] = {
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

