Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14F406F
	for <linux-staging@lists.linux.dev>; Thu, 25 Mar 2021 13:35:23 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id b9so2293568wrt.8
        for <linux-staging@lists.linux.dev>; Thu, 25 Mar 2021 06:35:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=sgVSDNtewl13Faq2L7m0VtnnssegF5rNrygJnFP8kVQ=;
        b=V87PaBpvHuLPd8si+rBOURH9tvykrSdIEVgRyxYNGleHug7Pet20eoPwfqrKedmoIO
         xNyOiDnaGrRpgOWGqZIt7Ra3rkDGcRPc35bca/HZIO+b2B9oxyKF73LPvbC2MY+aG+3z
         gDJYeUMjH9jjxGofh5eJsQbE8bH+8z1EHCOQsmxALu+OE6nxImZWEkWVliEazofNk/M5
         iLO/jTivjtWTGjH5oUq9vEDwcOmF1mQNSjBQjzgWUkZiCfXymAjksiSwb7zhAzRPT7Nz
         xfuzouQfGNxeKnTgbFj4YROOe5NSYCUdP7NoF+jDDAFpV02rgPuqXQT+MX6PAdVvZy3U
         mjJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=sgVSDNtewl13Faq2L7m0VtnnssegF5rNrygJnFP8kVQ=;
        b=IN57KG8Cwdf7E2T++lfLQoonnJ1jHRPMWot9BuzOh0N6V5ajoJ3kiUNi2rll+OtNxm
         k996eBb1Ylcbp/B4NXr4q2VC5FgnhWfBhWozkJFVXIbzdJIlLJMocxjWBLnrjvvednsl
         J94BTHqr1hEots2YlgeDP5Q8kQkJpwXmRWGA576pRFmdBb5igBOz8eolrutmGekYjqCd
         pitLbGvmO6soOJ5nw3BHnfWaX/kgBsJOBGf9FzeteMeUOG6rvfdGyP0mpgT6Dkk3kPTX
         5wFnLGgtTuyX1B6qxuPE3KWaYBeW3Kwp3Dmnj7RNhSMk4KHL8jJwUGOgiTlR03ry9Tig
         vMfA==
X-Gm-Message-State: AOAM533NicAaV/Zxjkdj4uld5yJF+rkVPB268Zt5gmQvM5HAx7gQyuk0
	vAiB0iPTGts1ka1SM4rf7KM=
X-Google-Smtp-Source: ABdhPJwd7KMb+NBqOikfxgscq6R+fEgzdyHZZgsSGwNvgD1/Fl9xQHJKrszuzrDkcxvQ6aeWoBxONQ==
X-Received: by 2002:adf:f0c1:: with SMTP id x1mr8952882wro.7.1616679322564;
        Thu, 25 Mar 2021 06:35:22 -0700 (PDT)
Received: from m17r3en ([46.11.141.4])
        by smtp.gmail.com with ESMTPSA id o2sm6491758wmc.23.2021.03.25.06.35.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Mar 2021 06:35:21 -0700 (PDT)
Date: Thu, 25 Mar 2021 14:35:20 +0100
From: Swen Kalski <kalski.swen@gmail.com>
To: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: Ian Abbott <abbotti@mev.co.uk>,
	H Hartley Sweeten <hsweeten@visionengravers.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH] Staging: comedi: remove unnecessary else statement
Message-ID: <20210325133520.GA594125@m17r3en>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Removal of an unnecessary else in statging/comedi/comedi_buf.c
Add an early Return and removed the unleashed the else condition
for better readability int staging/comedi drivers.

Signed-off-by: Swen Kalski <kalski.swen@gmail.com>
---
 drivers/staging/comedi/comedi_buf.c | 52 ++++++++++++++---------------
 1 file changed, 26 insertions(+), 26 deletions(-)

diff --git a/drivers/staging/comedi/comedi_buf.c b/drivers/staging/comedi/comedi_buf.c
index 3ef3ddabf139..06bfc859ab31 100644
--- a/drivers/staging/comedi/comedi_buf.c
+++ b/drivers/staging/comedi/comedi_buf.c
@@ -371,35 +371,35 @@ static unsigned int comedi_buf_munge(struct comedi_subdevice *s,
 
 	if (!s->munge || (async->cmd.flags & CMDF_RAWDATA)) {
 		async->munge_count += num_bytes;
-		count = num_bytes;
-	} else {
-		/* don't munge partial samples */
-		num_bytes -= num_bytes % num_sample_bytes;
-		while (count < num_bytes) {
-			int block_size = num_bytes - count;
-			unsigned int buf_end;
+		return num_bytes;
+	}
 
-			buf_end = async->prealloc_bufsz - async->munge_ptr;
-			if (block_size > buf_end)
-				block_size = buf_end;
+	/* don't munge partial samples */
+	num_bytes -= num_bytes % num_sample_bytes;
+	while (count < num_bytes) {
+		int block_size = num_bytes - count;
+		unsigned int buf_end;
 
-			s->munge(s->device, s,
-				 async->prealloc_buf + async->munge_ptr,
-				 block_size, async->munge_chan);
+		buf_end = async->prealloc_bufsz - async->munge_ptr;
+		if (block_size > buf_end)
+			block_size = buf_end;
 
-			/*
-			 * ensure data is munged in buffer before the
-			 * async buffer munge_count is incremented
-			 */
-			smp_wmb();
-
-			async->munge_chan += block_size / num_sample_bytes;
-			async->munge_chan %= async->cmd.chanlist_len;
-			async->munge_count += block_size;
-			async->munge_ptr += block_size;
-			async->munge_ptr %= async->prealloc_bufsz;
-			count += block_size;
-		}
+		s->munge(s->device, s,
+			 async->prealloc_buf + async->munge_ptr,
+			 block_size, async->munge_chan);
+
+		/*
+		 * ensure data is munged in buffer before the
+		 * async buffer munge_count is incremented
+		 */
+		smp_wmb();
+
+		async->munge_chan += block_size / num_sample_bytes;
+		async->munge_chan %= async->cmd.chanlist_len;
+		async->munge_count += block_size;
+		async->munge_ptr += block_size;
+		async->munge_ptr %= async->prealloc_bufsz;
+		count += block_size;
 	}
 
 	return count;
-- 
2.25.1

