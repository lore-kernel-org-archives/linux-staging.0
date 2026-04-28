Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 587F2326D51
	for <linux-staging@lists.linux.dev>; Tue, 28 Apr 2026 15:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777391189; cv=none; b=Ah3EOpSKRBUKUTCwIpMuVIJYECNpCrN41ryMcZgDGamdi3sIUuSxYzUsOknwnZv1NWZgrFS2olZV5oYn6qaTYkf4ooW82tagfTpkIzuO29ZFvNIq8F+nzfewKbFRFf7HvXUqif/f1YjhGZqV9+KRKjM1yUfec9tWIwDABEmbhhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777391189; c=relaxed/simple;
	bh=3l8/jYpkdXsG6SyQfIwBjPSuCSBodHOhQRlhk1OXomI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=p2cj05WnsC8liHnh70QAIVaUNLWg3ALXSEQLh9FN1xH6570/ZIKHLw6MxSFknEx5JFZ0g45tLCqDeF8hQYzYK50P5Va5Gih0mEoSFsoyHISTlA9lzTYJEsiI/YgS1GK6YH+SWV5tziEpiqfdFerDtkk6jCmOWY9oXKcNfMnMYN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MOAud41F; arc=none smtp.client-ip=209.85.161.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MOAud41F"
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-6948b5b1c53so5283436eaf.1
        for <linux-staging@lists.linux.dev>; Tue, 28 Apr 2026 08:46:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777391187; x=1777995987; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=k9WYxtMVhrcTFANW9nJ4oPBcCFr6W4sm1HRZsTUDwQ8=;
        b=MOAud41F3lP5Gv00ptip6XAPELzV4OFjb8n/uzCzMXUvCMyd0zsUd/P9psVXFM66zd
         /vtDFJvZDx1gZyUD39M/oC6ATjtqOzaJ4ljTk5XAM6Zm7o56/uqhYKOkvjj6xb+CmX2O
         0bsw9QZB/xxULlU23QwxoR3J7thb5CAs9BchPRavG/tjkjuvpYXh8EBhRcbfcV3Dp9oQ
         GCkOlaOyEUKinUHZ/YT9eSZ1dlKGMgVw8Dt/XHoVODY/C8xEJ2zTzYaNkxjvF7kUoSWp
         NMjPWTOUnvUztnQgzJTT3yKHMODorEdtxOgY37K8s1RP/iVLTbeGmDsn0djAnuR80lPB
         MDPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777391187; x=1777995987;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k9WYxtMVhrcTFANW9nJ4oPBcCFr6W4sm1HRZsTUDwQ8=;
        b=fQ7AApv5uBDcPQxAos6WE7II08J3tivi5d0jNk2I18OvFJOsSgSQ2f/D7EnoOZsmZf
         9L2AZCCv3n9dOfxNdmw8sykW6RjJN9rWznJnC+Ifvd5Lm3yyC3DR0d9Qw5SOAXFRc+Kn
         h5MvFFF8TUQCorcEfC9ENXfUlmkv43nwpevuYlNnzUdv1zQnLc4ZR/bu5mhejN95gJOb
         37YREvasBxXjJOscKiMS9V+R7vDI8NWeiR2N9h2b66JPX2GeoKnpwYPCO3a/hNKgMqp0
         0QpdgfNy6T8CYiPtIS39NmKJDbr8p62bNvflx7EYh6pgja7ZrZ5J5Ubysul1jRdjdEeB
         +2UQ==
X-Gm-Message-State: AOJu0YxSEpvidsvH1aUAFgYPpGp2YyvmxjwR/Zl7WVZZN6xAiDD206rI
	7ngUJ3GbSRNE0uBLmuvcWuBOHOdtk/rVm2nNgw8O6es3GWJPOnb2YycDOMoAyEN+jA==
X-Gm-Gg: AeBDieuOefO+H3/gufIgI552PP69nLTgfIyD1wNjeTnA3fcg+HnkM8tKPuNiy+Mreqe
	MWySrh+4qOmYp4HZnheyJ9C//bbJd3sA721UjRH9HKnPzhoirJJOvqhPu9esWz2+EEknQ94l2F5
	KwjUb+DFv+XamC26EAs0+5tna8aTPpPEMwGDhNwAiqq5/52BLt1xYqQbDUoDammaIu/qSucWaoa
	NU89oKvjebK8tSG5tKrzTAZwTMNrQG6RZGvHxINkQny3Dk1SKSUlTeya+ew7y3y5vDWAJ0cVnf0
	+9l6bnInAc2/vvxtZRQtxeewd6Ir5Yc4ZtZ0yFKX6o8VSLxtRe02Zk2D7rAatd0jCCdm9wXrD3M
	tvZl9PE2/eMETqlxHMP0a1cOsK4AnYLpD//Vlr3VOfGZvfuvLVA+rM/JL1v1zFyfKkohHpMdVOB
	ALgGZ8zRz51IawOga+H4yO/dLXohaCb/011s3dMUU6wYl3eL9vf9vqUm65q2dldp9DGcnr98TVO
	429kFqTJpFzW+rgcD3xJcUDH0I=
X-Received: by 2002:a05:6820:612:b0:694:9e64:6785 with SMTP id 006d021491bc7-6965ca7355fmr2030129eaf.21.1777391186824;
        Tue, 28 Apr 2026 08:46:26 -0700 (PDT)
Received: from MSI.hitronhub.home (24-40-252-177.fidnet.com. [24.40.252.177])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6965ba3686bsm1710931eaf.9.2026.04.28.08.46.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 08:46:26 -0700 (PDT)
From: Mhanna112-code <marchanna111@gmail.com>
To: linux-staging@lists.linux.dev
Cc: linux-media@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	thierry.reding@kernel.org,
	jonathanh@nvidia.com,
	skomatineni@nvidia.com,
	luca.ceresoli@bootlin.com,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org,
	Mhanna112-code <marchanna111@gmail.com>
Subject: [PATCH] staging: tegra-video: Fix function argument alignment
Date: Tue, 28 Apr 2026 10:40:22 -0500
Message-ID: <20260428154022.6997-1-marchanna111@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Separate long function calls into multiple lines to comply with kernel formatting style.

This fixes the following checkpatch warnings:

CHECK: Alignment should match open parenthesis

Signed-off-by: Marc Hanna <marchanna111@gmail.com>
---
 drivers/staging/media/tegra-video/tegra20.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/tegra-video/tegra20.c b/drivers/staging/media/tegra-video/tegra20.c
index e513e6ccb776..eb1fc5b7e2cd 100644
--- a/drivers/staging/media/tegra-video/tegra20.c
+++ b/drivers/staging/media/tegra-video/tegra20.c
@@ -552,7 +552,8 @@ static void tegra20_channel_vi_buffer_setup(struct tegra_vi_channel *chan,
 	case V4L2_PIX_FMT_YUYV:
 	case V4L2_PIX_FMT_YVYU:
 		tegra20_vi_write(chan, TEGRA_VI_VB0_BASE_ADDRESS(TEGRA_VI_OUT_1),  base);
-		tegra20_vi_write(chan, TEGRA_VI_VB0_START_ADDRESS(TEGRA_VI_OUT_1), base + chan->start_offset);
+		tegra20_vi_write(chan, TEGRA_VI_VB0_START_ADDRESS(TEGRA_VI_OUT_1),
+				 base + chan->start_offset);
 		break;
 	/* RAW8 */
 	case V4L2_PIX_FMT_SRGGB8:
@@ -565,7 +566,8 @@ static void tegra20_channel_vi_buffer_setup(struct tegra_vi_channel *chan,
 	case V4L2_PIX_FMT_SGBRG10:
 	case V4L2_PIX_FMT_SBGGR10:
 		tegra20_vi_write(chan, TEGRA_VI_VB0_BASE_ADDRESS(TEGRA_VI_OUT_2),  base);
-		tegra20_vi_write(chan, TEGRA_VI_VB0_START_ADDRESS(TEGRA_VI_OUT_2), base + chan->start_offset);
+		tegra20_vi_write(chan, TEGRA_VI_VB0_START_ADDRESS(TEGRA_VI_OUT_2),
+				 base + chan->start_offset);
 		break;
 	}
 }
-- 
2.43.0

