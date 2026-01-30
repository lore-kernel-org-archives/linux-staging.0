Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82B5037F736
	for <linux-staging@lists.linux.dev>; Fri, 30 Jan 2026 18:16:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769797010; cv=none; b=rsT9FjwBAXZTKjyqQV1NTWm/Jwtl7av6N1nZJ7OryXpS1N9DArXg71RblFrjVM0tOFF1+w61ga5t7VsD7LCFjDgv57RT3++CAQxNxlaq62G6XdPFr4kWeIxykZdGu/1tQKmwWyKCPN6JfEYdAKDg2wvGT70j9wKIm4gCEmBoysk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769797010; c=relaxed/simple;
	bh=uMjtgTE2oQaSlXZ2RpWzD0PdmDQs8ivpMUqvhD1eH6k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=k6lS1gFIaDX5woMzoAnmp+qYkIN4JQCTEvFzha+Q6elhQGSGTkJr5YukzkyT4ksS02ysCW+mYx8pAJknfHTA9/KzJG7FvYGdq2UYrorEh/gO6VOpwKRQvTo2KCUUBI0prvvpFlIvGl0YpQbYuvyc37Sb3y7nuo+DYfhu9Nk3O+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RyiIaKXx; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RyiIaKXx"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-47ee3a63300so25205285e9.2
        for <linux-staging@lists.linux.dev>; Fri, 30 Jan 2026 10:16:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769797007; x=1770401807; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qVrBPCMwxLFaPKXm7iV49koCmmnJv5JcMuWXxCdjyKc=;
        b=RyiIaKXxxUTgaT7P5iSJDsdtVyq4E58MKuJp6wUrm+5bG2kkUebWIxOQesB50S9OTQ
         gk4gCJ4eVGJngTakb9t15WRe+CjaKsgx04SLYNJeP5cqqYrex2oynzNFS8G1ERH9w6XM
         hnHZQ+nIMUYJp5LXm7XkT4Xqrn29IohQuuNhAf3+s8SdRtuIE0FeXQ5thFGkgMudTatz
         o22sQgWf1HIwLop0ECsf/D3XELdjCzb+wQdvjTqrBy6SPGI3Ssrm/dOkOO+r9iIhuG9L
         XcsKzCMk1pyrnqUC0SgDnmuqImdYLDgAhNH37LGEFQt7uVC7yg7y3EOS6XXQef6xaWjP
         nclg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769797007; x=1770401807;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qVrBPCMwxLFaPKXm7iV49koCmmnJv5JcMuWXxCdjyKc=;
        b=PQYh819Uf5LkwiNxbH6e4I2B9gC9VFDJeNvqKXIWhmQl7BzYW1Wbu7RQpCC5Krc9ZQ
         AclPpLxvMxkG7epZnKPQ4Dv+ybEX8qlhajn8cgJCw57xxvShDBl3bQYRPaZmCZZzcVlG
         QOS+PZLXIuKkWuxmgC6+SwMXNKJ8qGxo4MnifMKguvvXXZP3rsYCSOEnZ8M491jzraKg
         YifvwXIEpg0CU2cEHzwBuFNnIg6r/ONvEwLKCEOKarwt7EdLrzf7ARaIJnJVAlFEH2kE
         d5l3B9Lq0rNqVnG2yg4MVTDFbhIAKkO9jfceAPCYw55ulQbsDKQwm4n8pqG2iIZFinIk
         FAPA==
X-Forwarded-Encrypted: i=1; AJvYcCWKyuboR7D8J2RHp0TY9iycgGA/xWJdOHHrUT7tezv/k+wm9Ywfl2kBUKHMaY1OWUuaEsl3tRF7S6jjTs+S@lists.linux.dev
X-Gm-Message-State: AOJu0YwFhzMg4L2b8OEPpNzi164P8pkrbjjdxAfcHSfCXFpILLtghEAl
	lRE9xPfvOKHBWaALhT3UFg05UVhgglXz4V6WB5ah92+0MDLZ5lyvWDE=
X-Gm-Gg: AZuq6aLa8bbopAA+fmr42BcMZcBrydC8/7CwpnvDavF9gQolYUUZA+mXV0+howLV3PK
	Cx9jYNHN6ZoiJOb8uyFybsBIvWFDLhy5NBomtfC9T4Iua8qOsLEy9xwM0VBHeWREbrLD4JPMdVF
	wgjdgTygljgfBI46idm28K/kYuKfeDDbdWjCnKPQSoX9f7zclE/2XUxQjtrez6VlIeTrxc2f0+N
	jA9LG9US+zYkpq3WVyT59/+Xye1138C9D8yWtODFd2CqG87GjESYtKjbC3t+H8d1uLTNI0Yu/XI
	N3I+wAOo0oir4rEZ90QezBVK5eqFKjQVZ4vHA54kc6NtnULISlNTy4VAzz2Toxqz+Z7rkg38YBD
	Az8zTxFMBG+77otRzLqIj6cwarMHTRwZc/Hm+fiGdwVmrjaVcW2dm4ff7DKVkOIgUHIWnCJTeFV
	9kL1h8JAKGScPS9nNh3kMT77V5v545BgMVRekOcOj3hU02sjqFhGBgsbZ6HneuJQ==
X-Received: by 2002:a05:600c:b99:b0:480:19ed:7efa with SMTP id 5b1f17b1804b1-482db4a8ba1mr47028925e9.36.1769797006785;
        Fri, 30 Jan 2026 10:16:46 -0800 (PST)
Received: from LGPC ([31.223.131.55])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48066c40e04sm280571025e9.13.2026.01.30.10.16.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jan 2026 10:16:46 -0800 (PST)
From: Luka Gejak <lukagejak5@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Luka Gejak <lukagejak5@gmail.com>
Subject: [PATCH v5 4/5] staging: rtl8723bs: modernize hex output in 
Date: Fri, 30 Jan 2026 19:16:19 +0100
Message-ID: <20260130181620.199152-5-lukagejak5@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260130181620.199152-1-lukagejak5@gmail.com>
References: <20260130181620.199152-1-lukagejak5@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the manual hex-printing loop with the standard kernel '%*ph'
format string. This simplifies the code and uses modern logging
practices.

Signed-off-by: Luka Gejak <lukagejak5@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index 7dfc2678924e..5e79a720710f 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -2071,7 +2071,7 @@ static int rtw_append_pmkid(struct adapter *Adapter, int iEntry, u8 *ie, uint ie
 static void rtw_report_sec_ie(struct adapter *adapter, u8 authmode, u8 *sec_ie)
 {
 	uint	len;
-	u8 *buff, *p, i;
+	u8 *buff, *p;
 	union iwreq_data wrqu;
 
 	buff = NULL;
@@ -2087,8 +2087,7 @@ static void rtw_report_sec_ie(struct adapter *adapter, u8 authmode, u8 *sec_ie)
 		len = sec_ie[1] + 2;
 		len = (len < IW_CUSTOM_MAX) ? len : IW_CUSTOM_MAX;
 
-		for (i = 0; i < len; i++)
-			p += scnprintf(p, IW_CUSTOM_MAX - (p - buff), "%02x", sec_ie[i]);
+		p += scnprintf(p, IW_CUSTOM_MAX - (p - buff), " %*ph", len, sec_ie);
 
 		p += scnprintf(p, IW_CUSTOM_MAX - (p - buff), ")");
 
-- 
2.52.0

