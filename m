Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A243539ACC
	for <linux-staging@lists.linux.dev>; Sun,  5 Jan 2025 17:49:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736099385; cv=none; b=RcqfTS8XU1czhwWwTXhEc3SJWO8BzeMxqgJ94kTFvLf10gar1PWtDk8U+LR/I06BPj05Qh8eRbkcDl7TFdPhkdo5m3S49bPNmS0lMHLL6Kq2JMwaEW874NgEQ/n08iMH4DGSKqWNoK3fnTDcAHujRylnVJy2c96jYVom8abFdwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736099385; c=relaxed/simple;
	bh=WrEfCQVxDZO4swQLEbXa5Ld0i35i6BUungRLjvDn0Qk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=G0WPY9FyvbfOgOsRLpWMe6yf1Mubtlmmes/2ajHizS61VmukxU+wvItUOzL363cbtibKwZj3Hyx0E0KENtl4GqKgyrrJS5Y4jjevp/NF7UBYzHje9D55+GFyxIjuhZe2+MQGfJ1cdXWRQ0xJFrdd+pTgT7X8SrvyyUSeB3qYBug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gacRZoO5; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gacRZoO5"
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-6dd1962a75bso101680636d6.3
        for <linux-staging@lists.linux.dev>; Sun, 05 Jan 2025 09:49:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736099381; x=1736704181; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Tb0Xiqlp+6RGByGsrR2ucX9Rr3Ty6tkGl7t5YNTWkR0=;
        b=gacRZoO5Zs5jaKYOUH/FrSIH6eH1Yz0XsSikSETLqvUWZ9Wxj/PFuQKdOsd+bhlnRC
         hJDjNemmvtpQwvn5SYehZ/iQgbYWSMpqXVUJuNs9ZmZ23zo0hCdeamO1fEJd9chzbZ4p
         5+I1NUUEK8pOvTZMYUA72M1ni5uA77epee0lzYjM5u9nWCJs4YuISjaow52gSjW2hrFm
         yvp8dM0D2zXURUCjpTmsCWJHwkR1fsLk66kBJQxXPaeKLsw5p+LHfJrqUYK6RA3USYCt
         HuJduf3YQkytI5y9tLRuaCTst2c8sXulYXSaMjmSRTLERZWSYa939cLn+XQ5jRvf381i
         VwXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736099381; x=1736704181;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Tb0Xiqlp+6RGByGsrR2ucX9Rr3Ty6tkGl7t5YNTWkR0=;
        b=dc3UspiCgkQ6BJm2KGdD7hapQ1989R2Y+Wu6PfJDJfkHACnoRSNgN9UCcpZEj4JdjR
         wTOmzhqaNp9VNSkVOSWsZ4eHiYQXCSWY/wUld8cx4cRm3oduFWkMPcW3YLjWSZGleADF
         HdZlNxT4snJKaxYEeq6QAh3PiUcUz414Md2aFL2G0U3jldUMHDMn7vW7OhFhLT/avQHk
         uspGmytQAVXDL5jw+UogfA2QCyUjtbuw/og0DQFcpOVd3km/LxGBvh9sx6t3FAILNJQg
         I5Z/5pv1+oaD8M1YTJy7UQ6yAsOSOUI7C0WZody3xBZwkIxt1VXC5r8HGcla53GWIFgP
         FY3A==
X-Gm-Message-State: AOJu0YwqSqU2lzd0NNevyhgkegzBCnqlAImY5RO1dwgOA1l/5zNfRmuA
	vmZnYIpwoiPWSXe9PQu/dXS5QBbfBRnw+xhTKvXtlAmoBl5pomXt8jDg7bCJvb8=
X-Gm-Gg: ASbGnctNSm1JugdRzMiVjv6MCHLbr1BEJNursMuy7Rw+b2hcGOEfnn74to3Doutpuj4
	b8NIrIbSnmAfFT6DhUFwxuT1bAVlTwAbxmlgx0Vm5fVhciEKL34kfmnd9wRjPZNy16MZDgguB48
	3MqcJMi/RODS42W4KobSefS1SoOJwhO4Dt5pRbrF7RdpNW31RHRQAHWVXuDhMO4cnSyiGQ3pARr
	7mH9J3FZIsb1UlJzcnUR+jq/oC39G6jLm3M2DMs1B255J/mK3fRaxjTXz8w
X-Google-Smtp-Source: AGHT+IEK/t/nz2KgUo040p7w2hO8sV8PIe1vJpZl1lY19fd7DoVijkBNfhL8QGW5MGVben+mlIjsOg==
X-Received: by 2002:a05:6214:b6e:b0:6d4:36ff:4356 with SMTP id 6a1803df08f44-6dd2334645fmr955404406d6.19.1736099381595;
        Sun, 05 Jan 2025 09:49:41 -0800 (PST)
Received: from localhost ([104.28.203.246])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6dd18137373sm161582886d6.64.2025.01.05.09.49.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jan 2025 09:49:40 -0800 (PST)
From: Sandeep Salwan <salwansandeep5@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Sandeep Salwan <salwansandeep5@gmail.com>
Subject: [PATCH] staging: fbtft: Remove unnecessary parentheses in fbtft-core.c
Date: Sun,  5 Jan 2025 12:49:37 -0500
Message-ID: <20250105174937.71423-1-salwansandeep5@gmail.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This patch removes unnecessary parentheses around the conditional checks (!txbuflen) and (bpp > 8) in fbtft-core.c. According to the kernel coding style, reducing superfluous parentheses makes the code more readable and straightforward. There are no functional changes; it’s purely a cleanup to align the code with kernel style guidelines.

Signed-off-by: Sandeep Salwan <salwansandeep5@gmail.com>
---
 drivers/staging/fbtft/fbtft-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/fbtft/fbtft-core.c b/drivers/staging/fbtft/fbtft-core.c
index 4cfa494243b9..b4e9d6000b9a 100644
--- a/drivers/staging/fbtft/fbtft-core.c
+++ b/drivers/staging/fbtft/fbtft-core.c
@@ -664,7 +664,7 @@ struct fb_info *fbtft_framebuffer_alloc(struct fbtft_display *display,
 		txbuflen = 0;
 
 #ifdef __LITTLE_ENDIAN
-	if ((!txbuflen) && (bpp > 8))
+	if (!txbuflen && bpp > 8)
 		txbuflen = PAGE_SIZE; /* need buffer for byteswapping */
 #endif
 
-- 
2.47.1

