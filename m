Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00B5F208A3;
	Sun, 17 Mar 2024 19:27:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710703647; cv=none; b=dD1Ld/3+qKfB5kyJugqkSrg6NzejdFmEcihLjk+u/VZQBLiSOJAP8AIxZQdpLKd92sFPi/mV2JehUapLa1hZ3bNh9HueHVUxlfg+LsZJobshXTsmkaW+HzkmVp6DTteA3osEM0rZVVPEfs/Y0Al5fHfVI3Uh12yIu1LjQFiEdCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710703647; c=relaxed/simple;
	bh=xPWoQOs4TfwooFLDZo4ETTOlpvvvuG+yA+6t3NeCCH0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qb4cNLissEQ7eCbSzWviR1crtCD7wChENWSF7IW1jTGSIwzgJRTJlirisUBpJZGpAYq4Lp//gf5BOXL4Nb+a+z3BV94GrnKO9cK0QhoDJR52WqDBmqi801QcrZLOL/FrH7OqA4zFWSmUXIBWK1CFxzn523RMhjr9ZTIp2tAPcDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KYTpIF4G; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KYTpIF4G"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-29c71c6e20cso3095319a91.2;
        Sun, 17 Mar 2024 12:27:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710703645; x=1711308445; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zO2QsTVjpffWTan4vJBt4m5gR695Y2a63wY9pQvTlEg=;
        b=KYTpIF4G3owZ1srQUST3HTVQKcyUjpEOd6RCNfty4WmWvjWiMEzF8w+iCExkho67fa
         nLplZbGwHVStMQwGu/3NV3wi7Y7LMYFZczecVZ9d9X11Fqc5do9JwTM3kRiruuOx4DQt
         GRTs3CfTID1pf143ApqeDnWh4RdRRrnOyjQQ6vVfvAFKZgh5p2VH4hRps9S4rNVbthuq
         Zu7scBPc13DtL7LaKuBkaqtXZ0WJvpbPBENb/P9froe6rm/MeEuPgPMOjiT3KAqYLLFm
         RsKxgSXYOv8NEB8TWkTBKncBcNrCO96BKwIjDkVDv+hKJtSBzUbs4WfsLqVecljix5sY
         N1Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710703645; x=1711308445;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zO2QsTVjpffWTan4vJBt4m5gR695Y2a63wY9pQvTlEg=;
        b=wATHM0zB0tq9ElRiUNaf8Jfl87qN19bIML+QhTlKWksGewimvPxsXYwFg7r8ML9HxD
         nC0qSlJq/RIx0TvwZN15s96dzrna1PcOI31G5UcdoSidbCTWyGMjz4l5de8H1qQOwkIg
         VbXOYA+dmmxy3gB+zAXA8jwB9N8nE8DA0b6G5tByahAJ869EhY4/017f93xLuMsnlQ3q
         rbn4dEPNDycLfjFyyLuPtZS1grZ99PskjrygJUW570fJhiGRZnFOSRTavu0tk3Mlj60m
         DWE/SQ8CN7uz53LzTul+NupnSwXCSliLZwUXfkLQ6sl8P2vTGtM8w4mw8BTFZuuOZJfN
         avhg==
X-Forwarded-Encrypted: i=1; AJvYcCU6fNZPkEFJpLNLHL7LvcIwSJkq9yKY6HHnubF4IK6nm4eXOGOULTnxLMx3iVUj3ugC58mUIXEMJBDMVlH9pcr7aXT1uXyDzDwZoBigmA==
X-Gm-Message-State: AOJu0YyIDvC5LS96YFmywTum8LrhmFekyh5wG+odxx0HvFrconccCxGy
	5PpY28LH93EbmOTaqCjto+irWxjnONlabVbSrRWtrieunTNbBVhY7L+WksgkMV4=
X-Google-Smtp-Source: AGHT+IHHowoa/TnHLcot1PK4Nlzd5a5XlR0ctEt+JQFctj+YKf2JoqRVB7F7XsmQAmm+Ojyv7SqIGg==
X-Received: by 2002:a17:902:ea08:b0:1db:55cc:d226 with SMTP id s8-20020a170902ea0800b001db55ccd226mr8526738plg.66.1710703645010;
        Sun, 17 Mar 2024 12:27:25 -0700 (PDT)
Received: from ayush-HP-Pavilion-Gaming-Laptop-15-ec0xxx ([103.6.158.65])
        by smtp.gmail.com with ESMTPSA id i17-20020a170902c95100b001dd59b54f9fsm1928417pla.136.2024.03.17.12.27.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Mar 2024 12:27:24 -0700 (PDT)
Date: Mon, 18 Mar 2024 00:57:22 +0530
From: Ayush Tiwari <ayushtiw0110@gmail.com>
To: Larry.Finger@lwfinger.net, florian.c.schilhabel@googlemail.com,
	gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Cc: outreachy@lists.linux.dev
Subject: [PATCH 3/3] staging: rtl8712: rename backupTKIPCountermeasure to
 backup_TKIP_countermeasure
Message-ID: <21c20db8d4ffdf914a3d91daa7860d1edec9f9e7.1710703217.git.ayushtiw0110@gmail.com>
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

Rename variable backupTKIPCountermeasure to backup_TKIP_countermeasure
to address checkpatch warning 'Avoid Camelcase' and to ensure
adherence to coding style guidelines.

Signed-off-by: Ayush Tiwari <ayushtiw0110@gmail.com>
---
 drivers/staging/rtl8712/mlme_linux.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8712/mlme_linux.c b/drivers/staging/rtl8712/mlme_linux.c
index ac8196d24ce0..436816d14cdf 100644
--- a/drivers/staging/rtl8712/mlme_linux.c
+++ b/drivers/staging/rtl8712/mlme_linux.c
@@ -88,7 +88,7 @@ static struct RT_PMKID_LIST backup_PMKID_list[NUM_PMKID_CACHE];
 void r8712_os_indicate_disconnect(struct _adapter *adapter)
 {
 	u8 backup_PMKID_index = 0;
-	u8 backupTKIPCountermeasure = 0x00;
+	u8 backup_TKIP_countermeasure = 0x00;
 
 	r8712_indicate_wx_disassoc_event(adapter);
 	netif_carrier_off(adapter->pnetdev);
@@ -103,7 +103,7 @@ void r8712_os_indicate_disconnect(struct _adapter *adapter)
 		       &adapter->securitypriv.PMKIDList[0],
 		       sizeof(struct RT_PMKID_LIST) * NUM_PMKID_CACHE);
 		backup_PMKID_index = adapter->securitypriv.PMKIDIndex;
-		backupTKIPCountermeasure =
+		backup_TKIP_countermeasure =
 			adapter->securitypriv.btkip_countermeasure;
 		memset((unsigned char *)&adapter->securitypriv, 0,
 		       sizeof(struct security_priv));
@@ -117,7 +117,7 @@ void r8712_os_indicate_disconnect(struct _adapter *adapter)
 		       sizeof(struct RT_PMKID_LIST) * NUM_PMKID_CACHE);
 		adapter->securitypriv.PMKIDIndex = backup_PMKID_index;
 		adapter->securitypriv.btkip_countermeasure =
-					 backupTKIPCountermeasure;
+					 backup_TKIP_countermeasure;
 	} else { /*reset values in securitypriv*/
 		struct security_priv *sec_priv = &adapter->securitypriv;
 
-- 
2.40.1

