Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6045E7470
	for <linux-staging@lists.linux.dev>; Tue,  7 Feb 2023 18:16:26 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id j25so10904823wrc.4
        for <linux-staging@lists.linux.dev>; Tue, 07 Feb 2023 10:16:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=U3O/aD4Uv2cETSrvPLtPnBPSmR1X5PU3SN0FZx5rCJs=;
        b=H46iivmubbNG5bbuSnlVhfSauQ6dL6uQj6DuSUlCCkjOa6nqUuc3TxnMT1KCzkg21N
         q6QcwCmLYTC3L+s3U24GTq1ONcqZkrrYLB7r9x7e18VE9/wkK4SFrQLkxyrW+Qhvbqlg
         3i+CV48cGSDhlzw1GuWlVEd7xnRqKf7bo55Idy8MoZUZ+SRvz9MbuPlseRS3XaxQbi2I
         0t4YTNqqLVJyHEKfTyihlwORxT41Qp8Q1Ai7Oq8gtsmh7448nw8lBuZuE1jetCJLwGbK
         Baz13ZcPVl6plyBYW0+NTSPgpb6Kf3lNj6j745eUHuMQJPwVY+zlT53ecpb+0ZryJbxY
         jMSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U3O/aD4Uv2cETSrvPLtPnBPSmR1X5PU3SN0FZx5rCJs=;
        b=RcVc2ochJf7kmWqhCN7V2HIzUB99Xi/kHo8OC3NLcI02swq5Jf3pGjmeoiP7JqST8c
         iUb/yOoinUPEp0NKOy6SZeFZnNBPhrZvNIvTyFo3Pia/vaRSHUpd61k3kHH+QV6ISbdU
         yekIrxtKeF/aNcLzev1ADionCq8d9/+pS4K6u2KrdrMzqFPJDbW6R0Tj0++u0CzF9ZDq
         07gEobztGf/TfqFtTDuMWTnmfZExrct94TzD7dYNEyR+KT2CZnzXH6Og00HqGlBwLuJR
         XlPshFSSX+/xbS5Nh8y5q1arZ9yg2hvbvdORaDBV0t4omBMaUtbEOJ7ozzXNYbDDdMLZ
         H5jA==
X-Gm-Message-State: AO0yUKWXBec2cPl3Ah+9WBnlfoQfJgO/A/1uLhVPPhSMzngmqtTBWQ6K
	C0QZRW+L38afqbGUD4WFMBU=
X-Google-Smtp-Source: AK7set/44jn5Ep/pwE78uNH5fikW3GqzzST8Vhs3U+5tixpP0gBelHbi1NFKDVEY+2xa3j+uogMtAw==
X-Received: by 2002:a05:6000:12cb:b0:2bf:e46c:8b89 with SMTP id l11-20020a05600012cb00b002bfe46c8b89mr2738630wrx.4.1675793784708;
        Tue, 07 Feb 2023 10:16:24 -0800 (PST)
Received: from matrix-ESPRIMO-P710 (p57935146.dip0.t-ipconnect.de. [87.147.81.70])
        by smtp.gmail.com with ESMTPSA id e20-20020a5d5954000000b002bfd524255esm12073035wri.43.2023.02.07.10.16.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Feb 2023 10:16:24 -0800 (PST)
Date: Tue, 7 Feb 2023 19:16:22 +0100
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 02/10] staging: rtl8192e: Calculate definition of
 MSR_LINK_MASK
Message-ID: <8c8a126a83683bae69d0fd20a93bdea8f810f6d0.1675792435.git.philipp.g.hortmann@gmail.com>
References: <cover.1675792435.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1675792435.git.philipp.g.hortmann@gmail.com>

Calculate definition of MSR_LINK_MASK ((1<<0)|(1<<1)) = 3. Equation is not
accepted by checkpatch because of missing spaces.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/r8192E_hw.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_hw.h b/drivers/staging/rtl8192e/rtl8192e/r8192E_hw.h
index 1546bb575293..20a35c9caee8 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_hw.h
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_hw.h
@@ -170,7 +170,7 @@ enum _RTL8192PCI_HW {
 #define	BW_OPMODE_20MHZ			BIT2
 	IC_VERRSION		= 0x301,
 	MSR			= 0x303,
-#define MSR_LINK_MASK      ((1<<0)|(1<<1))
+#define MSR_LINK_MASK      3
 #define MSR_LINK_MANAGED   2
 #define MSR_LINK_ADHOC     1
 #define MSR_LINK_MASTER    3
-- 
2.39.1

