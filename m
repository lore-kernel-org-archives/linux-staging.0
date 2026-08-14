Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EE5723C368
	for <linux-staging@lists.linux.dev>; Fri, 14 Aug 2026 00:26:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786667201; cv=none; b=TyFFj0tCXl53Dl+M7idrKuXG/S/VK5rmwL1W9en1LhtybeNQSHkER69mTHWE2At45UUPwHBmrHoWqT3/L70aRhegyPFQs5GucHRn5IAqWkL8Bsr0wlf1bZOBfSUsQEHGti+Uyc0SJUjxJ9y9gG2QWR/s9a4Dg0vo9BGRoX/qCa4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786667201; c=relaxed/simple;
	bh=RSLGoWLMTcui+x+1Yav6CBKnpnMwFhAaQIkQaXugPaI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=B3XPlscMFvZ/HHUUkb0lZkAs/+vK4QRBVsUFI2c7si/YGjnYBvQRRSxKn71WX0d+23ON/+2fUzrOaGeV2Lf+9PKlrHGZ5vK7DDemw2yCtaeOssa1wfUJAIWZqab83OlcHM7aKlWReRrs56pNaUZEBgYI/1o8LHxdDcNorRfaz8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YHd6VUqA; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YHd6VUqA"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2cf27856f9cso4893915ad.2
        for <linux-staging@lists.linux.dev>; Thu, 13 Aug 2026 17:26:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786667200; x=1787272000; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UFXwbGyK5jIFIfkWoQscdqjN7Om8mpDa9VVLSjQbEo4=;
        b=YHd6VUqA0/CA0ureVgF9b9WfRAmNKvIPjRj+3l5j4M19bvmN5qBJwiETB91N2OhNwg
         guRm7VblpK7yeblPE2Om2SsSXeqPg9RpfN2cPKgXY3fBXzCcZ5VR3eyqdA8COqoyNMev
         11PwHf+AyKtPk2CvgJrNrQ2tr7QuZO+fCDMt79UStFoVFM02I1q2OeggHQuKfo5BmcHr
         Icjt0YJO+mMPCcvlTR8x/gDtFeDW6RlCvijaf4ZVUZWrCdVsqXBu4O5QbAWJzelWwhqP
         HBRfe5gpnW8Exb1aNHI7cHx/x13aZlkTha2EG3xLXhgwhr79bmKa+He4w0iOASO3Bi6M
         D5Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786667200; x=1787272000;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UFXwbGyK5jIFIfkWoQscdqjN7Om8mpDa9VVLSjQbEo4=;
        b=ByCuDKmI7/x+lOukYzyxv0H4JZprPnCq8FX+QuYRFSZfXCamR2OpeO8eDr0UPOYMuZ
         I2Yvh3bF3Q4P3RmD5FpVQqnkaKuOF7arYG1qldobCXGXwmIN+CfSmAr3REaCp6b2bll9
         sOsr4YVDVqft/D/TnPdiLNmog2LJfTd4fokjF31VIKRTR6YZZKAXfrXkS2cB9ukLomnu
         h6uv7mTwV+xJulBqZ+Mtb15L7HrEft5VMAXBkDBgYNZvq3sXd3Qmcy0cPWGSi2mQNSHp
         GnLL19wpuikR3sjpnQ8DHgU3CpzPxsF2ZAkBUTVjdC0okSCdB8t0dqEUy+99nlBuoV8k
         5LjA==
X-Gm-Message-State: AOJu0YwpXP6jvrSuenRGBhA9EnyR8vObdnru7rgz4fUbkWS1bwF+uOEC
	C1mhInwr0dYj5YmXKEutPg3REim0x54CFZAov8PlpGN3GQVuX9OdMluJ
X-Gm-Gg: AR+sD11BSqwxGb2flQIcRePAMCKbKPA7jNESewFas0NkQqxNmC/LnWHvpgOj7uiINpO
	WkXwoXS28dUfOlcUowHcHIrVQB7+xXj2Z8wqARwSGvywpyepbpoJT0U/DoCbLWaH06kN8nNuR9X
	OGZco1zwOvdQ2RYzTB5xboe8QvFeTa0PqEBm9nTPyIjBeA2DU/jeRTJ/yAo43tLU9ofdj2HSWPT
	0ue13VM7llj/Jldp4K/5h3q+tNyzhglRJvjnTR1oCrhS5Fh4UXw+TLCSoGX7WtKHXk2oFopDyzr
	+mNqahJPGFpZoNn92AzwMUWjXJDVMKg0zXvoCgv8MYWoMD442o5Bh4MEsmKl+li/J+zFgnOjBP0
	WqesZy9RdfqwKEKa2w4mR8iyJWWSrPKZjUwAJZFNH1Pz8OzCuEY1jI2RyG62N12N4Nkq5ow1g2p
	PAZmQzPeteeReGM6Rba2A80nRBWTYb8jWwiPRzeAvXzpXqzavLR8KnlbkeopqANY0j
X-Received: by 2002:a17:903:b87:b0:2c9:d55d:2d3 with SMTP id d9443c01a7336-2d3b0c7d250mr22530095ad.15.1786667199731;
        Thu, 13 Aug 2026 17:26:39 -0700 (PDT)
Received: from [127.0.1.1] ([2804:14d:9ea1:8718:bb46:57cc:bba6:6246])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31ebf731dbasm14666255eec.17.2026.08.13.17.26.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 17:26:39 -0700 (PDT)
From: Leonardo Martins Martins <dev.lmmrtns@gmail.com>
Date: Thu, 13 Aug 2026 21:25:53 -0300
Subject: [PATCH 2/2] staging: rtl8723bs: remove unused macro
 N_BYTE_ALIGMENT()
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260813-staging-testing-v1-2-8baa7c210474@gmail.com>
References: <20260813-staging-testing-v1-0-8baa7c210474@gmail.com>
In-Reply-To: <20260813-staging-testing-v1-0-8baa7c210474@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Leonardo Martins Martins <dev.lmmrtns@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786667193; l=1026;
 i=dev.lmmrtns@gmail.com; s=20260813; h=from:subject:message-id;
 bh=RSLGoWLMTcui+x+1Yav6CBKnpnMwFhAaQIkQaXugPaI=;
 b=OhYRJ3j+PYmZDqYFEqabi1sg5ZxXhj1BVF42u5V7f1vlZOehQJjx/JSspdXRLfS2myNWoeGNz
 Siq/0llWEkxAezU3kcYcR1wHxGtX+QXS5jNoDdDrg4x72OjZjafVavZ
X-Developer-Key: i=dev.lmmrtns@gmail.com; a=ed25519;
 pk=dOFSCpUL7hbyVftAaUGDebsgsSl9Uk/Tx0Aqpd4Bcng=

The macro N_BYTE_ALIGMENT() no longer has any usages and can be removed.

Signed-off-by: Leonardo Martins Martins <dev.lmmrtns@gmail.com>
---
 drivers/staging/rtl8723bs/include/basic_types.h | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/basic_types.h b/drivers/staging/rtl8723bs/include/basic_types.h
index b6b1afaa9ab843ba8459b76548735a2e04317929..a9924a6fa0e952bc069506758deee70ea145cbff 100644
--- a/drivers/staging/rtl8723bs/include/basic_types.h
+++ b/drivers/staging/rtl8723bs/include/basic_types.h
@@ -163,9 +163,6 @@
 		); \
 }
 
-/*  Get the N-bytes alignent offset from the current length */
-#define N_BYTE_ALIGMENT(__Value, __Aligment) ((__Aligment == 1) ? (__Value) : (((__Value + __Aligment - 1) / __Aligment) * __Aligment))
-
 #define TEST_FLAG(__Flag, __testFlag)		(((__Flag) & (__testFlag)) != 0)
 #define SET_FLAG(__Flag, __setFlag)			((__Flag) |= __setFlag)
 #define CLEAR_FLAG(__Flag, __clearFlag)		((__Flag) &= ~(__clearFlag))

-- 
2.47.3

