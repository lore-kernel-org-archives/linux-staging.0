Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFA442D662F
	for <linux-staging@lists.linux.dev>; Sat, 21 Feb 2026 08:23:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771662227; cv=none; b=Q1BZfg+TOElCI8R8cyG6w1KidO5koesThw87KEtqJu/F8PMqBItZ775GmreC0CxG1bKxcJRUG36G80GMAcMMoD3H984bdeorplMYxASwZwAyYcsZh9D7WIjh5HejjtrTLEuxgiB5VO6XWmDERvOuUAqzLESRVbBhAQlnXC58ftg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771662227; c=relaxed/simple;
	bh=Pk3O5TLQPS24WNMUeZtVsrBft815a38k+sK15iAOd/Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gL5B3VX60ytWH4NquQ8OCWOFtApEI5nS77Dy/m5BLyzJOhYkH0KpRg5H6SJdhPcg/Ry3hT03FN74j00Dt6skCH5396IcfoXRMX3ACQVRs/2QJpIye/K6AL8CHSad6VSp/sL9uGEojn8LbKtzDCVIPXUWjRCAclx6sBH7IDGs8IY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gzo+etSk; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gzo+etSk"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-43595901036so161126f8f.2
        for <linux-staging@lists.linux.dev>; Sat, 21 Feb 2026 00:23:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771662224; x=1772267024; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fdVdyTushkhdKety2d3vn0Yc77EYdLr79TRs/71D65E=;
        b=gzo+etSkqH6njxeIhGnRbtwzgvpiBnpeNcFB6MlfjTI1KN8C+BjyWDC+JGp4J7kbhT
         DF0TMrvgPbhSOfWIUzIXAJy+od8qbXTEtGh140uRNXCBzKi70VbIJOsclJOny2rzq9FL
         N6eBtiqV+9vYDaq4jlYAzA2/Zw9FQn+b2sve8bEv0V99kTJH5jCWaBA8Ax3jjn9F5Xu5
         w35vnuppvadaMPPE51+bYCG6phRgqui9qOWVACUgPNJzEm1CxfNdZNukthd+/cpOSJQz
         DGRKVQY1iTBQ0Ld30VgkBq7YEsEkis23dytP5IPGIKVPkbhE4Yy5b5BZlM0QmFF0JGuW
         AjVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771662224; x=1772267024;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fdVdyTushkhdKety2d3vn0Yc77EYdLr79TRs/71D65E=;
        b=FWk4bSr+9oStX9Offse+mx0Uoj+d6vWqkAZjB4L9zFxWoab+v1ZnUddfrupubrn8t1
         7xsBzjSxGUHzAi2mt7fLkwnmbUx0zwyR5PQvsV6ENPnHl5ytVkZh02uPuEXWM89h4s1j
         mG0aozSxbSZPAQudMJrputSa9FKtBF+cAgQzjNK/sbfLQ4lqBSVqfa2RB+qzs0A/4WfD
         h0Kasq0dXW2YTJMF545SvnXg06UxCTIGIyjD0+BjMo7L2/KnmNy6P0S6qMdC6ASknV2C
         rGRxy1j7ZHw8i3QPJtyjI+eyN0DRF1eTXNtCt6VEwSHeUPqtfMAczOOZOApl4Uvxz+fM
         DEkw==
X-Forwarded-Encrypted: i=1; AJvYcCUYIxJFzjr1UfQkRGzMXrLTUqbSiJpM1Bji89WgZHwuq+KfudwvevojPCfIImz0Bg5cN5jaumXUi+Rni3tP@lists.linux.dev
X-Gm-Message-State: AOJu0Yzqpq+hOa5Bh+D9Le8OGejFkYjN0RLVxv+s5ooYXgoLyqk3jAu1
	Jl0+qdvlOY1R6fvoLF3gVrfK7/gMxMxqWwIvatX0uTkxunJXl9w7wjQw
X-Gm-Gg: AZuq6aJJN/99zMUUm7eFLyE/tBW6s3eGebPViwNB7ybcOurBxkqIeO68pYGQBHIdvF4
	VmdE5D5nVYYx3mIIWNJj5NUXkSqGjRKwmJRcNvlkeWb8jotBet2YoXszFsiu456Do9rKxiUEmyc
	sGEQotsKyhn/uEyg3Eub08ceW0KNnWutiXEHL0OU7T/ZHvw06aktISv+jfanVr0VwI41iyJ7n0J
	WQMkTg9pCr+GVLrSRjMVr/rI8U0JdZJ+ggx6Sdfx9Z3MyQS55sNHXOdqwj7Pdb5pNl9VOufQ3dk
	7v4zZiEM37POYA83h6dJ4SgLs9cZOOlPf0RBsERPaCsDhYjhLCpQh+qTY/WynrS2L5+ir0D4566
	JlMZHumI0OZAUCn/Dt53eBwcObD33UoVoJtKp9DoINxuDxvsMeHO8BXbhahm2f3ZASotnnEM6Pj
	qmWlqHgLoZHu29af3ZEyvKN7v7FB09vWtDzXCHvMuYGdOIB4OhRXwKfBHSM6CKKQ/+btGEQ1LAB
	c4xNne8nT37zeOrzN+zf6EfljKiJhQM2a1h8T4ss2UrU4d+aQ1v
X-Received: by 2002:a05:6000:400e:b0:437:6efe:94d4 with SMTP id ffacd0b85a97d-4396f1a61f0mr2313742f8f.8.1771662223872;
        Sat, 21 Feb 2026 00:23:43 -0800 (PST)
Received: from fedora ([149.3.87.76])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970d4c626sm4534939f8f.28.2026.02.21.00.23.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Feb 2026 00:23:43 -0800 (PST)
From: Giorgi Tchankvetadze <giorgitchankvetadze1997@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev
Cc: linux-kernel@vger.kernel.org,
	Giorgi Tchankvetadze <giorgitchankvetadze1997@gmail.com>
Subject: [PATCH] staging: rtl8723bs: use kzalloc_obj() in rtw_wlan_util.c
Date: Sat, 21 Feb 2026 12:23:11 +0400
Message-ID: <20260221082311.128678-2-giorgitchankvetadze1997@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace kzalloc(sizeof(*ptr), GFP) with kzalloc_obj() macro.
This improves type safety and readability.

Signed-off-by: Giorgi Tchankvetadze <giorgitchankvetadze1997@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_wlan_util.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
index 9284657e23c2..e0c660e5f2d0 100644
--- a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
+++ b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
@@ -1131,7 +1131,7 @@ int rtw_check_bcn_info(struct adapter *Adapter, u8 *pframe, u32 packet_len)
 	if (memcmp(cur_network->network.mac_address, pbssid, 6))
 		return true;
 
-	bssid = kzalloc(sizeof(*bssid), GFP_KERNEL);
+	bssid = kzalloc_obj(bssid, GFP_KERNEL);
 	if (!bssid)
 		return true;
 
-- 
2.52.0

