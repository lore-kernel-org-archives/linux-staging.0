Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AD5C1DFDB8
	for <linux-staging@lists.linux.dev>; Thu,  5 Mar 2026 10:23:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772706205; cv=none; b=jYFL173MzVu3D/bdSYF1aEcekh9VXVJmA51v6QE27u3DLTFls85ssSn7UyjBsHNsyh+b5bCj5UlL5vxfCGAhuT0dovpJ+mYudfTuPt49i1d9lI8bGZ0ajV6wZEx7EA9fKVMNGi75FngwTogUFu00qOrefz76U77nA57egKa2GDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772706205; c=relaxed/simple;
	bh=slUdttrLOcjupkoFUqk2bS2+uVP79EEP4aReZx1wl3Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JBgtONUNgjY27LvOAlxa/yiYEFB9z7EHS5Dkucj0uONrZcZ9Yb20/SNzCW3kahaL7qiK8V42g3G6q8ZHRw0ZDrlT0AZBL8ae54p8/Vrc8bvZyO/yS2BB1G/hwd92ge1leugPWqSZLX1Lih9sy1MLkNsGy/u0v+eVZdFASdzWdyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F1AnYj75; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F1AnYj75"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b93695f7cdcso1009051766b.3
        for <linux-staging@lists.linux.dev>; Thu, 05 Mar 2026 02:23:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772706202; x=1773311002; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oLaZaj7aOQbLjV+5Ui2AVJBk5AespNBtkmyFOdZOMyY=;
        b=F1AnYj75r2LU+xPAmiVFWXJKh1ER3EvSBFIcXOUENx8KIlJ8WoYisIaO74aTByNHJv
         836mPScXRwWYkQ+POVlEHa9IXNsRNQ15wHLVezAqy5TOofb+EMtSve1251hPelAguEOP
         B3fLYNkcD19Fch/ptAWDD8fVw2MelM8Dk3WodXPfsALb/f5OxIf5QJu5giSaJl7t1S7n
         pZUZPbq0aLuVqPDyCqWtTibtpIVYv2zEkI/1YI6an/41pl4rA6W8b8OBv0K+VbB05R0n
         49hkDV0Ba1w9YFUzdteXa2zpnoEF4b6EAncqW/fbOi0KkMa75QONKDt7JF5DywY/tVqZ
         NyWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772706202; x=1773311002;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oLaZaj7aOQbLjV+5Ui2AVJBk5AespNBtkmyFOdZOMyY=;
        b=DQiUTXJzHv5Z6jko/CLHhoCk/H2g2OaIdyNpdK5ogjnC6FwjdmkmPxeIR07NYfHnoe
         4utth/e3xvGAzWcFfa7CfJlxrSeeB7rXGOu22YTZHdxdoww7ayj/eg17Gp+39i8kChKT
         rNjFirN/Ea2La45HMN3Yu+82T8ZgwHpDV/KEsK/WXPtYoMtHX3W82Z/k4OTYlPCFpdkt
         DU1NRJIlsTBT35c2LK2KimSj88KIWBWBhafQOY8ADWncuR2fGL6MSITKsQlACCpt1jOo
         sMcVYuCJuf5/ZNFmt3vH/FA611bEe3Tofzqkeng4JXAJ98ZwK4/Fu86uwjNdaKgBKox8
         r2Kg==
X-Forwarded-Encrypted: i=1; AJvYcCUJAYyb+I0xKlzQ3InPgjflfSlAIGW+LJmYUMrwB3vLSxZkOYJewe7RR2b4eCETjZA/M5XXtvkEKcaxEdDD@lists.linux.dev
X-Gm-Message-State: AOJu0YyT5vTr2mUQN0u1Om31NrSWq8GCNjaOFOF148B9EjrPbUorVQnf
	X0Mq/Ia5ovVPQ7kuXJ7ihdop6OfFFwwjy/j+qll1aK+/UhCMH221ozQx
X-Gm-Gg: ATEYQzzpMcp942Z4/x7SIkZ8oxVuXQny1T+hL+w4P6gT9gQMD9aie4sDv6Z5RkKpz5P
	p8Ewdw2J8Mqxpdzs7xd+zTwJf30maIyNgh/pum+Gge+KxcBVmC+aTdHdGZoWHpu74xPpkeILArc
	3b/0pY15qrGGHN1TXfIz+59wf2b1qbo7GnxxC/NCpICcGIo8h212+ZMoqzIIElOHjth2LKjCssQ
	cLSVzqDkY7CYnt1JzS1kPSTFSaFe7fku6+ZzmlY5YF5mBBUmg1f6yzOvv2na/1vrSL/YWyYAX3W
	M+flZG5UTj+hlJM6qyFmok76K/AcXiygdQ4RYNDgw+QTZ0lxcXGAAAYc5nihYOpQ1IqRHNgXmXQ
	VteC5wFer1UH4kKPym0kuFk/EjQ5bIk/XKRuXsqaimvKb6wy4P+kVHuPmDx4A2H8j0zl4UUJ+P6
	QSqNP5SDPN5uHqcyXOqH2XYClhzF7WL3JExpswIf63QX5QDt+pn/YiQMfA+6wb+pVw5ABTUnI+x
	AJesr006tOyy18AtEH8LvPwCdxe+LVq2qIynRfFW1aHZutonXifu6zwjcuYem4pGUMlO2RJ1cA/
	idc41ZCKrin6g9ms
X-Received: by 2002:a17:907:701:b0:b8e:a1a6:8196 with SMTP id a640c23a62f3a-b93f141212bmr334876066b.46.1772706202170;
        Thu, 05 Mar 2026 02:23:22 -0800 (PST)
Received: from DESKTOP-JNMGKT5.residents.sin.openfiber.nl ([88.202.160.248])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b935ab13d57sm889278266b.12.2026.03.05.02.23.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 02:23:21 -0800 (PST)
From: Alexandru Hossu <hossu.alexandru@gmail.com>
To: gregkh@linuxfoundation.org
Cc: dan.carpenter@linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	hossu.alexandru@gmail.com
Subject: [PATCH v6] staging: rtl8723bs: use kmemdup() in rtw_cfg80211_set_wpa_ie
Date: Thu,  5 Mar 2026 11:23:18 +0100
Message-ID: <20260305102318.43034-1-hossu.alexandru@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260304135914.38286-1-hossu.alexandru@gmail.com>
References: <20260304135914.38286-1-hossu.alexandru@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace open-coded kzalloc()+memcpy() with kmemdup() to simplify the code.

Signed-off-by: Alexandru Hossu <hossu.alexandru@gmail.com>
---
v6:
  - Rebase onto staging-next.
  - Limit changes to ioctl_cfg80211.c since sdio_ops.c is already fixed there.
  - Place version notes below the --- line (canonical patch format).

 drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
index 47cba32375d9..453ba1db773f 100644
--- a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
+++ b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
@@ -1430,14 +1430,12 @@ static int rtw_cfg80211_set_wpa_ie(struct adapter *padapter, u8 *pie, size_t iel
 		goto exit;
 	}
 
-	buf = kzalloc(ielen, GFP_KERNEL);
+	buf = kmemdup(pie, ielen, GFP_KERNEL);
 	if (!buf) {
 		ret =  -ENOMEM;
 		goto exit;
 	}
 
-	memcpy(buf, pie, ielen);
-
 	if (ielen < RSN_HEADER_LEN) {
 		ret  = -1;
 		goto exit;
-- 
2.43.0

