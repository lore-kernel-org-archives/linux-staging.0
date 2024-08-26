Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8055C186619
	for <linux-staging@lists.linux.dev>; Mon, 26 Aug 2024 16:28:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724689690; cv=none; b=Qp6H50dd+Yn4cfyFrXQeuV6Zk4TOyyCtSZm73g0cvLjW53DtMWOebdVuN3ZvHFtUiYV1njA3WlibZCl1QW2hSWpxSG6LbXv9ZhRVgu0uHQrF3K2dUjrFRsQ6SapSyiV628Xhdmhbs5maOv6jcPs6i1HbUtkOZ9D1/nofZyNtz2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724689690; c=relaxed/simple;
	bh=a61nPFMBkE/nB5lWlRHE+zZhBHDWfKez6McDO2i56M0=;
	h=From:To:Subject:Date:Message-Id:MIME-Version; b=VrKaQR0WZVfmjDVInFZbvEM8rt9hgFPq3ERLqNVIyPAqWcEnMlkZJvRcY2Uu3HJlTXUIPAHPOw+bj+VZKZ1qzFc6Ns5j+FGhOujYorifEKJYn+qwxuqpPKdO/pPwc0v6c5lvH5iYABKrz+su2Q1ZfxWNcBRrJIhQ4cZfHxYXIrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YI5E4kEf; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YI5E4kEf"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-714187df604so3196747b3a.1
        for <linux-staging@lists.linux.dev>; Mon, 26 Aug 2024 09:28:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724689689; x=1725294489; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=x0/RKmYvm4ebcP81vpv3lvWNYuRii1WWVcVVAKbqmqs=;
        b=YI5E4kEflmQWQ4POWNUTBsoU+Ev/dT032VWrdQY06JeZLzjmYgWzS6FxVjWCATRLPf
         0ptSxlujByT5jk0J5NGjpWfY7YzqWOl/pct8NEVxofS1fnTv2DGD3+2i4q/vYl8ztv5t
         1aZFPFgAKm2m/iILYjfA+qO9YNx8sfQ39/h0dCPPQQL2EYK9/KZgAH3SW6JhLZnfr08H
         lq8rz5xnPYV1g8wQZz/4SWfxH7Xgx/xa2jcTV1ItssP9FqtgvV9qtdcUBIIcLuzdsjhc
         mvNwBU14/U1kq2Zpb9Z1tkth5wtS9FzKE1Rte+daGSLvw+RxX1RyefMMoB5kQozO5hSY
         s02A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724689689; x=1725294489;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=x0/RKmYvm4ebcP81vpv3lvWNYuRii1WWVcVVAKbqmqs=;
        b=ga4l9bdbH+HJ2O8N2naAN5aAMuWUrmwab7T50I2De6VtuNOxPqekDR/mCtLG0xNLKZ
         J6j+Jo/ipJKhSiI6f+md6u4Ofz0xXIahuVBqTuq86NNu4Yg7LtNZ9NYGU3+lXun+wymB
         zCWwiVf+yHMXbUamvrz0Ne8srNmZ81tkCNgt4gWC5ZKAlshDBfYNNpNU2lbcHsl23bcZ
         iBct6wmHxWw/ZPQQBACRGMKYLePEXQycybB7AJzLv/KBHy3YvYGZUc9HNhk1nQfWdavS
         L5Y9Ay98RD2R01u7iKvK/nq+1VsVxkiffqfQogGEgXrWVPlj9RoJlZQ90RDu5FTlwB8a
         b/wA==
X-Forwarded-Encrypted: i=1; AJvYcCWakOjqbAQY6/aTAcNzyAufOoZ7luIDHdw6r3FvR2CAFH+peXcnhnurqNtfhFDxsVhp/nfFGsKlpyk6fH/9@lists.linux.dev
X-Gm-Message-State: AOJu0Yz0Mik1LsFVLbItQqjBo7lLIEURrKbm0Napzh6tOMoi6fbAaYnm
	ftgSw+J4RGKJMcK8sfSpWheAKkmtDJsSPXR6YRCiPZ3ZAlpiw1e6
X-Google-Smtp-Source: AGHT+IGkjP7r59x/lWcFgHfpLdjKi4fyY5EfpWD/UlvX3nYemTr+wBvOIJQMX0LhX9/n5bai5T85vQ==
X-Received: by 2002:a05:6a20:7b21:b0:1c0:f114:100c with SMTP id adf61e73a8af0-1ccc02716bemr244396637.17.1724689688313;
        Mon, 26 Aug 2024 09:28:08 -0700 (PDT)
Received: from BASE-20.technicolor.net ([2804:14d:c098:8bf5:5293:dfcf:1562:f16])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7145a3d32b0sm3644850b3a.23.2024.08.26.09.28.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Aug 2024 09:28:07 -0700 (PDT)
From: Alien Wesley <alienwesley51@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	~lkcamp/patches@lists.sr.ht
Subject: [PATCH v3] staging: rtl8192e: Fix multiple assignments in rtl_wx.c:529
Date: Mon, 26 Aug 2024 13:28:04 -0300
Message-Id: <20240826162804.18996-1-alienwesley51@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Separated assignments for pairwise_key_type and group_key_type
in order to silence the following checkpatch warning.

CHECK: multiple assignments should be avoided.

Signed-off-by: Alien Wesley <alienwesley51@gmail.com>
---
v3: Fix typo in commit message.
v2: Removed two spaces in front of "=".
---
 drivers/staging/rtl8192e/rtl8192e/rtl_wx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_wx.c b/drivers/staging/rtl8192e/rtl8192e/rtl_wx.c
index 47f1adf30ab4..67c4793e0fc1 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_wx.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_wx.c
@@ -526,7 +526,7 @@ static int _rtl92e_wx_set_enc(struct net_device *dev,
 	mutex_unlock(&priv->wx_mutex);
 
 	if (wrqu->encoding.flags & IW_ENCODE_DISABLED) {
-		ieee->pairwise_key_type  = KEY_TYPE_NA;
+		ieee->pairwise_key_type = KEY_TYPE_NA;
 		ieee->group_key_type = KEY_TYPE_NA;
 		rtl92e_cam_reset(dev);
 		memset(priv->rtllib->swcamtable, 0,
-- 
2.34.1

