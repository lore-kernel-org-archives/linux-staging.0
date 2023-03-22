Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E963A28FC;
	Wed, 22 Mar 2023 13:36:07 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id r29so17083645wra.13;
        Wed, 22 Mar 2023 06:36:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679492166;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7Qcc01bThYgNN4EDH3PH3xQ8u1QU4sH2s8PABfTDu6Y=;
        b=J34H1SdbC/nCg/E/QjATqJYym9ALDDptxGYZd1j1eb0dYOENa62tJWHy9WD6GFbdO1
         bnrock3LLiOZy4DRZg3i2M9AmUktSR99PWNLoZJ0XXAiunQCDRso+N5YtRu4C8JrcwYF
         DLc0j3k3HipvC8V5BbNiRFL9zOu5kRf250ncc/BlscmMShbhb/PBZpileUDfRz18A7fy
         4OJJS6ItiZXXIdVdIS5mDwrYRYRsFBsKhABy9yCaTupX7Lm2Ch2YeihLrRYTWFAwY7Ee
         NWX/6etoOz0QcmRhvDjFRXpEj4TsltoTVhjSLV1C5Igt95lyUxR5TztF5eAbuAzUtnwV
         sXLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679492166;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7Qcc01bThYgNN4EDH3PH3xQ8u1QU4sH2s8PABfTDu6Y=;
        b=LcKLEWYQAaizLnYRbdwDBm6oBgI3NMdga43W/c1Uqtkdxxl1Xsli7VOUd4midJ0esE
         RvW83uh/ahd8OqKuWHNOkBdKm1SaP3Lnqy2dhyi0NJg+ci4JpDzOA7ck1SQcMssF14kh
         XLBKYmo/Wl7WgAEngl/h8o/XHJ3Lx/F07XAaosnCp++6hoJ97MOmPeWHtMLUrgc4gAoR
         AI+rk8eYSdAHNSERpEUzr6bCiwF8fQ2FRwrHZ96PIy86qGbfWmUyomJDGuSIfqmLjkvz
         /kh19csTJ3d8tnIU5kkP1SfH6oA3EBDWT4aqvgJKRjIY4TaAT4EylsVqB5IDRzLS8GDy
         iQ2A==
X-Gm-Message-State: AO0yUKU7PHi3/j6sxS5culxuWF+mNI7uj46amg8zi7gsvtjOweaoDjhx
	Ly3u972HcdTFnTCielfFg2Q=
X-Google-Smtp-Source: AK7set8KIMT38ukGDMClhbdqjX5z9iqnZpWLMZU/Q0vufQSV+5lMMAXT0J35nXLEOWiTQ5oIJ0gL1Q==
X-Received: by 2002:adf:f5ca:0:b0:2d0:cf21:a40d with SMTP id k10-20020adff5ca000000b002d0cf21a40dmr4814231wrp.10.1679492165965;
        Wed, 22 Mar 2023 06:36:05 -0700 (PDT)
Received: from khadija-virtual-machine ([39.41.14.14])
        by smtp.gmail.com with ESMTPSA id c9-20020a5d4cc9000000b002d21379bcabsm13831630wrt.110.2023.03.22.06.36.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Mar 2023 06:36:05 -0700 (PDT)
Date: Wed, 22 Mar 2023 18:36:03 +0500
From: Khadija Kamran <kamrankhadijadj@gmail.com>
To: outreachy@lists.linux.dev
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH] staging: ks7010: fix line ending with '('
Message-ID: <ZBsEQzL3Oidsmg/L@khadija-virtual-machine>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Splitting function header to multiple lines because of 80 characters per
line limit, results in ending the function call line with '('.
This leads to CHECK reported by checkpatch.pl

Move the first parameter right after the '(' in the function call line.
Align the rest of the parameters to the opening parenthesis.

Signed-off-by: Khadija Kamran <kamrankhadijadj@gmail.com>
---
 drivers/staging/ks7010/ks_hostif.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/ks7010/ks_hostif.c b/drivers/staging/ks7010/ks_hostif.c
index 9429ee155910..af3825578d85 100644
--- a/drivers/staging/ks7010/ks_hostif.c
+++ b/drivers/staging/ks7010/ks_hostif.c
@@ -75,9 +75,8 @@ static void ks_wlan_hw_wakeup_task(struct work_struct *work)

 	if (ps_status == PS_SNOOZE) {
 		ks_wlan_hw_wakeup_request(priv);
-		time_left = wait_for_completion_interruptible_timeout(
-				&priv->psstatus.wakeup_wait,
-				msecs_to_jiffies(20));
+		time_left = wait_for_completion_interruptible_timeout(&priv->psstatus.wakeup_wait,
+								      msecs_to_jiffies(20));
 		if (time_left <= 0) {
 			netdev_dbg(priv->net_dev, "wake up timeout or interrupted !!!\n");
 			schedule_work(&priv->wakeup_work);
--
2.34.1

