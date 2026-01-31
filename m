Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 367712AF1B
	for <linux-staging@lists.linux.dev>; Sat, 31 Jan 2026 07:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769845127; cv=none; b=WtsfsIS8AygyIzu/lYXmSNkCTOeg05DfHFNbXsmoxtzc/OFMFTvIcVrkrKKBOHbJWdozTrJx7U+vYmTnhobSnGZXwbElX7XsDvdGcHrUWHXLWtSTtecn8vylkaHGteYHjwBwrS6dHrrcIvod2ziizhWqxt1sP04cHNOQQhGa3Gc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769845127; c=relaxed/simple;
	bh=ZbhXHQm/EzqbuYxAdcS4R9f0ohVNZh1Ch4KsMRDzubU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=pcKD9cnSfMQ+vgztIgvWPkQ4aX6yUjHskbGtywWRVQaObGMFqFaJY48+hGC1YV+JxQTqQGn4k4xJ5QVxd9mZxCs4fgPFzdN65pUo7TgmbtLLWbaappVY0ae5MTGqDGqGAQAq4RvYU8sPFjKoxEzNaAcck8K8PAM6oWbgy3QEHBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BUB4s0Mk; arc=none smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BUB4s0Mk"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-2b4520f6b32so5617285eec.0
        for <linux-staging@lists.linux.dev>; Fri, 30 Jan 2026 23:38:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769845125; x=1770449925; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7bKH5RTNHbe2elnMdDorbjBvqqH+0u5ncD0iPbRs7u8=;
        b=BUB4s0MkD8hA/n2KRy8/C9IpvctEvLfcFqHdS1SXkrEcUQeu8IrhZN+FDV84h4vMsV
         G5Ux0UAfhffmNnp3V0ULcwBQ+8TZ1+8hGTrDAhrC/mbDN18znjtTY8ToE9aUARBOwJ48
         hcIfDsdbk15QqYwBf7Y33cHWNoJ/ezg+IFhDuswUT5KbJl+PEpU3+q7MsFNnfIN56Yk0
         woa4DhWkL6n5RB3OJkMrYaY+OMhWzUa6Vv7JsGrikdXApRLKY4B3TRgiKuh0nye2ibDJ
         3u249zYNP2jajmyy08vNBJQcIlkq3Khv5RlapbLfpEr0ABjqnwaEF6eyK9KusKhfZe6P
         ge1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769845125; x=1770449925;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7bKH5RTNHbe2elnMdDorbjBvqqH+0u5ncD0iPbRs7u8=;
        b=hKD9YI8mQz46bAkrJIlBvtmTthZB050G3NysCrYlqqfPMsrY2iQ3dXW76mHbYVGMX9
         6/xoNHsO3OUUNv2iB67cyqFxg/I471CGIwR95wUs8ZFZJ2BC7/0HXC/2comJ06Sy0eu+
         hJE5xDW0qidbPMrxbaNfbz2EXWvOxbt/e7QQbQQePrhr09fBJ9je+Ndi8YmZlwXMnTIT
         05aJy8YBvOesyM63RO2+m6oyXtgzPXnR5nup++U9Qy+1zvl5OsJF8D+2yL+eoGDplpnA
         C2NrkZSUTJA0LSJbNB0UWAwBJ1M5xPhvZJLHoCWLNOIEURf88f3iGGLuZY4xzr9CJBu4
         Am7g==
X-Forwarded-Encrypted: i=1; AJvYcCVBoJfZmdWGQqc43JJoQaU/fdAJG9gysANqrL/7eFeqVVnpcwRcHs5W5QX0BBMxsIJfsgTsqBB5C2j3MTtj@lists.linux.dev
X-Gm-Message-State: AOJu0YxLnPqnKkGda1t/Jcsn9tlpFTzqIIWPzKGNcbknxmrdky56zUqg
	Yeg/H1XwSDTxRRkhjgnJjemTlHhK2asOgR+8JjD6DFbrRVfp1hwSRKg0
X-Gm-Gg: AZuq6aLDBTxKhzvDC9t5aCXNDy5vq8/dv5fn4GHlTjv5CVjbPGZBT9/hAopcTmbv4KB
	9sWlWZHiaOLeLKY1u9WtG52fUh1uWskisVAEXsm6uW9lXOnelgGMi/J5WQ0GzwvtXKifvdh81Yj
	OR4rpG0YrYvgik4TWWyS9mZesRa3A9rkw1Kee6zw2Mkdr+PpH3tJOTmxc2pxdE8o6nwjkjpgUkw
	h2t9GGPS4v9RXo9p3WT+mvKM+gg5+g/U4542IdG1Xup5sNQVs5GJu25vIjWCzujpGh+H16gu5qi
	oW/Wt+Cvqtc/RsL5lyAQ8f91GdbneuL5mRVVZyTZ4Gy50XPKCfO6wX65KnDFnoC23R3EGrgPUeq
	yq4mD4Btn47miGQEGzL1qPvT4vPi7nC4iOn9bpqjyP+ZfvzXDxSDOVaI73L//5MfF1x+T88ZChu
	Yiu0NjrcJrClJ8s9q6dR6e10Rfwg==
X-Received: by 2002:a05:7300:a146:b0:2ae:55f2:ad57 with SMTP id 5a478bee46e88-2b7c88f831dmr2350600eec.29.1769845125234;
        Fri, 30 Jan 2026 23:38:45 -0800 (PST)
Received: from [192.168.0.61] ([76.174.137.141])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b7a16cf8d6sm14337027eec.3.2026.01.30.23.38.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jan 2026 23:38:44 -0800 (PST)
From: Michael Harris <michaelharriscode@gmail.com>
Subject: [PATCH 0/2] correct macro issues
Date: Fri, 30 Jan 2026 23:38:26 -0800
Message-Id: <20260130-adt7316-correct-macros-v1-0-8a71df1e42f1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHKxfWkC/4WNwQ6CMBBEf4Xs2TVd0EI8abx49ODNcFhKgU0sN
 S0hGsK/2/ADHt9M5s0C0QaxEU7ZAsHOEsWPCWiXgRl47C1KmxhylWtFhUJup7IgjcaHYM2Ejk3
 wERtdKWoObKkhSON3sJ18NvET7pfH9QZ1igeJkw/f7W6mrfxnngkVHll3reKKS83n3rG89sY7q
 Nd1/QHhU536wwAAAA==
X-Change-ID: 20260130-adt7316-correct-macros-b6801b4ae1b1
To: Lars-Peter Clausen <lars@metafoo.de>, 
 Michael Hennerich <Michael.Hennerich@analog.com>, 
 Jonathan Cameron <jic23@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, linux-iio@vger.kernel.org, 
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Michael Harris <michaelharriscode@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769845124; l=753;
 i=michaelharriscode@gmail.com; s=20260130; h=from:subject:message-id;
 bh=ZbhXHQm/EzqbuYxAdcS4R9f0ohVNZh1Ch4KsMRDzubU=;
 b=1ZK+NMjCNy+HOiiw1I7h7XZj4G8DK8U6+KhILK4WKv+AgNKwocCj3Fpm/+upYA73vp5O4O1DC
 uPf6uxtsu0NAK4HMwSiosfi4Bs5rLkAUrpAYDBGn6ELb0xqvU+WfpyD
X-Developer-Key: i=michaelharriscode@gmail.com; a=ed25519;
 pk=td/zQD3XANAhdG3Kf3mSetXiynk1Ql0eM4s0+eks5DU=

This series corrects the following issues found in the macro definitions:
- Magic numbers which correspond to bits or masks, but aren't using
  BIT() or GENMASK()
- Macros that aren't in use anywhere in the driver

Signed-off-by: Michael Harris <michaelharriscode@gmail.com>
---
Michael Harris (2):
      staging: iio: adt7316: remove unused macros
      staging: iio: adt7316: convert magic numbers to BIT() and GENMASK()

 drivers/staging/iio/addac/adt7316.c | 91 ++++++++++++++++---------------------
 1 file changed, 40 insertions(+), 51 deletions(-)
---
base-commit: 5d2905f2c6acdd1c553f9b022dee730ab2cced71
change-id: 20260130-adt7316-correct-macros-b6801b4ae1b1

Best regards,
-- 
Michael Harris <michaelharriscode@gmail.com>

