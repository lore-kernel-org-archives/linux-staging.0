Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5A811B75
	for <linux-staging@lists.linux.dev>; Wed, 16 Feb 2022 19:40:48 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id q17so5764686edd.4
        for <linux-staging@lists.linux.dev>; Wed, 16 Feb 2022 11:40:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=iJs3wZPlit28Aegqoi78pEIwXS8QXed5MWvYu0xvZbg=;
        b=Fp1uM02j+TYjGS31e1VCPfXg6fT0NKA1apVGS9w1+829yEnKXvnGdYVrOgUCp7p4Wp
         feXTS6zsV/kkzY2LjlioJrsUcSwjWH0A/0Vlp9ZKajBjaAIkp5BV20Z9tb51s8CLvzkg
         qjqNdE2d1yIH5HDSp/kYhZMDJ0+TYUvtWZKlO7U1ZAIJKvu/P6Rj63ljESDdZGNxS4EZ
         5gYNwoMVT9+gpUWsJi7mxb9rObUM1YQAoRfUkFjrcfXci8XBC7Nc6MFXlh9iWlkfqvY8
         bb/7UQcQVm1MyKF5rXQwEshuY2PJTFNCV2fmFuABlAhlfdtlDEQbOnObeNVsKTu/JtZ1
         4dBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=iJs3wZPlit28Aegqoi78pEIwXS8QXed5MWvYu0xvZbg=;
        b=O0Za4iAKG7b58tNjdbpp5Kp+qyae0wWL/1nN4MAJ/h+A/ZoomQlQl2jJq+VHEgt+rN
         oCP1sJq3hZiLONCWiMvvms6dfuSjJOYHne5U5/q2+2282eYav4uwpJjALsBm5nhaxIkW
         uCVGuuq2t40uiG/n0B0fVHmp57/WZ1SNg0EUVpFwBSUrIfE038zOQX7K16gudD06Ff+C
         nRFnkQiMZ6bw5lpPAfDqwrDXKGWjIVdWRBfSLVQG8bQ7/TjGOxvWKGDFb3c8knklINW6
         0YLqde6rxQ7f0LVqnOtQp6gfaShtYuf2zn2MW8Xg6S/z+cRgqh0GMUSNBL1FRFw7Ur8b
         HvKQ==
X-Gm-Message-State: AOAM533B3rHovEp2ibUSFcFcFJlzbVBuBSO08iuPiu7uG8IgTxCg7hE7
	A43AyMMM7fv5/hHs4NuYNbE=
X-Google-Smtp-Source: ABdhPJxG87pANgnSnKv1kyrdeZ8E03fWeAZcr7r+P6afhuNU7TN961B0EbomRbxiDwEvbcplwEI9NQ==
X-Received: by 2002:a05:6402:5108:b0:410:d312:924 with SMTP id m8-20020a056402510800b00410d3120924mr4549999edd.430.1645040447067;
        Wed, 16 Feb 2022 11:40:47 -0800 (PST)
Received: from localhost.localdomain (ip5f5abb8c.dynamic.kabel-deutschland.de. [95.90.187.140])
        by smtp.gmail.com with ESMTPSA id z18sm276910ejl.78.2022.02.16.11.40.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Feb 2022 11:40:46 -0800 (PST)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 1/3] staging: r8188eu: remove unused enum
Date: Wed, 16 Feb 2022 20:40:36 +0100
Message-Id: <20220216194038.6762-2-straube.linux@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220216194038.6762-1-straube.linux@gmail.com>
References: <20220216194038.6762-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove an unused enum from usb_halinit.c.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/hal/usb_halinit.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/usb_halinit.c b/drivers/staging/r8188eu/hal/usb_halinit.c
index 3b8869455166..ca2833d3e7dc 100644
--- a/drivers/staging/r8188eu/hal/usb_halinit.c
+++ b/drivers/staging/r8188eu/hal/usb_halinit.c
@@ -484,11 +484,6 @@ static void _BBTurnOnBlock(struct adapter *Adapter)
 	rtl8188e_PHY_SetBBReg(Adapter, rFPGA0_RFMOD, bOFDMEn, 0x1);
 }
 
-enum {
-	Antenna_Lfet = 1,
-	Antenna_Right = 2,
-};
-
 static void _InitAntenna_Selection(struct adapter *Adapter)
 {
 	struct hal_data_8188e *haldata = &Adapter->haldata;
-- 
2.35.1

