Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 958206D0E
	for <linux-staging@lists.linux.dev>; Fri,  9 Apr 2021 19:01:17 +0000 (UTC)
Received: by mail-qk1-f179.google.com with SMTP id i9so6906844qka.2
        for <linux-staging@lists.linux.dev>; Fri, 09 Apr 2021 12:01:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=dggCkVFWKXm7BbwuV1M/eeJV+LFnVGWYUCSH1BrxITE=;
        b=eoD/75Lry9hYJW+NtaMx1kuHbs6Y9pTzAWqGmRHkW2kF6YA2vILYwTZkysqyIKsT8+
         TnZeYAmb0U9yvdQvjX09FuGZA0Lz2YEO34j8q5Ikks1lrkPX89+lo8w6ifWmcJo7x7Fj
         AJDqq5W98PpPeuXUds4KKh7guTwZPgA28JaFWCsCIH9XSeuI3bMLgZB0fRAjqgmXWGR8
         TdalXAUNp71Ck+dq6p9xpCorY1yXqMs1OfRx88gRqTPUGvopovi0czH2Y3tiRSSlhGhd
         zjEhQfdyOvasgd6MmcNrPR84DxyYufy25Z1I8aN3qNisWuZdK1oke4VNVNMzAdcpDXKC
         Vyag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=dggCkVFWKXm7BbwuV1M/eeJV+LFnVGWYUCSH1BrxITE=;
        b=bAaGlMy9C4UpamZHjWLZx6OmlRmd7ZicORjp4gdFeMueL64ZEf+LVLThv96o7nhmiI
         kBi3CTZVVlb4Lk6ZN/vlB7K5r1Ij+QAh3gYAgs1hmtH8o70K+uy99GOaghy1s/TtAtMU
         E+kZooZAFRGmcQbH1kR1E3DB9DMU/FX5JLdN/3fJEPvmUvU/Vnbn+AsWrGRNM9QVLQ+T
         573gDRbgP1KSQ9NNat2bSO3h8NXNX3bENxN/n3rOhaaqc1+AOjy3KbgQCvrNXx+P5lgc
         102By4Mm81YsUVvX9Dr3VHAEryQ4wnO6aOcqlAWF9viIuGOVQ6Wqn9Ao5Ryj2ghzyHgY
         yCdA==
X-Gm-Message-State: AOAM5308+bvCj3HzkJ1qZAOd4ureKvrqntot6nq3nk1A40PC9O4R0+76
	gXZrwTHjvEUknfDWl37JJMQ=
X-Google-Smtp-Source: ABdhPJwLkehJzpMkS/f9rgVtrK0GiM31Fa1sZOds5K6XDrb5dYFdR2BbEIqsNXvMvGih9zIwJQuupg==
X-Received: by 2002:a05:620a:244f:: with SMTP id h15mr8950992qkn.235.1617994871845;
        Fri, 09 Apr 2021 12:01:11 -0700 (PDT)
Received: from focaruja ([177.220.174.147])
        by smtp.gmail.com with ESMTPSA id w78sm2409960qkb.11.2021.04.09.12.01.10
        (version=TLS1 cipher=ECDHE-ECDSA-AES128-SHA bits=128/128);
        Fri, 09 Apr 2021 12:01:11 -0700 (PDT)
Date: Fri, 9 Apr 2021 16:01:08 -0300
From: Aline Santana Cordeiro <alinesantanacordeiro@gmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com,
	alinesantanacordeiro@gmail.com
Subject: [Outreachy kernel][PATCH 2/2] staging: media: omap4iss: Align line
 break to the open parenthesis in file iss_video.c
Message-ID: <30cadc4bf072dc592cc82fba96a40685e25787dd.1617994571.git.alinesantanacordeiro@gmail.com>
References: <cover.1617994571.git.alinesantanacordeiro@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1617994571.git.alinesantanacordeiro@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)

Aligns line break with the remaining function arguments
to the open parenthesis. Issue found by checkpatch.

Signed-off-by: Aline Santana Cordeiro <alinesantanacordeiro@gmail.com>
---
 drivers/staging/media/omap4iss/iss_video.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/omap4iss/iss_video.c b/drivers/staging/media/omap4iss/iss_video.c
index 66975a3..a2cef7c 100644
--- a/drivers/staging/media/omap4iss/iss_video.c
+++ b/drivers/staging/media/omap4iss/iss_video.c
@@ -399,7 +399,7 @@ static void iss_video_buf_queue(struct vb2_buffer *vb)
 
 		if (start)
 			omap4iss_pipeline_set_stream(pipe,
-						ISS_PIPELINE_STREAM_SINGLESHOT);
+						     ISS_PIPELINE_STREAM_SINGLESHOT);
 	}
 }
 
@@ -957,7 +957,7 @@ iss_video_streamon(struct file *file, void *fh, enum v4l2_buf_type type)
 		unsigned long flags;
 
 		ret = omap4iss_pipeline_set_stream(pipe,
-					      ISS_PIPELINE_STREAM_CONTINUOUS);
+						   ISS_PIPELINE_STREAM_CONTINUOUS);
 		if (ret < 0)
 			goto err_omap4iss_set_stream;
 		spin_lock_irqsave(&video->qlock, flags);
-- 
2.7.4

