Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E621E28FA
	for <linux-staging@lists.linux.dev>; Sun, 29 May 2022 16:02:14 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id n28so1940448edb.9
        for <linux-staging@lists.linux.dev>; Sun, 29 May 2022 09:02:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=Y3B4JZc0tJVQibu4pURKDCtGwMrc3nd8jQV/wUq90Zw=;
        b=em1w4StfSos19j40lyb+/be22kzVxn7G/I3W4JwuNHOvN4iGIa2ef3tWsPiUVMxHNg
         85jnlzkOXrISYDMWAU6tWjuqU1HURAfeQ6ph1Xg2oAUo5sW9DsUK6GdojH/GS0s+yAUN
         iEgei2zhZq3cXN3kYvK2LkAckxMH5x5EInZl6dd7hwhq1aKvOa0wLNUU7f6ssm3z9cQ2
         R2j0nEpTrRsv+sArXatLNWurpVRibi3lOiCkYw8eelmaM72+A5EFpmTc3xMXGVGENr6l
         NCsOI7iadbIP5X7z4sA78Cpw4ccSm/iGPpC6Xz18dpQFMb7fhU4YjsITzPipVuqLE/Je
         0pOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=Y3B4JZc0tJVQibu4pURKDCtGwMrc3nd8jQV/wUq90Zw=;
        b=C057T1eYKHNoVB1ZEa/3sMPHJN/mWmJngM1d0asduHI+r1cvmCRT/ltVKolE4/E9Wo
         XzHH++exm7CKLx1khOG39FY/DQU5MqQIUFHx+JQmlcXlZtvIHcSMucxRc6lPpjqE+s+U
         1UJXrQN0GyosZiCI3kOjQl3BmdCveA2hMSv6yNxifsvZ01oUNH32o0X/LB7KIEpq+Lrz
         Gwa6aoKtXXKOq7P//1GQLxmoxKfXU/mXPV85wojirtr0zlgt9rAenSUMq7FncHssv3iX
         50lL39RLboaM8mFxH/oij4Q9CyqyHxHtmt1oSPTy+hkP5roG32V7ik42DRERdmnWJigI
         OmXg==
X-Gm-Message-State: AOAM532u0LWd6L2Nk3W3p0Xq3x3gM2kJMxHkcqXpyW5r7DzAH9c8sRDV
	K9KE9pKHemwV1UAol6ALHqODxUy8R1Y=
X-Google-Smtp-Source: ABdhPJwSgAn+H/JeFL/UFPK5bvm3iusctA/PYX326/2Rtqnj9KlxEiBdKsznOjfanIFSqRPagc84/A==
X-Received: by 2002:aa7:c444:0:b0:42d:d1d9:e4d8 with SMTP id n4-20020aa7c444000000b0042dd1d9e4d8mr855508edr.145.1653840132941;
        Sun, 29 May 2022 09:02:12 -0700 (PDT)
Received: from nam-dell ([2a02:8109:afbf:ed88:435:610d:d1eb:dc05])
        by smtp.gmail.com with ESMTPSA id mp33-20020a1709071b2100b006fecf62536asm3208151ejc.188.2022.05.29.09.02.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 May 2022 09:02:12 -0700 (PDT)
Date: Sun, 29 May 2022 18:02:11 +0200
From: Nam Cao <namcaov@gmail.com>
To: gregkh@linuxfoundation.org
Cc: forest@alittletooquiet.net, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH] staging: vt6655: Update function description
Message-ID: <20220529160211.GA5805@nam-dell>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The function vt6655_get_current_tsf has been updated while its
description has not. Update the description to correctly reflect
what it does.

Signed-off-by: Nam Cao <namcaov@gmail.com>
---
 drivers/staging/vt6655/card.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/vt6655/card.c b/drivers/staging/vt6655/card.c
index 2cde0082fc03..ce9b2f0dbd58 100644
--- a/drivers/staging/vt6655/card.c
+++ b/drivers/staging/vt6655/card.c
@@ -734,9 +734,9 @@ u64 CARDqGetTSFOffset(unsigned char byRxRate, u64 qwTSF1, u64 qwTSF2)
  *  In:
  *      priv         - The adapter to be read
  *  Out:
- *      qwCurrTSF       - Current TSF counter
+ *      none
  *
- * Return Value: true if success; otherwise false
+ * Return Value: Current TSF counter
  */
 u64 vt6655_get_current_tsf(struct vnt_private *priv)
 {
-- 
2.25.1

