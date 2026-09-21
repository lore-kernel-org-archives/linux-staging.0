Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 251504DA539
	for <linux-staging@lists.linux.dev>; Mon, 21 Sep 2026 16:55:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790009737; cv=none; b=p5rcCCxXx66YEe9/jOG/wFltltDOgl2cUsUUZsWgNkDxjAD9K84IFVKWNT1EDruSXPfJNrWWzHc7wePWjWIjdmXG/qHr8AqMLRal7Za7tLgEJEU+7ntXY+/Pj99ZA9681pgzlpK9AueOEhs65dRhHS1r4OLMIBpI8dUfrBxQq3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790009737; c=relaxed/simple;
	bh=2j13DYvkGAZXwy2JcMoXZIr+Oq280cX2u0gmxz/Z1Rc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Maq5uT8EN664bKC/tM91s5j6849IZe6vT48fLTM0lj0kXIRQEbYIg9bEm7gBcBKAgpS8EeiQrhfjNFSCXlfYs3IVvPY41RLLUcf8MDV6iRsG1a+lywAAahDzAa7MSzmLmHNhf1MuJ1pb/aZvP427cmz2pnzy/epIIK0ftAI8yFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fNMPJZlO; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fNMPJZlO"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc1cea34f01so2808890a12.1
        for <linux-staging@lists.linux.dev>; Mon, 21 Sep 2026 09:55:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790009735; x=1790614535; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XTJouOQS2I857DmmbqIbezzdJgMxhuitBuEs7cKuxm4=;
        b=fNMPJZlOFLscGKJIpmT9Kh0+38oRs9yLSe03sJywAiEQa25IDjhSEvglvbFvYxcQ8Q
         39A/RSkES7HjKKrM8swsn/gnR4Zaz8LX9utW4wEHgi36vyAN0FZOf+k5iuqw28YXpk64
         QXn7BP+8UdCZemjmWL8qMMucs4clIJIHvnOjpg89LhMQxjHOVzQU9eUf9gp8D5oMvjYV
         /3AAoV4OgxcFCGott2A+q+o5HpY4AUE0nrFEGoD4MrY4vV4mQbLEL51LEKlxyM8mFZP6
         yZo+it/Wp+tdKgnOvE7B2Uq+LadsTARlDIP+Qn7M0UQQe0XDt/G/JVKXQxIHuQFT1c78
         x5aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790009735; x=1790614535;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XTJouOQS2I857DmmbqIbezzdJgMxhuitBuEs7cKuxm4=;
        b=iEmrjs3gqG+laQcyDeV/VYC2aLdxCyeCCturPtf5GK0k9ntCNplRok2ClAbj2lJYhK
         vvEMGO+ePMrISilC2FQKfI+1ypSFw15NtAxEZj2h6ycFk2EolaGTC4jXGvL5D0l/zjEb
         TD5iwPuNVf3qPEvzwvmrcUQjQr36fAdhxnJni6XFACLPjwPIrx4u15YizXm701LsZwJV
         HnGQ0Mbi1c0RBYRGr0m4mdAF23xrMdOjnyG/ga4Waf7L6wlMC9Z2zfGggQUt2l5pXyLp
         GLauaBzhpBeHv/E5ggwvD9uUPb5u/oS4aBoLofidhBKv55za3C9EQU9rQQm/udkgmwv+
         2KtA==
X-Gm-Message-State: AFuF++ngXVEqnF4sNBkU2VWC9O+JSxHvIV8I336s0UjJiW3drJ7Db0zj
	lL5YcEfHL2mRjlpYR43equ9Bfdn0yZp9OskxucAEJaNrgxUZ1zeaoywI
X-Gm-Gg: AYBFou1dxVCLRkJtq2095MdCHZfRdg9QcI4qc4/Tu8eWH/l8LsR/GavVNaJ51WIl0i9
	683D65K99rOOrOdIqL9skYUVDFYOGhL5py1vggu4Zwp/arAwbMo9Wdtkd9Q43aneWnduf40R/+c
	ywntFgj95jaQwKAdglrQbcp88g1xAoOvBl0G+9S+xhBwthEdLl2XcxOPeF7jCgGWqH6jvIWCCpa
	u01akIhXR0daU6Y32R50gfugSWWPzUfir5C34Z5DdT7H28u3TJP/WFEXz1o5FKZSbNVQeNmRxmo
	44nzGFXQTdk/BYzN3i+rTdtV4Vf+x5xMmnNIo3itigAdcaxJ1SOUowdMLsDp7K7zFOzJcwAfRFg
	RdkS9XX2EWDdrV72623m73ZDs283lA4zEbwZIbN0H3mhJ5a195njbMZ6EhVthIzUqMHViv55Da0
	bGg8sF5fUOQ5Qr71zgvZ0ayA6bMKYHInCoCXwiSPE7xYs4Cs+AVCSlinyjA71Epg==
X-Received: by 2002:a05:6a21:390:b0:3d1:7238:33d9 with SMTP id adf61e73a8af0-3dd8c3f2984mr19418535637.3.1790009735459;
        Mon, 21 Sep 2026 09:55:35 -0700 (PDT)
Received: from adi.. ([122.171.20.216])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c331aeeddsm19677805eec.24.2026.09.21.09.55.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 09:55:34 -0700 (PDT)
From: Adi Prasan <itsadi2409@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	error27@gmail.com,
	Adi Prasan <itsadi2409@gmail.com>
Subject: [PATCH v2] staging: rtl8723bs: fix ie_length bound check in rtw_cfg80211_inform_bss
Date: Mon, 21 Sep 2026 16:55:27 +0000
Message-ID: <20260921165527.1379-1-itsadi2409@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260920142849.294162-1-itsadi2409@gmail.com>
References: <20260920142849.294162-1-itsadi2409@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The buffer bound check in rtw_cfg80211_inform_bss() only verifies
that bssinf_len (ie_length + header size) does not exceed
MAX_BSSINFO_LEN (1000 bytes), but network.ies[] is only MAX_IE_SZ
(768) bytes. This allows ie_length values up to ~976 bytes to pass
the check while a subsequent memcpy() from network.ies still reads
only 768 valid bytes, and other paths that write to network.ies
consistently cap ie_length to MAX_IE_SZ.

Add an explicit check against MAX_IE_SZ so the bound matches the
actual size of network.ies.

Signed-off-by: Adi Prasan <itsadi2409@gmail.com>
Fixes: 554c0a3abf216 ("staging: Add rtl8723bs sdio wifi driver")
---
 drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
index 3468d4114f60..27e7b8442d7b 100644
--- a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
+++ b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
@@ -219,7 +219,7 @@ struct cfg80211_bss *rtw_cfg80211_inform_bss(struct adapter *padapter, struct wl
 	struct mlme_priv *pmlmepriv = &(padapter->mlmepriv);
 
 	bssinf_len = pnetwork->network.ie_length + sizeof(struct ieee80211_hdr_3addr);
-	if (bssinf_len > MAX_BSSINFO_LEN)
+	if (bssinf_len > MAX_BSSINFO_LEN || pnetwork->network.ie_length > MAX_IE_SZ)
 		goto exit;
 
 	{
-- 
2.43.0

