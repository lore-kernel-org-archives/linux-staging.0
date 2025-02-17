Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com [209.85.214.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BB7C21661C
	for <linux-staging@lists.linux.dev>; Mon, 17 Feb 2025 10:05:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739786744; cv=none; b=VxCvn42zX+O0YGsEFM5KwXytNeRehKE3SsljQzNsv4VC3pjg5OBu79hHRwxz012YFa9+UxyE3n95OLZbHwWqyRc3dxrN+2VZSidxBalarn6UyjDb2j3ZjEJossjW4t/cDqXADVdwt5Jh6D3FCW9G09Pxu63tqfF4aNqxX2ZEcMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739786744; c=relaxed/simple;
	bh=Gazg7ITlPyeapShlUJWzCmzJ5JDneJIfQIfGTf7Y54c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GP2CuYTtCveC6UBcU4Nm6CqXbDNHvUZPRWDEA+BoZaknqZBC4dT3LanyZc4zUvIJ3ogIdDsjiXhazSJ7t9yvZzMSp34SFnydPWWlmPkO9eez3JjL52gLJfGaxFgdsOTKHDTKZmsg78SdoOxSfgrzI/XCuaH0y/9+KdS0+urhsSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZZNQDICi; arc=none smtp.client-ip=209.85.214.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZZNQDICi"
Received: by mail-pl1-f194.google.com with SMTP id d9443c01a7336-21c2f1b610dso105238925ad.0
        for <linux-staging@lists.linux.dev>; Mon, 17 Feb 2025 02:05:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739786742; x=1740391542; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ydQlzBFDch5dE0pXTfWbgAH++noP+kxMcP8vl7mV8uY=;
        b=ZZNQDICiOuf6te5lHawehFCAT5dy7WWlXKBV13HHyg9LQy6Zm1GrVA8TlD6eUGE15l
         BDyhN6IWn6BbUtTkhpYeH4SRIqKFMXKbuWZDzF4to4DnGqyj583919SAAsdkpfTEzNuI
         C/KcpKXUQTnaLkt+xA+G0AWWi6RAnGXHrS66ZWrrkKhrX83glXMa3oFznLLLiehmjzPg
         upq5WRuD/emgw0othihWcOAoB2HRMCnId7XG99r9MMzT+Xpa5dTtkqsClacxH/UNI5Uw
         C5RHlksbf9ix7F+i1ndV2PrZFUnDDyZvrPqIdGPmmxNUJQgptiHO7S2Rj1b8ZE440tGF
         EYQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739786742; x=1740391542;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ydQlzBFDch5dE0pXTfWbgAH++noP+kxMcP8vl7mV8uY=;
        b=tAK9/u8dsBZloaAs7jFN9WCL5yyvj64b6pElWMYGcvmcHXnGaBMD/JH3l2ic8D7+eO
         YQc5eTdxQe7Q3Zthj7y0zqY0LlCCUh/kjdaj2HNkCa6l+2RfKutDR4EBYW9iqPRc3Pv2
         x0GZPhbCUZ9N2+P32CMLu8pSmKaXx1FJda0/7MA3dG31cf20kqVaaWhmJvxxuiTedlQf
         0TMPwvrkw5teVF3hfP1Qbt+FKYY/e4XvmVx6Bms/Ksp5ooK38IdwGoZNlLodeS5Uq7eo
         +baPEeconXw4LL2omN8oQI9f482AWQn0W3RytyYkwoIQpr/JioeK/EbtQuCPqx1nXfzs
         qrrQ==
X-Forwarded-Encrypted: i=1; AJvYcCUJuN+YSy612XG9wbS+WG9YMCEqdp78YlFxDVH+AgQgvSh0iRw+RCvVBdxUb6AAcd2MKip/W4gDHiALbvNi@lists.linux.dev
X-Gm-Message-State: AOJu0YyvULxv8JHXH8AFJqajlOK3RWVq0cSnYqGRD6v6XOMaggKH2d5x
	sdX5bfXC+nw28sb9qBkIMFefTWeQ4niZBfD7dYvhaRUanb+5lQe+
X-Gm-Gg: ASbGncsXSp0YgtojIEmbwnuPa+K0FbV9cF/DYfioc80xCMldBQyHa24Kv9RmtajT+mK
	2nsr/NdrfDt3aFrXxJfbab4Wj9iiWi6x5WzwV83Myw2czyOkpng09VZVAAcnhYVQWFnbseSeZBZ
	L+E3/onGZdt67qXM3mFLweidxk+HJEvM2DehXU2ntnNRud/y7c8paGfLfAc6gJjdTnutsdQgkpo
	S2sF1YE9LEopuKFq9LoKF56JDLWxP6SmTq0q73Yq9CLOfQPfbK4nMTdGmF0ckm4E4XxQiXcZb5m
	JWKkRqxtHNtuZHx0LBtg
X-Google-Smtp-Source: AGHT+IHXvUhl4bD+LjfkXgIcHMinochivPxFwXtuS7r0q/hR+NkJfRrikbDiGt4PUN6mvMgs0ORq8g==
X-Received: by 2002:a17:902:f54f:b0:216:4d1f:5c83 with SMTP id d9443c01a7336-221040bf8dfmr152839325ad.47.1739786742380;
        Mon, 17 Feb 2025 02:05:42 -0800 (PST)
Received: from localhost ([2409:4066:d04:319e:1d76:db25:b6bf:4f52])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-220d5584dfbsm67269345ad.213.2025.02.17.02.05.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 02:05:41 -0800 (PST)
From: Ravi Kumar kairi <kumarkairiravi@gmail.com>
To: dpenkler@gmail.com
Cc: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	kuba@kernel.org,
	dan.carpenter@linaro.org,
	rmk+kernel@armlinux.org.uk,
	Ravi Kumar Kairi <kumarkairiravi@gmail.com>
Subject: [PATCH 1/4] [PATCH V2 1/4] staging:gpib:agilent_82350b: Fixed spelling error
Date: Mon, 17 Feb 2025 15:35:10 +0530
Message-ID: <20250217100526.49495-2-kumarkairiravi@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250217100526.49495-1-kumarkairiravi@gmail.com>
References: <20250217100526.49495-1-kumarkairiravi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ravi Kumar Kairi <kumarkairiravi@gmail.com>

fixed havn't -> haven't

Signed-off-by: Ravi Kumar Kairi <kumarkairiravi@gmail.com>
---
 drivers/staging/gpib/agilent_82350b/agilent_82350b.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/gpib/agilent_82350b/agilent_82350b.c b/drivers/staging/gpib/agilent_82350b/agilent_82350b.c
index 5c62ec24fc..5a74a22015 100644
--- a/drivers/staging/gpib/agilent_82350b/agilent_82350b.c
+++ b/drivers/staging/gpib/agilent_82350b/agilent_82350b.c
@@ -121,7 +121,7 @@ static int agilent_82350b_accel_read(gpib_board_t *board, uint8_t *buffer, size_
 	writeb(DIRECTION_GPIB_TO_HOST, a_priv->gpib_base + SRAM_ACCESS_CONTROL_REG);
 	if (retval < 0)
 		return retval;
-	// read last bytes if we havn't received an END yet
+	// read last bytes if we haven't received an END yet
 	if (*end == 0) {
 		size_t num_bytes;
 		// try to make sure we holdoff after last byte read
-- 
2.48.1

