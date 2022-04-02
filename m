Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 732EA1853;
	Sat,  2 Apr 2022 12:28:28 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id c7so7847958wrd.0;
        Sat, 02 Apr 2022 05:28:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=eliJjdk7jbLJE3kqta2u7nx7t+Z1Xrdbg0dQj0W2hGE=;
        b=cZ2s0lHLNcNHE4xg7ogaJ48AtEiu2LY2/w15h11/MGF5PZo3TVaOHE6+htxhO7jgrL
         y4WV+hRXWUSzTFYxdiJOw1UaRWHXnxLSMxF8rZ9ri4ogr5SjVwWdHbArAm57EhcrsQBQ
         Ac0YCZjR8IDxzFpa0NxvsG1pfX56zmgc2lh89zSzYWCxE3lpfFGk6DCL1GZQ3sBzq6oO
         YCPx3XojEJbr8QLtkWQv0F/LfimIcAPp8GvI2v0lW8q9o6VvCKNqrWcnSZaivJ0wNOkL
         K8GOCH5TJZs5x7j+jXr9Dvb8kfRU3zhDb2r9/a8muaIO71TyKxd4zzWqZbWJhpHeLbGe
         U6lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=eliJjdk7jbLJE3kqta2u7nx7t+Z1Xrdbg0dQj0W2hGE=;
        b=DH8jKRxHpfB1/FjuLMfO9HIiM18yAZ+EtpSJgZCozwX7wzA7H3z2vkgcUTvBOG14+T
         1YulYGUlbrIXZ6xcdIKLn95KqJToKfEXd18AOSM7kuPfQJ2miW1bhkwwrUmoUCfqwDS2
         IGVChWJGz7AokFuHffFYAClYinU4hb0vpW7B+0vAWW/Xqgz/RU5fNetVsr6CR5nYhbrz
         5etpK1hQ3WK4ZKUy7tcWwTXu5mpUyFnmrJ1+Bq87mBzTlaVeLQoNNkN1ch4kd8IfTsN7
         g8ZZR2KiqpQnApDFKDDPpMkaSlGybAB/ppCjVdtBnQ+POjsAs3PL7ay9DQtkaJM2b6I7
         SIHA==
X-Gm-Message-State: AOAM531THch47pZvWXGHZfW+8B82b65/bVmxtIEyTmMgygtanlLHU5F3
	VaMc547OdYILuv7/LeM5np8=
X-Google-Smtp-Source: ABdhPJyeY53jJcGpZMdRQa/ArzO6Aq8e57wXvpxza7nODaW6Kfifkdn2BFA3A/I2zuFNIJYt6jKe9w==
X-Received: by 2002:adf:e10e:0:b0:206:2d7:b4de with SMTP id t14-20020adfe10e000000b0020602d7b4demr2163900wrz.497.1648902506773;
        Sat, 02 Apr 2022 05:28:26 -0700 (PDT)
Received: from alaa-emad ([197.57.138.121])
        by smtp.gmail.com with ESMTPSA id p8-20020a5d4e08000000b002054b5437f2sm4401473wrt.115.2022.04.02.05.28.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Apr 2022 05:28:26 -0700 (PDT)
From: Alaa Mohamed <eng.alaamohamedsoliman.am@gmail.com>
To: outreachy@lists.linux.dev
Cc: Larry.Finger@lwfinger.net,
	florian.c.schilhabel@googlemail.com,
	gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	eng.alaamohamedsoliman.am@gmail.com
Subject: [PATCH 2/2] staging: rtl8712: Fix Lines shouldn't end with '('
Date: Sat,  2 Apr 2022 14:28:17 +0200
Message-Id: <9bb14ea276fd3274900f7aec455174c53ed3a3e9.1648902188.git.eng.alaamohamedsoliman.am@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <8c88829f625f9847a1db18fe467399594dacb064.1648902188.git.eng.alaamohamedsoliman.am@gmail.com>
References: <8c88829f625f9847a1db18fe467399594dacb064.1648902188.git.eng.alaamohamedsoliman.am@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix " CHECK: Lines should not end with a '(' "
Reported by checkpatch

Signed-off-by: Alaa Mohamed <eng.alaamohamedsoliman.am@gmail.com>
---
 drivers/staging/rtl8712/rtl8712_xmit.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/rtl8712/rtl8712_xmit.c b/drivers/staging/rtl8712/rtl8712_xmit.c
index 05ba0ca7d627..d43c097f30c3 100644
--- a/drivers/staging/rtl8712/rtl8712_xmit.c
+++ b/drivers/staging/rtl8712/rtl8712_xmit.c
@@ -638,16 +638,12 @@ int r8712_xmitframe_complete(struct _adapter *padapter,
 		if (p2ndxmitframe) {
 			u16 total_length;
 
-			total_length = r8712_xmitframe_aggr_next(
-				pxmitbuf, p2ndxmitframe);
+			total_length = r8712_xmitframe_aggr_next(pxmitbuf, p2ndxmitframe);
 			do {
-				p2ndxmitframe = dequeue_xframe_ex(
-					pxmitpriv, phwxmits, hwentry);
+				p2ndxmitframe = dequeue_xframe_ex(pxmitpriv, phwxmits, hwentry);
 				if (p2ndxmitframe)
 					total_length =
-						r8712_xmitframe_aggr_next(
-							pxmitbuf,
-							p2ndxmitframe);
+						r8712_xmitframe_aggr_next(pxmitbuf, p2ndxmitframe);
 				else
 					break;
 			} while (total_length <= 0x1800 &&
-- 
2.35.1

