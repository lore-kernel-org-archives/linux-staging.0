Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4542733C9
	for <linux-staging@lists.linux.dev>; Tue,  7 Mar 2023 10:00:30 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id cw28so49983502edb.5
        for <linux-staging@lists.linux.dev>; Tue, 07 Mar 2023 02:00:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678183228;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bW3imLrGp8WnT6vZrMOHCljPinwG95AEioNHWio/7vQ=;
        b=L8FEZOA8koMilcVz3cjTV/TbCnAocXh7L/8qUd1x16qbmEZzfksfcMY1XtBXiszSMV
         MutxCKvuzckqOVVh4ZNkhEzZr/Hnl3LQvJ9SxQ1jcGi7AAxWE+VbF3SdHeqnMTvbs/y7
         S3jvNl/i0tSg+nQUGYU+8AcLss+SEWBu4wh9ihDpSbqC7qNAUL6JSmw3DPmzi+RSUIYV
         YWig7z7jztccm3jvIWLisKb3qvLNMib/gYjlAik6f9P809Y9qWQcmbobGPPhE10oOzwq
         4a6wFnRSnMLcKJ8vfumWJT7y3U5/3cYXbhERoS7wmRm4+NfvB5mWDJDNT5hfoDJMCVx8
         I3NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678183228;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bW3imLrGp8WnT6vZrMOHCljPinwG95AEioNHWio/7vQ=;
        b=SSFG5vku3BypC7HvLlBF8i2wrvtEB/OctdIF4mpO8nC1gnSZmotGMDD/7didWSk2wh
         tivOzM1OWS7CPJFnJ38Z70ANWYY10/ugmEVW+EyhBIJ4uq8p9pMLyDxhLv5OtXR9Vzfm
         j0kRBdeWBi5UZeuTXl7Xj0wt5txuN3wZbb94kWXjaF5mB/lu5s3sKrdWUnSODT2IyC2k
         hM/ojUiWUA4f/rw5dC7PYbEnkSCxoUVXHqv9AP8myQuTTjgEA/mMEU5gKqS7qH+0EL17
         rdAEA8lh2opjDvrA6AWeLtSWSGz0hm7v7NDq3EmPCGTQP+IjdUM/WjJELVTNP9cHyoz2
         eRSg==
X-Gm-Message-State: AO0yUKWd0SiSkA/wmmY7Z4/9/xEe2T3V46K1IkhcsmU3pc7IEeO+bQqW
	byY0l0nvRIm+ME558HMgogg=
X-Google-Smtp-Source: AK7set+Mu0sSz5kh5LcUFRENpxc7AFUW6iMQai3ePX6vLZBpQmKw5SrwMprhdA8xotXGanAeNWGcwg==
X-Received: by 2002:a17:906:1410:b0:8f6:76da:90dd with SMTP id p16-20020a170906141000b008f676da90ddmr12794941ejc.64.1678183228457;
        Tue, 07 Mar 2023 02:00:28 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id m26-20020a50999a000000b004af73333d6esm6502618edb.53.2023.03.07.02.00.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Mar 2023 02:00:28 -0800 (PST)
Date: Tue, 7 Mar 2023 13:00:23 +0300
From: Dan Carpenter <error27@gmail.com>
To: Oliver Endriss <o.endriss@gmx.de>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Husni Faiz <ahamedhusni73@gmail.com>,
	Li zeming <zeming@nfschina.com>, Oliver Endriss <o.endriss@gmx.de>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	kernel-janitors@vger.kernel.org, lwn@lwn.net, smatch@ver.kernel.org
Subject: [PATCH] media: av7110: prevent underflow in write_ts_to_decoder()
Message-ID: <9dbe6804-7fac-4ee1-9e70-c3648cb60ec8@kili.mountain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The buf[4] value comes from the user via ts_play().  It is a value in
the u8 range.  The final length we pass to av7110_ipack_instant_repack()
is "len - (buf[4] + 1) - 4" so add a check to ensure that the length is
not negative.  It's not clear that passing a negative len value does
anything bad necessarily, but it's not best practice.

With the new bounds checking the "if (!len)" condition is no longer
possible or required so remove that.

Fixes: fd46d16d602a ("V4L/DVB (11759): dvb-ttpci: Add TS replay capability")
Signed-off-by: Dan Carpenter <error27@gmail.com>
---
This is from static analysis and not tested.  I debated whether to
return 0 or -1.

 drivers/staging/media/av7110/av7110_av.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/av7110/av7110_av.c b/drivers/staging/media/av7110/av7110_av.c
index 0bf513c26b6b..a5c5bebad306 100644
--- a/drivers/staging/media/av7110/av7110_av.c
+++ b/drivers/staging/media/av7110/av7110_av.c
@@ -823,10 +823,10 @@ static int write_ts_to_decoder(struct av7110 *av7110, int type, const u8 *buf, s
 		av7110_ipack_flush(ipack);
 
 	if (buf[3] & ADAPT_FIELD) {
+		if (buf[4] > len - 1 - 4)
+			return 0;
 		len -= buf[4] + 1;
 		buf += buf[4] + 1;
-		if (!len)
-			return 0;
 	}
 
 	av7110_ipack_instant_repack(buf + 4, len - 4, ipack);
-- 
2.39.1

