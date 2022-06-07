Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BE7C7C
	for <linux-staging@lists.linux.dev>; Tue,  7 Jun 2022 19:26:37 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id a29so1334091lfk.2
        for <linux-staging@lists.linux.dev>; Tue, 07 Jun 2022 12:26:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7a/Vr1nOHr0fdDem7DkzJVpMhvssXRRyxw7xup5e79I=;
        b=DfruFfsNeZwf5QHWRX3tl2wx4WCbK5YG3dRedjaUTJcnKKzbeWm3OI+O6GWuK1V8WZ
         R2cVADOtKEjE6rwstxA/aSOEX84upsZTEltFqI1i4cDc9pt32h9ZI2ZTikTBmoANe6rQ
         Fe9AQ4otShRqgXhtohsBeMtR/tJktVZhA+HpLrvI3D/5g08qT8vExdO4ei/rWac7lDND
         8hZS3mL6zwKyrdiK13QeXtpqKCYXJ6gEMpG+duT/YJ3HGrHk18KGzw9M1c5QSmzYRCXx
         sAhtBQvKehi2NrqQdfTFSzkitswebZAXA9ycCxWqPcPSY0t5z2DrqoVAX1ByApVeS7Qi
         g6ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7a/Vr1nOHr0fdDem7DkzJVpMhvssXRRyxw7xup5e79I=;
        b=lT6GYIE66tuS81izvHc6BrOi4f22JA1V/fBi76uCt3+MzIXcXLJfcXLyC26N1EwvpX
         vTymIYA8vJi6x5dn++Ld0mPWcYr1zl00iB65sM6hj8zBZMksjnCRuj4rNNhmQ9u/Nqq2
         zNsyCbDqB3omjPnSGSvjPYTwNv5q4hB0KVmsK5MvDYko/SQiw+T+2c2eR1l86R4vWWRB
         Hjxwxl9k/oNPcoUknuZ/7Pjy+hYGLzJflIle7WCO3qGQra9kpYYP6xUMukXFNCNaslv/
         sbwMVCzGF/VByNhWz5N+7Mmx4BVegQLI5LQhMDXktGGtcje21oAsTnJCT17ReBvR2rmW
         3RQg==
X-Gm-Message-State: AOAM5313SnM1fAoN78sfARNXIa7UUxQwvF/gkS0bkyLyZcEWyExOEw4W
	NLsHGMbdmBNEdU36JZP3zQLjnzPMSh5Ofg==
X-Google-Smtp-Source: ABdhPJwrX47Y3YIqgEzQI+Z6/heU8hdGTYhoZaqHpiJucG3APs43e/cTPUq4MmfmFa90H7KIPhnkew==
X-Received: by 2002:ac2:488b:0:b0:479:2674:f1b0 with SMTP id x11-20020ac2488b000000b004792674f1b0mr11586089lfc.118.1654629996066;
        Tue, 07 Jun 2022 12:26:36 -0700 (PDT)
Received: from localhost.localdomain ([94.103.229.27])
        by smtp.gmail.com with ESMTPSA id t28-20020a05651c205c00b00253b24a90b6sm2982603ljo.17.2022.06.07.12.26.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jun 2022 12:26:35 -0700 (PDT)
From: Pavel Skripkin <paskripkin@gmail.com>
To: gregkh@linuxfoundation.org,
	Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	straube.linux@gmail.com,
	dan.carpenter@oracle.com
Cc: linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Pavel Skripkin <paskripkin@gmail.com>
Subject: [PATCH v4 4/4] MAINTAINERS: add myself as r8188eu reviewer
Date: Tue,  7 Jun 2022 22:26:31 +0300
Message-Id: <d6f6420a0d5ceff6bb50d268023f7d2e117027c5.1654629778.git.paskripkin@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <cover.1654629778.git.paskripkin@gmail.com>
References: <cover.1654629778.git.paskripkin@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

I was reviewing r8188eu patches for a while, but I am missing some of
them, since I am not in CC list. I want to be CC'ed to help reviewing
and testing more patches.

Acked-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Pavel Skripkin <paskripkin@gmail.com>
Acked-by: Phillip Potter <phil@philpotter.co.uk>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index a6d3bd9d2a8d..60e5e4007844 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -18920,6 +18920,7 @@ F:	drivers/staging/olpc_dcon/
 STAGING - REALTEK RTL8188EU DRIVERS
 M:	Larry Finger <Larry.Finger@lwfinger.net>
 M:	Phillip Potter <phil@philpotter.co.uk>
+R:	Pavel Skripkin <paskripkin@gmail.com>
 S:	Supported
 F:	drivers/staging/r8188eu/
 
-- 
2.36.1

