Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FB8379DD;
	Mon, 27 Mar 2023 22:01:01 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id l12so10229617wrm.10;
        Mon, 27 Mar 2023 15:01:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679954460;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OdiIli5OjsdHxX+rOzIAzeZXPbcJtKma85dtenqz7jU=;
        b=Gb+bMr/okLK4tE4wt4lNEBPFK5YmhZBgv6sL1nomRfeF78hwGOCCGlnjMZwbag8It9
         UDc8QgVMpcgEIa5qOnbYLH0lFJfGyMOW98FDysVamaKTFhJTLdtOi9WDFx2pe0m2QXf5
         /tQoa0QGQMF5S3eLpqyrEhcxjD3yuDo3w2MOwOTJKoPm9bjNF+sf3AOMY7CED51Tzvqw
         aVKgZYg52lfECZmEFRp0uwGyyW/5CswsZCA/uzSq2Sz8D41hxqUqZ4NwGlihLlhugREd
         axBBF0fSOWqOR9yhtNH0nCdaVapLq2QuObG0dPeu352DHXvJrWbZVFERRDyJ1ZrzEjHA
         H3Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679954460;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OdiIli5OjsdHxX+rOzIAzeZXPbcJtKma85dtenqz7jU=;
        b=2MNGFpt9lMDCWKbDatBzOK88K85saCDu9PffCUklNgh4suGp5CgkFLr9WZvV5T8jOh
         G2l1leGrHyyhaH1DGmTtioVhMGx+HO8PT255ixcmzlv+BiXd/kU9kl2CJAQ+esJtJ+lt
         6oPZ8WUQJl6dzG/bx57la8Iv3AyAxt/bh3kFhFv48H1azWgvdEuldlCE5JHovtw4hhOZ
         Vz+EVy25Yju3R60AQinT4+gIBCHrQH8faUtYW5ovJWbLFlgppkyRdtAo+E8PYYAyOeeK
         xB8cFXFhS4QAiPMWACjka4DjcxMex+Qc2CAMKjc38/Td5sk+uVViE6r3VGvuGlYu3ZLQ
         5Ajg==
X-Gm-Message-State: AAQBX9ftDRgX1ZMN98Xo1jMomZRQbrV0ZG2DZrA2FdbUnl7RbhaQiNaf
	8Sg2/qDpSqa8VmCK8zSXI1OS6OsS0nNiTKiI
X-Google-Smtp-Source: AKy350Y6z+kZIPfxCiNTo8D29iT7O3uTjPdPIjIp9B5Q/49Po3j1UxBK+eU5ylmIttX7kVbgmQ2xVA==
X-Received: by 2002:a05:6000:7:b0:2cd:e0a8:f2dc with SMTP id h7-20020a056000000700b002cde0a8f2dcmr10815996wrx.7.1679954460246;
        Mon, 27 Mar 2023 15:01:00 -0700 (PDT)
Received: from khadija-virtual-machine ([39.41.14.14])
        by smtp.gmail.com with ESMTPSA id w2-20020a5d6802000000b002cfe687fc7asm25906455wru.67.2023.03.27.15.00.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Mar 2023 15:00:59 -0700 (PDT)
Date: Tue, 28 Mar 2023 03:00:57 +0500
From: Khadija Kamran <kamrankhadijadj@gmail.com>
To: outreachy@lists.linux.dev
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH] staging: rtl8192e: fix unbalanced braces around else
Message-ID: <ZCISGaFELBfDyGRT@khadija-virtual-machine>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Balance if/else braces as recommended by checkpatch.pl

Signed-off-by: Khadija Kamran <kamrankhadijadj@gmail.com>
---
 drivers/staging/rtl8192e/rtl819x_TSProc.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8192e/rtl819x_TSProc.c b/drivers/staging/rtl8192e/rtl819x_TSProc.c
index 68c131afc2ba..c61fdf73c572 100644
--- a/drivers/staging/rtl8192e/rtl819x_TSProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_TSProc.c
@@ -517,6 +517,7 @@ void TsStartAddBaProcess(struct rtllib_device *ieee, struct tx_ts_record *pTxTS)
 			netdev_dbg(ieee->dev, "Immediately Start ADDBA\n");
 			mod_timer(&pTxTS->TsAddBaTimer, jiffies + 10);
 		}
-	} else
+	} else {
 		netdev_dbg(ieee->dev, "BA timer is already added\n");
+	}
 }
-- 
2.34.1

