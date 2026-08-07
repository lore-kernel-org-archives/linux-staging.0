Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3A633A9851
	for <linux-staging@lists.linux.dev>; Fri,  7 Aug 2026 07:16:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786086969; cv=none; b=rv89kRQLNC7dtRWTOo5JEAHR8tRx8A84TG9Hlh0zacNab5Gg0poVDQeXehbShHMvei4tjwtiSnqqtQvhIEUDFiRMR5F2uXSGALOSEJk8MW43FNZ0M15ubqJVCAYEKfpmtbFgJcABlaA9a/RkcA9/nLxqQIgc6oOiAcg3Mo6Btr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786086969; c=relaxed/simple;
	bh=kQqz3hsk1y2iV4xeE5C9ALU/9J5Bfxq8H+CjBpgjeog=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QyWZJchfixAxso3JI7fgM04G94H5GZ7YiHd+JeQjdUu9/jC8BLaUgKQQ7IKPlZrYXsRbwuj/bQcgz2IK9ExjTjR1UjOB3LIGTl0dumAysfUCOWq00t+B7bAGrtrPaOUwFGe8EnZJiCsc1UxWRaT1LDx80SaW6UAxfk1XAb60jww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VtYxee6g; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VtYxee6g"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-38a0c7e841fso3807098a91.2
        for <linux-staging@lists.linux.dev>; Fri, 07 Aug 2026 00:16:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786086967; x=1786691767; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8GKuiDEG88B3UVF8xtTuPaQDFcoPyLRCeG2JmgopU+E=;
        b=VtYxee6g37D3aPdwOV+8NnEAuey7oWITGScgXfmQwulrblfeXNuV5ns6maA6gv2qVH
         sox8C5egQxKDidnCRI3XWlYbT5rk6JrWWJjI6Rde964GB/W1gyfUl9EsQREX04Ue0WC3
         +2G7Ee9V+DAPytY46eYFzLmKOwuNt9Xtfxl4Hx7JGqUktxUQUjPmkph162+2prIJ+/hi
         /QRg8jdZzRSvbkbxAop5b3hOWo9bRAVjQqBBbhdJFSJbmwmxH1i6Oz8NKnfAXQcPoOh/
         mmVUg3e2w4CLqExWo4E0ajNaKehOSLnOXdzJs4YzeF0SABP95hyef2EGFLXXrBfpc7E4
         RDIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786086967; x=1786691767;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8GKuiDEG88B3UVF8xtTuPaQDFcoPyLRCeG2JmgopU+E=;
        b=K0ki3gVuAJDq/kk2mAwSMJ0Z7N3C9KEnxvF1jPkxCdHdJpnc/jCar1BItyU9OTuvOY
         BrbCkNvN0E3f3y+eh1tnHFedK4GhDlzwxiwV58SQfnF1eafHLSwxuBy5GxnpIn3M7Bj/
         Ci4T4J7cYbm9Pq6tIEBV3VZAENk0VqfA7Lz5E+IPcIZk/uEpRlwu//seh2UrOgd9vHkl
         +kGeReVRr1kw2l3q8tGul4VDOD+MdC3RjLJ+ithgKaituZtKy+EwWklPw42q/97qwNN8
         RXaPUbpxciDBEEn0Hlq5kHMgfAC5fpChM8xq3d/3M0kwn79nutowYh0bk+5MQgbB58zi
         1FUA==
X-Forwarded-Encrypted: i=1; AHgh+RpiS5EpZ1VMKBAE5UNgHBs3FAweCLV1VlPpTNzz/LMarhELxyRj1dY4M+MqtFCzDiSUUMjbKzB9bfG+Dsk9@lists.linux.dev
X-Gm-Message-State: AOJu0YzewMTbR4MwQ7++onNCKj3qWKZ7SF9O1dpk791PdRv93gmNd7Nr
	YSiKhnzwffd9Z3UxlPXTB9U1B76qVmoQ/B8UNXJ7htlqo0Qzic8gi2+O
X-Gm-Gg: AR+sD13M7S3xgaqEMGMiSJerOCMooqf58fxkSqBzCKrqfuEU+NVPPJs20AlGUKQt3rA
	2XkNiP8C46pTG2FnlRgOIM/jmW6l5l3naHOhinAjShSFfgH1mudBq6P0s95lF5bq6oODj9YGzTa
	HDpjPGph2yZFYEEj76LqGp/KIOEE+RcBWmHmMY/AIuvrdLnKzP0shxuh2RHGonx+F2PBZ0Y22mF
	KY4M8tRnLOAzjQBDV55ydfg9ZNzdKjk8PN7GTjXT62NQYnC6OH3WONpGfFHKCxBzxU2C6jOp7QP
	Mm3x2zTXVok+0uoaVKVGOHXo7EW/+pLMGflsDGleYKXQ3Ugquj4txHvpGVbSEvOdbyi90wjrqMO
	E0gF44e1/iIAAbiwjdwipIb617U/M3cWeV4yL75Kdf2lMbraBU+s3kIQLJ82VRJcbJCY0c4PeOa
	E4vJf1aCX3Ir7KtjUpAFOZhKjiiMjBanjRHSz/aQ9ChrcG77ZIQuvqjeYkgQ==
X-Received: by 2002:a17:90b:1f8e:b0:38d:f096:a1dc with SMTP id 98e67ed59e1d1-392620e71c6mr2232422a91.11.1786086967193;
        Fri, 07 Aug 2026 00:16:07 -0700 (PDT)
Received: from dio ([103.161.231.220])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14101b7b39bsm4347753c88.14.2026.08.07.00.16.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 00:16:06 -0700 (PDT)
From: singh.supreet14@gmail.com
To: Viresh Kumar <vireshk@kernel.org>
Cc: Rui Miguel Silva <rmfrfs@gmail.com>,
	Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Supreet Singh <singh.supreet14@gmail.com>
Subject: [PATCH v3] staging: greybus: spilib: Handle SPI device types with a switch statement
Date: Fri,  7 Aug 2026 12:45:42 +0530
Message-ID: <20260807071542.200192-1-singh.supreet14@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260806101118.146685-1-singh.supreet14@gmail.com>
References: <20260806101118.146685-1-singh.supreet14@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Supreet Singh <singh.supreet14@gmail.com>

Replace the if/else chain that selects the SPI device type with a switch
statement. This makes the code easier to extend when additional device
types are introduced and improves readability.

Signed-off-by: Supreet Singh <singh.supreet14@gmail.com>
---
Changes in v3:
- Fixed the memcpy indentation issue
- Removed the extra blank line in the commit message

 drivers/staging/greybus/spilib.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/greybus/spilib.c b/drivers/staging/greybus/spilib.c
index e4d1ae8308aa..39d5bf234c61 100644
--- a/drivers/staging/greybus/spilib.c
+++ b/drivers/staging/greybus/spilib.c
@@ -458,17 +458,22 @@ static int gb_spi_setup_device(struct gb_spilib *spi, u8 cs)
 
 	dev_type = response.device_type;
 
-	if (dev_type == GB_SPI_SPI_DEV)
+	switch (dev_type) {
+	case GB_SPI_SPI_DEV:
 		strscpy(spi_board.modalias, "spidev",
 			sizeof(spi_board.modalias));
-	else if (dev_type == GB_SPI_SPI_NOR)
+		break;
+	case GB_SPI_SPI_NOR:
 		strscpy(spi_board.modalias, "spi-nor",
 			sizeof(spi_board.modalias));
-	else if (dev_type == GB_SPI_SPI_MODALIAS)
+		break;
+	case GB_SPI_SPI_MODALIAS:
 		memcpy(spi_board.modalias, response.name,
 		       sizeof(spi_board.modalias));
-	else
+		break;
+	default:
 		return -EINVAL;
+	}
 
 	spi_board.mode		= le16_to_cpu(response.mode);
 	spi_board.bus_num	= ctlr->bus_num;
-- 
2.55.0

