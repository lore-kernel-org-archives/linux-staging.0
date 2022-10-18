Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AE317B;
	Tue, 18 Oct 2022 10:03:01 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id s20so21649137lfi.11;
        Tue, 18 Oct 2022 03:03:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=poXckQpsmoxwNoGHA5Pmt8l8Bzt77xEo7VBtN46YHYQ=;
        b=p7utgJyKryujBfOPEjv6vh8HH+AWAsC6LMzl8ki2a10z+rnLThEJcuJISSoritjCUh
         DfF078C190eRQSRgoF8aSWQjaxGm+b+EhPjVt8eBY57aPbdVpvnypKqGEmRGMjDozG0L
         vLgngsclSMyY67BYvfVGWkzOORHr2rkNkY5o25x9D/gzzkRtqv5UZsPbokoREXeGF4oT
         tuFH8qdrEuMZYippqqqs3jNTgTuikjg/mb0Q56AZpJJg3Tzm7cYvqptO1fmmKE7ult6F
         dWLQC+khsl8P+AF3RhtEwSwzzGplYjlY7O0Rq7dvcsQcLyqNdHjJzobHFV7tPxjZDRJX
         L71A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=poXckQpsmoxwNoGHA5Pmt8l8Bzt77xEo7VBtN46YHYQ=;
        b=G3r7nbKHPsBblJsWWPHJYNHb9xZJGAAJ3/oKVFgodHXHkIunLfN7PpAUktl2dmOm2N
         w/pfYevIAldg8jwPidMUrU1fBu/2vcmff/WtcVSlOd37mTJX1+y1FfQFvg3lj14Yot3d
         URlJYDNUvBBulC3T1nefyE/c+f+VRmT5wVluKAyOAGX7zBY7+9J/QA1yy2PGNr5DDVDM
         g+rpVQ1ySw3d6n6S22VxOHfuE+TO/vM7fuJuOmE7A/NGXqQRKL4FEXkTgYMePArrwhBI
         qTt0QuY01Ju5Z6vj5sE7vy7qyZYHhJDuOQ4k+LaLfnOPN++jNK26En+Qn6OIjiAWfnNi
         utmQ==
X-Gm-Message-State: ACrzQf07YkDwUIUg23mIEOur0qJIMXDZYfSDaeLJPIgiHz4eeRUTOESL
	nO+STnfCIoLmzjnYC5yIB90QMzxKCQ7Q9Xip
X-Google-Smtp-Source: AMsMyM56LVd0XFwiHiLjZI0E1QuNElsebCjqLZm/47q+GyjX2qlYoDQAkmI7lzrQdVoCKJEtiFcCrQ==
X-Received: by 2002:ac2:4c03:0:b0:4a2:2273:89c6 with SMTP id t3-20020ac24c03000000b004a2227389c6mr650293lfq.245.1666087378946;
        Tue, 18 Oct 2022 03:02:58 -0700 (PDT)
Received: from elroy-temp-vm ([20.240.130.248])
        by smtp.gmail.com with ESMTPSA id a11-20020a19f80b000000b004a45ed1ae21sm1789261lff.224.2022.10.18.03.02.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Oct 2022 03:02:58 -0700 (PDT)
Date: Tue, 18 Oct 2022 10:02:57 +0000
From: Tanjuate Brunostar <tanjubrunostar0@gmail.com>
To: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, outreachy@lists.linux.dev
Subject: [PATCH] [PATCH] staging: rts5208: merge unnecessary split line
Message-ID: <Y0550VcHI8NzFzzf@elroy-temp-vm.gaiao0uenmiufjlowqgp5yxwdh.gvxx.internal.cloudapp.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Fix checkpatch warning by merging unnecessary split line in order to
avoid ending a line of code with a "(". The resulting code does
not affect readability and is well within the code-style guidelines

Signed-off-by: Tanjuate Brunostar <tanjubrunostar0@gmail.com>
---
 drivers/staging/rts5208/sd.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/rts5208/sd.c b/drivers/staging/rts5208/sd.c
index d1fafd530c80..4643127a87ca 100644
--- a/drivers/staging/rts5208/sd.c
+++ b/drivers/staging/rts5208/sd.c
@@ -4501,8 +4501,7 @@ int sd_execute_write_data(struct scsi_cmnd *srb, struct rtsx_chip *chip)
 			sd_card->sd_lock_notify = 1;
 			if (sd_lock_state &&
 			    (sd_card->sd_lock_status & SD_LOCK_1BIT_MODE)) {
-				sd_card->sd_lock_status |= (
-					SD_UNLOCK_POW_ON | SD_SDR_RST);
+				sd_card->sd_lock_status |= (SD_UNLOCK_POW_ON | SD_SDR_RST);
 				if (CHK_SD(sd_card)) {
 					retval = reset_sd(chip);
 					if (retval != STATUS_SUCCESS) {
-- 
2.34.1

