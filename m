Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D87B2882C5
	for <linux-staging@lists.linux.dev>; Thu,  9 Apr 2026 22:18:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775773106; cv=none; b=PvbqHJKYRXGnIHI3g6qwDg98TmpjPk/lvMG8wq0J2Lbofy6qbwBbwNAx+xyZY9nkEgbI2zB/b/CHWeuyNk8BtLF5K+016lTW8MunBbnsemFY0yrEfenFHmhkO9ug5eWWy6K2MiIsMl/M+pM/g/3WzVzmu9YVb3J3/dxtV7gARaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775773106; c=relaxed/simple;
	bh=Sg5h/CiT8ObRdbZfgH70dNJR8iiQVIzhhyWV8o3v8xU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=elraceqtXJNBou5/lR+Xbrb1/JIOQUo2mANekV1bTMPcoIo/OjuhAte5lZ5/++ArZ49iuNzN/07iJwwm3Tly1vTcYG80uHVRYlvXKUMf78Uv1mich6zuw1WTE9FymOaMaRySTFRbM8q5xYmDpGCBTl6Gak1Ru19Gd5I+bb+JrDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ts/dz00+; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ts/dz00+"
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-8cb40149037so132190585a.2
        for <linux-staging@lists.linux.dev>; Thu, 09 Apr 2026 15:18:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775773102; x=1776377902; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qdq9vkXM8uGE5zjTSD5GU+y/Cnt7SigtLsba84eUZV8=;
        b=Ts/dz00+UbCsZwcnjPk/PBm0/vWFB3LGX70C4We/FYlM/EvykQurdbFQs7U/mJy8Fl
         uC7f+OvoDWDS/+7J272nTjWePFRVTvf20WdPUhp6dlFUI1Pbyzyd6EHetm714uiLLFBj
         xalvexXsT9wfTFN4/4G7qMAJ8QUWxQBJP+0nzxPTuQPQ7b9kV3+LAV+E03O61H8cr5Zn
         2sLkYgAqFSOFkNNzxHAQz60hkYbTg0aNfdvuwk5KIBC4CBUZzyBxUBkw7s7id9bRXeJ8
         1Uv2sCdx71fwGTrtJ8gvKvRJ0zCC2CPvEbgB1J9y7B023WRpBj4XlOla69BuHAwEfN2S
         E8Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775773102; x=1776377902;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qdq9vkXM8uGE5zjTSD5GU+y/Cnt7SigtLsba84eUZV8=;
        b=Ng8aeZ2bPnXmmpDahvA80NiVvJUJnC0QBpslqqIn2xaNuS3/YtxE5TN//FqgZRXfbV
         Vr7lfBqOIkkwkcKfyqFFMg3xQ7M6OSsN8u8csBCtwyVh6RQNWC5XCU39OmT4fwV6KMJY
         Bz/71FX3hRBmtYwZmCG+8i6oKhst1bXcJjRfCBxML/vVKoSnw9yonsaEqotoVswCBQsb
         A10QinsoJDxwXSIijNM+jBcO2CRv99T0BGoSSYY4aX0Nrzqlhn1NUcnxFAleCMDAi42B
         YA8uckjgkVssCuL+yOE8vJCbNR1EH+q/gfZBGIbpkt0Lf+ve1bRsuL7/QA6itXA+xCx7
         KWpA==
X-Forwarded-Encrypted: i=1; AJvYcCUmUwHQ59ZNvcRUu+uAhtVC+ilBrwmTlh6aX66LtGg4iO3asjQ4DLv9eGEO7h99ruEMXQ0DtR6jAxx6AJRH@lists.linux.dev
X-Gm-Message-State: AOJu0YyBFud1l9QGuYD498/oXiTmStpYRyIrSuGaqbtiMiykcNEzrsqa
	e7vuUK8omAfg0EeMCB3VFPH6kNr9v3Y5Iw+mkl6bkfk7FJ3EB1ONUqle
X-Gm-Gg: AeBDieuKoms+fRh45ooa+ifCYwQosFgMpJYQhC/68LAUiABvJYEjZt9frqEVmavV4v+
	RdyCrpCZSsXFRukLeHG87CLohKm8tGOWADuz5DFGfFB/CgglvQ/WNxpxQwdzTTw3GSSz4eeScMK
	cybP7IZrp4kEwPTOrRYaXB27JexVUOty3Nvd9rQYIWY1gZRrJgYp9qfQzKkOInMDHBeJ3TyXtka
	ldv3k0fza34IGiXMAJi3PEGrHNPBTWC0sSwHsWDT3Y6CaOmQBYCWlmlUQ+74AD8Q6JUoll9/iuH
	emjLkfWfiVI2OTxsAZgUwK0f7Qk08AAfFuoRzx3KuWMQnV0tKNYgK0OPD3Gh7f7GmXUMTM1suhS
	dnr5hqm16aifk1Gu02qajQ4aieYOFFvom5JF+J0Xbw0filzABz2udEpRbSlixwgwXJJD+7sLJ9C
	4DVCC3STSsKRoLg2jEWoWtG9yUGgi+Y62CE9lU1ohU9j6NWhsf614grPTBsfmO2UMktYZMgmznU
	Eg=
X-Received: by 2002:a05:620a:40d6:b0:8cd:80e1:5a0e with SMTP id af79cd13be357-8ddd069765cmr98461785a.63.1775773102394;
        Thu, 09 Apr 2026 15:18:22 -0700 (PDT)
Received: from localhost (mobile-130-126-255-6.near.illinois.edu. [130.126.255.6])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8ddb6469c60sm63058985a.14.2026.04.09.15.18.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 15:18:21 -0700 (PDT)
From: Akhil Boyapati <boyakhil978@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Akhil Boyapati <boyakhil978@gmail.com>
Subject: [PATCH v2] staging: rtl8723bs: fix comparison to false
Date: Thu,  9 Apr 2026 17:11:22 -0500
Message-ID: <20260409221122.77303-2-boyakhil978@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace '== false' with '!' operator for boolean test
to adhere to Linux kernel coding style.

Reported by checkpatch:
CHECK: Using comparison to false is error prone

Signed-off-by: Akhil Boyapati <boyakhil978@gmail.com>
--- 
 drivers/staging/rtl8723bs/core/rtw_ap.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ap.c b/drivers/staging/rtl8723bs/core/rtw_ap.c
index 864cd8b6d1f1..8f18175175ee 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ap.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ap.c
@@ -1013,10 +1013,10 @@ int rtw_check_beacon_data(struct adapter *padapter, u8 *pbuf,  int len)
 
 		rtw_ht_use_default_setting(padapter);
 
-		if (pmlmepriv->htpriv.sgi_20m == false)
+		if (!pmlmepriv->htpriv.sgi_20m)
 			pht_cap->cap_info &= cpu_to_le16(~(IEEE80211_HT_CAP_SGI_20));
 
-		if (pmlmepriv->htpriv.sgi_40m == false)
+		if (!pmlmepriv->htpriv.sgi_40m)
 			pht_cap->cap_info &= cpu_to_le16(~(IEEE80211_HT_CAP_SGI_40));
 
 		if (!TEST_FLAG(pmlmepriv->htpriv.ldpc_cap, LDPC_HT_ENABLE_RX))
-- 
2.53.0

