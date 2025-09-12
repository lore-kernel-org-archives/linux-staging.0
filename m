Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17C9A2E336F
	for <linux-staging@lists.linux.dev>; Fri, 12 Sep 2025 10:14:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757672057; cv=none; b=GuJZEMPqfAm5B/uXI0v/7IrqI+raaXcHu2KqZnDgSb+JAmpbxOfddNEnZWJTY6frBt7grm3FjQ8nONlxp9F6ms1OfKJrrt3aCbmE6PMl1pkUY8rdDlK5Ft/6UXfFeHkF4LgX1nqfMXt6JgHQSgya5IIWrwjV5MdBhiBNyzsI7+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757672057; c=relaxed/simple;
	bh=WzgTnbK9tuNFXaklXyWAZeptvHxNrHodKB3ayQnobdY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=u/BirYwj0fyyyWuAXJwVDM4v6Qfch5qlLHnb+bI1ww9AYKD95uAZrfI5lLmspcTRlJbCZhizKGNyftYkI8MGPSTUmmzo1b0G2gvk2pc0af8FuqhgRjbXBg4C2V9aWqD6Xz6ESZ6TEnpd5HVTQQ0sN0d5Vb47Djv6GoGBiO7/M1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KBGfhlxl; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KBGfhlxl"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-45ddc7d5731so12385305e9.1
        for <linux-staging@lists.linux.dev>; Fri, 12 Sep 2025 03:14:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757672054; x=1758276854; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5PQcDKC/bECgYhflDmBq/roZDN26g7PlEyIKs1aCH60=;
        b=KBGfhlxlq9vcEf1ceMb6gD23DO+i2TmqLPEW+KoOcFN4ze68GzsxBbcgiCywfxrq1c
         Ncl5UpJZ3s1+4j6o28V8/jEdKq1ReCYdwhVVpJJVaImicKvjkdLfx8gIvCCJBxZW79Oa
         WYRKsVLidFItM+tA6hdxSXgek57TJDsiQQxlqrDDJjxplVkpmPmZ61RDa/6kEryIz4Xm
         ahSY6dV/Kh99U5olKxX7KoCByfXm8usOwjq7VJjdUY8yrNc3AaXsjeABETpCRg6GFPPR
         H2AX0GDswDUiFwziZHWLJZj3ypnQW+bjOhnRAKW2yXX6/f0ejFKPq7lr2ZaGdQYcAghV
         rihg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757672054; x=1758276854;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5PQcDKC/bECgYhflDmBq/roZDN26g7PlEyIKs1aCH60=;
        b=jQtVmDV4XCgD6SAAJElr0M3mp3nM65z9gIdWq0pZdybwsfgYqVaiaaOC+pa10JF8OD
         O6+BvKfXxnvMThRON/fCOy960Fn/3qLc7TG00Z7huSKuVzygitkx/Ld3lNbU3r7XYgYv
         4TSaPCpTkFEewAAFueQQacUXSlyDa2TYH5MmaNZK5aT7xgqLAYODp04m1FAU6NYqfFWp
         0xPKbJGWEE7B6vWJiaPeXLTeLvwVw6LaFoCmugdTYh0FqmFTAayK+ZcGlNEwBMz6Hccw
         qiMt+bhfaRHOoI4R6SSDpezsuQFRlkMrdi8bdiCdwlfvMrGUw9rPj3xbiejUajSX2ifH
         52WQ==
X-Forwarded-Encrypted: i=1; AJvYcCWrDtINSOv8jtLkRI3tAJpqmi6xTCQwEcjHeVR81DZBYu/vyweAg69EIXP+nS8q7SHKNzaSdQyZlaDxIBK9@lists.linux.dev
X-Gm-Message-State: AOJu0Yzqprj2zXpQ1TROvUvqLOT1+DNyLTFKSrSD3CkPywpnsCoO+ect
	z2modMd+zkogYcVMW+nQ/IYot0s5o0WYOpYbXKm/U/zA9o9L1CyXAxqU
X-Gm-Gg: ASbGnctdmJS/LTXMVDrw1zqlJKOQuP7R96p3oqweBtdyhe2iWxTiGNRfnjXoA6+s/JV
	83/YP00s534/lJTHWLVU1Yf8F8a/HT5WSzhtBWPrjN9c7zTxj98iEKeXWqpanN8kB4hYHQ6ztdb
	fzQwlqgB/6IFkZuXL7UFqF4QUuNYgHQVoCPC6xfkOrThU6yL9BC+Z06tmvPhBkvJJVyQPoRGzbK
	WP0K/dSkV2HJ+rf08gWl0E9ZUXkSoHJKn26EhOG9mzA8AuekaCXUj0Y+L2EbCftnc5HYkI3AtQi
	tot1LUT6qnz/CVifCYgAPbv+nJ+rKpoXcXW3qzwXAH4vgu2yHN1OQLgHNzQZhd1o5AoMudK9b8P
	ZCxnSe29hnuNxI8X9ncsMCQ0QG4Dwfft7tLhBNfd0pNLm
X-Google-Smtp-Source: AGHT+IH/9UK+74KXPTnSJovBBUuqH7Dh59JphBjwKJfV2cuUIv0/SQm8MsDxBuEOK1XB9vm/BVZEhw==
X-Received: by 2002:a05:600c:2249:b0:45d:e54b:fa0c with SMTP id 5b1f17b1804b1-45f2121431amr20057115e9.17.1757672054181;
        Fri, 12 Sep 2025 03:14:14 -0700 (PDT)
Received: from ws-linux01 ([2a02:2f0e:c207:b600:978:f6fa:583e:b091])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45e0372b983sm56542395e9.9.2025.09.12.03.14.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Sep 2025 03:14:13 -0700 (PDT)
From: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Cc: gshahrouzi@gmail.com,
	Ovidiu Panait <ovidiu.panait.oss@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH 2/2] staging: axis-fifo: flush RX FIFO on read errors
Date: Fri, 12 Sep 2025 13:13:22 +0300
Message-ID: <20250912101322.1282507-2-ovidiu.panait.oss@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250912101322.1282507-1-ovidiu.panait.oss@gmail.com>
References: <20250912101322.1282507-1-ovidiu.panait.oss@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Flush stale data from the RX FIFO in case of errors, to avoid reading
old data when new packets arrive.

Commit c6e8d85fafa7 ("staging: axis-fifo: Remove hardware resets for
user errors") removed full FIFO resets from the read error paths, which
fixed potential TX data losses, but introduced this RX issue.

Fixes: c6e8d85fafa7 ("staging: axis-fifo: Remove hardware resets for user errors")
Cc: stable@vger.kernel.org
Signed-off-by: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
---
 drivers/staging/axis-fifo/axis-fifo.c | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/axis-fifo/axis-fifo.c b/drivers/staging/axis-fifo/axis-fifo.c
index c47c6a022402..2c8e25a8c657 100644
--- a/drivers/staging/axis-fifo/axis-fifo.c
+++ b/drivers/staging/axis-fifo/axis-fifo.c
@@ -230,6 +230,7 @@ static ssize_t axis_fifo_read(struct file *f, char __user *buf,
 	}
 
 	bytes_available = ioread32(fifo->base_addr + XLLF_RLR_OFFSET);
+	words_available = bytes_available / sizeof(u32);
 	if (!bytes_available) {
 		dev_err(fifo->dt_device, "received a packet of length 0\n");
 		ret = -EIO;
@@ -240,7 +241,7 @@ static ssize_t axis_fifo_read(struct file *f, char __user *buf,
 		dev_err(fifo->dt_device, "user read buffer too small (available bytes=%zu user buffer bytes=%zu)\n",
 			bytes_available, len);
 		ret = -EINVAL;
-		goto end_unlock;
+		goto err_flush_rx;
 	}
 
 	if (bytes_available % sizeof(u32)) {
@@ -249,11 +250,9 @@ static ssize_t axis_fifo_read(struct file *f, char __user *buf,
 		 */
 		dev_err(fifo->dt_device, "received a packet that isn't word-aligned\n");
 		ret = -EIO;
-		goto end_unlock;
+		goto err_flush_rx;
 	}
 
-	words_available = bytes_available / sizeof(u32);
-
 	/* read data into an intermediate buffer, copying the contents
 	 * to userspace when the buffer is full
 	 */
@@ -265,18 +264,23 @@ static ssize_t axis_fifo_read(struct file *f, char __user *buf,
 			tmp_buf[i] = ioread32(fifo->base_addr +
 					      XLLF_RDFD_OFFSET);
 		}
+		words_available -= copy;
 
 		if (copy_to_user(buf + copied * sizeof(u32), tmp_buf,
 				 copy * sizeof(u32))) {
 			ret = -EFAULT;
-			goto end_unlock;
+			goto err_flush_rx;
 		}
 
 		copied += copy;
-		words_available -= copy;
 	}
+	mutex_unlock(&fifo->read_lock);
+
+	return bytes_available;
 
-	ret = bytes_available;
+err_flush_rx:
+	while (words_available--)
+		ioread32(fifo->base_addr + XLLF_RDFD_OFFSET);
 
 end_unlock:
 	mutex_unlock(&fifo->read_lock);
-- 
2.50.0

