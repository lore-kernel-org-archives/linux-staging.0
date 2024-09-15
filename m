Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50EDD3612D
	for <linux-staging@lists.linux.dev>; Sun, 15 Sep 2024 06:41:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726382465; cv=none; b=fXfMtuir2pPi28iFhkf05NAeU3piS5COojxtdFjuz4VyJZnfn5XXjgw0zOa2UKZdbKrMezLnZ6H1YGUF6jPec5sXhQxPGsD8awF3WtpiVTtbCNdAWjNHyG+ryM82ET2R0wkHKn3pBf15PUW/Rwhxbpgfj3k8C0BZTpM32l00O9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726382465; c=relaxed/simple;
	bh=iIJHHvD6hIi5F9NhuzxcrKHikYBlB626qDKDva4Vs+M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NVKvt1vlNSTmgeQY7zbQ/Rydl+wx4FA72shmhsYGaehNfusqs31t5ALJozUEtj4KR8H8CZ3KlTxzMn2EG6IEwMnWRuIO89KpWZczLPBjiORgo3oEh7Hk2iGr3Zv129iM5UC7xsv3uqGVELY7o+OXZseh8BIgaNmfuBCCgsPW9jw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ULnIzp+t; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ULnIzp+t"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a90188ae58eso410219466b.1
        for <linux-staging@lists.linux.dev>; Sat, 14 Sep 2024 23:41:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726382461; x=1726987261; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jPmn81t7YtWekA4/H4IxuxrNCjYcPu5ddDUh0iFq82M=;
        b=ULnIzp+tWerVrcvveMvdcfcRjrFUygQWi+b1URBBv5yVFsEhRbflTKW99k0HCYEROq
         A9zwYJ1Sb/688SAq6xBycQQwjDm7pJxCmHjQteE1GFsPNBP8pZmuTE77rP+lnweMXaNh
         SpCczZ7Dm3S4VuLAEMGSPiMqbxTvvUfHC14e9zxq9QL/odxTidJUzMxmBSlULiCCPP62
         7aa+6Djp1H9Mkg1FHIgbuv+O5JQC2BteDul1F2JaFu89vyVsFmnufEIpasG5Z7gnSBtF
         lc6yhQUmXalATtJ8UAiwPyH4py1kHx6HudtIdxJO29MF/8ohAedX7tI0AbAgbd2+uXc4
         1FTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726382461; x=1726987261;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jPmn81t7YtWekA4/H4IxuxrNCjYcPu5ddDUh0iFq82M=;
        b=PFjG6TWegAwJ0mgPrlrA0M0U1lnMX7kgjiDeKDl3jbaCa+T2QZiOJ/tKhxDGIauueW
         NIm+i3URjaOH5cqwI0zM9JhFbdeRWZ43bUydlEmmJNsoX9wugwNiTqQQp5ce8C8mYsuu
         oWKh2PLSRx+KhQRvWJMaZzst4pkO/JpB7RLHhhZU632sBK4RFV0IWwjbgPX/0nGwOMf9
         ZWTsJChKpwMRElHqBHxaFMeNVT6+lVdN6hCSGfbhnnXhYpFjtquXwFkclJ8YNEOCSYqg
         wtzt8IFLvp+57xN3HfvgeLqKXfYfK2UUpheZBBaVPxpwlAmn6HZQH0ksPbqLcLa47z0M
         VOag==
X-Forwarded-Encrypted: i=1; AJvYcCUrPObRtrrt8wkH4KNAuOof9GE4frVTXmTz2BhVzZgtXZPTvPQsutU22h72yDHK/U0RM0vY8QG26a1ybTTp@lists.linux.dev
X-Gm-Message-State: AOJu0YziF3abreQXYj3sWZ8DmwhxrfmBsn+Jx/YaVH4AmhhPtN8BzeWK
	UcItze4XMr8bBaqdQAbIsxmI82n/nZtH77CUyHuwtWn7n8ndG4DR
X-Google-Smtp-Source: AGHT+IGIPMBHHwl+qqJdNNx5j3unKolOg43JEhn416q+U6DhqpT5ZNykHewg7J6H35cxRA7qiM8JxA==
X-Received: by 2002:a17:907:7ea1:b0:a86:ae95:eba3 with SMTP id a640c23a62f3a-a9029690d69mr1124959266b.62.1726382461511;
        Sat, 14 Sep 2024 23:41:01 -0700 (PDT)
Received: from kernel-710.speedport.ip (p57ba2f9b.dip0.t-ipconnect.de. [87.186.47.155])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a90610967bbsm160201066b.8.2024.09.14.23.41.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Sep 2024 23:41:01 -0700 (PDT)
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Philipp Hortmann <philipp.g.hortmann@gmail.com>
Subject: [PATCH 07/17] staging: rtl8723bs: Remove unused entries from struct hal_ops
Date: Sun, 15 Sep 2024 08:38:21 +0200
Message-ID: <d4c1f7b6765ec246c797f4d0ac4d429fe6826180.1726339782.git.philipp.g.hortmann@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1726339782.git.philipp.g.hortmann@gmail.com>
References: <cover.1726339782.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unused function pointers from struct hal_ops.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8723bs/include/hal_intf.h | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/hal_intf.h b/drivers/staging/rtl8723bs/include/hal_intf.h
index efdd1f912b5d..f559a5c1fd16 100644
--- a/drivers/staging/rtl8723bs/include/hal_intf.h
+++ b/drivers/staging/rtl8723bs/include/hal_intf.h
@@ -162,8 +162,6 @@ enum hal_intf_ps_func {
 typedef s32 (*c2h_id_filter)(u8 *c2h_evt);
 
 struct hal_ops {
-	u32 (*hal_power_on)(struct adapter *padapter);
-	void (*hal_power_off)(struct adapter *padapter);
 	u32 (*hal_init)(struct adapter *padapter);
 	u32 (*hal_deinit)(struct adapter *padapter);
 
@@ -171,7 +169,6 @@ struct hal_ops {
 
 	u32 (*inirp_init)(struct adapter *padapter);
 	u32 (*inirp_deinit)(struct adapter *padapter);
-	void (*irp_reset)(struct adapter *padapter);
 
 	s32	(*init_xmit_priv)(struct adapter *padapter);
 	void (*free_xmit_priv)(struct adapter *padapter);
@@ -192,8 +189,6 @@ struct hal_ops {
 	void (*enable_interrupt)(struct adapter *padapter);
 	void (*disable_interrupt)(struct adapter *padapter);
 	u8 (*check_ips_status)(struct adapter *padapter);
-	s32		(*interrupt_handler)(struct adapter *padapter);
-	void    (*clear_interrupt)(struct adapter *padapter);
 	void (*set_bwmode_handler)(struct adapter *padapter, enum channel_width Bandwidth, u8 Offset);
 	void (*set_channel_handler)(struct adapter *padapter, u8 channel);
 	void (*set_chnl_bw_handler)(struct adapter *padapter, u8 channel, enum channel_width Bandwidth, u8 Offset40, u8 Offset80);
@@ -224,8 +219,6 @@ struct hal_ops {
 	void (*run_thread)(struct adapter *padapter);
 	void (*cancel_thread)(struct adapter *padapter);
 
-	u8 (*interface_ps_func)(struct adapter *padapter, enum hal_intf_ps_func efunc_id, u8 *val);
-
 	s32	(*hal_xmit)(struct adapter *padapter, struct xmit_frame *pxmitframe);
 	/*
 	 * mgnt_xmit should be implemented to run in interrupt context
-- 
2.43.0

