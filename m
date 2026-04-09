Received: from mail-dy1-f194.google.com (mail-dy1-f194.google.com [74.125.82.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD3EE3431EF
	for <linux-staging@lists.linux.dev>; Thu,  9 Apr 2026 15:58:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775750330; cv=none; b=jmCfyBZPxMzkgLPQZiGLOP9FrOF4pAGOf4gm+IUK6YFVrcoqX1tEAC/G5IlSofVCPy6rNLDGPSJ/zxY11MbJL7jLL3SeU6yqqwiv2mL082QCgaZhFS5/TxU4r1X29JeAn76tI1avz+fmwyqzE60QD1vJO93/W9W972egjpLfIO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775750330; c=relaxed/simple;
	bh=+vHcx9lI7yya0W7s1XmjAsO9BEU7Hgjmcx7FM3fwsWw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=CPcj14WBR4oGrRAF3zLryqjRU7iZ+mub10pIJ4ud5ImJ8vXLOKSWkVKNaVEaDZ+KSfqbOEbCouEPG6aSuZ32Ad237SLqJO3d4E8bHfv7A2Po125/8xqsh9WpgbEiZB6tAP3c3XxhlRc4xibsjjn1DV2bg0fSwQTNh45knCBHbys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bCrmrk/r; arc=none smtp.client-ip=74.125.82.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bCrmrk/r"
Received: by mail-dy1-f194.google.com with SMTP id 5a478bee46e88-2d18dfa2713so764120eec.0
        for <linux-staging@lists.linux.dev>; Thu, 09 Apr 2026 08:58:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775750328; x=1776355128; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ynn/Tv7vt536YLRzFScHBlkRRyfwxHMbDNUUOzExOGQ=;
        b=bCrmrk/rTAxzTkPA7r+70jF++1uvBdCntFU/1i4WNs7DUSumlWfXOTYikLUObMwV5o
         NN3sdyCONmTmW87/1lp8bWOMPCIrGMw/fSryf9P6Sq24/yRhdl6fTYhPjHm6lmyaF1dn
         LOl2nrkahNmc1KGf43HzFaW1mLl3RaQo62tnUUNHpNxYodotTpPhldDBMvQalmHi/TJF
         uYi2utkMY+bxMBqwV3vAqa7AYNtpmvCzhW//bV09mA0rtleTgCtgiOukeS1b61qJrRGx
         RDRFMhERZhWKEx9faMKluD97muwsTBV96bogDvT/P/0xJsNg0DF/P6o6jIunGW0L0XDn
         gQDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775750328; x=1776355128;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ynn/Tv7vt536YLRzFScHBlkRRyfwxHMbDNUUOzExOGQ=;
        b=Kxj1eho6SIIIPRVp5fSxl/hSGOliPWxOfgZRprhV8GiqosnrKUuJCKfJ1j45PWtQzp
         Hni7cass41s8Y+/8h42A38rGc6Seua/26RgEpzsAb8Xw0hMEw5nP3PGJLCuu60pjXHNm
         hV1Hw/+AWhMnwP+6qrr2SycjpjM1YMvrojFpA6k0v75E+M6bx+I+zRnjHMm9scFkeAUK
         RzQpAQyJC2yVzIyLt2rrPrCCsUfvVAC7ydab63reCCgVHrAU7Ois4eVinPaoCjY2aO6E
         RDV3bOAAQjn+w7R5bl4es/bnkSPJbT15rbLiscKVFwFy6TcrMjszw04cvxtBiXHM2nsA
         llvQ==
X-Forwarded-Encrypted: i=1; AJvYcCWFYfwFxddVzepVXHjRwXQBJ8LItOyiOBCE1Ta1j4/JtbDVS51X0VLg2ofdEKnUbReqEDyXcUi3hpPRpeUv@lists.linux.dev
X-Gm-Message-State: AOJu0YxTspkWZsPc/sEuiMVFigt9bfZfdgbKZkILGYrBT4ZjtjQSzyoa
	fVdTqRbdkzSRxggimOpYF9kJuyE6jKE2dAjbgLpzG0gfKwT6riq10Ewb
X-Gm-Gg: AeBDiesoTlN71YngAhQh12vSXczmQtkZ6Nn7sV5YXr9gXPbhYxW26+1R8pl9iN7yNCy
	Q9Vf41rT6Armkmn09ttXdSXRa7UYbCoIcJqF7aFdPD0+q4RmAefBRqNHddelFApzyYlTsn9+SSc
	34L5NBnJQAW7IIXPREWb2jsaDriLvxOvTqkN1GMCmfilT0fVKERLQ62sJ848PWs6xneAoiIf1W4
	fHEMupMX1DAvAwxaKJSQ9A0mapOi3bRw1caWTpDQ5IiWDLOzee9gd9iDhJPnM0FHhdbi+xJY0gH
	imCOjP1GUlQqkwKOqUYVjCZNI/SiT8al8gr6niq6Us2EDxvZIIkDyKpmZELFfWAcg+DRgmfBHfz
	p46d8VhctSBAOTgmKCGv9NW3xaOZdo8DoQ1YLb6fMJB+a0I227FRWP1DxqdHUkt5mGBtf6CFNsj
	VsxIyorGzGk7v32sasv7PnUiC48FC6V06SfaGh2EB/8C/T/v+yJsqHZz0=
X-Received: by 2002:a05:7300:1493:b0:2cf:28e8:d784 with SMTP id 5a478bee46e88-2cf28e8dcd7mr9670632eec.19.1775750327897;
        Thu, 09 Apr 2026 08:58:47 -0700 (PDT)
Received: from localhost.localdomain ([76.32.119.210])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2d5621d5e43sm153746eec.21.2026.04.09.08.58.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 08:58:47 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Teddy Wang <teddy.wang@siliconmotion.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH v2 1/2] staging: sm750fb: return -ETIMEDOUT on timeout in de_wait functions
Date: Thu,  9 Apr 2026 15:58:20 +0000
Message-Id: <20260409155821.23375-2-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260409155821.23375-1-dennylin0707@gmail.com>
References: <20260409155821.23375-1-dennylin0707@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The hw_sm750le_de_wait() and hw_sm750_de_wait() functions return -1
when a timeout occurs. Replace these with -ETIMEDOUT to use a proper
errno value and better describe the error condition.

All callers check the return value as non-zero, so this change does
not alter existing behavior.

Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 drivers/staging/sm750fb/sm750_hw.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/sm750fb/sm750_hw.c b/drivers/staging/sm750fb/sm750_hw.c
index a2798d428663..3809401baa3a 100644
--- a/drivers/staging/sm750fb/sm750_hw.c
+++ b/drivers/staging/sm750fb/sm750_hw.c
@@ -502,7 +502,7 @@ int hw_sm750le_de_wait(void)
 			return 0;
 	}
 	/* timeout error */
-	return -1;
+	return -ETIMEDOUT;
 }
 
 int hw_sm750_de_wait(void)
@@ -520,7 +520,7 @@ int hw_sm750_de_wait(void)
 			return 0;
 	}
 	/* timeout error */
-	return -1;
+	return -ETIMEDOUT;
 }
 
 int hw_sm750_pan_display(struct lynxfb_crtc *crtc,
-- 
2.34.1

