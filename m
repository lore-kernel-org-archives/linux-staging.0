Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8854063C1
	for <linux-staging@lists.linux.dev>; Sat, 23 Dec 2023 06:04:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XPITnV87"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-6d99dd7de0fso134393b3a.0
        for <linux-staging@lists.linux.dev>; Fri, 22 Dec 2023 22:04:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703311472; x=1703916272; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FXkJe47tIZ6CS0rCi+p/41rd9M+SnrlGZxxaIAMxpHI=;
        b=XPITnV87hJrXw62G6BvBYdSJz4iSayVPD8qxKvx+2FEwaX2dUPrq2DDvEVkVhlj0C5
         shU9wodf+YV6u0XuX+1XiYmf3vYcgXkYSS0OJ/NFrKOhcmgx1RqdgKGXWRCRHgBu+QoT
         j/i7iF9fwpe3/b1W1Y13j7kOpY3amkGzOcSXop7QALxXODrQ8HdNGJJSUgcHf08BV0uA
         kZSPpfvcG1jzjFXj+8q8jvr/yDQJT4vLVvvBHHxfZefkfUYPWzhvhpxIsUGbhcEei8st
         I1Rg/3+Zzn2JuD5h0twa1NA6AGUwzngWt9/HRRo1IB+L893HugwkyVDpKnXZE9fcdzXt
         s5ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703311472; x=1703916272;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FXkJe47tIZ6CS0rCi+p/41rd9M+SnrlGZxxaIAMxpHI=;
        b=Y5te9SyrnlZFkT+lSwnBYoT4Ofz2h9G26ytr3fXNy7xBsh4uKIkf4JaRTVAfRi3KRN
         LwJL74R8FCkI8tyxIL+c0QaleGgsVzEBvnW0QpGSQTOo2URgghEOZnEUNX6+SDm8ydrw
         f90Ltm8ViLfTGr9vmUAc4WYfDHN2fdxTuydUCZuL5Z+6pCIK2OQaKTCgF9mLyH0H/9Zx
         hztBWxy9+QsoQPb7L+m4G+oMRf94W+kcTIjXwijw4ZsIpVUk9N8ZHyLaECBASyeCDvfu
         ZlyZD/ZJjxDx6NvWtHOT6fwoOidRVGNTUDEmmubU3zT72Oqc2A96R8+2VAJ9nm4KkWnY
         F9wQ==
X-Gm-Message-State: AOJu0YyXKHrSx/3RYbLAgtS8+OPDdVq77e6iO7vPMwMyBQYD6YK+8+0k
	JSm4ViZwlhe3fLMM3xdzI2I=
X-Google-Smtp-Source: AGHT+IHOyCwfs7Vf2ci1UdE0M1SAzA3hPLcfvCDSsqlTXNEfg/W3ZBqqM/SLwNDrMh5AOSpPF80Png==
X-Received: by 2002:a05:6a20:4e11:b0:195:79a:a29c with SMTP id gk17-20020a056a204e1100b00195079aa29cmr1354700pzb.96.1703311471697;
        Fri, 22 Dec 2023 22:04:31 -0800 (PST)
Received: from localhost.localdomain ([2400:1a00:b060:2b26:f462:e3d9:c28:4c99])
        by smtp.gmail.com with ESMTPSA id g22-20020a170902869600b001cca8a01e68sm4335750plo.278.2023.12.22.22.04.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Dec 2023 22:04:31 -0800 (PST)
From: Dipendra Khadka <kdipendra88@gmail.com>
To: hdegoede@redhat.com,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	gregkh@linuxfoundation.org,
	hpa@redhat.com
Cc: Dipendra Khadka <kdipendra88@gmail.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: [PATCH] staging: media/atomisp/pci/base/circbuf/src: Fix spelling mistakes in circbuf.c
Date: Sat, 23 Dec 2023 11:49:22 +0545
Message-Id: <20231223060422.77789-1-kdipendra88@gmail.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

codespell reported following spelling mistakes
in circbuf.c as below:

'''
./circbuf.c:27: whehter ==> whether
./circbuf.c:132: offest ==> offset
'''
This patch fixes these spelling mistakes.

Signed-off-by: Dipendra Khadka <kdipendra88@gmail.com>
---
 drivers/staging/media/atomisp/pci/base/circbuf/src/circbuf.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/base/circbuf/src/circbuf.c b/drivers/staging/media/atomisp/pci/base/circbuf/src/circbuf.c
index d9f7c143794d..2f484ef9d4b5 100644
--- a/drivers/staging/media/atomisp/pci/base/circbuf/src/circbuf.c
+++ b/drivers/staging/media/atomisp/pci/base/circbuf/src/circbuf.c
@@ -24,7 +24,7 @@
  **********************************************************************/
 /*
  * @brief Read the oldest element from the circular buffer.
- * Read the oldest element WITHOUT checking whehter the
+ * Read the oldest element WITHOUT checking whether the
  * circular buffer is empty or not. The oldest element is
  * also removed out from the circular buffer.
  *
@@ -129,7 +129,7 @@ uint32_t ia_css_circbuf_extract(ia_css_circbuf_t *cb, int offset)
 	u32 src_pos;
 	u32 dest_pos;
 
-	/* get the maximum offest */
+	/* get the maximum offset */
 	max_offset = ia_css_circbuf_get_offset(cb, cb->desc->start, cb->desc->end);
 	max_offset--;
 
-- 
2.39.2 (Apple Git-143)

