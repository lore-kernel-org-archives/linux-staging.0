Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BE66173
	for <linux-staging@lists.linux.dev>; Thu, 19 Aug 2021 15:30:17 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id z20so13738661ejf.5
        for <linux-staging@lists.linux.dev>; Thu, 19 Aug 2021 08:30:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XaGQNjoFDqClYFNGQw17hG3Sx6lRDKqVTcPsNKf9+H8=;
        b=j0ySqt6FojZ9+3ONUFQ9SqyXGH9+BPy2DoBRXKxyLkXadoUE1hn+9ajGqg3acb5sBg
         J47h3ELWE+MfMQ4obhd163Oq7CQ3CZpJGfzClNZZ6UR59+HPpMHKro/rZI2sI/l/A62v
         NdDZ46RUbe29w8gzfqvuESJpdY3M6ZuuT/Qq8Bn4ykt9WaSI0G+E1HVKMB3EviJEVzga
         WyH+vJRX1ku0McgDzJjmIgiDAoWrOfyv3VB22YEyotDN6fEDu4ykQz5EV67hmUyQuFWH
         taljKh8lkx5r9T9zf8TaPjRPW1dEov/40ObTcic1zz68xsinvEizIxi9MljMntoGAoDw
         51hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XaGQNjoFDqClYFNGQw17hG3Sx6lRDKqVTcPsNKf9+H8=;
        b=DzL8ksONY6XNclnTDU/nVD1DfoAOaz+mvPXrsOW3u1daaRQgzjtbzYy7Z7Chafe5K0
         Z3CUELKHVSuu+6UhBX5dlaD3XZteba/YNu9nHC0l4UJO2vNApLSkpvWKAznO5Ke/I5HT
         yH0GUKStQKw1qcyL4tqVFO8JltxL4y1gjGPcyaElqDY3mlWIgg1c+IWE/lyx7URoZEf7
         VES55593USjGFyYZoG33srM3V+lfdbkaK4sMM8W1I9ocTMwWMQcaKbrtXPziiqe24K6R
         B0ytmKz6a2wphTwNGghIpmEM8KYM0LnUgSamW/6gCpOmom62hd+NkbG4mcJ/MLrJYdNX
         FciQ==
X-Gm-Message-State: AOAM5323N2ZpSco42vSWW2xyUlPoyWPOsQmc/7HP8kz1i9sLVxpBCbLc
	w2guLHCfkAIWJnCIRcYjr8wCw6VQBcM=
X-Google-Smtp-Source: ABdhPJzpYgp+/flMjF241aQ9cCXe2tbGEsvGFt5hyAVQxypvqlM74H3TMEBe/x5CQ0kBFYbAnC7hiQ==
X-Received: by 2002:a17:906:c251:: with SMTP id bl17mr16314325ejb.219.1629387015517;
        Thu, 19 Aug 2021 08:30:15 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::687e])
        by smtp.gmail.com with ESMTPSA id m18sm1958658edr.18.2021.08.19.08.30.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Aug 2021 08:30:15 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH] staging: r8188eu: use GFP_ATOMIC under spinlock
Date: Thu, 19 Aug 2021 17:29:14 +0200
Message-Id: <20210819152914.17482-1-straube.linux@gmail.com>
X-Mailer: git-send-email 2.32.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

kmalloc() in function update_bcn_wps_ie() is called under a spinlock
so the allocation have to be atomic.

-> update_beacon() <- takes a spinlock
   -> update_bcn_vendor_spec_ie()
      -> update_bcn_wps_ie()

Fixes: 79f712ea994de ("staging: r8188eu: Remove wrappers for kalloc() and kzalloc()")
Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_ap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/r8188eu/core/rtw_ap.c b/drivers/staging/r8188eu/core/rtw_ap.c
index 1f3aa0092ef9..41b5668d080b 100644
--- a/drivers/staging/r8188eu/core/rtw_ap.c
+++ b/drivers/staging/r8188eu/core/rtw_ap.c
@@ -1192,7 +1192,7 @@ static void update_bcn_wps_ie(struct adapter *padapter)
 	remainder_ielen = ielen - wps_offset - wps_ielen;
 
 	if (remainder_ielen > 0) {
-		pbackup_remainder_ie = kmalloc(remainder_ielen, GFP_KERNEL);
+		pbackup_remainder_ie = kmalloc(remainder_ielen, GFP_ATOMIC);
 		if (pbackup_remainder_ie)
 			memcpy(pbackup_remainder_ie, premainder_ie, remainder_ielen);
 	}
-- 
2.32.0

