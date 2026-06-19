Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11ABF38F92A
	for <linux-staging@lists.linux.dev>; Fri, 19 Jun 2026 12:57:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781873861; cv=none; b=XtV0gJlJpsAtlHwzi0YMpB25clNBav39kD9zOBYAWujZrRADG06Z4gw9szGP6dKO0OmFQD4RVRWM4bn14RGALavbUYNVhl1j0HaIcRfTY6fsHmsd3MVk5e0kvhMw3XSdFMq/yN25EWCH4qkzlvIIr5bEPFNINxtZsbNR1hGbSCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781873861; c=relaxed/simple;
	bh=FPZif9a5GmTnm/62hnqfygACCCc8bn2pR6BVrs98zns=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HKYQhLoDe/lim1oGqLy3jIy2NGBfcSq5Qoy2Bd4JmkwEm4tBzG2OuzkBZ3/GkLXqes4RH17qKGGh9OnGnUrQ5oC5dYatmE2sYEAGIZedLWqXf4dcLcX+C5NRxBi115Me9g4yZZCvVg3/g0qG2IcoBIKTxO9YJ7UH1ovoef5EK/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jmu2I0ix; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jmu2I0ix"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2c132ac5ec2so23322725ad.1
        for <linux-staging@lists.linux.dev>; Fri, 19 Jun 2026 05:57:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781873856; x=1782478656; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=s1y2ZaxWX8Bc+DUJ39m/wzgx7kt+rtVLY75LVTT9X6w=;
        b=Jmu2I0ixiNVTKHpF6pSSApCTwzch9k+AzJ8Ttq8F6Ye3f29eVeq7+EeMLOV9oFqh7r
         0D395CvqiiIJmJerbtzlarNVvDRvllAZ41oKc4If8uu79y0bZTaiMGyixzb7UlvLbGlc
         yVHzAYqiZ/FadWo0Uez0KpbCav1c+yCjgiwZcJ6oDD5u6hsgiIib8qixxK8ieAiWMO4D
         v6UfNIhfpo8rTgmc/llN9wLvtpbRYhVYaJt3kHKa36qB9Qif0CbSUTRzgrTMxGdIps2n
         9qVFXyFZkzNAhwVqJhKPvl/aFXv6MUvVi1Yi3S9X62w+FFdQqEEPxrPVzfXOcXwOwAmu
         lmOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781873856; x=1782478656;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s1y2ZaxWX8Bc+DUJ39m/wzgx7kt+rtVLY75LVTT9X6w=;
        b=CQHmClhtbF+RXGlcL+IpxddNO0I0kMnnMf1eBm2guwLYu9TakrcQAXlOZ6whIzCw8N
         NW/sXhU5kYiF1TdgGdG6JV607NK12eL551wb8QzVoRVpzBZcI5knm+xTgolf2SpGsaxn
         zpt4HY012ghuIDh4Q+AN0wXB5q5b89alYClA07AVarXneE7hdo7QDr9ciI7/eEmDlkO0
         6m0oa6sMDNWOo2EThudTb+wmho2ZfcWyrXXTSJJR6YCyUtSST7FPCKE3djWHXx5RjBbc
         P2PHUnP4nxFCt9oFS6Ja3EazMXMy6l3Zi8sqLo7CgozcxyIo/Tqr4dqYrrg1Cb9wx2OY
         Bh9w==
X-Gm-Message-State: AOJu0YzSKTwKAJsI/ng9YYSfVoPjddA+OlXhP3eYKb0tXkXAnCL+d5cX
	TRri7SJp+0V3WgRhvjONK/+FqhKIENe03U1N2TYk3pG7AeFfNQLWN7fI
X-Gm-Gg: AfdE7cmfVngytS9Bjd/3jjz4AFIoplVDL7rBdp9ks1Wj1tCVwpwpLyVviAGrQMRVYFS
	NvZmelnaoo5+s7sNDk4OWQSAupX8qKf0ZtWNBtZAxvQ3+f4HHXcM4Av4bvSMQ5AdGAJv6AFFm7h
	TjdkPnf0cHEMwF4Z9c8nE7fIDhTEEJM+mOR3Jao2EHhcTERrBKzcORkJzKygk0SUfRc+n4dbPVW
	yXk5/lXxDhhw6a0gvLQkscziDZ+Zajn+N28M4IGI6PiYXKsMljyBFMIqK+4Sh4CAwH9U8H2MW0W
	C9Mkinvp/IhPp5kceYmpg+VQBDOMU/lQecV6JZNs4LMtj/u3DLs4oyml+Qg7zK4JDVNt0uLJMNU
	bDpvy1SYo7bToue8bjXhIdaB7L3lMSb3ZwgWrLlpwQaauTyxeEBJAkscO49gARSyOOXQjKmgoM0
	oZBe3M63n8jPagWz3cicMuTJsgjL/q4mYGUauuytdn
X-Received: by 2002:a17:902:f607:b0:2c2:27be:39a8 with SMTP id d9443c01a7336-2c718f45c53mr39622625ad.31.1781873855911;
        Fri, 19 Jun 2026 05:57:35 -0700 (PDT)
Received: from localhost.localdomain ([103.87.58.149])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c72089a6besm24338785ad.6.2026.06.19.05.57.33
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 19 Jun 2026 05:57:35 -0700 (PDT)
From: Devansh Soni <devanshsoni874@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Devansh Soni <devanshsoni874@gmail.com>
Subject: [PATCH] staging: rtl8723bs: fix missing unregister_netdev on sdio_alloc_irq failure
Date: Fri, 19 Jun 2026 18:27:24 +0530
Message-ID: <20260619125724.12458-1-devanshsoni874@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In rtw_drv_init(), if rtw_drv_register_netdev() succeeds but
sdio_alloc_irq() fails, the error path jumps to free_if1 and calls
rtw_sdio_if1_deinit(). However, rtw_sdio_if1_deinit() calls
rtw_free_netdev() without a preceding unregister_netdev(), freeing a
still-registered netdev but leaving stale sysfs entries behind.

Signed-off-by: Devansh Soni <devanshsoni874@gmail.com>
---
 drivers/staging/rtl8723bs/os_dep/sdio_intf.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
index d0feb28b7..6ddc08794 100644
--- a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
+++ b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
@@ -359,10 +359,13 @@ static int rtw_drv_init(
 
 	status = sdio_alloc_irq(dvobj);
 	if (status != _SUCCESS)
-		goto free_if1;
+		goto free_netdev;
 
 	status = _SUCCESS;
 
+free_netdev:
+	if (status != _SUCCESS)
+		rtw_unregister_netdevs(dvobj);
 free_if1:
 	if (status != _SUCCESS && if1)
 		rtw_sdio_if1_deinit(if1);
-- 
2.54.0

