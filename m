Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E289A1ACECB;
	Thu, 17 Apr 2025 13:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744898229; cv=none; b=TniDl3Sw0uqqVyPz3IGbURjB6bQtHLbg/nq8bWHEzgzxyatkcA220mg/6clH2XqTT7Tf4ynxpoClwgUOcKAgDzM704XkiqOPbUcMSaL4XiNfnADBCYjhd5zvcQTvCTM6K/tTkcG1i0igU4KT7Hzxu9/NG7lBwGQQUbLDyWcdxLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744898229; c=relaxed/simple;
	bh=G7cQA1vbU7ME82rND+ta8qnI8kBAvliO793si5bKvhw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nMyZieCCK0nyuwiWdRIAqb7DDelmN8elvYaY1VyXqafVucVTYY332/UoYpyVDLg7cZ17Lbjpzkj4PO1h1sCOMhdXUkOYYlMdDva1IH25fdWYIRVc+Z74odyRY6EJVQgilGB+T0nOwBHxMzF8YdFAUPUCzkUf6OOT65RBLbP9FP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JX6JOEcS; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JX6JOEcS"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-47690a4ec97so8068111cf.2;
        Thu, 17 Apr 2025 06:57:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744898227; x=1745503027; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YwMHB2nUwzNcRVsw3OgexWqiEt8JRdlA5caQ8STPGxo=;
        b=JX6JOEcSQVp/B+gO2S6h7q6gJyuJX49U/H4TJkDpWGMgSkcKXBqoleYzlv8Kgi/VZr
         uZIDOwhfo7V67K7ei+0hznHGij/ab7ypcgyUxUSzJCPzva6ogLwg+fgathh8UdiWvY/H
         PaxqxD1s17oUBaSo395M0cJNasy/4PYvJ2i5agRmR9I6oPTrgSmALM0crLoPPq11oD9Y
         7fWL6E8EjY+EFrhQYUv7lkRhlXjxQiDw9JIdO0RQPGcj+/10cUN3CWI4t9X38hi+uASg
         O3SBtRhMRlu9PeYObh9KcJ6a3WAeCvfrOhsl3wq3yLplelMrKvwg7GMkUrP50DvRN9Du
         stQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744898227; x=1745503027;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YwMHB2nUwzNcRVsw3OgexWqiEt8JRdlA5caQ8STPGxo=;
        b=MIZHUujn8yJeFKit6J6e5BBejJbu8HMqE02b2bCkit1lcatifbBhjp7JQCqycbcnnw
         VKfoD0Kba/ms2+M9qP00Y6fU4ey0UGEhzqazRTQlZbLl8pCsWKyMOaIJi4rxFFcuMuaI
         vP+YqoZ8L/J47haLR1McvApY3wJ3uKgI8NYCuIFHh3UBsZr/dNQzPl0Bbw+Rdg3rqdyO
         1S3duUqatSrVyrKDx0pb+p732XfqbHlJnK1x1YTOps44HvbTQLZ47PZiqVmxkXNKCa37
         VtGGFSbV6W+X0n3DQKHlh6VO1JzoX7YmMb+afZEJ4M8y9+q+yP1ivr06XzxyfWwq66m8
         Ustw==
X-Forwarded-Encrypted: i=1; AJvYcCU2FGlHcnsybxd270wKyFpyLazVWMPUfET8Q1WZRk06v2lO/hLwTQuIQGCbeUXt2ZOHh+ucyiALZbaUn/zHUSSKlp6WXQ==@lists.linux.dev, AJvYcCX/oV9T3uH9VRfCdSdsXDlr7BIW8FPrKwp4rQQqBK3/11ZwvsizaQk1YcPvFn6+oT/ZsGNR+DNN9AJtn8Moww==@lists.linux.dev
X-Gm-Message-State: AOJu0YxpPbiVD+rXZdyoAgccy1JeFtnNwK1WOhkasSqEZ3COvyIJJbGa
	UI+V8fZvGqKIPa6U4TF7OU8meXBR4lp+4w2IUkTX43O1+aY9egIY
X-Gm-Gg: ASbGncvSV1cDS+Opg0fVmktVIQmZU6UfuuvS8etMuji4B1SDuWGo/vy8DiXOq08MbEq
	SjHVLJbi92qf6bk4nLmquOa4+pBE3e1VS/tRgHoFjPL89HIm/h7r76kn6hKGMIMR+oWUZRTiO6b
	M0GQh3x/mdNQnZanUyyk5R+tTsgUTDo6VYzmUBgRe/RwgygaMbNxBbUjKf98EdwdOahtcmsFa3M
	oUOABh7Uh3/IRPyEtLSfrj/Mv0qcTiEiwYT0gvg/iatRAfyR636Lr9LLccdc4Tz3KSJ24ShJl/u
	VGg4cg3nng5r5PHQDD1JyZiIIFIwD9lnduLA5HfNAD0WOR3i0gMd+N0=
X-Google-Smtp-Source: AGHT+IFpHKVkjhlZ2LiXbe/zb9N60JY4GEaQaJZQLQFFebUwv++hYDlp9uFWUHivYUzVd+h22h7CHQ==
X-Received: by 2002:a05:622a:134f:b0:471:cdae:ac44 with SMTP id d75a77b69052e-47ad816958emr97415331cf.47.1744898226511;
        Thu, 17 Apr 2025 06:57:06 -0700 (PDT)
Received: from theriatric.mshome.net ([73.123.232.110])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4796eb2b8dbsm123152491cf.41.2025.04.17.06.57.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 06:57:06 -0700 (PDT)
From: Gabriel Shahrouzi <gshahrouzi@gmail.com>
To: gregkh@linuxfoundation.org,
	jic23@kernel.org,
	lars@metafoo.de,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Michael.Hennerich@analog.com
Cc: gshahrouzi@gmail.com,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	stable@vger.kernel.org
Subject: [PATCH] iio: frequency: Use SLEEP bit instead of RESET to disable output
Date: Thu, 17 Apr 2025 09:54:34 -0400
Message-ID: <20250417135434.568007-1-gshahrouzi@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

According to the AD9832 datasheet (Table 10, D12 description), setting
the RESET bit forces the phase accumulator to zero, which corresponds to
a full-scale DC output, rather than disabling the output signal.

The correct way to disable the output and enter a low-power state is to
set the AD9832_SLEEP bit (Table 10, D13 description), which powers down
the internal DAC current sources and disables internal clocks.

Fixes: ea707584bac1 ("Staging: IIO: DDS: AD9832 / AD9835 driver")
Cc: stable@vger.kernel.org
Signed-off-by: Gabriel Shahrouzi <gshahrouzi@gmail.com>
---
 drivers/staging/iio/frequency/ad9832.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/iio/frequency/ad9832.c b/drivers/staging/iio/frequency/ad9832.c
index db42810c7664b..0872ff4ec4896 100644
--- a/drivers/staging/iio/frequency/ad9832.c
+++ b/drivers/staging/iio/frequency/ad9832.c
@@ -232,7 +232,7 @@ static ssize_t ad9832_write(struct device *dev, struct device_attribute *attr,
 			st->ctrl_src &= ~(AD9832_RESET | AD9832_SLEEP |
 					AD9832_CLR);
 		else
-			st->ctrl_src |= AD9832_RESET;
+			st->ctrl_src |= AD9832_SLEEP;
 
 		st->data = cpu_to_be16((AD9832_CMD_SLEEPRESCLR << CMD_SHIFT) |
 					st->ctrl_src);
-- 
2.43.0
