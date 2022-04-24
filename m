Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A6D817F5
	for <linux-staging@lists.linux.dev>; Sun, 24 Apr 2022 07:44:26 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id m15-20020a7bca4f000000b0038fdc1394b1so10636644wml.2
        for <linux-staging@lists.linux.dev>; Sun, 24 Apr 2022 00:44:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=y6d3QvwCWUkOHo4Nv6Umw+CYKaT+QPo1Bwdbb14LmYU=;
        b=m/IUbfawZHI/czKAqYEd1rwhTJsIsd5jB2srww5IrZZk92bRIA86BFZ2yFtqa4f/mI
         5moQLajc8hy9UCZMm5K7GMPgUONwOpugYnHtsZqXG4j3J8t15KhBJubDLNLnT5wUlZgA
         ZT3dcla/0GAZlsoJ7tPpfqOuz4icjnToqdpd/dBuJAzMlfsu+HTBubBlqvYgWAuXGeX/
         DyyfQgybIrZgbMt20fFethTZZoWov99uRlqnsgNbNbsdbeRZFUMmRKgKXSI8QhOJ07XN
         6gJpK7I/X/nN6ejrFh7h4vnEysu/uz+6o3/rlJGsYBh4cahMEOYSgSDxN324W5JNojqv
         AmnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=y6d3QvwCWUkOHo4Nv6Umw+CYKaT+QPo1Bwdbb14LmYU=;
        b=ZLOgz5LNRbISlkax72yUkR+SrOcjm/M93/CJlCi39cUJrcQK7fwhsK9SR4B7bCZZLf
         WghNuJfnEQ8YoDtqEMHcEwGSN8CuOaMInPK7JwkeXf/eeQT3HqllrHXWpsT4ypY6n86x
         mlEbjZOh9ItakAMOuKOHwWmWvMqYmQBi7yqYG1QRsatPbhxe95x7xuglKkh+yvHE9Ed+
         GJ58iZJgyDVHqfZ0aRXZMf8eKpcULeH4itzR1lYJB8cQjruCD2Xdo8BhptvyxdFk3xLq
         E4ra6YeHy/Yny5FM1NZUBSa/Q2cXu421Ja/miifsWvXjw+m6LdqntRQKHi2GQStD1aDI
         xPIA==
X-Gm-Message-State: AOAM532plWFPM00/uNYOCUrAY4PL+uAt4EH9Bm2H9vCKrdpM8K7yoAUQ
	iQpMWstu/FlAdDg03I+r5qE=
X-Google-Smtp-Source: ABdhPJwk3Mjh5EeGOh6zHL2gt37HSwzmr44mKBs4YzRN66Opb7ijOGJokkt9Tti7VEilOraOqU9OuA==
X-Received: by 2002:a05:600c:4e4a:b0:392:88e1:74a7 with SMTP id e10-20020a05600c4e4a00b0039288e174a7mr20767339wmq.174.1650786264720;
        Sun, 24 Apr 2022 00:44:24 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p54a074e9.dip0.t-ipconnect.de. [84.160.116.233])
        by smtp.gmail.com with ESMTPSA id k23-20020adfb357000000b0020ad7c36332sm1479001wrd.110.2022.04.24.00.44.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Apr 2022 00:44:24 -0700 (PDT)
Date: Sun, 24 Apr 2022 09:44:22 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Forest Bond <forest@alittletooquiet.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 4/5] staging: vt6655: Replace two VNSvInPortD with
 ioread64_lo_hi
Message-ID: <db5ba681cea27de815b172f8b93a8fd1efa30e99.1650784817.git.philipp.g.hortmann@gmail.com>
References: <cover.1650784817.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1650784817.git.philipp.g.hortmann@gmail.com>

Replace two macros VNSvInPortD (32 Bit reads) with one ioread64_lo_hi.
The names of macro and the arguments use CamelCase which is not
accepted by checkpatch.pl

Since there are more than one checkpatch issue per line,
more steps are rquired to fix.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
Used this code for testing:
	VNSvInPortD(iobase + MAC_REG_TSFCNTR, (u32 *)pqwCurrTSF);
	VNSvInPortD(iobase + MAC_REG_TSFCNTR + 4, (u32 *)pqwCurrTSF + 1);
	dev_info(&priv->pcid->dev, "CARDbGetCurrentTSF *pqwCurrTSF: %llx", *pqwCurrTSF);
	dev_info(&priv->pcid->dev, "CARDbGetCurrentTSF temp_ph: %llx",
			 ioread64_lo_hi(iobase + MAC_REG_TSFCNTR));
output:
[  +0.000085] vt6655 0000:01:05.0: CARDbGetCurrentTSF *pqwCurrTSF: 117e7e
[  +0.000005] vt6655 0000:01:05.0: CARDbGetCurrentTSF temp_ph: 117e7e
[  +0.000009] vt6655 0000:01:05.0: CARDbGetCurrentTSF *pqwCurrTSF: 39756d7f
[  +0.000005] vt6655 0000:01:05.0: CARDbGetCurrentTSF temp_ph: 39756d7f
[  +0.000009] vt6655 0000:01:05.0: CARDbGetCurrentTSF *pqwCurrTSF: 39756d8d
[  +0.000004] vt6655 0000:01:05.0: CARDbGetCurrentTSF temp_ph: 39756d8d
---
 drivers/staging/vt6655/card.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/vt6655/card.c b/drivers/staging/vt6655/card.c
index 022310af5485..5da25140ed4b 100644
--- a/drivers/staging/vt6655/card.c
+++ b/drivers/staging/vt6655/card.c
@@ -30,6 +30,7 @@
 #include "desc.h"
 #include "rf.h"
 #include "power.h"
+#include <linux/io.h>
 
 /*---------------------  Static Definitions -------------------------*/
 
@@ -753,8 +754,7 @@ bool CARDbGetCurrentTSF(struct vnt_private *priv, u64 *pqwCurrTSF)
 	}
 	if (ww == W_MAX_TIMEOUT)
 		return false;
-	VNSvInPortD(iobase + MAC_REG_TSFCNTR, (u32 *)pqwCurrTSF);
-	VNSvInPortD(iobase + MAC_REG_TSFCNTR + 4, (u32 *)pqwCurrTSF + 1);
+	*pqwCurrTSF = ioread64_lo_hi(iobase + MAC_REG_TSFCNTR);
 
 	return true;
 }
-- 
2.25.1

