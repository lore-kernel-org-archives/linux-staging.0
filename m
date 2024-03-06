Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A8D112BEAC;
	Thu,  7 Mar 2024 13:29:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709818189; cv=none; b=Jnd+pPOe8z47guEz45D6CwA/IYPP5kELk4VT+kMJmtUgE8tY/Eb5QnicjDqLlAunFqcyEizqXZPCtgIgBhpTBfuIQxzX6XiDsFRM65r22lpxWsjJpZiWhDeLqRUhqwXB2awl4YR0JHkdndtyMxTKVDKk/3nFgPiDABWOkMYRoj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709818189; c=relaxed/simple;
	bh=FyN9Fo3jSAzgLqwjhSKWoFoZRTTYV4+EBYJTuat6ZkM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=TuxhophyBlviIShZerTW+Srcms5UGnTiE1dse/TZdlNxUCyJN62lHPiPxaRUmj30tk1LbCsEBfEOHmBRpZs/lRnbueWCNqyckhGmqmch1NPfEXXIO5qk/+IDRshYSHNZn6r91r4E/HBNLoZo/pQHWZdy36lh637n02ngaOW73yA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CnZZHjS0; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CnZZHjS0"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a44628725e3so124441566b.0;
        Thu, 07 Mar 2024 05:29:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709818187; x=1710422987; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a0ecfdjyvM5u8OBgcEk7ooBU0G6oYnVJTs0VWead2aw=;
        b=CnZZHjS0pNpEEj8LGIRAx83VEQtUuySBv+zGmgsIWEt41fEKjUkApH1Jg/wUGTpJa5
         +XRzR0HeCKR5nwdwM50u0gMiYar+yCa5AHcsAE4dcKi9mPkMTjXdxwBrARm0jbLCUGY6
         euqQ1MyfDUFQCSDB8AY5TdMfKGNr5LqLNv+H3UcEFnu7tsxKePJ4O8G1DhfPOGtYFUpX
         DrLH/ivJBrxa7Nh3TbloG0ZDoJzJW2LG3Ba+g9WgwO1seL3PGSSokESQlHuk1Y4Egvo8
         iPm0BIkFelPESSaIXAZciJO5huYmvzyCpDcMPXNTxCm35OHv3IMT12BuadM5G3a3kjtg
         oQFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709818187; x=1710422987;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a0ecfdjyvM5u8OBgcEk7ooBU0G6oYnVJTs0VWead2aw=;
        b=F9KUkrKYNpUNCo8tDIy/FpJonbEovxj/QMGtLM4hS2dyoG76mTtdeOi4por1LWTJfz
         hjt5W18i0aBXE1XkIWtOvtU51V1MjsQ3X7RL2wuAytDD3srudi/0S+4L80i44swwCbSs
         uS/mKFiWw+aMUko+VaMvJWwAuBPD4+ZaHJZ+im7p/hBiMEHvw6RAYB73MDYCvPKenFDn
         9S3Q0+pE27W8gtXnMoRkB0XvcQYwJIVdhGRi9Fc2Ty7KYcM16Z45k+n/5pg1PnnT1cRC
         Xf9hUSMvdmFDXqhIvVDuffV1POdUVPoq76wh6C4JLCuQ+U30ys1qVK12iFAbs3XO7nJF
         uXjA==
X-Forwarded-Encrypted: i=1; AJvYcCXvPRYqy86DCWOczo1HGBhSfJQcIFmF0iWrgenFLt2+pc76+NUhcxaOBDmJ2OCcqvseGcmSmn0I1QExga+sDpP5p/Qw81tJcXPf3EdfNETe0G0OWekk1C4G4gJy10mYmJR0lbE+KKxFpw==
X-Gm-Message-State: AOJu0YwX8elLCGw0lEVaYSOra+2BrUyDx5dWR5KQsD4mXF1j7vKBuU4I
	lm8pdmTLZayxSJ3jsvqvMc/0w/rMfR4wvHwCow2Cm0fdirvMN4OGNtZn89XSkEc=
X-Google-Smtp-Source: AGHT+IFfPrQ34Nu64ANXaeMH1LSeQaewpeyzDOkNkBAIT7U7LxYHsUEaR8CYnHhkESVywyzGK/qPjw==
X-Received: by 2002:a17:906:381a:b0:a44:8001:453f with SMTP id v26-20020a170906381a00b00a448001453fmr12181386ejc.47.1709818186816;
        Thu, 07 Mar 2024 05:29:46 -0800 (PST)
Received: from ubuntu-focal.zuku.co.ke ([197.237.50.252])
        by smtp.gmail.com with ESMTPSA id x14-20020a170906710e00b00a45769e8e58sm3904401ejj.219.2024.03.07.05.29.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Mar 2024 05:29:46 -0800 (PST)
From: Dorine Tipo <dorine.a.tipo@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	outreachy@lists.linux.dev
Cc: Dorine Tipo <dorine.a.tipo@gmail.com>
Subject: [PATCH v3 5/8] Staging: sm750fb: Rename variable sii164IsConnected
Date: Wed,  6 Mar 2024 05:44:55 +0000
Message-Id: <20240306054458.102288-6-dorine.a.tipo@gmail.com>
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

Rename variable sii164IsConnected to sii164_is_connected to silence the
checkpatch warning Avoid CamelCase

Signed-off-by: Dorine Tipo <dorine.a.tipo@gmail.com>
---
V2: Added the patch to a series.
    Compiled the kernel

V3: Reverted a commit in the same patch series


 drivers/staging/sm750fb/ddk750_dvi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/sm750fb/ddk750_dvi.c b/drivers/staging/sm750fb/ddk750_dvi.c
index 1ce44c50617a..ac1aab77da28 100644
--- a/drivers/staging/sm750fb/ddk750_dvi.c
+++ b/drivers/staging/sm750fb/ddk750_dvi.c
@@ -22,7 +22,7 @@ static struct dvi_ctrl_device dcft_supported_dvi_controller[] = {
 		.get_chip_string = sii164_get_chip_string,
 		.set_power = sii164_set_power,
 		.enable_hot_plug_detection = sii164_enable_hot_plug_detection,
-		.is_connected = sii164IsConnected,
+		.is_connected = sii164_is_connected,
 		.check_interrupt = sii164CheckInterrupt,
 		.clear_interrupt = sii164ClearInterrupt,
 #endif
--
2.25.1

