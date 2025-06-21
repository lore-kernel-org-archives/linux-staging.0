Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C4C515533F
	for <linux-staging@lists.linux.dev>; Sat, 21 Jun 2025 23:28:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750548504; cv=none; b=N2iBFAGVxie+BXDCwmqe2B+6iGGlLE1YYCE3ilQ4lTt4SgHXTUjB3/kS69Vl7Z4hGm6czRWpjcgrlZXKT4uaCW1WXr2BAE/DrsVA2Aa95YCNM1rzsRd+Cldj2p9HpHlo9Td80F5+e7elbE7cSK4tqklYWmXIRn2qiVe6TZCJct8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750548504; c=relaxed/simple;
	bh=1BMO7zCwVyq4cR5IMkJTR++wTf13wr3BBfUK/5fXB4I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AwPNwsA1ZnjbUIQDX7TVwdBQnYED/UAVNlrOlvLPPFm2Q2WrIEgMiVl9uwY84iu5NLzt+HE0PEe2nfAmeIZztFV9uHWRffRIq/NuX6FkN2n+yjDt7FuXd7vX2OD/rtvmUkPgU+f/uODG8mHTCDuMKYBZgPdlq8oScDqpjl1Qr0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jmecZtek; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jmecZtek"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-236377f00a1so26996655ad.3
        for <linux-staging@lists.linux.dev>; Sat, 21 Jun 2025 16:28:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750548502; x=1751153302; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=C2fYTarwPpK0jvqPcWLAS7PDSZaF6F/fUngXjtT3TiI=;
        b=jmecZtekIkrWeB46RnKBbmsE0Q1eRyYCmY3cww7VRsK9pICV/7DSNlqU2mp7kSgSWV
         WDtmmX31U2V8U6R+jHDe8opC+pV8BwGjrTo/mKOcPMWPxcB5LpI7G6djjLAJgIfO4ofk
         PUNoNqPYzDImoqWdxdJGJwIMu61tw7vYCU5zi46NssoR9xv8qRaEfarI+tpSR+BdaVF2
         r+Ook4lqqyvTdQF81hanUYJXz7aOt7GyhR1lf4xFhcey1JVXiqo9HKgG1l2QSAVqjCli
         W5QA+oH2w17gvC5j66i/aO+Z8bURS+wbolB/CHdStL6qnE6IfC8eiBAft5rZ+/GR1pzL
         Hu6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750548502; x=1751153302;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=C2fYTarwPpK0jvqPcWLAS7PDSZaF6F/fUngXjtT3TiI=;
        b=KvR1i8SnfPJhF4rUgF4iq6Lxbr6Mh2BL+PxMjjo0CKyinWlPURdrnCLWjNJ2HkpMzy
         wGxUmQ+M4o+OjN4aGVM4OA6XygxiKPquhlMM2W7H9jFYBi/1ODBe/+AFr0yH9NxqDuvc
         o30vFX+D5Piwbd2gUdlIY8OKeFENnq0Pesgst8dxy/PJcM2wpU/sv2vIZkDVrTKd+Zwy
         FDg/BkSaY2jjiV2KuYoZ2oTqYofOQWhZUi5az8eASl5986wxw0GU5TKstqugs9jkonwy
         ajU60n3U/t8Rg8Ha6ZrjsyhdAJqYNZr8deR9pJiTEHkVWyvDTxJiHXso/1cQJMz4+g+6
         7+TQ==
X-Gm-Message-State: AOJu0Yz9SzAVeVJlJpRcyyOb/jJtuEFsHbJBOOVNHkz9aPmu2I1zw8ho
	F1eBzJ+25cvI/8g9mzH1bRbIHSqLudUcAGt3LYaadOxCbfolQJMCfy7/
X-Gm-Gg: ASbGncuVPoGy5lPen4lT2jtCj9dOv1pe0d0oS45Y3Hsmk2wbdyJmsglSBo5EJPsjc4x
	q4EHqssRO6Dn0wl1nCX9AdC0ZAOmLipF8Nyc+Bl84k9kfQdX3sS1hCpWzv6N9Z6y9vRijgSMNyF
	BAP5EIJ15GDoe3WnWHaMAomSH2+jX/ip8XCM8GHFbRxTA6Bi/GrRePTtlon3itRVticmt4DmjXQ
	wiC7cp/WdlXhvDhchVgP25nbCx+HDaDOyNkF3BgQz2Ux9sgxVbVVyfCXDDg9dAyv/2dhtLb14df
	JIOesfAls4ouybE62iI/NI+c8zqrrLdvfuBOb84sNoiruQbjXHQYkIYegw==
X-Google-Smtp-Source: AGHT+IEl+eni07XId/7tV6K+MIphvOzSUsPaMLYZXBDhuP4KJzfFDhEYMuQ0NPaXMwlhpRtAOiXxCw==
X-Received: by 2002:a17:902:e5d0:b0:234:ba37:87b0 with SMTP id d9443c01a7336-237d9727096mr106392295ad.13.1750548501764;
        Sat, 21 Jun 2025 16:28:21 -0700 (PDT)
Received: from zinc ([182.216.63.93])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d8393741sm47867805ad.15.2025.06.21.16.28.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Jun 2025 16:28:21 -0700 (PDT)
Date: Sun, 22 Jun 2025 08:28:16 +0900
From: Kisub Choe <kisub.choe.0x1@gmail.com>
To: gregkh@linuxfoundation.org, philipp.g.hortmann@gmail.com,
	dan.carpenter@linaro.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	kisub.choe.0x1@gmail.com
Subject: [PATCH] staging: rtl8723bs: replace msleep(1)
Message-ID: <aFdAEM6GnCudvqMV@zinc>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

changed msleep to usleep_range to

Adhere to Linux kernel coding style.
Reported by checkpatch:

WARNING: msleep < 20ms can sleep for up to 20ms;
see function description of msleep().

Signed-off-by: Kisub Choe <kisub.choe.0x1@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_pwrctrl.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
index 6a2583d0d3eb..82e77cd8d80c 100644
--- a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
+++ b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
@@ -7,6 +7,7 @@
 #include <drv_types.h>
 #include <hal_data.h>
 #include <linux/jiffies.h>
+#include <linux/delay.h>
 
 void _ips_enter(struct adapter *padapter)
 {
@@ -424,7 +425,7 @@ s32 LPS_RF_ON_check(struct adapter *padapter, u32 delay_ms)
 			err = -1;
 			break;
 		}
-		msleep(1);
+		usleep_range(900, 1000);
 	}
 
 	return err;
@@ -581,7 +582,7 @@ void LPS_Leave_check(struct adapter *padapter)
 		if (jiffies_to_msecs(jiffies - start_time) > 100)
 			break;
 
-		msleep(1);
+		usleep_range(900, 1000);
 	}
 }
 
-- 
2.34.1

