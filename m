Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DB291EB36;
	Sun, 17 Mar 2024 19:46:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710704811; cv=none; b=ULrhKCQRb5gGjhXZ5+k0T5lrdt6ohAjoxfhY8q7IeS1Veidb61a6lOLzlHa26HOZoBNGqkXd7poUwReAIAxuk2UEugF+NXZNlk/1xdh0ptpm+BepJ12oCsKqV2+21PjsxY2SXVDYmhzO2Q3yCSnaj0JE/ezrNmnPFZ90OUt3cmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710704811; c=relaxed/simple;
	bh=5VoeI8shccD62vvJl27csC1lbvCVSUXAMc14gVH40eA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lvKNhCqPnajnUBrk/7BaN4yR3XkXHUA/Xj/rRJKBaiyyqa8OJ1PHa7CiT+ERy+hATSqOCvXnFz7TxD5ndao3aeWMrBe0RwaPng25O2FrK+FAy/cPefmEBxP5qY6EJZIKIPsCFexhmy55bw4Yz80P7bcA+FInph5wrmDujphr0cA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SZGxwoJC; arc=none smtp.client-ip=209.85.160.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SZGxwoJC"
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-221e1910c3bso1942180fac.1;
        Sun, 17 Mar 2024 12:46:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710704808; x=1711309608; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Kz8BkbFXqKqMfjxMVaZWBsOHuYxmooNt9MF70X9aYrc=;
        b=SZGxwoJCVfk2KUpaA3nxbxcHGmq3lV/xnyON1A6iTl79AYXmYUnP0WNMNYGFvVDq/S
         XDW5q+wSOqFtAN1uaROjXywRlrzD8u5GXJSIGauWzS1XbtNz2fLbh5+tQW3WYMfDn1YO
         YWN4QE2DPGwDrrPGWkNLAC9KLww/TjPXuGsjKeYB9s9ZQCBnKvcBKWLFnMet7YCBPP2L
         YunfOjH4zLZtyB2ugiCxZE8TD+kWdUQrLA8W9h0ghsBXhZ7ba7Zs2u8Q8j66lXUWsJca
         rKHYy5ubBTEGvmYIMxAvTwzG27V1QgTj/+yp/42FKzazu9m86QvykclmO7BWcQ4J9LR6
         HFIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710704808; x=1711309608;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Kz8BkbFXqKqMfjxMVaZWBsOHuYxmooNt9MF70X9aYrc=;
        b=K9Z3kWGG4pm/KuIqb8EZI/PaJ48SSo/nfcLuNGXnBTBRTwFGfqfpW5scWnp4bnx+dI
         y3rXv+4TTI//OTITdHudDCxGFxD8CMNPYRZE6szoZ/6VYb+OEmPV4sWVGmDSjrfzpIv4
         dHFZIwPE6r6UsNHnJjw8vdnvxiB2PJw8h426P6j1s4LJS2yxoKcG64i5TpyIgyyx4yXy
         MDAO43mErgFhX35lZT91PqSC4L6oELjKh8idLpvUU407FzF9QzIcVnrRFFcbF9nqDV7p
         cd932SgMMG+ct9MJXAhqPdq88kf1KUH7EYQ/gN65SxlVnRFeptKODvz3jr21dfmvf7MS
         z9ow==
X-Forwarded-Encrypted: i=1; AJvYcCXWrFw0b4AZmjZIkR38Mvt1REJctho5ihb5OM00JvsLXvKNxHTzRB8DpwaFSRz60fTpGggdDk3vtK1j9cu4ihzojZwydconiQsp0wIESg==
X-Gm-Message-State: AOJu0YyYV7kW5qTHTYAEm4NtURehhBjKfxsdu5+CXxT+K2QxQfM3Zxvj
	1D+WCl8oSwGzkH3/KxDFkCz3r5WwN62VS+ILvIeCi0Cde2SaYvhHeQoLhCh+Z44=
X-Google-Smtp-Source: AGHT+IEXP+04l7fbZ/T1oWuQc6nrIlGvXyfydrEluqYX2fpdbi/mkaup7DOLjFJd/IkVmikqyNrtfw==
X-Received: by 2002:a05:6870:e415:b0:21e:a47f:ec31 with SMTP id n21-20020a056870e41500b0021ea47fec31mr11656682oag.43.1710704808430;
        Sun, 17 Mar 2024 12:46:48 -0700 (PDT)
Received: from ayush-HP-Pavilion-Gaming-Laptop-15-ec0xxx ([103.6.158.65])
        by smtp.gmail.com with ESMTPSA id o9-20020a056a00214900b006e4e616e520sm6517625pfk.72.2024.03.17.12.46.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Mar 2024 12:46:48 -0700 (PDT)
Date: Mon, 18 Mar 2024 01:16:45 +0530
From: Ayush Tiwari <ayushtiw0110@gmail.com>
To: Larry.Finger@lwfinger.net, florian.c.schilhabel@googlemail.com,
	gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Cc: outreachy@lists.linux.dev
Subject: [PATCH] staging: rtl8712: Fix line length exceeding 100 columns
Message-ID: <ZfdIpVyUTIEGTp7j@ayush-HP-Pavilion-Gaming-Laptop-15-ec0xxx>
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
index 7554613fe7e1..e77fcfc465ba 100644
--- a/drivers/staging/rtl8712/os_intfs.c
+++ b/drivers/staging/rtl8712/os_intfs.c
@@ -221,7 +221,8 @@ struct net_device *r8712_init_netdev(void)
 
 static u32 start_drv_threads(struct _adapter *padapter)
 {
-	padapter->cmd_thread = kthread_run(r8712_cmd_thread, padapter, "%s", padapter->pnetdev->name);
+	padapter->cmd_thread = kthread_run(r8712_cmd_thread, padapter, "%s",
+			padapter->pnetdev->name);
 	if (IS_ERR(padapter->cmd_thread))
 		return _FAIL;
 	return _SUCCESS;
-- 
2.40.1

