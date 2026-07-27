Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46DF03F4DF8
	for <linux-staging@lists.linux.dev>; Mon, 27 Jul 2026 11:22:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785151371; cv=none; b=OcuC3e+yWA4Y7stZggOz4lzvo5cpB3AmsBttJr/ZkPbUGwjdH3eKDbVRYPfmyoWFcW5I13gyyfddS/zHD2DjsuMM10mwYivJh6eLBt3HPXKuqFYD0A9IGHMbC48J6km8aFc2aWKIhcmg2JoiasxO7Tk+udytXxb/3dgEWAoYznE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785151371; c=relaxed/simple;
	bh=GvGPNpCEnQDfHxHOcxa+Ci3ycUkDkZuGgKa+12rrbsA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=VaP40UbV2mKuf1n2jAIQ8/tNeey9Y0JYz/dCHTQJ/AThVoRtkIzWgfU+ckxnuGM5Jb3GRnZxQqJ7lZAPB7yPdA1GaQvCNqXQXY+ppq7JxZD0uvvGnT/YoDd2X1mdRKoakXJ7lbInCaqyxTjpeQiGuGNpmiy24ceNyMDLIznfHq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=knYps2GS; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="knYps2GS"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2cca0c5799eso23158995ad.0
        for <linux-staging@lists.linux.dev>; Mon, 27 Jul 2026 04:22:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785151370; x=1785756170; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=k5E1s8oCcP+GEyqdmRlB9Q75yjWLw8arRgBTU8DpxFM=;
        b=knYps2GSi4FazhGhWnQIrF7EILy41ZgwHb1QB08hKOhRFmxVhs08EGv1Pwb8KVrsH0
         O1sgZEWFBz/e4uhaF0W6Sn9wWaWwOiUYOAVYXA1tPyh7UZkcbxkkaMVUsOxown65ipo0
         vnV9IdUcIJK37JGYGJA5TY03p+es/qLPqOk9qaPWY4tC6NxoGMpYEDQoZuwSDvtU5c7q
         HMB5sIH9O0gS4+w5f98OsIfYynrNPM82AaltDCxvKwfWvdBfuU5P2b6y+3vp4Zj3WbDr
         tqfrkpKYiTzaP1SQ0W27vhdCkk0VeHThXQBZseHvb9tz3AMmLg3IZfifzCfbLNvTKJi5
         7oyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785151370; x=1785756170;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k5E1s8oCcP+GEyqdmRlB9Q75yjWLw8arRgBTU8DpxFM=;
        b=kPUSsU5K6UxOrYk6qp0LwDSoSNxz6LZFO+r0fWfyueHVFL0OAmrm5UVN1Du2XLt9fr
         3Y4Vywm/9NjlbX28isN5csBdqBJXU1QW2Vv8g6mjDERcJv0kqOvTguXmlhfgAMSdKaD2
         W3FG88/0eKQEyD7jiPeesOM4PEW2hRMXBE4DFCjci+jz3nvEjHsJ6e6GVKw2ms8F+7Va
         pK3sDJM1cBy7A+3ZXov4AZBwkqcOZyan1RVWaa4I6E3TNn5yf6crOfglj5+xkeMuokZt
         RE9aB9fUxBBrJkCcxhaGLiSNN7n67u8rArCKFO2BXs/T2G2hQpr2RqNwKsMpHrbDUX/c
         hIzw==
X-Forwarded-Encrypted: i=1; AHgh+RrcCGIvZBEUS32vhIQ3hdw24LRBTJkv933jLyeaVBircAqLzbd9LPXIqjUyO6wCqffactwwKhZ4axnSBNrR@lists.linux.dev
X-Gm-Message-State: AOJu0YzxpPb6jYxIlPyMFgvovrWcCnffjCMhHoRpZkN+EunuXbsVki1L
	bSFncOMxjESgwUmiNh+lo9N4PqMcgWgXekAUVKxIerz4g1x80epUVsLz
X-Gm-Gg: AR+sD11Sjb2MOaoUcBexM3CXmL4r5R1nTgre7rX1AsSPcj/Rwi7rITQLeRoaLzi/lB7
	KDxB/qswPQMHs8C9v/YQaKlHZPc51GLNaETqTfhjOzAWvv/KZd4Y7qD1jCxKqHV+vGprpxO9W+5
	fMLE4/8qXaDwgNWLegD5vgfIien0XrRlazh2tr4Tn6/rkSAjJdnJfLaxiMi/pz2KFVz+a1qJijK
	jvcWQV9vuCS6X0xsY+11ZMA/fzpCJm4AwxjqaTRwije8ibCiHf14J6r31tmJTgmEMMQYA1Ebk8a
	nSZ8pAmSNB4LP+H43p86J8prh3djTC21PH2hF6nAhKbAMmfcyheewO2Ra5NvJSqGxEQex8N6kO9
	8jCAAMvFv8WJkk6UFcbzXs3OVl9rthDa3XDp1h9whJoWuDziW9raWQgHAZN4yh4Ho8pTIMJGoww
	nPL+ucXtND/p8XGq5HB8o=
X-Received: by 2002:a17:902:ea0e:b0:2cf:ca89:499d with SMTP id d9443c01a7336-2cfde6880fdmr74010545ad.7.1785151369490;
        Mon, 27 Jul 2026 04:22:49 -0700 (PDT)
Received: from SGN-LDSENG.tasernet.com ([2405:4800:5cc3:11a:1ac0:4dff:fe8b:4a69])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde5e3e0asm32938925ad.29.2026.07.27.04.22.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 04:22:48 -0700 (PDT)
From: Cong Nguyen <congnt264@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Hans Verkuil <hverkuil@kernel.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Cong Nguyen <congnt264@gmail.com>
Subject: [PATCH] media: staging/ipu7: fix async notifier leak on init error
Date: Mon, 27 Jul 2026 18:22:39 +0700
Message-Id: <20260727112239.812159-1-congnt264@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

isys_notifier_init() initialises a v4l2 async notifier and then, for
each CSI-2 port, adds a remote sensor subdev to the notifier's
waiting_list via v4l2_async_nf_add_fwnode_remote(), which allocates a
sensor_async_sd descriptor and takes a fwnode reference.

If parsing or adding a later port fails, the code jumps to the
"err_parse" label, which only drops the current endpoint fwnode
reference and returns, without calling v4l2_async_nf_cleanup(). Any
descriptors already added to the notifier for earlier ports are
therefore leaked, and the caller's error path does not clean up the
notifier either.

Call v4l2_async_nf_cleanup() on the error path, matching the cleanup
already performed when v4l2_async_nf_register() fails. This is safe as
the notifier is always initialised before the loop is entered.

Fixes: a516d36bdc3d ("media: staging/ipu7: add IPU7 input system device driver")
Signed-off-by: Cong Nguyen <congnt264@gmail.com>
---
 drivers/staging/media/ipu7/ipu7-isys.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/media/ipu7/ipu7-isys.c b/drivers/staging/media/ipu7/ipu7-isys.c
index cb2f49f3e0fa..c626de051898 100644
--- a/drivers/staging/media/ipu7/ipu7-isys.c
+++ b/drivers/staging/media/ipu7/ipu7-isys.c
@@ -233,6 +233,7 @@ static int isys_notifier_init(struct ipu7_isys *isys)
 
 err_parse:
 		fwnode_handle_put(ep);
+		v4l2_async_nf_cleanup(&isys->notifier);
 		return ret;
 	}
 
-- 
2.25.1

