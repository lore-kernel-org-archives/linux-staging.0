Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FD661B4223
	for <linux-staging@lists.linux.dev>; Mon,  7 Apr 2025 12:36:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744029373; cv=none; b=DdefH9gAO/CIf6qSusoK/taAgy2Mez16iB+0M2rCzUjPZDs+Es9B3jrNgBqmTqQ8JwKkCsD1wRlGQaSab+GlEMUlxXLgmw6BYbSNKjVbmicu0+fzyrHcQl7TdcY+Pg0qJ66HBX7Y9Mq34xgr4Bwq3wWdK1Ib/MrdWmkbF1A4vXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744029373; c=relaxed/simple;
	bh=dcJyfRfsMmgxmRuoZ6uKnKv89TRcKrAVyw0Xtxreftk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=k4T71wJZ4kQ/usrWV8I0dxRffSLCpH6w57R2JDlozaGmLR8Qhn1nGdQrq3wEVilwJIWEZmr/EsJBvlLLzvnjnvmm1S8rvzzuHK1BZakUpTkZCQtxpp4jpik9fr1bEF156zKspPaHE6MM6EyeFCb1koo4jzriRsyMncjauXWcIR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J/JIClaI; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J/JIClaI"
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-7c592764e24so469008585a.0
        for <linux-staging@lists.linux.dev>; Mon, 07 Apr 2025 05:36:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744029370; x=1744634170; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3TcKaW1iKbZzoagO8ECUBHNyiWF3ioNPUUj4VMULq6c=;
        b=J/JIClaI+7nUwuPWpc19CgSuBPxFBtOzh2ay3BIj+qzRj76ByG6F4iozVBfB74b7C6
         VCVACJ1AFnIugFyvGaHk4UX7/ey2obpFPBW1YrTzP9Y9uNhpLG8G7LQeNNNsM9hD80g+
         JUdBCi/3E4Is+N5yszCcKgeEwvUInpT9kI+d91AuOlB+VILxUEE5lAKCaBktReUthLRl
         jyGshVNtGJ7HOUPw9bRt5KrefvghDLsUkc7Wf+3hM2oFrQACm6jTiDHPjjsXIMPe+cJO
         /dQOLgfkaEzz+9ay74ol/RnO/eiIMUE6h1LgPNvxmcrBPzN3uJcNHMoF+7bCxt60xTG+
         iQpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744029370; x=1744634170;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3TcKaW1iKbZzoagO8ECUBHNyiWF3ioNPUUj4VMULq6c=;
        b=UeOVGbCUAtmcTMq9uVg3QK36bymo1p1IYJawiLtWIcCEN9XW82mvbt4aDgvTWivb3B
         6RXz+pfZgpNKGEeV5uVo96PoLtcvw4uI59Ob60x9BQRTCVlzY+02/Hf+AdvIws/8/8ab
         kA3oECfFr2e0NqoxbBlht0IVKEEwbauCwCKCk9w4W+G1HluNj0OGlxJwccFvYLRZETUK
         zsaW35ulz4+H5ZTXe4uO98WFR2Q5h9ptZK55PV8/NszZCL5cS8uE3+co3ALOetSsAoGo
         k1LAMGR9prKN3YkAV7q51R3VApvidbFeeGNwszTt7MEdv35SSWoM4NzcnZPXrBPi23XM
         iWIw==
X-Forwarded-Encrypted: i=1; AJvYcCXib8PCAXHcAGIWhXaTNkgiaP3sv6fPkxwiWhfOTleKzn+qmMIQg/HCKhhWsv5K1qNprzW3XmCJFkybCGoC@lists.linux.dev
X-Gm-Message-State: AOJu0Yy+qShy3NtKGGZf9nWJLI/wqz23Fjr9wbRvya7Kku2tsvW/6xLw
	9b/9uxR/w/5GIelSv5MF3VDwY+hTfqt9uzL/wRICbjfaaDyr9v8t
X-Gm-Gg: ASbGncsWuEDabkgoKzkym5IA7TIrvFsx1nwccdfcCgs78JM8zZWV2r5uGM5TLDa205l
	B8Vhy4U9FegTruEQi9bM0gPDWyww3PxeWqvA6NCzX3P90Ot3nzOBI+p3ZydxLAYbrTBJcWvA1ub
	R8UcPG2NbBZREoC0TvdhPzO7cXGQae8gnvqgk38FS0jIvOvgB7/sL9kcS1xGQLJ9l5zyHMmvtTV
	URDt4215hyzizh1BzQH3malwc1BQ6wFjIJl1+S62lCBN5LW+TMv/WGT/wNPe5zUbh5BUVcw+XYr
	cqLupCpBF1XpIsLSZV15wOogVEOJwjgTxudh/tyLpUe/ytFpycNlxrtuv2U=
X-Google-Smtp-Source: AGHT+IFYSVKw5VCmG3zldSTuQDk/3t0DK/gVNVF8RsJQdy0hmP+obfuJJuPgy2KdD4uTEL82O7eV4A==
X-Received: by 2002:a05:620a:40cc:b0:7c5:9566:83dc with SMTP id af79cd13be357-7c774a57ad1mr1674861285a.25.1744029370535;
        Mon, 07 Apr 2025 05:36:10 -0700 (PDT)
Received: from theriatric.mshome.net ([73.123.232.110])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c76ea59e42sm590373885a.77.2025.04.07.05.36.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 05:36:10 -0700 (PDT)
From: Gabriel Shahrouzi <gshahrouzi@gmail.com>
To: linux-media@vger.kernel.org
Cc: andy@kernel.org,
	hdegoede@redhat.com,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	gshahrouzi@gmail.com
Subject: [PATCH v3] media: Fix indentation to use TAB instead of spaces
Date: Mon,  7 Apr 2025 08:36:08 -0400
Message-ID: <20250407123608.366190-1-gshahrouzi@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <MESSAGE_ID_OF_V2_EMAIL_OR_REVIEW>
References: <MESSAGE_ID_OF_V2_EMAIL_OR_REVIEW>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace spaces with TAB to comply with kernel coding style.

Signed-off-by: Gabriel Shahrouzi <gshahrouzi@gmail.com>
---
Changes in v2:
	- Resend using git send-email to fix formatting issues in email body.
Changes in v3:
	- Use media prefix.
	- Capitalize tab to TAB.
---
 .../media/atomisp/pci/isp/kernels/vf/vf_1.0/ia_css_vf.host.c    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/vf/vf_1.0/ia_css_vf.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/vf/vf_1.0/ia_css_vf.host.c
index ece5e3da34ee..127f12ba2214 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/vf/vf_1.0/ia_css_vf.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/vf/vf_1.0/ia_css_vf.host.c
@@ -114,7 +114,7 @@ configure_dma(
 }
 
 int ia_css_vf_configure(const struct ia_css_binary *binary,
-		        const struct ia_css_frame_info *out_info,
+			const struct ia_css_frame_info *out_info,
 			struct ia_css_frame_info *vf_info,
 			unsigned int *downscale_log2)
 {
-- 
2.43.0

