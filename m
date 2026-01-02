Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 357C32D73A1
	for <linux-staging@lists.linux.dev>; Fri,  2 Jan 2026 11:45:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767354357; cv=none; b=ejl+3MfROmrs1fyk9AUxzZ6VYA08IO/TUCOqo0MCsKm9frN7dATaa5kIv09O0oc4GUGVQDaxUrEiVYYbo81hCtAh3Fyr02kE9iOQ4fvlrjR32mN5JlEsKP4vvw/quJxG4xZ9KK2JvGlMRXGxG9B0NdgDfllT2gzCI760NN/EEsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767354357; c=relaxed/simple;
	bh=2ypGmbMRjHkuiK4aTiukHS+p1dUsv+EdrHXZ0KGp3nw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DzskaGV1I937hEVpslxbAGo6TG9c9VAf5oWbY6cLI/3PSbZY9H6EADH2JAFhmUm0t8hwblRe1a9n2HL0VWycuA5JkudY219TPmTG7FR4SiHY6s+wMJrFyLxWJqx+KORusf/806bbCHMsPv85aUtO98W5tZq2YT5qSdIwN5KLPhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ym67oneJ; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ym67oneJ"
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-78d6a3c3b77so125385587b3.0
        for <linux-staging@lists.linux.dev>; Fri, 02 Jan 2026 03:45:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767354354; x=1767959154; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v7QSdR986P/lV+3rtDwQ9bAy4seXEo836u2RcHq5oBc=;
        b=Ym67oneJZiaMxDtEeBfNBBNyLo5rpZGYmwKO48WgxXrBlxB+8b38uJ3Xd3h2OOAq3g
         tu7JTLj+Oy7kCUScV0v6MESUMhjJk5W6fUA7x9hO1S7yKrVz5qhYzLDvQydvrUSCWlME
         KuM+MWOET0uK06J7y2lfNyc0LSm076wKeb6X4BNXD881gX7wYfvr0dz0ZFey0iN19m0R
         OMVxikyWevAxJHwkmXLfiNfuKy3nwNWuPZkP3CQkhvafkQsutFjSs4a+WNva9Mmnakli
         b8kAX+KF0N56pKr+l5++VE0h5xz5fCitwEfLmiUHwSQK1akNxNHazvLSLXJWBu7eVIfg
         xhLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767354354; x=1767959154;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=v7QSdR986P/lV+3rtDwQ9bAy4seXEo836u2RcHq5oBc=;
        b=sgDg7UgkvlPQ5h8SxDtSxbT7gGETpT51+hFqtXCLeIGGMqwxjrzXqKq7cYCjcZzsLm
         7vx84cA7gWYdFoIVDgpYncxxZkrfmMAFGvTNvqXoXpmjdGm94VTt1CgXqt/cWxBvo9wy
         wswL9zsbXbetnPvbSRbna8lWjFrF+9olsmmHc3GpUH6uZXpHbVvpsD7LLoi5fHol+X4S
         EE8z6S7iymCeGGCBP8EEFNpEWTR5m24pBG4vtxW9rvyCzMLV40Fb1ldQKvWiE6ZYW2Nn
         Ca/8Sp7vv2PV6kOF70YKqoOi26RaFXXKsl4/FFzvIImehPEKKqsb+oBrcwpz4kciQEQw
         NY6Q==
X-Forwarded-Encrypted: i=1; AJvYcCXbgKKl/aADnrQ2fO4XfwpqcTbhWxlcAwnJ8vkn0cqM6iXpPYHEzzqWvQX1DT40pjH6ZriazgQUuq5fwDMz@lists.linux.dev
X-Gm-Message-State: AOJu0Yx6fz4mpXf9oCRMPgkUyqdmNW7lZFcmR9OCpwks2DYAr3BquN4x
	u/bzXgR8qHR6YH3s5kUQm4+BcnDBFkKit1NMbUeHpRajQfR0xylfC/XN
X-Gm-Gg: AY/fxX7m+jY97SU+izKDxnFs28KnUAqdxDvIDiVuqkURfQ8iircIR2Rip531rHX+Id0
	2LDSoelScQnAFfc2AySHy1jUeSNGfzEf8L98sNsr7CABXHsSjqLoTSsaB43MM3SAEFs/BsN+1hM
	BGFR3wvf0aYOxJ1Zh7dMNtrH2h4sd1FWmMgbQPFqpjy+Erk3edNrtXikNT+aV8E1ZwwgNpEv2rt
	0WVjmFyUIQAoneHoEhekGNwKer/vNTVSD+D2vjnM0+e+/0OlqN762gsRMKJo1K19D2nWF8Zvzv8
	F3L1n2kxyuWWiwFfzBWIh4H24C5M4Z4Ygj1IMQ850Weyemsna2V2fpEY6LDe/udWf/fHSFmsrLa
	Trw8FZXWnpryJqghQFm4ROKBGH8/TRhqwn7YANJMGo+CPRbAnpAbXlgvedOWXEt7mbR60xE5azZ
	tLdHjhCk9hVoKIM4DE7qoX4Vrf+GBclZdNKT/cXQY4PQxO5XmsWX4rYjcCG13Mx2abiRZCH5PwR
	v7kni0=
X-Google-Smtp-Source: AGHT+IHQjwf66LpwbH+zQYAQHv53uj5p0N7n8ZIHwmqUY4C0r2zhCHWhI73039OChAbOqw/5A0P/Bg==
X-Received: by 2002:a05:690e:4089:b0:644:7ad3:6528 with SMTP id 956f58d0204a3-64669dd878bmr28580521d50.41.1767354354292;
        Fri, 02 Jan 2026 03:45:54 -0800 (PST)
Received: from ubuntu-linux-2404.. (108-214-96-168.lightspeed.sntcca.sbcglobal.net. [108.214.96.168])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-78fb4562df4sm156230587b3.55.2026.01.02.03.45.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jan 2026 03:45:53 -0800 (PST)
From: Sun Jian <sun.jian.kdev@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Sun Jian <sun.jian.kdev@gmail.com>
Subject: [PATCH v3 1/2] staging: media: tegra-video: move tegra210_csi_soc declaration to csi.h
Date: Fri,  2 Jan 2026 19:45:00 +0800
Message-ID: <20260102114501.42312-2-sun.jian.kdev@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260102114501.42312-1-sun.jian.kdev@gmail.com>
References: <20251229070125.98741-1-sun.jian.kdev@gmail.com>
 <20260102114501.42312-1-sun.jian.kdev@gmail.com>
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

SPARSE: drivers/staging/media/tegra-video/tegra210.c:1214:28: warning:
 symbol 'tegra210_csi_soc' was not declared. Should it be static?

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

