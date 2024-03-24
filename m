Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A4DD1CD02;
	Sun, 24 Mar 2024 21:16:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711314984; cv=none; b=ACMwIUuMMpPxCCZnUn2sC+O8UdaCLRFVMVMyPcpgtI66uMMS6Ct9gwL9J3wBOnfqkFQkj0cXb34EJ0ExccUp+Q9jFMiySOkCjt2RyHA96c6IVUpdNzB6ZS7e7bmgRvJJx0Lz8XNGkl0GdxabIZpHL7qmlv2qfC/Y1rc5DxYwl/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711314984; c=relaxed/simple;
	bh=iyxLUF8voIIK/fK/5eHIb+b18lryX+ZiEkTFUpt2cJA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dA5uceBvKb5pJm6lWzDtA6RxoMc4BQUfUV1MY2pJ6XjjnhR4JVSewIIwmexrzrg2H7rk6s+LiEIBzqeh7Y23S3YALrMPo/9TAsMGR6gnekgk+4+PQNGUiYxkBV9V/xrG4BpCUWoJuuR2VUePca+l8ONaweYdk/uOZk9ApiRLUeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZuryRnrr; arc=none smtp.client-ip=209.85.160.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZuryRnrr"
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-229d01e81f1so1800031fac.2;
        Sun, 24 Mar 2024 14:16:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711314982; x=1711919782; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pln1HFj7xRGcjDqNNAdcybo1cDlWpEN/yYmJg/vxZWY=;
        b=ZuryRnrrMwJjk5sBYA2qk4gZo+rX6kMViMM4GlFeY/41MyyI2uYHRowkJqmOwC0i0b
         1G7Wtm9gn66vLqv1gqUndEH3yyPAUHAfaCunmddnzAlLa13VHER3GYpCxDDfElaZ2p8Y
         VNqEMcOHyARnPtaa0bGp/11ZFO8U38u2ipp0FkIsiW98ZLTE+ywEoN+r6E0+3Ch1joMj
         4c/+eqGnpXOPiasU6jqvyOhMa/RX0SAABa4vLvlKJA4JDoaACvYXD0tFbFDfkkNeexIh
         0cMpwAIikftvOy6RqxKTzJj19uzAADRFksYBV752s/IuYlNKfsMGiYWV7DGaxArO/fJQ
         u9LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711314982; x=1711919782;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pln1HFj7xRGcjDqNNAdcybo1cDlWpEN/yYmJg/vxZWY=;
        b=fETtiCGVxsDeLo3/dtiIg0fMUnFICQEPYAc0F1j3XzmVFVnXcceua7GlUhz9NCAOuS
         xJk0uVMVlyS/kFTDWGL/DuoGKMoKvIkgJFDKOWze617767mjIXuliZcfyBOrEKvDoO8s
         1Is9lI27Pj9/oMoEMS6P0j2e+l6pGf8z4Tn5kcVSogZTKBioc8OVaOxSN/yoEZdAhddc
         NRjd+gWHnxrfWf9wF1lN1yh1PrKMllDUId4RhlcEN8LPBF8nKTwo7pzox/FPnO6Vy7LV
         7lHAT28F/t6wlJIkC/UnrTDoRg513pZir8VjKloP+NhHfMGy8RVLmfUAEwpC0JrwFhJ4
         hWIQ==
X-Forwarded-Encrypted: i=1; AJvYcCWb/UEVBmlcp3lgntjdn0SFCirZMgbJKG94WAu2fvbug8ygvAqtgJ2VaDG4FJFhnoZFzgWpvqiZ4nUZTUrmn49cpmZPdYXDT43dun7Ocw==
X-Gm-Message-State: AOJu0Yxuf+Q2k3vaK/+IXktDFfFtPg7WjhmMi5nH6c/EbbK9Hwiw2if6
	sewd+ctqOGObPGhrjbnluM9KfVXu9/w7W1cqXfn5ds/CqH7KGnai
X-Google-Smtp-Source: AGHT+IGDb8h4GXS8FBNAQV+Y9fiLoMqubuSJuORQE1s3/Wcvji4vy/2U9keX2dUqcFA0d2WDa4JVSw==
X-Received: by 2002:a05:6870:944d:b0:21e:a839:d807 with SMTP id e13-20020a056870944d00b0021ea839d807mr6520463oal.54.1711314982451;
        Sun, 24 Mar 2024 14:16:22 -0700 (PDT)
Received: from ayush-HP-Pavilion-Gaming-Laptop-15-ec0xxx ([103.6.158.65])
        by smtp.gmail.com with ESMTPSA id j16-20020aa783d0000000b006e6b959b636sm3003077pfn.53.2024.03.24.14.16.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Mar 2024 14:16:22 -0700 (PDT)
Date: Mon, 25 Mar 2024 02:46:15 +0530
From: Ayush Tiwari <ayushtiw0110@gmail.com>
To: Larry.Finger@lwfinger.net, florian.c.schilhabel@googlemail.com,
	gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Cc: outreachy@lists.linux.dev
Subject: [PATCH] staging: rtl8712: Add space between operands and operator
Message-ID: <ZgCYHwYOmqfwMeU0@ayush-HP-Pavilion-Gaming-Laptop-15-ec0xxx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Add whitespace in union recvstat between operator '>>' and operands
'RXDESC_SIZE' and '2' to conform to common kernel coding style.

Signed-off-by: Ayush Tiwari <ayushtiw0110@gmail.com>
---
 drivers/staging/rtl8712/rtl8712_recv.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8712/rtl8712_recv.h b/drivers/staging/rtl8712/rtl8712_recv.h
index f4d20b0efd4e..a1360dcf91ce 100644
--- a/drivers/staging/rtl8712/rtl8712_recv.h
+++ b/drivers/staging/rtl8712/rtl8712_recv.h
@@ -82,7 +82,7 @@ struct phy_stat {
 
 union recvstat {
 	struct recv_stat recv_stat;
-	unsigned int value[RXDESC_SIZE>>2];
+	unsigned int value[RXDESC_SIZE >> 2];
 };
 
 struct recv_buf {
-- 
2.40.1

