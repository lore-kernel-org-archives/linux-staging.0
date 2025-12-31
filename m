Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E26433101B7
	for <linux-staging@lists.linux.dev>; Wed, 31 Dec 2025 12:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767184854; cv=none; b=XcYpQbN6Gt9W/dp15h6EjQ8OVipxYb2Js1LMWkevWTGmBsEK/NM5EXH3C+1xNvb3CxhkwterCoeVHLkMqznpsmpRDHIoKU2NvX7UL9zEEHx6OOWVAQ8j5CX3xEs528ZhZptg5wVIvr/qg0maIXtRDB8n17CinWmFVcch3Z1Bopk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767184854; c=relaxed/simple;
	bh=bpc64xTes/6DSqbbfKw7utwCw290qXBNArmOt6zd9U8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AullYykZEkuxhgXdg96lhPDZn75R2w6FDB3dtQMChwaWVq0mvY1rV+34eBxFGkoR7GhpSBLsUCCoQsFhfl6U48XFQOjZYqGI+/XDgtHkGyE47sWTAiCYyuNjKasGuvLeoQpMvPn5qIH9bWG23apphdUJzp7DY4qNr6lbkoO8bp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TtpKY+vA; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TtpKY+vA"
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-787df0d729dso87132977b3.3
        for <linux-staging@lists.linux.dev>; Wed, 31 Dec 2025 04:40:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767184852; x=1767789652; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MMZ9zgZdVr3pbZQDIH7NpdxYpjnjDbphEYD5vgBclQo=;
        b=TtpKY+vAv5WKLK4vzvjUTgqH2i5V+B9Fbj48I/9Yean9ZFBaqp7nILKCw9Wf574MU8
         QqOr7eBlTS52Gc7/4lDUgurixBdhYTKPmt1zlvAmHc3HD4zJa59wjuPHE/GJ4hXiA7cy
         3r5iO3z2DLlE29EfyUjJJgVvLV+BfqGIZjFQ9Yd76zDToAxN7iTcPueHdGfdQhWLExtX
         8/HOPbUjOg4/fmarvmddfxfc9ZwXlluQwsfoqILe0WzIREDIlT1pbkGtS/qQI+DhReol
         0rw3nd3RQOkDcBYZ/vhdYaNiUvo7mex0CPsbYyWcRFBvGhRVr9LRyqSx7Q4L32J8UwCA
         U0nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767184852; x=1767789652;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MMZ9zgZdVr3pbZQDIH7NpdxYpjnjDbphEYD5vgBclQo=;
        b=Aw5CqGotBrHi+OH5O8iga0ArNT/hjyfLY9xmLvjU4N0VYSB8aztiJeEKpPyKBYN/TG
         q3RZsVInA3A/HFLhiVUsUFmyMr7HBN3/0CBmZ6GvfCujEVX7p/keiUSwC1NwMnExprk0
         2arwksi0gbcgKfkU6j6R/F+thpL0YVAZOqpkJCRuEi8t5PshHVAhBNzLciCw76mB+9a6
         d7pMhl9wc/9PDJm9cq+SF7/w8u5+m6jZ5v8pb97VggvJuzWJmhi/Yrb9TlsNoJS8Sbdd
         GTQ3nc7i6jD9qdQxiht4n6aDHEO//hNLhzH7OqKTHnlEGOoG+jl+aMt6gwyU5L7wvXEW
         estQ==
X-Gm-Message-State: AOJu0YzNVnwzIHyIAihF8qlbzN+QUtQoCR/p9w8eUWNy3M9B5rLGg+mE
	VFvXs12LMNqGKWOYQe02gwr375PZHmoiiEwf1GLFgWFkfXTFoiA3Cv7w
X-Gm-Gg: AY/fxX4LDBXXGLfqLJQRz5HdhAOUfQ2/9oQJmVDdAQE7Bg4m5aSbohIoXsy4jbk7M/+
	8UyzOtXOWBANo7z+fHdxc+tJp+U1ARII2tqpP84twJqPUaT6ot0r1DKjVKZyuyrBqxYCpbPwLQK
	ApFaVBwAwHp6SUfzUF1WbMo//ZKBxrZZAjRtm72j4xucYUSQeaOBi30C0yNdLkQhaWeFY6vlDaZ
	sLsi9l4ZvpzUWj0aaatJ/26TwMBR7hR+5fbKsmrkkGobU9QJujk04HMWh5Z4dFm9Sm6Xhmlfh1K
	67OC1owaHSBhoM0Pz26JSmwW3Lfjb7so2mA/AyLSNnCGXay4cfMv5YnYfpqOcKz+p4nh4jHBYgX
	RnnszqWy67+POBettGHMKGP9iIvWDO3+AZg31Oc5ydz7Je74M/Wx8YSKSYMK7lwL7enve/OLuaH
	Ggtj3bjMnz+X8rmylD7KE/wKNVJUBQ2f22L2kl1ObQdqJ0BUNp2Ars07mEjEU5hOacc+BVfTiIS
	gIQf+U=
X-Google-Smtp-Source: AGHT+IFrXQD2q7MyIixphdEVMQQUK0nDKmR0bPg/g+JbhcBEInhr1pMYlAHk+OMHNNhDorAD0CekqQ==
X-Received: by 2002:a05:690e:418d:b0:644:2c33:42d2 with SMTP id 956f58d0204a3-6466a85b6c3mr26405383d50.23.1767184851830;
        Wed, 31 Dec 2025 04:40:51 -0800 (PST)
Received: from ubuntu-linux-2404.. (108-214-96-168.lightspeed.sntcca.sbcglobal.net. [108.214.96.168])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-78fb43b2690sm137555257b3.18.2025.12.31.04.40.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Dec 2025 04:40:51 -0800 (PST)
From: Sun Jian <sun.jian.kdev@gmail.com>
To: luca.ceresoli@bootlin.com
Cc: linux-staging@lists.linux.dev,
	thierry.reding@gmail.com,
	jonathanh@nvidia.com,
	skomatineni@nvidia.com,
	mchehab@kernel.org,
	linux-tegra@vger.kernel.org,
	linux-media@vger.kernel.org,
	gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	Sun Jian <sun.jian.kdev@gmail.com>
Subject: [PATCH v2 1/2] staging: media: tegra-video: move tegra210_csi_soc declaration to csi.h
Date: Wed, 31 Dec 2025 20:39:54 +0800
Message-ID: <20251231123955.277384-2-sun.jian.kdev@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251231123955.277384-1-sun.jian.kdev@gmail.com>
References: <20251229070125.98741-1-sun.jian.kdev@gmail.com>
 <20251231123955.277384-1-sun.jian.kdev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Sparse warns that tegra210_csi_soc is not declared in tegra210.c.
The symbol is referenced from csi.c, so it must remain global. Move the
declaration to csi.h so users see it via the header and avoid extern
declarations in .c files.

SPARSE: drivers/staging/media/tegra-video/tegra210.c:1214:28: warning: symbol 'tegra210_csi_soc' was not declared. Should it be static?

No functional change intended.

Link: https://lore.kernel.org/linux-staging/DFCAOR6T9DPE.2MOL0K9O3HP1N@bootlin.com/T/
Suggested-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Sun Jian <sun.jian.kdev@gmail.com>
---
 drivers/staging/media/tegra-video/csi.c | 4 ----
 drivers/staging/media/tegra-video/csi.h | 4 ++++
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/tegra-video/csi.c b/drivers/staging/media/tegra-video/csi.c
index 604185c00a1a..3c3f6e3fd1ec 100644
--- a/drivers/staging/media/tegra-video/csi.c
+++ b/drivers/staging/media/tegra-video/csi.c
@@ -835,10 +835,6 @@ static void tegra_csi_remove(struct platform_device *pdev)
 	pm_runtime_disable(&pdev->dev);
 }
 
-#if defined(CONFIG_ARCH_TEGRA_210_SOC)
-extern const struct tegra_csi_soc tegra210_csi_soc;
-#endif
-
 static const struct of_device_id tegra_csi_of_id_table[] = {
 #if defined(CONFIG_ARCH_TEGRA_210_SOC)
 	{ .compatible = "nvidia,tegra210-csi", .data = &tegra210_csi_soc },
diff --git a/drivers/staging/media/tegra-video/csi.h b/drivers/staging/media/tegra-video/csi.h
index 3e6e5ee1bb1e..609c5952e050 100644
--- a/drivers/staging/media/tegra-video/csi.h
+++ b/drivers/staging/media/tegra-video/csi.h
@@ -130,6 +130,10 @@ struct tegra_csi_soc {
 	unsigned int tpg_frmrate_table_size;
 };
 
+#if defined(CONFIG_ARCH_TEGRA_210_SOC)
+extern const struct tegra_csi_soc tegra210_csi_soc;
+#endif
+
 /**
  * struct tegra_csi - NVIDIA Tegra CSI device structure
  *
-- 
2.43.0

