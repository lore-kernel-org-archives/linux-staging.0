Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECFFA8F54
	for <linux-staging@lists.linux.dev>; Fri, 31 Mar 2023 21:28:07 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id eh3so94766124edb.11
        for <linux-staging@lists.linux.dev>; Fri, 31 Mar 2023 14:28:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680298086; x=1682890086;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=e9uZA67W0J8w9CI902YQgQUJeWdtlUq1O49C7+5+Pz8=;
        b=U1nS8FwPD58ih3N7LbDn1tTS+raRgE8DI4T3z1JbCUvgfuCM4RlncHg2TlsQtQHCMI
         gr0qGfXdxErOiVLueD7Z1YE6Bx45IodE6fual4LiKeQp4DpkQgEr841oLAmpV9tuYC2Y
         LKfDo5F5mx/+CTj9S4WdpE1EkuF60X9ivDz2XbTvsEY6IrRXLa9ExRvlfaTPbLe8PopN
         KYsaQ5EGe8N3eJO2pR7VaS6XzOxAS6YNqKCYmtRg9dOP5NW3i28mTJB4gJiqIRD8SH4L
         fNpqrnUEVU+4f9Pm5yeqLJZaLCnhMh8YofkYZaeD1tQfLRWMM7goBLLTtPrAiT5oGiMP
         nSzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680298086; x=1682890086;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e9uZA67W0J8w9CI902YQgQUJeWdtlUq1O49C7+5+Pz8=;
        b=aWtb1EN9CwTPXuzy9xVij8fi2mO3prCGv/9JCwzZH8wWYmfuuWUFc7fsUwHFPD9poS
         /RFj6quyCevXblEbXTcDGvTfSSt1rPdC9zHTMPDTFF9riUaeD4Rsq6skEOJnDmFAMowP
         TtmJThAl1B+L7o4/2XK0pc9N4VNCWuc9cryZuOs42mP/g3bUOoTAURv8zchmYvB0Ktbo
         KGoMOgXcIBuOyMmDqkpslZDlBLpauBQ7t0/WHVX28vSn3o1SgF93WJJ4eLH5G6VjWRXC
         ZO6IFTc5ayrZy7zn2BSQZk+n9uqzl1HQXpP06YVM/EHmAOvlN6CKFXZd6ZzgQkcBKyyH
         hOjQ==
X-Gm-Message-State: AAQBX9d7iXe8rAxy/ZoKD+B6Z98L3E+kQvc3DSgUfIGfCY6zSzBMKoGt
	D8k/u7IhH651rkSstPMFfVL2KUXMhWQ=
X-Google-Smtp-Source: AKy350a+9GIqV36l6mzsxYJ2WdxKzCqvhSjUnkPcecT7weya6li6mBC9FORXKpZOY/0nu4jkxr9OrQ==
X-Received: by 2002:a17:906:15c:b0:8f5:14ab:94bc with SMTP id 28-20020a170906015c00b008f514ab94bcmr24544306ejh.6.1680298086210;
        Fri, 31 Mar 2023 14:28:06 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p57935146.dip0.t-ipconnect.de. [87.147.81.70])
        by smtp.gmail.com with ESMTPSA id tq24-20020a170907c51800b00947abb70c93sm1092989ejc.112.2023.03.31.14.28.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Mar 2023 14:28:05 -0700 (PDT)
Date: Fri, 31 Mar 2023 23:28:03 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 1/5] staging: rtl8192e: Remove enum RF_1T2R
Message-ID: <97fef03c12dbc619aab749867fa20686af2b8e3b.1680297150.git.philipp.g.hortmann@gmail.com>
References: <cover.1680297150.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1680297150.git.philipp.g.hortmann@gmail.com>

enum RF_1T2R is used to initialize a local variable that is then shifted.
The result of the shift is zero. Remove code that has always the same
result to increase readability.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/rtl_dm.c | 3 +--
 drivers/staging/rtl8192e/rtllib.h          | 4 ----
 2 files changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c b/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
index b5f4d0230da7..2100d9d4e940 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
@@ -531,8 +531,7 @@ static void _rtl92e_dm_tx_power_tracking_callback_tssi(struct net_device *dev)
 	priv->rtllib->bdynamic_txpower_enable = false;
 
 	powerlevelOFDM24G = priv->pwr_track >> 24;
-	RF_Type = RF_1T2R;
-	Value = (RF_Type<<8) | powerlevelOFDM24G;
+	Value = powerlevelOFDM24G;
 
 	for (j = 0; j <= 30; j++) {
 
diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index 197c0a44ebd6..7d83a4c322cf 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -433,10 +433,6 @@ enum led_ctl_mode {
 	LED_CTL_START_TO_LINK = 8,
 };
 
-enum rt_rf_type_def {
-	RF_1T2R = 0,
-};
-
 enum wireless_mode {
 	WIRELESS_MODE_UNKNOWN = 0x00,
 	WIRELESS_MODE_A = 0x01,
-- 
2.40.0

