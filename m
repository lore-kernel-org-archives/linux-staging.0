Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C801F519
	for <linux-staging@lists.linux.dev>; Sun,  7 Jul 2024 06:54:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720335293; cv=none; b=tUz7fzKwR0LQqiiXyJGMFpxYkqmGQGP40BelRIlD2odvRwGxTDs7Ef53uNtvTANA3CyGE3qgEaOtPygOBouJDJSAgloZ2SLXa/2kHXj/MS2BJWewsbkCBYuD/91Rmf0nvAqz6+fPTbQPS3vXUAtqjMiPah0o99rr/e7DAeYpSdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720335293; c=relaxed/simple;
	bh=A1cc6R4ADsw7Wfs8/3cko5o9FF7u3hr5aar0YIWXslA=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ihf8rHMuq6LfAqdACNKBZMPUns7sgcIz9cGAMtFn6iCK0N41tXpYpHi/n50C7pdD6zSaEprqOy/0X1KYl5dD6YRgeVGXdbvncePBN4At2jr4QbbAQzVKFyrp02rSPI2lUIZsBrOPtWkdnLPH4U4GX8uz8NO+p3BUnmxae72JSHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kBQLmoE2; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kBQLmoE2"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-42662f7c034so381135e9.0
        for <linux-staging@lists.linux.dev>; Sat, 06 Jul 2024 23:54:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720335291; x=1720940091; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=neca6wdATA/qL53v1wSvPrAx8UxyZGmOCNXgkW2DPX8=;
        b=kBQLmoE2PDxO126Tkuzt1CV/0TjIfyncB979rpuM8SFayAE46Ck6z0n6q4uW+gQlZv
         ewi18FYWlT9+vdasnwsFVnNMq5ufpoA+v8QsjzedTY9EYfC1PPzsS1ANQK1nPXcYzfcX
         JDbI80NFrvHU4oxHg3QijuDQsA5r8BIOgGM63rbiDLL+EeCNW3wgZiPg8ypoqRktvkgc
         42z5il/Dz6hDx1UDqWViMQ5ac1VSS55xVvE8Leq3Wn88QExtcI1DE8HQtNIDuaIB8MJ4
         VKN7ajnDIqhLuTg5WaO8/+oWIeqy55Qbun9EC0VymW/65R7uidKodJm9+gneKyxa4s3c
         SfyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720335291; x=1720940091;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=neca6wdATA/qL53v1wSvPrAx8UxyZGmOCNXgkW2DPX8=;
        b=thvJkWs06eaDjGndMOfeKOBuNPp7nACsL12iwL7LYhYMPAmTOKY5rZ815R9QtjP0zp
         I3LQF866CnTnrkPuKjLbcHEGWfpJ1WE+LAjzrIlimBdNgiYx4ck/kBlM4Q9kf8KQdPTT
         pQ9MN0aKQLUvvhtKpaGA0Nl5Tn7KJY/zTsuV496RTZr2QmSRGH//xXg7fG4IAXZwNzSb
         CaGmHPYkwZNthKSqe/wBZMB2+Bc3KyVJSE8MQN/mTC8z0fwsfa54izKsWTJ6fb2Y/Ush
         RHZFxnWG1EO6OGpCxgESdfc8fequRFu3ybM5bJER7pWFT3/C10vS1Jb38Gjy8q8P8X92
         mcCg==
X-Forwarded-Encrypted: i=1; AJvYcCU+FO1JF2EbaENdIYMZM/O/o4AkqjXhPHhDVMOAJIOHEpPtZLkTEFlUbMxwq547CwA6cy5oTCOxGQm0F64twyOSLzRUE8iZoojoDeQmWg==
X-Gm-Message-State: AOJu0Yyb1JjpWQwBNRXp1NBZqP+6W7Jppf4qif2LEhuH1t9J+ltQFIcb
	hWf1DiK1xmvj3ktCCSrSLWNFITdc4zo3U9J3okPfNWIs50f2iSvM
X-Google-Smtp-Source: AGHT+IH9Eb/Qu91B8CjT4rzxtXg/HmkHAxzNby7iusjNQENI/NuK+KG1HSlyYpzjEpFx/SPoGqd+Rg==
X-Received: by 2002:a5d:5988:0:b0:367:9505:73e2 with SMTP id ffacd0b85a97d-3679dd62d9emr6402606f8f.4.1720335290716;
        Sat, 06 Jul 2024 23:54:50 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p57ba2f9b.dip0.t-ipconnect.de. [87.186.47.155])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36797718618sm9333795f8f.31.2024.07.06.23.54.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jul 2024 23:54:50 -0700 (PDT)
Date: Sun, 7 Jul 2024 08:54:48 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 12/13] staging: rtl8723bs: Remove unused macros in
 hal_pwr_seq.h
Message-ID: <7e8117fe3d3f82d69897675c36dc9ee229b9f2ad.1720245061.git.philipp.g.hortmann@gmail.com>
References: <cover.1720245061.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1720245061.git.philipp.g.hortmann@gmail.com>

Remove unused macros.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8723bs/include/hal_pwr_seq.h | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/hal_pwr_seq.h b/drivers/staging/rtl8723bs/include/hal_pwr_seq.h
index 0a2e60770668..5e43cc89f535 100644
--- a/drivers/staging/rtl8723bs/include/hal_pwr_seq.h
+++ b/drivers/staging/rtl8723bs/include/hal_pwr_seq.h
@@ -28,9 +28,7 @@
 #define	RTL8723B_TRANS_CARDEMU_TO_ACT_STEPS	26
 #define	RTL8723B_TRANS_ACT_TO_CARDEMU_STEPS	15
 #define	RTL8723B_TRANS_CARDEMU_TO_SUS_STEPS	15
-#define	RTL8723B_TRANS_SUS_TO_CARDEMU_STEPS	15
 #define	RTL8723B_TRANS_CARDEMU_TO_PDN_STEPS	15
-#define	RTL8723B_TRANS_PDN_TO_CARDEMU_STEPS	15
 #define	RTL8723B_TRANS_ACT_TO_LPS_STEPS		15
 #define	RTL8723B_TRANS_LPS_TO_ACT_STEPS		15
 #define	RTL8723B_TRANS_ACT_TO_SWLPS_STEPS		22
@@ -128,11 +126,6 @@
 	{0x0006, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_ALL_MSK, PWR_BASEADDR_MAC, PWR_CMD_WRITE, BIT0, 0},/* 0x04[16] = 0*/\
 	{0x0005, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_ALL_MSK, PWR_BASEADDR_MAC, PWR_CMD_WRITE, BIT7, BIT7},/* 0x04[15] = 1*/
 
-#define RTL8723B_TRANS_PDN_TO_CARDEMU												\
-	/* format */																\
-	/* { offset, cut_msk, fab_msk|interface_msk, base|cmd, msk, value }, comments here*/								\
-	{0x0005, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_ALL_MSK, PWR_BASEADDR_MAC, PWR_CMD_WRITE, BIT7, 0},/* 0x04[15] = 0*/
-
 #define RTL8723B_TRANS_ACT_TO_LPS														\
 	/* format */																\
 	/* { offset, cut_msk, fab_msk|interface_msk, base|cmd, msk, value }, comments here*/								\
-- 
2.45.2

