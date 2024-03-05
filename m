Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB798405FF;
	Tue,  5 Mar 2024 05:14:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709615677; cv=none; b=uxYERwgXebo9wPSaEbEyr5+GVkeSQufSo3sY2SLE+flvG6mLKD/MWtjpyZvIidSHTODQ9o8Iprm/tqqq+imC1coM5t4enFqqLIxm/WnFwJu2I+gH30bfdMJP1OD15kleS5VWgiVsNPEEE6FGktQX7WD2C5/xDDdIQ5WYUUUC1mU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709615677; c=relaxed/simple;
	bh=8e8mh1+lTo9qSTd30CKj3HZW2HAO/HGPtMfajC34boA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=BO4oPPpivsaVyM5CIzg8FgEKaQA9KCGnO9uw/WFqbM9IaFAfR9sXAE8Vmo05OT9uwcaxPo0OmpsW3W7TZ5mSMJgXKPd6wdR851+3ONgkc7fbdqjPtgmd9ig6rzb8ygmIVVOem8BqBFuzHUyiVIziQ4xDZFiDxZPbrW5hKEZcipo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eTVreLzx; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eTVreLzx"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a44f2d894b7so300673166b.1;
        Mon, 04 Mar 2024 21:14:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709615674; x=1710220474; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N9EsxA7xIcMoc6bWidjqihc+y/5nGf4cIfIWxqPpPa8=;
        b=eTVreLzx5yQX4q91SN6RQrmA7/kaX70+EgXgEWvFI2uLGBOtB2SdPvalVU/zxwnBSA
         +IasIUyp8M+riKKRPsed4GSerGGsi7GZfes/KB2X3HFq9ebkVdYMs6Eud9B1u9nTxExQ
         Uu9lHEaz/LKsNcVfo66UBRPCids+jpNhYP96ov6ZNPQxbPUVjB4TcK7DsFfYV+VTAFjs
         esCTfkYrRkWXwlNmSEikjnJxCyiWr1W3w7bbY/RQ5wjlUs+nu8yEmUNwuCSDeO2VnOfx
         Lrfu2EKAPokcHTISy893KzVGtH1bNhjRKzZMEWj/kiATCpI+9DgDYnIxpP0wle4/hciZ
         hLBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709615674; x=1710220474;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N9EsxA7xIcMoc6bWidjqihc+y/5nGf4cIfIWxqPpPa8=;
        b=kALZg/Zg1UnFt2mHbUZSdk7iJiRD9TtivUtsbuaSZsCSFYNHej2Ud9ThjMFbUsSnpQ
         pxV9CCs51yM5slgRHmsCP9GRRYdEtXEQjtTWHilYNBH71FXJLakTDaqLLmsXte+z2C3h
         hHsc+xrAYUNFhMMkLdUIduYJk7zM35mbHbi69ZiFppzmiipweVr/iPq7CP7l4dtg9dTj
         4n16glWxKQB1hnyhEombebJNorzHH3Kf7KuCIytWo2qJXvOgi0M0iu4n1+fc5PXyqG1a
         AYR4Evinrdu1tHGvJot5TvTH4g/XzU+pVq/idhs4Rs99LkWzH/wmnvgXBQ3TaylN966S
         tPlw==
X-Forwarded-Encrypted: i=1; AJvYcCX6/PeWCNRWfmTpCgA9pHB/ENHKpFRrkYMvH2avzo4PpTK+ii+5duIbs3YX8UeSAyqqxmhliYrPE3JDeIAfIs8UsbOiWpBcraFBFtwW4rw1E5swME2/nv6ofoHVzHK/10VNCPctFqX6fw==
X-Gm-Message-State: AOJu0Yyh2UeJQuBIQNOu1Ry7ztJqK+Ej+e3GT+j6d6vBGWaXen38K/37
	hjotbF1ohaxx8XK4KMF3HSlGRI25CFqa39HP+gNNT1iU9y9mAOtfHTkuxbef
X-Google-Smtp-Source: AGHT+IGt+gQmgCi0RPyCGvwWImcldNMG0ajogqhATTuXkwY3DF9pfNC9SHGyJ4g/cYKlSEdlf70IQQ==
X-Received: by 2002:a17:906:f0d0:b0:a44:6b6b:bae3 with SMTP id dk16-20020a170906f0d000b00a446b6bbae3mr8962758ejb.59.1709615673869;
        Mon, 04 Mar 2024 21:14:33 -0800 (PST)
Received: from ubuntu-focal.zuku.co.ke ([197.237.50.252])
        by smtp.gmail.com with ESMTPSA id ld1-20020a170906f94100b00a451e507cfcsm2449270ejb.52.2024.03.04.21.14.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Mar 2024 21:14:33 -0800 (PST)
From: Dorine Tipo <dorine.a.tipo@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	outreachy@lists.linux.dev
Cc: Dorine Tipo <dorine.a.tipo@gmail.com>
Subject: [PATCH v4] Staging: octeon: Match parenthesis alignment
Date: Tue,  5 Mar 2024 05:14:11 +0000
Message-Id: <20240305051411.6431-1-dorine.a.tipo@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <2024030422-backstage-derby-a1e4@gregkh>
References: <2024030422-backstage-derby-a1e4@gregkh>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct parameter alignment in cvmx_spi_restart_interface().

This patch aligns the parameters with the opening parenthesis for better
readability and adherence to coding style guidelines.

Signed-off-by: Dorine Tipo <dorine.a.tipo@gmail.com>
---
Changelog:

V2: Fixed the warnings in the patch as suggested by
    <philipp.g.hortmann@gmail.com>

V3: Reworked this patch as a separate patchset as suggested by
    <dan.carpenter@linaro.org>

V4: Added a changelog at the bottom as suggested by
    <gregkh@linuxfoundation.org>

 drivers/staging/octeon/octeon-stubs.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/octeon/octeon-stubs.h b/drivers/staging/octeon/octeon-stubs.h
index 3e7b92cd2e35..44cced319c11 100644
--- a/drivers/staging/octeon/octeon-stubs.h
+++ b/drivers/staging/octeon/octeon-stubs.h
@@ -1362,7 +1362,7 @@ static inline struct cvmx_wqe *cvmx_pow_work_request_sync(cvmx_pow_wait_t wait)
 }

 static inline int cvmx_spi_restart_interface(int interface,
-					cvmx_spi_mode_t mode, int timeout)
+					     cvmx_spi_mode_t mode, int timeout)
 {
 	return 0;
 }
--
2.25.1

