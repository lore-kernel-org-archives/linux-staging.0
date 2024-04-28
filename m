Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5B91171AF
	for <linux-staging@lists.linux.dev>; Sun, 28 Apr 2024 23:01:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714345281; cv=none; b=mH9rAJPuc2EAShpXgydS6bdhXZp+f0OdZvGCbF3UJYqCUpfNq1ux9vP0C8I0HaFJI6j+GOCIhL+hZiOxTUpPmfxqhZD5CmLtG1nOvEeI1RMyGaRnL1L5OTAPKMcxK4YW6brX7N+vPipk0AGEgBaPTOH7w1B0XrWRMv9gMn8pH90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714345281; c=relaxed/simple;
	bh=Y0A74DG/tGZ9t3qrTTILjs6Zntvgo40EARoQ+Zo6rX8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=cJejhfBadP2iNXLEBuuX+1FKEoKiHp74bCozG8C+OrGSl2lQhYwbbWsxbsqwkwhPH5sLFtl7ZcRGL9wEVH5jD0VPHf3dV1k/zFA4DrqzjNXuIaHCPmCTfXrlH3alT3ZcYepK+g5UpMS00kCpEQ+fBWZuBGuQHh7TgthKri8VCyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=MiQjeI+i; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="MiQjeI+i"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-2a7e19c440dso2860184a91.3
        for <linux-staging@lists.linux.dev>; Sun, 28 Apr 2024 16:01:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1714345278; x=1714950078; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q7RKQadhdL03GnI344MEC9dJ65d8YpjEeldN/gr2M9o=;
        b=MiQjeI+iGGMnFFFAVZazW5p4j7IuDjn05H1o5GTTRbqUW13nlwn541WZykR9j9Hcj/
         /QPS5mlvljdSY866xokpA3fxc1sNiaj4jz0gu4VIF2JiFf800iVkucgdJnfVJqz7zcQR
         Nt9F276gdkjWgICqnKXjxEOPLW0cenlKpUs+uSzGd2BsoW44TGzGjr0szmwhQf6pSWbk
         igXiqZJL0P0ICeVrsEuZNOhkN3raQspHeW+ZOS0AJOwbd96TNWkmzwxRIp8FhrESAcoc
         sV+apRMD5J3pWq6yRqfzHSYDQVslIW4jx4MltDyh77h1WhiPhD1RwdFZKzoQWYljksPz
         u3kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714345278; x=1714950078;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q7RKQadhdL03GnI344MEC9dJ65d8YpjEeldN/gr2M9o=;
        b=Kmz+FdqxIwZW05D9mcbCDXAPoZOBE+I5/GZSeyohqqGS+t55k8c2Hn7gCc0W41ncH+
         0GYDBC6eMSmnnM6jd+mP/6TYUd8m07VxaopnJT8LPy28qZ72Tl1hljNcy1gBqhOCTwFA
         Ca5O+ScallPj0b6iEG4/fIetmWxwJY1hBDbGKVgqpMqPmnupwbm+287WCZ3W5izphcAm
         0nC2fMK7ell9WglfdT9HrqaucdkDUcLPJjl3gdekSp8CorcKkCfT/Swbqm/7vtxUzMIt
         IQfktl7QGf+1HAIXZeEZyMQryyG3p2QW1tBD4HqGQnWhKXqMe7loK5R31J+doTbJENxW
         IaBg==
X-Gm-Message-State: AOJu0YxDyacL8oCznv68b5eUrB3l6zdmuqkouAA+tdsV1+Jtmb3+jvpp
	RXuYnepGMiSvHX5pTSlhUozK9Gn3DGj0x6AQoqXYQBBeUIWX+AGzkLuZ6+LtfJU=
X-Google-Smtp-Source: AGHT+IE+jspr0n/4V+B03xGFxLMPIkTtfluHRmcZnNLxTLWoaDn9P/8okaaQZ4WfEQz9xA7SxootDg==
X-Received: by 2002:a17:90b:310f:b0:29b:c2b3:2712 with SMTP id gc15-20020a17090b310f00b0029bc2b32712mr8130596pjb.26.1714345277982;
        Sun, 28 Apr 2024 16:01:17 -0700 (PDT)
Received: from lunchbox.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id o16-20020a17090aac1000b002a27132ac02sm17860864pjq.2.2024.04.28.16.01.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Apr 2024 16:01:17 -0700 (PDT)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 13/18] Staging: rtl8192e: Rename variable DelayBA
Date: Sun, 28 Apr 2024 16:01:01 -0700
Message-Id: <20240428230106.6548-14-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240428230106.6548-1-tdavies@darkphysics.net>
References: <20240428230106.6548-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename variable DelayBA to delay_ba
to fix checkpatch warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtl819x_HT.h     | 2 +-
 drivers/staging/rtl8192e/rtl819x_HTProc.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl819x_HT.h b/drivers/staging/rtl8192e/rtl819x_HT.h
index 3f8860e91793..96973c744cd0 100644
--- a/drivers/staging/rtl8192e/rtl819x_HT.h
+++ b/drivers/staging/rtl8192e/rtl819x_HT.h
@@ -32,7 +32,7 @@ struct ht_capab_ele {
 	u8	short_gi_40mhz:1;
 	u8	tx_stbc:1;
 	u8	rx_stbc:2;
-	u8	DelayBA:1;
+	u8	delay_ba:1;
 	u8	MaxAMSDUSize:1;
 	u8	DssCCk:1;
 	u8	PSMP:1;
diff --git a/drivers/staging/rtl8192e/rtl819x_HTProc.c b/drivers/staging/rtl8192e/rtl819x_HTProc.c
index 91c7415d5a2a..5c920a0089c9 100644
--- a/drivers/staging/rtl8192e/rtl819x_HTProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_HTProc.c
@@ -264,7 +264,7 @@ void ht_construct_capability_element(struct rtllib_device *ieee, u8 *pos_ht_cap,
 
 	cap_ele->tx_stbc			= 1;
 	cap_ele->rx_stbc			= 0;
-	cap_ele->DelayBA		= 0;
+	cap_ele->delay_ba		= 0;
 	cap_ele->MaxAMSDUSize = (MAX_RECEIVE_BUFFER_SIZE >= 7935) ? 1 : 0;
 	cap_ele->DssCCk = 1;
 	cap_ele->PSMP = 0;
-- 
2.30.2

