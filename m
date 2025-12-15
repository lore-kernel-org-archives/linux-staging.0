Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEC85325499
	for <linux-staging@lists.linux.dev>; Mon, 15 Dec 2025 19:08:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765825712; cv=none; b=OvaJDcOKI0if9FYeLW6ex9sBpHslA7fVxK8xIgxXgOcMsU7MqbzKkqz5O4qLZnRjk53ldZmTm/pA4Tt8q+PZd0g9QkJeGjIMNrRQ6Y+qhNaT60XkjDCEKVNRImfWs7SCxExIPbgLdI1A009eT0z8mFWxd5QbLw6kaMMv8iLkdM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765825712; c=relaxed/simple;
	bh=vS/v29iFzL6WULN07adkLqiszjwNtmW5Rxtes2iEe1Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=vD1Ktl4LklRmxxCJWgM7mv8zkmHoa8qaYWdR7L5Ds+S20+m+iwUzIXQ19cjtd8PdifJlAWyUI6OOR31WCDGy+RJ2wJxFFLdu83Mz2iZKMmhVAVHUPGzKMrH8ocO4uS2CWuAmhcPhTUMYPsaY4kyQXYSPFdnSk5w+H4tGXwBIUBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JDBYy5FU; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JDBYy5FU"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-34c708702dfso1638885a91.1
        for <linux-staging@lists.linux.dev>; Mon, 15 Dec 2025 11:08:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765825708; x=1766430508; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L76XOBtvdR9M9Iidb1SoJnTo7w17wFiPv8tlX/4sAsU=;
        b=JDBYy5FUDu+dMGIIN3LQbI9NKpd0e74Wf8UJi/r08G7Df2rUqr++CUymwmw7wBpJGu
         AFWzwNnWYy1Nb81DSf2m8ehg8JDnK5ZomME81wMLsWIOq0sHNCJ3LInrYaXi/Mi3FyhZ
         OWeFlRaNudGCf4WQLMXkDxmISw37yCahZcXd5W8rFsLtdh4jLktF1dqLjBbZWFL6KUfa
         9hnpoNPCLvw7suNwZi8kPFPnfk7XICYpe6qAW0snMHmhKCIH04I31CGCOiAN7ERtw1b+
         TAA/SWdGMs4oXulPgYtqDNegV/N33z5E9hPW2gEHFjMqvawj9P4eVE+49d7m/oejS2iE
         95CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765825708; x=1766430508;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=L76XOBtvdR9M9Iidb1SoJnTo7w17wFiPv8tlX/4sAsU=;
        b=MjcOCdHELsUXa0nmpbQ67hWNIFFWuSIxuxOGxCztHAsoKDSoBBsEsxa6qVCzCCv3A0
         RkB6nXvxpTiJXaXTAqdFPagpkUZ5PV6At81mqi+AUObb58NLyHAQhfeTY8sJe62isUE3
         Yl8mO5oYL+pM6nn+6I9Rr9/SPvOZe6QlBRSaqU+iAtP/kICV/8aLYVcObpexVKUzqkSB
         KrsNiiRht0rqQdVi/3Mprm24LiaJJhqF0ovJ9Z4uhEf4GvkGExwa3IbtJPJW3jER+8OD
         6rh414szDK6cTAA0WOY6Ls6k/gVmmwNtsQ4E0lWs4XqBnSysipwgK5hcTb45E6JTg/5C
         FnIA==
X-Forwarded-Encrypted: i=1; AJvYcCUJXB+JqdilWmZtKvbaJOgHRzid+2Zl21bPiTd8c2LcB28V+S0IAb+H40IzBhr0UsW3d7wixftJUtahM3zv@lists.linux.dev
X-Gm-Message-State: AOJu0YzMXoqt1FtVStahCuoV08H1q80Uc7iVcBSuQMJV+lc7EfYesIGj
	CB5kVhTxds0fGhM1dYLzQIUIcxbPHuPlW1nkVuM9NO3Il5tLu5JuCaq+
X-Gm-Gg: AY/fxX7BL/Dtz7iyyh4h8GInoSb3Y5VSxG+RkIrhXW4bLrVduxSkv1oebzA925s2di8
	wnsMtGX5JCL2oz+fKeV6cMEhdmpgNUPbk/UP7s2pXSniSS18grvTAf5lKXrz8mlNba2VgGS2FeZ
	LdOQpgTlR3iqPcRILYVVLFXGShQDf4+ZYhQlQy5iduxt6gpXCEoixi/gdzjcu7eES5WgUUtwjMW
	bofDV6zz2zc4YGrIePw2vD8sZ1cRIzb9wbWgon2Uvn6OLtpKvwYJZKHisfjqr74zju/e52ff/bA
	nwV5eY0IfvJVUYZgtZ+SiH+ldlf8M6wU9jbKuGm+HB35DZl5tkUDnMhPXDEEhppUapdZElz4HgR
	6pxGrxh2peRqAZJK9XCbHcQCLhK3pG4gziEC4ptFmjYeSg4qEbs+P8sCYHrfdyLEO2WE0Nx4JnH
	Kv9TTPj99rIUbRp7lp9+oLNv8LwEQHKn1Cfm+O+cLoTaLs+rY5iR6wL61iTG5vsdNNGf2lYyKnZ
	0AOV9KAh2XmJPdjmnMRyimgr9uhlS17qS4gmCz1PQBBy7GNV0stnSMdy+k0vij/ivfaS2/fYKH2
	Xqx4I/k=
X-Google-Smtp-Source: AGHT+IE/tsK8aQMr688+Yiaxf7J8IPD9qNC2gqGPcezAhy4Ufwlp7yHvw7TlDSAf47nxJxWdHYGkMQ==
X-Received: by 2002:a17:90b:4c90:b0:341:8b2b:43c with SMTP id 98e67ed59e1d1-34abd75ba34mr11917429a91.18.1765825708181;
        Mon, 15 Dec 2025 11:08:28 -0800 (PST)
Received: from Lewboski.localdomain ([181.191.143.42])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34abe2948d1sm9958875a91.9.2025.12.15.11.08.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 11:08:27 -0800 (PST)
From: Tomas Borquez <tomasborquez13@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Michael Hennerich <Michael.Hennerich@analog.com>
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Tomas Borquez <tomasborquez13@gmail.com>
Subject: [PATCH 3/5] staging: iio: ad9832: cleanup dev_err_probe()
Date: Mon, 15 Dec 2025 16:08:04 -0300
Message-ID: <20251215190806.11003-4-tomasborquez13@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251215190806.11003-1-tomasborquez13@gmail.com>
References: <20251215190806.11003-1-tomasborquez13@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Cleanup dev_err_probe() by keeping messages consistent and adding
error message for clock acquisition failure.

Signed-off-by: Tomas Borquez <tomasborquez13@gmail.com>
---
 drivers/staging/iio/frequency/ad9832.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/iio/frequency/ad9832.c b/drivers/staging/iio/frequency/ad9832.c
index f9ef3aede4..8d04f1b44f 100644
--- a/drivers/staging/iio/frequency/ad9832.c
+++ b/drivers/staging/iio/frequency/ad9832.c
@@ -302,15 +302,15 @@ static int ad9832_probe(struct spi_device *spi)
 
 	ret = devm_regulator_get_enable(&spi->dev, "avdd");
 	if (ret)
-		return dev_err_probe(&spi->dev, ret, "failed to enable specified AVDD voltage\n");
+		return dev_err_probe(&spi->dev, ret, "failed to enable AVDD supply\n");
 
 	ret = devm_regulator_get_enable(&spi->dev, "dvdd");
 	if (ret)
-		return dev_err_probe(&spi->dev, ret, "Failed to enable specified DVDD supply\n");
+		return dev_err_probe(&spi->dev, ret, "failed to enable DVDD supply\n");
 
 	st->mclk = devm_clk_get_enabled(&spi->dev, "mclk");
 	if (IS_ERR(st->mclk))
-		return PTR_ERR(st->mclk);
+		return dev_err_probe(&spi->dev, PTR_ERR(st->mclk), "failed to enable MCLK\n");
 
 	st->spi = spi;
 	mutex_init(&st->lock);
-- 
2.43.0

