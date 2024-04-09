Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com [209.85.214.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B34912B14F
	for <linux-staging@lists.linux.dev>; Tue,  9 Apr 2024 11:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712662862; cv=none; b=iX89QBdJN/OPoEwBttk4/KFi/yYdpuk2i7okL4Tbrugf3dDdYIkSsFFLzrCoOc/AhRG8SIoZFMXHqhbtFnNmmG2HyHheXkuVK5EpbITvDi1YIjpD4Y8qMgyHgAf6sWxszjdExuADptdDYnpu3/fB63H8yUfAvT8UqzyQJFQdn1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712662862; c=relaxed/simple;
	bh=rkgQpPAjwBulfGsgEC7S06810blh43cxTegTVfjicmY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ToUksey1kFhi1t9Ihu37aYjsYh4om3sCDBb2K4MVsOex9ssrCmmKEtRFLN6HE6BcLThHbQlkMLH7BMGgU99Iz0OnxumuKzMScncJTzhuRemCN74xuqF5EJ9bXOEMBYmQNRXf3nlcI4xL4g3wp3FEXSxx6XsQKGipZp/EOxLlNro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ime.usp.br; spf=pass smtp.mailfrom=ime.usp.br; dkim=pass (2048-bit key) header.d=usp.br header.i=@usp.br header.b=eMIDFkH9; arc=none smtp.client-ip=209.85.214.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ime.usp.br
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ime.usp.br
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=usp.br header.i=@usp.br header.b="eMIDFkH9"
Received: by mail-pl1-f196.google.com with SMTP id d9443c01a7336-1e40042c13eso14691445ad.2
        for <linux-staging@lists.linux.dev>; Tue, 09 Apr 2024 04:40:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=usp.br; s=usp-google; t=1712662858; x=1713267658; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nj69Gf9AC1113GLKMXeajOz51G86hh4wvGeZBblnNV0=;
        b=eMIDFkH9fEeP86C/VfD3/FzlBNIChLq31duR6QC6mSBGlXoVupb3wH8RkI8oXMo3yf
         vwHDZaBouRF/h8WMIkcibcEKp8EVBCjITG2SsWb5D9sNNDnhblOCQM2MmVr0OqWFFgS3
         oIlw6/vGB86WdfGa+L15cBxqvcoXSFKbJgIe/aD1BJtRbGGxIk/5pXDybeRTPLYjqUVc
         tm7QnKn2nRYwjjMsIZqe65as3rrIi+Tmk+ZUryzjOCh4D29Sjb/3/kAJEFiTbi9HrK+r
         /xcO3JrOR2dKfJudD1wE9bQNropRk9jrlR6i2GzysiDlqPsF+4FS38C8WeCUbfFY/E/8
         50yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712662858; x=1713267658;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nj69Gf9AC1113GLKMXeajOz51G86hh4wvGeZBblnNV0=;
        b=Iz9UORxNqaKDTXstU5ccs5hNAJ9zg9NL7AlK+XMU5RMC7ih6Wi72bVi4/Jt7/amJit
         OJcA8FGLV8apdmYqOlCvHIhDI2w/FQFK8i166tac50K0rtyd2YFH+mOosZFN+rGa43i2
         o0+WZO2HEgk5gUiTvZXOkivlgTR0ffDB+IKyprCODNLXZ9Fa1/Y9Buz//s3nKQa0z1Xk
         WW+knIWy1auz4DmcBKtrcIQttTZ1jfxH030tn2+gSNKCtcxrBfvkG+NgupaL/5KTDolG
         te8Bw9MO8PV0YZDlAGF+6cIhsDr3l7xlBR0oB9VUctXh8Cy0O+h9NYTpADNtCt+Yf2t1
         CG+A==
X-Forwarded-Encrypted: i=1; AJvYcCWvA6TTCCgN3Z+co/bPEWtCfgmysvpoSr6L1ZIm37g/JewjUTjOhGYMNxYlo2nZYjTzQ+18vKoyEgi4zWQV5WQDqOkGQuHQzMy9hUSMfA==
X-Gm-Message-State: AOJu0YyS1cNpZi5zqO+nY5dOIU/6Q5Al5dO0MGcjJFxIJJS8LSpW3HHD
	4zko4msIGNEBgWnAUlx/pTx2b6a9W+pZsqnFAqXGhfNmTeTqzlnpZLNW6tXvvvYQVHPqmPpphXI
	4nWV+u+19WToXrSK9
X-Google-Smtp-Source: AGHT+IEuUOF47jKaqXVe/uBd6Zq5NWnJYAKUjbTQwvwDQJ2Yh5Jgk6dEzXqV81OERcXTuKz1rxopmA==
X-Received: by 2002:a17:902:d386:b0:1dd:6ce3:7442 with SMTP id e6-20020a170902d38600b001dd6ce37442mr9487167pld.39.1712662858534;
        Tue, 09 Apr 2024 04:40:58 -0700 (PDT)
Received: from localhost.localdomain ([2804:18:18bf:c025:fe8e:1e4e:c180:47a])
        by smtp.gmail.com with ESMTPSA id kp4-20020a170903280400b001dddbb58d5esm8617530plb.109.2024.04.09.04.40.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Apr 2024 04:40:57 -0700 (PDT)
From: topcat <bfonseca@ime.usp.br>
X-Google-Original-From: topcat <bfonseca@ipt.br>
To: Marc Dietrich <marvin24@gmx.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: topcat <bfonseca@ipt.br>,
	ac100@lists.launchpad.net,
	linux-tegra@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] Fixed spelling mistake
Date: Tue,  9 Apr 2024 08:40:45 -0300
Message-ID: <20240409114045.13872-1-bfonseca@ipt.br>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

---
 drivers/staging/nvec/nvec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/nvec/nvec.c b/drivers/staging/nvec/nvec.c
index 282a664c9176..b4485b10beb8 100644
--- a/drivers/staging/nvec/nvec.c
+++ b/drivers/staging/nvec/nvec.c
@@ -712,7 +712,7 @@ static irqreturn_t nvec_interrupt(int irq, void *dev)
 	 * TODO: replace the udelay with a read back after each writel above
 	 * in order to work around a hardware issue, see i2c-tegra.c
 	 *
-	 * Unfortunately, this change causes an intialisation issue with the
+	 * Unfortunately, this change causes an initialisation issue with the
 	 * touchpad, which needs to be fixed first.
 	 */
 	udelay(100);
-- 
2.43.0

