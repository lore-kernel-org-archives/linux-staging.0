Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 551C830DD2F
	for <linux-staging@lists.linux.dev>; Sun, 17 May 2026 06:06:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778997978; cv=none; b=p3wy9t8kBObD7bm5GMVmhugyxJ1WRgw4c9rg1gs+rLn+syGO5IRdbxHkTzJNcUpdTPv5DV9JCPs4xSgcDjx7MElRdd41HjFW/Da5tK/95XbluYAibH53/thG+u7YhmtZLw+Qd3YDUcimDkr8kPFpwTVL4cSrnkdoNkzgx0zWG6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778997978; c=relaxed/simple;
	bh=WURkIoNSx7cpBfeNmDjEHI4iCOu0FPGWs5wvUfkxOAo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=iauJKT/6S03KB9QJ+UTgS2AQzFl+pPlDTYDaHq7xkmC6TxLjHH9DsATa6ciVaAKB5bfrX4yIX8uyBMM88Nsa5l/ZkOqGdymRoLB6GeJvlH1coE7jCDDC2tUU3E5+z5M8iq74ojHr/lqwv/h0/OZhkVL91/ZXZkrv0vzdFLA6L0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lXBpJOGw; arc=none smtp.client-ip=209.85.210.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lXBpJOGw"
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-7dcc9b506d9so1282863a34.1
        for <linux-staging@lists.linux.dev>; Sat, 16 May 2026 23:06:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778997976; x=1779602776; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6gmKXteedUEtXr055uhX+38a7zvo9Ud/r154o82WzWM=;
        b=lXBpJOGwNXFBrv26jIstKMEEUMVC2X/XxDOyb7QVwzd3cp75f4f7bnnJOoPBtDHz08
         pHkHMHgIGuPqd9xUsbxvnB3aQBbZYVbE5KBK8NhxYmjJEiu6g2h+juzLAb6CPMfJIJfH
         /g2ruzv+DxQuzkMxyvTIWhVfaseFEqND/kgzhbGjzEbOW2ZH2V9sroZtspE1slXXICdB
         5riXuyzXznWtsj9imJZCL6qJDiLtydXtVfMbZwGDFUvlsrSX8py93Vg5VrOwNebaR7O4
         WMzchkm4losAZ/nqCwIPUOEntFUlghtL60h3K9g1R7uMyIwd6k0XttCABt6Y9DY8F1pM
         7+JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778997976; x=1779602776;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6gmKXteedUEtXr055uhX+38a7zvo9Ud/r154o82WzWM=;
        b=BYyUDyIPnb1CszYRMZddVESnT+E4CkmGL6+Cba7+SmnjB4MP09LW3qTxnqMm0yzSC7
         j/kdsHCby0ynWgKCc1VoGEbN8n91IYpRUogCdXCc/9hCipkuLcwCfToSZ/qRl7wc6MHX
         nW5MY2YfgcezgMZi/1UGHcpzMf+He4fpiVBXzl7cN38mh5fsdt1vvbdoYY6hFxIMAppt
         BmEB5EbNTJ4lQeLqLBSgxhrTK0QL8eub4bwARAgp0ezedRGsToC0cS3kWsZJKYMt6Zpc
         FvgVe82Ptrsr9Y4+4uIZFK2waRVeOoFLM7/Li5E/eE6l7OZDhsL6LozbqP91TLKonsv+
         cckg==
X-Forwarded-Encrypted: i=1; AFNElJ9DeyT09KK1dfmn8uuBRK99jH2w/Y+tBx1Cb6j4csBgJU7IQk6kGsE65W14I9hM5zLuYdUSmy03Lcg6Vapn@lists.linux.dev
X-Gm-Message-State: AOJu0YwZ8hF4zjk4Y/Zug2R0mZXuBuZYGznzV1gz7MiNiLNCRh55X8hm
	GcJxPNJPRr6QjyLQ0COoJuWol1b7VO/PH2iLw6AKupd60ZzSuLjXEHeY
X-Gm-Gg: Acq92OH8GD/CLNJlHRPrJ42+lVPjIkFlcbZTWT04bB6XfN6JV4E1E5pRm0hesTGiT5D
	RKp6rNEgtmNSAEkFhF2DBPgJPyzwg/xUNdezCUbhIq1I8JX7a13rnk/6d1D9WjmBg35LSD+jTRp
	kXHFPySG39UV7ouquNkUrwW02JD7Y8BEauiPHh02en+C8SVAg+T9Kpo9Lq4DFJlR5QZhZt+JcKI
	xnDINxUT0Il2mmbrakprP/C4S2mCTZXOnr9/3mbx7RgnvjpelmAhLW55hKhIDaGRqxoDKSJpu6p
	hrTKjbiHS0ck0QpXBqTIGd70yqr6DW8rYdRWWUCYfz8QK0eWwJWnEPEwgeaTo+wsdv4zUpWifoG
	+CBICMo4105m3+vZmJKpDo7x8z/yX+fdOMQ63f4f9141Cpc5/Clb7KMRVlwz32Fgg6P9ZXx0TIu
	OH5xl82lGK1LFn+vpylxH0tYfRV9l1WUd7nz9gqjkLn2lVHsP2xXAN
X-Received: by 2002:a05:6830:d01:b0:7d7:ed69:81b2 with SMTP id 46e09a7af769-7e4ea071959mr7144526a34.5.1778997976305;
        Sat, 16 May 2026 23:06:16 -0700 (PDT)
Received: from pop-os.. ([2806:264:548c:885a:a314:9972:40f1:1f4d])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7e55b7cd6c0sm5550998a34.4.2026.05.16.23.06.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 May 2026 23:06:15 -0700 (PDT)
From: =?UTF-8?q?Diego=20Fernando=20Mancera=20G=C3=B3mez?= <diegomancera.dev@gmail.com>
To: thierry.reding@kernel.org,
	jonathanh@nvidia.com,
	skomatineni@nvidia.com,
	luca.ceresoli@bootlin.com,
	gregkh@linuxfoundation.org
Cc: mchehab@kernel.org,
	linux-media@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-staging@lists.linux.dev,
	=?UTF-8?q?Diego=20Fernando=20Mancera=20G=C3=B3mez?= <diegomancera.dev@gmail.com>
Subject: [PATCH] staging: media: tegra-video: prefer using the BIT macro
Date: Sun, 17 May 2026 00:05:11 -0600
Message-ID: <20260517060511.231437-1-diegomancera.dev@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Replace open-coded bit shifts (1 << 28) with the standard kernel BIT
macro. This improves code uniformity, matches style guidelines, and
prevents accidental signed overflow issues.

Signed-off-by: Diego Fernando Mancera Gómez <diegomancera.dev@gmail.com>
---
 drivers/staging/media/tegra-video/tegra20.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/tegra-video/tegra20.c b/drivers/staging/media/tegra-video/tegra20.c
index e513e6ccb..08fa234af 100644
--- a/drivers/staging/media/tegra-video/tegra20.c
+++ b/drivers/staging/media/tegra-video/tegra20.c
@@ -177,7 +177,7 @@ enum tegra_vi_out {
 #define       CSI_SKIP_PACKET_THRESHOLD(n)		(((n) & 0xff) << 16)
 #define TEGRA_CSI_PIXEL_STREAM_CONTROL0(n)		(0x0018 + (n) * 0x2c)
 #define       CSI_PP_PAD_FRAME_PAD0S			(0 << 28)
-#define       CSI_PP_PAD_FRAME_PAD1S			(1 << 28)
+#define       CSI_PP_PAD_FRAME_PAD1S			BIT(28)
 #define       CSI_PP_PAD_FRAME_NOPAD			(2 << 28)
 #define       CSI_PP_HEADER_EC_ENABLE			BIT(27)
 #define       CSI_PP_PAD_SHORT_LINE_PAD0S		(0 << 24)
-- 
2.43.0

