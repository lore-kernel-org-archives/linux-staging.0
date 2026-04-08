Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 144193B8938
	for <linux-staging@lists.linux.dev>; Wed,  8 Apr 2026 13:46:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775656006; cv=none; b=lWwcF7nhcIZqeF0b4a1o1iXiW8dxJtKMqeP90NfIVFMkm9MPPfS1Bl8cTq82aCu7bhjPIqjQxe77V0/Eya7DBFw7zCuo8d5/TJ2tVVH+uIjp+x2PetfAvGDpM19mPobPfux/8yQZoqFd4lGTt/SPzayi6gb8Bo7kV049ZraWazU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775656006; c=relaxed/simple;
	bh=jl7Cuyt34o0NcWX8WaIo6AQwpEqbpJ4o5N6K1DX5ndI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=A2DRp02lpvVHppEl0yPlbYuJZ4KuLFRA1nJeEDAMjb1QP96xLgxgOEaguxvl9rOcOi+nKh13s/8HiB17JLSrOhGfPx9yhr1Z5chh3HAGGNd1A0g0XzUXm6yR7J+h4jfJpZY6d8cW3vZmvmES0HWbj9RFpDJLkFgpl7i/85QDSKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RLShqITN; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RLShqITN"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b932fe2e1a7so838935466b.1
        for <linux-staging@lists.linux.dev>; Wed, 08 Apr 2026 06:46:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775656003; x=1776260803; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DUmfkfwX20TMwPCgedZQDhcOhsvVso9IX2Cpow+Wj6Q=;
        b=RLShqITNC8MdNLQDkcWduMv9gQDSZ07mBb96kkcTw7ohoY8Gx1WhFSataQ7N0ebqcV
         drUGF77Na5rFeGVe5iEMTaTbbgEVfp/VF9YeCw04imythj8ANOwKqTD9lq/TszpEgqgW
         QSmMuNQvh+4gw4X/FS+wcEn3+mWYhm+jiE35j6CgVypwVX9c8WbYPd7WZ2mBqqZQeRyy
         YUlOC1UZuG00HP3tiNJkVuz1a31ccdRTezC468v4hkvpI2DXdvnfR4YoGGCScDrcssZr
         JRESLxUvmfihsSu6MeCWxi/4Qr1rdWgiFeaZGaw6IptMBWXa+8e3wpF6HDCG5Ttfjvgl
         ynoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775656003; x=1776260803;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DUmfkfwX20TMwPCgedZQDhcOhsvVso9IX2Cpow+Wj6Q=;
        b=fGVoqb4cVo7OROct5fPfRmted6pCVeuDckeX91cDvkHrG5bjqsnaBKlXyheo6RuZ9q
         TuGR7xESjNM8hdeosElca5PeFddsgH5H1Fj/jMxGzy4WTEwqlhyGWbzVPO11IyMJTMAX
         3KJXsbicREEvYK+hCxVkTB/mcC0+xPda4EOzlfolo24jggC4oWasV3SzinOjfKz6Ml5X
         6tecPfTvvCdcrF4UJ3/+tpj8T93ucCo/1F5AbEucV3wlttBA7ibW3JojzzJDR60uRD9H
         wqUnqwE3t+ky/7Cd9Kppmhz0GJAA6yB30V9F3F/4zUZS7esFW6rv3Vx121vZ8pGQJEES
         zNug==
X-Forwarded-Encrypted: i=1; AJvYcCXa6i80fSQavW3IMR6+Oh5WcmkEqwpiazoCJ3bFoj+wII6Kp77mXcVJtNxd/aRkiS/psod/6cZonIpX/UlO@lists.linux.dev
X-Gm-Message-State: AOJu0YzleIieZvKK12T1UiEpWedEC3I1rh+QlJAt4Idxnn2+Jc26MCf5
	rIjIPhkXm6z9tqInktha4pwW8ocWFdcdvvu/blaflvwo8fHlQ8FNFLEi
X-Gm-Gg: AeBDievCtwWpW7T0fdlUPb2XGFyi8PwshEE+J32bXso/5jMIOOFEIGM86ghZx98Jabh
	Y4d5D7+cVubxzSHQMvOVCFx0cCTvySnR2YT638br3jScHoEcSPv7LfNRjWGAp2Bbks0nwgV8EH9
	mBXF9toj7i3R4+8Foyhz2kL1lOjlNbyRYAaosF7x443j4o9EST9ZXzB2W2mTQoEu9pyIcaEwge4
	UEc/j/T1Tq8/EXrec0tQs9fjhChMmVjwTDCdz3GiqrK0ZAytljJ//GPtmIv3ZHSiR0+4krkY0GB
	eMs69N7S6Wr8lrJoM/FIS+6lotntDOJhZWDhMIhvwM+KEVZ4kR1+4JsjGgg7DxYwTNVgNf+3Qrh
	knpKoLxRXAfGxeS3NmtyKmCoTLUmrtsyhKoqsXJtIJZWZYQGLwDfLT3F/wWUq4uRl5uhPLX4P/P
	vMGfgKgImeEhQ6ZhW5TZMfPHdMJ/tpjF5OqFbVUZ8/gvURkCI1FADEsV3HSmBh1IrqEvuGEmc6L
	0TORlOzTsSgQR56mJtd1yFh7sdU8S4uGRP+aunU97uSffQWsCgv4Mop/h4fOj1LtxNHH+C6Ud7R
	b71TSbRk+MVZluju60eZMnxTi8+7HmHxXcErkS+m8IO8GrRdSiGwz6VS8TqJn063076vnya/4BU
	PCPnYhWcMVCHLHDSb
X-Received: by 2002:a17:907:7201:b0:b9c:8499:e949 with SMTP id a640c23a62f3a-b9c8499f038mr1014745166b.27.1775656002939;
        Wed, 08 Apr 2026 06:46:42 -0700 (PDT)
Received: from cs-280612103108-default.europe-west4-b.c.od237066db22328bb-tp.internal (52.200.204.35.bc.googleusercontent.com. [35.204.200.52])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c3d028955sm648787566b.61.2026.04.08.06.46.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2026 06:46:42 -0700 (PDT)
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: andriy.shevchenko@intel.com
Cc: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Joshua Crofts <joshua.crofts1@gmail.com>
Subject: [RFC] media: atomisp: change copy_from_compatible to iov_iter
Date: Wed,  8 Apr 2026 13:46:11 +0000
Message-ID: <20260408134612.1380-1-joshua.crofts1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <adUeywfiQzZ5JgEd@ashevche-desk.local>
References: <adUeywfiQzZ5JgEd@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since the atomisp driver concerns transferring video
data, it would probably be better to use an iov_iter
than copy_to_user calls (scatter-gather i/o and better
pointer safety). Per yesterday's emails, I'm sending an
an example of a function in atomisp_cmd.c where I've
implemented iov_iter usage.

Note, this isn't a patch, more of a question whether this
style of changing the copy_to_user calls is valid (or if
I'm writing garbage code). I'd rather get your opinion
than submitting a patch first.

Thanks for your response!

Signed-off-by: Joshua Crofts <joshua.crofts1@gmail.com>
---
 drivers/staging/media/atomisp/pci/atomisp_cmd.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index b3e971be0e..3b987e8e8c 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -15,6 +15,7 @@
 #include <linux/kfifo.h>
 #include <linux/pm_runtime.h>
 #include <linux/timer.h>
+#include <linux/uio.h>
 
 #include <asm/iosf_mbi.h>
 
@@ -1676,7 +1677,8 @@ int atomisp_3a_stat(struct atomisp_sub_device *asd, int flag,
 {
 	struct atomisp_device *isp = asd->isp;
 	struct atomisp_s3a_buf *s3a_buf;
-	unsigned long ret;
+	struct iov_iter iter;
+	int ret;
 
 	if (flag != 0)
 		return -EINVAL;
@@ -1709,13 +1711,12 @@ int atomisp_3a_stat(struct atomisp_sub_device *asd, int flag,
 	config->exp_id = s3a_buf->s3a_data->exp_id;
 	config->isp_config_id = s3a_buf->s3a_data->isp_config_id;
 
-	ret = copy_to_user(config->data, asd->params.s3a_user_stat->data,
-			   asd->params.s3a_output_bytes);
-	if (ret) {
-		dev_err(isp->dev, "copy to user failed: copied %lu bytes\n",
-			ret);
+	ret = import_ubuf(ITER_DEST, (void __user *)config->data, asd->params.s3a_output_bytes, &iter);
+	if (ret)
+		return ret;
+
+	if (copy_to_iter(asd->params.s3a_user_stat->data, asd->params.s3a_output_bytes, &iter) != asd->params.s3a_output_bytes)
 		return -EFAULT;
-	}
 
 	/* Move to free buffer list */
 	list_del_init(&s3a_buf->list);
-- 
2.47.3

