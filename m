Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792960026;
	b=GGOXHzwhuXBCPBBPAZDw8zwsP1G2XKOiRTrSgkaTmxaLc1/nQ4GLvoJaF5Tx02lFtVVY
	 b/nhO/Se2p1irZTjGzlS50zvWnKsq8S8UDPRtHxxLx79pUud6W/vB+Jpj2i/NkDSU181x
	 Ia0uHjV+By90RokisfG3SORtABz52YPIGzxEsnzM4SJXofBL65gl+jqhRxjZnumqYfn8C
	 DyxILgq4wNgbhTCXmPanjxMqqwXQ0cd/P8A5rABfo48GCsfMSpN3BpLgOaOlgDvh7vsqN
	 fxW4NkaNhwFthiJ0AXXWghFuXd78hR+nPdp/CJBsRmzGyl0J7WLQu2RgxPVurvhVKLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792960026;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=8sYUmjJXh+5g9W9rBcPWe/gvdOEiK2sbnLcw/CdbTc8=;
	b=vFiJVrsNpkrUEanTs5WjMad8L5Cwwu3k0lSk1zJgOoSmh6W4p3jGru6UXUzuOFKejJ/H
	 rzZSwMnBeM+6vx51dELgFCjeM9PktZ+yuwLVKlmxWNYFxTMq/QOgVO3DTFuWNyGoVQX2s
	 YODUiYrZghWA0G61wf69of2ggzCWj9FGsyh0GIv9AoXfTEkyh+oSTpmXdpvHuqeV8tKz/
	 qS/8oZgniUCUlTLFlfThtxxQKzfjOvpZERgKmWJP40mWc6ODmFR4m90NFKB5erzWyQDBo
	 SWiyOZ1XGOtBYD5FbIT0YMoHqC9qu2LMKGLZ6yCG+Pw8HEEh4POyqLV1z+MaPzolhoQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=bbVxMn9b;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BB42606A31A
	for <linux-staging@lists.linux.dev>; Sun, 25 Oct 2026 20:27:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3BB42606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=bbVxMn9b
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a5177d78c7so6571455e9.2
        for <linux-staging@lists.linux.dev>; Sun, 25 Oct 2026 13:27:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792960025; x=1793564825; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8sYUmjJXh+5g9W9rBcPWe/gvdOEiK2sbnLcw/CdbTc8=;
        b=bbVxMn9bskazV4m4URRzJCw9ehYrhu2Gx7HO882CiUyMGZ7OzgtgusT5x+GWx9IB/U
         qDGqwZjVpzutLOYRA93Gz43t8ZJFiYgF2d+GLlRM0Wv6Uh07H2O+G/+07Y/w49zUri7T
         bKWXbNWL8s/UIBhvfydnKLqIzsTw6MAB3A63GHtgOW+Kkdh8nX9RDnX2Q2DBXdVwtpNK
         JhozcqnSa2Rbk4NqCybWY8+I2W7O4HY/UvzitVOkR59P3Uxnr2CQJ5YGQT8ssoiCDBtq
         eeXf054pSkclu+kJzmpTJG7LldIsIZaPWqIuW5MnfUm5gV0E7W9EkDNAfCGJPbkPyiDV
         HiIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792960025; x=1793564825;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8sYUmjJXh+5g9W9rBcPWe/gvdOEiK2sbnLcw/CdbTc8=;
        b=fsUH34EI7WxHSdD6b2c3eiuYhMSQADv7nlmoE2u5Vt0GRccswJOwyCyYNM/Jjyju7K
         O9+SoCELV45rtV32asQ4aLp1nIyQQNgV3QP1mi06w5e5etJCxtlSXi49npV1F/EOlRL8
         lLQEyzdVVNjbJPFSLDk1YUEBpl/Tj32GHAo8jWlgsjBi1uSoE1Bv2y/LnP1AKGwpx2Ma
         vkJiaIFxIpNuZ7HP6Km/G/NyGq5Rp4e/6+tSSj3agqaA08dgjXWBltA82bRDlIN6OvVA
         i1iySxIqE3WZRL6oUwJpl8gFsbNgVrKr8fxv1ZUITs06mzOxiov18O2LY7Zacw0p0MPm
         vjCQ==
X-Forwarded-Encrypted: i=1; AKwUvByELpsXtqoQg21slSFgYKHZIPGRmx3+T3Ji1foCXrqK0VX7AktNIrv6MUC2FbMoPcyfYB8i+L17G2O7Wi5Q@lists.linux.dev
X-Gm-Message-State: AFq9FYILSNuJotEqY9LqOaxuYZlNCT5c8f7A7ggnp0LLJX9hcIRNYvVI
	1A8diyDW9vCbUqqaQH/2D5hiMZ42wRe3nCobBjUKLqJAWVWRtiHPKcCE
X-Gm-Gg: AYBFou0a8klaTx+PnMQebavYlDzZuDQHES9VDSlljs743VJO2JdN0aiYX9aM4/xorzT
	aA0hzgEabdgUO3ULhRAEjP4Bg+k2np12q3zcteDNvXbanMCcgoKw3VyWD/qwZchvfnuxitMYQ9o
	zlqiuoMFfl4KQbohgVcRnVYEycdcUbTBeyxO0yJFXiswqJuq5dH9JCPfiZFjJzusUw18tp+rDzl
	dJVd2VA5BZEvOrduF1db4Aqxul9w1sv550sE/36jLgr/5F5vhXCLsivTIMKFiPlVZKNAjvCBoq+
	QpYOej0WFSb5TQrgXZgV+IA3nTakC7jZ/UOMfPnYeEyodnIfnBJZjYrvYF2TxkhzH8peILAHA1u
	6cynCJ7++if/XKyNIPkd5WF4GncdDnna4a76Iorl3sMkqtYbM/lkPUHfJaMB1pzTc+5HQbc9apz
	39kplBz9meVfTGmpCEa+IO4P8CicwHzkvfDLG6TMqh0St+DX2C2kCpzScdQrzxAcSgMdUr8FNE1
	plQpxj9hwe9CoJCNQAy9Njk5IXWCicWcg321b2H1syzIiWR0nVSyAlW37nHfJiu6oyqiaVsC0vF
	pAD/3OhFooey9urdqg==
X-Received: by 2002:a05:600c:870f:b0:4a1:f7f4:7ced with SMTP id 5b1f17b1804b1-4a35ac9d1cdmr82312895e9.17.1792960024499;
        Sun, 25 Oct 2026 13:27:04 -0700 (PDT)
Received: from Ubuntu-vm ([115.186.50.139])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a574088sm129197415e9.9.2026.10.25.13.27.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 13:27:03 -0700 (PDT)
From: Haasham Khan <haasham93@gmail.com>
To: sudipm.mukherjee@gmail.com
Cc: teddy.wang@siliconmotion.com,
	gregkh@linuxfoundation.org,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Haasham Khan <haasham93@gmail.com>
Subject: [PATCH] staging: sm750fb: remove unnecessary goto
Date: Sun, 25 Oct 2026 20:26:37 +0000
Message-ID: <20261025202637.9274-1-haasham93@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The goto exit statement jumps directly to the following label.
Remove the unnecessary jump and label, and simplify the conditional
block.

Signed-off-by: Haasham Khan <haasham93@gmail.com>
---
 drivers/staging/sm750fb/sm750.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
index 21e310274330..66b015959963 100644
--- a/drivers/staging/sm750fb/sm750.c
+++ b/drivers/staging/sm750fb/sm750.c
@@ -815,12 +815,9 @@ static int lynxfb_set_fbinfo(struct fb_info *info, int index)
 	var->vmode = FB_VMODE_NONINTERLACED;
 
 	ret = fb_alloc_cmap(&info->cmap, 256, 0);
-	if (ret < 0) {
+	if (ret < 0)
 		dev_err(info->device, "Could not allocate memory for cmap.\n");
-		goto exit;
-	}
 
-exit:
 	lynxfb_ops_check_var(var, info);
 	return ret;
 }
-- 
2.53.0

