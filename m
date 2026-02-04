Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A7024279F4
	for <linux-staging@lists.linux.dev>; Wed,  4 Feb 2026 18:30:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770229843; cv=none; b=nzBZdgv5Wj5naBNCIe8ByXEHEj4VO9WtwsljC/TBJrb25/3iOQWlYmm6urNiNudzP6FgtUdP/OcxFRwQrzlDmi5vF4LhMoNjFDmezQLy/Ku/iSLbF16W4T8UvHHojkwwlpiyAvMoqxAXc7YjxqI2XHOc7PzUBxKPXS2aBofhNqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770229843; c=relaxed/simple;
	bh=xqjIFjLGGcb2nJJbzBZ/EDULYzAfIBFLwV3v0AO3iqI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tmY2ZJydsMzxs534GRnqGJ7JcizwaM7G9Syp/tStOM8Qe4F/P4fxg0KbtaegB801wxg52/M8SOGW549MBJHaO2THpGp6/y9smb+vV6Ywozc8y2oQi4sVGi1HOFJud7n58ued9DRAHIGE+U3wuirOsmi7rge33dKoe5LeEAUKzKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RuSLxfKG; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RuSLxfKG"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2a7bceb6cd0so180085ad.1
        for <linux-staging@lists.linux.dev>; Wed, 04 Feb 2026 10:30:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770229843; x=1770834643; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=N53mYQTvGj22FFA5zL3jaPnz1QUNn9+TPZEocHexi98=;
        b=RuSLxfKGbMQ8Wbkc4VdgZMp47/5ObktrnT2BlGJW7YC3FjmBi2eN276WjO5Rx2FtgK
         zpZVG/Z5AHksJu1JnQ5R0S1bL/41R/ks2Cr4wDJVRSoCyJrQTVx74Dgk3h6/yZA+4gG7
         iybJzDduOxwlpx9sW2ZVdHqPYOmxoh+iilc7r9aAugcVDig4HRFA9gGCBElJqn5eRuPS
         t6CkVEuHLureLWup6J+X4hTNSfEG7M9x1m7hrQFUdxW0+zB6uJLgU03xdAR+0khhWrnT
         a5RLALRUPVhtaRp950zXs8JokZSpYWQ7ZQYyGX6AmGRlMdoCy90yInWwJXegKbykvHWQ
         Hk3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770229843; x=1770834643;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N53mYQTvGj22FFA5zL3jaPnz1QUNn9+TPZEocHexi98=;
        b=S+N5SrJHHuiycOYjyzNIuCV5UyWwQQwFxz5GCzijtgMBxD2LWTutogr4mWCDe4jUTm
         Ks0RsmyfvqmlLuu+AMbqpzI8fiQbFzwuwcxxuQ1JGMtbwuJhpToj+7yvBHG17cn++QIc
         3hr/Lb1hYmrVp1rOi1Bxvt+iUyF3G+rxm6ZXhjipWQdC05pYDszsO8MTV/mTUvBBh9Lc
         Ih2nFUHzoUt1n3jKBgwOl0oSVcHsHI8tIrRYJhwBAa/jtPbL7faP1VcuePX//VrPbwmu
         2bKWmsNPOy1x4/wTk9GB9uek+2eZRi7gWmp4QITQwT9uYlEg3NO4AjHkI4VVj8VljBTU
         kerw==
X-Forwarded-Encrypted: i=1; AJvYcCU77Xpoilveri7zS574pW03AP3jZkRfYPwaLlbSYgke1wy7+PDSH9jE0rXltOJaNYCdxHPMfvtyEF9nEdv5@lists.linux.dev
X-Gm-Message-State: AOJu0YyoXhQ20eKWHP/dJGYsIDrSweL1N05zSlQssLDK0zLXEi3pgSr1
	cEYgrkOKNn07CsKYNZB66ee2LMlCsvZpQ8kbBWBVfOebi4FiUPKrvC+l
X-Gm-Gg: AZuq6aJyEIICVMO54NtxsAi8hnkwLjk162Z8iaDYJxS35s/uxBgHKt0iyubG/pD3ZOZ
	nLcU4uTX3HClRMAzJFK/GI1J4jT6jpKwZI/DfTvWokzanHARzPn9ijRMfLK46tqf/17J2SdCiej
	YlgHQhOMm+J8XuHTqRjfj44P6et+tWObY5X7bfKktZuckxng/eaVP1Ya45TmS9PdDDlvYbutEoU
	sFLivKp6/iFQWo97TcPrncgnNjCw+SfTsAXmG/I7DZlp52WU3h91Eomq4U3iiLGmJRuSxkdgG5c
	L0RsO84dg1mRmsHZeHQQsSUKuhQcHe7kRB/tSH8LDlf6YXYtEO8r9oddK8tXgbOmby5iDUlnbPx
	4SP2BB71nuseaGI4GI3PvejHWnzZOleJhj/ciJ87eYQ6h9XcjgoNaPwToSJbHvBFhpYKVbp0vTU
	PK0WEU/J0euRtWN39+YpDUoIV4UduK
X-Received: by 2002:a17:903:1b4d:b0:2a9:32c7:92db with SMTP id d9443c01a7336-2a934129193mr45129545ad.61.1770229842449;
        Wed, 04 Feb 2026 10:30:42 -0800 (PST)
Received: from DESKTOP-7ISABPS.localdomain ([223.233.85.111])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a933870b22sm30238005ad.26.2026.02.04.10.30.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Feb 2026 10:30:41 -0800 (PST)
From: Rachit Dhar <rchtdhr@gmail.com>
To: Viresh Kumar <vireshk@kernel.org>
Cc: Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Rachit Dhar <rchtdhr@gmail.com>
Subject: [PATCH v3 2/4] staging: greybus: fixed styling issue in fw-management.c
Date: Wed,  4 Feb 2026 18:30:33 +0000
Message-ID: <20260204183033.182747-1-rchtdhr@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixed a styling issue highlighted by checkpatch.pl.

Signed-off-by: Rachit Dhar <rchtdhr@gmail.com>
---
 drivers/staging/greybus/fw-management.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/greybus/fw-management.c b/drivers/staging/greybus/fw-management.c
index 07a0e6b63cf3..cf917ddb79c4 100644
--- a/drivers/staging/greybus/fw-management.c
+++ b/drivers/staging/greybus/fw-management.c
@@ -434,7 +434,8 @@ static int fw_mgmt_ioctl(struct fw_mgmt *fw_mgmt, unsigned int cmd,
 			return -EFAULT;
 
 		ret = fw_mgmt_load_and_validate_operation(fw_mgmt,
-				intf_load.load_method, intf_load.firmware_tag);
+							  intf_load.load_method,
+							  intf_load.firmware_tag);
 		if (ret)
 			return ret;
 
-- 
2.43.0

