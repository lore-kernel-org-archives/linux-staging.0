Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C2BF72
	for <linux-staging@lists.linux.dev>; Tue, 13 Apr 2021 05:16:30 +0000 (UTC)
Received: by mail-pj1-f48.google.com with SMTP id u14-20020a17090a1f0eb029014e38011b09so3548891pja.5
        for <linux-staging@lists.linux.dev>; Mon, 12 Apr 2021 22:16:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=4XDX8cIaJxLhyXnc3hBMVHgdvzoZ+hyINeFmm7eH+kg=;
        b=A7Ec2k4DKxgt4iaOM4wzFNrzbGicCPfrkYDg+42NjbsV1MqVQ/0A0AVXWfO8QuxFKO
         +3SEP7Q0RNQ4f2PP18PGUf8soqkaLoacCDIva1/GKda1Wpo4Q3fIXIi3j8za8wPtAKEZ
         qW5jvfXL4zoUqvFuZuVCJvDPf1wUYVvOft6mshPzF+TzGdizx0Ye3Rd8037ZaHsXI66E
         uVmAXMJHwboaRd8GAa43J4mFXjYd0nBQOhBV4cwV0RjXABq36cr4prIuRiy4JSmS8BXT
         ybAODTDgKZWRN1+T6q4ruac9MX3m6gbvmsrvsxCRJaPm8z/HEC/xVSnUUP10uXfvURKk
         B2lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=4XDX8cIaJxLhyXnc3hBMVHgdvzoZ+hyINeFmm7eH+kg=;
        b=DiWHE6CdOLZr9LCCyeqj9YSlGZ5i3nfJfjKHVIvwj1clWoc7kmpraFlkCHFTo3Uhdg
         LvcD3euXjwfGX4gZh4SrI+1DEKzu/2ewV0mcLGiIlPD8yoCS58YDX1ssI2aPSbNKFyXm
         oNHw8dcSSqIZNOrdrKa83oShtmj9TIrKUHQyWR5ormdMeVY/buVdP9ia8DHejHRFhXSk
         Bq9pPYJ1vVaWtzgN5Ey0gdF3yoFz0Ki52iY6MVq/gRhKvNXK/LqYczBgBz/TNu5lH1Py
         lo28KGYqHVwNY3KPr5mhfD4eckrUWeAerAXTE6F2IN7le4kUQ95/MoC+nghU/7d3jDiL
         jHsw==
X-Gm-Message-State: AOAM530NiaNoiCss6YKJ5Ve1OFWN6QOAU2Sirv6wLikSj7mfjRtHUUa0
	x5BlBjTt7d6FweVt5cFOfc0=
X-Google-Smtp-Source: ABdhPJxeTMs3C/SB153yC/dYzXjpgpgVgWPbur7IpKAmHgi8Abi8apVHsMqKL+2M2Cw322fMQXCSOQ==
X-Received: by 2002:a17:902:e5d0:b029:eb:2814:8619 with SMTP id u16-20020a170902e5d0b02900eb28148619mr2079964plf.30.1618290989854;
        Mon, 12 Apr 2021 22:16:29 -0700 (PDT)
Received: from kali ([103.141.87.253])
        by smtp.gmail.com with ESMTPSA id u7sm957393pjx.8.2021.04.12.22.16.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Apr 2021 22:16:29 -0700 (PDT)
Date: Tue, 13 Apr 2021 10:46:22 +0530
From: Mitali Borkar <mitaliborkar810@gmail.com>
To: sakari.ailus@linux.intel.com, bingbu.cao@intel.com,
	tian.shu.qiu@intel.com, mchehab@kernel.org,
	gregkh@linuxfoundation.org
Cc: linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com,
	mitali_s@me.iitr.ac.in
Subject: [PATCH v2 4/4] staging: media: intel-ipu3: remove space before tabs
Message-ID: <a01ff63a3b2fb14704f32e83bd12c4cf36410275.1618289130.git.mitaliborkar810@gmail.com>
References: <cover.1618289130.git.mitaliborkar810@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1618289130.git.mitaliborkar810@gmail.com>

Removed unnecessary space before tabs to adhere to  linux kernel coding
style.
Reported by checkpatch.

Signed-off-by: Mitali Borkar <mitaliborkar810@gmail.com>
---
 
Changes from v1:- No changes.

 drivers/staging/media/ipu3/include/intel-ipu3.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/ipu3/include/intel-ipu3.h b/drivers/staging/media/ipu3/include/intel-ipu3.h
index 0451f8b7ba4f..340d97160bbb 100644
--- a/drivers/staging/media/ipu3/include/intel-ipu3.h
+++ b/drivers/staging/media/ipu3/include/intel-ipu3.h
@@ -631,7 +631,7 @@ struct ipu3_uapi_bnr_static_config_wb_gains_thr_config {
  * @cg:	Gain coefficient for threshold calculation, [0, 31], default 8.
  * @ci:	Intensity coefficient for threshold calculation. range [0, 0x1f]
  *	default 6.
- * 	format: u3.2 (3 most significant bits represent whole number,
+ *	format: u3.2 (3 most significant bits represent whole number,
  *	2 least significant bits represent the fractional part
  *	with each count representing 0.25)
  *	e.g. 6 in binary format is 00110, that translates to 1.5
-- 
2.30.2

