Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A94F8562D;
	Wed, 20 Mar 2024 19:19:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710962369; cv=none; b=fnqWL6yBAo9rsDV14XaA55U+3i1fvEBb76XiiWTvm5XInPgIYUkOeR2H9ELxML67aMTZa+ky97gKnJpm6aiX5Bs9nwElKZL0PVkPlQ6zFoOHR7p4YgrUOpIAfXwR//5OEb3BTQ42CqvEoLms3TK0RwtL3B3wnrqpOT6k9V+MLII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710962369; c=relaxed/simple;
	bh=QoHfLb2g+qiJ0TmFaeUofXdDKDug3TX0m3qwW2VjAaQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=G+OgsyKekhgcdTFQwccXzm6oVs56TbLJHfmBl5onlurMBIJnqlZ/ENPp+qQy9Sq95bw5fxmWTXnRpeoEX4K928AlWJH0yoBngRQU0vYhqdore0/e3vSNmxKeeaShKlQFZIXkkY9bKqGT3wtit8i/MwYC2cStIpEhR471iLFUWPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Em/h8FxE; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Em/h8FxE"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-6e88e4c8500so227385b3a.2;
        Wed, 20 Mar 2024 12:19:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710962367; x=1711567167; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wtBgrCuQv/Ty6F3/cQmfzGOsSNGCIllNxgP/B6BFoUc=;
        b=Em/h8FxERaMe+PNSLOmvBXuY1JHFCPs3ORAnn+OkLQwBvOV+gxgowIbz3+ELWe+9Kn
         dyNfThlPf+xl/ELPBJCBy19GV6bVTxKvvA6kiOSgVwdGVQvEmaviCwIKntw79qayWRIQ
         Bf+zAu5G42XnFmtDTILvKNLPimHXIv4LYLf/Y/NV1FOdgED3po4bq5tnuB3qlaAeOEB5
         +wQxM3ehD8eZg7ctEzX2P4ZM45qcf4rjMxZLBE9ClQSx0WZdPIuFPG/8vhR5WO8A+kfv
         bj6K+zx3x6ZtmZnolEWUKZbkjgLdOmGzzzEr75un6gcsVeju8KUr+iEGbGz+ZcfQZ+EE
         R/Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710962367; x=1711567167;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wtBgrCuQv/Ty6F3/cQmfzGOsSNGCIllNxgP/B6BFoUc=;
        b=CrKGvl5UYqR3qMKMCUnpPvQnoPTcfOFWGVfmIYw/RDILem/OAJfDIG2EgN2e60L2Sl
         v5+mjWyZD59khSavnu4n/DTXoPBZgKkt2M2kC0EBWE0+XUExuoto87qo8cazXxneDdWp
         En+1O+gm+S7DUZNdAhuC3IzT/W06DS4N+g1e9GcW9MeXhhFnYiSfrf3yFeRkqHP+8Om3
         KLqrerTqB85cUkx84l2ksX+HVx9Z9mejwf/SiwQ2nIkXT8oJ4qtET041NZaRxlo/Cn8M
         WmUlUJTZsPzmNrdisUkELCu3F1TyTuwPo+qwpQL3U19fDHvpc72pskcfwYeGcGfz30l5
         SjNQ==
X-Forwarded-Encrypted: i=1; AJvYcCUx2l9tk+NXkVQ7kfg47l/oxaD+eURn+SkKki4a1N7lBX0a+XDC0cMR5NsjAN5pX1UwxY70PNE15f3NiV71hnbfgP+LXZ9yCM6PdRnqwA==
X-Gm-Message-State: AOJu0YwwDZ9hVbrvD5GM0esKErol2XIYylxTKEbSGVYmm3SrehePF7ui
	4rGqWoaqh2LvSO6WbBxpbQ++cszeKoYl95rUjUy19xAKnz6H1vyI1P+F6BUlLRc=
X-Google-Smtp-Source: AGHT+IE565uzCAYJTWR4ZSLFMmQDfp9qI6zF41cgTJrfxadF+tqY8xfSl6p/rjzV0MaQIdOxx5gK4A==
X-Received: by 2002:a05:6a20:c220:b0:1a3:6c63:8f9e with SMTP id bt32-20020a056a20c22000b001a36c638f9emr6084699pzb.27.1710962367018;
        Wed, 20 Mar 2024 12:19:27 -0700 (PDT)
Received: from ayush-HP-Pavilion-Gaming-Laptop-15-ec0xxx ([103.6.158.67])
        by smtp.gmail.com with ESMTPSA id ka6-20020a056a00938600b006e7324d32bbsm4325036pfb.122.2024.03.20.12.19.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Mar 2024 12:19:26 -0700 (PDT)
Date: Thu, 21 Mar 2024 00:49:23 +0530
From: Ayush Tiwari <ayushtiw0110@gmail.com>
To: Larry.Finger@lwfinger.net, florian.c.schilhabel@googlemail.com,
	gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Cc: outreachy@lists.linux.dev
Subject: [PATCH] staging: rtl8712: Fix line length exceeding 100 columns
Message-ID: <Zfs2u95QOKHAiR1B@ayush-HP-Pavilion-Gaming-Laptop-15-ec0xxx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Split the argument list of the kthread_run function call across two
lines to address the checkpatch warning "line length exceeds 100
columns".

Signed-off-by: Ayush Tiwari <ayushtiw0110@gmail.com>
---
 drivers/staging/rtl8712/os_intfs.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8712/os_intfs.c b/drivers/staging/rtl8712/os_intfs.c
index 7554613fe7e1..1b11f8b04e13 100644
--- a/drivers/staging/rtl8712/os_intfs.c
+++ b/drivers/staging/rtl8712/os_intfs.c
@@ -221,7 +221,8 @@ struct net_device *r8712_init_netdev(void)
 
 static u32 start_drv_threads(struct _adapter *padapter)
 {
-	padapter->cmd_thread = kthread_run(r8712_cmd_thread, padapter, "%s", padapter->pnetdev->name);
+	padapter->cmd_thread = kthread_run(r8712_cmd_thread, padapter, "%s",
+					   padapter->pnetdev->name);
 	if (IS_ERR(padapter->cmd_thread))
 		return _FAIL;
 	return _SUCCESS;
-- 
2.40.1

