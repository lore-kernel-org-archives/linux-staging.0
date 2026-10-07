Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B20B477286
	for <linux-staging@lists.linux.dev>; Wed,  7 Oct 2026 10:11:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791367889; cv=none; b=Be/wwfQv5CauOxEqFzKZQkD69r2N9v1udouWlVOp0fJ1/GI9hJMbAZaeVm15TGA9O4PGG0hi9dva55Cojg4wLd0SZs6+0FqwNS7sefGsxnnSVEnhHVWFx522HnHGdOBFMX9tB9KTdPz0v6BeY0bdQIdyubkwEcti1Z9yZnC51Vg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791367889; c=relaxed/simple;
	bh=4tpoZwvY+uwwBry29ZcBQE0jX740QQCVLmeeTWleFIo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HVUqncFMnuzX+QMkWrBYhEckfJ1c224DseVRYfPmEMEL1aK8XqssUufayQ0bnypv5bPGlD727h6rohlu2JoJA9pt6gFft3KjE39ancigpHHoBnXSA1rBan270BP8uBa/21uxn1TttLLNseGpSu6KfAY0wcXsn7m15HXXf3ML1Yc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NN9dWveN; arc=none smtp.client-ip=74.125.82.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NN9dWveN"
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-141395927feso2393147c88.0
        for <linux-staging@lists.linux.dev>; Wed, 07 Oct 2026 03:11:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791367879; x=1791972679; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+Y/2HgrGdfa3RjhvPeUuDU/lbciiQ3poM/eU576l20g=;
        b=NN9dWveNwSLo4tcV3EkHwzKNJYpLORLSPG7UkgdzUdwheV09bWS+O0HXpcI26EkFnj
         oXYOfGnfwwL61fw+l9bHBVUMK6O+VheMA4KyKilJCjGOL9buSRWNTWVTVvWl0dJw694g
         hjOGqW62B6r1JxV9OR3qHaM4EQCfG5+EfNGc9C8Sou+1b5wYf3fnse4JBmsyMe14I/ZM
         TOIxvZmTNBtkkmlS+AEEmD/Y8jZ7H/WrdMHZsWLl39SWVM53Yxw5dG7M9Z35BCks3nQp
         Xpd4Jbfcp4Vt2+lRc4Qppp9Nt48/JrbeRUaqctkf1GNA6OX6UMysffTGL3gC0qovj07O
         brfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791367879; x=1791972679;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+Y/2HgrGdfa3RjhvPeUuDU/lbciiQ3poM/eU576l20g=;
        b=C0XZ3AymTSc3l5iBWRscc3BPa7h5lEhz44hb0B8IkGcLNdHtMUkqCcmUHorOHsl9UP
         UKymKHeF7Id6EzPJ2iy9KcBXbHrguOPaTFf6ra5efNg3+ZaoNSANReBSOWqd0dvpIIMk
         +hG1ODAMJIKFukF2sGerpEMfWqgPFLrlUCc64eIslrq01Ruok8YULFt17Z9DMAO44yof
         fMYObptbv2WbTrRqAe8EXv7zcNyp7kPXOLxkYJG7yrsPZSog4Q8+R2gGU1EGskcImFZ1
         it0JuXLu3Zf9MMubJF1N7LWXTOmzJjhDBFXrHY4i8pzYqJnwV8uvk88UblJhvhaBGIBT
         4qGA==
X-Forwarded-Encrypted: i=1; AKwUvBw04UQ0qB4ryOw2lGethj23lETtpHlyXo+5dGtdXda1COvKWdq4u9c+efjXFI0TpFrB2OIhqWJNWMQvXEHv@lists.linux.dev
X-Gm-Message-State: AFuF++kC2kAuSOPPdh9+24ny9MxBXhLujyEmYqcbSEEXK9pz2Z+gZdev
	X1WHXB/ObapxlBYcLf33v5v91vwoWLPyLfnwiKacmPWHIFebJsP1UcbU
X-Gm-Gg: AYBFou1nK33pbMRaRIA2hNEryIDpeogSLD9naN7gF6nhMi88bHK6XHg42dondyc6fyp
	aQOfwQY1p77HVw7SRzPNtNZLNfdpeSZuag/vTZrQrSa6KXfgEkXi3tFDuEeRA+9/GWRrH8pEu4Z
	5mRZDxY7+pSdvCG5BlSqs1+TZcRHz0QO0be/aWvg3Q+m6Jf62RW5J5280JQMD3+AsYh/2IWv25H
	SlkQr+L8g2zUBTHD39YPs7w5xxEvCOyzSnDSIDVNEIWcCnF4zVPZGFA3tUJIPv/W36iNV7XMCOf
	RlFgfvHMTm8qXVSMHRxBPG80uibrz79h3gBJsZoBLrJQML9brvNgMmlDzI5osCaTX0DNRgjfGue
	Z8+wRU6omkWuks/cHsoWSc1HmmmRnFE011XRyCsCpeyfZaMfH6aYhBUh6dk6x42AKwBx78dJ9o6
	jjoJP1fRnJK/sV2KPxOkdfx7G3qzPATV0PvbnF6GIKZVxsVyq2N5FM8fsahGVaIg==
X-Received: by 2002:a05:701b:2804:b0:144:f096:4dda with SMTP id a92af1059eb24-16208711b35mr1709824c88.43.1791367878644;
        Wed, 07 Oct 2026 03:11:18 -0700 (PDT)
Received: from gmail.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-16352800ed6sm2606714c88.9.2026.10.07.03.11.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 03:11:18 -0700 (PDT)
From: pdsj2807@gmail.com
To: sudipm.mukherjee@gmail.com,
	teddy.wang@siliconmotion.com
Cc: gregkh@linuxfoundation.org,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Palak Raval <pdsj2807@gmail.com>
Subject: [PATCH] staging: sm750fb: make g_fbmode array const
Date: Wed,  7 Oct 2026 15:40:59 +0530
Message-ID: <20261007101109.707077-1-pdsj2807@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Palak Raval <pdsj2807@gmail.com>

Make the g_fbmode array of pointers const since its entries are not
modified.

Signed-off-by: Palak Raval <pdsj2807@gmail.com>
---
 drivers/staging/sm750fb/sm750.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
index 8b93bfeb217b..a24b21f4936a 100644
--- a/drivers/staging/sm750fb/sm750.c
+++ b/drivers/staging/sm750fb/sm750.c
@@ -12,7 +12,7 @@
 static int g_hwcursor = 1;
 static int g_noaccel __ro_after_init;
 static int g_nomtrr __ro_after_init;
-static const char *g_fbmode[] = {NULL, NULL};
+static const char *const g_fbmode[] = {NULL, NULL};
 static const char *g_def_fbmode = "1024x768-32@60";
 static char *g_settings;
 static int g_dualview __ro_after_init;
-- 
2.43.0

