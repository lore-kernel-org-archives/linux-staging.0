Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59C882F7EFE
	for <linux-staging@lists.linux.dev>; Sun, 20 Sep 2026 14:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789914540; cv=none; b=K4U34dgzDEBT1O+G3WXlP7EIWUdWa2SEME0OWm8p7/tKs3rWnZ6MTbwDTL7Q+2kYqma3TC1co/UWYI5uFk/D5CjXk6xCsZGgeMVh4HbPX/dBdIjO2XGyt9Lpo7SPtYFuZIdD6ThezXeWF4NbCAPuu8BjV6cNb8PFgpOOnDcMJAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789914540; c=relaxed/simple;
	bh=Y3u77N/6KvA2bHU5i1U3fQaq9HzFqNXQR/t1pdDCMK0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=i+mLopXhb6NytefHQ+W9GgwMhpYw25kOVFif1L7Ra85BudxANv1GygjdXahTfukzNNjTC+rCbs9kn5jrHjg/n4ICts4YUzkKhGEJO3RqocvRRWuE5KGtSh3+bEC8bUnXPS/xwAUyLF7RTBJH4A4pqjcdmg46fykc7LvV2X6a1zM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oAVzA3bc; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oAVzA3bc"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-39b31b4281eso2176438a91.2
        for <linux-staging@lists.linux.dev>; Sun, 20 Sep 2026 07:28:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789914539; x=1790519339; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kjpLp4JtVENucB8aT9J/XSdliF7SjYN6mnB5JCQ6UTA=;
        b=oAVzA3bcoUqXd/SGtTaDEqTKAX8dFtqm3/jLsZ9q4UW+S0URkfUFf3KUHvyro0MCXu
         F6Lr1xPcenoAcCQd3YYiI88pEhqgcRBtV2aSqRh6aWscTjYgfE7gZlA++4aEY0hKI+hD
         Qmobmd+rFa0nP7kbhPbAoxkCqzE6bP5/QPqbnrgvZEE8w2M7xFrWnLRUntCtWqg9uv6z
         9H5/IC6IRdDfPa1nHxgg1P+HCytIujgcas8/htxqYamVSLHnfFhRMAXobEe7v/xCbuc1
         kCB+xsQjuVTZg1KqxmoZ9BGy0w5lJ4x7ZIv5kGwSHXoFRmssh3AmHb6pT2hdWkM5H9ld
         OItQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789914539; x=1790519339;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kjpLp4JtVENucB8aT9J/XSdliF7SjYN6mnB5JCQ6UTA=;
        b=SdGMCBc5/z4DezD3UUrDgARhT2x5xZeFCuiNAoDWHRVt7ZjY/FzHJLOw0zrndCeWo3
         qso/8nZL0IKTlyDZZCXrB3Y7mHRegIvd9Fj3A4cvK7bv87BUjwuI/8u5Op8uDnHrLmJv
         j67w0oHGKTbidNO55PT/8X0UARJ+nvu6S6Gg/eJMi0SQpza26eiWcOJ+Ag75RqH3VjVc
         t1p8goLRpn6c5/KlzEZFKq2XtNesM4XKd70aAaRLlTRX6q9jG791AIYaZDDoHaP1SYg1
         rofNxENFX/ieZOJKwfJWrYOcAq6qJrCOycGy4UBNQuOxWZC8kPGaJgRPb9SttcNyYX9e
         Pc5g==
X-Gm-Message-State: AFuF++mVBZI4SQ+TVy68kFZbXH3jezgF4RVxxw5hcwMUYDnYSY2mC6GA
	75dLSUE1rlUYz9zCgnFJEej4d+YeJWSlWTEBCviGV/oUv/WdwKJ4kkSg
X-Gm-Gg: AYBFou0r/1ghlhRVOpZylRia+HLowxQMNKL8F3UoU8JVGx2gmvrQ6BYKthgS1rNn+Dn
	iuheuf+K/O6rE1BpKyxkB23JRADrrHgC7pBmf0dtc7qTIGUdliRCuPEW67mXFkDOrn5yPr84gTU
	44lD2fmgo847WRBrb0gRcOmD0QK0hXl77ikmvG+POTknLPz2cAdHAiBQxYQaC5fiZI3JqFpUXa2
	Jl3hrYqeoVIaj4VU+ZEpuW0BMlZy7366+bdft6qxYuyB/abYNHQ3DV7gb7UeqVG11zauMxDB7nC
	8AjFGYTPJgFmFE/Ab0e/BGsydqb/MXrHtMU1bpNKMDDvDoGI51up42FFBpRit+Z3eiPi7jv8mGK
	nVfB28heMGrrVHVkV4zyqv+C/0dNieAXPKwpsD3HmUVWvXfYL9kTPhkxBjE/U7xCsNNs0lbaUwa
	IKurIlXAAfw78iyC3ZT73IGhgnAXHyTNEdwkhBahnIBdT5J8eZh00HiY612h+wnkM=
X-Received: by 2002:a17:90a:da90:b0:39e:6a7f:1dc9 with SMTP id 98e67ed59e1d1-39e6a7f21c5mr7542737a91.37.1789914538671;
        Sun, 20 Sep 2026 07:28:58 -0700 (PDT)
Received: from adi.. ([122.171.21.241])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144d55d2269sm11992400c88.11.2026.09.20.07.28.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 07:28:58 -0700 (PDT)
From: Adi Prasan <itsadi2409@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	error27@gmail.com,
	Adi Prasan <itsadi2409@gmail.com>
Subject: [PATCH] staging: rtl8723bs: fix ie_length bound check in rtw_cfg80211_inform_bss
Date: Sun, 20 Sep 2026 14:28:49 +0000
Message-ID: <20260920142849.294162-1-itsadi2409@gmail.com>
X-Mailer: git-send-email 2.43.0
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

