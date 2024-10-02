Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 825171D0426
	for <linux-staging@lists.linux.dev>; Wed,  2 Oct 2024 15:22:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727882561; cv=none; b=vFUpNSnIwr7fYea+7SIPsfrGUVfjzvkrT6w7wD4b3d+UL4z5cOlUpm/PEaN4umTWP6gDqLU6t6dGpp78/5lBx0HV+culw+iRQkITmGo4t77FWXGTCiGIDGeF737TVjCTsWIsJMUq8W4pREazumMJ08mDP2FovRALo5k/yU4mBuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727882561; c=relaxed/simple;
	bh=KWlEYMnNtViJ6HKjG866GxkIvqI1RzsaLptCzFPZh5E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nlNfCdEqoKDTxDpSFhoCy8+ohCEIwbTjRN1Kl/+8xj0ChcDDDFAX6SoUJE+3kMDhBIylxpybJM4qw3iF5BBuF4bB0a9npoUCYPlLcRi5AXSjfxBbdARXMlkEt57S/UuyquA+O0eTv1b33D7O3XQDP8LTvE+84YPynD3KbFpCZMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NwDi9ecL; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NwDi9ecL"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-20b93887decso29937125ad.3
        for <linux-staging@lists.linux.dev>; Wed, 02 Oct 2024 08:22:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727882560; x=1728487360; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yCayeGfa66KPfvOFkBt9XeMoES9Vo9lnbpSOjOMdTpM=;
        b=NwDi9ecLsj3EBDn5biqcWYTGm5t47zRJg56/FqNtyKn6YLP0IMGW3a9fgfrra8diif
         2o7A4ZXc5fy62naZCvGPQfG/H5X+uTS/mo+tG6ewfgsMPRJI9XDX7ITtbGaJL28YyRUO
         7TdHWpNC1a4lKtpxiTLiP0iCkgd8qqYy0KRbRpPIkmBucswQOaXNom7/Fb+4b/o9rCQt
         snsnfvW1qkE23Xt/zO3vLziWwJzoKL5OQUFuMVO8/OHltEfK5FP5gFVUWSyobpvyCpR/
         o/XRXS8H1HvOqRPa3Ef4DvM5N38GQtq+7kZs0OZeU/GYx4JhizZjZI94tkkejNK1DfJ5
         CmEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727882560; x=1728487360;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yCayeGfa66KPfvOFkBt9XeMoES9Vo9lnbpSOjOMdTpM=;
        b=b142HRZ34oys7mudU61+Ulhzm4bv/+M5AMWAcCLm7cpxZv5NDDiYpaSn6jJ28BzWrL
         4/GgTVpkehH03nQi865b2Q+YDnA8umzHHOm0EPj+NZwVyE3wPGI2lQRl0l0f7lFfEZev
         2amT/a1yPS6Ti5bWGqOxkS+Qr9p34ntr6dpeOkt0ssMzNIW47jL5lKmoW8f+VMrD+89z
         +Zr6apUML3HXc5tpp7n05lK+cny3N0cSiOleHN2wiGOigaQXVQAb8iWAyQcAFKbD3ocz
         xq1GIvEBmp0XKU5793cD9eJuR9YIQE3l6tkBxSUFUBjgToFVEcrtidrOJg3NwLj4CYx8
         eLQw==
X-Forwarded-Encrypted: i=1; AJvYcCVSLjEx18bx6wpkcQzmCM1uKSPPNZQ1ZMtoKc+RzPDq+zPSf0veqIVNx18ZmiIvIFhRFydpMKujudT3ipWf@lists.linux.dev
X-Gm-Message-State: AOJu0YwkpFUxr9QiXMlg6EpnvPySr3ZO14BrN6Z1VcoEpcrKF2745+Cy
	HGaPQT5bFmijY11ZsmVXYS581pmD0IRZFJpkr5COCVyVMsVyfk/3
X-Google-Smtp-Source: AGHT+IG28XenyFsSVCePdboImwZXQeB74YLNXdYnCNB42mDfYmdAkWnjCzgCbAZUPT2H21F8waxHFw==
X-Received: by 2002:a17:902:d50c:b0:205:4721:19c with SMTP id d9443c01a7336-20bc5a5d0f6mr53403585ad.37.1727882559553;
        Wed, 02 Oct 2024 08:22:39 -0700 (PDT)
Received: from Hridesh-ArchLinux.domain.name ([59.92.201.169])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20b37e63a62sm84747065ad.289.2024.10.02.08.22.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Oct 2024 08:22:39 -0700 (PDT)
From: Hridesh MG <hridesh699@gmail.com>
To: linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Cc: Hridesh MG <hridesh699@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Shuah Khan <skhan@linuxfoundation.org>
Subject: [PATCH v2] staging: media: fix spelling mistakes
Date: Wed,  2 Oct 2024 20:52:30 +0530
Message-ID: <20241002152231.8828-1-hridesh699@gmail.com>
X-Mailer: git-send-email 2.46.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix three minor spelling/grammar issues:
	chunck -> chunk
	procotol -> protocol
	follow -> following

Signed-off-by: Hridesh MG <hridesh699@gmail.com>
---
Changelog
	v1 -> v2: Move the changes from meta notes to commit
	message.
---
 drivers/staging/media/ipu3/ipu3-css-params.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/ipu3/ipu3-css-params.c b/drivers/staging/media/ipu3/ipu3-css-params.c
index 34f574b0b521..af4205f4b038 100644
--- a/drivers/staging/media/ipu3/ipu3-css-params.c
+++ b/drivers/staging/media/ipu3/ipu3-css-params.c
@@ -639,7 +639,7 @@ static int imgu_css_osys_calc_frame_and_stripe_params(
 				/*
 				 * FW workaround for a HW bug: if the first
 				 * chroma pixel is generated exactly at the end
-				 * of chunck scaler HW may not output the pixel
+				 * of chunk scaler HW may not output the pixel
 				 * for downscale factors smaller than 1.5
 				 * (timing issue).
 				 */
@@ -1416,7 +1416,7 @@ imgu_css_shd_ops_calc(struct imgu_abi_shd_intra_frame_operations_data *ops,
 }
 
 /*
- * The follow handshake procotol is the same for AF, AWB and AWB FR.
+ * The following handshake protocol is the same for AF, AWB and AWB FR.
  *
  * for n sets of meta-data, the flow is:
  * --> init
-- 
2.46.1

