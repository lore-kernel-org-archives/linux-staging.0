Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A6546D32
	for <linux-staging@lists.linux.dev>; Thu, 15 Apr 2021 16:54:31 +0000 (UTC)
Received: by mail-qk1-f182.google.com with SMTP id b139so20482937qkc.10
        for <linux-staging@lists.linux.dev>; Thu, 15 Apr 2021 09:54:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=hfH9qknOEmohu17OrwvjCdEEb8rYc5CBKzPF1LsT3eY=;
        b=HzCYmhgbLL5xC8q4+NrcVQ3vIVEBudkfm4plF8E6VgB6YhvtP2uyfobR4oGYRqc2Wi
         Q5DGBKpm/SDyP1yoMOxMC1jhtsZ2069gFEzpzJ9wx3Q0d8U3ykMwuQNmnqJS3urjDLPL
         JnEQOW6B8VCio8ObDanO5gEpypAHZWUe0vAnAjAdUiTe6ALa0nNBfuaA0rGXxDtALEwh
         A71fyif6OZWf6DSJpxi4I2i1enFxLqkggYqtbmp+XybqdK6HpDL+i6/7kU/tGQbIuIob
         cJESNvbo00sUZobY3tcS8JEurg64cXZLCYpSLuQd84nZmN2LoLd4tzSzBQUxvSXhhYkD
         TW1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=hfH9qknOEmohu17OrwvjCdEEb8rYc5CBKzPF1LsT3eY=;
        b=X9F5PM1aYHz3JpDAVvJTOYsEDM1uRJtbd5eaa1nrdwhzAi1AC3cyVVrLPt28IKiCgP
         jjK8RqS1wNhy5PLtF8z8H3HdB0UNaAAwzTgI2wT6efPnPWTNp8K6eFeLNmv/oJYmWbJn
         dtTO104jjTWsB65H7hxANe8CuhD2rbLq90RKOUhaq85KvmjZBuzZrcLhjPwEM0T/NAfx
         zMA3FlCzPeJquoqug8ziEinACSp6C55q3Y9BEP2h/RxM3XI06nxaIHGJ1vSgdMoKlVpn
         fqNk89np1rgaeH2OZpS2zuZQk6L2JlY4hy/0WmnPpBa59sDSRaRTEfB1o8GLFqhA1Kpo
         0Lyw==
X-Gm-Message-State: AOAM532J3bCQNxHrXoe3pgxQhQxWB1gDKW5Gn8R8AFiarYcRq8oKPMDp
	7pZl5mllpqow5tLHH5uvqZQ=
X-Google-Smtp-Source: ABdhPJxHQx7kaQAUYXUKg9bgvGIurPdPr8BTriL9Xg9YPgc770mRYeBfV651EpOCszqCi5yu9FE4Ig==
X-Received: by 2002:a37:6693:: with SMTP id a141mr2048435qkc.121.1618505670663;
        Thu, 15 Apr 2021 09:54:30 -0700 (PDT)
Received: from focaruja ([138.204.24.234])
        by smtp.gmail.com with ESMTPSA id q125sm2431762qke.11.2021.04.15.09.54.29
        (version=TLS1 cipher=ECDHE-ECDSA-AES128-SHA bits=128/128);
        Thu, 15 Apr 2021 09:54:30 -0700 (PDT)
Date: Thu, 15 Apr 2021 13:54:27 -0300
From: Aline Santana Cordeiro <alinesantanacordeiro@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com
Subject: [PATCH 2/4] staging: media: atomisp: pci: Balance braces around
 conditional statements in file atomisp_compat_css20.c
Message-ID: <f62bb001e25d0ba395810de7f02452c7a13869c1.1618505476.git.alinesantanacordeiro@gmail.com>
References: <cover.1618505476.git.alinesantanacordeiro@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1618505476.git.alinesantanacordeiro@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)

Balance braces around conditional statements.
Issue detected by checkpatch.pl.
It happens in if-else statements where one of the commands
uses braces around a block of code and the other command
does not since it has just a single line of code.

Signed-off-by: Aline Santana Cordeiro <alinesantanacordeiro@gmail.com>
---
 drivers/staging/media/atomisp/pci/atomisp_compat_css20.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
index faa0935..92e2bad 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
@@ -2784,9 +2784,9 @@ int atomisp_get_css_frame_info(struct atomisp_sub_device *asd,
 	int stream_index;
 	struct atomisp_device *isp = asd->isp;
 
-	if (ATOMISP_SOC_CAMERA(asd))
+	if (ATOMISP_SOC_CAMERA(asd)) {
 		stream_index = atomisp_source_pad_to_stream_id(asd, source_pad);
-	else {
+	} else {
 		stream_index = (pipe_index == IA_CSS_PIPE_ID_YUVPP) ?
 			       ATOMISP_INPUT_STREAM_VIDEO :
 			       atomisp_source_pad_to_stream_id(asd, source_pad);
-- 
2.7.4

