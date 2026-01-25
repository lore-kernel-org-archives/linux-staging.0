Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BABD963CB
	for <linux-staging@lists.linux.dev>; Sun, 25 Jan 2026 13:49:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769348953; cv=none; b=suaAIkwuy4ZN1q8oGw1Ov8CrscyL4M8qozMIq5nFEsG08I7ti6HfUMsLJVmvsbxo949OxQHT/LRi/RHKFFTO8WSaMF+3/oVtU3QVdfjMKgyNAQ07tIGJWMhMyhOeYKVjhx+7OEg53aVK6wwLSjtf7EeqOdwM8HMsguGvXtE8xuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769348953; c=relaxed/simple;
	bh=h6M+KLjiVFypP8v/V3hgi/xRXMPMzHyblkAsadDGc/w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZquIPKXZJUW4SsdKmoAhboNv/Pik7rSjX4cuk8qYAPhOd7nKbSgbT58F3Rr/Xinroq8FwakLHRIuZJuhfyuh1IiVbpOvg+XrQ4tlA25yW56STyYGTHJRnkUTwfLONFRharmGFuzIXsmGXZk7QnVylm0XcBJpvuE0cli+eeTl/nc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fRIYGkLZ; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fRIYGkLZ"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-4359228b7c6so2296714f8f.2
        for <linux-staging@lists.linux.dev>; Sun, 25 Jan 2026 05:49:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769348950; x=1769953750; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=okJxgcNxyT0t1LmxmVSD+6wad8n7jcqCMxTOL8WlsjQ=;
        b=fRIYGkLZZiM0DAr5+24XIXmAmFf9ufRtg5qhhvzIXZB8ZIFSo9WiKePmrkcCmWslY4
         TjsskgLOZ4XcLllmYq8aT/Gm4INh9Kw1BdeFAQa2ED/0EvaMmXsYkfzFRg30YhwNi0sx
         +jnhc22aDlmQOwPmNpEb930B3l9ACnjRITHppk+FDTvcmHUgE8/lkKAS32xWOMv0ENi4
         s6PUGDPSYnAPOGxjpKOh6x+jqy26ex0d1OvjTaQlgwh1Yz3r/ZIljzPOjRtntXWBLbCL
         n/35lmU1H5XTlKSzqI84AIsupxdmZ0W4woREqAz3QekapaSgZHj9RPbs6toFbJ6PzkQ1
         I3kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769348950; x=1769953750;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=okJxgcNxyT0t1LmxmVSD+6wad8n7jcqCMxTOL8WlsjQ=;
        b=nx3zhPHF8Q0pOk42OnR+eFggNra3Oaj70vSUZC3uHtnPW1O0kmUNmUyhxJGqHx5hXU
         U+gKwPU1KuzQludEzjv7Ri5TneISbe7qSMwOV4s3n7jKgwsKeVsErNFsCemtVGqqNMHS
         V+qdWu+ximEeTnuXG51RQnzKH0LuV04mwFb/82EO3/L1aNtEb4bBP9OUeaX+s2jmefVj
         MNyTDGIGhbTCPP9lqPGPYDsuApDTzOcqDEQXCR+dLQ+9NOKgRN9ZHOlH2SjYdTnRn4PT
         gymKYqpha+ZqJv/pCO6deRHy4EwH2oVzee3srW3hBkoThZAqyp6LCrJbuP2A9TsFlz3/
         z9ew==
X-Forwarded-Encrypted: i=1; AJvYcCVD5JSWScmodRyPIxtxgz3VnHGnxYguSzRvEvW/yWHRZTZrx3vZUX8D8L3fkCvdFTBkQuOKFLWpfWRES2tQ@lists.linux.dev
X-Gm-Message-State: AOJu0YwHfVv7HeW1NWk4aWCrF1msOe/UYfcIF+URQAWSxj+Cs6l5qf3b
	4iVTHoJ7OsCOkDeDSsgHAv2Nz/+bdD2aMeROpJO2Ca6jcjKPUlUf6jqt
X-Gm-Gg: AZuq6aLYxWam9WJqRJS9QCkLsvu8FNJE3+51B5adExVS4ppbNGyTxwbNaajnmv37yzv
	LdFQqFy7wotNMg2zkPleAKtJnoZu5nSQDKIGxNn7z2qPjUnC4QoLXxwQhsWvOLgH0DEyfCLh45M
	096bmL8lHMtk3sWwKMntL0tJoo3Yfyhl/vVZHTdoB8uv4W0amkG0AXTpSkF01MmJuMB75rBdE6k
	Zr4buVpnOuaNlY98uXh3BvI2uyD0Wt3b/83DMxXfqf5foaRmQ+3wakW8lBIlEbF37mV98JHiZTm
	9+F3BF9rxNh0fOdBD085EIZXjvMC0wmc8Hhz5azES9YgV728PXFc3lPUZ8lGI11fboP/Ljgfq1n
	1rNfVcso/5iOFJPM92u4NV4TIcuJqL/BO8FlVpt83uTDH8ef+FaADD2WXUdorgwWKdqhQXeqfVN
	V9qEPBoSKr
X-Received: by 2002:a05:6000:288d:b0:435:9801:d393 with SMTP id ffacd0b85a97d-435ca19f4edmr2899870f8f.37.1769348949934;
        Sun, 25 Jan 2026 05:49:09 -0800 (PST)
Received: from TTPP ([31.176.173.245])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435b1e715d3sm22743402f8f.28.2026.01.25.05.49.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jan 2026 05:49:09 -0800 (PST)
From: Omer El Idrissi <omer.e.idrissi@gmail.com>
To: sakari.ailus@linux.intel.com,
	mchehab@kernel.org,
	gregkh@linuxfoudnation.org
Cc: linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Omer El Idrissi <omer.e.idrissi@gmail.com>
Subject: [PATCH] staging: media: ipu3: fix function argument alignment
Date: Sun, 25 Jan 2026 14:49:00 +0100
Message-ID: <20260125134900.9964-1-omer.e.idrissi@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix alignment of function arguments to match kernel coding
style as reported by checkpatch.pl

Signed-off-by: Omer El Idrissi <omer.e.idrissi@gmail.com>
---
 drivers/staging/media/ipu3/ipu3.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/ipu3/ipu3.c b/drivers/staging/media/ipu3/ipu3.c
index bdf5a457752b..c34ff01484e1 100644
--- a/drivers/staging/media/ipu3/ipu3.c
+++ b/drivers/staging/media/ipu3/ipu3.c
@@ -151,7 +151,7 @@ static int imgu_dummybufs_init(struct imgu_device *imgu, unsigned int pipe)
 
 /* May be called from atomic context */
 static struct imgu_css_buffer *imgu_dummybufs_get(struct imgu_device *imgu,
-						   int queue, unsigned int pipe)
+						 int queue, unsigned int pipe)
 {
 	unsigned int i;
 	struct imgu_media_pipe *imgu_pipe = &imgu->imgu_pipe[pipe];
-- 
2.51.0

