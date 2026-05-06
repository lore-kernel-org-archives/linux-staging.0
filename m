Received: from mail-dy1-f193.google.com (mail-dy1-f193.google.com [74.125.82.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7A2A3E0C47
	for <linux-staging@lists.linux.dev>; Wed,  6 May 2026 07:58:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778054286; cv=none; b=CLBChvpGd5r3xeAU0r8aUGkb0o3TgS7WM+An8oh7egdzfHh8BsMBG+NYPdz+ZRnbt8RoCCdysbptCfj6012SpAwvGf9qy/H5C3awj9KKJBIH/S2KHCoL3Tu0tKjtOt9sn0WENTkZ60IU23LJho8lPaPpIORQDnNKcz9G6Jz2d14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778054286; c=relaxed/simple;
	bh=NxDn3Yx28HJtPbWuriUuKQ1bU4FkzVJ+n8JDBIb0o2I=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=VUabYYm8+LNODiqO1zCEY4qB5ioVMV4lTki4PpnnkIoXIeLub1xcvKPVyDrPAHolAJ55JG8WFXpA4H2xLPvNhFqsTH0/4ljL/h0PE0GcrTZDBXBPaXvJpEtQA72TGDSihY62i9pwkaarDQ7hdIuD9WoLgRcJE9f/RKE3NZPT/n8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NAhr1rMi; arc=none smtp.client-ip=74.125.82.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NAhr1rMi"
Received: by mail-dy1-f193.google.com with SMTP id 5a478bee46e88-2f0d3e07e30so5534778eec.0
        for <linux-staging@lists.linux.dev>; Wed, 06 May 2026 00:58:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778054284; x=1778659084; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0yP+mwFYhjefiJc9HNwtug4g60Bu6O6itewJ8verryo=;
        b=NAhr1rMiYBIAxNsO1dAXBzpYIk07xXJFPGf5127NPmoeLw3XJ0ZOEDFt3ZubmpqvSU
         p6HfM1mTk1UkOPTCVTECmtyj484CU0qOezVXyIW4CZ2nuZCz9FwQqitTrJLZYDtL7n0e
         XfsdPPrVqrImBc7bLqQQcXlH+PzeNdnEByQcl3U2M6rNzM4qIaqJMqEQbUJLoWN2HCLf
         7SQusMlDtPk0VSx9/aXHaZqZXamCa3RH8uA3WOU4fJEiiymvL5i1rsPXJF1/HdYmagC5
         WthkodMisdhWWt2zmpaUjqymq32pPtFuPQECh2W+kVzfvQzKqY3dvZMi+GKL8H0srxEc
         rFPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778054284; x=1778659084;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0yP+mwFYhjefiJc9HNwtug4g60Bu6O6itewJ8verryo=;
        b=ob6hjcdgNXBLzTECyiOU2oYTbCXDtQ+rHlvzvkmjqU37/lZ2P7F8N1D/qQdGbywGiJ
         eFX2xEaUUFl3lktuZ+gHFxM9m/Z/cHApPsEq9S9MRXGmCnZyyl5lYse1Sfvqmwel6MYh
         D5tanzByaTSBk+1KrZsFt3IKCdwpWKv7C9kzSNrcQ7hXLX8RbeVrW8++KhyI7SR4rYf0
         YZ6aygGQU9DRL7SLyR/oZ0CucrP9J5SL70eE6AEczvK+/lTSTDf+o3SmDM201KCqIOTJ
         ZqPO21iWjO+CWV+IJCpnPKBjSdUJ8pcqM46/1orBljBVpx/pu2eBfcPnUBGeeoJfpf+K
         aGHQ==
X-Forwarded-Encrypted: i=1; AFNElJ8ypYIMiV4QFl1mivkA8MG9KIlyQHTXbeRlXHAbXjltFo8CcasQDx4mbXHul7cNGnHHvh1O0uHoD4y9eHAT@lists.linux.dev
X-Gm-Message-State: AOJu0YyRU4N7Zc4yioO+9HqB/Mo/yGdUqGiAdpHukzBoyrTqdyGcs5/l
	MQEAgoYbzuqz4/JEMnSNoayRSdnpUacCEgOFzIjkyfSqdCuJ2rvo7BEo
X-Gm-Gg: AeBDieuAmxdpmjLh+XS5/BfMKTCXQAVjiF3Vmd8fWwGZSbxNJiEbBc6z17wCCrH8ZP1
	r3DqPICRdgAzhKwB6pB8sgFnjK4jiIkF8tnEWVCjHhcDXTO92imv/vJCNvvNpd+yc3cp8u++F3i
	HAECYmn6VfrKUYp+RCIXMmaQWSJUlzO8p49JD3SWS8jx0Bm78grHbi/KvRkFmN4ez9kcHQwSF0S
	at2GrYVMl00FyOxiZO2FJl++m8rUkFFTx/zHQU9avXj3NlpY0Jsin50A6ZFD+Dwe56QDaLdSo1U
	77oEIG3Yp3++H5V3Xto0SuAo33AdBWCmpnHHZWVv826UpqCERZH0HxU4B6FaxiN3fryPZ3PxjPY
	LZZTs6tyXPSIfZZ2dNNLoTLqXnBS97T2ap2H4l6pdDfPPI6uP7V+orD0aNv7phBCktguYq+u9/r
	RT4rwodIRw58us56mis/n9RukCUSwsXlGzxzm4DgJTmf+gSG8whkCju7kfG1xrhV40AQ==
X-Received: by 2002:a05:7300:4794:b0:2f2:5726:db4e with SMTP id 5a478bee46e88-2f54ac74abcmr1120763eec.18.1778054283787;
        Wed, 06 May 2026 00:58:03 -0700 (PDT)
Received: from localhost.localdomain ([76.32.119.210])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f56d4cf2fdsm2416561eec.8.2026.05.06.00.58.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 00:58:03 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: thierry.reding@kernel.org,
	jonathanh@nvidia.com,
	skomatineni@nvidia.com,
	luca.ceresoli@bootlin.com,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org
Cc: hverkuil+cisco@kernel.org,
	dan.carpenter@linaro.org,
	linux-media@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH v2 1/1] media: tegra-video: vi: fix invalid u32 return value in format lookup
Date: Wed,  6 May 2026 07:57:45 +0000
Message-Id: <20260506075745.28574-2-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260506075745.28574-1-dennylin0707@gmail.com>
References: <20260506075745.28574-1-dennylin0707@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

tegra_get_format_fourcc_by_idx() returns a u32 but uses -EINVAL to
signal an out-of-bounds index. This results in a large unsigned
value being returned, which may be interpreted as a valid fourcc.

Returning 0 is not a valid fourcc either. This condition should
never happen, so use WARN_ON_ONCE() to catch unexpected out-of-bounds
access and return a valid fallback format instead.

Suggested-by: Hans Verkuil <hverkuil+cisco@kernel.org>
Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 drivers/staging/media/tegra-video/vi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/media/tegra-video/vi.c
index f14cdc7b5211..456134a9e8cf 100644
--- a/drivers/staging/media/tegra-video/vi.c
+++ b/drivers/staging/media/tegra-video/vi.c
@@ -80,8 +80,8 @@ static int tegra_get_format_idx_by_code(struct tegra_vi *vi,
 static u32 tegra_get_format_fourcc_by_idx(struct tegra_vi *vi,
 					  unsigned int index)
 {
-	if (index >= vi->soc->nformats)
-		return -EINVAL;
+	if (WARN_ON_ONCE(index >= vi->soc->nformats))
+		return vi->soc->video_formats[0].fourcc;
 
 	return vi->soc->video_formats[index].fourcc;
 }
-- 
2.34.1

