Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B919559140;
	Mon, 18 Mar 2024 21:36:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710797812; cv=none; b=MxhIMGIy2O2zKtDBh9TwJWVP0wd3JDOjQgfdNa34YgFgZJRt+o+QjPRdg8YgOBU6bFY0MwaRUnxpN6VhneaLqKa39kyW1GtdxXB/2PldlBXeVMyfgWFspEGDd94tieZtk732CehGiH6idQT6CrthaPBKT3dXkAcxaPcHjDURlJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710797812; c=relaxed/simple;
	bh=2Ew0NAYVYC/WImUvrJ3PUN3YeN5BI3FzR7k3xT7PFuM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=g0XZJXaQJm/h3hpnMeYNEgPnY3ZV+TtsnG5XuGN2nY8H1fZCtOn+yv2GmPwURQTB7snUahqJj8kTJV3RAeLr+HfV+13kqSSA4xU3vakr6lmc0oCt33RDny00OZEL2xYLDiUNhyzaFz2y/E0SLaanhT57tJh0udDve47W41tNPxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kojyyS2V; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kojyyS2V"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1de0f92e649so31661455ad.0;
        Mon, 18 Mar 2024 14:36:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710797810; x=1711402610; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GwLO4qizopwzBhr0j80mQwVdTtL1XZUS6Bx2e5kiG2o=;
        b=kojyyS2VTG2wtbg9uKHBzqfVZSA5SAfsF+XizGMgJ330puSDixEQlvixOCpIPFyApK
         PIgi06bOkewCBjtynOuIi5hv5aEJhby/iDDfik2OC5ddFr+53yYaAWKc2gU33oeRxTK2
         ztrg3/GY3bHqofx3gzcgqUcOQqfZ2cuUKr4xjBM5Txn2QaH8Azizp9OiZGzcsVgVP92A
         SlQfIjKAafd/4RHZ5TxxHLYIH1Pgb6p9jyc4F0/74ZvEydooCXhUUIylZo01xPPgDGzd
         pV3U7S2XZjP4+Hu8WcTgYJioL9mysBN1/GnO8ASAoH2T+EGB9X9bt4t/j9TbgZulJ0h/
         NLkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710797810; x=1711402610;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GwLO4qizopwzBhr0j80mQwVdTtL1XZUS6Bx2e5kiG2o=;
        b=S+mi1dEJ29t3+W+/DdsmdxdkJ/xjSEUXEIvVDZzi7ommSiPE7/V3y69a13iHCihtmA
         IjR0egJWOQ8JlOj7bxoMC4EeUdg1tMb6pgEIahIXyD7sN+cbOalCRciE27BKugU/nhiI
         g5evencOCzaS/NZd2+iIP9AAvbzeCq5xqV8EifO1fhuwC7LuSkhZlteVF6uLPhpm9Lxt
         Dd86i4YECp5AoFzxWxsJDGE//4t6Bg2mQDY6LgrIs1Cb72rQbXhldQUsgd2R5Ue8mF0k
         Jr8OH8HFmVK0ypm/8NwiNKwRvAT/J7SVPq67l7Bip2fcbVqiRrBN25ChEyDJXYRPSlKT
         Dr7w==
X-Forwarded-Encrypted: i=1; AJvYcCUBGrfuvI1snCFXeb/EnrHp/HhTb787G//JMjsWVo0o0ETB65Xxvq5rgD5BOMDHRX6/lunfEGaUm2dpYv02ORSBQZBJMLMngu4o+Lu16w==
X-Gm-Message-State: AOJu0YyeafYOQgVq37AbQDerVSBS6aHE8KBe5xI8pvmnQGIuehn7NroH
	stYteBcr1drFgpf8R/ut+dwtI6keivMdALMHuyN2gi3qmlQWCQxGGdL67grrH40=
X-Google-Smtp-Source: AGHT+IE/n+Kc2DH+TUGIOq+VrqDXIIw8Nz/gveRC8adMwWFN4tZP7KgAxCKgJzSZtKJPZj0g5diT+g==
X-Received: by 2002:a17:902:7c87:b0:1de:eca6:483d with SMTP id y7-20020a1709027c8700b001deeca6483dmr11379452pll.27.1710797809630;
        Mon, 18 Mar 2024 14:36:49 -0700 (PDT)
Received: from ayush-HP-Pavilion-Gaming-Laptop-15-ec0xxx ([103.6.158.66])
        by smtp.gmail.com with ESMTPSA id v3-20020a170902d08300b001dcad9cbf8bsm9775117plv.239.2024.03.18.14.36.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Mar 2024 14:36:49 -0700 (PDT)
Date: Tue, 19 Mar 2024 03:06:45 +0530
From: Ayush Tiwari <ayushtiw0110@gmail.com>
To: Larry.Finger@lwfinger.net, florian.c.schilhabel@googlemail.com,
	gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Cc: outreachy@lists.linux.dev
Subject: [PATCH] staging: rtl8712: Rename blnPending to bln_pending
Message-ID: <Zfiz7YFKAqAOGsu5@ayush-HP-Pavilion-Gaming-Laptop-15-ec0xxx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Rename blnPending to bln_pending in r8712_cmd_thread() to address
checkpatch warning "Avoid Camelcase" and conform to the kernel coding
style.

Signed-off-by: Ayush Tiwari <ayushtiw0110@gmail.com>
---
 drivers/staging/rtl8712/rtl8712_cmd.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/rtl8712/rtl8712_cmd.c b/drivers/staging/rtl8712/rtl8712_cmd.c
index bb7db96ed821..7e5a25b1c154 100644
--- a/drivers/staging/rtl8712/rtl8712_cmd.c
+++ b/drivers/staging/rtl8712/rtl8712_cmd.c
@@ -284,7 +284,7 @@ int r8712_cmd_thread(void *context)
 		pcmd = cmd_hdl_filter(padapter, pcmd);
 		if (pcmd) { /* if pcmd != NULL, cmd will be handled by f/w */
 			struct dvobj_priv *pdvobj = &padapter->dvobjpriv;
-			u8 blnPending = 0;
+			u8 bln_pending = 0;
 			u16 cmdcode = pcmd->cmdcode;
 
 			pcmdpriv->cmd_issued_cnt++;
@@ -294,12 +294,12 @@ int r8712_cmd_thread(void *context)
 						     0x0000ffff);
 			if (pdvobj->ishighspeed) {
 				if ((wr_sz % 512) == 0)
-					blnPending = 1;
+					bln_pending = 1;
 			} else {
 				if ((wr_sz % 64) == 0)
-					blnPending = 1;
+					bln_pending = 1;
 			}
-			if (blnPending) { /* 32 bytes for TX Desc - 8 offset */
+			if (bln_pending) { /* 32 bytes for TX Desc - 8 offset */
 				pdesc->txdw0 |= cpu_to_le32(((TXDESC_SIZE +
 						OFFSET_SZ + 8) << OFFSET_SHT) &
 						0x00ff0000);
@@ -318,7 +318,7 @@ int r8712_cmd_thread(void *context)
 					       (pcmdpriv->cmd_seq << 24));
 			pcmdbuf += 2; /* 8 bytes alignment */
 			memcpy((u8 *)pcmdbuf, pcmd->parmbuf, pcmd->cmdsz);
-			if (blnPending)
+			if (bln_pending)
 				wr_sz += 8;   /* Append 8 bytes */
 			r8712_write_mem(padapter, RTL8712_DMA_H2CCMD, wr_sz,
 					(u8 *)pdesc);
-- 
2.40.1

