Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F09672
	for <linux-staging@lists.linux.dev>; Sun, 11 Apr 2021 23:10:34 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id 20so1414687pll.7
        for <linux-staging@lists.linux.dev>; Sun, 11 Apr 2021 16:10:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Xs83SoRxjxMZm2G5yOIIqfQY+EA3Ry1y9P9uXPT9iCU=;
        b=Z1uoqAlAInnYANBvRJ7X4808QkpHyM0B5anJf58ZmtqH6aoWhE8zuRtTQDQ+q4vmXh
         0hAst2YxF5Iueydg+08EqNS+zpqcrzDXB/K1G7tZtJ2jOCIxf0k2XnvWVOmDz0dWnOlJ
         bUH/65y9LAIoYurGny56wvzmM0ZQ5OHvtB9EJz9vH9F3qh7veZBU/jIQVsFrjtKA2neI
         jnW6c7cnsuwvrueopXHC6ybIGEVPlUMuJt0E3dINR0PVEO3Zarz9xu6/j+oFq4MWK34z
         +itQEYhFKDOYJ6EfhKC4ijSM/9avhE3ZUFtAERvdRQ2xLyEjqJu9W1mxuHt/fMS7LN0P
         Kr/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Xs83SoRxjxMZm2G5yOIIqfQY+EA3Ry1y9P9uXPT9iCU=;
        b=FnJK4BaDVItx0lGCVmfPRnVGsLZ46gwLW6sbibtSa+EYLBs6s+1a+Sp3KEV4dGxKzH
         gAAErA9D2831wJ2Su9YSZzrM41xc9KWHufkHTt0fwdsnPfpqdl8X9z0hCnghaqbgVY0T
         JLSndKVC7QuNxmUZo97wWm9VilupOK4kyeqBXaVU2EBSWOEMvsxEvdOz9sCqrstyCOtR
         TZ2xDsnXw7EXM76dTbqsgHFE7r7RsHdyHZlt3fWJXkrY4HMYpMRCsHA4aGArWc2EZEh2
         2MJA/npYVHB5MhuVk99kBORGCdEYjrtU7FIsWEsdDaFFBJyfpa0im7AZyT5JLSwxAPsO
         vq4w==
X-Gm-Message-State: AOAM531/39ET2YI2dkgZS75wErKCV7z8kAIxoURmoOdPJXDR18A+DOJ6
	HfE8W8DBMJGeHzGuCnBnVWU/c8pc16vmVA==
X-Google-Smtp-Source: ABdhPJyG7N2JLQntthbDfAnf2RU2X0N6jfbM1pYYCLLS25NDoHcDq4Wt1deSJifNlRrP5PfiHUSwKA==
X-Received: by 2002:a17:90a:d3c8:: with SMTP id d8mr25032069pjw.144.1618182634040;
        Sun, 11 Apr 2021 16:10:34 -0700 (PDT)
Received: from kali ([103.141.87.253])
        by smtp.gmail.com with ESMTPSA id 92sm8713357pjz.7.2021.04.11.16.10.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Apr 2021 16:10:33 -0700 (PDT)
Date: Mon, 12 Apr 2021 04:40:25 +0530
From: Mitali Borkar <mitaliborkar810@gmail.com>
To: sakari.ailus@linux.intel.com, bingbu.cao@intel.com,
	tian.shu.qiu@intel.com, mchehab@kernel.org,
	gregkh@linuxfoundation.org
Cc: linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com,
	mitali_s@me.iitr.ac.in
Subject: [PATCH 6/6] staging: media: intel-ipu3: remove space before tabs
Message-ID: <a01ff63a3b2fb14704f32e83bd12c4cf36410275.1618180660.git.mitaliborkar810@gmail.com>
References: <cover.1618180659.git.mitaliborkar810@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1618180659.git.mitaliborkar810@gmail.com>

Removed unnecessary space before tabs to adhere to  linux kernel coding
style.
Reported by checkpatch.

Signed-off-by: Mitali Borkar <mitaliborkar810@gmail.com>
---
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

