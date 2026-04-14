Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0281E3BAD89
	for <linux-staging@lists.linux.dev>; Tue, 14 Apr 2026 09:13:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776157999; cv=none; b=tChXTDwmwH0v3Pk1cfhRGfV3OJQZAwl5KwMKq1bWK3szSNzteNWBj1IKnWaRz1EL12+2pCwXAG0inySLtDyr9EJPPKOw4AI7lg3sNn5eln0oxoogb8sIbQoCsncu+065dxyB1ONOdmcS5jU73Q0OsmrN3vh6s11S69LNDnB0yh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776157999; c=relaxed/simple;
	bh=DceN/1FY5sfDaFKgfd/7xWB7OmyeTAAniEbTxPCaqG8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rA2CEApxIzrlUJ1U6SKJfu2lH9Eupgl0huMTO8Po6on8kZ3IiRbV7oMngU+dwv4/CuGYLOWCRdnqBDHnmqpvXD46QR0j3wnyV2XcHZWV/ct+Af6e8RNyIwy31g1w4JMtQ7xO287iNcfNGwe7X7z8LVJUL23M/xrMOMg7+RA//9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hIsqsd9x; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hIsqsd9x"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6708cc2d6f6so5785106a12.0
        for <linux-staging@lists.linux.dev>; Tue, 14 Apr 2026 02:13:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776157996; x=1776762796; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UmhA9XrEY3SaezkYYH4LWBg56vYjVuHTXXG+8AA87cs=;
        b=hIsqsd9x9N8UgAGzwwtIXLZaTyux7CbPqKuxEL0bUGdJ6jYHoG9niA8qPg4kbYRALW
         uYrlWnTOaXGFffcGsv34ZK8N61df4Hcjm/orFzrZ6I7P4p8jG2ctZDyo/uFZWEwbPgV+
         sI3dYvgyYKBmKI/T6q5By7n9NfsSz+iqUd8UcKGnywLL+8z0EtgeMwgqCUNDHUZV72wx
         JMpH+PdpbVIX4owwxn+8zIXVZC2qI/08o3D9cgzhUojsqN93Uo4/ydfeCEU0MbcmZUQ5
         MGaSus//23sNWTeGMUFYj82pH4Ys2JSlPg8nmcUpahXg81xHxmk09wTT3aovjxt1ebfV
         WHgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776157996; x=1776762796;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UmhA9XrEY3SaezkYYH4LWBg56vYjVuHTXXG+8AA87cs=;
        b=WPS33ZLYQFcYWRJi+/gAU2SVmdrDP1sfiW0ZVbnNUPq5btCaqQ2M2NxeO1VSGAHTWp
         YO5M02JcSWS+tWCMOvLZyD+KQgcXQPVGERZedx8NZ5pssrHjhbGxba+FJwTuQOWy/VNu
         AmgDndV1f8gSpnzXutbqagkM8NGxtZsBf5QQizyR43D45gGODmHut7zd7bb1mhnAPrmo
         el8iocxyaSx++DomRie2zX8NGTFX7rDErBZQ6+gdRrSsw3U3sgZZSiFekNpcvLvy5uws
         cHNhEAPg/ZIxcqAL95fKydqWbX3a+h4wdACWPQ8LQi8jQCYePEZhoazUWl7swmk/RD6u
         KJlw==
X-Forwarded-Encrypted: i=1; AFNElJ/IR4ipb8xy/Cojc+pSr5xbMSxK3HgmxI4S6ycecsl7DMH2vsSaW1VZWWEP4AMAZskKNrjUnYsulH7336GY@lists.linux.dev
X-Gm-Message-State: AOJu0Yxo62cjd0y1UckxYJipMhaM04wUaJJvb+kD5aZebzSt5bntDYOu
	ikx90wqXgSfSa/AuGUwqZErTsSrm0lI8LxRUePo9VsohsfvDDhQX8N/U
X-Gm-Gg: AeBDiet0pIG3UR5YigjRsb/yE4bwGxshxviYKU7YhSs3K55BJxV45FsvcAwRaCeMmkY
	7G3boekVhdv9iHXfh1WMWuba7XtETCY9Y0ahN63/YAoeoxzBwWDCy+IQFefvE4ruxla9pIyX97n
	30s/GTml7aWwPOja4uPpUvzZqLm9BN0FqolhfopbSf4XDZBI5tVexiOfkU+dgzod6Vo27t/dCh6
	83CNqSHFW57h6PvqYyZqr8mrYYxJcMg3aX5cCV0+6sm6enK71tnKhTdtIe3U3+T1CsiLUM7kF6W
	fHJHB/UbrGJZHXialz9Aw5P1HYgunSN93pQksvqUhxJ1ESgPm94tNtQaDOtkw9i2f1HLH0bKuO3
	YMcxKqXcwuI/PHL4s2PfQi8k3htRKEZrQvnHibgzNcJxZSLEb6YXcu3uM4JytAdXbDB22GNvOTM
	wSPc5udsYHrwFlIkJH43rto9fR9FQq/9O4B6WAG2BqrM8mFAPbtgBZh7TdrXDCGjCTO20bfq7gB
	NP2ypdkgDW95H9/satbmBXAKcJDkz86lxd7mA8jbYNcK2C84C3KL//vpGeim4WptwKEum4XlaRn
	bRlVOYaQ63rV3hyZZHj8cUlvAD8Di60WNGKt3E7JCJqjPYGH+Inme/XfXmffDkpLFmHV7qvF50z
	f64/hCZGC5gckmjVZdvxRfOZiELhK6PMpWiFs2zL3v6sfAWYG3z5t04Uk70zNwgKX9XEQphHvOG
	F7yEKxsFM=
X-Received: by 2002:a17:907:a28d:b0:b9d:424f:1d9e with SMTP id a640c23a62f3a-b9d7298fffamr993970666b.34.1776157995985;
        Tue, 14 Apr 2026 02:13:15 -0700 (PDT)
Received: from cs-280612103108-default.europe-west4-b.c.od237066db22328bb-tp.internal (63.152.141.34.bc.googleusercontent.com. [34.141.152.63])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9d6e7c8a44sm384466866b.52.2026.04.14.02.13.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 02:13:15 -0700 (PDT)
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: lars@metafoo.de,
	Michael.Hennerich@analog.com,
	jic23@kernel.org,
	gregkh@linuxfoundation.org
Cc: dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Joshua Crofts <joshua.crofts1@gmail.com>
Subject: [PATCH 3/3] iio: frequency: ad9834: add mutex_lock() when reading st->control
Date: Tue, 14 Apr 2026 09:12:50 +0000
Message-ID: <20260414091250.1295-4-joshua.crofts1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260414091250.1295-1-joshua.crofts1@gmail.com>
References: <20260414091250.1295-1-joshua.crofts1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add mutex_lock() and mutex_unlock() when reading st->control to
prevent data races as st->control is actively modified by
sysfs _write and _store functions.

Signed-off-by: Joshua Crofts <joshua.crofts1@gmail.com>
---
 drivers/staging/iio/frequency/ad9834.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/staging/iio/frequency/ad9834.c b/drivers/staging/iio/frequency/ad9834.c
index 9499e05a73..33570474c4 100644
--- a/drivers/staging/iio/frequency/ad9834.c
+++ b/drivers/staging/iio/frequency/ad9834.c
@@ -283,12 +283,14 @@ ssize_t ad9834_show_out0_wavetype_available(struct device *dev,
 	struct ad9834_state *st = iio_priv(indio_dev);
 	char *str;
 
+	mutex_lock(&st->lock);
 	if (st->devid == ID_AD9833 || st->devid == ID_AD9837)
 		str = "sine triangle square";
 	else if (st->control & AD9834_OPBITEN)
 		str = "sine";
 	else
 		str = "sine triangle";
+	mutex_unlock(&st->lock);
 
 	return sysfs_emit(buf, "%s\n", str);
 }
@@ -305,10 +307,12 @@ ssize_t ad9834_show_out1_wavetype_available(struct device *dev,
 	struct ad9834_state *st = iio_priv(indio_dev);
 	char *str;
 
+	mutex_lock(&st->lock);
 	if (st->control & AD9834_MODE)
 		str = "";
 	else
 		str = "square";
+	mutex_unlock(&st->lock);
 
 	return sysfs_emit(buf, "%s\n", str);
 }
-- 
2.47.3

