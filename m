Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B31214A088
	for <linux-staging@lists.linux.dev>; Tue, 10 Sep 2024 05:56:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725947807; cv=none; b=ewav+S2Kuf8nLPXYRbN0WTww416cemZ5hsdypJN/QigIX0VrBaEuyRLBEDLXEpR9cP0V+tinnoefZxeGu4Xx1EtO211QjrSNttikty/A9LisilDpQkkoqqCyqI3T/drtW2sCC0FeQufhr5wBzyhvHhbPHzTik46hW4hrZ6nIIN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725947807; c=relaxed/simple;
	bh=rTcgziOzBrl44U9SH8mF8R76dsFQSPYmbjbU561m79w=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qb/W6T8S9C5/pPvvahd9IU6O/aDp1iGd+utK56NPIafVO2R+iuXc5ERR48APdNZ/0cRAKGRFwCKznpRvcNNqwshKmAiM8qKg/QsM59auGNGE6+3Ye0LaNdG/q6kg8SLfv2N3ukR7Zv6EhvcHa7MgVpEPMxy0jGzkkessFTalX6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XqC8ssCw; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XqC8ssCw"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5c3d20eed0bso418520a12.0
        for <linux-staging@lists.linux.dev>; Mon, 09 Sep 2024 22:56:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725947804; x=1726552604; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=orDkFr4WMNzRd7jwY0Xi5+QqYLxdevVKzsGNIMcO99E=;
        b=XqC8ssCw+/Qb/1FEANERmN8kyEX8q16dH49sOmkv54dohkf/zk71YoXdscQKxDT/Xm
         t3XO+0GBpxa/2lJpb8uXvIXTTc12IWfPKDkoleocq9PiVBddmpyCyd5zvLxG96ulNNBr
         tmgnnOEQL8MPs/oXRcXzADgAMeRLo36LjYg265JAiR/S8wsjc5oUbQnUtU3TcaCR3uMJ
         WuF/Xt4F068VqaRd5vf7dES9KS8jyDKBEv9tL/wDs3HtPPUfeeUAm1zJ/6WiMyXzj0xi
         INeLrqWg7kEe4n0EYT/M/h6dsRwDOrokOPLxwUFSr98iPfZ1JjIV8vqsL5qWIRu0Va/3
         AOnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725947804; x=1726552604;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=orDkFr4WMNzRd7jwY0Xi5+QqYLxdevVKzsGNIMcO99E=;
        b=tPUqt3I0vPgxwe/IuiMOhJP4NQLsKLurGBA1NulhDPJdJrda7LpCfB9vuKgzK8Hrl6
         VgspTPJ0plsRwon1qCKG2M7rSz+5X0nG++uTzakYRwn/JASU+oC8OkLjJjEQvgKf6c4J
         nIpWI6rVAZuJ810tGfFZSlVQDizdremvW0XO3N+Zxb/ejPpTDFZnr0b40B7TEKr2uIrv
         NQRQUeC0xi+C3VuEc0lafa415saiADW9baBzHKy3auZtdJYDqrvYM1HACN+EZUQVaegS
         HKxNc5MyELqxHf1ekEyV0GUWLWqVGLMyVB80NUa8j5nSNjfSDxNSePib8PhAZlz8FXdI
         lWWg==
X-Forwarded-Encrypted: i=1; AJvYcCX3uoWcjutyJ1pSyl9lXB9AbLGJBInvll62yQ4u6ZeNTXoEtT32wss6FqNCadVONTSyYGOLNHa6rgyuisSm@lists.linux.dev
X-Gm-Message-State: AOJu0YxYgQVs3jbiiDa12zlAPX8QFLYDDPgmOc4/tCKBzxQbD0Qz/ND5
	A6Kz611XOgIR/9ISKvwX9Q6FaLb65kMDjz6fjQbTftUM0t+U2T/Brr4YVzjz
X-Google-Smtp-Source: AGHT+IFedHmF+KlVMrCL6hfR+S34Ahn0E6eK6bozAAYGaeDaDRxhs8LsQkf/dWeUNbH7mHkqBlMDeQ==
X-Received: by 2002:a05:6402:51cb:b0:5a1:c43:82ca with SMTP id 4fb4d7f45d1cf-5c3dc7beaa7mr7526996a12.26.1725947803364;
        Mon, 09 Sep 2024 22:56:43 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p200300c78f2a8598b80c2d4e9a813f29.dip0.t-ipconnect.de. [2003:c7:8f2a:8598:b80c:2d4e:9a81:3f29])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c3ebd8cd43sm3848216a12.93.2024.09.09.22.56.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Sep 2024 22:56:43 -0700 (PDT)
Date: Tue, 10 Sep 2024 07:56:41 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 01/11] staging: rtl8723bs: Remove unused function
 RTW_DISABLE_FUNC
Message-ID: <46545805edb962ae97b15be60e0a3446aae42701.1725826273.git.philipp.g.hortmann@gmail.com>
References: <cover.1725826273.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1725826273.git.philipp.g.hortmann@gmail.com>

Remove unused function RTW_DISABLE_FUNC and its comment.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8723bs/include/drv_types.h | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/drv_types.h b/drivers/staging/rtl8723bs/include/drv_types.h
index 9e6ca1dec525..0b35c97843cc 100644
--- a/drivers/staging/rtl8723bs/include/drv_types.h
+++ b/drivers/staging/rtl8723bs/include/drv_types.h
@@ -452,14 +452,7 @@ struct adapter {
 #define DF_RX_BIT		BIT1
 #define DF_IO_BIT		BIT2
 
-/* define RTW_DISABLE_FUNC(padapter, func) (atomic_add(&adapter_to_dvobj(padapter)->disable_func, (func))) */
 /* define RTW_ENABLE_FUNC(padapter, func) (atomic_sub(&adapter_to_dvobj(padapter)->disable_func, (func))) */
-static inline void RTW_DISABLE_FUNC(struct adapter *padapter, int func_bit)
-{
-	int	df = atomic_read(&adapter_to_dvobj(padapter)->disable_func);
-	df |= func_bit;
-	atomic_set(&adapter_to_dvobj(padapter)->disable_func, df);
-}
 
 static inline void RTW_ENABLE_FUNC(struct adapter *padapter, int func_bit)
 {
-- 
2.46.0

