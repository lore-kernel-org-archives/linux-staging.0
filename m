Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C0E431715B
	for <linux-staging@lists.linux.dev>; Fri,  1 May 2026 17:41:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777657265; cv=none; b=YeaoxhsVEHUa0hvDu8uk/lOGq6UCYUyKjuqMrYOq7YRJqr4+qz7mr6dQawqQnqdBObD7cD1ymG4v5JuyXBdTFpiV9j1yOnnSbP5bSCkUMkwd9h/EZlmZ/UElGO4R9ni3rq4dBHbh3QVmCigqSnOloNFXp71z/qpLB3HOQXm+MyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777657265; c=relaxed/simple;
	bh=v6hAVHCok4bp13T/lYIMDMyYWpo/SZ/UiJFqS46PkQI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=lEr8tfnE3wRSWa76BEFrZW9hMjdTi2powQX0XkqEBRHGoDtlK4Dv06zCn9g8u3igyLvVG8a9jYbXOTFob40000nMBybzsz26yHLr2TpLB3qYEUmEgtvtXS6k9RIWVEhNADIFrk+rPeaBJ2eO50NKfgoPcM0KKuc1Z6AxWtR9xWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mgf9g2QI; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mgf9g2QI"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-48910865133so2722185e9.2
        for <linux-staging@lists.linux.dev>; Fri, 01 May 2026 10:41:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777657262; x=1778262062; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/DBibPqA8NU6EJTQL0CmNY7GuvR0Z/DBKzGwujwjT0A=;
        b=mgf9g2QIRmHQ1ieNdwCjfV16N33iCzMb4obmaYF9g+UrnoTIrGvJXczexOP8p8Zh0g
         GkdyfGCeCUFgkdcE737+3SYYpVvt4Z+SghJQBftgNjAcpiVnh/kIqEHiWQit6GFYvzil
         JOOX7gqyfPm6/dDDWNZV2Tbb7iPJYTm1FHU3+i8wNDO2kGSIuJD+0YMFossHPK6eF89t
         2vq1PYFcSPrb+yXBymIUTI3Ws1XsKHfvm9ovXwplNqnS7Y1J9gGK5PuycMfwMGd8xYg0
         whjQIBz99xygp9GNh4UCugbqBOxHTH5kUHtvxCwd0HPzAuYINz6IBBB7xr9k2Tn9713P
         6JPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777657262; x=1778262062;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/DBibPqA8NU6EJTQL0CmNY7GuvR0Z/DBKzGwujwjT0A=;
        b=INh0pnX0ScQfcXEnguKB4geTGwRosMEpXW2w8k8rfwATTzPjY1TXNmiaiHhZMHAZjy
         4f/CGlZMTGiOn1WuqQCNpcphIPXC11RbbqCaApXKW8kOyQnWs+VyddFe2prB4ZyS7IAL
         zgPmZ46ISsh6BaKlzujqEALYiUI29OE6geDxy3Nxt1W+x0DgYxoHpywYfFYbVzN2uMek
         eATL433SG4wjgHjYkXVK4eqaIj9TfODPcdq86uNu+uPycETqY2YuBklQG7eOt20nzqYz
         pf2TknhvSsEfP0ivoqcfexjnGYp2gXYASKcL0fNlOzJnZihM8sAzqYJUf7QxaJvyRTHB
         M2Ug==
X-Gm-Message-State: AOJu0YyCIStLyyGKIlhQ3AHY9SutDngid5wGRrj7Sf8dQ1AtWwC5jY8e
	G4VynGdYJRFJcrgUG0EAAg9n+D6547Z8aNUScMqP0LWiHJ7MczqRDr66
X-Gm-Gg: AeBDietrYmLvAlMsm/lK5BYbopPszJlM90VwKJ7wBN9dbnObI11WwCr7f3z+HWMRA3V
	tzecNOsU7YVZD/q+tChqMX2SWQnX612VFtd6B0RtUnlUKH4z6ljRWJsdhOhPtx7clBlHq7550T9
	XXTNUAPXd1bXlh/5g5llAdijwxFCxoqCBv3ARvWIE+erP6VkRp/Y5IkGCqOyMo52McNZHyn38b/
	hnrTm1W2GQvlTYO3rd4Zsr+TEtCCDgY0qWuqQWkyG6aWCV7hhC10/z5fBhEAR6g/7YNLvU1l6+C
	RLbIei+RiUg4NIH0FBFo1w0ZxxWbBvNUzqiE30CFMwq6EfpbYWuvSFAtdRJz0SSbGBkyMx2Amal
	rr+FVxMfr8AsOIVp7gFTqg9w55ULAmbC6qKFBwJCy5CDzgnyYOrTrl1cwfxbzOCPc0oTRoqTphO
	MzycRq1PQc2XE5jkmPsezuc4fDCuSjfdyellPqnbPokALycZSAGpGmNDw=
X-Received: by 2002:a05:600c:1991:b0:48a:5391:8424 with SMTP id 5b1f17b1804b1-48a9866a667mr736265e9.6.1777657261584;
        Fri, 01 May 2026 10:41:01 -0700 (PDT)
Received: from localhost.localdomain ([82.215.118.79])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a8fed8ea0sm28512645e9.5.2026.05.01.10.41.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 10:41:01 -0700 (PDT)
From: Stepan Ionichev <sozdayvek@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Stepan Ionichev <sozdayvek@gmail.com>
Subject: [PATCH] staging: rtl8723bs: remove unnecessary blank lines
Date: Fri,  1 May 2026 21:38:15 +0500
Message-Id: <20260501163815.759-1-sozdayvek@gmail.com>
X-Mailer: git-send-email 2.33.0.windows.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop blank lines flagged by checkpatch.pl in rtw_ioctl_set.c:

  CHECK: Blank lines aren't necessary before a close brace '}'
  CHECK: Please don't use multiple blank lines
  CHECK: Blank lines aren't necessary after an open brace '{'

No functional change.

Signed-off-by: Stepan Ionichev <sozdayvek@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_ioctl_set.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c b/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
index c70541f95..8edc62752 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
@@ -120,9 +120,7 @@ u8 rtw_do_join(struct adapter *padapter)
 					pmlmepriv->to_join = false;
 				}
 			}
-
 		}
-
 	}
 
 exit:
@@ -340,7 +338,6 @@ u8 rtw_set_802_11_infrastructure_mode(struct adapter *padapter,
 	return true;
 }
 
-
 u8 rtw_set_802_11_disassociate(struct adapter *padapter)
 {
 	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
@@ -417,7 +414,6 @@ u8 rtw_set_802_11_authentication_mode(struct adapter *padapter, enum ndis_802_11
 
 u8 rtw_set_802_11_add_wep(struct adapter *padapter, struct ndis_802_11_wep *wep)
 {
-
 	signed int		keyid, res;
 	struct security_priv *psecuritypriv = &(padapter->securitypriv);
 	u8 ret = _SUCCESS;
-- 
2.33.0.windows.2

