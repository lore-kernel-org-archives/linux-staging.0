Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3298E60BB6
	for <linux-staging@lists.linux.dev>; Tue,  2 Apr 2024 11:14:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712056471; cv=none; b=jm9cYOn2gKtNW7YKnhEk+YNs2GpBg1eo0mQdzm9739qTLMlWcTLke0dEymap/faqk/u0/jXerrA/+enyX+C4I4IJE230k2sW0x0WTcJxlXoGRhJvhnC1xTg0mZR1eeeRVUBAXvwaE8kHp71l+RdCiKfPywNCfgVwkIouJyVVya4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712056471; c=relaxed/simple;
	bh=jK+AFaPuB4QJkOlQSpapYzjziTfiCfCCfo7UWLC+ajY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=P2YJLm12QC1LePG0kJn2za6UhCj5zBkDWBsrIO91rMcgYrUvPfLb3U50UBFSqa3nVWvoivbg+rakyc635pdXh/1lxPo056sQB3yG0A+JCcQBWPYKSRJ4jLPVYEU+mhFwaqvmjE5Kp2CpAFitQXfIeYxJtsJ5bofYvsl4OpMxiM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=inHY5vQj; arc=none smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="inHY5vQj"
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-697bd743062so18563026d6.0
        for <linux-staging@lists.linux.dev>; Tue, 02 Apr 2024 04:14:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712056469; x=1712661269; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bF9nmGQgrbBBKoEODSqmsdf3m34vi7We9f5KYGrq5eQ=;
        b=inHY5vQjlXNn9PaDmTmtI8S6Gvwy36zfvKngGPvH75W3Bh9ss017cEjQ3vYIPQZXkt
         2PBksye0c6U4Dw+fusVyjVj6T7M6x16vpk54jtGPo/Zx1QbPnoypmgeRjO6WQGMicTLq
         VgZ3a0Np0GjglWUMvknNOa1iF63vYUIVKenrhPIc6HIFnWuzTnEgJovAfTw1KBZb8LN/
         5vnsikTbImdKepdxHFSe1xwpwk9vQ8vZfti1l0qii0rf0uK9RHvm7b2YLL8VUPjztxkl
         iCfGBDw72vxCASL37tekLYq74Y8cgOjXkH2XeqmETrAFvlpqydXb49baz0WNxIIbIII1
         qxwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712056469; x=1712661269;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bF9nmGQgrbBBKoEODSqmsdf3m34vi7We9f5KYGrq5eQ=;
        b=kZhH/7Y7NwwV+o3KiBhsS9bw3tJE4LiF6WqixAsyITsI43SoKmnFdx9YM9D8d4Wrmv
         7VqFFfgWtG0auWH6Fy4g3Z977UAJhJABush4VUghZVjEp9H6N7xPT0N74C4Qmdvo7dr8
         L1ZJrqFlp5NA3dmv62ELecnEWwexMIbwjWfpga/DCWb/L9kuzZV0vJ+RIIYxIrcFwqPg
         yBXxi7zh/mESd+0N792+QGnOXZesdJiJh1LsrVmX3cWlVAgrC3nPd19yhbVy67lWAlIO
         BiBVCctQ5wv8LK8b6A1bGmxx/NBLXvX5vFI4aNn76ZiyEw9W/Wapfub2tY1mr269iRMe
         Mpxw==
X-Gm-Message-State: AOJu0Yy5ZNssVNugCK2LNfIyirYm/SB+ugmAW+TCT6CM8yQp7hX6bCzO
	fOAaStyEF0Sll9NKwGaqD8gmYBqkSG9b1y79FSC9hNYsQxFfbKbZo6SfoW6f
X-Google-Smtp-Source: AGHT+IGS0uqiCKJa4dv9VNSkOwxSSex+kQ8m3oeOu7lY86dHg2spNQmL+dupDA7mrw1XNDRQdV8eTw==
X-Received: by 2002:a0c:fecc:0:b0:699:af7:1fa6 with SMTP id z12-20020a0cfecc000000b006990af71fa6mr5206180qvs.47.1712056469197;
        Tue, 02 Apr 2024 04:14:29 -0700 (PDT)
Received: from YOGA.local ([2a06:c701:737b:ef00:2c6f:6cdc:f641:6ecf])
        by smtp.gmail.com with ESMTPSA id 11-20020a05621420cb00b006968a6fb010sm5428855qve.91.2024.04.02.04.14.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Apr 2024 04:14:28 -0700 (PDT)
From: Shahar Avidar <ikobh7@gmail.com>
To: gregkh@linuxfoundation.org,
	hverkuil-cisco@xs4all.nl,
	andriy.shevchenko@linux.intel.com,
	robh@kernel.org,
	felixkimbu1@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/6] staging: pi433: Replace pi433_receive param void type to struct pi433_device.
Date: Tue,  2 Apr 2024 14:14:11 +0300
Message-Id: <20240402111414.871089-4-ikobh7@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240402111414.871089-1-ikobh7@gmail.com>
References: <20240402111414.871089-1-ikobh7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

pi433_receive is only called once.
It immediately assigns the data param to a struct pi433_device.
Rename param name to pi433.

Signed-off-by: Shahar Avidar <ikobh7@gmail.com>
---
 drivers/staging/pi433/pi433_if.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/pi433/pi433_if.c b/drivers/staging/pi433/pi433_if.c
index 7efe6b8501e3..208c0c6d3649 100644
--- a/drivers/staging/pi433/pi433_if.c
+++ b/drivers/staging/pi433/pi433_if.c
@@ -409,9 +409,8 @@ static int pi433_start_rx(struct pi433_device *pi433)
 
 /*-------------------------------------------------------------------------*/
 
-static int pi433_receive(void *data)
+static int pi433_receive(struct pi433_device *pi433)
 {
-	struct pi433_device *pi433 = data;
 	struct spi_device *spi = pi433->spi;
 	int bytes_to_read, bytes_total;
 	int retval;
-- 
2.34.1

