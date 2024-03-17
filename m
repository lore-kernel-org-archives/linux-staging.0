Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10E111E527;
	Sun, 17 Mar 2024 19:24:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710703481; cv=none; b=NvHed3Q+ANOOaTPC/Iweq78T9s1ABAEBbUdm8rZ2NV9KctGOP7uuaWz8T6XtoFF2838TVxYvz36F+lQN+JgAhlNa1j8Jii8aikeWPujDTpx/a8C7tYWU+AD4uqv276aift6WGUMVd5YKqBwVurOyPmpDvpFZgxi7PeMf4pL8fjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710703481; c=relaxed/simple;
	bh=0S8Kcefi0OdWNyioGk8KbiiNHd0Dho2QB0qXQHrsxOY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=svIB0qxMJd253+lianY/kr+jIhBkS5WBxdev5L3xJqAKbQXB1a5UXNCZeRV8cm+40WljxGx5IluMGc7bb/hiGvTiBIhtMfgJMat+gzzwyFwUOy3smHSpSRACKT73oV1mwof2G0G4HZvNxueEF1FqNqoYVGLAZjFn4juJxfey96A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=axf1d56A; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="axf1d56A"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1e0025ef1efso5874505ad.1;
        Sun, 17 Mar 2024 12:24:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710703479; x=1711308279; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vqFDKNyxulpVNjfcv+wJMiiAQLx8qUgtgobnsfC1+N4=;
        b=axf1d56A0Axt1bNfTxHTZf7wAMpEOiuBWm4WOXVgfAuv4V8iURAZdOrL8c1Vvew9+n
         bXyC3rYKHdCCMT177a7sAMU+a5RGkUg8V6TOsgKNIxw00MnPNPvGxewfjmhY4sBIgl1t
         3JWtgCQ/EcqP6heM6i4mY4wk5XBGIXuBnbMWaB8vTJT6DvE//MbX4FE76RUk+AOQIe3I
         0mSIgmIyvqT+vjU389eRdaHBEmE+rDx49fCyJN6AspygYtf9IBRFJcvJPPT004lecMZC
         bE+cVuQs82W0vbe4mT22l2EhPndPTlpHr+IaGaHZDNWO6zeV2P8xafbWH0jtFeaFy3+F
         PljA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710703479; x=1711308279;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vqFDKNyxulpVNjfcv+wJMiiAQLx8qUgtgobnsfC1+N4=;
        b=H6lclTILQ3ChKEsQP8E6jFjFs66BaLijqf7isjYF8k3sPBQPv0ErzblCxLE4Eb2Ebo
         kmkq8zFrYAwY2Fs1AhX5nrX9X0oSvGM9P86O1g24XWFm4i2jmrI0YQUMIjZQ0UQrm5Tq
         UgAN6MAFqC5Xy9htyQSZx6H8sHmcg9RLr0yvdMedvoVaUpIXO49FNlItltSd+8xo87cH
         ktdqRngf3itYQpkPrECJGMkvLs+5YH8pTukhE2uBdr+6NVooiYEreZ1459d3mJp1p56S
         c5g/gMsf6F0LSdzdAD0vmjALMaiRytupwgjaW75jSco9illkXza7DVBH/dM0nbe4GJtx
         ptMA==
X-Forwarded-Encrypted: i=1; AJvYcCWXn+YKUOyppIRRpSk9fTgEVvNxkmNgfnkBGI4zWF2DgM6TJLtwrvf9ei00e3Pc4pg5ANCl42//I3GamuZljSBi4i4TXdgntxVyvKcXng==
X-Gm-Message-State: AOJu0YxlajeX2YCtsGOakjhcVNIrHm41ftJYTlqUXcJ727RDAxopD7nj
	S6Diu4ONAsPjl4gN6G38uqSE0cK65EHdwrOrUmxhCeYZbqlS43lfTRIpB2w12emcBA==
X-Google-Smtp-Source: AGHT+IFCNkW3wFNNzbROIQVGU7hZ5kOn6+RCDn/alz0lJ/YoQ4vr4ATF76Bca4Gf1X6ehftoDcZa1w==
X-Received: by 2002:a17:902:cf08:b0:1e0:115c:e03e with SMTP id i8-20020a170902cf0800b001e0115ce03emr2865698plg.12.1710703479082;
        Sun, 17 Mar 2024 12:24:39 -0700 (PDT)
Received: from ayush-HP-Pavilion-Gaming-Laptop-15-ec0xxx ([103.6.158.65])
        by smtp.gmail.com with ESMTPSA id i8-20020a170902c94800b001db6da30331sm7619149pla.86.2024.03.17.12.24.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Mar 2024 12:24:38 -0700 (PDT)
Date: Mon, 18 Mar 2024 00:54:36 +0530
From: Ayush Tiwari <ayushtiw0110@gmail.com>
To: Larry.Finger@lwfinger.net, florian.c.schilhabel@googlemail.com,
	gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Cc: outreachy@lists.linux.dev
Subject: [PATCH 0/3] Trivial code cleanup patches
Message-ID: <cover.1710703217.git.ayushtiw0110@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Address different kinds of checkpatch complains for the rtl8712 module
to ensure adherence to coding style guidelines.

Ayush Tiwari (3):
  staging: rtl8712: rename backupPMKIDList to backup_PMKID_list
  staging: rtl8712: rename backupPMKIDIndex to backup_PMKID_index
  staging: rtl8712: rename backupTKIPCountermeasure to
    backup_TKIP_countermeasure

 drivers/staging/rtl8712/mlme_linux.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

-- 
2.40.1

