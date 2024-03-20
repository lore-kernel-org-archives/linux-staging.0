Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5CF685644;
	Wed, 20 Mar 2024 19:50:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710964254; cv=none; b=WD47ZpgER06SUnhdlNkJh6LEH0Q+9HJQeFDrT+P6TgGcpmDE7lZAmx3KgUyYM+BR61MUEFkd3RQrWixXAwB4khYDCj1QUNilyVWNA2jSpMgdfzzcYwtNJdT2ltzxQTbT5laYowfdLnZUSXToi8TRXSBS55cd6ewtW93AvNkBzls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710964254; c=relaxed/simple;
	bh=0/W7ESYmtis8SWzlUSewRHzPrYkRdMN/q4nnWZaZDFI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TJLNzUACYq4nJh45evNWVcQ+cFgpGTewIOLpm2ELT1dSdmmw3jbaJMZVvpflnT+eXQ/0yJJa4aiC5ebi6nm8oHsZaN96SPZ2uk/zYLahQk+hBWUwn5RTiMYBKoAWwllSBHj0/Ei9p/Dp7aYxewmkjN9VfFfn915nEz+KwfvaS3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TlmIqDBA; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TlmIqDBA"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1e0411c0a52so1771105ad.0;
        Wed, 20 Mar 2024 12:50:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710964252; x=1711569052; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vRikpztEX2fwVvw9gSRXNm3qTKd29WgjYs5PneXIbLc=;
        b=TlmIqDBAZXO+p6Ce/pqr13mQDNtjD5MtV1j2J+wzpt8GUCDSo1I94h5CMZGTDpEtRD
         eqbqU+SZMJ4xvc7dfmb7x6TOInm8/Co7Nq/3uPWVqteNxnSziLwU+8aPu35PdbLvhiqd
         7XRB8XymWth0J4uTuS2YSFztIDy+njcH/RKZGp+dJty3tN9BNUH4eHXBVKNMe/DJqx1P
         RXXJNcHlYBWdNr9rNtxx3oUZxmgfu4aOurEMA27r5pXoZgmH79KdSTf4a1mu3FiA5vhR
         9Ityr9K8r2bRI5kLxllU3Mun5+L7V1q6h5ykww0LhyXFqkOfuW2VgWJgYYUby/HOMvqu
         70dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710964252; x=1711569052;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vRikpztEX2fwVvw9gSRXNm3qTKd29WgjYs5PneXIbLc=;
        b=lGWqrXRUR/kd4V5MpxNGHt5SQ+3UBYhEPzK9ABeAzorRf8TeOcO4UoocqP+sPGSqGR
         baIZhnmrsAkYSl1M9Py7ZSblERDoChGBtJVI/UPRcZLXuorlmlrmd9srzYwcqAIFcKw8
         8P1HCBN4rX3dyLggHGWG/5WxohSFL4wGfooDNtQB3ImQ4cgGTv+vbdfhjAwtMMOSCr2E
         FUqzAKpDv9k/f5wBBvxTclH2iYG1pfagVK14fJp16nYij9mbnHIojYpVkItiVSVTRe5d
         +ZTzjfTOV87IU8fbqJQiL5hDAC2kJeXr55zC8iSdGiC70SusuI0it26FXGKEjSCSrIck
         XTOA==
X-Forwarded-Encrypted: i=1; AJvYcCUHD/LZBaw4SEjgcFhnPhraShDbmr7W/STqXPJtrfCDRuG3CJZQ+6ApB1KMN1fJuXGlGlaDnxRv/zsiJCLdM/+6eH9fYRWVWfMn8SNKgQ==
X-Gm-Message-State: AOJu0YzH4U0rCfGIV78W4wt1ivcCv5J5MzRjGugZ9TP/pYWwLQz3Iyua
	xwgaie45yhe5VC0zAhPWCOUPyBGvJWACSKCqQcFXHn4jBJ3r3ktaxC7kWZeldpY=
X-Google-Smtp-Source: AGHT+IHbRlTKqWtyyLF5oB3Uxpp1IauadFkrgFc+SRYJM579cvOlLYoldDBT893fqNGSxD1AdZGITA==
X-Received: by 2002:a17:902:d212:b0:1de:e473:55f6 with SMTP id t18-20020a170902d21200b001dee47355f6mr6219658ply.66.1710964251778;
        Wed, 20 Mar 2024 12:50:51 -0700 (PDT)
Received: from ayush-HP-Pavilion-Gaming-Laptop-15-ec0xxx ([103.6.158.67])
        by smtp.gmail.com with ESMTPSA id m9-20020a170902db0900b001defd1c0ca7sm7726001plx.229.2024.03.20.12.50.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Mar 2024 12:50:51 -0700 (PDT)
Date: Thu, 21 Mar 2024 01:20:48 +0530
From: Ayush Tiwari <ayushtiw0110@gmail.com>
To: Larry.Finger@lwfinger.net, florian.c.schilhabel@googlemail.com,
	gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Cc: outreachy@lists.linux.dev
Subject: [PATCH v2] staging: rtl8712: Change type and name of local variable
Message-ID: <Zfs+GKmt9hDZdWt/@ayush-HP-Pavilion-Gaming-Laptop-15-ec0xxx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Change data type of local variable blnPending from u8 to bool and
renamed it to len_padding since it only assumes 0 or 1 values and
seems to add a padding based on wr_sz. This change also address the
checkpatch warning "Avoid Camelcase".

Signed-off-by: Ayush Tiwari <ayushtiw0110@gmail.com>
---
Changes in v2: Changed values of blnPending from 0/1 to false/true
and renamed blnPending to len_padding

 drivers/staging/rtl8712/rtl8712_cmd.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/rtl8712/rtl8712_cmd.c b/drivers/staging/rtl8712/rtl8712_cmd.c
index bb7db96ed821..f499bbbf5bf5 100644
--- a/drivers/staging/rtl8712/rtl8712_cmd.c
+++ b/drivers/staging/rtl8712/rtl8712_cmd.c
@@ -284,7 +284,7 @@ int r8712_cmd_thread(void *context)
 		pcmd = cmd_hdl_filter(padapter, pcmd);
 		if (pcmd) { /* if pcmd != NULL, cmd will be handled by f/w */
 			struct dvobj_priv *pdvobj = &padapter->dvobjpriv;
-			u8 blnPending = 0;
+			bool len_padding = false;
 			u16 cmdcode = pcmd->cmdcode;
 
 			pcmdpriv->cmd_issued_cnt++;
@@ -294,12 +294,12 @@ int r8712_cmd_thread(void *context)
 						     0x0000ffff);
 			if (pdvobj->ishighspeed) {
 				if ((wr_sz % 512) == 0)
-					blnPending = 1;
+					len_padding = true;
 			} else {
 				if ((wr_sz % 64) == 0)
-					blnPending = 1;
+					len_padding = true;
 			}
-			if (blnPending) { /* 32 bytes for TX Desc - 8 offset */
+			if (len_padding) { /* 32 bytes for TX Desc - 8 offset */
 				pdesc->txdw0 |= cpu_to_le32(((TXDESC_SIZE +
 						OFFSET_SZ + 8) << OFFSET_SHT) &
 						0x00ff0000);
@@ -318,7 +318,7 @@ int r8712_cmd_thread(void *context)
 					       (pcmdpriv->cmd_seq << 24));
 			pcmdbuf += 2; /* 8 bytes alignment */
 			memcpy((u8 *)pcmdbuf, pcmd->parmbuf, pcmd->cmdsz);
-			if (blnPending)
+			if (len_padding)
 				wr_sz += 8;   /* Append 8 bytes */
 			r8712_write_mem(padapter, RTL8712_DMA_H2CCMD, wr_sz,
 					(u8 *)pdesc);
-- 
2.40.1

