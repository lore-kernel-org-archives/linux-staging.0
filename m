Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD100225AF;
	Wed, 13 Mar 2024 08:52:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710319970; cv=none; b=sJqi00BHt5rq9aBCqVyKoSoo3mhjZ8zB1r/z3PVgMOpCSLteCK0rAll+vzb4UJeGIVa9bNpOZStUKwn+mCrzvFMdAkWLJ/GlBWbsO1KmSWFHAg3g3Ic/HM9J4tUYaS0cV2eV+XJt+rlzgTV5mndNH1zF3pe8D0Wf5RH92LlUzUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710319970; c=relaxed/simple;
	bh=oAAfuMysAgf/2POpxw/i0V2U97beoIz8zYh2XeHhPBY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Bdgc5kHQ7EAAsiwZf20mR0OaRT6aZiq+ItgqC1w8BvE7/BUZx8PEmpRzlBJqxscbewGrMs+RQoEQjrAiKGMKMV54BcyBjEuyWGyOmXw1g/5amkWnU2Nc1XQ7y63fSPMTaW+VDosrK3AfgVWC4f+v0WOhvzKJMegNLwZEhVwApdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FAzevBod; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FAzevBod"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-5d42e7ab8a9so4313199a12.3;
        Wed, 13 Mar 2024 01:52:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710319968; x=1710924768; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jx0AltY2QNKpaAAdAZ/gjTEC4Fp9z47uP1Pk84TlNLw=;
        b=FAzevBodd5GgewMyPpAnu7BfzGOVETe1ZhkHkv+D3oqVHkP/xJW/pJm5zVlXLXUx47
         1oXhmHrUiTHtDQpI5MBCxG8xqraAsDWl8MCERyHTf2OO2DGOqGCPDOMuS1cDUJefaZxM
         Tq4msrSnPDv/EVg8jNnWxzgXHDHnHlqN44bsciUdKqc5BptGLBAK+6mwMf3qGGj4JnwS
         9FrfZ6vxEAYAeCCTL0w84RoJkOQ62lx0kD+3ViMrtUHRgPQurzmFU1Ix2Pp48UuhORwJ
         AaDByoW3/II70A4CkVzTt8r4SWcTzYMdbygRxq+MpA5RWbK3PIq0oYQYhErFTk+SvcPA
         FT3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710319968; x=1710924768;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jx0AltY2QNKpaAAdAZ/gjTEC4Fp9z47uP1Pk84TlNLw=;
        b=kKAABDbZOmMzfrXvmiQ0FqJjYHXxbQUPV0tEn8TV1d1tcnREko4IbDWj4g6nGdDjDQ
         Bvk04kH8oiYHjm2TKDslwjB52Hfx4qfanb0YjdBZlNglNi6Bswo0/fNkmSRwMEaAQIGQ
         Zafo9mNFrduXbTiKdf7HvvsL5gOp2KH2oDrbjKALESGj2cmM0Bs+HZ8yhoInGTgPhVde
         25cjSAPLjLocRqwpRp/xET7NfQ7W2g6FvZz5eg5sxv1tfp3iopfyQi8U0+mltUMSUWSH
         HNnwjgHvNzCxH1W7HZZ80yIcJuBsL2EBkeGecpGdmqmyJzXtMZYvOU7lQ+0ODWnVdNik
         rnnw==
X-Forwarded-Encrypted: i=1; AJvYcCUEDyrxgGmBLOHNYaDgAf7ddTuj3uqxeqJgkUvGfzA3mrUpoT66w7Ef7UVB3wanyTWAx+jxD0byC7UU+5PE+aNzAjKx6HTCZD857ipfWA==
X-Gm-Message-State: AOJu0Yy7HjeAXnWl7+7S7oGJb5kkW7j6+skpBV/XjrU6cnY+KIpXTWBh
	XO7JoziPxdFzm3NG2yE1597MPlo+js0hpWQAe1i0YtwEEBZ+++KL2ZrMLGr7hhg=
X-Google-Smtp-Source: AGHT+IEwYs75iaQ7RhsHEIN/sybdvTkOf+Jn6DErYGQZv1YHreUyygA89jUbcVXZdegh3h1IxBxR5A==
X-Received: by 2002:a05:6a20:9591:b0:1a0:cd54:6d9f with SMTP id iu17-20020a056a20959100b001a0cd546d9fmr11557984pzb.23.1710319967775;
        Wed, 13 Mar 2024 01:52:47 -0700 (PDT)
Received: from ayush-HP-Pavilion-Gaming-Laptop-15-ec0xxx ([103.6.158.67])
        by smtp.gmail.com with ESMTPSA id im22-20020a170902bb1600b001ddd0eb63f4sm715917plb.105.2024.03.13.01.52.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Mar 2024 01:52:47 -0700 (PDT)
Date: Wed, 13 Mar 2024 14:22:43 +0530
From: Ayush Tiwari <ayushtiw0110@gmail.com>
To: Larry.Finger@lwfinger.net, florian.c.schilhabel@googlemail.com,
	gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Cc: outreachy@lists.linux.dev
Subject: [PATCH v5] staging: rtl8712: rename tmpVal to avg_val
Message-ID: <ZfFpW9XvHhUkcspq@ayush-HP-Pavilion-Gaming-Laptop-15-ec0xxx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Rename local variable tmpVal back to avg_val in function process_link_qual
to give intuitive meaning to variable and match the common kernel
coding style.

Signed-off-by: Ayush Tiwari <ayushtiw0110@gmail.com>
---

Changes in v5: changed variable name pct_val back to avg_val, as agreed by
Julia and Dan
Changes in v4: changed variable name avg_val to pct_val, as suggested by
Dan
Changes in v3: changed variable name tmpVal to avg_val
Changes in v2: added a period in message

 drivers/staging/rtl8712/rtl8712_recv.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8712/rtl8712_recv.c b/drivers/staging/rtl8712/rtl8712_recv.c
index 0b13d0a04304..1fabc5137a4c 100644
--- a/drivers/staging/rtl8712/rtl8712_recv.c
+++ b/drivers/staging/rtl8712/rtl8712_recv.c
@@ -861,7 +861,7 @@ static void query_rx_phy_status(struct _adapter *padapter,
 static void process_link_qual(struct _adapter *padapter,
 			      union recv_frame *prframe)
 {
-	u32	last_evm = 0, pct_val;
+	u32	last_evm = 0, avg_val;
 	struct rx_pkt_attrib *pattrib;
 	struct smooth_rssi_data *sqd = &padapter->recvpriv.signal_qual_data;
 
@@ -883,8 +883,8 @@ static void process_link_qual(struct _adapter *padapter,
 			sqd->index = 0;
 
 		/* <1> Showed on UI for user, in percentage. */
-		pct_val = sqd->total_val / sqd->total_num;
-		padapter->recvpriv.signal = (u8)pct_val;
+		avg_val = sqd->total_val / sqd->total_num;
+		padapter->recvpriv.signal = (u8)avg_val;
 	}
 }
 
-- 
2.40.1

