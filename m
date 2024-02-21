Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09A73126F00
	for <linux-staging@lists.linux.dev>; Wed, 21 Feb 2024 21:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708551907; cv=none; b=M2ferSALfZTCbn746lAc2wQk/mI/fTNy0s8mX6VqkvdawaV+STvnjuCoRQCGUyn3rRO5T+7/zQXXUnlwm362wafQUUsrOUa6UoKlRp3iikpNxqlz1Y5cbdCBFOuLVXT3RECH+M1cWoq/zdU3Npy5uJiDzVTGxjdy7h1jBukZ/vw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708551907; c=relaxed/simple;
	bh=ZPuEGR02MJoL4k4cqYutB0mEV/A2o13a+K+wdiOYt6M=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QJcnDQSWXe3iSE9xJmsUVWVH1XW5Ko3TXJtGW62zvkesBG2UC6SK78ZbbubOReXu9UVH7uTrBXPqqArVTiZidSj7/XIolYhPgwaJpNnu7RY6UWRPJQ3WaA+HY5gSrM6ayBMEZxPPAD16bIVvPOAHzQk5hkRvlB+hc21Q1nRLDcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NADcBFFp; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NADcBFFp"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-33d4efb419bso527263f8f.1
        for <linux-staging@lists.linux.dev>; Wed, 21 Feb 2024 13:45:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708551904; x=1709156704; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cYLsu8b5gS7pL7FVTOIGXi/uA3Al1fdlKI5v25Vpme8=;
        b=NADcBFFpxvhyJCovLXXBGMnKNlEbVGptS8O2hdBu4DugjyBjbedKsNwjm9wvuLI/B9
         3TCAfhrZU1RnrA9EiiPbvyVx583/p23V+t6t/MXIe1p3HLZc/CZurpnVwe0wue8aNcKM
         dRuwkDJjm+ORdi7zi24P/lHOZ6HfgXdfh0zu+dTyk4qlgfyK3XxKL6wYFR2FY/AXmyl9
         ga9vGMRsjRwikNrwchZz4FmmRavJNuIcaa3P6zqKp4wdhTi89RJyTocDUAxy+bb/X4o7
         l957QVHfz6jONkPw7MQfnL7HJ7l+kild34B1zd41/CSRUO6bKKZjobO8+6yuz7Mz/iQY
         1rxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708551904; x=1709156704;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cYLsu8b5gS7pL7FVTOIGXi/uA3Al1fdlKI5v25Vpme8=;
        b=n5lADhZMasiENDKDdNxcX/1b0cHkxifBY3HJOBPC86H8Wn5MuFq6ffbBLfB3uqmdNo
         mKInnSRaxyAdyNd5VJvoAWFlfHa3AKlSSBlhArofPAspPOVU2JGLCgJN3Wcf+LRaeCnx
         t3FFjgGbyXWGI3FdRJt1659WzQM9p4zzDmzFgiYqzZ/Rm7WvHSHFaA7OpE3JZvV+KXTY
         /8oCe1X2kNF4DJSb/poQb47+AEZ/Y5W7gS0S+10Bhv1mYUJuNz3kYq1O/kr3Tr0rcZFI
         jHrVbHlKHyhSNqpGL0e4se2d4uROJSw+/+90V50UDDI6akFdl5TvUHMDfNE2MJReSuu9
         3cJw==
X-Forwarded-Encrypted: i=1; AJvYcCU0RfFmRXNwtPHcIBnVEiX0AuRGJTmQ8kO/y8ptekOK4vR/aWYWoFZMGitadyLJVeACgiYwk4khr9BmARLEBin7U2PCH/klTUDqvvXwcQ==
X-Gm-Message-State: AOJu0Yzdl8wASj0QH4wBylMxnCMrInxIOcb5nfu3OkwhNOPW2KgwuA/x
	F9Xk464NWGW76QGctxffyjLluZDs0v4oI9uRf5TVKNjtObk9ldfq/V/XwUcXspQ=
X-Google-Smtp-Source: AGHT+IGAEP17ozOz4gedlovqxGmsaBEUXdqi9aioc7LXfG1ot6BAZj53rKmERrq3S2/GFedPMwjFJg==
X-Received: by 2002:a05:600c:1c24:b0:412:5670:ef62 with SMTP id j36-20020a05600c1c2400b004125670ef62mr416716wms.1.1708551904136;
        Wed, 21 Feb 2024 13:45:04 -0800 (PST)
Received: from matrix-ESPRIMO-P710 (p54a07fa0.dip0.t-ipconnect.de. [84.160.127.160])
        by smtp.gmail.com with ESMTPSA id b7-20020a05600c11c700b00411c3c2fc55sm18936261wmi.45.2024.02.21.13.44.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Feb 2024 13:45:00 -0800 (PST)
Date: Wed, 21 Feb 2024 22:44:57 +0100
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 2/8] staging: rtl8192e: Remove variables Wakeup, Reserved0
 and AGC
Message-ID: <ed88686c1e9213dac1cc8f698f7dea8cb5fa01f9.1708461563.git.philipp.g.hortmann@gmail.com>
References: <cover.1708461563.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1708461563.git.philipp.g.hortmann@gmail.com>

Remove unused variables Wakeup, Reserved0 and AGC.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtllib.h | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index 945874c1495d..bc4479f7d089 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -485,9 +485,6 @@ struct rtllib_rx_stats {
 	u16 bICV:1;
 	u16 bShortPreamble:1;
 	u16 Decrypted:1;
-	u16 Wakeup:1;
-	u16 Reserved0:1;
-	u8  AGC;
 	u32 TimeStampLow;
 	u32 TimeStampHigh;
 	bool bShift;
-- 
2.43.2

