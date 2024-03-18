Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AAD255E62;
	Mon, 18 Mar 2024 19:56:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710791763; cv=none; b=cbMzGwi552lgr6uxiKg+8UjveFYm84Jv7Uk8YMV+B9/7VNcW4JXEJc2nyVuQCGnzGQVB1R7NJerm+Wo9SZBiy+t9R7T7YVEjBfDLIvOGyb2Vof6oHmRP00zaBtk0F6Y1sC7VkprKPMpjsVlldCPSg/1bPwbn4wARM7XPZrC8XKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710791763; c=relaxed/simple;
	bh=xH4J9BOVooc0F5rECk+PxtigvTft5gVlU+S7SOx5rwY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WJHXbqwC/jqmXzgkVx5eMiOKjHE/pADfr8aZNYBd2VhU6SvqdBwXDqffzTE0Q+GeYfLPsyfsfSMgpKPP3w7Z7dAmA53Y8Dccm/JjaBxSWfQa5oDwB+IJYnDoX/k3N9gmFuhhO626Tw343urJbgRFPYOujDxfw2XYfWISvh0J1ew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iCw0TPyO; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iCw0TPyO"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-29de4e12d12so3313851a91.3;
        Mon, 18 Mar 2024 12:56:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710791761; x=1711396561; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vyqSy28RTKkkd91Z04lpmQCt/lHnaiuG23pASkEtwFo=;
        b=iCw0TPyOyowsmnD1GBa+zUW82XeBWHbjP4/PMxCYeUn4wxxE9IqsaYVwWqLWZ9UFoo
         ajehfz3Y/85R/s5JCDxlKJplTlMcLDzAvOfSirHJneiSGughhtR/9Jl9AR9ftMQ8yEu6
         vnx2zgxlgr+Ivpwr26+nsFR/SwLP4ob2nN+M9PM+7DHdToFcOQc28FJvIOtxgVn3Hz6W
         geNqoX1xeM7OOlUYTwnjJH9kwzKRI9LW1Ahtg04v5op1IjhWdldUCNV5XtNcFHLjku+j
         w2d+zuZEd6c2h7MNFCadTNvwQADDjomup8EcydG2CK6mHj+b3xrRh4aR/qKc/JVRaBkp
         OPCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710791761; x=1711396561;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vyqSy28RTKkkd91Z04lpmQCt/lHnaiuG23pASkEtwFo=;
        b=YfSnbAmsGmpInL44peLSLDczvj78zQHmCSZywD+6wwUD147STDsMUrYCUgxDyLm3b6
         PSCx4TGHcPyiiI1VbDfwAOVA9+kK0Tj9wiFhth9L7cZJ2m++asLf3RyFzRbNfd1eiWOU
         VEdZPZRLgUH7RdLUpkp41pW091kU23i8Z9RrAkkgUmaj48QfJxpFrpm5/RA1iPejmi2H
         wVmL4n5kBw7nkDzH6mtTypHfrlHw8XWBux9jrc6cEmKenpxTYSfP5u2nH1qSZnzpL/Qv
         00JqWsZpCZemIAc4kEm1iLYAar8J4BIn1CuhCfmCec9fMAJEMkBxpfFt5Um/FxlctnoA
         tEcg==
X-Forwarded-Encrypted: i=1; AJvYcCXn0gM0swpPMIegQHnX7zMF8CICOf4S9zdA6YD8W98G4aum2ETQOEj+jZv/+dy/D66F/+guLHNmiliRG1d0fQ+rKaIUWuswGK2Q3x1cXw==
X-Gm-Message-State: AOJu0YzcKCjDOH4FJYWQ72Xo/DZp3bsrLDRJpQpLfKrUuqLW/jgKxKN0
	Ir5E4xLC9Vr0XfQPZDwinDpHT6ibbWs0YblIWZE3JUTaTjX+zxQ7Yvpp3CYYYrI=
X-Google-Smtp-Source: AGHT+IHs5jw/gZ1xolbHKkGmR9XR0pXwcVtAN09AM37fbqAnwgkiBrSjazhJm7UhUvqWwyzx5M2jVg==
X-Received: by 2002:a17:90b:1196:b0:29b:aa4e:3b74 with SMTP id gk22-20020a17090b119600b0029baa4e3b74mr8416054pjb.17.1710791761544;
        Mon, 18 Mar 2024 12:56:01 -0700 (PDT)
Received: from ayush-HP-Pavilion-Gaming-Laptop-15-ec0xxx ([103.6.158.68])
        by smtp.gmail.com with ESMTPSA id ie15-20020a17090b400f00b0029de90f4d44sm7482606pjb.9.2024.03.18.12.56.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Mar 2024 12:56:01 -0700 (PDT)
Date: Tue, 19 Mar 2024 01:25:58 +0530
From: Ayush Tiwari <ayushtiw0110@gmail.com>
To: Larry.Finger@lwfinger.net, florian.c.schilhabel@googlemail.com,
	gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Cc: outreachy@lists.linux.dev
Subject: [PATCH v2 1/3] staging: rtl8712: rename backupPMKIDList to
 backup_PMKID_list
Message-ID: <10336a70a7d1b87857664e9733a419791e0e2ada.1710703217.git.ayushtiw0110@gmail.com>
References: <cover.1710703217.git.ayushtiw0110@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1710703217.git.ayushtiw0110@gmail.com>
Message-ID: <20240318195558.mzy2o-a4VxOyWzlXol00Y8tcHjMJ1tboShsifeU9ZHc@z>

Rename backupPMKIDList to backup_PMKID_list and remove extra spaces
between RT_PMKID_LIST and backupPMKIDList to address checkpatch
warnings and match the common kernel coding style.

Signed-off-by: Ayush Tiwari <ayushtiw0110@gmail.com>

---
Changes in v2: Checked any possible reuse of backup_PMKID_list 
manually and rebuilt, rebooted the kernel and loaded the driver 
with modprobe. 
 
 drivers/staging/rtl8712/mlme_linux.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8712/mlme_linux.c b/drivers/staging/rtl8712/mlme_linux.c
index b9f5104f3bf7..a8cda81f4240 100644
--- a/drivers/staging/rtl8712/mlme_linux.c
+++ b/drivers/staging/rtl8712/mlme_linux.c
@@ -84,7 +84,7 @@ void r8712_os_indicate_connect(struct _adapter *adapter)
 	netif_carrier_on(adapter->pnetdev);
 }
 
-static struct RT_PMKID_LIST   backupPMKIDList[NUM_PMKID_CACHE];
+static struct RT_PMKID_LIST backup_PMKID_list[NUM_PMKID_CACHE];
 void r8712_os_indicate_disconnect(struct _adapter *adapter)
 {
 	u8 backupPMKIDIndex = 0;
-- 
2.40.1

