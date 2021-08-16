Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0F426D17
	for <linux-staging@lists.linux.dev>; Mon, 16 Aug 2021 17:35:39 +0000 (UTC)
Received: by mail-pj1-f42.google.com with SMTP id qe12-20020a17090b4f8c00b00179321cbae7so1344826pjb.2
        for <linux-staging@lists.linux.dev>; Mon, 16 Aug 2021 10:35:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8SwTsPx4UYisguWy8Lsk5AZC9AKkSCySPlgNFqLhFrs=;
        b=XhzPXa2/DuXnsWeMM+nj/dHlsE2F9IpphR/qnZL74arj5QR7aFtwzBkgnbqmnEuQab
         wXc+J7WDhs8fhUNzEwTV/lFDkd/ewsnBLPRPpX1vK0tm/Rq33ZZBu1hjdkqwv0uxN34P
         KcAaiB4mCP9gmmLCZ3zYd/rGleXHxsWztBTChXNlz4MbCYUDUZE86JPKdBCLLZGMDQ4M
         qgeOfx+wubjoFoIF6MT0dnfgjwpZVDvbkB5QUscAYNaHg1WHv4gKg6xif40SqQwNgmTf
         fuxKjSIWvJ+595wqKDuPzxe0Wkls16jGd24iK0hres5cBH3/x48TAv47rsQ2/cDzzvjp
         Dz4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8SwTsPx4UYisguWy8Lsk5AZC9AKkSCySPlgNFqLhFrs=;
        b=CIRSxSLDU2eDucqkfNanlAHeYS8BHkNHJxnnPfuCHH2iOlGyYjwrmOJq0OuqHBGCqb
         8W0R/cPW5ZYeBoaeRX2e7EZSRlHJCsIgGRzGYRbvrsrtymVgu16o7bUwwMxgx3w3N9By
         KNAWsbfpF530L/uBoKBSvLE/UHL7ab5W0FOnanN4rr3SDPZnxIAcBaFqvUgUcUDsuugE
         KP0Er6m1YXGGnn9697AP/A+LDcO5AP8FM51Ur8evn+O4XFfUQpm8U/7paTrAGPXe6QUC
         uDzEUJ6GKKn8oDAL7WI+g6HMw6TdNRpzgXgAVYObbDYt3WquM9wNhj2bFKnJ/dO7Dmko
         VFJg==
X-Gm-Message-State: AOAM531FUb8NnOO76errk3as8RUyJiDRNErW2SEvbXEIRk9r4ho9HIOH
	aaRnTsFQ6HPOdbamlp5u3+8=
X-Google-Smtp-Source: ABdhPJx/YiLxJeq0cMJZXttVox/qN9kvq0gqEd++DqW+xgu/P2njP+jG6ErKbdxx1Mr7cDXxVhJA2Q==
X-Received: by 2002:a63:f656:: with SMTP id u22mr6324635pgj.392.1629135339309;
        Mon, 16 Aug 2021 10:35:39 -0700 (PDT)
Received: from xps.yggdrasil ([49.207.137.16])
        by smtp.gmail.com with ESMTPSA id u10sm14030pgj.48.2021.08.16.10.35.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Aug 2021 10:35:38 -0700 (PDT)
From: Aakash Hemadri <aakashhemadri123@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Shuah Khan <skhan@linuxfoundation.org>,
	Bjorn Helgaas <bjorn@helgaas.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] staging: rtl8723bs: fix cast to restricted __le32
Date: Mon, 16 Aug 2021 23:05:07 +0530
Message-Id: <1be80f0196bed681bf55bfe3155f564b4ebf3b76.1629135143.git.aakashhemadri123@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <cover.1629135143.git.aakashhemadri123@gmail.com>
References: <cover.1629135143.git.aakashhemadri123@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix sparse warning:
warning: cast to restricted __le32

Signed-off-by: Aakash Hemadri <aakashhemadri123@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_security.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_security.c b/drivers/staging/rtl8723bs/core/rtw_security.c
index 381deeea99d0..5320b1a46dfb 100644
--- a/drivers/staging/rtl8723bs/core/rtw_security.c
+++ b/drivers/staging/rtl8723bs/core/rtw_security.c
@@ -122,7 +122,7 @@ void rtw_wep_decrypt(struct adapter  *padapter, u8 *precvframe)
 		arc4_crypt(ctx, payload, payload,  length);
 
 		/* calculate icv and compare the icv */
-		*((u32 *)crc) = le32_to_cpu(~crc32_le(~0, payload, length - 4));
+		*((u32 *)crc) = ~crc32_le(~0, payload, length - 4);
 
 	}
 }
@@ -621,7 +621,7 @@ u32 rtw_tkip_decrypt(struct adapter *padapter, u8 *precvframe)
 			arc4_setkey(ctx, rc4key, 16);
 			arc4_crypt(ctx, payload, payload, length);
 
-			*((u32 *)crc) = le32_to_cpu(~crc32_le(~0, payload, length - 4));
+			*((u32 *)crc) = ~crc32_le(~0, payload, length - 4);
 
 			if (crc[3] != payload[length - 1] || crc[2] != payload[length - 2] ||
 			    crc[1] != payload[length - 3] || crc[0] != payload[length - 4])
-- 
2.32.0

