Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B077C19D092
	for <linux-staging@lists.linux.dev>; Tue, 13 Jan 2026 09:17:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768295850; cv=none; b=PH1uzpBqNzNTgaciUTkKtbAZMj+e2jMpZV4UUQJThLKGgbUVgYYd9YfS2c8+8aBiONVdWZkkd9vq0hYVNS6mVWNbTfeuYr4TuA9/pWlKVRlC82zD7Pg4DYcXxAwOIj1qQBHPtNCNIFyVrZEGU6vQldExtydJRNNT5wWSsAjg4wI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768295850; c=relaxed/simple;
	bh=E+wfJcZGJdK6QfKjyz1IJJ0cPjpMCp0NwhM7vXTRz8o=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=N36+DiqpGeM6ZkLE9z7dmpE188wPI8uRVQSaQWD9O04oM/+d3Z9xAGLe5qRWNH9AA8lD32SfpjmjSXEzHZPQBD3D1bdAbuIUc5CrNkfm0qVGk/2edsr8L2sL47CgXw7AMTpmpsPT1NwtLfxkcD48EeiPWxs8BXOw3CVXqjced3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iRFhYfvz; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iRFhYfvz"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-29f0f875bc5so58808405ad.3
        for <linux-staging@lists.linux.dev>; Tue, 13 Jan 2026 01:17:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768295841; x=1768900641; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qa6NYnXV3NvYor1DrfwDviDH4N8nNgCdaNdsoRGJ8YM=;
        b=iRFhYfvz5IG1WjMA1qSGLG1UeX2vw7FgmrWRJTV/QCoiutTQQ8PRe899Wf1O8i+Id2
         pBbg0c9aWxaTi3BERG51sjmaHSUu1f/0QyFsGGPQftn61Ixo5qOKIjwRKNWx1ycP6oUG
         siGqjny8vCzUcIpghx0GvaMMtQ6v+JHsAC2/ldgX2LvaxG/RUgBwyQ0triFDUfrawmjO
         31TkPSlEDmH4IDVN4ixF4TtvqfSW2L9JCxU7uCgJkcMiMFmGIJ5mulT0Lu9mASckz/Wf
         JlNQGF5w6w8vzjUJHaE26X2Tisqu/E0TXASwcoyXWgNQvxj5T+VwrS3lbSAaNMzkNEaY
         Kx3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768295841; x=1768900641;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qa6NYnXV3NvYor1DrfwDviDH4N8nNgCdaNdsoRGJ8YM=;
        b=hOy2ih/kN9QpMScCP+bidclPh7HZSwe7vQfzBKJBGcCAxbJWDKtjBzpMksMeb+dOKh
         rBqwXrPbNuDNOKVMVFEjrY43YhzMoUicjR9cgTuX1W7EwgyyIKX6TcWmwo3T5MStYbO5
         jN0496tJk5gUBUiGpkswcYU0gnOn6tUqomrEHEwMwsf/7fon4OlXPi9xS0W17mttzo36
         sNB5ffzI1YjzQ+A/L84q+XTvd3mzqsF4mXc1mGEWxn279kUyyxuMiTYr3w/+0AaosFdu
         n64KYxvDJK6q87OTr9FQnEDLDmhYjfEX8QUvSeNpm1AIZHlqu3Ox9te5SZWj6ZTC04SY
         FIQQ==
X-Forwarded-Encrypted: i=1; AJvYcCXB9JcnYkL4HpWdl1N/LmaQ/DbvO6/ixd1Q8KhXFsNCM0k69lijlokrYQnJE6bQw7bf0jTFyzcw0T5Bqnri@lists.linux.dev
X-Gm-Message-State: AOJu0Yz8iynrP12JLou+yuTkQ/5hjR4XaLgcev35dG+DEQJ5JYXoL4cB
	hm30n8vIEvEifOmqE2o8Ao5kanqeoFqkT0WnhFkMy11IAjBOmXCOQsvn
X-Gm-Gg: AY/fxX7zPf7PJhE9GAEikHhzy81xAimjoJbkNxu1wKGaWj5w0EHtO8sIhhxSKQwdJ0A
	4TimdyE/FVh+kGOtWunVEWGSuwDQhu4GC/xUfUacKLxdJRTsrwuXyL6q8rffA9zvaaABUQCxZvg
	Nqt9RBbKEFXDuY2DBt95zw62/jaIpobUGjosRW8P+LYmgw+oZqU01yWozgSYTQqMdJ951QXD3GG
	oYfb1Zh0w87AuRF8z4QPM/vPaYYcQj1jrJ5RMmd1rFV5y0x4ke++PRIx69fZNycKxDjMINC9A2b
	omfSEk0ko2hW2yiws5XME8AAjgyMR1p6CmqZ0QAF2YcLVKNn4Xjtob9IylNLiM01xIgNVBEaey9
	HCl0qKewT84Ykf+LOP13ElI6ZA/8hIvYu+rMNSCQ7ZL7Cq+qJ2UTOx4OhZTWN4JaSouzO8/RD/+
	G+Vsr/sNkL5iVHwvahRA==
X-Google-Smtp-Source: AGHT+IEnFU9ripXqr598k0bfBOY9trp4jo4m2JUaPS7RAbq9LpovUrVczYKBCnkZdNe0qnO4UGFq5A==
X-Received: by 2002:a17:902:c40c:b0:29e:bf7b:7f36 with SMTP id d9443c01a7336-2a3ee51f97dmr167454005ad.58.1768295841199;
        Tue, 13 Jan 2026 01:17:21 -0800 (PST)
Received: from diksha-pc.. ([2409:40f2:213b:f708:8c26:ab29:8307:fed8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3c48be5sm197436945ad.30.2026.01.13.01.17.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 01:17:20 -0800 (PST)
From: Diksha Kumari <dikshakdevgan@gmail.com>
To: gregkh@linuxfoundation.org,
	johannes.berg@intel.com,
	straube.linux@gmail.com,
	knavaneeth786@gmail.com,
	dan.carpenter@linaro.org,
	quic_rdevanat@quicinc.com,
	arend.vanspriel@broadcom.com,
	linux-staging@lists.linux.dev
Cc: Diksha Kumari <dikshakdevgan@gmail.com>
Subject: [PATCH] rtl8723bs: fix memory leak on failure path
Date: Tue, 13 Jan 2026 14:47:12 +0530
Message-Id: <20260113091712.7071-1-dikshakdevgan@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

cfg80211_inform_bss_frame() may return NULL on failure. In that case,
the allocated buffer 'buf' is not freed and the function returns early,
leading to potential memory leak.
Fix this by ensuring that 'buf' is freed on both success and failure paths.

Signed-off-by: Diksha Kumari <dikshakdevgan@gmail.com>
---
 drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
index 60edeae1cffe..476ab055e53e 100644
--- a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
+++ b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
@@ -315,9 +315,10 @@ struct cfg80211_bss *rtw_cfg80211_inform_bss(struct adapter *padapter, struct wl
 					len, notify_signal, GFP_ATOMIC);
 
 	if (unlikely(!bss))
-		goto exit;
+		goto free_buf;
 
 	cfg80211_put_bss(wiphy, bss);
+free_buf:
 	kfree(buf);
 
 exit:
-- 
2.34.1

