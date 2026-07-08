Received: from m16.mail.126.com (m16.mail.126.com [220.197.31.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB3A041CB3C
	for <linux-staging@lists.linux.dev>; Wed,  8 Jul 2026 15:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783523398; cv=none; b=AzACPJTQXX/m/GYfOq1Jnk8AGdZTnPNYcaWfDq6jjlTvjgN4gqY1R9QtWPVJHpJvq4rik4pacloYZjVUg6voJq8A+KbX+x3aMQulxmMMNXtaYb4VPGlmGppR0xXMIBvUm8+3YoZcnjBk1A4aLm67keQV02dI4Pq9AcWoHtnATRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783523398; c=relaxed/simple;
	bh=TZUTfs8OviMyXwxmIucGXEYy0S6cLllZwaG8SeBIlGU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=BW8QqseZbLPOP1wEGV8yfdKIBh3t2QkZ40Nip2ffukRxvzy17lwznqUMrY1x8utL1rBeiyFPjRemq+hmofWvNF/Z4VRU1pOin5aXuTFxWFqDR+qGLPqKM3tJdkjEUDRkILMqmk+0xHT+R7Ifc6wh+KgnM/FOriIHT3awlAiDh60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com; spf=pass smtp.mailfrom=126.com; dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b=NGrm7EuS; arc=none smtp.client-ip=220.197.31.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=126.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b="NGrm7EuS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=ou
	RkMhprhjXtlq0zpiWIdJV4KdSgRDhk7pK+VZYag0U=; b=NGrm7EuSa4DxZvhouw
	x7Yd7z7HROdiBlSgvjde3B3CLSBUnP3rt67kpv+v4vubDtDvGUj5VzSBNkXOBxI/
	dEoRl51C7d+bEwvhOowJoC8XPkhsQ7FUsO6OGZALH9wCpnTJ0WtW6yk2IAkYByn0
	AoDinUOPEua9WF0R/AnXuQMNU=
Received: from jax-virtual-machine.localdomain (unknown [])
	by gzsmtp4 (Coremail) with SMTP id PykvCgDnz2MqaE5qmk9uCg--.53577S7;
	Wed, 08 Jul 2026 23:09:38 +0800 (CST)
From: Jinke Wu <coolbeaner@126.com>
To: gregkh@linuxfoundation.org
Cc: error27@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	coolbeaner@126.com
Subject: [PATCH v3 5/5] staging: rtl8723bs: simplify boolean comparison in send_beacon
Date: Wed,  8 Jul 2026 23:09:28 +0800
Message-Id: <20260708150928.74065-6-coolbeaner@126.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260708150928.74065-1-coolbeaner@126.com>
References: <20260708150928.74065-1-coolbeaner@126.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PykvCgDnz2MqaE5qmk9uCg--.53577S7
X-Coremail-Antispam: 1Uf129KBjvdXoWrKFyftFyxAr45Gw48CrW8Crg_yoWDGFc_C3
	97tws7Jr4rAF9FyF4DAF4rArWFga18Zw4vvF4DK3yfZ3y8uF93u3s7Xry7GFW7Wa13Kryq
	y34xtr4F9F18WjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xREF4iUUUUUU==
X-CM-SenderInfo: hfrrzuphdqv2a6rslhhfrp/xtbBqxNUW2pOaDN7HgAA3t

Simplify the boolean comparison in the do-while loop condition within
send_beacon() by using the logical NOT (!) operator instead of an explicit
comparison with false.

No functional change.

Signed-off-by: Jinke Wu <coolbeaner@126.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index ba84b933e25c..e02ab2e2480a 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -3690,7 +3690,7 @@ unsigned int send_beacon(struct adapter *padapter)
 			cond_resched();
 			rtw_hal_get_hwreg(padapter, HW_VAR_BCN_VALID, (u8 *)(&bxmitok));
 			poll++;
-		} while ((poll % 10) != 0 && false == bxmitok &&
+		} while ((poll % 10) != 0 && !bxmitok &&
 			 !padapter->bSurpriseRemoved &&
 			 !padapter->bDriverStopped);
 
-- 
2.34.1

