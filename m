Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCAF32FB8
	for <linux-staging@lists.linux.dev>; Mon, 14 Jun 2021 02:11:31 +0000 (UTC)
Received: by mail-qv1-f48.google.com with SMTP id c10so16955242qvo.9
        for <linux-staging@lists.linux.dev>; Sun, 13 Jun 2021 19:11:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:subject:message-id:mime-version:content-disposition;
        bh=/pYpS7z9b3a/6qRwLgr21klDpDKmQtlWnOviQqkYZ5Y=;
        b=MXFiXfB//FGQvrfCVcyKi13yZLX8QO3gQ1Fs8a+3hEVU+pqPP7gM0F8+tFH0i61t1z
         a9OS7MAgUfMo4ti4QzqUs8m63FSCEYOHEZwTPrZuk+0nbW9/lwXyelMxcwzXsznBm0ge
         /FJ3NDdxgT5PHQggefPEe0VId1ROWsP28XLOLKyyf5LfECNU5eIFfetf4GaWNjxxREN6
         wfPWARvyXRWxNYkSzTCWhzsEQHquYAsoMqeljVSo6At7Zuhk0J584TDYFA0sMaRH9ZOT
         ChHz4ax7eCED4sgUbe8AQKUtUpKngCIuYB0UdKqj4ghFpzesfNw3YbINupGepEBWOPqf
         FPZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-disposition;
        bh=/pYpS7z9b3a/6qRwLgr21klDpDKmQtlWnOviQqkYZ5Y=;
        b=YmkO0+NJxtoxGAIzYhYIkMGh+iA8MEIdqYAGhWk4dI+VGYhrG+QrqYzm7ehyHzasOa
         LKwzp6I4eK0V7aiT0ZBO8wQXLm3oewyFDk0rTcHMgovPLkI7apv04xxL/soqh/RzL7lY
         TOLDSxyhjNxo7cmwKljuNZ6c3RwipDNad/OG2CHbIq9tUrHrtCCTdVWd7p2CelPjW7Ps
         g5SkTrtWqp1OC5HW1Rltcy7xzsCyHtRXKpEAJpMiB/M1219i+pb0CPV0v367srDhw4Wb
         FW7cnI/ib6m0LUHLHJiXWbGhVvXWC4ADfxX2KrFoS61Aha3CtGw1f36t4Uw2fi05lITM
         1hTQ==
X-Gm-Message-State: AOAM530UgBQtWEHKW1/laHC5IXMfchqWMad7sd3VgS1h4Slbnk37ABHa
	1JumI7ulv4BAbXYTmJm0V+4=
X-Google-Smtp-Source: ABdhPJwxRYJeq9Jsx574+RgiHVOKhUsOAnplR8AyrKgoOtsl57ncyd0oeoda6WAU93g3Y6VdAofllw==
X-Received: by 2002:a0c:9e68:: with SMTP id z40mr16402873qve.17.1623636691013;
        Sun, 13 Jun 2021 19:11:31 -0700 (PDT)
Received: from tobias-VirtualBox (ool-18ba8988.dyn.optonline.net. [24.186.137.136])
        by smtp.gmail.com with ESMTPSA id o5sm8747078qta.51.2021.06.13.19.11.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Jun 2021 19:11:30 -0700 (PDT)
Date: Sun, 13 Jun 2021 22:11:30 -0400
From: Tobias Alam <tobiasalam@gmail.com>
To: Manish Chopra <manishc@marvell.com>, GR-Linux-NIC-Dev@marvell.com,
	Coiby Xu <coiby.xu@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	netdev@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: qlge: change msleep to usleep_range
Message-ID: <YMa60p5dl0LMV/9D@tobias-VirtualBox>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

This patch changes msleep() to usleep_range() based on
Documentation/timers/timers-howto.txt. It suggests using usleep_range()
for small msec(1ms - 20ms) because msleep() will often sleep longer than
the desired value. Issue found by checkpatch.

Signed-off-by: Tobias Alam <tobiasalam@gmail.com>
---
 drivers/staging/qlge/qlge_ethtool.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/qlge/qlge_ethtool.c b/drivers/staging/qlge/qlge_ethtool.c
index b70570b7b467..87d60115ac67 100644
--- a/drivers/staging/qlge/qlge_ethtool.c
+++ b/drivers/staging/qlge/qlge_ethtool.c
@@ -553,7 +553,7 @@ static int qlge_run_loopback_test(struct qlge_adapter *qdev)
 		atomic_inc(&qdev->lb_count);
 	}
 	/* Give queue time to settle before testing results. */
-	msleep(2);
+	usleep_range(2000, 2100);
 	qlge_clean_lb_rx_ring(&qdev->rx_ring[0], 128);
 	return atomic_read(&qdev->lb_count) ? -EIO : 0;
 }
-- 
2.30.2

