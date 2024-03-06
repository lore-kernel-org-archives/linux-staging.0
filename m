Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF89F12A155;
	Thu,  7 Mar 2024 12:20:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709814053; cv=none; b=XnZ5Lh2uMrBO3FJ9iBRmjC0Qk7ThlfBjBWYU5NvhTtjtEKH7lJ8P0n/0oLzuQjmatu04H0bvlnDq/ougEkVhJd0Y7beHl/3p8szEQO0lvEhdXcEDrkWv+PSsietbVQN7koyrrtuRhgVNUnu+tKhDeSnb1iUk1EMVHaVRrW4+FKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709814053; c=relaxed/simple;
	bh=cosepZq62wdW637P1XsJaGBjkkf2ss5R4jQojJO0Kw8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=cz6xDDQQ3oNeBSN/vHHw12M4kc1lKdKWbA+qNWmHRWkqw608OOKz/TBOf8qO1CDB+Q4bUPvm6k4a14+STIwL1m0BptRP5EtF+jJ1cnIt/oF/aTl0diy2J1K52mLNnJrcKGJB0CDO4CT0iCK80An+trEFxs43bndRmDoz21WX5Cg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g/PjPW6y; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g/PjPW6y"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a3f893ad5f4so113456166b.2;
        Thu, 07 Mar 2024 04:20:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709814050; x=1710418850; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RlCx0S/nS60uyckbreKdxqPNDElfOPfZp70PcKobpZM=;
        b=g/PjPW6ydGQQcexSXdECZBaTmTIE9789zw6jwbmQqbQdcPU0HxGJhg0mR231lwmPtP
         Vbk4wxMVAMGS3cx7yRU53IWsfug9HTyC1bX+C1lechIu9yyKmRLeHbP1Y/DnZrMD2KZW
         k2iBUNiY0smOocWVpLmuBYnmWiT1rfHcgzFxfTQCORHQOswgNe83eKlAWjEPCpkKPGFf
         dswkEnSBz+CowQ67Bpajwg8KdE7r3VvA6j0VnPWZNWKI8CWySrtBQwnDOGGk/m2POoUd
         1ESTFIycIoJKZxYChNBQMSIFB0cPBMvxBU40dCNxlHhQLayJxrDxI/rNBIlRA371iuKe
         eB/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709814050; x=1710418850;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RlCx0S/nS60uyckbreKdxqPNDElfOPfZp70PcKobpZM=;
        b=Qoo6Hi+/WTyXEmPL1MdI2NdODk25H+3BItc9m4l9GhvGVGgEnHv1I7AgCfHmoMuWS0
         ilpHPoxUHgXjNKxRZoZS769I0tccXiU60dt7EKlBtdhQssechDfgSK0st0jYR05LJ/n3
         +tGTNIXvnsmKBwZf8iXNIyVgwMozlgswl++EjBK7uexvrHY+h9BwBh0UL8XlUEOQssxQ
         61HGHS2Fvv/VJBUlRTDGoWUq65MEM0GnwyAbTOF7C+/uoECts3y71lXG6bewwOnU8cdg
         N6uByuFxZDji7OGhdBrTu4Y3sBoR2hR0wjIpA+w2I3kVf3rQ31kWjzf2NXj2irJh/rVr
         oylQ==
X-Forwarded-Encrypted: i=1; AJvYcCUbVgl6NkoNfURfIlaXWItpR4VB6vQyn5T3jfweBeF562b2f9/PP9hYnri9cO9gHfTsocyjmuwCGhazN9qbZkfAgTjLcCYolxO1lKcG0T5quGZv6pgtq3SZA9aFAcFPocW5lE3whqnYYg==
X-Gm-Message-State: AOJu0YxSrwbFYUwmIXOqvq32atztXmDZ3R1UWJCeoWGYAuN7KIQh3MBI
	rV1TCTFiDDGvVa2EDyxzKFspMpyg0WHuqfFaZd1lm+cLGNDKx4Da
X-Google-Smtp-Source: AGHT+IFQyejFUVZAcAhdaxO8FOA3cmtZ4W/ppdtQp9EfYyS3Ed3g84dHBriCWd4gYrZPWl//2VH26A==
X-Received: by 2002:a17:906:37d6:b0:a45:f05:7e10 with SMTP id o22-20020a17090637d600b00a450f057e10mr9804820ejc.24.1709814049917;
        Thu, 07 Mar 2024 04:20:49 -0800 (PST)
Received: from ubuntu-focal.zuku.co.ke ([197.237.50.252])
        by smtp.gmail.com with ESMTPSA id l25-20020a1709065a9900b00a45bb9b81d6sm1643073ejq.195.2024.03.07.04.20.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Mar 2024 04:20:49 -0800 (PST)
From: Dorine Tipo <dorine.a.tipo@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	outreachy@lists.linux.dev
Cc: Dorine Tipo <dorine.a.tipo@gmail.com>
Subject: [PATCH v2 3/8] Staging: sm750fb: Rename variable sii164GetChipString
Date: Wed,  6 Mar 2024 04:36:06 +0000
Message-Id: <20240306043611.98074-4-dorine.a.tipo@gmail.com>
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

Rename variable sii164GetChipString to sii164_get_chip_string to fix
checkpatch warning Avoid CamelCase.

Signed-off-by: Dorine Tipo <dorine.a.tipo@gmail.com>
---
V2: fixed the name in the commit message.
    Added the patch to the series.
    Compiled the kernel to test the changes.

 drivers/staging/sm750fb/ddk750_dvi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/sm750fb/ddk750_dvi.c b/drivers/staging/sm750fb/ddk750_dvi.c
index 6dee95e60a6e..e568c210e2bd 100644
--- a/drivers/staging/sm750fb/ddk750_dvi.c
+++ b/drivers/staging/sm750fb/ddk750_dvi.c
@@ -19,7 +19,7 @@ static struct dvi_ctrl_device dcft_supported_dvi_controller[] = {
 		.get_device_id = sii164_get_device_id,
 #ifdef SII164_FULL_FUNCTIONS
 		.reset_chip = sii164_reset_chip,
-		.get_chip_string = sii164GetChipString,
+		.get_chip_string = sii164_get_chip_string,
 		.set_power = sii164SetPower,
 		.enable_hot_plug_detection = sii164EnableHotPlugDetection,
 		.is_connected = sii164IsConnected,
--
2.25.1

