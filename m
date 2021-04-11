Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8011772
	for <linux-staging@lists.linux.dev>; Sun, 11 Apr 2021 17:33:31 +0000 (UTC)
Received: by mail-pg1-f172.google.com with SMTP id q10so7572226pgj.2
        for <linux-staging@lists.linux.dev>; Sun, 11 Apr 2021 10:33:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=4iE0QwYtOYUIJkBsUJWv+G7D+vD/AGIYmK25klck3y0=;
        b=sZSz+Xmu+nEJccFoszRmGiVuedsK1gEd7UgKgIuGaB1/lmB7k2UHKL1yZEuiYlr66a
         emCDhVLbn4qNOY1+KJcDYc2y6hxNp+bgaI1BIjX8JXc5vBZQLeDQPgBjzQBi9qMzoFv6
         dNmEW9wpzykAqm/iw509q7eIr2a67kZMgP8my8c7ZO6QGKXPRNQ1xhsGP+ThVASp7MS8
         mYlkgWko5uc81VJP3S4gbz/XEs35MMv9MuyD4QsD+OpXt07VyyDHxvpCIwgiXFp7RTCn
         hv6Qyeatfhuvb39sdYhYN64LfbYN80XPmVYOaYecCdfzvFchBycuxOW4S1hm7wUF7ihc
         xeLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=4iE0QwYtOYUIJkBsUJWv+G7D+vD/AGIYmK25klck3y0=;
        b=cOKzSdEAMFPKLKdPWWqtyoqBKulEtLhlDKKWKSmQxQVZm2q549lvXavWBJlcHFFIDl
         6DEHINqfRoSu3kZxURWPCyHCuwjRktwifDJ4DJuLtAo4DM5nQI2GGHzDNF2XTxh+VsLP
         VVdM49XMIpoRNEIQdo5d49dbtHv8us+MQzPiMYg8RDueKS0Ax4KzKZaHrQP2ugCfRK9M
         afLzX9g+Gqw+Aj3zLn5Ebnxfy9bet2bIoVACM41p15aO46NpkDHcZil+FsEG0K53nzFs
         3zPg+cA8osgZtcfEY3vwrhVQJO1kIDWmz8hq0cyCYnBatEBUugpnbg8U0oqpIYQlB281
         BxuQ==
X-Gm-Message-State: AOAM531hG3NywgSnVZxesWPFmwkjR66/UpVTlBw3lLG9OIf00W0LvA1+
	+irjA3OQ+5tThebEVUMXUuY=
X-Google-Smtp-Source: ABdhPJxeTxi0TcPAAmBRl/Cj1ZT36VOx3yuZp2HoJr1e9TzIgvg4SfRzylnZCd8UDaGBQZWhBrxS9g==
X-Received: by 2002:a63:181c:: with SMTP id y28mr23783254pgl.175.1618162410938;
        Sun, 11 Apr 2021 10:33:30 -0700 (PDT)
Received: from kali ([103.141.87.253])
        by smtp.gmail.com with ESMTPSA id t10sm8403802pjy.16.2021.04.11.10.33.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Apr 2021 10:33:30 -0700 (PDT)
Date: Sun, 11 Apr 2021 23:03:23 +0530
From: Mitali Borkar <mitaliborkar810@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy-kernel@googlegroups.com, mitali_s@me.iitr.ac.in
Subject: [PATCH] staging: rts5208: remove unnecessary ftrace-like logging
Message-ID: <YHMy457UGosfeaC0@kali>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Removed unnecessary ftrace-like logging by simply deleting that statement
as we have other modes of logging like ftrace.
Reported by checkpatch.

Signed-off-by: Mitali Borkar <mitaliborkar810@gmail.com>
---
 drivers/staging/rts5208/xd.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/rts5208/xd.c b/drivers/staging/rts5208/xd.c
index 0f369935fb6c..a305e15dfb9c 100644
--- a/drivers/staging/rts5208/xd.c
+++ b/drivers/staging/rts5208/xd.c
@@ -1628,7 +1628,6 @@ static int xd_finish_write(struct rtsx_chip *chip,
 	int retval, zone_no;
 	u16 log_off;
 
-	dev_dbg(rtsx_dev(chip), "%s ", __func__);
 	dev_dbg(rtsx_dev(chip), "old_blk = 0x%x, ", old_blk);
 	dev_dbg(rtsx_dev(chip),	"new_blk = 0x%x, ", new_blk);
 	dev_dbg(rtsx_dev(chip), "log_blk = 0x%x\n", log_blk);
@@ -1806,7 +1805,6 @@ int xd_delay_write(struct rtsx_chip *chip)
 	int retval;
 
 	if (delay_write->delay_write_flag) {
-		dev_dbg(rtsx_dev(chip), "%s\n", __func__);
 		retval = xd_switch_clock(chip);
 		if (retval != STATUS_SUCCESS)
 			return STATUS_FAIL;
-- 
2.30.2

