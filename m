Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F181A312831
	for <linux-staging@lists.linux.dev>; Thu, 25 Sep 2025 15:17:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758813470; cv=none; b=dWCRHSa0eVnoXmIemX2tmooERDimnRl+EpL3CcMdnVzKeq+5RxICm7R2ZUM4WIlcxUvO8tn0DMdEyOFYL06utb79mksQcLvqE5sKaC+pQr+Sr5aClKgZTFEz7s5NyerYGSk+SX3au7oSDdZLo+ObcYJoUoa3NBl99oF8ULWbFS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758813470; c=relaxed/simple;
	bh=Wwzw9xMv2o/Ts1NeW/7xbttNmsv5LpsRAHX++eZT1Ro=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=q3lGccM044jYiHdIWnNrlA0JcG3MJfh8YF9TC25WxaIvqhUfWl21mY6dZwovCd71BWXQ7TsmirgCCpC71UAFQvsKxsGC1I+tuHhhr4jWfa8QsyS91ylc0fEPTOAlE2yvXZmks5hbTmUeVIQwxtQ0qQQLqXK0XzsxBp0Y02O3If4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MnSD6ykh; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MnSD6ykh"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-57933d3e498so1186792e87.3
        for <linux-staging@lists.linux.dev>; Thu, 25 Sep 2025 08:17:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758813465; x=1759418265; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qYprJOOZGbDqCKik+QwJZFKS+miOCWjcfIzmeC4Md1A=;
        b=MnSD6ykhyWA5Ig67/1NTIT2Z5FVCou0+gQtii61mtsOvGOU5zU/0BywODWMAMaP10B
         FBd/nlikSGJmcch0ahpwGrK4RX6rnEBwVhTTBypcoegyCjueKy/hFQVODKcZYQGR4pqG
         uzJL9+Cj5PMFM58sBSj6jtTawbS37gmo3kh6TgAa/p0LQWqZQkQQ1+SGNj3tbWY86/Y7
         HD4MoGHr+kkQX0YK1Bcpku11p+k7jD+maQ5SO+UPGILc8z+T+NHppzdCBnG4cgSaR8Up
         528vJmmMillWNjqE+KrNZG5ukUVX5KolSnoQ9H2I5HYpzb2pUl4E8gzPQXui5/JA9WWH
         gTWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758813465; x=1759418265;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qYprJOOZGbDqCKik+QwJZFKS+miOCWjcfIzmeC4Md1A=;
        b=rAOODJCs/lnt1dsGpzJJMm65T/JJN20lmzPlEEBZVUTcvtgSRvE4cixq5uzcYjPVPH
         EzJFltBPO0rXjw6C05Kdx7sqDOlRl52X18W9GxPEnsDAXU433wwLdt7KGDrqOMgQL+oS
         ZAlwuiZC2t9kpxytcNreeGVWXJfG+Td+TU9EOTmuPOIgupPLuDjkBCzkoQpqw9nsVZfY
         1gZ6t5jsCt/l/mpRy25QG1bYv6fuijWxSe0f0gBERrA9/9fqAUDk2lBShpM9PKqUFUS2
         +JVhrX48MIb4hkhfxjC7wjVuuXqE6xDUT+C0kKKoRHl9ppOnohXiTBwhT4cFuOfPY6RH
         4B0Q==
X-Forwarded-Encrypted: i=1; AJvYcCXWSrSfSuj1B5EKDFDfi3KR3QcQxKPsdvh3smZNILb6kKjZheBgwP9UDb3wy46eOfkAj/Xrq5XqiecZpLZD@lists.linux.dev
X-Gm-Message-State: AOJu0YxB3gHWll3/ql1kPr+qYAy0pFQ5t/Jev6Dke5+r9SFg5G2JZG8P
	LjjD/d32ACqr7nodojBPDJArelXaaLrcNbwJdS4GrYCXW7erUZIfAXqe
X-Gm-Gg: ASbGncuoEuJaCtP7Lv7H7i8UYprgOcrqosmqpe8gssa2w03oYmzpFgZSYs7H4o2TwyF
	E4+lrH1XsElgftkTOUOdpCdr7ktT5TJr+hTPu0ItrHJlCK1s7yd/vhLwh7nay027gEuKiRPH6LU
	n0oDXQWTjOny+8hW+iwGBUit6/04hUe7VKHtcpMxKHkF7kDaxXiB2Uui1HfjzaaYp/DWkhyIeF6
	KChWUvpajunAO5y3juCB7Ze1wRGc/nhIeAi+wZ9YaUqVSh4AXRJJJk54S26Iad3LwhWkr1wsDq1
	s4fovQJlfgqOczuWh8BwaxUx1TfCAcwa24eeFTVXWobeQ+Ag307L5rNyDZL/7aMBykL+PZn1drh
	WKqLGIM7hXaXOPg==
X-Google-Smtp-Source: AGHT+IEeprLHz/3/8zyQFjT14w4jQMsLq/gaJLv/R+aBxEGgOU1QbgcmMLTTspONZDVL3CUfJjhHWA==
X-Received: by 2002:a05:6512:3b20:b0:57a:8738:4d80 with SMTP id 2adb3069b0e04-582d0c2a62fmr1003402e87.21.1758813464668;
        Thu, 25 Sep 2025 08:17:44 -0700 (PDT)
Received: from xeon.. ([188.163.112.70])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58313430496sm870084e87.27.2025.09.25.08.17.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 08:17:44 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Prashant Gaikwad <pgaikwad@nvidia.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	=?UTF-8?q?Jonas=20Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>,
	Dmitry Osipenko <digetx@gmail.com>,
	Charan Pedumuru <charan.pedumuru@gmail.com>,
	Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>,
	Aaron Kling <webgeek1234@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v3 19/22] staging: media: tegra-video: tegra20: adjust luma buffer stride
Date: Thu, 25 Sep 2025 18:16:45 +0300
Message-ID: <20250925151648.79510-20-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250925151648.79510-1-clamor95@gmail.com>
References: <20250925151648.79510-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Luma buffer stride is calculated by multiplying height in pixels of image
by bytes per line. Adjust that value accordingly.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 drivers/staging/media/tegra-video/tegra20.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/tegra-video/tegra20.c b/drivers/staging/media/tegra-video/tegra20.c
index fba90cafb9be..8c9655ffa886 100644
--- a/drivers/staging/media/tegra-video/tegra20.c
+++ b/drivers/staging/media/tegra-video/tegra20.c
@@ -498,7 +498,7 @@ static void tegra20_camera_capture_setup(struct tegra_vi_channel *chan)
 	u32 data_type = chan->fmtinfo->img_dt;
 	int width  = chan->format.width;
 	int height = chan->format.height;
-	int stride_l = chan->format.bytesperline;
+	int stride_l = chan->format.bytesperline * height;
 	int stride_c = (output_fourcc == V4L2_PIX_FMT_YUV420 ||
 			output_fourcc == V4L2_PIX_FMT_YVU420) ? 1 : 0;
 	enum tegra_vi_out output_channel = (data_type == TEGRA_IMAGE_DT_RAW8 ||
-- 
2.48.1

