Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AAFC13A25F
	for <linux-staging@lists.linux.dev>; Wed, 24 Jan 2024 22:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706136308; cv=none; b=TluhMH6323XcTLlmj8plhT/i1EDj5PUetVs7NMpRq5sdLVHWtEfp33OdLG20XYBqk4f6eGjPGVUTUB4sHl33//xZeLy0etlznvcArL45bnKnrbJm5iJJ2MqR+5yBLx+fwhHyagVXHUhcKOVzwF3RtbsmC8LXI03d3x8YlIYIxzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706136308; c=relaxed/simple;
	bh=O4oUVRv6jqrt3whAsGKLEujAtFvYsKLoccgExo0bZ84=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=dHob04BcCFZQZu032xUPJJhmahY8tm5pDKPrhI0i/XZmgiwNt3kYqX2c1ZQ57qifnoAc8IgvJYbq7WDeVaZ48+JkX7Flf5pgU6NpTKiSfxZoe8BEhAF2QEbYd3ymQj9ULtvb3TehFH2vFlSe8+EBGkjRiaLJ+MBWRKxwtwBT55E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=lY3ugsP4; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="lY3ugsP4"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-5cf450eba00so4911620a12.0
        for <linux-staging@lists.linux.dev>; Wed, 24 Jan 2024 14:45:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1706136305; x=1706741105; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sQPFmmirFE8/ufGIcphQo/87vvOYqOFWOKLJtYmivTY=;
        b=lY3ugsP49NpyiuNy3E/460Uapki8HYVnCq8WkCwuDwrIuZ3yVQBymV8J3DMsrTWaMN
         c+ttsmqxFyL7UiBpYYRHfm5NqNflJa6bd9Hu421WMG8VyqUc0UBe5Hk2WQw2wG2KbGyn
         LuLvMKWzzdDhVhbfkyjQbB197S/GHkapd/bkm/c4n9PaqGgofmsnGu+3Wwk7WV/xgoHu
         xgog0e3gOpCPFtrtoeY67Ck8vIxwvL0c2GV7eglXln2aw2xh2bmjugCg0dcvTqckfkV6
         PY5hVVtynb19taSrAcIfu2aBWCiiE6fevRK06LWjj+NzL/fVz7uKIPcak222jgNCdCaa
         Kl4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706136305; x=1706741105;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sQPFmmirFE8/ufGIcphQo/87vvOYqOFWOKLJtYmivTY=;
        b=JhtLP19kXFKGAXppodykpNvERIQ5HbZ6E1YDOPXn3943dXrKOdk6qzb2ifGh1VjRgL
         qQFACfyCYI8Too3wNX2/HiYTq4ZPNTaJ+A+/dn3B43MfzjeWtzuLOl496Waa2ckIUT4B
         uJqLgy5S3zpDW2EIsXU4+Og1PU2j0cqV6aKoBBQCGLZpacczj2PkPHoZvRTHXPp1c8r3
         uTQm5sm09q8s4Mh5DxIE0yN5uVV4g7U1Sqa7wx/8P74ETK+iSRnsqeQEZhaDsoEXLUnQ
         aE1jqOgZqyUkVdhnWfWEizNnzGRBQreTIGWXE9stHll9WvKjaqYOB1Ve2wEmyPOQLWuO
         iipA==
X-Gm-Message-State: AOJu0YymrGmfz+EFMgQjc5gYTFzzER05EzC3kmPYwtIdWd8FF+wtRa1w
	2cuYawtJsR+mg1GcD1m3hTZBWvwo6bxpCM/CQB6USbiuea1ldZ48w7jdeWcGZnU=
X-Google-Smtp-Source: AGHT+IGTaJWx/jEhojDAu7QFW93E4ApyrerpMoRHuUPVSnZW3mtaeYPMTWhT0NbuMUXhSAF32RjJ1w==
X-Received: by 2002:a05:6a20:7486:b0:199:a11d:921b with SMTP id p6-20020a056a20748600b00199a11d921bmr208352pzd.45.1706136305571;
        Wed, 24 Jan 2024 14:45:05 -0800 (PST)
Received: from oatmeal.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id i5-20020a170902c28500b001d73a2acc0csm6743987pld.283.2024.01.24.14.45.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jan 2024 14:45:05 -0800 (PST)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 11/18] Staging: rtl8192e: Fix paren alignment for rtllib_disable_net_monitor_mode()
Date: Wed, 24 Jan 2024 14:44:45 -0800
Message-Id: <20240124224452.968724-12-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240124224452.968724-1-tdavies@darkphysics.net>
References: <20240124224452.968724-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Join 2 lines to fix Warning: Alignment should match open parenthesis

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtllib_softmac.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtllib_softmac.c b/drivers/staging/rtl8192e/rtllib_softmac.c
index 60598b41fb9f..538689fb5580 100644
--- a/drivers/staging/rtl8192e/rtllib_softmac.c
+++ b/drivers/staging/rtl8192e/rtllib_softmac.c
@@ -361,8 +361,7 @@ void rtllib_enable_net_monitor_mode(struct net_device *dev,
 /* Disables network monitor mode. Only packets destinated to
  * us will be received.
  */
-void rtllib_disable_net_monitor_mode(struct net_device *dev,
-		bool init_state)
+void rtllib_disable_net_monitor_mode(struct net_device *dev, bool init_state)
 {
 	struct rtllib_device *ieee = netdev_priv_rsl(dev);
 
-- 
2.39.2

