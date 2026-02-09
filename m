Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com [209.85.210.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 263FC28980F
	for <linux-staging@lists.linux.dev>; Mon,  9 Feb 2026 03:11:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770606662; cv=none; b=MkK5z/A6vMYlDPPsOAqFBOmgPWv7vyP/5HNQKPurjybPbG3D3UBeLdQJ6tuIcqGMhPgHScKdzY8c9SPYMfufo3Mf3fSIJBATore+2N1jAciaIOvUXMo9rOIERrFEIj/KX3LE0QCu1tnzIJccUE+2GQsI5jIjxoKU0R497JnwWp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770606662; c=relaxed/simple;
	bh=3n804XoASpfZLtCqESH1uFuSzyXcPDqiAbbymjgyFyY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Rf/HLcTus0tYPnMuUaFdlByZ6jd5AQ+u4XcxxSvh6v6k8gzT6qfTgiqo75qRx3XGTA+wY2Ur8nLRqSpRzLxrsfwQB7wuiKlaCIJbzYtGVeMqYngBgxXE2vXX72qJAHpTlggT2SqmZ/PGoRkGi1XlKOWT+99IDU2C/dr9ck3e7/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GKmEIORn; arc=none smtp.client-ip=209.85.210.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GKmEIORn"
Received: by mail-pf1-f195.google.com with SMTP id d2e1a72fcca58-81e8b1bdf0cso2870190b3a.3
        for <linux-staging@lists.linux.dev>; Sun, 08 Feb 2026 19:11:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770606661; x=1771211461; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/+QxWglAnXHPY6ACv8OOgA82lG4AsQqtglEkc6/X2PQ=;
        b=GKmEIORnW23p7kCQBUWPmt4+dq/8WWVNMGO3szRktQY0UId4+mzaKa/tkCwcgr/CGM
         2GXIKtopB++P/nehrnJ1SDDvHvMUsZyboKVv7lx/BkHteFKYAJMvJJdEXxv2HzlmskmQ
         M3wzqtyR6ExyONU5xN0XHc229x1QWAtZ6lu2/c91k+/UqkGoX9LJSUnnWC3jPDNsUSsM
         3KJmxKJoIPKKHFDoGuAayrJUNRH2IOpFC14dxhthnDbYtUnrDO9u+KKJqCF0kKgxj0qs
         yB/YosXyqRNKgEt2+CrnUiLgox1LY4kqYzo23AQBlGa9vmSGzZuRPUySCmidoUvtZXOr
         3PaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770606661; x=1771211461;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/+QxWglAnXHPY6ACv8OOgA82lG4AsQqtglEkc6/X2PQ=;
        b=iEsxPh10PhpnZuCHJGWVboMk3DJZtqTUqsNeglCQQkH7g5psl1xj7G8z6uY/qE6uer
         1Wws35CiZaR+CoI216KelR4GTSiIXzKBCMgEoDNEW84x4odb6/t6xxVZBf8E3vLztVAM
         543gNkLZVQ0Mswg+XkdBYEqJLMvvC4yGe5eDvMBe5g53gN9iAJjmhzxVtixY7tMy97GG
         +d1SGy3YsAH0D8X7lg9PdKi9owb1ycBwQUuEybR0MiHQCk5uuBNxUcK226BcCdGn4Nyi
         WnqxQiHu6GFa2bn6XL70W9E04knbBjhhITYfRB31yXmlPCAz5dW2kXy8ymsebM8m11kV
         hGZA==
X-Forwarded-Encrypted: i=1; AJvYcCUeATyPRtr1s/6hiYHmt2EPmoRQ3ZEdcUNf80GSWd2ksifeNOcoliOhIp9hyIs+ZFPgKpNQMT9Sxwge6UsW@lists.linux.dev
X-Gm-Message-State: AOJu0Yxdd1Phm7nk1rctIUyF+9QQU7w8jhW3GFe9+99y81XBC9CvUKjd
	65GepksolBNLu5jjk+2hgQv+CJLe9J8IGwYhRNwNlG+UWFpFt3sWGoeV
X-Gm-Gg: AZuq6aJf2yofGWiJlGTZKn77Arz1/wG7XimeX9UyyCZZspoYTS6p74kezmTYIQO952W
	LXWylNp9vPHgN50T/4vX09TRqF8dIyR+c8g+89kNwWwrQPziN+snx4dzjDfXqpSooTMhLTfcw2w
	20nHRQLefPT9txg5UyCcQcsCb8PbsrcA3dQ4oiDS41bdF+TDvAoIqEEDN7jtDJj6ovZoFO1WQG5
	YkRw4YAi527sC/s6rCkkKZfi2AUQT68oO5oXi+eV7vRvN8oMJJ1lugrfqjMR7A2Y6CdRvdg7NkW
	9bpCjRSBUlwILZOHG1sr0srEtHHugzy5L7YlJGK37llvilQ4oQ3gYa3EVV6na03xzZr8t3uPcgu
	3tMe3Xz310ygrQoyDJ8et8Tf8ArMhf6bJwTGylR9Y6h+RRwxZm6UHUpU8xjmzws98T23rcBpnUf
	xIZXxxjEdXpFZSali1hQ==
X-Received: by 2002:a05:6a21:6e43:b0:36b:38e0:4bf0 with SMTP id adf61e73a8af0-393ad3b20ecmr10313591637.60.1770606661031;
        Sun, 08 Feb 2026 19:11:01 -0800 (PST)
Received: from Horstaufmental ([1.47.25.105])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c6dcb5e5f98sm9005106a12.17.2026.02.08.19.10.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Feb 2026 19:11:00 -0800 (PST)
From: Siwanan Bungtong <horstaufmental@gmail.com>
To: gregkh@linuxfoundation.org
Cc: arthur.stupa@gmail.com,
	dan.carpenter@linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Siwanan Bungtong <horstaufmental@gmail.com>
Subject: [PATCH] staging: rtl8723bs: Wrap long function parameter lists
Date: Mon,  9 Feb 2026 10:10:34 +0700
Message-ID: <20260209031034.130269-1-horstaufmental@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Wrap long function parameter lists to comply with kernel
coding style and avoid checkpatch warnings.

Signed-off-by: Siwanan Bungtong <horstaufmental@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_io.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_io.c b/drivers/staging/rtl8723bs/core/rtw_io.c
index 7bc09a50d4dd..27e1a5565227 100644
--- a/drivers/staging/rtl8723bs/core/rtw_io.c
+++ b/drivers/staging/rtl8723bs/core/rtw_io.c
@@ -115,7 +115,9 @@ u32 rtw_write_port(struct adapter *adapter, u32 addr, u32 cnt, u8 *pmem)
 	return _write_port(pintfhdl, addr, cnt, pmem);
 }
 
-int rtw_init_io_priv(struct adapter *padapter, void (*set_intf_ops)(struct adapter *padapter, struct _io_ops *pops))
+int rtw_init_io_priv(struct adapter *padapter,
+		     void (*set_intf_ops)(struct adapter *padapter,
+					  struct _io_ops *pops))
 {
 	struct io_priv *piopriv = &padapter->iopriv;
 	struct intf_hdl *pintf = &piopriv->intf;
-- 
2.52.0

