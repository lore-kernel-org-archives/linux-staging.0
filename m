Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B8F32C81
	for <linux-staging@lists.linux.dev>; Sat, 30 Oct 2021 10:08:29 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id z20so47402196edc.13
        for <linux-staging@lists.linux.dev>; Sat, 30 Oct 2021 03:08:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=HE905+MxEiHTk1h53yo3X0RtwuTxMCQrdFVYdDeiBxQ=;
        b=etNgcLl7Rjg04fIFN+NmvOp8NiwyD75XNe4vlvzCdMfJnSpmNsv2uIHUw807Kk5cZi
         47za0VtRM90Tw04NCuDNTpm5KM9u7Oq2XbYKdFZEH3RUyWkaQJxZDpBjevA81s/IPchm
         K1/LeR2sxgUYinbj0z13lgKBzAEOEeZYQw6beJxQd1s5zLdk5HDP0OxlyOoraKEcL48Q
         EDMpwp6i/ELSnVlA6QHOMzQRMh2DmS/3lFeloHMkisBYamtEIXghVUkuW+5pmn7BtAgi
         bo+YtQQJGz972zMz/quD+GkMD/L82pHCYQZntX64aHjVBKlUqgFex+8Ymc01+aphK6Tm
         cBdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=HE905+MxEiHTk1h53yo3X0RtwuTxMCQrdFVYdDeiBxQ=;
        b=ed0S+vvn5w7Y89/h8yl4Q3RSIMkwi7Xevla9RqjtuMKWMCpKVs6kQ64VPwgG8W+vI5
         H9xXi/4akWwYjKYBs0jb9h3zriY4+VL1kVRbJ3ZHe77/c1uVPspg/YwxC1WK+86VoV3E
         k6qujgIbkCm+RjrLCLEe4/wmIY6OKj8DBiC4Rhg2bwPO8gnQKUBEla1Eql8E4x8ejUvX
         VsE7p5z5lT5HzRdU86MZ+8mhQaFCpRoHbESaOEN6KD035Pv/0JOrvAzDcrrti6Tq6Eyi
         tLfIy30Idfc8SJA9JTMOry1r9k9T5SXHgOeYqu5YwGCwAQaPXNThHyFypFdChJhiHjyq
         yB+A==
X-Gm-Message-State: AOAM53130U6K6U4Hc07hkOs+j63bld506furvxGrLxV2FPV+XjZWHvx2
	mBcvCVdXcspDNqGOEgRFQDY9FqykoLyt1cIj
X-Google-Smtp-Source: ABdhPJz7AN8GGzrdCO/HLy+LUjPEVgU4hUGGXNlCu9tpnVpLk1iBPJHS5jSbPWe9+p6/6SlElbxZrQ==
X-Received: by 2002:a05:6402:22da:: with SMTP id dm26mr17334962edb.208.1635588507276;
        Sat, 30 Oct 2021 03:08:27 -0700 (PDT)
Received: from desktop (mob-5-90-201-67.net.vodafone.it. [5.90.201.67])
        by smtp.gmail.com with ESMTPSA id gb3sm4142107ejc.81.2021.10.30.03.08.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Oct 2021 03:08:26 -0700 (PDT)
Date: Sat, 30 Oct 2021 12:08:25 +0200
From: Gabriel Goller <gabrielgoller123@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev
Subject: [PATCH] staging: wlan-ng: Fix formatting of block comments
Message-ID: <YX0Zmb6Osu3tODfJ@desktop>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Fixed warnings of checkpatch.pl in prism2mib.c:
Block comments use * on subsequent lines.

Signed-off-by: Gabriel Goller <gabrielgoller123@gmail.com>
---
 drivers/staging/wlan-ng/prism2mib.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/wlan-ng/prism2mib.c b/drivers/staging/wlan-ng/prism2mib.c
index 24ba10d6bd0b..c04fc17b3c64 100644
--- a/drivers/staging/wlan-ng/prism2mib.c
+++ b/drivers/staging/wlan-ng/prism2mib.c
@@ -680,15 +680,15 @@ static int prism2mib_priv(struct mibrec *mib,
 					       (u8 *)&wpa,
 					       sizeof(wpa));
 			/*
-			pstr->len = le16_to_cpu(wpa.datalen);
-			memcpy(pstr->data, wpa.data, pstr->len);
-			*/
+			 * pstr->len = le16_to_cpu(wpa.datalen);
+			 * memcpy(pstr->data, wpa.data, pstr->len);
+			 */
 			pstr->len = 0;
 		} else {
 			/*
-			wpa.datalen = cpu_to_le16(pstr->len);
-			memcpy(wpa.data, pstr->data, pstr->len);
-			*/
+			 * wpa.datalen = cpu_to_le16(pstr->len);
+			 * memcpy(wpa.data, pstr->data, pstr->len);
+			 */
 			wpa.datalen = 0;
 
 			hfa384x_drvr_setconfig(hw,
-- 
2.30.2

