Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52B0632ED3A
	for <linux-staging@lists.linux.dev>; Mon,  8 Jun 2026 15:16:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780931801; cv=none; b=S9tNWxSZd6f+JzfQff/8SW32mlAU38VR68NwpxNUJSteZ+JznynOfv32SSCkOZFhnmTGp6bc9JcLkzUfGAEi7RbPS9GcRUV0Farlrklv0SYyoLuvHDKnJGN2hcsPp6sLqFQJzfq9Wp0ICBZAAuqKwTOk4TfP4BiwjTmglf90CUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780931801; c=relaxed/simple;
	bh=+Adic+T2znQgdxxRgMuzaFBipB4oYX5M3eDjZE8lqw0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QDskI+Hazo4qfQIBM9qxGJZMAzREPQr76s0vFf1R7ADcDbOG4rnrHXwYVDmj/MwR37EV5cM4/7gJMKXAlmmZaOirrx7q+pnuo96QwyL3514uiMX5seu9JOQY/osoIpJNQTT82Zmj89SqO+1WjZKgQNYjVN3dXlmaQbugjyVQGrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tumelty.co.uk; spf=none smtp.mailfrom=tumelty.co.uk; dkim=pass (2048-bit key) header.d=tumelty-co-uk.20251104.gappssmtp.com header.i=@tumelty-co-uk.20251104.gappssmtp.com header.b=Z/Bu6ZB4; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tumelty.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=tumelty.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tumelty-co-uk.20251104.gappssmtp.com header.i=@tumelty-co-uk.20251104.gappssmtp.com header.b="Z/Bu6ZB4"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-490d1e54b3bso6755925e9.1
        for <linux-staging@lists.linux.dev>; Mon, 08 Jun 2026 08:16:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tumelty-co-uk.20251104.gappssmtp.com; s=20251104; t=1780931799; x=1781536599; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eVHQVd8Cibi1FnHd10mOaHGzwUNox/elwnpPYgAowKg=;
        b=Z/Bu6ZB4X3yblnqRtq+xPmH6pi/HJwQ4KdDj/seA8km/BhTPksO8igge37JvXNe382
         qv12Q69tOKGVVVPcavfE+wCfI/t7ajok/kdfNMk/H6XBLvvPiG53fZzSrGPEvgszEuLV
         woVRe8CuTm6whGWt4jkds2eYEHLRJMGQ0x1+q/aMPkEU6RmX7R7EtW937l7pl5BsI70b
         nORTAcBmBhzBWOHW+PGsy01McCfCzROf1zqJZnr6lcp+sCwksRZ3c5As1YoqBkNkDGwS
         /lbYxdY3GH3qlN81rr0ejEDC5PPsixPeUZEWkwLWVR8cbuBN/bOsODehgdBBYkWgoFPZ
         ckSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780931799; x=1781536599;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eVHQVd8Cibi1FnHd10mOaHGzwUNox/elwnpPYgAowKg=;
        b=D/cfw+FFClhDpp8Gc08IUgjZiIsnDPWS0zmyvxuL1K38uuPSCeUptT7NMLG1GpalCG
         1dQbi4UL1Kf3L8Zr7IvkUcm7iUBiZdlL/WxiX4DaGc3W6KUq8tCK0FLvkghG2r1/BtK/
         UHQIOYMufmZf3skYEc3g0UDFD5dJoFp5pHGPZBsutfLIybcYm84rawt8+eQVRIHYUvWA
         l+WQZhgZFkNKmZvcmtB2OkC1POdgT7U+6wR3DchCwIq1rIdMsBi56G/KaQiv/qM0GrOq
         K8XfAMcceZrl08XZcXRNZTNRECA1UMVPDa3EEGS4sRRoIgPP7XXCcp6QNpvUhHc3Q5mj
         gG4g==
X-Forwarded-Encrypted: i=1; AFNElJ+b5bRX98G1OSccFnnaUVlBfe8V67SIhw4+5cZFrjBlKDy9IdpV62UY0FZWKMJLR+myjfp61iQK2A5B8S1A@lists.linux.dev
X-Gm-Message-State: AOJu0YzMksA95Lxqb32/9D8dBrrMIYhAd0jWYHWqkY9fgzrXQV/U65pv
	4oN/2jMbPY+gCpZRevZQ/LrYIMmHPuStdaLYaH1O3cydQJOQomLJ+WNJScrej4koU34Mx7PAvPu
	zEz2RErJu+A==
X-Gm-Gg: Acq92OHR+DPqBdOy8eGgwZXBz1VswH94yXHKch4peDY7k7A6PtEIEQpavmEB/l+D/iK
	kCWIFXPuxHDo/KPBJLCOak7VAgoYuRNg3bxDFpsnPAbZRhP6FOpzfSW4Svzi9SLzacy9rU4Ke/5
	nqnjlYBVueKoeNDrKAjto1rA3vz4mfp6tZ+j5mrq5mspz12AkV1AdMZxoOO2EOrooWbLcd2gWn6
	4B9y7yqG6IxxCqeGFYxZX6/FGcOwH+tP7xFsCopDBkjvChT2W3llrAa8DVXhy5bJ2CEDG23epip
	Aukp9QvrxOEFeZjj/d7FoRjxGkhGHDZzlBKZiVZeYdqRYTjlzKjl6AREz+oI00Hw1owoDItYMkI
	amqJAwk8k+0lzk2PRxO8yiLF9lYBhW9H0NWUw21AssuECm2wONJPAIeTzILQNEm11YjAdcPkvi2
	+LMVZ7fvpiqamE+Rruu2TTxuE=
X-Received: by 2002:a05:600c:a302:b0:490:c2a3:1781 with SMTP id 5b1f17b1804b1-490c2a317c3mr208748495e9.34.1780931798525;
        Mon, 08 Jun 2026 08:16:38 -0700 (PDT)
Received: from nixos ([83.217.168.175])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f35fd33sm58630734f8f.35.2026.06.08.08.16.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 08:16:38 -0700 (PDT)
From: Rhys Tumelty <rhys@tumelty.co.uk>
To: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Andy Shevchenko <andy@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Rhys Tumelty <rhys@tumelty.co.uk>
Subject: [PATCH] staging: media: atomisp: fix variable shadowing warnings
Date: Mon,  8 Jun 2026 16:16:17 +0100
Message-ID: <20260608151617.3393471-1-rhys@tumelty.co.uk>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix local variable shadowing warnings, flagged by a W=2
kernel build, due to -Werror=shadow.

In atomisp_css_stop(), an inner loop 'i' index shadows
an outer unsigned int i. Rename the inner loop index to 'k'

In ia_css_stream_create(), the block-local 'effective_res'
struct shadows an outer local declaration. Rename the
block scoped instance in the loop over pipes to
'pipe_effective_res' to clearly show context.

Signed-off-by: Rhys Tumelty <rhys@tumelty.co.uk>
---
 .../media/atomisp/pci/atomisp_compat_css20.c       |  6 +++---
 drivers/staging/media/atomisp/pci/sh_css.c         | 14 +++++++-------
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
index be5f37f4a6fd..da945fddb5ea 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
@@ -1775,10 +1775,10 @@ void atomisp_css_stop(struct atomisp_sub_device *asd, bool in_reset)
 
 	if (!in_reset) {
 		struct atomisp_stream_env *stream_env;
-		int i, j;
+		int k, j;
 
-		for (i = 0; i < ATOMISP_INPUT_STREAM_NUM; i++) {
-			stream_env = &asd->stream_env[i];
+		for (k = 0; k < ATOMISP_INPUT_STREAM_NUM; k++) {
+			stream_env = &asd->stream_env[k];
 			for (j = 0; j < IA_CSS_PIPE_ID_NUM; j++) {
 				ia_css_pipe_config_defaults(
 				    &stream_env->pipe_configs[j]);
diff --git a/drivers/staging/media/atomisp/pci/sh_css.c b/drivers/staging/media/atomisp/pci/sh_css.c
index cd1be313c758..44c77179abb8 100644
--- a/drivers/staging/media/atomisp/pci/sh_css.c
+++ b/drivers/staging/media/atomisp/pci/sh_css.c
@@ -7971,22 +7971,22 @@ ia_css_stream_create(const struct ia_css_stream_config *stream_config,
 	}
 
 	for (i = 0; i < num_pipes; i++) {
-		struct ia_css_resolution effective_res;
+		struct ia_css_resolution pipe_effective_res;
 
 		curr_pipe = pipes[i];
 		/* set current stream */
 		curr_pipe->stream = curr_stream;
 		/* take over effective info */
 
-		effective_res = curr_pipe->config.input_effective_res;
-		if (effective_res.height == 0 || effective_res.width == 0) {
-			effective_res = curr_pipe->stream->config.input_config.effective_res;
+		pipe_effective_res = curr_pipe->config.input_effective_res;
+		if (pipe_effective_res.height == 0 || pipe_effective_res.width == 0) {
+			pipe_effective_res = curr_pipe->stream->config.input_config.effective_res;
 
-			curr_pipe->config.input_effective_res = effective_res;
+			curr_pipe->config.input_effective_res = pipe_effective_res;
 		}
 		IA_CSS_LOG("effective_res=%dx%d",
-			   effective_res.width,
-			   effective_res.height);
+			   pipe_effective_res.width,
+			   pipe_effective_res.height);
 	}
 
 	err = ia_css_stream_isp_parameters_init(curr_stream);
-- 
2.54.0

