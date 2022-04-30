Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86B411852
	for <linux-staging@lists.linux.dev>; Sat, 30 Apr 2022 06:49:33 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id g23so11259983edy.13
        for <linux-staging@lists.linux.dev>; Fri, 29 Apr 2022 23:49:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=/h6s6B7HCryzfu/yi0f03KuNrg+gbZnPthVNn9NZYdQ=;
        b=MYQKHDh68R0X7y4hRf57d7NmbJq3lL5JoMbYRnjhVXCvT/98FjvOBBxzl37kolzcJ/
         39bo1iiOKVyafcpvXs0ZMiQfovxK0ic9sW4Hh+qX5mlRZQ5vVcs0p/jMXJWTj2hd46NP
         mmb0yLXXeln3mMSb2ZNWgPK8flxRzcztfnJtQBuyXOp/v4o5BVi8DIcjBp5KUFVRSeE+
         u2UxLa/cpQeztFl4qSIN1rhhEel9HUP/ky1+2r9PhP+bDtfNtrjJdgDhdIwtUeU4ELQK
         MnmduKDrRQ4O7rRC+ofMfku3juc17lVxaoFPL1J6BTVDbdt8WzKOJ1UqzHMiTmYdJNje
         cr5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=/h6s6B7HCryzfu/yi0f03KuNrg+gbZnPthVNn9NZYdQ=;
        b=BSFo28GY/hlzhXjMwxSIuZJr5qjuZYsBtDEn5eiGOCdlRlLEB/9TnRCl3PqzNkZFin
         xXlASDDNoQQbk3qzP2LeI+3jr1Z/LTlPbUGORhgxokOcTd7ymWz5sMD4k4OeK2TEOmTg
         fIRSfzTljF84Fs9tQP2qC9lIoTs5S7L1HxISfr1YwztyCGox21RJ9GQkShzeLSLbMSg4
         9VtZx8CiyC0PpT0SmFLQz8pNSmtOgzHoh0lUqlCMNdwZcq2buY/W95r/mYFbMkngoOt+
         JyPNjyUOeO11vvEojwrtfCjTLLB4qTv9gopgwGVIVxcOSTfoOwLez2tIox4K32L2OEIM
         Zk5w==
X-Gm-Message-State: AOAM531LTlrB1I0DRMgWXnZc8n+iIYF25/07G+EJPvoFaOwn6aWqrJnB
	Im73Qg2Uj1JUZ5JjNzDjdic=
X-Google-Smtp-Source: ABdhPJxhSt3PBCwRupq2sjL3mUlVmq00E1HdM6hIULOi32oVgJdqSUYRKXXnmKnMc85kC+CeOpXNxA==
X-Received: by 2002:a50:9346:0:b0:425:e4c0:ab4b with SMTP id n6-20020a509346000000b00425e4c0ab4bmr3177806eda.154.1651301371839;
        Fri, 29 Apr 2022 23:49:31 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p54a074e9.dip0.t-ipconnect.de. [84.160.116.233])
        by smtp.gmail.com with ESMTPSA id jz28-20020a17090775fc00b006f3ef214e40sm1326580ejc.166.2022.04.29.23.49.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Apr 2022 23:49:31 -0700 (PDT)
Date: Sat, 30 Apr 2022 08:49:29 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Forest Bond <forest@alittletooquiet.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	David Laight <David.Laight@ACULAB.COM>
Subject: [PATCH v4 2/2] staging: vt6655: Added missing BE support in
 CARDbGetCurrentTSF
Message-ID: <2df2c92e58788596608e988ace986ed294733363.1651300094.git.philipp.g.hortmann@gmail.com>
References: <cover.1651300094.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1651300094.git.philipp.g.hortmann@gmail.com>

Added missing big-endian support in CARDbGetCurrentTSF.

Reported-by: David Laight <David.Laight@ACULAB.COM>
Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
Using ioread32be to simulate output of the big endian computer.

Code for testing:
	low = ioread32(iobase + MAC_REG_TSFCNTR);
	high = ioread32(iobase + MAC_REG_TSFCNTR + 4);
	*pqwCurrTSF = low + ((u64)high << 32);
	dev_info(&priv->pcid->dev, "CARDbGetCurrentTSF little endian: 0x%016llx", *pqwCurrTSF);

	low = ioread32be(iobase + MAC_REG_TSFCNTR);
	high = ioread32be(iobase + MAC_REG_TSFCNTR + 4);
	dev_info(&priv->pcid->dev, "CARDbGetCurrentTSF big-endian:    0x%016llx", high + ((u64)low << 32));

Log from testing:
vt6655 0000:01:05.0: CARDbGetCurrentTSF little endian: 0x00 00 00 0e 15 94 3d 7d
vt6655 0000:01:05.0: CARDbGetCurrentTSF big-endian:    0x7d 3d 94 15 0e 00 00 00
vt6655 0000:01:05.0: CARDbGetCurrentTSF little endian: 0x00 00 00 0e 15 94 3d 8b
vt6655 0000:01:05.0: CARDbGetCurrentTSF big-endian:    0x8b 3d 94 15 0e 00 00 00

Taking BE into account both methods generate the same output. 64 Bit numbers are supported.

Code for testing 2:
'#ifdef __BIG_ENDIAN
	*pqwCurrTSF = high + ((u64)low << 32);
'#else
	*pqwCurrTSF = low + ((u64)high << 32);
'#endif
	dev_info(&priv->pcid->dev, "CARDbGetCurrentTSF *pqwCurrTSF from VNSvInPortD: 0x%016llx", *pqwCurrTSF);

Log from testing 2:
[ 3502.410835] vt6655 0000:01:05.0: CARDbGetCurrentTSF *pqwCurrTSF from VNSvInPortD: 0x00 00 00 0e 2a fb ed 86
---
 drivers/staging/vt6655/card.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/staging/vt6655/card.c b/drivers/staging/vt6655/card.c
index 0dd13e475d6b..ec6fd185d3fd 100644
--- a/drivers/staging/vt6655/card.c
+++ b/drivers/staging/vt6655/card.c
@@ -756,7 +756,11 @@ bool CARDbGetCurrentTSF(struct vnt_private *priv, u64 *pqwCurrTSF)
 		return false;
 	low = ioread32(iobase + MAC_REG_TSFCNTR);
 	high = ioread32(iobase + MAC_REG_TSFCNTR + 4);
+#ifdef __BIG_ENDIAN
+	*pqwCurrTSF = high + ((u64)low << 32);
+#else
 	*pqwCurrTSF = low + ((u64)high << 32);
+#endif
 
 	return true;
 }
-- 
2.25.1

