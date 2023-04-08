Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FE5D1854
	for <linux-staging@lists.linux.dev>; Sat,  8 Apr 2023 15:17:39 +0000 (UTC)
Received: by mail-pj1-f49.google.com with SMTP id c3so1457013pjg.1
        for <linux-staging@lists.linux.dev>; Sat, 08 Apr 2023 08:17:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680967059;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VQF+x/Vrt5/tZDK+Ca2xiyhVaw4/7AwabkDs9XafNQc=;
        b=dC14lwBJk/GvmKFC7kvGBghySJbumZsqhxJkHsNbfHIdpjv0Xt86lURgbw+aAAXMQG
         yRms8Z5RPom7rI0BB5z87qNfneQKqVcwZmWZirzOqVTgtNfiuNr6Gn51fFe94SJ98iAE
         Q83X5yVHZfvR1fLbaVOE2ENlbgieYQHvLYYFFixp0f4KUGVd5cTY4wk7lhdPW3Qb9VFu
         DNK2ZqLsrj9YfNIk2kasvTBgOtYRDgcsbPGqRxh/LoNEL0fv7txT/+svba4GQT2rHuli
         gmWYOGuEySCLn7/RB8UdOufD544Ed5eUE2HHA5ZlHrV2oyAexLPuFDwbVkMUxIdvZVoN
         +94g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680967059;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VQF+x/Vrt5/tZDK+Ca2xiyhVaw4/7AwabkDs9XafNQc=;
        b=1wK8VXomX1ooOtujxYKVoDJDt8horRBfoOjZaSoabhxnrC0RGz5JjvmJUrLHzNKyco
         UbjdIz6EBcfeWoMBjEYEMOANVSVRXesnkOCSxyHPlAQK3xdBRKpKyIPccfFJDtg0elob
         qzWMGCl0Sy+1beLs/+H7PMz2v7OVpXfKhnaoMiHFXaJSO62ddCjbd1RNnwnHpJYX9v00
         guBr+iI715N/Fo/YsXO2Rl3TP0ZlYwyI/F8yYD50gezOj+bXy3vhNSPXRRQqZDnTppcl
         27PksRN5qXxbNN+up8+YvCLkyDYV3IUnB8jSsg5ZJmXbXJHupbx9J0Vmnr3ZLKWp3STF
         Xh4A==
X-Gm-Message-State: AAQBX9dIibRfaaxkzdRobXfJjOOi3d7Kdepjt5e/vRNEx0BksnU8WpaY
	DkIkCyVnkzhWAHuDT0VDdDc=
X-Google-Smtp-Source: AKy350bG6YqzVinTucwUgGmZ63Ih/GZK8PeehuCsMjGbe4D1GIOiz4GhwHMay9/YVl+iTRxY6QJ1Lg==
X-Received: by 2002:a05:6a20:a91f:b0:d5:9216:9182 with SMTP id cd31-20020a056a20a91f00b000d592169182mr2156753pzb.9.1680967058703;
        Sat, 08 Apr 2023 08:17:38 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:d006:70ae:79eb:2282:4b7:7161])
        by smtp.gmail.com with ESMTPSA id n3-20020a62e503000000b0062db34242aesm4852557pff.167.2023.04.08.08.17.36
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 08 Apr 2023 08:17:37 -0700 (PDT)
From: Srihari S <sriharisat@gmail.com>
To: Larry Finger <Larry.Finger@lwfinger.net>,
	Florian Schilhabel <florian.c.schilhabel@googlemail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Srihari S <sriharisat@gmail.com>
Subject: [PATCH] staging: rtl8172: Add blank lines after declarations
Date: Sat,  8 Apr 2023 20:46:23 +0530
Message-Id: <1680966983-11609-1-git-send-email-sriharisat@gmail.com>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

Add blank lines as reported by checkpatch.pl as below

CHECK: Please use a blank line after function/struct/union/enum declarations

Signed-off-by: Srihari S <sriharisat@gmail.com>
---
 drivers/staging/rtl8712/rtl8712_efuse.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/rtl8712/rtl8712_efuse.h b/drivers/staging/rtl8712/rtl8712_efuse.h
index 2e1ea9d..7a49740 100644
--- a/drivers/staging/rtl8712/rtl8712_efuse.h
+++ b/drivers/staging/rtl8712/rtl8712_efuse.h
@@ -23,6 +23,7 @@ struct PGPKT_STRUCT {
 	u8 word_en;
 	u8 data[PGPKT_DATA_SIZE];
 };
+
 /*--------------------------------------------------------------------------*/
 u8 r8712_efuse_reg_init(struct _adapter *padapter);
 void r8712_efuse_reg_uninit(struct _adapter *padapter);
-- 
2.7.4

