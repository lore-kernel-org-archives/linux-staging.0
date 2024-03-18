Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A23738DD3;
	Mon, 18 Mar 2024 18:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710787900; cv=none; b=q2zpX6OWaf4ahuYk3kEEJc0liu/zSCTV7mYOETRg2jrtovvHi/InmlqpeALkSdlH6DXd61eGp3D0d+pQDGhWOgwwg50PBzSDKl9ak/pu/8qJNLq5g+9IS+GAlMXh8evk/6RzTR4gJyAZkDmFFzw0ss3VP7eu4NPEduqrlZcxCqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710787900; c=relaxed/simple;
	bh=ahQLJbLApCM8ufyy92oRhxd+4qzy4sps8/Rvg6hzEmo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FyZJPQYIRV+I2rcVWpHR7jK2R3JxbgAI/BTTsAJaCQXTBONwHOGJrYjD2jTXFulgiUM7MEhcPreTc6BIWl8QS3+9Nu1fPMgphWrzDcjpTRadeGffOFJTZA7JaMvnrZK/FthhTgD80om6/EBhSA977/MWRWwpI0Dh3Osd/Lz/km4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k8nOqFfD; arc=none smtp.client-ip=209.85.210.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k8nOqFfD"
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-6e69a77f41dso360261a34.3;
        Mon, 18 Mar 2024 11:51:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710787898; x=1711392698; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=W4S6X4A8DTBN48FZBm9DivzJsFjgIU/rIF1zK+bYOx4=;
        b=k8nOqFfD/dXgnhq0VGVPNJltXdOJfuto9ebrxPUyJl49JmrTqirBICL8I1C2VKpPa0
         wdztvVK5n+X7oPGfYAC52e3QSVYjdHyLVY45SUUjjCXOjDhFM/7RfN16msONmtDj7EMO
         g0Jn9RmMydc7lVx+pJNk7s+SR56OJK5W87sIKbwk2Lf7Gzzbv5T1dTp3Ov6vWLmRD4bS
         7q7Is22UbNviXZ1Pm1crJGRorP49QJqzOrdF8PG3WA5c4fgTqaKzX4egWpd0PWFNtVnx
         bAyciyuo7N0lc2tN+VPaT2Taeru4CNS/V9Y/iD0rG8XsLI62AgHmv4LscV8cjN3D6F2S
         gIow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710787898; x=1711392698;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=W4S6X4A8DTBN48FZBm9DivzJsFjgIU/rIF1zK+bYOx4=;
        b=nZKr9v6poQ4BnGlrAWw0A0sOO4WIULLW173Ge6iRy9pYYiBuYdVbXEfKBoun37OAoz
         nx96Bx7pRKJ/Al7lmjO55DN7XgTMmSkC73nRE65MgUnfpdrXajIGK2cD8asAvSQh+YF1
         F9k6frZPgDpfpDpjGjEHjckKq0vbhODqa6l5nJwTD8DKHqqWKfS5xDXEvAZB3WLAQOJc
         4kzlscua0sJi9lNg36oYeHrmZHUdD/9YIpzdDP4iMXRzIg13iEnaCHacYy5fgoBubRJ5
         ejwqTdD8N0wgoii03dbPDqLuWMeKjIrUUwQ+op2lLQrY2aSizR7LHYG3aEM7gaZe8Fbj
         3KDw==
X-Forwarded-Encrypted: i=1; AJvYcCV3wnDGsKlHcBJj34b6crm6HUEBzIvNPfHuJ+uePQaQmFEcBvrgxllAK8DYYTeC2vJfH4ObXHTRd1j3/bZc2qoeXi2hd60MskBqIicLQw==
X-Gm-Message-State: AOJu0Yyc05afv4ggwj3xzVi76Hd1Ep6TG91XeYUSIW7/tVB+esrYrWUh
	oXc102l4GiId3lghxpBUrYNFGs5tvxIb3NLZn1lYdaGOD8hOZAhdbRB918iAKAE=
X-Google-Smtp-Source: AGHT+IG5BmiYocILJJdGnJUPa1f9DZp9BfwZ3Xo/xOjn4ptsOpFPYVi2UNsPewbbhuLYOwUscKDOAQ==
X-Received: by 2002:a05:6870:4629:b0:221:a97c:eb64 with SMTP id z41-20020a056870462900b00221a97ceb64mr644274oao.13.1710787897919;
        Mon, 18 Mar 2024 11:51:37 -0700 (PDT)
Received: from ayush-HP-Pavilion-Gaming-Laptop-15-ec0xxx ([103.6.158.68])
        by smtp.gmail.com with ESMTPSA id v22-20020a634816000000b005dc26144d96sm7525201pga.75.2024.03.18.11.51.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Mar 2024 11:51:37 -0700 (PDT)
Date: Tue, 19 Mar 2024 00:21:34 +0530
From: Ayush Tiwari <ayushtiw0110@gmail.com>
To: Larry.Finger@lwfinger.net, florian.c.schilhabel@googlemail.com,
	gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Cc: outreachy@lists.linux.dev
Subject: [PATCH v2] staging: rtl8712: Fix line length exceeding 100 columns
Message-ID: <ZfiNNvks6v0JGhRA@ayush-HP-Pavilion-Gaming-Laptop-15-ec0xxx>
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
change in v2: Fixed the alignment to address checkpatch.pl warning
---
 drivers/staging/rtl8712/os_intfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8712/os_intfs.c b/drivers/staging/rtl8712/os_intfs.c
index e77fcfc465ba..1b11f8b04e13 100644
--- a/drivers/staging/rtl8712/os_intfs.c
+++ b/drivers/staging/rtl8712/os_intfs.c
@@ -222,7 +222,7 @@ struct net_device *r8712_init_netdev(void)
 static u32 start_drv_threads(struct _adapter *padapter)
 {
 	padapter->cmd_thread = kthread_run(r8712_cmd_thread, padapter, "%s",
-			padapter->pnetdev->name);
+					   padapter->pnetdev->name);
 	if (IS_ERR(padapter->cmd_thread))
 		return _FAIL;
 	return _SUCCESS;
-- 
2.40.1

