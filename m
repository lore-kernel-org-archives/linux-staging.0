Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EC9C6D00
	for <linux-staging@lists.linux.dev>; Tue, 15 Jun 2021 22:36:16 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id b205so57805wmb.3
        for <linux-staging@lists.linux.dev>; Tue, 15 Jun 2021 15:36:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mG6EcXHgQPh4KFS+sxj0/0DZ5DGgzbb1Rd38rg/w2dA=;
        b=uSZs5g2SqprC8RF0ycPuyfFwp0jPrHGRJO0tu8htH7ofxsYRZ1p34wgGrQT/kZkQWN
         vKEY+/4NAmkpPptPTfi39x346+TaO2Uq/fSUqaCRrXLD39TuQZdJdWEPPgCm7lfInjtY
         mpGKc8GrThIXVgyFDFRWAtjNgzlAZL/Wy8WeRLiOZUEqP9IbPMIpo5EgOt/Y4TP2BrJd
         bLlAQGy8PaDlePWSDcUB3U4f5kmtzOvy/XrHBJGX/hwYe6De1+phcQaHTpsQ5+kgApqr
         SE0MaO4jMx+7qKdmb6jz2lcz9MS/RufBAN1HwS1XTYyrrkjPYbBKaVZYe+PrdgW9xFyp
         CuuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mG6EcXHgQPh4KFS+sxj0/0DZ5DGgzbb1Rd38rg/w2dA=;
        b=RbTKMUFc1pR0G6S3gj8s+dD0Drh75yQtBrVJExsOt0hmcdcN6ms6OHkcumlmKcowk8
         0eMh3wGETJCkj8twsHZUy3/7UcU8zoV+FVBWWdXYAcaxxrnF2S8T7M6xahqblSsDVJwd
         TmcDhMgXX6PKd1vt1j2VCQ50n2VoOpMb3lPaqfynL5SIoF9jcFxNo/loPgfeU5Xm9Azy
         EWXwS/kxjz14RQdUwIX/T7m34F3OJ2INx7CrJiUZHpWL17aIIFJGFYtmxXBmBxzkqtIA
         rvWfFc1ZWm8ZxnBWdTgGjHppOOPVzxUec8ksCqr8R/BWsP3vOBl7L2+azAmCctYED3Ar
         YiZA==
X-Gm-Message-State: AOAM533dz/60v4rO7rydWG27KSzpdoaK07p+rgjeNe65rgUKFSTjUP9i
	DiKBkqASExbQyKbsapJ9owj26g==
X-Google-Smtp-Source: ABdhPJwLswKcN2NlwsK6zyliYTz/R38llj8ybSU7CY4dWysaOcvPF8wWJTWSMdcE1wgzFUjCovyxMw==
X-Received: by 2002:a1c:ed10:: with SMTP id l16mr7632228wmh.8.1623796575116;
        Tue, 15 Jun 2021 15:36:15 -0700 (PDT)
Received: from localhost.localdomain (2.0.5.1.1.6.3.8.5.c.c.3.f.b.d.3.0.0.0.0.6.1.f.d.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:df16:0:3dbf:3cc5:8361:1502])
        by smtp.gmail.com with ESMTPSA id m23sm3934791wml.27.2021.06.15.15.36.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jun 2021 15:36:14 -0700 (PDT)
From: Phillip Potter <phil@philpotter.co.uk>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	dan.carpenter@oracle.com,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH 3/7] staging: rtl8188eu: remove unused variables from core/rtw_efuse.c
Date: Tue, 15 Jun 2021 23:36:03 +0100
Message-Id: <20210615223607.13863-4-phil@philpotter.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210615223607.13863-1-phil@philpotter.co.uk>
References: <20210615223607.13863-1-phil@philpotter.co.uk>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove set but unused variables from within the file core/rtw_efuse.c
in the function efuse_read_phymap_from_txpktbuf, as they are triggering
kernel test robot warnings. Also, remove the local 'lenc' array as well,
as nothing is done with its values. Keep the two usb_read8 calls
however, as this patch is purely for warnings, not to change behaviour
of the code.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Phillip Potter <phil@philpotter.co.uk>
---
 drivers/staging/rtl8188eu/core/rtw_efuse.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/rtl8188eu/core/rtw_efuse.c b/drivers/staging/rtl8188eu/core/rtw_efuse.c
index 0d51bf9c9bb0..21619fd67217 100644
--- a/drivers/staging/rtl8188eu/core/rtw_efuse.c
+++ b/drivers/staging/rtl8188eu/core/rtw_efuse.c
@@ -234,16 +234,9 @@ static void efuse_read_phymap_from_txpktbuf(
 		hi32 = usb_read32(adapter, REG_PKTBUF_DBG_DATA_H);
 
 		if (i == 0) {
-			u8 lenc[2];
-			u16 lenbak, aaabak;
-			u16 aaa;
+			usb_read8(adapter, REG_PKTBUF_DBG_DATA_L);
+			usb_read8(adapter, REG_PKTBUF_DBG_DATA_L + 1);
 
-			lenc[0] = usb_read8(adapter, REG_PKTBUF_DBG_DATA_L);
-			lenc[1] = usb_read8(adapter, REG_PKTBUF_DBG_DATA_L + 1);
-
-			aaabak = le16_to_cpup((__le16 *)lenc);
-			lenbak = le16_to_cpu(*((__le16 *)lenc));
-			aaa = le16_to_cpup((__le16 *)&lo32);
 			len = le16_to_cpu(*((__le16 *)&lo32));
 
 			limit = min_t(u16, len - 2, limit);
-- 
2.30.2

