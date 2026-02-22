Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 838543D3B3
	for <linux-staging@lists.linux.dev>; Sun, 22 Feb 2026 16:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771777229; cv=none; b=bSg4Ph+56inzGmNZho5juIOkZfP1oBm2NmX0raqESCt3GwfL6filsTHCpY8Gp8MwD7mHFC5rzAOpwjhCZUKysi5JTxc81LPReFLwXT8ughZEDpn1NQjRc3jJJJV9Kw+M7CM7uTtnUrPKzNWgFZKc20kkRFUsS2c+NPlOH7LkkWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771777229; c=relaxed/simple;
	bh=TVePKVhcNt1sYB/roJM4/1jkFdQJDcSnQGUpQyKqL0M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WUI2WohQhndPxncodJDqI9xu8AR9yfmwFrl0njaiw8EWh/K15g/vblV7nfR86Tg8Bjy1TKKoQcXheN7/YzFGa6keQhr2tr3Xxn0H28IQULiSiaJferOaxoTms5JWYjolBh67DObXbQTz2B2i1YPNhDxDUiwDulsOD8j7c4Y3970=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lYhYwXEv; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lYhYwXEv"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4836f363ad2so39815505e9.1
        for <linux-staging@lists.linux.dev>; Sun, 22 Feb 2026 08:20:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771777226; x=1772382026; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DUcLbKzbA4O0DsStoB54bzwOlujfRqPDW4abvRBH3YA=;
        b=lYhYwXEvB6SJ4gF+AxC0CvMXk8N7NtyMHKxF3uae5DaKRVSYcEGv98W1dlTYgqyf9B
         hgaTT99NSeU3ewalQUcVAPBZkYzNpsBj97SCjv9CdArpAdk7Lhj8Mh0BpnWICYjPWQse
         qH5qlZlDUrOhogZku0RzF3Yfx0psAxb/8+fLXZ9Szg5fhfkGu0iIkpMswousFtcHhb+E
         BRC7Co4WAkQEHACzJQ+BeOtVCPDpOEQWjQ6HlGuRmu4bUVN73cX/VUV3/6yNHI2npQnh
         zp2ST0ef847LSnldZdInOVkSeWwwTwzb9kppa7hjlV2t/qfJqv56Yew8ygelBoO/rlAA
         eWHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771777226; x=1772382026;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DUcLbKzbA4O0DsStoB54bzwOlujfRqPDW4abvRBH3YA=;
        b=RYQjpGvorC2ymeN/hslwkeIWjVZ6/R9Z4TRfuBf8VBQ+gzVHflrOmluyfOB3lKqhud
         O4wMXf4ubz5JlH6La+Z4v2i0UBaL3SnFUAyG50TWZyDNBU/atNZF1NpK482nmimjG6eA
         /ZNwTILw4FaHeDtcmVsTmjMCT1PyN8tYeN02ZJO7OJLCdwQpSJPhTVZbmJMeLZtbNSLO
         xitV7R6Jk2P4exLQzPtBVMP5JB9P4tXTk+SVx59JRhlrx02iyLCpV7Hfj3Jx4r1DwTuk
         1otN4nDu/WFAvkL0aDpoQxrhkx5uZ1Pef+duXLFOmMcy798Aob45VnYipMcWPlshEVrI
         d/aA==
X-Forwarded-Encrypted: i=1; AJvYcCW93Lm3gg3lLQkNfllWjqz/HSc8KZbiE65wJZWTiMOxh6bmyKKaQLCWTpq872YUh1ny+cpLfB14QjG+gIWy@lists.linux.dev
X-Gm-Message-State: AOJu0YyQWCJ/9DGaZQN26myc3aIiwwvtdSxPZMqJKZ/gyXbuhgo7+vJ8
	x7uXDhGQeScjJ4F5a0EpHG5dH03aNeRRJJzJFUi5CBvQBPsr/6V+n4UZ
X-Gm-Gg: AZuq6aI0ErwOC8kPOpXvfJgsSdoLdeGkeGp4wdY1i0RRl5qAfF1jqoo/88gPpBqEj1/
	/2XWNreANGxYzVvgOBv6KU136XyhpItXD/d/6mh7pFZwJngTDoVH/KPMqxuHdVbQhm0VRDSQEvV
	uUEB8ewhpPWSYYRgwxX5FPjCh7vulvA9VNxVhXRK909CBZIP1iptApXYFPAHbmBpktFgR/MuEm9
	OTFj1g8SLe3YoqTOZandxRiEbLkhvhIePFMpRhbXoiCvIQCPJEG13EsvRp+TEPpibXARrG5SZfp
	hEuZiv02I//FSWXv4owXvPn9tbRxDtUoZJnNW+MSO7XMCblntns8v4rUVeowk0hXtdSBIjM8saJ
	Rwqhw9peQzWjIuiEVbNxciptKxtU0EkX+CDQ9A2wkXKPc45j6i+KtH8aXA4J9jFwpkYDJGjT8KC
	JQLqNMMg/BS60sgiWB6eBMDoITk8NImItojlOQcY6yuGmgZo1VOYvm
X-Received: by 2002:a05:600c:608f:b0:480:32da:f338 with SMTP id 5b1f17b1804b1-483a95bea87mr108090575e9.14.1771777225707;
        Sun, 22 Feb 2026 08:20:25 -0800 (PST)
Received: from mariyam-Latitude-5310.. ([39.37.133.239])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970c00485sm14441938f8f.9.2026.02.22.08.20.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Feb 2026 08:20:25 -0800 (PST)
From: Mariyam Shahid <mariyam.shahid135@gmail.com>
To: gregkh@linuxfoundation.org
Cc: straube.linux@gmail.com,
	dan.carpenter@linaro.org,
	ethantidmore06@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Mariyam Shahid <mariyam.shahid135@gmail.com>
Subject: [PATCH v4] staging: rtl8723bs: Replace kzalloc with kzalloc_obj
Date: Sun, 22 Feb 2026 21:20:18 +0500
Message-ID: <20260222162018.4744-1-mariyam.shahid135@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260221111003.11339-1-mariyam.shahid135@gmail.com>
References: <20260221111003.11339-1-mariyam.shahid135@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace kzalloc() using sizeof(*ptr) with kzalloc_obj()
to fix respective checkpatch warnings.

Reviewed-by: Ethan Tidmore <ethantidmore06@gmail.com>
Signed-off-by: Mariyam Shahid <mariyam.shahid135@gmail.com>
---

v4: added changelog
v3: rebased on staging-next, kzalloc_obj now available in this tree
v2: switched to kzalloc_obj as suggested by Dan Carpenter
v1: initial submission

 drivers/staging/rtl8723bs/core/rtw_mlme.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index 22dc36e8e38a..1bc90fa48d36 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -1875,13 +1875,13 @@ signed int rtw_set_auth(struct adapter *adapter, struct security_priv *psecurity
 	struct	cmd_priv *pcmdpriv = &adapter->cmdpriv;
 	signed int		res = _SUCCESS;
 
-	pcmd = kzalloc(sizeof(*pcmd), GFP_KERNEL);
+	pcmd = kzalloc_obj(*pcmd, GFP_KERNEL);
 	if (!pcmd) {
 		res = _FAIL;  /* try again */
 		goto exit;
 	}
 
-	psetauthparm = kzalloc(sizeof(*psetauthparm), GFP_KERNEL);
+	psetauthparm = kzalloc_obj(*psetauthparm, GFP_KERNEL);
 	if (!psetauthparm) {
 		kfree(pcmd);
 		res = _FAIL;
@@ -1912,7 +1912,7 @@ signed int rtw_set_key(struct adapter *adapter, struct security_priv *psecurityp
 	struct cmd_priv *pcmdpriv = &adapter->cmdpriv;
 	signed int	res = _SUCCESS;
 
-	psetkeyparm = kzalloc(sizeof(*psetkeyparm), GFP_KERNEL);
+	psetkeyparm = kzalloc_obj(*psetkeyparm, GFP_KERNEL);
 	if (!psetkeyparm) {
 		res = _FAIL;
 		goto exit;
@@ -1954,7 +1954,7 @@ signed int rtw_set_key(struct adapter *adapter, struct security_priv *psecurityp
 	}
 
 	if (enqueue) {
-		pcmd = kzalloc(sizeof(*pcmd), GFP_KERNEL);
+		pcmd = kzalloc_obj(*pcmd, GFP_KERNEL);
 		if (!pcmd) {
 			kfree(psetkeyparm);
 			res = _FAIL;  /* try again */
-- 
2.43.0

