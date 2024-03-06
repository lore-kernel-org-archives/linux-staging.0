Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C11E826AE9;
	Thu,  7 Mar 2024 12:21:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709814065; cv=none; b=N+/JdA8mBye6n66pdA0KVUrGtoJQiwdf1DWhOPVdv81Y/o9r6BXIWHjDZS3fPGUO4JSbRPHsuwFHrslxV4IA0FOrRFgQoM3ncC2E0V86yiTpxSVr6Jx6vpSBSwJ4i96VgUOhdfiOJ3n1+9stDFn8kOQCaJ9JfQCk8sHah1Tjkjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709814065; c=relaxed/simple;
	bh=tueIUPydG/ea4akwftBCAxd76zAxTg8yxFsUh6Xb4IM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=nYdQpnyczVQxEr1jxUcmZ/rNbTOa92FomzokXX+8pPIOpZ+tEGw+/tfYDTR84ebfTh3FWEXCqTBRo92m/Hb3F18OT0mxqzvUmISw2c1TJX190JZRn6iNee9eI/DOwubLf6UPdX7J8fLPr8tPMLyXfKCr0M6bSmQnG70rJOrYeCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Aim7cUy4; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Aim7cUy4"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a449c5411e1so111264166b.1;
        Thu, 07 Mar 2024 04:21:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709814062; x=1710418862; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VS9KsA16G6itSD0YMERPuTMuESKlhuJAaZ//iNJWZM8=;
        b=Aim7cUy4xt6m07RFIczpOPjShaCj0uThYrN8JECydizI0BZ9WjdaPmsRbtyZm/FFW1
         LDBbCuYF5AQNDDkBaPbtitmTgzBCVkL2YCPrahlpIH+V5KjTLl2Bqj7e6XrlRYC/+Aa6
         E/zxVS5XZ+C7n71Vz4ca6CMnOLJha2MJv2dob2ZUmuDWZ8vCnzcYQUoW3ElZmdQM5zrx
         wNN0E+3uIM7O+CEswhjilGUYXrftcdmMiTJVGViNJn0LUNqITDVhlFQHiIKJXy9QQZsT
         wyzpQ9v7n9ucC8n3fYQq3HonACjL2qqAot8D4y2efdJK1R4dB5QgexGTfmcAKWoSi65M
         LCiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709814062; x=1710418862;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VS9KsA16G6itSD0YMERPuTMuESKlhuJAaZ//iNJWZM8=;
        b=lHPKw1Q1okO9MwlSjfEHpiMQkXxhz3UBBZ6VJEuzwcXTsMvKjYHxHckXrI3ITkiFM9
         kz3m51w+Vik3ohjI6hS8+xkPc1RnA9x41TieyTedBfgBkP5PNRBs6YQQ7DzyFShbvPiS
         sEG+EXF7YdT/TRulkm4zDTN3nX4eRpQhPSY3Z2ReXT5bTC5dx3H1ZhTNTzLUf4yKxU+b
         jJ6q7E2POYxEzSNvkaJdHz6oNc/dJa/xFt4HwexZsJhCghA8IaUePCBGpJDwf+vH1AN1
         9euf+8mi8+dXokh2mufAQuSu1Jt4wiXyVCHd3aUgZ575EtNe2Q+CuFa0McgVopEext+j
         YKag==
X-Forwarded-Encrypted: i=1; AJvYcCUEJahwFZUlp/WnznnloPe8YynHOC/1QNNyND9idUb6c2noC/t5m7Ykbf549ql9YMjl2sX8Jwh4VDmU6ZQg18y7LsdlOOnfLlM2C2XN0WZZEUVBkpgr2iRIShXy35pc3jAPHEHvFxDIjQ==
X-Gm-Message-State: AOJu0Yz4xIph7u22y0uJmaKCxgNuXPl9nUW1o7pHxrlqJ40t5kqBmr58
	cyqWqkp7ys+F0aGBhPKn+ebWb2In7zgkiFrTfrGKgg+8lbu7rxag11ghjVV5J9c=
X-Google-Smtp-Source: AGHT+IGaLN+voRdxXYAuhSDy2OVHsAKkykpWtAqcsGOebcN1Ae2kr8GEWaPCDlJyeDy4bhqGZVrcYw==
X-Received: by 2002:a17:906:c49:b0:a3f:173a:224c with SMTP id t9-20020a1709060c4900b00a3f173a224cmr11348825ejf.51.1709814061965;
        Thu, 07 Mar 2024 04:21:01 -0800 (PST)
Received: from ubuntu-focal.zuku.co.ke ([197.237.50.252])
        by smtp.gmail.com with ESMTPSA id l25-20020a1709065a9900b00a45bb9b81d6sm1643073ejq.195.2024.03.07.04.20.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Mar 2024 04:21:01 -0800 (PST)
From: Dorine Tipo <dorine.a.tipo@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	outreachy@lists.linux.dev
Cc: Dorine Tipo <dorine.a.tipo@gmail.com>
Subject: [PATCH v2 8/8] Staging: sm750fb: Rename Variable sii164ClearInterrupt
Date: Wed,  6 Mar 2024 04:36:11 +0000
Message-Id: <20240306043611.98074-9-dorine.a.tipo@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240306043611.98074-1-dorine.a.tipo@gmail.com>
References: <20240306043611.98074-1-dorine.a.tipo@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename variable sii164ClearInterrupt to sii164_clear_interrupt to fix a
checkpatch warning

Signed-off-by: Dorine Tipo <dorine.a.tipo@gmail.com>
---
V2: Added patch to series
    Compiled the kernel

 drivers/staging/sm750fb/ddk750_dvi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/sm750fb/ddk750_dvi.c b/drivers/staging/sm750fb/ddk750_dvi.c
index 1def02be4cce..6fef1ab484c1 100644
--- a/drivers/staging/sm750fb/ddk750_dvi.c
+++ b/drivers/staging/sm750fb/ddk750_dvi.c
@@ -24,7 +24,7 @@ static struct dvi_ctrl_device dcft_supported_dvi_controller[] = {
 		.enable_hot_plug_detection = sii164_enable_hot_plug_detection,
 		.is_connected = sii164_is_connected,
 		.check_interrupt = sii164_check_interrupt,
-		.clear_interrupt = sii164ClearInterrupt,
+		.clear_interrupt = sii164_clear_interrupt,
 #endif
 	},
 #endif
--
2.25.1

