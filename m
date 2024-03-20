Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A59B785282;
	Wed, 20 Mar 2024 18:53:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710960837; cv=none; b=ARRi2gupr67G42MOHUhZEtK9yVtwe2HbgZbPjIyJYA6l1u6a+kuL/nPCOqrEx/kIwYw4SHq+oqVJHDVEaUw2jVVluU0RHaggxSS+Uy6mmENL3jipuiQ7iYUCp7+Mn1QJcmiw/D1Ef+WLTVETd3FGVEky0qYNtAl0//ZI5VIUGyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710960837; c=relaxed/simple;
	bh=kw71mCENFfkusz3NYvP2M2wcfPXvnkvuAeHbdxEATAo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PlYWO9cYeWs6YqMtelaCkfDimVdXhrDq6OFbwp0R92vqrdtXe//qRk+AYJK+pyUURkBPDZT+oBbfCRG8h947ZpzKaLvGyBcwgE+uchQdTWaP3UNXK2Ur1UH4Hn3MeTCQ/tCQ2RVoNNGYLu/ZlK+ipx4dDu4l1/RmWBxnNyEFqcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LLd2sxOL; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LLd2sxOL"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1dedb92e540so1748885ad.0;
        Wed, 20 Mar 2024 11:53:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710960834; x=1711565634; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hHo/UtzvItXgAnni/T063+9rKoFbdcxo9Fv9o/bsTdo=;
        b=LLd2sxOLewmXOgLNaE4e8cE3IeKQNYwwsEVPqGWVDNTEqV8znm16qds1qj6vO8nQX8
         keYEEvjWq1XuepM6q76TFtv+Sf1EwAMvbtxv+httBoH45aW0VGsQvHQ2ev3GpHWpMicw
         3KWB2vHUhc1uXnX80WIT2avOf1xGg9pV7/UhX2Lu4/XX3OdId9o/VmbU5gbYgGopevJ9
         V69G9Jx4Z+3wJGeruneCMLmpczGzTxC0FWCa4Pn1stP2gTz4q9oplapy6cURIZsYZ85r
         4ZeLJIqs2rG10aTgced8OPUFqkovKMBwp4otBwPuIeNiREziIv43VU78p9ITZczbI1xH
         KJmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710960834; x=1711565634;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hHo/UtzvItXgAnni/T063+9rKoFbdcxo9Fv9o/bsTdo=;
        b=O2g7UTnRAkVm6IlWD7OA5b+EVDOdEgyIkeTovZa3fpLMEg4AzzAwGimLBgqnN1JtlZ
         QFxNmX60bbRnKTBuInvxILK+iAyX3tucXuSwaW6kPyjcbH10Os/uF3rAuTgKkc57pm47
         i8aY7WZwyQ0EmiBcHkazd28/SSv2q6YYDVI7YY6p5NLQTHeEoB1YvXUGsgzFsn0FcEM0
         fv8c8bxVGDzv0gCtwUmPPWkxIiNPdxoUEBk9MSWgta8X5RloeRPgIxln/0vOzA0OfV5v
         xcT2bq08y3mrCksI8HiREhMlzvdCCx96DJ2Fp7CY/dMzPUZ1SBib/hAZWRGhNEVkU+3J
         arZw==
X-Forwarded-Encrypted: i=1; AJvYcCUpn/7086JTmReCu4TpaWTGyZIQkURxOUg0udqDD28MOS3rk/3k3j/qSoYgQ3gRR1+DJ7fQ8G+AWYB9KkbdoKZq1eWM5QL/tN6T4C+xgQ==
X-Gm-Message-State: AOJu0Yx5GbarguuP3MOWtBJ4ecztcju5aioDd5Ihm4YlXpqJqplv95mp
	CHidjcnOp3XqzLzqg44H4U1OOMRLSXXbmyWcRVAPJpu0jf7FpY5aT/PY55KMX2g=
X-Google-Smtp-Source: AGHT+IE58EF9+Se+w6BvmnOU4rIe52sGQR9jSmwBLL+Nawk6f/WI8phqZOSc0KVO39scQH2DD9odxA==
X-Received: by 2002:a17:902:a3c4:b0:1df:f859:91b6 with SMTP id q4-20020a170902a3c400b001dff85991b6mr511149plb.34.1710960834450;
        Wed, 20 Mar 2024 11:53:54 -0700 (PDT)
Received: from ayush-HP-Pavilion-Gaming-Laptop-15-ec0xxx ([103.6.158.67])
        by smtp.gmail.com with ESMTPSA id y17-20020a170903011100b001db5b39635dsm13901559plc.277.2024.03.20.11.53.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Mar 2024 11:53:54 -0700 (PDT)
Date: Thu, 21 Mar 2024 00:23:50 +0530
From: Ayush Tiwari <ayushtiw0110@gmail.com>
To: Larry.Finger@lwfinger.net, florian.c.schilhabel@googlemail.com,
	gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Cc: outreachy@lists.linux.dev
Subject: [PATCH] staging: rtl8712: Change type of local variable
Message-ID: <Zfnt4pIljgM21/BA@ayush-HP-Pavilion-Gaming-Laptop-15-ec0xxx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Change data type of local variable blnPending from u8 to bool since it
only assumes 0 or 1 values.

Signed-off-by: Ayush Tiwari <ayushtiw0110@gmail.com>
---
 drivers/staging/rtl8712/rtl8712_cmd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8712/rtl8712_cmd.c b/drivers/staging/rtl8712/rtl8712_cmd.c
index bb7db96ed821..32d9927981aa 100644
--- a/drivers/staging/rtl8712/rtl8712_cmd.c
+++ b/drivers/staging/rtl8712/rtl8712_cmd.c
@@ -284,7 +284,7 @@ int r8712_cmd_thread(void *context)
 		pcmd = cmd_hdl_filter(padapter, pcmd);
 		if (pcmd) { /* if pcmd != NULL, cmd will be handled by f/w */
 			struct dvobj_priv *pdvobj = &padapter->dvobjpriv;
-			u8 blnPending = 0;
+			bool blnPending = 0;
 			u16 cmdcode = pcmd->cmdcode;
 
 			pcmdpriv->cmd_issued_cnt++;
-- 
2.40.1

