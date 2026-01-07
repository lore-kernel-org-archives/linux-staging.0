Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D60A332918
	for <linux-staging@lists.linux.dev>; Wed,  7 Jan 2026 13:49:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767793760; cv=none; b=iHbnYXWDyPofj7JUIN7PMck53+xxRZnbDN+l+lI6cpOeA7ADfl2Ds+JRVQDRwUASlo6B2hRt/YLBBCcaqgaj9Us479JjNFik3N78FwfVt4uVE19ye6u3kYVVSzDEuTJp8uZeJ2C16OHT8Y0U/zp4iOT2ho1YAHTKBS/xdzTnX4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767793760; c=relaxed/simple;
	bh=VcJC7sCWJodERaoTS9t7XlGBxL7hprZHiIDPn09Ne7s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cjWWfQwl+Nl56JPuzQlVQm09pfXzTT0XD4vfQn6CGrw0rYD0AnRwiL6+Qh7QU4pPrMlKvRYCNpJQoLccHTmKdWgLImN44eX0cKDCD5gekI6vG27zC5MOYHqO7v4cU0ocTRgjFT6jJSy86ayjoBbxU6aFvGZ8nWw+ussOcMmwJHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kcSO5zdN; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kcSO5zdN"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-7f121c00dedso2027608b3a.0
        for <linux-staging@lists.linux.dev>; Wed, 07 Jan 2026 05:49:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767793758; x=1768398558; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bw6fgNtZmBe2W56ugS12P5lnC0TRTn4SZrhJOxug+wQ=;
        b=kcSO5zdNkfKX7LarcGkyNtiWUmrh+crTXy4hivIuEOYuRTChHRFb/ZWRktS7RP/zYx
         ngWQdbXcnF9GW2dtSS8WDt6f52gG+PvayDMqivCmhhCBiXJxlPKMSGWV3I+V7vH3KFUm
         PqR4sCjw+bWI7LxeK8lwPZAmMeddDTEnOKl76GIGMRlznandZGH0m3ncgtXZK9Y6SoqN
         Ezbk/AxLgpVxpu1zlYzyqNBlWq8wgNGjA7cUyI36/2W6oPs94nw5OqM/70KbFUQ9UiQJ
         nJEDBJMXto4px4QUqBCFGx1qtPTHz1/rmxx80I9uTI5cAPry1oAmDI6TM5dZSQi/ASLx
         zZ4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767793758; x=1768398558;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Bw6fgNtZmBe2W56ugS12P5lnC0TRTn4SZrhJOxug+wQ=;
        b=BealQvmRvzq+F96NOaDjra1W3UJ5eP5czqxl7haWex9ogxq48OlXiJCrvfrGG2sjXe
         UD5noK4myRJPLmMzbYjMJRTAn7sEWwJyb8aXCbxq+ixDPi6WV8kT1KlvDIzAtnKX3E6w
         h9hNLDs1A2lTGY1NEvfA2tucraltRYjkUAr6eP9OLaGD2pjt8iEQCWUWehatmYOOWapF
         aJ6IZ87/KCEtIT5wJZIZv+OY1zdwwn9kJwzukCFlc0Iv3RDLNwoc5dSmliGhw11xC/xQ
         uVD345yxNN13WJ4jW3pTXg+USD1/tmglT8GoZhDgMGjwaFBbhfSwVNmuXXcNJUeiEYOO
         mtUQ==
X-Forwarded-Encrypted: i=1; AJvYcCXHLh50hRkCaj/349ITF0Uba7iidqeHRE9ehRe6Qv1aZoNOhWirttkOCcF0CWQqToRVXGIuMa6ot+khEmwE@lists.linux.dev
X-Gm-Message-State: AOJu0YyljNIdI1J3U2rnzYpeC+te+FL8CIXTsT46daDynhwHNBVQkc1e
	iu984BOIxlbi6oDuAURMAp/26aZf2m9J/rU6y9dhcujyOh2RuS4knNwqc/oWbw==
X-Gm-Gg: AY/fxX6SPPuxwlS8BityZWTwi6i+8Ir4zayyxaGA0YlK7ZhLQjdJHfreq+kZG9lsGXi
	whwAd9p7StSL0i+X8SQAH+6Vj+j2mCHfZAGwoy9qgkO4Q6Nw91lwdguLUWpVIH1Mpk1iULeX5qH
	IW1os3E47kW6GQX6ZwMlzlgPJ0s/LEHUsuaVZ9ZKnikCnNxmGbUgPlMfwH2MBZfa9Gr1DFk/Mc2
	VKZd3YhEeCbiz3HuOqfuW8hL/K4lhxsdTiAXkuCqwPLiBVCYmnb6ohAaq5pbq8CQlAOgA/7lBYD
	qdfPQYIDH78oBr0X/gR24tt5D63XLitfrwO5+jwUCHWEkw0qI9dnGIfdkUPVXMKjeJaAid7ejNg
	erGPRXI+bfxxKyA7RGH+/PE3H+VEAWU354a/+PTpngmaPveo2x35p0W4ZGRcEDo2lVRwSlaS2d6
	L75h5+zTtKwSw=
X-Google-Smtp-Source: AGHT+IFj4SFEIp18Y5M2C38LwZUCcGWQNMHaApWC/2wyk9IyQIwapqJnVP0bVg04ZV9jnPoyGDdrDA==
X-Received: by 2002:a05:6a20:6a26:b0:35d:cad7:cd63 with SMTP id adf61e73a8af0-3898f91d20fmr2344473637.30.1767793758490;
        Wed, 07 Jan 2026 05:49:18 -0800 (PST)
Received: from karthik.. ([43.247.159.43])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-819c5302c61sm5109577b3a.42.2026.01.07.05.49.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 05:49:18 -0800 (PST)
From: Karthikey D Kadati <karthikey3608@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Karthikey D Kadati <karthikey3608@gmail.com>
Subject: [PATCH v2 RESEND v2 3/3] media: atomisp: propagate errors from ISP xnr and IRQ enable
Date: Wed,  7 Jan 2026 19:18:44 +0530
Message-ID: <20260107134844.68074-4-karthikey3608@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260107134844.68074-1-karthikey3608@gmail.com>
References: <81e2d12c-342b-4b88-88a0-3e24115541aa@kernel.org>
 <20260107134844.68074-1-karthikey3608@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Propagate the return value of atomisp_css_capture_enable_xnr() in

atomisp_xnr().

Also check the return value of atomisp_css_irq_enable() and log an

error once using dev_err_once() to avoid flooding dmesg.

Signed-off-by: Karthikey D Kadati <karthikey3608@gmail.com>
---
 drivers/staging/media/atomisp/pci/atomisp_cmd.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index 4ed6b8aea..da2481af2 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -874,7 +874,8 @@ void atomisp_assert_recovery_work(struct work_struct *work)
 	if (!isp->asd.streaming)
 		goto out_unlock;
 
-	atomisp_css_irq_enable(isp, IA_CSS_IRQ_INFO_CSS_RECEIVER_SOF, false);
+	if (atomisp_css_irq_enable(isp, IA_CSS_IRQ_INFO_CSS_RECEIVER_SOF, false))
+		dev_err_once(isp->dev, "atomisp_css_irq_enable failed\n");
 
 	spin_lock_irqsave(&isp->lock, flags);
 	isp->asd.streaming = false;
@@ -925,8 +926,9 @@ void atomisp_assert_recovery_work(struct work_struct *work)
 
 	atomisp_csi2_configure(&isp->asd);
 
-	atomisp_css_irq_enable(isp, IA_CSS_IRQ_INFO_CSS_RECEIVER_SOF,
-			       atomisp_css_valid_sof(isp));
+	if (atomisp_css_irq_enable(isp, IA_CSS_IRQ_INFO_CSS_RECEIVER_SOF,
+				   atomisp_css_valid_sof(isp)))
+		dev_err_once(isp->dev, "atomisp_css_irq_enable failed\n");
 
 	if (atomisp_freq_scaling(isp, ATOMISP_DFS_MODE_AUTO, true) < 0)
 		dev_dbg(isp->dev, "DFS auto failed while recovering!\n");
@@ -1196,9 +1198,7 @@ int atomisp_xnr(struct atomisp_sub_device *asd, int flag,
 		return 0;
 	}
 
-	atomisp_css_capture_enable_xnr(asd, !!*xnr_enable);
-
-	return 0;
+	return atomisp_css_capture_enable_xnr(asd, !!*xnr_enable);
 }
 
 /*
-- 
2.43.0

