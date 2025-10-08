Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7091F2E7F39
	for <linux-staging@lists.linux.dev>; Wed,  8 Oct 2025 07:31:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759908714; cv=none; b=N6QfgvgRFWjuJsWSAFB4/Xv87KrjbwA87JzUnFvCgEJhlTfhCZej981FfyUfWhQ8Y+4peRVPu0Ui/HMqBYJDhdxPqqs+Xob9i5DnVpQ9MT/+kLJJU6YSwvEdwK/mMy079L/ioLruJLu6o0vEh/x+TXRD+HB1opDkttJ3p6aSFK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759908714; c=relaxed/simple;
	bh=DQG+inBx8ZXDHcXJybTvBi9O4BMU38YbAkGRkU7JaQ0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZsbxfAmZQv2FCQibz7E6WqzfwD0jmq2yVeRHVLVNooUv/ugLdxUnNC5OYHL0RfHRShC7dbSKAS4UsaC9M3V9V4NGHx1wdwHrpRwGavnHcpKUR5AOJSumWtvR30sCiXBgo3qQNsnD1jF6cDqLZZX3ZrG7d0RUuTL4cL3JLsIZtb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bp5y4Nkq; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bp5y4Nkq"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-57a292a3a4bso2398850e87.3
        for <linux-staging@lists.linux.dev>; Wed, 08 Oct 2025 00:31:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759908709; x=1760513509; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UNRJG9b/INfi23des3nzlgfKaLYdiUShg0Bsn9STYF0=;
        b=Bp5y4NkqRrnWhEBQ4/ODory+rqxFlUzTDqMRag/s0TFdgD99vPhCN4pVTMpILuOYpK
         81kAI7z2pxuLHTAyHliCss3wPrlGQisPRxHHY78iKmMq1XT9XKvs14pxLmJyepUEugTV
         bzSx/hBiJIJFUD2Nsdc8AD3NNNIO6IN0CVuZIe7Wqxvo9xz5n3zbIql8zxfp8Mwzdf+T
         ZA3hsVpmSoxL5oqydm0bdWlTEaTCr5hIfz90MsuH43wFtCJbNW2C6gCdaBxqavVtp7ga
         K/iDJEXXhwxsA1THsP2erXmrWQwPp97Nm5JB+YQf/8pcPeW8TEUjOx1+FsFHCCJhMAzZ
         LFWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759908709; x=1760513509;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UNRJG9b/INfi23des3nzlgfKaLYdiUShg0Bsn9STYF0=;
        b=QlUEF8sgJ6qExGfD7WBhUBZW74EN4G4b7R+SR37qRD+dnSRgc/6qZQNNKoGA34hxJo
         rVbnwUtLCz58NUXeO3DCv/IeHwyvrGPG5l9ZkG46cQZ0ID9P20us7d4X6wT8cdROWAHI
         2ux4yRelxHhn3mSd5LKjmYKpIiAW4fpdcYqZdw/eOY0dtGf/SXops0iQHyWBJmi/sRxO
         GohlB++GPhyDdGZ+Dyq4HJdri46pdXy/9JFl23+36k5vldRD7+2yF6QFVCyBIPAefv4V
         0vw2qk+wl0XFcXhXQ6Zwp3WbJn+cZW9Y/jBzYfrfKRV1m5fniLh7UIppPmyMohsR9XH2
         Zvcg==
X-Forwarded-Encrypted: i=1; AJvYcCVmlwmY3t6E4DkN+e46KkXUbljwYPqSsY9A3X9M2Oo/SpLRGZulqOzKkAGyuVA3WoSKK2KO9oIIZHkC0IAP@lists.linux.dev
X-Gm-Message-State: AOJu0YxwOXwy60NR+McuQAIzfKce8TL+fSr036ALE6ckUNMiCMRBrgM3
	fOi3HpGmT3h6CwBVkLx1BQzY6ZI9bcRd9Yb3odf5g4XFGR3Ony39ID8y
X-Gm-Gg: ASbGnct5b8TLbPycdGNhAVDgZY6N57De+nYqF5NKDI+2aCFzXCZy0rkyBwgcRIb9GrF
	2GAowWtyCpZNBRJ1TJyJ9Fe/3cnt0Dm4/R7QHBANinJ7WrSxDPmv7KIKUNoKbgK0CnTdeal+OJa
	AKqjsKjkB3HxafgN0ly4JJANVgeLMMlebNdBDa4e3nPAByRh7LWoSCSwlBfbGhV2L0iaWDQQQID
	gR0nsdaKGziGEyFTJUDV7DXB0Nh5kOkcWZm/PtMRU1eqryWEKbwAFijI8p1YY23X1wDjc19TXru
	q/wasc6GYfn1eS5JMOrjEvHDlaDW+Plw5a9WhHGXpQtvPMWby7UsVgMbgmn5zWfDp4XSXu6mCDQ
	GcONUNE6h8Abh74D+BBR7HDi0+N7iihuMeKzkfQ==
X-Google-Smtp-Source: AGHT+IF61Uf+7jyVQLbDjguFkflG7qNGvFKGa9VJbcmzM10P4AOV0pJo6kc07mp87QYBfIqV8TPf7A==
X-Received: by 2002:a05:6512:2247:b0:55f:4107:ac46 with SMTP id 2adb3069b0e04-5906d8a084amr687325e87.25.1759908708862;
        Wed, 08 Oct 2025 00:31:48 -0700 (PDT)
Received: from xeon.. ([188.163.112.70])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58b0118d22bsm6911016e87.85.2025.10.08.00.31.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 00:31:48 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
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
Subject: [PATCH v4 21/24] staging: media: tegra-video: tegra20: adjust luma buffer stride
Date: Wed,  8 Oct 2025 10:30:43 +0300
Message-ID: <20251008073046.23231-22-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251008073046.23231-1-clamor95@gmail.com>
References: <20251008073046.23231-1-clamor95@gmail.com>
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
index 0457209b789a..626f34543853 100644
--- a/drivers/staging/media/tegra-video/tegra20.c
+++ b/drivers/staging/media/tegra-video/tegra20.c
@@ -504,7 +504,7 @@ static void tegra20_camera_capture_setup(struct tegra_vi_channel *chan)
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

