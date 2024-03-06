Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24D4B12C7EE;
	Thu,  7 Mar 2024 13:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709818182; cv=none; b=n882IW2bNXRj6L27rzQI6PpcG4/Xjc9mDKsUoTeqJkniYrppDLs4V3LG16eMLo41kQgd32l/5il4JSDmVrk8vEofyKLiWjSxQd+P3czOx3G8dOoHoklFkJvr8V2vfJwodJlVsjvNQdHazv0pVDJvt9cohDQaobavmpRXDjIo8z8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709818182; c=relaxed/simple;
	bh=WpoxOolLZkCiliWpUvxGbbeFrVhI2tV5I1TyfIWDkFk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=hNsysSz4+VIoaLguKAu46xl+BshHR4uZjicB2rb03oDCuAR+en0qWg/GMwMQRW9vTKk++bHPsRJTwQjZQi/xx4Ynfrxh8tDJxlLUJyMXO7CYPTQb86scTdVarrJTpR7pN1wVrsi7Xnkr9ZA44mWQohCB9gUHpFMFIVRlxGDkWXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EcZUjAel; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EcZUjAel"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a4499ef8b5aso94344866b.0;
        Thu, 07 Mar 2024 05:29:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709818179; x=1710422979; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6/cRV7fFt90W0JBnC8A4FR9kvMHelv6ZpiwSpRtTvW0=;
        b=EcZUjAelKUZprvfXZTeOLD8qGzX3RUNplN4Vi0iNcw9IDzi2sb3jJzuAWCGMrK0iHy
         0MZYDug6e8vDqFK6CWNmn1OhhOTvGmi+X3v4I7RtSpQz0eOBp0x4rGBhyWxP8fIipIVI
         48Xerem1XEd0MsYelt9g42osYDMtJT3nylGTFyBHJLLAVCAm0bzSlp/KxWvthvJGfdAD
         pvV/ZMNUau3ucM4rDKjdUsSd8Gr2LUlj3L3d+LCrxvDn+Ebvs8+ArvbYog5j6lyclwKG
         DIEnhfdRgu8cb/IMRy7vMQBgsfr3DKleVxswdowiBBqbe/6UdRpb35aqMrcFmMHjJ0IK
         1DUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709818179; x=1710422979;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6/cRV7fFt90W0JBnC8A4FR9kvMHelv6ZpiwSpRtTvW0=;
        b=cEWheCoBZ53EK0x6RqmgDS1JLPCcBH1kkRQZS0BuiSmH0eiOOnBI7BbnAA3wOdP9yJ
         OgxxDP47z9MVooy0WuE7MhOFEzO+WtA8z+TS1TU+F+vc79OSP84HjSkYzM7BsMTv6fKO
         DTZbrpSz6fjcfXxeF55NfNbsSKPTDXLVrbz4C3bcfwgfUxnqUkJsfZo7dSNr428YFgnV
         WdEQTOHgpk1fmix/t2a0buGZTo7SGTek0S1kgSO7O2Gol1XLBXK309i2gqTlo82TA1Dk
         DTvUseTJ/6gGGj/YHAXOZR9Nr0YtHz4rl46MBAxERt1buEb9IOHi38iP718uGiqa5Eiv
         ZygQ==
X-Forwarded-Encrypted: i=1; AJvYcCU41TQHxO2QD+ZeU1kzA42dljsmN0YsrLe7vyJwvz3blScg9dXUGdpyOuefAS/NRjRhk+n2tYunovhggVmPqYUwWGuHPO6eFf/wHyZtK4dJia1SH1RMHtVdWO5Zi0AkuC4kmzqAFOw/6g==
X-Gm-Message-State: AOJu0YxzvI/JU4tHLUoIDBY83+5qocx51dPk5sR/wmthGIdoou9+Wio3
	O13nZdI6wzmuuCJHwmcVFIiqZBpQ+8+/X1Zp4COVLJSfR1zQAMwEiRosLLtQlhM=
X-Google-Smtp-Source: AGHT+IFD4dNxIsvmW8JjUQmUMxBP18ur6WbpZ60d2Xr0UxB3ASC8HWl9ah0lsx6967b6meYo6S05sQ==
X-Received: by 2002:a17:906:2351:b0:a44:763:4dd3 with SMTP id m17-20020a170906235100b00a4407634dd3mr12431053eja.27.1709818179345;
        Thu, 07 Mar 2024 05:29:39 -0800 (PST)
Received: from ubuntu-focal.zuku.co.ke ([197.237.50.252])
        by smtp.gmail.com with ESMTPSA id x14-20020a170906710e00b00a45769e8e58sm3904401ejj.219.2024.03.07.05.29.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Mar 2024 05:29:39 -0800 (PST)
From: Dorine Tipo <dorine.a.tipo@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	outreachy@lists.linux.dev
Cc: Dorine Tipo <dorine.a.tipo@gmail.com>
Subject: [PATCH v3 2/8] Staging: sm750fb: Rename variable sii164GetChipString
Date: Wed,  6 Mar 2024 05:44:52 +0000
Message-Id: <20240306054458.102288-3-dorine.a.tipo@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240306054458.102288-1-dorine.a.tipo@gmail.com>
References: <20240306054458.102288-1-dorine.a.tipo@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename variable sii164GetChipString to sii164Get_chip_string to fix
checkpatch warning Avoid CamelCase

Signed-off-by: Dorine Tipo <dorine.a.tipo@gmail.com>
---
V2: Added the patch to a series.
    Fixed errors within the patch.
    Compiled the kernel

V3: Reverted a commit in the same patch series


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

