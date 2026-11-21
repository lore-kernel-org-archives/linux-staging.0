Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795267971;
	b=nfLDjizufXqAVeXWE7VoQda8GCmHnJDsg0kjCK/RczfaM0L5Ee58TH1IxBmngtAzxJmU
	 hI29rZWCMw54bzDWTz1MCL+OaM2i6jeokxsYIhodDsxchkbLONJHZaTQo/tDm8c5dKXBd
	 DV58u+m6kac43RVQXwp0b+2R4tEjUZynY42YyJ6/pDq7HMcST0IEBgKjYO3FVWMljoLQh
	 k9qsgOSkLY/pKgL1uxe5xPldPAojdkOMOA8TjEN7Nv6T4S2hBxUKFNLfE2iMB1ibu+8NF
	 UdtnSA5JEeXNn5cfq50/oNj1QfpIfuclWIyKiqlJdTxjyghnff2v4IrPNHeviQ/cxqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795267971;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=eKfSFsRRzq0LJey3f3z0sDE1jUJc6EIjO9xhjcKZVJU=;
	b=qoR43PXW8rtUc8CkBarHnn/5pbxJm4cl4vBtdOoCXG3lmw6RlvjqJzo8mLpQ826BlfUN
	 6gx3YkWSDnzMUJ+OhkRURAAinFNU+/KsxyYRUfd+4j8ByC3rx7ce/OqvOfZCQDI65yJ6p
	 o1uFnhSs+Ep6ehiewgmEXnkdvxTDwYNkNdvVIPS7INJZbfB7pGuyrcLzDtyc/MMwOO6d6
	 2R/i1hKz33tUrvrf6WWJhZa2lEhMZrd5KLXuWCARvOlyYrgJXtk0vhItZWYDmMY6V/miz
	 Ikkl8BbyivI7u2OobN6fftBiw8zVCJlVtUglwld2hdQvCXnagsvY4COcsI8XXc+R8kw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=g8s+NpHc;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEC7C606A330
	for <linux-staging@lists.linux.dev>; Sat, 21 Nov 2026 13:32:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AEC7C606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=g8s+NpHc
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a207b02a2cso12952425e9.1
        for <linux-staging@lists.linux.dev>; Sat, 21 Nov 2026 05:32:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795267969; x=1795872769; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eKfSFsRRzq0LJey3f3z0sDE1jUJc6EIjO9xhjcKZVJU=;
        b=g8s+NpHcZM73KSTzD3YkLn+3ydFzpdb1nCtl5Yyj48NJ6YHjuoAxmAJTEAjfibG53d
         xObehOf5zNXLDzkGEGab347PYbrh8nywu6JVCwnEaAhlD+XkEazYaRnMmmFNhYCTps0u
         qG1FwVUKVSyizUbnErv9zRA+yrmEwpsfrur2xUd2nTyhunb4z1t/PCK7wYaX6UW4vrbL
         QCfV4eu4pQxhCRVAGEOslwt2bNpYEkF7v6m+uUPeyVEcLwmEUodeY1TYF2zby0plVS9B
         z2BldYLq3vgF3rI2gUiEiyuQnCIZ5cCp4L1cM727YATjd6B9U4f2zxGNt71Zl9EDmYd/
         zygQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795267969; x=1795872769;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eKfSFsRRzq0LJey3f3z0sDE1jUJc6EIjO9xhjcKZVJU=;
        b=tn0nPE95Y+2B+U4LCco7y3hA0F8mqTBM4LU/p7B69D3sKm7jAkUPAXphsaJYZIZsEv
         TAD7G1tMXL8VmBfiskf/JLULsJKphocJMVZ6jD6/jn390xiL9WhumxInj18Aq0tzgLF4
         iIzlJHVDehrhW75ufFcTDk4I9k9Es7RNrsi4QHJQolX6p10fbvVgKRBTt/4JWWy8LsP3
         ywC+xYNcMzVWnZP/scfCLLez/aTI4o+MS5gTJuLiydSNky7QQKckYEmAfYLQWTyCSRWo
         3qDYyUzLhHuT5TtK6DTGc6G7IvZY9AH8I4Sl8LNA/w0LhqT+IaWYJKEIFHy4dRYMoLE5
         kFDQ==
X-Forwarded-Encrypted: i=1; AL+hErEE1bmz51XhAdXibQvoC/hb9hen7lYqrFmcUkIuWB+bD2XOYrN5F115zJ933mmegg091vlr0ubBnBwHoLuP@lists.linux.dev
X-Gm-Message-State: APuU4Z+Nig3Qkt3HtLSI+nLQoMpEd5Z8arVceeANw620Q5sGOk+dmD1R
	8fcOKjBr2aVQiq0xzV9kE5YBjKskYthwHA48AXjlbF7Xyvc0jQyAaDqM
X-Gm-Gg: AZFdTZe4bXsxAtYdm+NcU/0aN1eRroLwagbt3InoAL3PNvGO9fBUTFkIqHnghxwzPQh
	cP15M/HNLi0+YpoirdxCDw9ky+2XvNKVT3pHlXva6UzQl9dNP7eU5U/SVQ8fl88Siodn2nAjYlc
	8Bl7i5G5UySSE6iW4xjFFYudu3NzLH82HHvqrMbvdM2z8Mi+pl11j0jDfXVxDBjjd07ELF40Mgq
	azFpyQRweRGhlQZiXUAys4380B+UDZUyZQRdtdVGyiOg6qY8oMUigrltHuMx5UcU6Zx6sB4qGzW
	rgGWrm8pXbQmU82R9zu3IQeXC8WXhu9Ie8+ueNe9ZmJiEFbPvHLwBb+27hIGBbuZYFrrzWgPNhf
	9ldE93ri7acL9c62IEWesR1oE5kFIAwp/e3DjVWOHcl2i6hmRmfJhlrYs4osRwtaYw24qnxkusj
	IGBTvRfKXVqf9MGfRK49ed/YlZhuGghjGhJLjT8MhXO8XxuvReSdBh6iyH6yONJ4k1K4GAUYTYh
	+eg/iRNBIj+j+j8kDKlpqOrXaP2bq+bF/cmAwwiI9/jIQnTVICpJ65BjG+tVmxrZD0volEHgvbG
	3GcmSZdeljDpGzh+jpLPCCTUv4dwl36eDSCPuXzf170F+yTwpwcbHwyS7aiWJM1Px2RVX5yYY3C
	ZcPml7H1aKYcS
X-Received: by 2002:a05:600c:c09b:b0:4bb:665f:7e52 with SMTP id 5b1f17b1804b1-4bb8880995dmr101433245e9.10.1795267969099;
        Sat, 21 Nov 2026 05:32:49 -0800 (PST)
Received: from 1Z10 ([2a02:b123:8010:295a:cf7a:d53b:95ce:c0e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb90660cb4sm83345955e9.2.2026.11.21.05.32.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 05:32:48 -0800 (PST)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: linux-media@vger.kernel.org
Cc: Maurizio Casciano <mauriziocasciano7@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Nicholas Roth <nicholas@rothemail.net>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Bingbu Cao <bingbu.cao@amd.com>,
	Dan Scally <dan.scally@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH v11 01/14] media: v4l2-core: Preserve existing subdevice nodes on rollback
Date: Sat, 21 Nov 2026 14:31:31 +0100
Message-ID: <48240d57d86e78cce814822360c1b22cea80268b.1795267528.git.mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1795267528.git.mauriziocasciano7@gmail.com>
References: <cover.1795267528.git.mauriziocasciano7@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Subdevice node registration skips nodes which already exist. On failure,
however, it walks the subdevice list from the beginning and unregisters
nodes regardless of whether the current call created them. On AtomISP
this can remove the camera sensor nodes when a lens rebind fails.

Keep a list of the video devices registered by this call and unregister
only those devices on failure. Record each device before creating its
media interface link so a failure in that step rolls back the new node
as well. Calls with no missing nodes need no bookkeeping allocation.

Codex drafted the change and tested allocation, registration and
media-link failure using the registration helper with mocked operations.

Fixes: db0f4691d974 ("[media] v4l: Allow calling v4l2_device_register_subdev_nodes() multiple times")
Signed-off-by: Maurizio Casciano <mauriziocasciano7@gmail.com>
---
 drivers/media/v4l2-core/v4l2-device.c | 26 ++++++++++++++++++++------
 include/media/v4l2-device.h           |  3 +++
 2 files changed, 23 insertions(+), 6 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-device.c b/drivers/media/v4l2-core/v4l2-device.c
index b4036105c..8cfca95ce 100644
--- a/drivers/media/v4l2-core/v4l2-device.c
+++ b/drivers/media/v4l2-core/v4l2-device.c
@@ -191,10 +191,23 @@ static void v4l2_device_release_subdev_node(struct video_device *vdev)
 int __v4l2_device_register_subdev_nodes(struct v4l2_device *v4l2_dev,
 					bool read_only)
 {
+	unsigned int count = 0, registered = 0;
+	struct video_device **new_nodes;
 	struct video_device *vdev;
 	struct v4l2_subdev *sd;
 	int err;
 
+	list_for_each_entry(sd, &v4l2_dev->subdevs, list)
+		if ((sd->flags & V4L2_SUBDEV_FL_HAS_DEVNODE) && !sd->devnode)
+			count++;
+
+	if (!count)
+		return 0;
+
+	new_nodes = kcalloc(count, sizeof(*new_nodes), GFP_KERNEL);
+	if (!new_nodes)
+		return -ENOMEM;
+
 	/* Register a device node for every subdev marked with the
 	 * V4L2_SUBDEV_FL_HAS_DEVNODE flag.
 	 */
@@ -228,6 +241,7 @@ int __v4l2_device_register_subdev_nodes(struct v4l2_device *v4l2_dev,
 			kfree(vdev);
 			goto clean_up;
 		}
+		new_nodes[registered++] = vdev;
 #if defined(CONFIG_MEDIA_CONTROLLER)
 		sd->entity.info.dev.major = VIDEO_MAJOR;
 		sd->entity.info.dev.minor = vdev->minor;
@@ -247,15 +261,15 @@ int __v4l2_device_register_subdev_nodes(struct v4l2_device *v4l2_dev,
 		}
 #endif
 	}
-	return 0;
+	err = 0;
+	goto out;
 
 clean_up:
-	list_for_each_entry(sd, &v4l2_dev->subdevs, list) {
-		if (!sd->devnode)
-			break;
-		video_unregister_device(sd->devnode);
-	}
+	while (registered)
+		video_unregister_device(new_nodes[--registered]);
 
+out:
+	kfree(new_nodes);
 	return err;
 }
 EXPORT_SYMBOL_GPL(__v4l2_device_register_subdev_nodes);
diff --git a/include/media/v4l2-device.h b/include/media/v4l2-device.h
index 25f69b1b8..6d8834d40 100644
--- a/include/media/v4l2-device.h
+++ b/include/media/v4l2-device.h
@@ -183,6 +183,9 @@ void v4l2_device_unregister_subdev(struct v4l2_subdev *sd);
  * @read_only: subdevices read-only flag. True to register the subdevices
  *	device nodes in read-only mode, false to allow full access to the
  *	subdevice userspace API.
+ *
+ * Existing nodes are kept even if registration of a new node fails.
+ * The caller must serialize this operation with changes to the subdevice list.
  */
 int __must_check
 __v4l2_device_register_subdev_nodes(struct v4l2_device *v4l2_dev,
-- 
2.53.0


