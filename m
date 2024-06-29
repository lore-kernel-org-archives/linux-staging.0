Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A48961E878;
	Sat, 29 Jun 2024 17:47:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719683228; cv=none; b=P+5rWHgTus/NtFrJ4nEKqrJjUKu4yVJIGueXqVLh8gvbhV4cpHFKwn/myobQyIMkgVmzrkFquFZb/2cUgXd5/cBkUCPp+Nr7aTR+avse4Bp/n7pSWO/o9VTuyEN6thbioisO8rfzk0V/jNMG3IC9HFVmsrNTTeGsIUx24bSE81k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719683228; c=relaxed/simple;
	bh=8jXpjaEGXIVt/rnGrJd4HdmWE4veMgKAlIPQ5e/UWBw=;
	h=Message-ID:Date:From:To:Subject:MIME-Version:Content-Type:
	 Content-Disposition; b=Kw5D5Nc7HboCIfAWU7EHxOZEmaanXYpVRTrO8eHbToLyuC6nA4eX2uSl1TY/KiWXoJIZZQyDBcWtkUpiJKUm7kPK055evfXoRpYaI2HNUaBjIwWcVNh0OsKDCF3gbo7xLpqRFRGTsT9+k08tvC7kNyTZSSYGOJ5pgS+XuTgVekU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A+K0gtxj; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A+K0gtxj"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-364ff42999eso1333858f8f.3;
        Sat, 29 Jun 2024 10:47:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719683225; x=1720288025; darn=lists.linux.dev;
        h=content-disposition:mime-version:subject:to:from:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RM9I+OAVtRNtNBzaQ8k/P87nr2q6nUcg+dZj/RNtCeo=;
        b=A+K0gtxjbTKUX4K8P+MtuwefqxpjXEWL0brNXB7A/06NzmFmFou4RL1/dgjCtAsujb
         ekFVkadh3wVXhRUNqXpwNZimPsAgLCQgBSNR4ZKg70awA8s3ChQbBNQxGHC5VWeGSoKD
         CNmGapcYItQOged8P7tHFHhGERArU/AS+T9Yd7SXpWnpcfvoM4UC7aNrl5kGYXmHYNar
         tG9OGFHKI4EceuKkoB1ShDlFRS/JYtvDPNqtS2n+X3zLadDwfdg0wZ3viUoA6lrcW1k7
         wnyNvnhrW8+PTVii2hQjRpNHxAXF1AXgp4U18jYSJgieRM/kG6nTpwrvsS9aR9oZ/okZ
         PaWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719683225; x=1720288025;
        h=content-disposition:mime-version:subject:to:from:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RM9I+OAVtRNtNBzaQ8k/P87nr2q6nUcg+dZj/RNtCeo=;
        b=keuxXckRVDSuCWv8O3RuyFEqEUq1SFYLZYYxxIac4B+irV/8JMBjCdwfbtJXg/Vi9Q
         caXtHMERPQhWlQCX4SS6BjX3otRp2c+f88wLBaFyE7ubTFgeemlHSVTk8sc8a1QNlXOp
         V5l00+YaGlpv74xf00rU/ILvENIBKbxwHNGpa8mt9m8FcEV08BjKfawNni8Fbg6QQpA9
         930l/cLklbkKcH2n1+1gkeIWR+CgIWC0DjC/31G2M3Q0YWZdveUBPc3yNTU8oftrKiE2
         sCwDFeto9tHrX/8NKNbW1zbaEQxx9OA+awBhnMGL7+3CxMjBzfvOxXjREPqPxJfMpU9x
         UJHw==
X-Forwarded-Encrypted: i=1; AJvYcCVtgHH9PILpFwJ0gVN+MrrlOkvs0cTSLxTj05zLstWf0zFZ5reKppW/Xjye812RguRuTwy8X0a9PEZmbnFoOh8LbEGXxLDr884nN40DrNfc7SD9GcmUXZxsemsNwmRCTZ9Pfl3JS69wrA==
X-Gm-Message-State: AOJu0YxvvdtLkj+LW1kJRnuI9GIQpO7H769VosuLUCOu/X+mTokUmp8Q
	JHrQ3UF7M9Kr/3kebdoXMUPRjPQa2DbRJ81XYdVNOaD94ty/jEmQ6nj0RUo1
X-Google-Smtp-Source: AGHT+IH4uBsJD46pExK4S2eIL1HXcwBAMRAtXfuDZKRJ0KGCzOPoK9l5N7iXtrbM8bLZxaTAjDSgNQ==
X-Received: by 2002:a05:6000:c09:b0:35f:16c9:a5bd with SMTP id ffacd0b85a97d-367756aa9d5mr1239993f8f.23.1719683224932;
        Sat, 29 Jun 2024 10:47:04 -0700 (PDT)
Received: from laptom (88-121-55-84.subs.proxad.net. [88.121.55.84])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3675a0e12fcsm5373040f8f.48.2024.06.29.10.47.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Jun 2024 10:47:04 -0700 (PDT)
Message-ID: <66804898.5d0a0220.6df0f.4f0a@mx.google.com>
X-Google-Original-Message-ID: <ZoBImPI8YbgOzycV@laptom.>
Date: Sat, 29 Jun 2024 19:47:04 +0200
From: Tom Mounet <tommounet@gmail.com>
To: Marc Dietrich <marvin24@gmx.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	ac100@lists.launchpad.net, linux-tegra@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev
Subject: [PATCH v3] staging: nvec: Use x instead of x != NULL to improve
 readability.
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Use x instead of x != NULL to improve readability.
Issue identified by checkpatch.

Signed-off-by: Tom Mounet <tommounet@gmail.com>
---
v3: Add change history and proper description
v2: Make commit title clearer

 drivers/staging/nvec/nvec.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/nvec/nvec.c b/drivers/staging/nvec/nvec.c
index e5ca78e57..814eb121c 100644
--- a/drivers/staging/nvec/nvec.c
+++ b/drivers/staging/nvec/nvec.c
@@ -300,7 +300,7 @@ int nvec_write_sync(struct nvec_chip *nvec,
 {
 	mutex_lock(&nvec->sync_write_mutex);
 
-	if (msg != NULL)
+	if (msg)
 		*msg = NULL;
 
 	nvec->sync_write_pending = (data[1] << 8) + data[0];
@@ -322,7 +322,7 @@ int nvec_write_sync(struct nvec_chip *nvec,
 
 	dev_dbg(nvec->dev, "nvec_sync_write: pong!\n");
 
-	if (msg != NULL)
+	if (msg)
 		*msg = nvec->last_sync_msg;
 	else
 		nvec_msg_free(nvec, nvec->last_sync_msg);
-- 
2.39.2

