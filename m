Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1542A2E54CC
	for <linux-staging@lists.linux.dev>; Mon, 16 Feb 2026 20:19:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771273166; cv=none; b=upUtdJEvW+loXpW2hL09YdH3y2qZAbqGreUzvG5u0m3lm2jBThucfy7//X8OLrKVR2NWSp23koISp3gGI8jz19vf7OW4/RAC4ZuNqyL6SBlN8rzp/wadNlZbrNY5cu7eC3XTE82COtnOzHaOOAF8sE+o+LyLKVodtK9E7RTgitY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771273166; c=relaxed/simple;
	bh=dJfnYlid35pe2SJSokRooiDlcSYvPD84HLVz24A0UXA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EPDl6N5O5fogKzOSs5G7/N5qWLuyAJlLwIa0CrigVmx7Zdxxl7ZqOp1zhE6Yb/d2+H5S9TJSnZpWYhRdhNQMdfFJiEHU0bJGgO9nT7Ghqe8UHHM+cDb3mA3hC2srC0l2tI7hylhLtC6LAb1f7Veh9V2sEjKG/R/FN+87zoIhO3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xn3Bh+XH; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xn3Bh+XH"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b8fb3c4bbc4so477434866b.2
        for <linux-staging@lists.linux.dev>; Mon, 16 Feb 2026 12:19:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771273162; x=1771877962; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p9GwxEw6MSCg9oWHFrNUkW5VtcIdCqzBst6/spWlTtU=;
        b=Xn3Bh+XHsMddhjVFIfHWS0aifjkMkJhg7/6t/Q2aNunF6x54pf6ytYnOdCZBlwesv2
         IOjHEXgtstxWwK9W0xJQeV4WcP/uv1dvwWLLppxCfgu/Db9KPal4PcF1SvK34/CqKVW7
         bUBFJNfoPn4eqZ8JL0RjmGXbMLCz2Bc7281IjR8+XK6RtWw7YxdA/hPaxZ8E6Z+RqVMq
         6RdTGrZCe9cjKYJxsCriPeYvsMRVaw9hzSSwjbqojvrfLYocv02VPl3skPL9ndvL8D95
         VJFemBqK0AzUyt4EJKma4HAGQMrK9mFEL2t9WMi4ze4m7jCKTEYFbPx9m/dUrekkFJcu
         R2QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771273162; x=1771877962;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=p9GwxEw6MSCg9oWHFrNUkW5VtcIdCqzBst6/spWlTtU=;
        b=eAXNgowBPAV4MMSCIZwYmYjpuH7muXO1o/hard9ealbw+j7F64NA7uWuT/FY4MmTwr
         8tN8fk41MQr9YlLHX4r+oAoHj9M5qa5VdjjN/VG3Zj3PDMmElhdcoX/AOjyjA3c9KUht
         0kNz6Cvm3e5pV9nJuVWo1unbrM0oI1mvcPQ2hwnIPat7JMM8GrLCMN3DHN8eshVzwwKE
         8u6lWjdKWCFeEQTEKGbEvOLQ0ViAuR44pFlR+xKJctwbAV12ASIv3GJY2moZNvzjioIA
         nnLRDefvul3MRfeZzgFi7wMtSsmatp3kxwtUanMe5VuyhkuPhNZY/0cTwRx7QAQWBTC0
         h5NQ==
X-Gm-Message-State: AOJu0YwkxUuM6Yt9kMETtsHNvDZEnt6qI5XGX+x+t6g+Nm6i6s50vusF
	K8ogLojQcafJdNbdFsAFIMIAwgK6gAIX2OwTH0Fn3TcqEHKMQfM1Kbgn
X-Gm-Gg: AZuq6aI5zVBIEPScYl9rIcM+5LXQ5aIzWM6VMtFlAlD3tQ+tWzss2jNuJ9Ri8R36+3v
	CypFF+4GUYajgObkAj1ZDUDQ0S3uZQ6dCUxPHxmf+yqPBvHq+K1/qd2E9+V6MXROR3CTBOsq8y4
	yaM8gIJ8nH71ncfTsQlzTNxMJ1e4AITjsFVqP4tjQaIgqkVBZIgTdgkBTzCkdKImhVslPyp0JyB
	+RJ4PGPBkUr0PTPEPntT+GHqBlYYq9JOXRtt6UdGYPdhKOquc75ZbI4GfHvjFpmS8IRsm27TedX
	0M3N9KGvdeC8cf65cMTOvlKgqFIl1oteHtnFDnV+Z/IM0bXXctIgvA7nVICsgp8J9ta4zEWM5Tg
	pCoJqUozGeb8GwMkco5zFsDyoLJVRcfYgGId/yvjLFPX7VdOyWzymRaC+pFCE5sCS7tc5Nj6vwL
	90fpwzAEDIQ4hle8SoC4Ql07E3Q9g1NZ6OOZhpsuBdeTUKuIXuJHU/3aoD9W/wP5WGG6s3gRaQ+
	5yT4e7yGJTMwdVvH+BYSYKtvMDl6YxfrGnrdBDM9ZMcprGUi1/ZFS08LxEB2CYIznF/XKV0oq64
	YR/sSgjl98aR
X-Received: by 2002:a17:907:8688:b0:b8f:a85e:6d3c with SMTP id a640c23a62f3a-b8fc3c468dcmr538308966b.41.1771273162234;
        Mon, 16 Feb 2026 12:19:22 -0800 (PST)
Received: from cs-874966990260-default.europe-west4-a.c.i2f7e30109524dc12-tp.internal (170.212.12.34.bc.googleusercontent.com. [34.12.212.170])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8fc735e4cbsm293498466b.13.2026.02.16.12.19.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 12:19:21 -0800 (PST)
From: Artem Lytkin <iprintercanon@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Artem Lytkin <iprintercanon@gmail.com>
Subject: [PATCH 1/2] staging: most: dim2: check return value of clk_prepare_enable for PLL
Date: Mon, 16 Feb 2026 20:19:20 +0000
Message-ID: <20260216201921.1788-2-iprintercanon@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260216201921.1788-1-iprintercanon@gmail.com>
References: <20260216201921.1788-1-iprintercanon@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The return value of clk_prepare_enable() for the PLL clock is not
checked, while the same call for the MLB clock is properly checked
earlier in the function. If clk_prepare_enable() fails, the driver
continues without the PLL clock enabled, leading to undefined
hardware behavior.

Add the missing error check and disable the MLB clock on failure to
keep the cleanup consistent with the rest of the function.

Signed-off-by: Artem Lytkin <iprintercanon@gmail.com>
---
 drivers/staging/most/dim2/dim2.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/most/dim2/dim2.c b/drivers/staging/most/dim2/dim2.c
index dad2abe6c..1f07c37df 100644
--- a/drivers/staging/most/dim2/dim2.c
+++ b/drivers/staging/most/dim2/dim2.c
@@ -944,7 +944,12 @@ static int fsl_mx6_enable(struct platform_device *pdev)
 		}
 
 		writel(0x888, dev->io_base + 0x38);
-		clk_prepare_enable(dev->clk_pll);
+		ret = clk_prepare_enable(dev->clk_pll);
+		if (ret) {
+			dev_err(&pdev->dev, "failed to enable pll clock\n");
+			clk_disable_unprepare(dev->clk);
+			return ret;
+		}
 	}
 
 	return 0;
-- 
2.43.0

