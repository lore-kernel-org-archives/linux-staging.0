Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 096DD15B97E
	for <linux-staging@lists.linux.dev>; Wed, 28 Aug 2024 08:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724833784; cv=none; b=ZZT+Bkcpe9Uoc2OSBYChsEP1mfyWBrkjN2J1rImAAqW5dmLRFfdDZzRM1Ej9VeD4esJspD2T4dB2F0J9+Yo/6AcRRUSrZ0hijc+Vl7oplhOGvji+Ax8oCoz10YHf4Czn938fTfvObOqoLPk+ypHID0q9GTsd66emxXHbs1AIODA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724833784; c=relaxed/simple;
	bh=uhNkZ0lBAsyc3cDOoyPo/F8QbUBatGwuGsnXbGzykXc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=L0ssKSbhtd+eP6V8BB+lLcXLu3t0GG4G8aBGf9sXrw+iN0eS2EWRfajzf/SuoobHFaVpo9gP3IjVGnLkqzb7TvVHLfOslk+BlQ+Sh63vdqAsMigvS42SS1abX+O39aUrYXCNBylkZB1X1srhaQK7BWJYI+f+9nWgcwitZxY/sQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N0F5zP3O; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N0F5zP3O"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-428e0d18666so55178155e9.3
        for <linux-staging@lists.linux.dev>; Wed, 28 Aug 2024 01:29:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724833780; x=1725438580; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pvcMeJFbKMuFZL3nXutoA4s2bfUVybdtDR/sWYvStTc=;
        b=N0F5zP3OQCYsnwfML2VtFBN1vTP75q3wn70AsU6CX90n0X2EwlV15Bl+s5PVXRfBIh
         MIcif+CBDGZINuaqtHTlNtn0NRMxz6Qx3QQndDdVZTQ5IQUUvERxVYyVNw9unSYYXSMe
         0abKDRvkxT34u1kclBm3xraHuLPDBRiTZMBlX3xAAhI4jdF0jJ15HwmU7i2MxyJz5Klq
         nvTYu1u2HQaNhJTUgIqnIhZB4jxsPY1WNn6L0l2fgqmJd/+izWnpFt+TyleqcQqqxGut
         Ac7Fjqjuzoo3hPjQUO/vl0wXm/79JmIwbYmfM/pepG68PxcxrqJLWCi1EWCjGlrwHnn9
         dLKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724833780; x=1725438580;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pvcMeJFbKMuFZL3nXutoA4s2bfUVybdtDR/sWYvStTc=;
        b=J3zQ7jzI+f1aS1Qxo2lPO37Wmi9XVmVcP+14pv7hCinnQTd/nzjSktGojrVsGLkMz+
         NsNG8Lovou3bhcARWGlc3afZfadShkcVhp6dwm+Mfdf8vPwrVFCz37mS7DBjt9c6btEp
         Gi5iGfnD0Sbd2dDPAIzIIT8AIPkSORwBMDUuKRabTSovQHGxEgPISkD7cv+OdC2ZMcyo
         nogPOyxfWnvALluhyq9MklGPEAQZb/p2jUjBJRA5KLPlDdYY/yJf4yOlfkofh+Yr0YTt
         E841XAiGD9+5J/0gEV5Ftb/EOZMjB6NhaPAP+OaCTSbglLPKa0VrvMKgGHJ60rt2x1BM
         oj7Q==
X-Forwarded-Encrypted: i=1; AJvYcCWUgjxE9ImmNQz5UaaED4lYCKgcx2ghUnVANjIwVTedbV42ZJInhaXL1+zm6XtQhRcDgxuzi4myEuhGI4Ur@lists.linux.dev
X-Gm-Message-State: AOJu0YxrJwKcIym0lJD5Zrn/+GXBjpMx7evQDrGnn67MyA4m7nDrmZiZ
	WG8sP8RZRIUiXi1NcQ3smniVWFKol8NAugYc5kcYjdmumhQlkpos
X-Google-Smtp-Source: AGHT+IHVVH9UifSJuuuzModwoYJ0FaxTRNIZhkKgKp+ZN08nuyWn/uBexI6EOZZh9tWjpN0i7avN8Q==
X-Received: by 2002:adf:f046:0:b0:373:549:bf4 with SMTP id ffacd0b85a97d-3749685ba5amr716206f8f.63.1724833779726;
        Wed, 28 Aug 2024 01:29:39 -0700 (PDT)
Received: from ubuntu-focal ([197.237.50.252])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3730814602asm14991263f8f.44.2024.08.28.01.29.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Aug 2024 01:29:39 -0700 (PDT)
Date: Wed, 28 Aug 2024 08:29:35 +0000
From: Dorine Tipo <dorine.a.tipo@gmail.com>
To: Florian Schilhabel <florian.c.schilhabel@googlemail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: Philipp Hortmann <philipp.g.hortmann@gmail.com>
Subject: [PATCH v2] staging: rtl8712: Align parenthesis in usb_ops_linux.c
Message-ID: <20240828082935.GA3815@ubuntu-focal>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Fix the parenthesis alignment in r8712_read_port() function to match
the opening parenthesis.
This improves code readability and adheres to the kernel coding style.

Signed-off-by: Dorine Tipo <dorine.a.tipo@gmail.com>
---
Changelog:
V2: Edited the subject line to fix a typo and make it more unique as
    suggested by Philipp.
    Edited the description to include the reason for the change.

 drivers/staging/rtl8712/usb_ops_linux.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8712/usb_ops_linux.c b/drivers/staging/rtl8712/usb_ops_linux.c
index 0a3451cdc8a1..4a34824830e3 100644
--- a/drivers/staging/rtl8712/usb_ops_linux.c
+++ b/drivers/staging/rtl8712/usb_ops_linux.c
@@ -221,7 +221,7 @@ static void r8712_usb_read_port_complete(struct urb *purb)
 			fallthrough;
 		case -EPROTO:
 			r8712_read_port(padapter, precvpriv->ff_hwaddr, 0,
-				  (unsigned char *)precvbuf);
+					(unsigned char *)precvbuf);
 			break;
 		case -EINPROGRESS:
 			netdev_err(padapter->pnetdev, "ERROR: URB IS IN PROGRESS!\n");
--
2.25.1

