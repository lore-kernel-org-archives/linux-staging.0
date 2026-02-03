Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7702311583
	for <linux-staging@lists.linux.dev>; Tue,  3 Feb 2026 11:49:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770119346; cv=none; b=UJkpWsUW/5Dkx2g450E4e9aMcFZbpxfnGYRnTR8NIhCVugwXMc+mWOGvF//gbaWJyE/d/ESa6rJbM3YJ2Mnyv93oDVwYNxqAnEZ+ri2z7+wkwFTw4poPmrLvnxxSMD+knliF+OT5aSHCKEXd36dJau47UlL/tGO0Yu/IHcsE8jE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770119346; c=relaxed/simple;
	bh=IqMRuouYKplCpuBL4+LEX/kT9JKSXiQib3OML5jseRI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=adSTLdNe1HMdTHnu7tHnQImB0cNpFpSJRYJGlx0Nk7oKx4y1GgaH59Japd+GtZ1WE87BEoZ6QV88n3DZXZuxtFB+zqgD0/yyUOThdG0CpYR5xSlqoTApuPQIjhN5WAFDSlk1M80nfq2A5ZVfWR/Z1300yhLJBMBh2XUGQTZOkhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QifFsYX5; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QifFsYX5"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-42fbc544b09so5100456f8f.1
        for <linux-staging@lists.linux.dev>; Tue, 03 Feb 2026 03:49:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770119343; x=1770724143; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Z4FvJLpGt0rg4WG2VihKDDJ7LuQY5vf0sYtnb+B7S6Q=;
        b=QifFsYX57BLSWWNOVpglKn5Dzpd3wgULE6Gog3+sokPqmHJazIt97pTNuJNt5sWuyV
         L5NautxrE5ty7lhNmcYBOC6OzzGtwgbEORurQ0rkAmxkjbmjFgXl5eXZbc3O9J2X044+
         PcsVeorWk7mNZDd4LEeIhus5v0c6dUuq7sS5Hk9tpAUvQVHconKzSCT1pSJ4+lc0wLyK
         HDCKjea33gjHCx2s3DxGUcV+Zp9RF2h7nK7Jnwa9qZEQNtWtEgYinD53Cm6vwlxfUkEJ
         QfLLlbDMn0W4QrSTykEw5U8uHvwqm5IR7gx59vvRY4W3dvpz1QOXRSkOpnIlMR5Ukx1o
         gSDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770119343; x=1770724143;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z4FvJLpGt0rg4WG2VihKDDJ7LuQY5vf0sYtnb+B7S6Q=;
        b=nufVc+6XF6YkO7IOval86Akhvmfa/HmbgNNoTXjKeM2kcRDuclJgASC0+IoTeIf5e5
         gHesFYT2g00vMca0rjEsPWf84Eh+8vq52qT6ZawgKYhxqRskKIeu3GtiGs07iLL+ida0
         k5eqBUUPo6r27ZJBLa84KPOqSlB/of+4vnDVp/K+QqD7dBTNJHGfBo7V0izijJNP6M5Q
         wd0hqaANZBt1oEnwAexNVh9jejxh+8wI4DE/0M0fqcmCMLO1ESimNg65RjqJj4EEXNWN
         DLRGFpcmhFhEsruB9mtj14fYRjVCUZdlbFiKQyO1r9NY6GaM7jVs3EK0JZNB5FW6lhvF
         hSyg==
X-Forwarded-Encrypted: i=1; AJvYcCUzPpc3zwUe+oDFD7SLUbtHc+2sAnIScDvXO3bU+C0ON+ZgXZba6Sscqf7WONc3i6v/pctOmwlXrr8N6mNn@lists.linux.dev
X-Gm-Message-State: AOJu0YzNkFlgG62od4hJgCAui3e2Aa+JmA2v8cnMjQHofElHg0ZWk6YS
	YtYQOVrRfk7O19zWZbu6SnckmVFrs6kBn8mbgBI0q9f/MJp1Tjr/LwZz
X-Gm-Gg: AZuq6aJrDN45OLxyJY9H/6ns7M8emPxk75J/XQhd3dlStB9pWzHoCk2uQ8zdq+mqy29
	9l8S4xZTMFqc419W5k0I1cfjZrtoBGLHHXCtWoWp1h7mimIP59G8EyOWgseqKQZ1hvokdym7y9f
	MbNz6LWYegY48IMBzj1K9z7Rr4XU9+xjh2TiPxjslEJ91C95hNisr9zo33HcwyfMa8/mSZ8mOBb
	j1+m4art94DDItY9QcHEdFuNaOdJFiQmKmlC2XknYcMSbR4C9S7cSHjvxPZtL21+rEQP67iyDA3
	4NlLckXsYuF6NoTnluzEPPnk6pkgGW3LUr6dFT/sQO/Q/OOelJQnaSEtrlZeRlKIvzWhznfibjC
	ciuw/qQ10bIF15BE/iQqOBU02L0kiKjyqKbTgaeYo82P5Iz0yHHcuxdzB2ULtw8CZMVTBhY0zr1
	TIJfoDDXHVfsKYJ1TYvHEVF/r/J3Vq1P965JBcLDB7cG6dwndjz1ccQqmGXebijBlRhYOemRHV2
	jWoWRmOScg=
X-Received: by 2002:a05:6000:1868:b0:429:c851:69ab with SMTP id ffacd0b85a97d-435f3ab2d43mr19870372f8f.55.1770119342363;
        Tue, 03 Feb 2026 03:49:02 -0800 (PST)
Received: from localhost.localdomain ([31.206.212.157])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e13235f5sm48418880f8f.29.2026.02.03.03.49.01
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 03 Feb 2026 03:49:01 -0800 (PST)
From: Baran Arda <baran9arda@gmail.com>
To: gregkh@linuxfoundation.org
Cc: ovidiu.panait.oss@gmail.com,
	gshahrouzi@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	baran9arda@gmail.com
Subject: [PATCH v2] staging: axis-fifo: fix sleep while holding mutex
Date: Tue,  3 Feb 2026 14:48:58 +0300
Message-Id: <20260203114858.28278-1-baran9arda@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The driver calls wait_event_interruptible_timeout() while holding a mutex. This can lead to a deadlock or poor performance as the mutex is held while the process is sleeping, preventing other processes from accessing the device. This patch moves the wait_event call outside of the mutex lock in both read and write operations.

Signed-off-by: Baran Arda <baran9arda@gmail.com>
---
 drivers/staging/axis-fifo/axis-fifo.c | 30 +++++++++++++--------------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/drivers/staging/axis-fifo/axis-fifo.c b/drivers/staging/axis-fifo/axis-fifo.c
index 509d620d6ce7..a651c59a80ea 100644
--- a/drivers/staging/axis-fifo/axis-fifo.c
+++ b/drivers/staging/axis-fifo/axis-fifo.c
@@ -197,11 +197,10 @@ static ssize_t axis_fifo_read(struct file *f, char __user *buf,
 			goto end_unlock;
 		}
 	} else {
-		/* opened in blocking mode
-		 * wait for a packet available interrupt (or timeout)
-		 * if nothing is currently available
+		/*
+		 * Opened in blocking mode. Wait for a packet available
+		 * interrupt (or timeout) before acquiring the lock.
 		 */
-		mutex_lock(&fifo->read_lock);
 		ret = wait_event_interruptible_timeout(fifo->read_queue,
 						       ioread32(fifo->base_addr + XLLF_RDFO_OFFSET),
 						       read_timeout);
@@ -214,8 +213,10 @@ static ssize_t axis_fifo_read(struct file *f, char __user *buf,
 					ret);
 			}
 
-			goto end_unlock;
+			return ret;
 		}
+
+		mutex_lock(&fifo->read_lock);
 	}
 
 	bytes_available = ioread32(fifo->base_addr + XLLF_RLR_OFFSET);
@@ -340,27 +341,26 @@ static ssize_t axis_fifo_write(struct file *f, const char __user *buf,
 			goto end_unlock;
 		}
 	} else {
-		/* opened in blocking mode */
-
-		/* wait for an interrupt (or timeout) if there isn't
-		 * currently enough room in the fifo
+		/*
+		 * Opened in blocking mode. Wait for enough room in the FIFO
+		 * (or timeout) before acquiring the lock.
 		 */
-		mutex_lock(&fifo->write_lock);
 		ret = wait_event_interruptible_timeout(fifo->write_queue,
 						       ioread32(fifo->base_addr + XLLF_TDFV_OFFSET)
-								>= words_to_write,
+						       >= words_to_write,
 						       write_timeout);
 
 		if (ret <= 0) {
-			if (ret == 0) {
+			if (ret == 0)
 				ret = -EAGAIN;
-			} else if (ret != -ERESTARTSYS) {
+			else if (ret != -ERESTARTSYS)
 				dev_err(fifo->dt_device, "wait_event_interruptible_timeout() error in write (ret=%i)\n",
 					ret);
-			}
 
-			goto end_unlock;
+			return ret;
 		}
+
+		mutex_lock(&fifo->write_lock);
 	}
 
 	txbuf = vmemdup_user(buf, len);
-- 
2.39.5 (Apple Git-154)

